using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Xml.Linq;
using CSBusiness;
using CSBusiness.Email;
using CSBusiness.OrderManagement;
using CSBusiness.Payment;
using CSBusiness.Resolver;
using CSCore.Utils;
using CSPaymentProvider;
using CSBusiness.Preference;
using CSCore.DataHelper;
using System.Xml;
using CSBusiness.FulfillmentHouse;
using System.Collections;
using CSBusiness.Attributes;
using System.Web.UI;
using System.Web.UI.WebControls;
using CSWebBase;
using System.Text.RegularExpressions;
using CSBusiness.CustomerManagement;

/// <summary>
/// Summary description for OrderHelper
/// </summary>

namespace CSWeb
{
    public class OrderHelper
    {
        #region Order Validation

        public static bool AuthorizeOrder(int orderID)
        {
            return AuthorizeOrder(orderID, false);
        }

        public static bool AuthorizeOrder(int orderID, bool cardCheckOnly)
        {
            Request _request = new Request();

            Order orderData = CSResolve.Resolve<IOrderService>().GetOrderDetails(orderID, true);           

            _request.CardNumber = orderData.CreditInfo.CreditCardNumber;
            _request.CardCvv = orderData.CreditInfo.CreditCardCSC;
            _request.CurrencyCode = "$";
            _request.ExpireDate = orderData.CreditInfo.CreditCardExpired;
            _request.Amount = (double)(Math.Round(orderData.Total,2));
            _request.FirstName = orderData.CustomerInfo.BillingAddress.FirstName;
            _request.LastName = orderData.CustomerInfo.BillingAddress.LastName;
            _request.Address1 = orderData.CustomerInfo.BillingAddress.Address1;
            _request.City = orderData.CustomerInfo.BillingAddress.City;
            _request.State = StateManager.GetStateName(orderData.CustomerInfo.BillingAddress.StateProvinceId);
            _request.Country = CountryManager.CountryCode(orderData.CustomerInfo.BillingAddress.CountryId);
            _request.ZipCode = orderData.CustomerInfo.BillingAddress.ZipPostalCode;
            _request.TransactionDescription = orderData.CustomerInfo.BillingAddress.FirstName + " " + orderData.CustomerInfo.BillingAddress.LastName;
            _request.CustomerID = orderData.CustomerId.ToString();
            _request.InvoiceNumber = orderData.OrderId.ToString();
            if (orderData.CreditInfo.CreditCardName.ToString().ToLower().Contains("visa"))
            {
                _request.CardType = CreditCardType.Visa;
            }
            else if (orderData.CreditInfo.CreditCardName.ToString().ToLower().Contains("mastercard"))
            {
                _request.CardType = CreditCardType.Mastercard;
            }
            else if (orderData.CreditInfo.CreditCardName.ToString().ToLower().Contains("discover"))
            {
                _request.CardType = CreditCardType.Discover;
            }
            else if (orderData.CreditInfo.CreditCardName.ToString().ToLower().Contains("americanexpress"))
            {
                _request.CardType = CreditCardType.AmericanExpress;
            }

            //Read information from client DB setting
            Response _response = PaymentProviderRepository.Instance.Get().PerformRequest(_request);

            Dictionary<string, AttributeValue> orderAttributes = new Dictionary<string, AttributeValue>();
            orderAttributes.Add("AuthRequest", new CSBusiness.Attributes.AttributeValue(_response.GatewayRequestRaw));
            orderAttributes.Add("AuthResponse", new CSBusiness.Attributes.AttributeValue(_response.GatewayResponseRaw));
            CSResolve.Resolve<IOrderService>().UpdateOrderAttributes(orderData.OrderId, orderAttributes, 7);

            if (_response != null && _response.ResponseType != TransactionResponseType.Approved)
            {
                CSResolve.Resolve<IOrderService>().SaveOrder(orderData.OrderId, _response.TransactionID ?? string.Empty, _response.AuthCode ?? string.Empty, 7);

                return false;
            }
            else if (_response != null && _response.ResponseType == TransactionResponseType.Approved)
            {
                if (cardCheckOnly)
                    CSResolve.Resolve<IOrderService>().SaveOrder(orderData.OrderId, (_response.TransactionID ?? string.Empty) + " _c", (_response.AuthCode ?? string.Empty) + " _c", 7); // for card validation only, keep order marked invalid
                else 
                    CSResolve.Resolve<IOrderService>().SaveOrder(orderData.OrderId, _response.TransactionID ?? string.Empty, _response.AuthCode ?? string.Empty, 4);

                return true;
            }

            return true;
        }

        public static bool ValidationCheck(int orderID)
        {
            Request _request = new Request();

            Order orderData = CSResolve.Resolve<IOrderService>().GetOrderDetails(orderID, true);
            List<StateProvince> states = StateManager.GetAllStates(0);
            _request.CardNumber = orderData.CreditInfo.CreditCardNumber;
            _request.CardCvv = orderData.CreditInfo.CreditCardCSC;
            _request.CurrencyCode = "$";
            _request.ExpireDate = orderData.CreditInfo.CreditCardExpired;
            _request.Amount = (double)orderData.Total;
            _request.FirstName = orderData.CustomerInfo.BillingAddress.FirstName;
            _request.LastName = orderData.CustomerInfo.BillingAddress.LastName;
            _request.Address1 = orderData.CustomerInfo.BillingAddress.Address1;
            _request.City = orderData.CustomerInfo.BillingAddress.City;
            StateProvince itemStateProvince = states.FirstOrDefault(x => x.StateProvinceId == Convert.ToInt32(orderData.CustomerInfo.BillingAddress.StateProvinceId));
            if (itemStateProvince != null)
            {
                _request.State = itemStateProvince.Abbreviation.Trim();
                
            }
            
            _request.Country = CountryManager.CountryCode(orderData.CustomerInfo.BillingAddress.CountryId).Trim();
            _request.ZipCode = orderData.CustomerInfo.BillingAddress.ZipPostalCode;
            _request.TransactionDescription = orderData.CustomerInfo.BillingAddress.FirstName + " " + orderData.CustomerInfo.BillingAddress.LastName;
            _request.CustomerID = orderData.CustomerId.ToString();
            _request.InvoiceNumber = orderData.OrderId.ToString();

            _request.ShipToFirstName = orderData.CustomerInfo.ShippingAddress.FirstName;
            _request.ShipToLastName = orderData.CustomerInfo.ShippingAddress.LastName;
            _request.ShipToAddress = orderData.CustomerInfo.ShippingAddress.Address1;
            StateProvince itemStateProvince1 = states.FirstOrDefault(x => x.StateProvinceId == Convert.ToInt32(orderData.CustomerInfo.ShippingAddress.StateProvinceId));
            if (itemStateProvince != null)
            {
                _request.ShipToState = itemStateProvince1.Abbreviation.Trim();

            }
            //_request.ShipToState = StateManager.GetStateName(orderData.CustomerInfo.ShippingAddress.StateProvinceId);
            _request.ShipToZipCode = orderData.CustomerInfo.ShippingAddress.ZipPostalCode;
            _request.ShipToCity = orderData.CustomerInfo.ShippingAddress.City;
            _request.IPAddress = orderData.IpAddress;
            _request.Phone = orderData.CustomerInfo.BillingAddress.PhoneNumber;

           
            _request.ShipToCountry = CountryManager.CountryCode(orderData.CustomerInfo.ShippingAddress.CountryId).Trim();
            
            _request.Email = orderData.Email;

            
            Response _response = PaymentProviderRepository.Instance.Get().PerformValidationRequest(_request);


            if (_response != null && _response.ResponseType != TransactionResponseType.Approved)
            {
                CSResolve.Resolve<IOrderService>().SaveOrder(orderData.OrderId, _response.TransactionID, _response.AuthCode, 7);

                return false;
            }
            else if (_response != null && _response.ResponseType == TransactionResponseType.Approved)
            {
                CSResolve.Resolve<IOrderService>().SaveOrder(orderData.OrderId, _response.TransactionID, _response.AuthCode, 4);
                return true;
            }

            return true;
        }

