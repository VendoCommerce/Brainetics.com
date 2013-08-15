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
            Surcharge = 58
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
    }
}
