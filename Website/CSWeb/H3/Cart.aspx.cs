using System;
using System.Text;
using CSCore;
using CSCore.Utils;
using CSBusiness.Preference;
using CSBusiness;
using System.Web;

namespace CSWeb.H3.Store
{
    public partial class cart : CSWebBase.SiteBasePage
    {
        public override bool EnableEmptySessionRedirect
        {
            get
            {
                return false;
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
        }
    }
}