        #endregion Order Validation

        #region Emails
        public static bool SendOrderCompletedEmail(int orderId)
        {
            if (!CSFactory.GetCacheSitePref().GetAttributeValue("ConfirmationEmailEnabled", true))
                return true;

            //pull Specific Email Template
            int emailId = ConfigHelper.EmailAppSetting("EmailId");

            EmailSetting emailTemplate = EmailManager.GetEmail(emailId);
            OrderManager orderMgr = new OrderManager();
            Order orderData = orderMgr.GetOrderDetails(orderId);
            string orderSubtotal = "", orderShipping = "", orderTax = "", orderTotal = "";
            string BilledFuture = "0.00", EmailPaymentsMultipay = "", EmailPaymentsOnepay = "", NumberOfPayments = "", FirstPayment30day = "0.00";   // BILLEDFUTURE
            decimal FutureBill = 0;
            string skuNumberOfPayments = "1", skuFirstPayment30day = "0";
            NumberOfPayments = skuNumberOfPayments;
            // added to customize the confirmation mail to match the customized reciept page
           


                List<Sku> skus = orderData.SkuItems.FindAll(x => !CSWebBase.SiteBasePage.IsKitBundleItem(x.SkuId));

                foreach (Sku sku in skus)
                {
                    if (CSWebBase.SiteBasePage.IsMainSku(sku.SkuId))
                    {
                        decimal totalPrice = sku.TotalPrice;

                        // add up all initial prices of all kit bundle items
                        foreach (Sku bundleSku in orderData.SkuItems.FindAll(x => CSWebBase.SiteBasePage.IsKitBundleItem(x.SkuId)))
                        {
                            totalPrice += bundleSku.TotalPrice;
                        }

                        sku.TotalPrice = totalPrice;
                        sku.LoadAttributeValues();
                        skuNumberOfPayments = sku.GetAttributeValue("NumberOfPayments", "1");
                        skuFirstPayment30day = sku.GetAttributeValue("FirstPayment30day", "");
                        if (!skuFirstPayment30day.Equals("") && !skuNumberOfPayments.Equals("") && Convert.ToInt32(skuNumberOfPayments) > 1)
                        {
                            FirstPayment30day = skuFirstPayment30day;
                            NumberOfPayments = skuNumberOfPayments;                            
                        }
                    }
                }

                skus.Sort(new CSWebBase.SkuSortComparer());

               
                orderSubtotal = Math.Round(orderData.SubTotal, 2).ToString();
                orderShipping = Math.Round(CSWebBase.SiteBasePage.GetShippingCost(orderData), 2).ToString();
                orderTax = Math.Round(orderData.Tax, 2).ToString();
                orderTotal = Math.Round(orderData.Total, 2).ToString();

                if (orderData.RushShippingCost > 0)
                {
                    orderShipping = Math.Round(orderData.RushShippingCost, 2).ToString();
                }
                //if (orderData.DiscountCode.Length > 0 && (CSWebBase.SiteBasePage.FreeShipDiscountCodeMainSku ?? string.Empty).ToUpper() != orderData.DiscountCode.ToUpper())
                //{
                //    orderPromotionalAmount = String.Format("(${0:0.00})", orderData.DiscountAmount);
                //}
                FutureBill = Math.Round(orderData.FullPriceSubTotal - orderData.SubTotal, 2);  // orderData.Total;
                SitePreference sitePrefCache = CSFactory.GetCacheSitePref();                
                if (sitePrefCache.GetAttributeValue("EmailPaymentsOnePay").ToString() != null)
                {
                    EmailPaymentsOnepay = sitePrefCache.GetAttributeValue("EmailPaymentsOnePay").ToString();
                }
                
                if (FutureBill>0 && sitePrefCache.GetAttributeValue("EmailPaymentsMultiPay").ToString() != null)
                {
                    EmailPaymentsMultipay = sitePrefCache.GetAttributeValue("EmailPaymentsMultiPay").ToString();
                    BilledFuture = FutureBill.ToString();
                }
                else
                {
                    EmailPaymentsMultipay = "";
                    BilledFuture = "0.00";
                }
            
            if (emailTemplate.Body != null)
            {
                //Subject Translation
                emailTemplate.Subject = emailTemplate.Subject.Replace("{ORDER_NUMBER}", orderData.OrderId.ToString());

                //Body Translation
                String BodyTemplate = emailTemplate.Body.Replace("&", "&amp;");

                BodyTemplate = BodyTemplate.Replace("{OrderID}", orderData.OrderId.ToString());

                BodyTemplate = BodyTemplate.Replace("{EMAILPAYMENTSONEPAY}", EmailPaymentsOnepay);
                BodyTemplate = BodyTemplate.Replace("{EMAILPAYMENTSMULTIPAY}", EmailPaymentsMultipay);
                BodyTemplate = BodyTemplate.Replace("{BILLEDFUTURE}", BilledFuture);
                BodyTemplate = BodyTemplate.Replace("{BILLED30DAYS}", FirstPayment30day);
                BodyTemplate = BodyTemplate.Replace("{NUMBEROFPAYMENTS}", NumberOfPayments);
                BodyTemplate = BodyTemplate.Replace("{SUBTOTAL}", string.Format (orderSubtotal,"N2"));
                BodyTemplate = BodyTemplate.Replace("{SHIPPING_HANDLING}", string.Format (orderShipping,"N2"));
                BodyTemplate = BodyTemplate.Replace("{TAX}", string.Format (orderTax,"N2"));
                BodyTemplate = BodyTemplate.Replace("{TOTAL}", string.Format (orderTotal,"N2"));
               // BodyTemplate = BodyTemplate.Replace("{RushShipping}", orderRushShipping.ToString("N2"));
               // BodyTemplate = BodyTemplate.Replace("{PromotionalAmount}", orderPromotionalAmount.ToString("N2"));
                BodyTemplate = BodyTemplate.Replace("{ORDER_ID}", orderData.OrderId.ToString());
                BodyTemplate = BodyTemplate.Replace("{ORDER_NUMBER}", orderData.OrderId.ToString());
                BodyTemplate = BodyTemplate.Replace("{ORDER_DATE}", orderData.CreatedDate.ToString("dd MMM yyyy hh:mm:ss"));

                
                //BodyTemplate = BodyTemplate.Replace("{SUBTOTAL}", orderData.SubTotal.ToString("N2"));
                //BodyTemplate = BodyTemplate.Replace("{SHIPPING_HANDLING}", orderData.ShippingCost.ToString("N2"));
                //BodyTemplate = BodyTemplate.Replace("{TAX}", orderData.Tax.ToString("N2"));
                //BodyTemplate = BodyTemplate.Replace("{TOTAL}", orderData.Total.ToString("N2"));
                //BodyTemplate = BodyTemplate.Replace("{ORDER_ID}", orderData.OrderId.ToString());
                //BodyTemplate = BodyTemplate.Replace("{ORDER_NUMBER}", orderData.OrderId.ToString());
                //BodyTemplate = BodyTemplate.Replace("{ORDER_DATE}", orderData.CreatedDate.ToString("dd MMM yyyy hh:mm:ss"));
                CSBusiness.CustomerManagement.Address billing = orderData.CustomerInfo.BillingAddress;
                if (billing != null)
                {

                    BodyTemplate = BodyTemplate.Replace("{BILLING_COMPANY}", CommonHelper.EnsureNotNull(billing.Company));
                    BodyTemplate = BodyTemplate.Replace("{BILLING_ADDRESS2}", CommonHelper.EnsureNotNull(billing.Address2));
                    BodyTemplate = BodyTemplate.Replace("{BILLING_NAME}", billing.FirstName + " " + billing.LastName);
                    BodyTemplate = BodyTemplate.Replace("{BILLING_ADDRESS}", billing.Address1);
                    BodyTemplate = BodyTemplate.Replace("{BILLING_CITY}", billing.City);
                    BodyTemplate = BodyTemplate.Replace("{BILLING_STATE}", StateManager.GetStateName(billing.StateProvinceId)); //pull from Cache
                    BodyTemplate = BodyTemplate.Replace("{BILLING_ZIP}", billing.ZipPostalCode);
                    BodyTemplate = BodyTemplate.Replace("{BILLING_EMAIL}", orderData.Email);
                    BodyTemplate = BodyTemplate.Replace("{BILLING_COUNTRY}", CountryManager.CountryName(billing.CountryId)); //pull from Cache

                }



                CSBusiness.CustomerManagement.Address shippingAddress = orderData.CustomerInfo.ShippingAddress;
                if (shippingAddress != null)
                {
                    BodyTemplate = BodyTemplate.Replace("{SHIPPING_COMPANY}", CommonHelper.EnsureNotNull(shippingAddress.Company));
                    BodyTemplate = BodyTemplate.Replace("{SHIPPING_NAME}", shippingAddress.FirstName + " " + shippingAddress.LastName);
                    BodyTemplate = BodyTemplate.Replace("{SHIPPING_ADDRESS}", shippingAddress.Address1);
                    BodyTemplate = BodyTemplate.Replace("{SHIPPING_ADDRESS2}", CommonHelper.EnsureNotNull(shippingAddress.Address2));
                    BodyTemplate = BodyTemplate.Replace("{SHIPPING_CITY}", shippingAddress.City);
                    BodyTemplate = BodyTemplate.Replace("{SHIPPING_STATE}", StateManager.GetStateName(shippingAddress.StateProvinceId)); //pull from Cache
                    BodyTemplate = BodyTemplate.Replace("{SHIPPING_ZIP}", shippingAddress.ZipPostalCode);
                    BodyTemplate = BodyTemplate.Replace("{SHIPPING_COUNTRY}", CountryManager.CountryName(shippingAddress.CountryId)); //pull from Cache
                    BodyTemplate = BodyTemplate.Replace("{SHIPPING_PHONE}", CommonHelper.EnsureNotNull(shippingAddress.PhoneNumber));
                }

                XElement elem = XElement.Parse("<root>" + BodyTemplate + "</root>", LoadOptions.PreserveWhitespace);
                var nodes = from XElement e in elem.Descendants()
                            where e.Attribute("cart") != null
                            select e;

                StringBuilder sb = new StringBuilder();
                foreach (XElement node in nodes)
                {
                    string originalString = node.ToString();

                    int totalSkuItems = skus.Count ;
                    for (int i = 0; i < totalSkuItems; i++)
                    {
                        Sku sku = skus[i];
                        string resultString = originalString;
                        resultString = resultString
                            .Replace("{SKU}", sku.SkuCode)
                            .Replace("{SKU_QTY}", sku.Quantity.ToString())
                            .Replace("{SKU_DESCR}", sku.LongDescription)
                            .Replace("{SKU_PRICE}", sku.TotalPrice.ToString("N2"));

                        sb.Append(resultString);
                    }
                    BodyTemplate = BodyTemplate.Replace(originalString, sb.ToString());
                    sb.Clear();
                    BodyTemplate = BodyTemplate.Replace("&amp;", "&");
                }


                try
                {
                    //Prepare Mail Message
                    MailMessage _oMailMessage = new MailMessage(emailTemplate.FromAddress, orderData.Email, emailTemplate.Subject, BodyTemplate);
                    _oMailMessage.IsBodyHtml = true;
                    SendMail(_oMailMessage);
                    //Fire OrderConfirmation Log
                    orderMgr.FireEmailLog(orderData.OrderId, orderData.Email, emailTemplate.Subject, BodyTemplate, DateTime.Now);
                    return true;
                }
                catch (Exception)
                {
                    return false;
                }

            }
            else
                return false;
        }
        public static bool SendEmailToAdmins(int orderId)
        {
            //pull Specific Email Template
            int emailId = ConfigHelper.EmailAppSetting("AdminAlertEmailId");
            EmailSetting emailTemplate = EmailManager.GetEmail(emailId);

            if (emailTemplate.Body != null)
            {
                //Body Translation
                String BodyTemplate = emailTemplate.Body.Replace("&", "&amp;");
                BodyTemplate = BodyTemplate.Replace("{OrderId}", orderId.ToString());            
                BodyTemplate = BodyTemplate.Replace("&amp;", "&");
                try
                {
                    //Prepare Mail Message
                    MailMessage _oMailMessage = new MailMessage(emailTemplate.FromAddress, emailTemplate.ToAddress, emailTemplate.Subject, BodyTemplate);
                    _oMailMessage.IsBodyHtml = true;
                    SendMail(_oMailMessage);                    
                    return true;
                }
                catch (Exception)
                {
                    return false;
                }

            }
            else
                return false;
        }

