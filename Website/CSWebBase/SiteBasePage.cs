using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using CSBusiness.Web;
using CSBusiness;
using CSBusiness.Attributes;
using System.Web;
using CSBusiness.PostSale;
using System.Text.RegularExpressions;
using CSBusiness.Resolver;
using CSBusiness.ShoppingManagement;
using CSBusiness.OrderManagement;
using CSBusiness.Preference;
using CSCore.DataHelper;
using CSData;
using CSData.Order;


namespace CSWebBase
{
    public class SiteBasePage : CSBasePage
    {
        public enum SkuEnum
        {
            EnhancedMultiPay = 44,
            EnhancedOnePay = 46,
            AcceleratedMultiPay = 47,
            AcceleratedOnePay = 52,
            Enhanced4OnePayV6 = 71,
            AcceleratedOnePayV6 =75,
            Surcharge = 58,
            Trial = 59,
            BrainBoosting = 45,
            DigitalPowerLicense = 48,
            ChallengeGameSinglePay = 49,
            OnlineLanguageBundle = 50,
            QuickCardSet = 51,
            ChallengeGameMultiPay = 60,
            ShippingRush1 = 57,
            ShippingRush2 = 61,
            ShippingOvernight = 62,
            ShippingSurcharge = 58,
            DestinationReward = 63,
            Enhanced4MultiPay = 64,
            Enhanced4OnePay = 65,
            Accelerated4MultiPay = 66,
            Accelerated4OnePay = 67,
            CinchyGray = 69,
            CinchyPink = 70,
            EnhancedPackageMulti3Pay = 73
        }

        #region Properties

        public int MainSkuAdd
        {
            get
            {
                return Convert.ToInt32(Session["MainSkuAdd"] ?? "0");
            }
            set
            {
                Session["MainSkuAdd"] = value;
            }
        }

        public virtual bool EnableEmptySessionRedirect
        {
            get
            {
                return false;
            }
        }

        protected int SessionExpireRedirectSeconds
        {
            get
            {
                return 4;
            }
        }

        protected string LinkFromSessExpPage
        {
            get
            {
                return "index.aspx?sessexp=true";
            }
        }

        public static string FreeShipDiscountCodeMainSku
        {
            get
            {
                return "FREESHIP468651384";
            }
        }

        public ClientCartContext CartContext
        {
            get
            {
                return HttpContext.Current.Session["ClientOrderData"] != null ? HttpContext.Current.Session["ClientOrderData"] as ClientCartContext : null;
            }
            set { HttpContext.Current.Session["ClientOrderData"] = value; }
        }

        #endregion

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (EnableEmptySessionRedirect)
            {
                if (ClientOrderData == null && string.IsNullOrEmpty(Request.QueryString["emppage"]))
                    Response.Redirect("CheckoutSessionExpired.aspx?emppage=" + HttpUtility.UrlEncode(Request.Url.LocalPath), true);
            }

            base.Page_Load(sender, e);

            if (!Page.IsPostBack)
                DoDeviceRedirect(ClientOrderData.VersionId);

