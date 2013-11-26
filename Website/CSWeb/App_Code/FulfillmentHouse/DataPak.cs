using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Xml;
using CSBusiness.OrderManagement;
using System.Collections;
using CSBusiness;
using CSCore.Utils;
using CSCore.DataHelper;
using CSBusiness.Resolver;
using CSBusiness.FulfillmentHouse;
using System.Xml.Linq;
using CSBusiness.Attributes;
using CSPaymentProvider;
using CSBusiness.Preference;
using CSData;

namespace CSWeb.FulfillmentHouse
{
    public class DataPak
    {
        public enum ShippingMethodEnum
        {
            Ground = 1,
            NextDay = 2,
            SecondDay = 3,
            USPSPriority = 4
        }

        XmlNode config = null;
        public DataPak()
        {
            config = GetConfig();
        }
        public string GetRequest(int orderId, bool CheckOrder, bool RejectedOrder)
        {
            String strXml = String.Empty;
            using (StringWriter str = new StringWriter())
            {

                using (XmlTextWriter xml = new XmlTextWriter(str))
                {
                    Order orderItem = new OrderManager().GetBatchProcessOrders(orderId);

                    if (!orderItem.AttributeValuesLoaded)
                        orderItem.LoadAttributeValues();

                    //root node
                    xml.WriteStartDocument();
                    xml.WriteWhitespace("\n");
                    //DatapakServices section
                    xml.WriteStartElement("DatapakServices");
                    xml.WriteAttributeString("method", "submit_order");
                    xml.WriteWhitespace("\n");
                    //Source section
                    xml.WriteStartElement("Source");
                    xml.WriteWhitespace("\n");
                    xml.WriteStartElement("ID");
                    xml.WriteValue(config.Attributes["ID"].Value);
                    xml.WriteEndElement();
                    xml.WriteWhitespace("\n");
                    xml.WriteStartElement("Username");
                    xml.WriteValue(config.Attributes["login"].Value);
                    xml.WriteEndElement();
                    xml.WriteWhitespace("\n");
                    xml.WriteStartElement("Password");
                    xml.WriteValue(config.Attributes["password"].Value);
                    xml.WriteEndElement();
                    xml.WriteWhitespace("\n");
                    xml.WriteEndElement();
                    xml.WriteWhitespace("\n");

                    //Source section End
                    //Order section
                    xml.WriteStartElement("Order");
                    xml.WriteAttributeString("method", "order");
                    xml.WriteWhitespace("\n");
                    xml.WriteStartElement("CompanyNumber");
                    xml.WriteValue(config.Attributes["CompanyNumber"].Value);
                    xml.WriteEndElement();
                    xml.WriteWhitespace("\n");
                    xml.WriteStartElement("ProjectNumber");
                    xml.WriteValue(config.Attributes["ProjectNumber"].Value);
                    xml.WriteEndElement();
                    xml.WriteWhitespace("\n");
                    xml.WriteStartElement("OrderNumber");
                    xml.WriteValue(config.Attributes["OrderIdPrefix"].Value + orderId.ToString());
                    xml.WriteEndElement();
                    xml.WriteWhitespace("\n");
                    xml.WriteStartElement("SourceCode");
                    xml.WriteValue(config.Attributes["SourceCode"].Value);
                    xml.WriteEndElement();
                    xml.WriteWhitespace("\n");
                    xml.WriteStartElement("TrackingCode");

                    string trackingCode = config.Attributes["TrackingCode"].Value;
                    decimal shippingDiscount = 0;
                    if (CSWebBase.SiteBasePage.IsFreeShipOrderMainSku(orderItem.OrderId))
                    {
                        shippingDiscount = CSWebBase.DAL.GetDiscountAmount(orderItem.OrderId);

                        trackingCode = "002";
                    }

                    // This will look at TrackingCode Value by VersinName e.g TrackingCode_B2="003"; Added on 11/20/2013
                    string TrackingCodeByVersion = orderItem.VersionName.ToUpper();
                    if (!TrackingCodeByVersion.Equals(""))
                    {
                        if (config.SelectSingleNode("@TrackingCode_" + TrackingCodeByVersion) != null)
                        {
                            trackingCode = config.Attributes["TrackingCode_" + TrackingCodeByVersion].Value;
                        }
                    }

                    if (orderItem.SkuItems.FirstOrDefault(x => { return (x.SkuId == (int)CSWebBase.SiteBasePage.SkuEnum.DestinationReward) || (x.SkuId == (int)CSWebBase.SiteBasePage.SkuEnum.Accelerated4OnePay) || (x.SkuId == (int) CSWebBase.SiteBasePage.SkuEnum.Enhanced4OnePay); }) != null)
                    {
                        trackingCode = "BONUS";
                    }

                    xml.WriteValue(trackingCode);
                    
                    xml.WriteEndElement();
                    xml.WriteWhitespace("\n");
                    //xml.WriteStartElement("MediaCode");
                    //xml.WriteValue(config.Attributes["MediaCode"].Value);
                    //xml.WriteEndElement();
                    //xml.WriteWhitespace("\n");
                    xml.WriteStartElement("OrderDate");
                    xml.WriteValue(orderItem.CreatedDate.ToString("MM/dd/yyyy"));
                    xml.WriteEndElement();
                    xml.WriteWhitespace("\n");
                    xml.WriteStartElement("OrderTime");
                    xml.WriteValue(orderItem.CreatedDate.ToString("hh:mm"));
                    xml.WriteEndElement();
                    xml.WriteWhitespace("\n");

                    /*

01 = Ground (Sure Post)
02 = Next Day
03 = 2nd Day
09 = USPS PRIORITY MAIL

                     * */

                    ShippingMethodEnum shippingMethod = ShippingMethodEnum.Ground;

                    decimal rushShippingCharge = GetRushShippingCost(orderItem.SkuItems, ref shippingMethod);

                    // use USPS shipping method for PO box shipping address
                    if (orderItem.GetAttributeValue("IsPOBoxShipping", false))
                    {
                        shippingMethod = ShippingMethodEnum.USPSPriority;

                        // validation check (rush cost should be 0)
                        if (rushShippingCharge != 0)
                        {
                            try
                            {
                                CSCore.CSLogger.Instance.LogException("Rush shipping validation error in DataPak", new Exception("custom error"));
                            }
                            catch
                            {
                            }

                            try
                            {
                                OrderHelper.SendOrderFailedEmail(orderId);
                            }
                            catch
                            {
                            }

                            return null;
                        }
                    }

                    if (orderItem.CustomerInfo.ShippingAddress.CountryId == 46) // Canada
                    {                        
                        shippingMethod = ShippingMethodEnum.USPSPriority;
                    }
                    else if (orderItem.CustomerInfo.ShippingAddress.CountryId == 231) //US
                    {
                        if (orderItem.CustomerInfo.ShippingAddress.StateProvinceId == 1 ||  // AK, HI, etc. states
                             orderItem.CustomerInfo.ShippingAddress.StateProvinceId == 389 ||
                             orderItem.CustomerInfo.ShippingAddress.StateProvinceId == 388 ||
                             orderItem.CustomerInfo.ShippingAddress.StateProvinceId == 11 ||
                             orderItem.CustomerInfo.ShippingAddress.StateProvinceId == 390)
                        {
                            shippingMethod = ShippingMethodEnum.USPSPriority;
                        }                        
                    }

                    string ShippingMethod = GetShippingMethod(shippingMethod);

                    //if (config.SelectSingleNode("@ShippingMethod_" + orderItem.CustomerInfo.ShippingAddress.CountryId.ToString()) != null)
                    //{
                    //    ShippingMethod = config.Attributes["ShippingMethod_" + orderItem.CustomerInfo.ShippingAddress.CountryId.ToString()].Value;
                    //}

                    xml.WriteStartElement("ShippingMethod");
                    xml.WriteValue(ShippingMethod);
                    xml.WriteEndElement();
                    xml.WriteWhitespace("\n");





                    List<StateProvince> states = StateManager.GetAllStates(0);


                    //BillingInfo section
                    xml.WriteStartElement("BillingInfo");
                    xml.WriteWhitespace("\n");
                    xml.WriteElementString("FirstName", orderItem.CustomerInfo.BillingAddress.FirstName);
                    xml.WriteWhitespace("\n");
                    xml.WriteElementString("LastName", orderItem.CustomerInfo.BillingAddress.LastName);
                    xml.WriteWhitespace("\n");
                    xml.WriteElementString("Address1", orderItem.CustomerInfo.BillingAddress.Address1);
                    xml.WriteWhitespace("\n");
                    xml.WriteElementString("Address2", orderItem.CustomerInfo.BillingAddress.Address2);
                    xml.WriteWhitespace("\n");
                    xml.WriteElementString("City", orderItem.CustomerInfo.BillingAddress.City);
                    xml.WriteWhitespace("\n");
                    StateProvince itemBillingStateProvince = states.FirstOrDefault(x => x.StateProvinceId == Convert.ToInt32(orderItem.CustomerInfo.BillingAddress.StateProvinceId));
                    if (itemBillingStateProvince != null)
                    {
                        xml.WriteElementString("State", itemBillingStateProvince.Abbreviation.Trim());
                        xml.WriteWhitespace("\n");
                    }
                    else
                    {
                        xml.WriteElementString("State", string.Empty);
                        xml.WriteWhitespace("\n");
                    }
                    xml.WriteElementString("ZipCode", orderItem.CustomerInfo.BillingAddress.ZipPostalCode);
                    xml.WriteWhitespace("\n");
                    xml.WriteElementString("Country", orderItem.CustomerInfo.BillingAddress.CountryCode.Trim());
                    xml.WriteWhitespace("\n");
                    xml.WriteElementString("Phone", orderItem.CustomerInfo.BillingAddress.PhoneNumber);
                    xml.WriteWhitespace("\n");
                    xml.WriteElementString("Email", orderItem.Email);
                    xml.WriteWhitespace("\n");

                    xml.WriteEndElement();
                    xml.WriteWhitespace("\n");

                    //BillingInfo section End


                    //ShippingInfo section
                    xml.WriteStartElement("ShippingInfo");
                    xml.WriteWhitespace("\n");
                    xml.WriteElementString("FirstName", orderItem.CustomerInfo.ShippingAddress.FirstName);
                    xml.WriteWhitespace("\n");
                    xml.WriteElementString("LastName", orderItem.CustomerInfo.ShippingAddress.LastName);
                    xml.WriteWhitespace("\n");
                    xml.WriteElementString("Address1", orderItem.CustomerInfo.ShippingAddress.Address1);
                    xml.WriteWhitespace("\n");
                    xml.WriteElementString("Address2", orderItem.CustomerInfo.ShippingAddress.Address2);
                    xml.WriteWhitespace("\n");
                    xml.WriteElementString("City", orderItem.CustomerInfo.ShippingAddress.City);
                    xml.WriteWhitespace("\n");
                    StateProvince itemShippingStateProvince = states.FirstOrDefault(x => x.StateProvinceId == Convert.ToInt32(orderItem.CustomerInfo.ShippingAddress.StateProvinceId));
                    if (itemShippingStateProvince != null)
                    {
                        xml.WriteElementString("State", itemShippingStateProvince.Abbreviation.Trim());
                        xml.WriteWhitespace("\n");
                    }
                    else
                    {
                        xml.WriteElementString("State", string.Empty);
                        xml.WriteWhitespace("\n");
                    }
                    xml.WriteElementString("ZipCode", orderItem.CustomerInfo.ShippingAddress.ZipPostalCode);
                    xml.WriteWhitespace("\n");
                    xml.WriteElementString("Country", orderItem.CustomerInfo.ShippingAddress.CountryCode.Trim());
                    xml.WriteWhitespace("\n");
                    xml.WriteElementString("Phone", orderItem.CustomerInfo.ShippingAddress.PhoneNumber);
                    xml.WriteWhitespace("\n");
                    xml.WriteElementString("Email", orderItem.Email);
                    xml.WriteWhitespace("\n");

                    xml.WriteEndElement();
                    xml.WriteWhitespace("\n");

                    //ShippingInfo section End





                    //PaymentInfo informaiton
                    xml.WriteStartElement("PaymentInfo");
                    xml.WriteWhitespace("\n");
                    xml.WriteElementString("PaymentType", UpdateCreditCardType(orderItem.CreditInfo.CreditCardName));
                    xml.WriteWhitespace("\n");
                    xml.WriteElementString("CardNumber", orderItem.CreditInfo.CreditCardNumber);
                    xml.WriteWhitespace("\n");
                    xml.WriteElementString("ExpirationMonth", orderItem.CreditInfo.CreditCardExpired.ToString("MM"));
                    xml.WriteWhitespace("\n");
                    xml.WriteElementString("ExpirationYear", orderItem.CreditInfo.CreditCardExpired.ToString("yyyy"));
                    xml.WriteWhitespace("\n");
                    xml.WriteElementString("CVV", orderItem.CreditInfo.CreditCardCSC);
                    xml.WriteWhitespace("\n");

                    decimal surchargeAmt = GetSurchargeAmt(orderItem);
                    int maxNumOfPayments = 0; // here, number of payments correspond to additional payments after the initial payment (ie. first payment is excluded from this number).
                    foreach (Sku sku in orderItem.SkuItems)
                    {
                        if (!sku.AttributeValuesLoaded)
                            sku.LoadAttributeValues();

                        if (sku.GetAttributeValue("RushSku", false) || sku.SkuCode.ToUpper().Contains("SURCHARGE"))
                            continue;

                        int numOfPayment = sku.GetAttributeValue("NumberOfPayments", 0);

                        maxNumOfPayments = Math.Max(numOfPayment, maxNumOfPayments);
                    }

                    xml.WriteElementString("NumberOfPayments", (maxNumOfPayments+1).ToString());
                    xml.WriteWhitespace("\n");

                    // write out the initial payment
                    xml.WriteStartElement("Payment");
                        xml.WriteAttributeString("number", "1");
                        xml.WriteValue(GetMoneyStr(orderItem.Total));
                    xml.WriteEndElement();
                    xml.WriteWhitespace("\n");

                    // no add elements
                    for (int i = 1; i <= maxNumOfPayments; i++)
                    {
                        decimal paymentAmt = 0;

                        foreach (Sku sku in orderItem.SkuItems)
                        {
                            decimal skuPmt = 0;

                            if (!sku.AttributeValuesLoaded)                            
                                sku.LoadAttributeValues();

                            if (sku.GetAttributeValue("RushSku", false) || sku.SkuCode.ToUpper().Contains("SURCHARGE"))
                                continue;
                            
                            decimal numOfPayment = sku.GetAttributeValue("NumberOfPayments", 0m); 

                            if (numOfPayment > 0 && i <= numOfPayment)
                            {
                                skuPmt = ((sku.FullPrice - sku.InitialPrice) / numOfPayment) * sku.Quantity; // this assumes regualr payments are evenly spread out
                            }

                            paymentAmt += skuPmt;
                        }

                        xml.WriteStartElement("Payment");
                        xml.WriteAttributeString("number", (i + 1).ToString());

                        xml.WriteValue(GetMoneyStr(paymentAmt));

                        xml.WriteEndElement();
                        xml.WriteWhitespace("\n");
                    }


                    // Payment auth info

                    if (!string.IsNullOrEmpty(orderItem.CreditInfo.TransactionCode))
                    {
                        xml.WriteElementString("TransactionID", orderItem.CreditInfo.TransactionCode);
                        xml.WriteWhitespace("\n");
                    }

                    if (!string.IsNullOrEmpty(orderItem.CreditInfo.AuthorizationCode))
                    {
                        xml.WriteElementString("AuthCode", orderItem.CreditInfo.AuthorizationCode);
                        xml.WriteWhitespace("\n");
                    }

                    // Order Costs
                    xml.WriteElementString("MerchandiseTotal", GetMoneyStr(orderItem.FullPriceSubTotal));
                    xml.WriteWhitespace("\n");
                    xml.WriteElementString("ShippingCharge", GetMoneyStr(orderItem.ShippingCost - rushShippingCharge - shippingDiscount));
                    xml.WriteWhitespace("\n");
                    xml.WriteElementString("RushCharge", GetMoneyStr(rushShippingCharge));
                    xml.WriteWhitespace("\n");
                    xml.WriteElementString("PriorityHandling", "0.00");
                    xml.WriteWhitespace("\n");
                    xml.WriteElementString("SalesTax", GetMoneyStr(orderItem.FullPriceTax));
                    xml.WriteWhitespace("\n");
                    xml.WriteElementString("OrderTotal", GetMoneyStr(orderItem.FullPriceSubTotal // (this amount excludes rush shipping and surcharge)
                        + orderItem.ShippingCost //+ surchargeAmt // surchargeAmt = surcharge amount
                        + orderItem.RushShippingCost //+ rushShippingCharge // rushShippingCharge = rush shipping charge
                        + orderItem.FullPriceTax
                        - shippingDiscount));
                    xml.WriteWhitespace("\n");


                    xml.WriteEndElement();
                    xml.WriteWhitespace("\n");
                    //PaymentInfo section End

                    //SkuItems


                    Sku trialSku = orderItem.SkuItems.FirstOrDefault(x => { return x.SkuCode.ToUpper() == "TRIAL"; });

                    foreach (Sku Item in orderItem.SkuItems)
                    {
                        if (!Item.AttributeValuesLoaded)
                            Item.LoadAttributeValues();

                        if (Item.GetAttributeValue("RushSku", false) || Item.SkuCode.ToUpper().Contains("SURCHARGE"))
                            continue;

                        if (!Item.ContainsAttribute("DataPakItemCode"))
                            continue;

                        xml.WriteStartElement("Item");
                        xml.WriteWhitespace("\n");

                        Item.LoadAttributeValues();
                        xml.WriteElementString("ItemCode", Item.GetAttributeValue("DataPakItemCode"));
                        xml.WriteWhitespace("\n");
                        xml.WriteElementString("Sequence", Item.GetAttributeValue("DataPakSequence", "01"));
                        xml.WriteWhitespace("\n");
                        xml.WriteElementString("Quantity", Item.Quantity.ToString());
                        xml.WriteWhitespace("\n");

                        if (trialSku == null)
                            xml.WriteElementString("Price", GetMoneyStr(Item.FullPrice));
                        else
                        {
                            if (Item.SkuId == (int)CSWebBase.SiteBasePage.SkuEnum.EnhancedMultiPay || 
                                Item.SkuId == (int)CSWebBase.SiteBasePage.SkuEnum.AcceleratedMultiPay ||
                                Item.SkuId == (int)CSWebBase.SiteBasePage.SkuEnum.Enhanced4MultiPay ||
                                Item.SkuId == (int)CSWebBase.SiteBasePage.SkuEnum.Accelerated4MultiPay )
                                xml.WriteElementString("Price", GetMoneyStr(Item.FullPrice + trialSku.FullPrice));
                            else
                                xml.WriteElementString("Price", GetMoneyStr(Item.FullPrice));
                        }
                        
                        xml.WriteWhitespace("\n");
                        if (Item.AttributeValues.ContainsKey("isupsell"))
                        {
                            if (Item.AttributeValues["isupsell"].Value != "")
                            {
                                xml.WriteElementString("Upsell", Item.GetAttributeValueObj("isupsell").BooleanValue ? "Y" : "N");
                                xml.WriteWhitespace("\n");
                            }
                        }
                        else
                            xml.WriteElementString("Upsell", "N");

                        xml.WriteElementString("GiftWrap", "N");
                        xml.WriteWhitespace("\n");
                        xml.WriteElementString("GiftWrapCharge", "N");
                        xml.WriteWhitespace("\n");
                        xml.WriteEndElement();
                        xml.WriteWhitespace("\n");

                    }



                    xml.WriteEndElement();
                    xml.WriteWhitespace("\n");

                    //Order section End


                    //rootEnd node
                    xml.WriteEndElement();
                    //flush results to string object
                    strXml = str.ToString();
                }
            }
            return strXml;
        }