        public static bool SendOrderDeclinedEmail(int orderId)
        {
            //pull Specific Email Template
            int emailId = 2;

            EmailSetting emailTemplate = EmailManager.GetEmail(emailId);
            OrderManager orderMgr = new OrderManager();
            Order orderData = orderMgr.GetOrderDetails(orderId);

            if (emailTemplate.Body != null)
            {
                //Body Translation
                String BodyTemplate = emailTemplate.Body.Replace("&", "&amp;");

                CSBusiness.CustomerManagement.Address billing = orderData.CustomerInfo.BillingAddress;
                if (billing != null)
                {
                    BodyTemplate = BodyTemplate.Replace("{BILLING_NAME}", billing.FirstName + " " + billing.LastName);
                }

                XElement elem = XElement.Parse("<root>" + BodyTemplate + "</root>", LoadOptions.PreserveWhitespace);
                var nodes = from XElement e in elem.Descendants()
                            where e.Attribute("cart") != null
                            select e;

                try
                {
                    //Prepare Mail Message
                    MailMessage _oMailMessage = new MailMessage(emailTemplate.FromAddress, orderData.Email, emailTemplate.Subject, BodyTemplate);
                    _oMailMessage.IsBodyHtml = true;
                    SendMail(_oMailMessage);
                    //Fire OrderDecline Log
                    orderMgr.FireEmailLog(orderData.OrderId, orderData.Email, emailTemplate.Subject, BodyTemplate, DateTime.Now);
                    return true;
                }
                catch (Exception)
                {
                    return false;
                }

            }
            else
                return false;
        }

