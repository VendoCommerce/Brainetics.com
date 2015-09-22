using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CSWeb.PS_M2
{
    public partial class receipt : CSWebBase.SiteBasePage
    {
        protected override bool SkipCartInitialization
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