            AbTestingVersionUpdate updateVersionInfo = new AbTestingVersionUpdate();
            updateVersionInfo.LoadScripts(Page);
            updateVersionInfo.UpdateVersionNameWhileAbTesting();            
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);


        }

        protected override ClientCartContext GetSiteInitializedCart(ClientCartContext cart)
        {
            try
            {
                cart.OrderAttributeValues.AddOrUpdateAttributeValue("UserAgent", new AttributeValue(Request.UserAgent));
                cart.OrderAttributeValues.AddOrUpdateAttributeValue("SessionId", new AttributeValue(Session.SessionID));                
            }
            catch
            {
            }

            return cart;
        }

        public static bool IsMainSku(int skuId)
        {
            switch ((SkuEnum)skuId)
            {
                case SkuEnum.AcceleratedMultiPay:
                case SkuEnum.AcceleratedOnePay:
                case SkuEnum.EnhancedMultiPay:
                case SkuEnum.EnhancedOnePay:
                case SkuEnum.Accelerated4MultiPay:
                case SkuEnum.Accelerated4OnePay:
                case SkuEnum.Enhanced4MultiPay:
                case SkuEnum.Enhanced4OnePay:
                case SkuEnum.EnhancedPackageMulti3Pay:
                    return true;
            }

            return false;
        }

        public static bool IsKitBundleItem(int skuId)
        {
            switch ((SkuEnum)skuId)
            {
                case SkuEnum.Trial:
                case SkuEnum.BrainBoosting:
                case SkuEnum.DigitalPowerLicense:
                case SkuEnum.ChallengeGameMultiPay:
                case SkuEnum.QuickCardSet:
                case SkuEnum.ChallengeGameSinglePay:
                case SkuEnum.OnlineLanguageBundle:
                case SkuEnum.DestinationReward:
                    return true;
            }

            return false;
        }

        public static bool IsShippingSku(Sku sku)
        {
            if (!sku.AttributeValuesLoaded)
            {
                sku.LoadAttributeValues();
            }

            return sku.GetAttributeValue("ShippingSku", false);
        }

        public static bool IsRushSku(Sku sku)
        {
            if (!sku.AttributeValuesLoaded)
                sku.LoadAttributeValues();

            return sku.GetAttributeValue("RushSku", false);
        }

        //public static bool AddAdditionalItems(CSBusiness.ShoppingManagement.Cart cart)
        //{
            
        //    bool updated = false;
        //    Sku sku;

        //    // Enhanced Multi Pay
        //    sku = cart.CartItems.FirstOrDefault(x => { return (x.SkuId == (int)SkuEnum.EnhancedMultiPay) || (x.SkuId == (int)SkuEnum.Enhanced4MultiPay); });
        //    if (sku != null) 
        //    {
        //        if (AddIfDoesNotExist(cart, SkuEnum.Trial, sku.Quantity))
        //            updated = true;

        //        if (AddIfDoesNotExist(cart, SkuEnum.BrainBoosting, sku.Quantity))
        //            updated = true;
        //    }

        //    // Accelerated Multi Pay
        //    sku = cart.CartItems.FirstOrDefault(x => { return (x.SkuId == (int)SkuEnum.AcceleratedMultiPay) || (x.SkuId == (int)SkuEnum.Accelerated4MultiPay); });
        //    if (sku != null)
        //    {
        //        if (AddIfDoesNotExist(cart, SkuEnum.Trial, sku.Quantity))
        //            updated = true;

        //        if (AddIfDoesNotExist(cart, SkuEnum.BrainBoosting, sku.Quantity))
        //            updated = true;

        //        if (AddIfDoesNotExist(cart, SkuEnum.DigitalPowerLicense, sku.Quantity))
        //            updated = true;

        //        if (AddIfDoesNotExist(cart, SkuEnum.ChallengeGameMultiPay, sku.Quantity))
        //            updated = true;

        //        if (AddIfDoesNotExist(cart, SkuEnum.QuickCardSet, sku.Quantity))
        //            updated = true;

        //        if (AddIfDoesNotExist(cart, SkuEnum.OnlineLanguageBundle, sku.Quantity))
        //            updated = true;
        //    }

        //    // Enhanced One Pay
        //    sku = cart.CartItems.FirstOrDefault(x => { return (x.SkuId == (int)SkuEnum.EnhancedOnePay) || (x.SkuId == (int)SkuEnum.Enhanced4OnePay); });
        //    if (sku != null)
        //    {
        //        if (AddIfDoesNotExist(cart, SkuEnum.BrainBoosting, sku.Quantity))
        //            updated = true;
        //    }

        //    // Accelerated One Pay
        //    sku = cart.CartItems.FirstOrDefault(x => { return (x.SkuId == (int)SkuEnum.AcceleratedOnePay) || (x.SkuId == (int)SkuEnum.Accelerated4OnePay); });
        //    if (sku != null)
        //    {
        //        if (AddIfDoesNotExist(cart, SkuEnum.BrainBoosting, sku.Quantity))
        //            updated = true;

        //        if (AddIfDoesNotExist(cart, SkuEnum.DigitalPowerLicense, sku.Quantity))
        //            updated = true;

        //        if (AddIfDoesNotExist(cart, SkuEnum.ChallengeGameSinglePay, sku.Quantity))
        //            updated = true;

        //        if (AddIfDoesNotExist(cart, SkuEnum.QuickCardSet, sku.Quantity))
        //            updated = true;

        //        if (AddIfDoesNotExist(cart, SkuEnum.OnlineLanguageBundle, sku.Quantity))
        //            updated = true;
        //    }

        //    return updated;
        //}

        public static bool AddIfDoesNotExist(CSBusiness.ShoppingManagement.Cart cart, SkuEnum skuEnum, int quantity)
        {
            cart.AddOrUpdate((int)skuEnum, quantity, true, false, false);
            return true;            
        }

        public static bool IsPOBoxAddress(string address)
        {
            Regex regex = new Regex("^((\\s{0,}p\\.{0,}o\\.{0,}\\s{0,})|(post\\s{1,}office\\s{1,}))?(box)\\s{1,}\\#?[0-9]{1,}\\s{0,}$", RegexOptions.IgnoreCase);

            return regex.IsMatch(address.ToLower());
        }

        public static bool CanUseTemplate(Template template, ClientCartContext cartContext)
        {
            if (template.Items.FirstOrDefault(x => { return x.TypeId == TemplateItemTypeEnum.ListItems 
                && IsRushSku(CSResolve.Resolve<ISkuService>().GetSkuByID(x.SkuId)); }) != null)
            {
                // Don't show template for PO box shipping address
                return !IsPOBoxAddress(cartContext.CustomerInfo.ShippingAddress.Address1 + " " + cartContext.CustomerInfo.ShippingAddress.Address2)
                    && template.CanUseTemplate(cartContext);
            }
            else
                return template.CanUseTemplate(cartContext);
        }



















        public static void CallCartCompute(Cart cart)
        {
            try
            {
                /*
                 * // Use for logging
                if (CSFactory.GetCacheSitePref().GetAttributeValue("EnableFreeShipMainSku", false))
                {
                }
                else
                {
                    CSCore.CSLogger.Instance.LogException("EnableFreeShipMainSku is not set", new Exception("custom error"));

                    CSCore.CSLogger.Instance.LogException("CSFactory.GetCacheSitePref().VersionItems: " + (CSFactory.GetCacheSitePref().VersionItems == null).ToString(), new Exception("custom error"));

                    if (CSFactory.GetCacheSitePref().VersionItems == null)
                    {
                        CSCore.CSLogger.Instance.LogException("CSFactory.GetCacheSitePref().VersionItems.Count: " + (CSFactory.GetCacheSitePref().VersionItems.Count).ToString(), new Exception("custom error"));
                    }

                    CSCore.CSLogger.Instance.LogException("CSFactory.GetCacheSitePref().AttributeValues: " + (CSFactory.GetCacheSitePref().AttributeValues == null).ToString(), new Exception("custom error"));

                    CSCore.CSLogger.Instance.LogException("CSFactory.GetCacheSitePref().AttributeValuesLoaded: " + (CSFactory.GetCacheSitePref().AttributeValuesLoaded).ToString(), new Exception("custom error"));

                    if (CSFactory.GetCacheSitePref().AttributeValues != null)
                    {
                        CSCore.CSLogger.Instance.LogException("CSFactory.GetCacheSitePref().AttributeValues.Count: " + (CSFactory.GetCacheSitePref().AttributeValues.Count).ToString(), new Exception("custom error"));
                    }
                }
                */
                SitePreference sitePreference = CSFactory.GetCacheSitePref();

          
          
                sitePreference.LoadAttributeValues();
                if (sitePreference.AttributeValuesLoaded && sitePreference.ContainsAttribute("AutoDiscountCode"))
                {
                    if (sitePreference.GetAttributeValue("AutoDiscountCode") != null)



                    {
                        cart.DiscountCode = sitePreference.GetAttributeValue("AutoDiscountCode");
                       cart.Compute();

                    








                    }
                }
            
                }











            catch (Exception ex)
            {
                CSCore.CSLogger.Instance.LogException("Error logging tests", ex);
            }
        }

        public static bool IsFreeShipOrderMainSku(int orderId)
        {
            string discountCode = DAL.GetOrderPromo(orderId);
            if (discountCode != null && discountCode.ToUpper() == FreeShipDiscountCodeMainSku)
            {
                return true;
            }

            return false;
        }

        public static bool IsFreeShipOrderMainSku(Cart cart)
        {
            if (cart.DiscountCode != null && cart.DiscountCode.ToUpper() == FreeShipDiscountCodeMainSku)












            {
                return true;

















            }



            return false;
        }

        public static decimal GetMainSkuShippingCost(Cart cart)
        {
            decimal shippingCost = 0;            
            List<SkuShipping> skuShippingList = ShippingDAL.GetSkuShipping();

            SitePreference sitePreference = CSFactory.GetCartPrefrence(cart);
            if (sitePreference != null)
            {
                foreach (Sku sku in cart.CartItems)
                {
                    if (SiteBasePage.IsMainSku(sku.SkuId))
                    {
                        CSData.SkuShipping skuShipping = skuShippingList.FirstOrDefault(x =>
                        {
                            return x.PrefId == sitePreference.ShippingPrefID
                                && x.SkuId == sku.SkuId;
                        });

                        if (skuShipping != null)
                        {
                            shippingCost += (skuShipping.Cost * sku.Quantity);                            
                        }
                    }
                }
            }

            return shippingCost;
            // TODO: add rush sku cost support
        }

        public static decimal GetShippingCost(Cart cart)
        {
            if (CSWebBase.SiteBasePage.IsFreeShipOrderMainSku(cart))
            {
                return cart.ShippingCost - cart.DiscountAmount;
            }

            return cart.ShippingCost;
        }

        public static decimal GetShippingCost(Order order)
        {
            if (CSWebBase.SiteBasePage.IsFreeShipOrderMainSku(order.OrderId))




            {
                return order.ShippingCost - order.DiscountAmount;

















            }









            return order.ShippingCost;
        }

        public static void TempOrderFix(ClientCartContext cartContext, int orderStatusId)
        {
            try
            {
                // TODO: check site pref attribute "EnableFreeShipMainSku" too -- this is a temp fix.            
                if (cartContext != null)
                {
                    /*/
                     * NOTE: This is a temporary fix that needs to be taken out when modifying promo codes.
                     * */
                    if (string.IsNullOrEmpty(cartContext.CartInfo.DiscountCode))
                    {
                        CSCore.CSLogger.Instance.LogException(string.Format("Promo code was blank. EnableFreeShipMainSku = {0}",
                                CSFactory.GetCacheSitePref().GetAttributeValue("EnableFreeShipMainSku", false).ToString()),
                            new Exception("custom error"));
                    
                        cartContext.CartInfo.DiscountCode = FreeShipDiscountCodeMainSku;
                        cartContext.CartInfo.Compute();

                        CSResolve.Resolve<IOrderService>().UpdateOrder(cartContext.OrderId, cartContext);

                        try
                        {
                            CSResolve.Resolve<IOrderService>().UpdateOrderStatus(cartContext.OrderId, orderStatusId);
                        }
                        catch (Exception ex)
                        {
                            CSCore.CSLogger.Instance.LogException("Could not update orderstatus after updating order. orderId " + cartContext.OrderId.ToString(),
                                  new Exception("custom error"));
                        }
                    }
                }
                else
                {
                    // We are here when batch processes orders. No need to log.
                    //CSCore.CSLogger.Instance.LogException("Cart context was null. Could not fix and and recalculate", new Exception("custom error"));
                }
            }
            catch (Exception ex)            
            {
                CSCore.CSLogger.Instance.LogException("TempOrderFix method failure", ex);
            }
        }

        private void DoDeviceRedirect(int currentVersionId)
        {
            if (!Page.IsPostBack)
            {
                //ignore redirection for rem_a2 version
                if (Request.Url.AbsoluteUri.ToLower().Contains("/rem_a2")) return;

                if (ClientDeviceType == CSBusiness.Enum.DeviceType.Mobile)
                {
                    CSBusiness.Version currentVersion = (CSFactory.GetCacheSitePref()).VersionItems.FirstOrDefault(x => { return x.VersionId == currentVersionId; });

                    if (currentVersion != null && !currentVersion.Title.ToUpper().Contains("MOBILE")) // mobile device not viewing the mobile version
                    {
                        if (Request.QueryString.Count > 0)
                            Response.Redirect("/MOBILE_B2?" + Request.QueryString, true);
                        else
                            Response.Redirect("/MOBILE_B2", true);
                    }
                    else if (currentVersion == null)
                    {
                        CSCore.CSLogger.Instance.LogException("No version found given current version Id. DoDeviceRedirect of sitebasepage.", new Exception("Currentversion null"));
                    }
                }
            }
        }

        public SqlDataReader GetOrderBookSummary(DateTime? startDate, DateTime? endDate, int versionId, int pathId)
        {
            return GetOrderBookRebateSummary(startDate, endDate, versionId, pathId);
        }


        public static SqlDataReader GetOrderBookRebateSummary(DateTime? startDate, DateTime? endDate, int versionId, int pathId)
        {
            string connectionString = ConfigHelper.GetDBConnection();
            String ProcName = "pr_report_order_rebate";
            SqlParameter[] ParamVal = new SqlParameter[4];
            ParamVal[0] = new SqlParameter("@startDate", startDate);
            ParamVal[1] = new SqlParameter("@endDate", endDate);
            ParamVal[2] = new SqlParameter("@version", versionId);
            ParamVal[3] = new SqlParameter("@pathId", pathId);
            return BaseSqlHelper.ExecuteReader(connectionString, ProcName, ParamVal);
        }
    }
}