        public static bool SendOrderFailedEmail(int orderId)
        {
            //pull Specific Email Template
            int emailId = 3;

            EmailSetting emailTemplate = EmailManager.GetEmail(emailId);
            OrderManager orderMgr = new OrderManager();
            Order orderItem = new OrderManager().GetBatchProcessOrders(orderId);
            orderItem.LoadAttributeValues();
            if (emailTemplate.Body != null)
            {
                //Body Translation
                String BodyTemplate = emailTemplate.Body.Replace("&", "&amp;");


                BodyTemplate = BodyTemplate.Replace("{orderID}", orderId.ToString());
                BodyTemplate = BodyTemplate.Replace("{RESPONSE}", orderItem.AttributeValues["response"].Value);



                //XElement elem = XElement.Parse("<root>" + BodyTemplate + "</root>", LoadOptions.PreserveWhitespace);
                //var nodes = from XElement e in elem.Descendants()
                //            where e.Attribute("cart") != null
                //            select e;

                try
                {
                    //Prepare Mail Message
                    MailMessage _oMailMessage = new MailMessage(emailTemplate.FromAddress, emailTemplate.ToAddress, emailTemplate.Subject, BodyTemplate);
                    _oMailMessage.IsBodyHtml = true;
                    SendMail(_oMailMessage);
                    //Fire OrderDecline Log
                    orderMgr.FireEmailLog(orderItem.OrderId, orderItem.Email, emailTemplate.Subject, BodyTemplate, DateTime.Now);
                    return true;
                }
                catch (Exception)
                {
                    return false;
                }

            }
            else
                return false;
        }

        public static bool SendMail(MailMessage oMsg)
        {

            bool bResult = false;

            try
            {
                SmtpClient client;
                oMsg.BodyEncoding = System.Text.Encoding.UTF8;
                oMsg.CC.Clear();
                oMsg.Bcc.Clear();
                client = new SmtpClient();
                client.Send(oMsg);
                bResult = true;

            }
            catch (Exception)
            {

                bResult = false;
            }
            return bResult;
        }
        #endregion Emails

        public static int GetVersion()
        {
            int versionId = 1;
            string version = HttpContext.Current.Request.Url.AbsolutePath.ToLower();
            version = version.Substring(0, version.LastIndexOf('/'));
            version = version.Substring(version.LastIndexOf('/') + 1, (version.Length - (version.LastIndexOf('/') + 1)));


            List<CSBusiness.Version> list = (CSFactory.GetCacheSitePref()).VersionItems;
            CSBusiness.Version item = list.Find(x => x.Title.ToLower() == version);
            if (item != null)
                versionId = item.VersionId;

            return versionId;
        }

       
        public static XmlNode GetDefaultFulFillmentHouseConfig()
        {
            XmlDocument doc = new XmlDocument();
            List<FulfillmentHouseProviderSetting> allSettings = FulfillmentHouseProviderManger.GetAllProvidersFromDB(true);
            int totalSettings = allSettings.Count;

            for (int i = 0; i < totalSettings; i++)
            {
                FulfillmentHouseProviderSetting settings = allSettings[i];
                if (settings.Active)
                {
                    if (settings.IsDefault)
                    {
                        doc.LoadXml(settings.ProviderXML);
                        return doc.FirstChild;
                    }
                }
            }
            return null;
        }

        public static XmlNode GetDataPakFulFillmentHouseConfig()
        {
            XmlDocument doc = new XmlDocument();
            List<FulfillmentHouseProviderSetting> allSettings = FulfillmentHouseProviderManger.GetAllProvidersFromDB(true);
            int totalSettings = allSettings.Count;

            for (int i = 0; i < totalSettings; i++)
            {
                FulfillmentHouseProviderSetting settings = allSettings[i];
                if (settings.Title == "DataPak")
                {
                    doc.LoadXml(settings.ProviderXML);
                    return doc.FirstChild;
                }
            }
            return null;
        }

        public static XmlNode GetDefaultFulFillmentHouseConfig(string title)
        {
            XmlDocument doc = new XmlDocument();
            List<FulfillmentHouseProviderSetting> allSettings = FulfillmentHouseProviderManger.GetAllProvidersFromDB(true);
            int totalSettings = allSettings.Count;

            for (int i = 0; i < totalSettings; i++)
            {
                FulfillmentHouseProviderSetting settings = allSettings[i];
                if (settings.Active)
                {
                    if (settings.Title.ToLower().Equals(title.ToLower()))
                    {
                        doc.LoadXml(settings.ProviderXML);
                        return doc.FirstChild;
                    }
                }
            }
            return null;
        }

        public static string GetVersionName()
        {
            return CSBusiness.Web.CSBasePage.GetVersionName();
        }
        public static bool AuthorizeOrderWithPayPalAdaptive(int orderID, Hashtable RequestData, out Hashtable ResponseData)
        {
            // Consider setting up below params
            //Hashtable htAdditinalInfo = new Hashtable();
            //htAdditinalInfo.Add("ReturnUrl", "https://cart.conversionsystems.com/about.aspx?orderid=1000");
            //htAdditinalInfo.Add("CancelUrl", "https://www.canurrl.com");
            //htAdditinalInfo.Add("Memo", "Test");
            //htAdditinalInfo.Add("IpnNotificationUrl", "https://cart.conversionsystems.com/about.aspx?orderid=1000");
            //htAdditinalInfo.Add("ActionType", "SetPaymentOptions");
            //htAdditinalInfo.Add("PayKey", "");
            //htAdditinalInfo.Add("ActionType", "PaymentDetails");

            Request _request = new Request();
            Order orderData = CSResolve.Resolve<IOrderService>().GetOrderDetails(orderID, true);

            _request.AdditionalInfo = RequestData;
            _request.Amount = (double)orderData.Total;
            _request.InvoiceNumber = orderID.ToString();

            Response _response = PaymentProviderRepository.Instance.Get(PaymentProviderType.PayPalAdaptivePayment).PerformRequest(_request);
            ResponseData = _response.AdditionalInfo;
            if (_response.MerchantDefined1 != null)
            {
                ResponseData.Add("RedirectUrl", _response.MerchantDefined1);
            }

            if (_response != null && _response.ResponseType != TransactionResponseType.Approved)
            {
                //CSResolve.Resolve<IOrderService>().SaveOrder(orderData.OrderId, _response.TransactionID, _response.AuthCode, 7);
                return false;
            }
            else if (_response != null && _response.ResponseType == TransactionResponseType.Approved)
            {
                //CSResolve.Resolve<IOrderService>().SaveOrder(orderData.OrderId, _response.TransactionID, _response.AuthCode, 4);
                return true;
            }
            return true;
        }

