using System;
using System.Collections.Generic;
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
using CSData;

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
            ShippingSurcharge = 58
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

        #endregion

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (EnableEmptySessionRedirect)
            {
                if (ClientOrderData == null && string.IsNullOrEmpty(Request.QueryString["emppage"]))
                    Response.Redirect("CheckoutSessionExpired.aspx?emppage=" + HttpUtility.UrlEncode(Request.Url.LocalPath), true);
            }

            base.Page_Load(sender, e);
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

        public static bool AddAdditionalItems(CSBusiness.ShoppingManagement.Cart cart)
        {
            bool updated = false;
            Sku sku;

            // Enhanced Multi Pay
            sku = cart.CartItems.FirstOrDefault(x => { return x.SkuId == (int)SkuEnum.EnhancedMultiPay; });
            if (sku != null) 
            {
                if (AddIfDoesNotExist(cart, SkuEnum.Trial, sku.Quantity))
                    updated = true;

                if (AddIfDoesNotExist(cart, SkuEnum.BrainBoosting, sku.Quantity))
                    updated = true;
            }

            // Accelerated Multi Pay
            sku = cart.CartItems.FirstOrDefault(x => { return x.SkuId == (int)SkuEnum.AcceleratedMultiPay; });
            if (sku != null)
            {
                if (AddIfDoesNotExist(cart, SkuEnum.Trial, sku.Quantity))
                    updated = true;

                if (AddIfDoesNotExist(cart, SkuEnum.BrainBoosting, sku.Quantity))
                    updated = true;

                if (AddIfDoesNotExist(cart, SkuEnum.DigitalPowerLicense, sku.Quantity))
                    updated = true;

                if (AddIfDoesNotExist(cart, SkuEnum.ChallengeGameMultiPay, sku.Quantity))
                    updated = true;

                if (AddIfDoesNotExist(cart, SkuEnum.QuickCardSet, sku.Quantity))
                    updated = true;

                if (AddIfDoesNotExist(cart, SkuEnum.OnlineLanguageBundle, sku.Quantity))
                    updated = true;
            }

            // Enhanced One Pay
            sku = cart.CartItems.FirstOrDefault(x => { return x.SkuId == (int)SkuEnum.EnhancedOnePay; });
            if (sku != null)
            {
                if (AddIfDoesNotExist(cart, SkuEnum.BrainBoosting, sku.Quantity))
                    updated = true;
            }

            // Accelerated One Pay
            sku = cart.CartItems.FirstOrDefault(x => { return x.SkuId == (int)SkuEnum.AcceleratedOnePay; });
            if (sku != null)
            {
                if (AddIfDoesNotExist(cart, SkuEnum.BrainBoosting, sku.Quantity))
                    updated = true;

                if (AddIfDoesNotExist(cart, SkuEnum.DigitalPowerLicense, sku.Quantity))
                    updated = true;

                if (AddIfDoesNotExist(cart, SkuEnum.ChallengeGameSinglePay, sku.Quantity))
                    updated = true;

                if (AddIfDoesNotExist(cart, SkuEnum.QuickCardSet, sku.Quantity))
                    updated = true;

                if (AddIfDoesNotExist(cart, SkuEnum.OnlineLanguageBundle, sku.Quantity))
                    updated = true;
            }

            return updated;
        }

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
            if (CSFactory.GetCacheSitePref().GetAttributeValue("EnableFreeShipMainSku", false))
            {
                cart.DiscountCode = FreeShipDiscountCodeMainSku;
            }

            cart.Compute();
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
    }
}
