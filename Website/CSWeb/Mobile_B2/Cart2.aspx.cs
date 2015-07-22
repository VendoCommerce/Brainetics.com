using System;
using System.Text;
using CSCore;
using CSCore.Utils;
using CSBusiness.Preference;
using CSBusiness;
using System.Web;
using CSWebBase;

namespace CSWeb.Mobile_B2.Store
{
    public partial class cart2 : SiteBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            OrderHelper.SetDynamicLandingPageVersion("mobile", (ClientCartContext)Session["ClientOrderData"]);

        }

        public string GetCleanPhoneNumber(string data)
        {
            return OrderHelper.GetCleanPhoneNumber(data);
        }
        protected override bool SkipCartInitialization
        {
            get
            {
                return Request.QueryString["ppsend"] == "1" || Request.QueryString["ppsubmit"] == "1" || Request.QueryString["Token"] != null || Request.QueryString["PayerID"] != null;
            }
        }


        public string GetDynamicVersionData(string data)
        {
            return OrderHelper.GetDynamicVersionData(data);
        }
    }
}