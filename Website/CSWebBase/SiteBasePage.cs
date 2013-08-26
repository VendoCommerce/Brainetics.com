using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CSBusiness.Web;
using CSBusiness;

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

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
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
            }

            return updated;
        }

        public static bool AddIfDoesNotExist(CSBusiness.ShoppingManagement.Cart cart, SkuEnum skuEnum, int quantity)
        {
            cart.AddOrUpdate((int)skuEnum, quantity, true, false, false);
            return true;            
        }
    }
}