        public static string GetMoneyStr(decimal amount)
        {
            return Math.Round(amount, 2).ToString();
        }

        public static string UpdateCreditCardType(string cardtype)
        {
            // VI VISA AX AMERICAN EXPRESS DI DISCOVER MC MASTER CARD 

            //AMEX
            //Discover
            //MasterCard
            //VISA
            string returnValue = "";
            if (cardtype.ToLower().Equals("visa")) { returnValue = "VI"; }
            if (cardtype.ToLower().Equals("americanexpress")) { returnValue = "AM"; }
            if (cardtype.ToLower().Equals("discover")) { returnValue = "DI"; }
            if (cardtype.ToLower().Equals("mastercard")) { returnValue = "MA"; }

            return returnValue;
        }

        public void PostOrderToDataPak(int orderId)
        {
        //    string req="";
        //    string res="";
            string req = new DataPak().GetRequest(orderId, false, false); // Posting order to OMX
            string res = CommonHelper.HttpPost(config.Attributes["transactionUrl"].Value, req);
            Dictionary<string, AttributeValue> orderAttributes = new Dictionary<string, AttributeValue>();
            orderAttributes.Add("Request", new CSBusiness.Attributes.AttributeValue(req));
            orderAttributes.Add("Response", new CSBusiness.Attributes.AttributeValue(res));
            orderAttributes.Add("DataPak_Submit_Date", new CSBusiness.Attributes.AttributeValue(DateTime.Now.ToString()));

            XmlDocument doc = new XmlDocument();
            doc.LoadXml(res);
            XmlNode xnResult = doc.SelectSingleNode("/DatapakServices/Order/Result/Code");



            if (xnResult.InnerText.ToLower().Equals("001"))
            {
                CSResolve.Resolve<IOrderService>().SaveOrderInfo(orderId, 2, req.ToLower().Replace("utf-8", "utf-16"), res.ToLower().Replace("utf-8", "utf-16"));
                CSResolve.Resolve<IOrderService>().UpdateOrderAttributes(orderId, orderAttributes, 2);
            }
            else
            {
                CSResolve.Resolve<IOrderService>().SaveOrderInfo(orderId, 5, req.ToLower().Replace("utf-8", "utf-16"), res.ToLower().Replace("utf-8", "utf-16"));
                CSResolve.Resolve<IOrderService>().UpdateOrderAttributes(orderId, orderAttributes, 5);
                //sending email to admins
                OrderHelper.SendOrderFailedEmail(orderId);
            }
        }
        private XmlNode GetConfig()
        {
            return OrderHelper.GetDefaultFulFillmentHouseConfig();
        }