        public static CSPaymentProvider.Response AuthorizeOrderWithPayPalExpressCheckout(ClientCartContext context, Hashtable RequestData, out Hashtable ResponseData)
        {
            string strMethod = "";
            string strInvoiceNumber = "";
            string strToken = "";
            Request _request = new Request();
            if (RequestData != null)
            {
                if (RequestData.ContainsKey("Method"))
                {
                    strMethod = RequestData["Method"].ToString();
                }
                if (RequestData.ContainsKey("InvoiceNumber"))
                {
                    strInvoiceNumber = RequestData["InvoiceNumber"].ToString();
                }
                if (RequestData.ContainsKey("Token"))
                {
                    strToken = RequestData["Token"].ToString().Trim();
                }
            }
            switch (strMethod)
            {
                case "SetExpressCheckout":
                    {
                        _request.Amount = (double)(context.CartInfo.Total);
                        _request.CurrencyCode = "USD";
                        int ct = 0;
                        string strLname = string.Empty;
                        string strLamt = string.Empty;
                        string strLqty = string.Empty;

                        SitePreference sitePreference = CSFactory.GetCacheSitePref();
                        if (sitePreference.GetAttributeValue<bool>("BillingAgreementPayPal", false))
                        {
                            RequestData["L_BILLINGTYPE0"] = "MerchantInitiatedBilling";
                        }
                        foreach (Sku skuItem in context.CartInfo.CartItems)
                        {
                            strLname = "L_PAYMENTREQUEST_0_NAME";
                            strLamt = "L_PAYMENTREQUEST_0_AMT";
                            strLqty = "L_PAYMENTREQUEST_0_QTY";
                            strLname = "L_PAYMENTREQUEST_0_NAME" + ct;
                            strLamt = "L_PAYMENTREQUEST_0_AMT" + ct;
                            strLqty = "L_PAYMENTREQUEST_0_QTY" + ct;
                            RequestData[strLname] = skuItem.Title;
                            RequestData[strLamt] = skuItem.InitialPrice.ToString("N2");
                            RequestData[strLqty] = skuItem.Quantity;
                            ct++;
                        }
                        if (context.CartInfo.DiscountAmount > 0)
                        {
                            strLname = "L_PAYMENTREQUEST_0_NAME";
                            strLamt = "L_PAYMENTREQUEST_0_AMT";
                            strLqty = "L_PAYMENTREQUEST_0_QTY";
                            strLname = "L_PAYMENTREQUEST_0_NAME" + ct;
                            strLamt = "L_PAYMENTREQUEST_0_AMT" + ct;
                            strLqty = "L_PAYMENTREQUEST_0_QTY" + ct;
                            RequestData[strLname] = "Discount Code - " + context.CartInfo.DiscountCode;
                            RequestData[strLamt] = "-" + context.CartInfo.DiscountAmount.ToString("N2");
                            RequestData[strLqty] = "1";
                        }
                        RequestData["PAYMENTREQUEST_0_ITEMAMT"] = (context.CartInfo.SubTotal - context.CartInfo.DiscountAmount).ToString("N2");
                        RequestData["PAYMENTREQUEST_0_SHIPPINGAMT"] = (context.CartInfo.ShippingCost + context.CartInfo.AdditionalShippingCharge).ToString("N2");
                        RequestData["PAYMENTREQUEST_0_TAXAMT"] = context.CartInfo.TaxCost.ToString("N2");
                        break;
                    }
                case "GetExpressCheckoutDetails":
                    {
                        break;
                    }
                case "DoExpressCheckoutPayment":
                    {
                        _request.Amount = (double)(context.CartInfo.Total);
                        _request.CurrencyCode = "USD";
                        int ct = 0;
                        string strLname = string.Empty;
                        string strLamt = string.Empty;
                        string strLqty = string.Empty;
                        foreach (Sku skuItem in context.CartInfo.CartItems)
                        {
                            strLname = "L_PAYMENTREQUEST_0_NAME";
                            strLamt = "L_PAYMENTREQUEST_0_AMT";
                            strLqty = "L_PAYMENTREQUEST_0_QTY";
                            strLname = "L_PAYMENTREQUEST_0_NAME" + ct;
                            strLamt = "L_PAYMENTREQUEST_0_AMT" + ct;
                            strLqty = "L_PAYMENTREQUEST_0_QTY" + ct;
                            RequestData[strLname] = skuItem.Title;
                            RequestData[strLamt] = skuItem.InitialPrice.ToString("N2");
                            RequestData[strLqty] = skuItem.Quantity;
                            ct++;
                        }
                        if (context.CartInfo.DiscountAmount > 0)
                        {
                            strLname = "L_PAYMENTREQUEST_0_NAME";
                            strLamt = "L_PAYMENTREQUEST_0_AMT";
                            strLqty = "L_PAYMENTREQUEST_0_QTY";
                            strLname = "L_PAYMENTREQUEST_0_NAME" + ct;
                            strLamt = "L_PAYMENTREQUEST_0_AMT" + ct;
                            strLqty = "L_PAYMENTREQUEST_0_QTY" + ct;
                            RequestData[strLname] = "Discount Code - " + context.CartInfo.DiscountCode;
                            RequestData[strLamt] = "-" + context.CartInfo.DiscountAmount.ToString("N2");
                            RequestData[strLqty] = "1";
                        }
                        RequestData["PAYMENTREQUEST_0_ITEMAMT"] = (context.CartInfo.SubTotal - context.CartInfo.DiscountAmount).ToString("N2");
                        RequestData["PAYMENTREQUEST_0_SHIPPINGAMT"] = (context.CartInfo.ShippingCost + context.CartInfo.AdditionalShippingCharge).ToString("N2");
                        RequestData["PAYMENTREQUEST_0_TAXAMT"] = context.CartInfo.TaxCost.ToString("N2");

                        _request.InvoiceNumber = strInvoiceNumber;
                        //Save the AUTHCODE, TRANSACTION CODE.
                        break;
                    }
            }

            RequestData["SOLUTIONTYPE"] = "Sole";

            _request.AdditionalInfo = RequestData;

            Response _response = PaymentProviderRepository.Instance.Get(PaymentProviderType.PayPalExpressCheckout).PerformRequest(_request);

            #region Log Request/Response
            try
            {
                Dictionary<string, AttributeValue> orderAttributes = new Dictionary<string, AttributeValue>();
                string logRequest = _response.GatewayRequestRaw;
                string logResponse = _response.GatewayResponseRaw;
                try
                {
                    if (_response.AdditionalInfo.ContainsKey("BILLINGAGREEMENTID"))
                    {
                        orderAttributes.Add("BillingAgreementID", new CSBusiness.Attributes.AttributeValue(_response.AdditionalInfo["BILLINGAGREEMENTID"].ToString()));
                    }
                }
                catch
                {


                }



                // the attributes we save to depends on the type of call
                if (RequestData.ContainsKey("Method") && RequestData["Method"].ToString() == "SetExpressCheckout")
                {
                    orderAttributes.Add("PayPalSetPaymentRequest", new CSBusiness.Attributes.AttributeValue(logRequest));
                    orderAttributes.Add("PayPalSetPaymentResponse", new CSBusiness.Attributes.AttributeValue(logResponse));
                }
                else if (RequestData.ContainsKey("Method") && RequestData["Method"].ToString() == "GetExpressCheckoutDetails")
                {
                    orderAttributes.Add("PayPalGetAddrRequest", new CSBusiness.Attributes.AttributeValue(logRequest));
                    orderAttributes.Add("PayPalGetAddrResponse", new CSBusiness.Attributes.AttributeValue(logResponse));
                }
                else
                {
                    orderAttributes.Add("PayPalRequest", new CSBusiness.Attributes.AttributeValue(logRequest));
                    orderAttributes.Add("PayPalResponse", new CSBusiness.Attributes.AttributeValue(logResponse));
                }

                CSResolve.Resolve<IOrderService>().UpdateOrderAttributes(context.OrderId, orderAttributes, null);
            }
            catch (Exception ex)
            {
                CSCore.CSLogger.Instance.LogException(ex.Message, ex.InnerException);
            }
            #endregion

            ResponseData = _response.AdditionalInfo;

            if (_response.MerchantDefined1 != null)
            {
                ResponseData.Add("RedirectUrl", _response.MerchantDefined1);
            }

            return _response;
        }

