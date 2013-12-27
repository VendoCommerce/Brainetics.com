using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CSWeb
{
    public partial class index : CSWebBase.SiteBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            if (Request.QueryString != null && Request.QueryString.ToString().Length > 1)
            {
                 Response.Redirect("/D2?" + Request.QueryString + "&referrer=" + Request.Url);
            }

            else
            
            {
                 Response.Redirect("/D2?referrer=" + Request.Url);
            }

           
        }
    }
}