        private decimal GetRushShippingCost(List<Sku> skuItems, ref ShippingMethodEnum shippingMethod)
        {
            SitePreference sitePreference = CSFactory.GetCartPrefrence();

            List<SkuShipping> shippingCosts = ShippingDAL.GetSkuShipping();

            decimal rushCharge = 0;
            foreach (Sku sku in skuItems)
            {
                if (!sku.AttributeValuesLoaded)
                    sku.LoadAttributeValues();

                if (!sku.GetAttributeValue("RushSku", false))
                    continue;

                CSData.SkuShipping skuShipping = shippingCosts.FirstOrDefault(x =>
                        {
                            return x.PrefId == sitePreference.ShippingPrefID
                                && x.SkuId == sku.SkuId;
                        });

                if (skuShipping != null)
                {
                    // this will set shippingmethod to last one in list - there should really be on rush sku in cart, however
                    switch (sku.SkuCode.ToUpper())
                    {
                        case "OVERNIGHT":
                            shippingMethod = ShippingMethodEnum.NextDay;
                            break;
                        case "002UPS":
                            shippingMethod = ShippingMethodEnum.SecondDay;
                            break;
                    }

                    rushCharge += (skuShipping.Cost * sku.Quantity);
                }
            }

            return rushCharge;
        }