        public static string InitializePayPal(int orderId)
        {
            ClientCartContext clientData = SiteBasePage.CartContext;  // ClientOrderData;

            Hashtable htAdditinalInfo = new Hashtable();
            Hashtable htAdditinalInfoResponse = new Hashtable();

            htAdditinalInfo.Add("Method", "SetExpressCheckout");
            //If you comment below 3 credentials then default payments will be used from config. So for testing we can comment it.
            //htAdditinalInfo.Add("APIUser", DocFields["api_login"]);
            //htAdditinalInfo.Add("APIPassword", DocFields["paypal_password"]);
            //htAdditinalInfo.Add("APISignature", DocFields["api_signature"]);
            HttpRequest request13 = HttpContext.Current.Request;
            CSBusiness.Version version = (CSFactory.GetCacheSitePref()).VersionItems.Single(x => { return x.VersionId == clientData.VersionId; });

            string subPath = request13.Url.AbsolutePath; //version.Title.ToUpper() == "A1" ? string.Empty : "/" + version.Title.ToLower();

            SitePreference sitePreference = CSFactory.GetCacheSitePref();
            htAdditinalInfo.Add("ReturnUrl", string.Format(sitePreference.GetAttributeValue("PayPalReturnURL"), subPath,
                clientData.OrderId.ToString()));
            htAdditinalInfo.Add("CancelUrl", string.Format(sitePreference.GetAttributeValue("PayPalCancelURL"), subPath));


            if (OrderHelper.AuthorizeOrderWithPayPalExpressCheckout(clientData, htAdditinalInfo, out htAdditinalInfoResponse).ResponseType == TransactionResponseType.Approved)
            {
                string strRedirectUrl = "";
                if (htAdditinalInfoResponse.ContainsKey("RedirectUrl"))
                {
                    strRedirectUrl = htAdditinalInfoResponse["RedirectUrl"].ToString();
                }

                if (htAdditinalInfoResponse.ContainsKey("TOKEN"))
                {
                    Dictionary<string, AttributeValue> attributes = new Dictionary<string, AttributeValue>();
                    attributes.AddAttributeValue("PayPalToken", new AttributeValue(htAdditinalInfoResponse["TOKEN"].ToString()));

                    CSResolve.Resolve<IOrderService>().UpdateOrderAttributes(orderId, attributes, null);
                }

                if (!string.IsNullOrEmpty(strRedirectUrl))
                {
                    HttpContext.Current.Response.Redirect(strRedirectUrl, true);
                    return null;
                }
                else
                {
                    return "We're sorry, there was an error processing your request. Please try again later.";
                }
            }
            else
            {
                return "We're sorry, there was an error processing your request.";
            }
        }

        public static string GetAddressFromPayPal(ClientCartContext cartContext)
        {
            List<StateProvince> states = StateManager.GetAllStates(0);
            List<Country> countries = CountryManager.GetAllCountry();
            Customer customer = new Customer();
            Address address = new Address();

            Hashtable htAdditinalInfo = new Hashtable();
            Hashtable htAdditinalInfoResponse = new Hashtable();
            htAdditinalInfo.Add("Method", "GetExpressCheckoutDetails");

            if (HttpContext.Current.Request["Token"] != null)
            {
                SiteBasePage.PayPalToken = HttpContext.Current.Request["Token"].ToString();
            }
            if (HttpContext.Current.Request["PayerID"] != null)
            {
                SiteBasePage.PayPalInvoice = HttpContext.Current.Request["PayerID"].ToString();
            }
            htAdditinalInfo.Add("Token", SiteBasePage.PayPalToken);

            if (OrderHelper.AuthorizeOrderWithPayPalExpressCheckout(cartContext, htAdditinalInfo, out htAdditinalInfoResponse).ResponseType == TransactionResponseType.Approved)
            {
                customer.FirstName = htAdditinalInfoResponse["FIRSTNAME"].ToString();
                customer.LastName = htAdditinalInfoResponse["LASTNAME"].ToString();
                customer.Email = htAdditinalInfoResponse["EMAIL"].ToString();
                customer.Username = customer.Email;
                customer.PhoneNumber = "";

                address.FirstName = customer.FirstName;
                address.LastName = customer.LastName;
                address.Email = customer.Email;
                address.Address1 = htAdditinalInfoResponse["SHIPTOSTREET"].ToString();
                address.Address2 = "";
                address.City = htAdditinalInfoResponse["SHIPTOCITY"].ToString();
                address.StateProvinceId = states.Find(x => x.Abbreviation.Trim() == htAdditinalInfoResponse["SHIPTOSTATE"].ToString()).StateProvinceId;
                address.ZipPostalCode = htAdditinalInfoResponse["SHIPTOZIP"].ToString();
                address.CountryId = countries.Find(x => x.Code.Trim() == htAdditinalInfoResponse["SHIPTOCOUNTRYCODE"].ToString()).CountryId;

                customer.ShippingAddress = address;
                customer.BillingAddress = address;
                cartContext.CartInfo.ShippingAddress = address;

                cartContext.CustomerInfo = customer;                
                //cartContext.PaymentInfo = order.CreditInfo; Update payment

                return null;
            }
            else
            {
                return "We're sorry, there was an error processing your request.";
            }
        }

