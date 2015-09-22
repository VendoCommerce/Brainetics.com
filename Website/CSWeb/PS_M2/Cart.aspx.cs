using System;
using System.Text;
using CSCore;
using CSCore.Utils;
using CSBusiness.Preference;
using CSBusiness;
using System.Web;

namespace CSWeb.PS_M2.Store
{
    public partial class cart : CSWebBase.SiteBasePage
    {
        public override bool EnableEmptySessionRedirect
        {
            get
            {
                return true;
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
        }
    }
}