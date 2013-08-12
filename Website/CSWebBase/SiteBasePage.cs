using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CSBusiness.Web;

namespace CSWebBase
{
    public class SiteBasePage : CSBasePage
    {
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
    }
}