        public static string FinalizePayPalTransaction(ClientCartContext clientData)
        {
            Hashtable htAdditinalInfo = new Hashtable();
            Hashtable htAdditinalInfoResponse = new Hashtable();

            htAdditinalInfo.Add("Method", "DoExpressCheckoutPayment");
            //If you comment below 3 credentials then default payments will be used from config. So for testing we can comment it.
            //htAdditinalInfo.Add("APIUser", customDiscountCode.ApiLogin);
            //htAdditinalInfo.Add("APIPassword", customDiscountCode.PayPalPassword);
            //htAdditinalInfo.Add("APISignature", customDiscountCode.ApiSignature);

            htAdditinalInfo.Add("InvoiceNumber", SiteBasePage.PayPalInvoice);
            htAdditinalInfo.Add("Token", SiteBasePage.PayPalToken);

            if (OrderHelper.AuthorizeOrderWithPayPalExpressCheckout(clientData, htAdditinalInfo, out htAdditinalInfoResponse).ResponseType == TransactionResponseType.Approved)
            {
                string strTransactionID = SiteBasePage.PayPalToken;
                if (htAdditinalInfoResponse["PAYMENTINFO_0_TRANSACTIONID"] != null)
                {
                    strTransactionID = htAdditinalInfoResponse["PAYMENTINFO_0_TRANSACTIONID"].ToString();
                }

                if ((clientData.CustomerInfo.ShippingAddress.FirstName.ToLower() == "test"
                    && clientData.CustomerInfo.ShippingAddress.LastName.ToLower() == "test")
                    || clientData.CustomerInfo.Email.Trim().ToLower() == "buyer_1340127461_per@conversionsystems.com") // testing flags
                    CSResolve.Resolve<IOrderService>().SaveOrder(clientData.OrderId, strTransactionID, SiteBasePage.PayPalInvoice, 7);
                else
                {
                    CSResolve.Resolve<IOrderService>().SaveOrder(clientData.OrderId, strTransactionID, SiteBasePage.PayPalInvoice, 4);
                }

                OrderHelper.SendOrderCompletedEmail(clientData.OrderId);

                return null;
            }
            else
            {
                return "We're sorry, there was an error processing your request.";
            }
        }
        public static bool RefundOrderWithLitle(int orderID, string transactionid)
        {
            Request _request = new Request();

            Order orderData = CSResolve.Resolve<IOrderService>().GetOrderDetails(orderID, true);


            _request.TransactionID = transactionid;
            _request.CustomerID = orderData.CustomerId.ToString();
            _request.InvoiceNumber = orderData.OrderId.ToString();

            
            Response _response = PaymentProviderRepository.Instance.Get(PaymentProviderType.LitleCorpAccount).PerformVoidRequest(_request);

            if (_response != null && _response.ResponseType != TransactionResponseType.Approved)
            {
                if (_response.ReasonText.Equals("362"))
                {
                    Response _response1 = PaymentProviderRepository.Instance.Get(PaymentProviderType.LitleCorpAccount).PerformVoidSettledRequest(_request);

                    if (_response1 != null && _response1.ResponseType == TransactionResponseType.Approved)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                //CSResolve.Resolve<IOrderService>().SaveOrder(orderData.OrderId, _response.TransactionID, _response.AuthCode, 7);

                return false;
            }
            else if (_response != null && _response.ResponseType == TransactionResponseType.Approved)
            {
                //CSResolve.Resolve<IOrderService>().SaveOrder(orderData.OrderId, _response.TransactionID, _response.AuthCode, 4);
                return true;
            }

            return true;


        }

        public static bool RefundOrderWithPayPalExpressCheckout(int orderID,Hashtable RequestData, out Hashtable ResponseData)
        {
            string strMethod = "";
            string strInvoiceNumber = "";
            string strToken = "";
            Request _request = new Request();
            if (RequestData != null)
            {
                if (RequestData.ContainsKey("Method"))
                {
                    strMethod = RequestData["Method"].ToString();
                }
                if (RequestData.ContainsKey("InvoiceNumber"))
                {
                    strInvoiceNumber = RequestData["InvoiceNumber"].ToString();
                }
                if (RequestData.ContainsKey("Token"))
                {
                    strToken = RequestData["Token"].ToString().Trim();
                }
            }
            
            
            
            _request.AdditionalInfo = RequestData;


            Response _response = PaymentProviderRepository.Instance.Get(PaymentProviderType.PayPalExpressCheckout).PerformRequest(_request);

            ResponseData = _response.AdditionalInfo;

            if (_response.MerchantDefined1 != null)
            {
                ResponseData.Add("RedirectUrl", _response.MerchantDefined1);
            }

            return true;
        }

        public static bool IsCustomerOrderFlowCompleted(int OrderId)
        {
            bool OrderFlowCompleted = false;
            Order orderData = CSResolve.Resolve<IOrderService>().GetOrderDetails(OrderId, true);
            if (!orderData.AttributeValuesLoaded)
                orderData.LoadAttributeValues();

            if (orderData.AttributeValues.ContainsAttribute("OrderFlowCompleted"))
            {
                if (orderData.AttributeValues.GetAttributeValue("OrderFlowCompleted").Value.Equals("1"))
                {
                    OrderFlowCompleted = true;
                }
            }

            return OrderFlowCompleted;
        }

        public static bool IsMainKit()
        {
            bool IsMainKit = false;
            ClientCartContext clientData = (ClientCartContext)HttpContext.Current.Session["ClientOrderData"];

            foreach (Sku sku in clientData.CartInfo.CartItems)
            {
                if (!sku.AttributeValuesLoaded)
                {
                    sku.LoadAttributeValues();
                }

                if (sku.ContainsAttribute("MainKit") && sku.GetAttributeValue<bool>("MainKit", false))
                {
                        IsMainKit = true;
                }


            }

            return IsMainKit;
        }

        public static bool IsOnePay()
        {
            bool IsOnePay = false;
            ClientCartContext clientData = (ClientCartContext)HttpContext.Current.Session["ClientOrderData"];

            foreach (Sku sku in clientData.CartInfo.CartItems)
            {
                if (!sku.AttributeValuesLoaded)
                {
                    sku.LoadAttributeValues();
                }

                if (sku.ContainsAttribute("OnePay") && sku.GetAttributeValue<bool>("OnePay", false))
                {
                    IsOnePay = true;
                }
            }

            return IsOnePay;
        }

        public static bool SendWriteToMikeEmail(string firstName, string lastName, string email, string subject, string message, string schoolName,
            string city, string state, string phoneNumber)
        {
            //pull Specific Email Template            
            EmailSetting emailTemplate = EmailManager.GetEmail(4);

            if (emailTemplate.Body != null)
            {
                try
                {
                    String BodyTemplate = emailTemplate.Body.Replace("&", "&amp;");

                    BodyTemplate = BodyTemplate.Replace("{FIRST_NAME}", firstName);
                    BodyTemplate = BodyTemplate.Replace("{LAST_NAME}", lastName);
                    BodyTemplate = BodyTemplate.Replace("{EMAIL}", email);
                    BodyTemplate = BodyTemplate.Replace("{SCHOOL_NAME}", schoolName);
                    BodyTemplate = BodyTemplate.Replace("{CITY}", city);
                    BodyTemplate = BodyTemplate.Replace("{STATE}", state);
                    BodyTemplate = BodyTemplate.Replace("{PHONE_NUMBER}", phoneNumber);
                    BodyTemplate = BodyTemplate.Replace("{SUBJECT}", subject);
                    BodyTemplate = BodyTemplate.Replace("{MESSAGE}", message);

                    //Prepare Mail Message
                    MailMessage _oMailMessage = new MailMessage(email.Trim().ToLower(), emailTemplate.ToAddress, emailTemplate.Subject, BodyTemplate);
                    _oMailMessage.IsBodyHtml = true;
                    SendMail(_oMailMessage);

                    return true;
                }
                catch (Exception ex)
                {
                    CSCore.CSLogger.Instance.LogException("Error sending email at SendWriteToMikeEmail() method", ex);
                    return false;
                }
            }

            return true;
        }

        public static bool SendWriteToMikeEmailConfirm(string customerEmail, string firstName)
        {
            //pull Specific Email Template            
            EmailSetting emailTemplate = EmailManager.GetEmail(5);

            if (emailTemplate.Body != null)
            {
                try
                {
                    String BodyTemplate = emailTemplate.Body.Replace("&", "&amp;");

                    BodyTemplate = BodyTemplate.Replace("{FIRST_NAME}", firstName);
                    
                    //Prepare Mail Message
                    MailMessage _oMailMessage = new MailMessage(emailTemplate.FromAddress, customerEmail, emailTemplate.Subject, BodyTemplate);
                    _oMailMessage.IsBodyHtml = true;
                    SendMail(_oMailMessage);

                    return true;
                }
                catch (Exception ex)
                {
                    CSCore.CSLogger.Instance.LogException("Error sending email at SendWriteToMikeEmailConfirm() method", ex);

                    return false;
                }
            }

            return true;
        }
        
        
        //Garo: PS redirect  section
        public static void PS_redirect(string page_name)
        {
            SitePreference sitePrefCache = CSFactory.GetCacheSitePref();

            if (sitePrefCache.GetAttributeValue("PS_Redirect_Ver").ToString() != null)
            {
                string redirect_version = sitePrefCache.GetAttributeValue("PS_Redirect_Ver").ToString();
                Page zpage = HttpContext.Current.Handler as Page;
                if (!redirect_version.Equals(""))


                    if (zpage.Request.QueryString.ToString().Length > 0)
                    {
                        zpage.Response.Redirect("https://www.brainetics.com/" + redirect_version + "/" + page_name + "?" + zpage.Request.QueryString);
                    }
                    else
                    {
                        zpage.Response.Redirect("https://www.brainetics.com/" + redirect_version + "/" + page_name);
                    }
            }
        }
        public static string GetCurrentPageName()
        {
            string sPath = System.Web.HttpContext.Current.Request.Url.AbsolutePath;
            System.IO.FileInfo oInfo = new System.IO.FileInfo(sPath);
            string sRet = oInfo.Name;
            return sRet;
        }
         //end of Garo: PS redirect  section


        public static string GetDynamicVersionData(string dataName)
        {
            string radioVersionData = "";
            ClientCartContext context = (ClientCartContext)HttpContext.Current.Session["ClientOrderData"];
            if (context.OrderAttributeValues != null && context.OrderAttributeValues.ContainsKey("DynamicVerionData"))
            {
                radioVersionData = context.OrderAttributeValues["DynamicVerionData"].Value;
            }
            XmlDocument doc = new XmlDocument();
            doc.LoadXml(radioVersionData);
            doc.SelectSingleNode("version");

            string returnData = "";
            switch (dataName)
            {
                case "phone":
                    returnData = doc.SelectSingleNode("Version")["Phone"].InnerText;
                    break;

                case "image1":
                    returnData = doc.SelectSingleNode("Version")["Image1"].InnerText;
                    break;

                case "MainKitBlack":
                    returnData = doc.SelectSingleNode("Version")["MainKitBlack"].InnerText;
                    break;

                case "MainKitDarkGray":
                    returnData = doc.SelectSingleNode("Version")["MainKitDarkGray"].InnerText;
                    break;

                case "MainKitLightGray":
                    returnData = doc.SelectSingleNode("Version")["MainKitLightGray"].InnerText;
                    break;

                case "imageSelector":
                    returnData = doc.SelectSingleNode("Version")["imageSelector"].InnerText;
                    break;

                case "homepageimage":
                    returnData = doc.SelectSingleNode("Version")["Image1"].InnerText;
                    break;

                case "ctaimage":
                    returnData = doc.SelectSingleNode("Version")["Image2"].InnerText;
                    break;

                case "cartimage":
                    returnData = doc.SelectSingleNode("Version")["Image3"].InnerText;
                    break;
            }
            return returnData;
        }

        public static string GetVersionNameByReferrer(ClientCartContext CartContext)
        {
            string versionName = "";
            try
            {
                versionName = HttpContext.Current.Request.Url.Host.ToUpper().Replace("WWW.", "");
                if (CartContext.OrderAttributeValues != null)
                {
                    Uri uri = new Uri(CartContext.OrderAttributeValues["ref_url"].Value);
                    versionName = uri.Host.ToUpper().Replace("WWW.", "");
                    SitePreference sitePrefCache = CSFactory.GetCacheSitePref();
                    if (!sitePrefCache.AttributeValuesLoaded)
                        sitePrefCache.LoadAttributeValues();
                    string[] strRedirectDomains = sitePrefCache.AttributeValues["redirectdomainnames"].Value.ToLower().Split(';');
                    if (strRedirectDomains.Any(versionName.ToLower().Contains))
                    {
                        versionName += "-" + GetDynamicVersionName();
                    }
                    else if (versionName.StartsWith("TRYKYRO.COM"))
                    {
                        versionName = "Direct" + "-" + GetDynamicVersionName();
                    }
                    else
                    {
                        versionName = "Referral-" + GetDynamicVersionName();
                    }
                }
            }
            catch { versionName = "Direct" + "-" + GetDynamicVersionName(); }
            return versionName.ToUpper();
        }

        public static bool SetDynamicLandingPageVersion(string version, ClientCartContext context)
        {
            string radioVersionData = "";
            if (context.OrderAttributeValues != null && context.OrderAttributeValues.ContainsKey("DynamicVerionData"))
            {
                radioVersionData = context.OrderAttributeValues["DynamicVerionData"].Value;
            }
            else
            {
                radioVersionData = DynamicVersionDAL.GetDynamicVersion(version);
                context.OrderAttributeValues.Add("DynamicVerionData", new AttributeValue(radioVersionData));
                HttpContext.Current.Session["ClientOrderData"] = context;
            }
            return true;
        }

        public static string GetDynamicVersionName()
        {
            string strDynamicVersion = "";
            ClientCartContext clientData = (ClientCartContext)HttpContext.Current.Session["ClientOrderData"];
            if (clientData.OrderAttributeValues != null)
            {
                if (clientData.OrderAttributeValues.ContainsKey("DynamicVerionName"))
                {
                    strDynamicVersion = clientData.OrderAttributeValues["DynamicVerionName"].Value;
                }
                else
                {
                    strDynamicVersion = CSBusiness.Web.CSBasePage.GetVersionName();
                }
            }
            return strDynamicVersion.ToUpper();
        }

        public static bool IsMobileBrowser()
        {
            bool result = false;
            try
            {
                string ua = HttpContext.Current.Request.UserAgent.ToLower();
                if (ua != null && (ua.Contains("iphone") || ua.Contains("blackberry") || ua.Contains("android")))
                {
                    result = true;
                }
            }
            catch { }
            return result;
        }

        public static int CountNums(string s)
        {
            string s1 = s;

            int i;
            int j = 0;
            for (i = 0; i < s1.Length; i++)
            {
                if (isnum(s1[i]) == true) { j++; }
            }

            return j;

        }

        public static bool isnum(char c)
        {
            bool b = false;
            if ((((int)c) >= 48) && (((int)c) <= 57)) b = true;
            return b;
        }

        public static bool onlynums(string s)
        {
            string s1 = s;

            int i;
            bool b = true;

            for (i = 0; i < s1.Length; i++)
            {
                if (isnum(s1[i]) != true) { b = false; }
            }

            return b;

        }

        public static string GetCleanPhoneNumber(string phone)
        {
            string result = string.Empty;

            int i = 0;
            if (phone.Length > 0)
            {
                i = CountNums(phone);
            }

            int cnum = 0;

            foreach (char c in phone)
            {
                cnum++;
                if (!((i > 10) && (cnum == 1) && (c == '1')))
                {
                    if (char.IsDigit(c))
                        result += c;
                }
            }
            return result;
        }

        public static bool ValidateAddress(string address)
        {
            address = address.ToLower();
            string resultString = Regex.Match(address, @"\d+").Value;
            if (resultString.Length > 0)
                return true;
            return false;
        }

        public static bool ValidatePOBox(string address)
        {
            address = address.ToLower();
            if (address.Contains("box") | address.Contains("p. o.") | address.Contains("p o box") | address.Contains("post office") | address.Contains("p.o") | address.Contains("p.o.") | address.Trim().StartsWith("po"))
            {
                string resultString = Regex.Match(address, @"\d+").Value;
                if (resultString.Length < 2)
                    return false;
            }
            return true;
        }
    }


}
 
