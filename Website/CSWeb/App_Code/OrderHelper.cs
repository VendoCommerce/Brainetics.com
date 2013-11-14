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
            _request.Amount = cardCheckOnly ? (double)1.00 : (double)orderData.Total;
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

            
            if (emailTemplate.Body != null)
            {
                //Subject Translation
                emailTemplate.Subject = emailTemplate.Subject.Replace("{ORDER_NUMBER}", orderData.OrderId.ToString());

                //Body Translation
                String BodyTemplate = emailTemplate.Body.Replace("&", "&amp;");

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

        public static bool AuthorizeOrderWithPayPalExpressCheckout(ClientCartContext context, Hashtable RequestData, out Hashtable ResponseData)
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
                        RequestData["PAYMENTREQUEST_0_SHIPPINGAMT"] = context.CartInfo.ShippingCost.ToString("N2");
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
                        RequestData["PAYMENTREQUEST_0_SHIPPINGAMT"] = context.CartInfo.ShippingCost.ToString("N2");
                        RequestData["PAYMENTREQUEST_0_TAXAMT"] = context.CartInfo.TaxCost.ToString("N2");
                        _request.InvoiceNumber = strInvoiceNumber;
                        //Save the AUTHCODE, TRANSACTION CODE.
                        break;
                    }

            }





            _request.AdditionalInfo = RequestData;


            Response _response = PaymentProviderRepository.Instance.Get(PaymentProviderType.PayPalExpressCheckout).PerformRequest(_request);

            //#region Log Request/Response
            //try
            //{
            //    Dictionary<string, AttributeValue> orderAttributes = new Dictionary<string, AttributeValue>();
            //    string logRequest = _response.GatewayRequestRaw; // TODO: we are not capturing this in base. Once updated there, we will begin saving request as well as response.
            //    string logResponse = _response.GatewayResponseRaw;

            //    // the attributes we save to depends on the type of call
            //    if (RequestData.ContainsKey("ActionType") && RequestData["ActionType"].ToString() == "SetPaymentOptions")
            //    {
            //        orderAttributes.Add("PayPalSetPaymentRequest", new CSBusiness.Attributes.AttributeValue(logRequest));
            //        orderAttributes.Add("PayPalSetPaymentResponse", new CSBusiness.Attributes.AttributeValue(logResponse));
            //    }
            //    else if (RequestData.ContainsKey("ActionType") && RequestData["ActionType"].ToString() == "GetShippingAddresses")
            //    {
            //        orderAttributes.Add("PayPalGetAddrRequest", new CSBusiness.Attributes.AttributeValue(logRequest));
            //        orderAttributes.Add("PayPalGetAddrResponse", new CSBusiness.Attributes.AttributeValue(logResponse));
            //    }
            //    else
            //    {
            //        orderAttributes.Add("PayPalRequest", new CSBusiness.Attributes.AttributeValue(logRequest));
            //        orderAttributes.Add("PayPalResponse", new CSBusiness.Attributes.AttributeValue(logResponse));
            //    }

            //    CSResolve.Resolve<IOrderService>().UpdateOrderAttributes(orderData.OrderId, orderAttributes, null);
            //}
            //catch (Exception ex)
            //{
            //    CSCore.CSLogger.Instance.LogException(ex.Message, ex.InnerException);
            //}

            //#endregion

            ResponseData = _response.AdditionalInfo;

            if (_response.MerchantDefined1 != null)
            {
                ResponseData.Add("RedirectUrl", _response.MerchantDefined1);
            }

            return true;
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
    }


}
 