        private decimal GetMerchandiseSubtotal(Order orderItem)
        {
            SitePreference sitePreference = CSFactory.GetCartPrefrence();

            List<SkuShipping> shippingCosts = ShippingDAL.GetSkuShipping();

            decimal rushCharge = 0;
            foreach (Sku sku in orderItem.SkuItems)
            {
                if (!sku.AttributeValuesLoaded)
                    sku.LoadAttributeValues();

                if (!sku.GetAttributeValue("RushSku", false))
                    continue;

                CSData.SkuShipping skuShipping = shippingCosts.FirstOrDefault(x =>
                {
                    return x.PrefId == sitePreference.ShippingPrefID
                        && x.SkuId == sku.SkuId;
                });

                if (skuShipping != null)
                {
                    rushCharge += (skuShipping.Cost * sku.Quantity);
                }
            }

            return rushCharge;
        }

        private decimal GetSurchargeAmt(Order orderItem)
        {
            SitePreference sitePreference = CSFactory.GetCartPrefrence();

            List<SkuShipping> shippingCosts = ShippingDAL.GetSkuShipping();

            decimal surcharge = 0;
            foreach (Sku sku in orderItem.SkuItems)
            {
                if (!sku.AttributeValuesLoaded)
                    sku.LoadAttributeValues();

                if (!sku.SkuCode.ToUpper().Contains("SURCHARGE"))
                    continue;

                CSData.SkuShipping skuShipping = shippingCosts.FirstOrDefault(x =>
                {
                    return x.PrefId == sitePreference.ShippingPrefID
                        && x.SkuId == sku.SkuId;
                });

                if (skuShipping != null)
                {
                    surcharge += (skuShipping.Cost * sku.Quantity);
                }
            }

            return surcharge;
        }

        private string GetShippingMethod(ShippingMethodEnum shippingMethod)
        {
            switch (shippingMethod)
            {
                case ShippingMethodEnum.Ground:
                    return "01";                    
                case ShippingMethodEnum.NextDay:
                    return "02";                    
                case ShippingMethodEnum.SecondDay:
                    return "03";                    
                case ShippingMethodEnum.USPSPriority:
                    return "09";                    
            }

            return "01";
        }
    }
}