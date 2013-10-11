using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CSBusiness.Preference;
using CSBusiness;


namespace CSWeb.PS
{
    public partial class contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string page_name = OrderHelper.GetCurrentPageName();
            OrderHelper.PS_redirect(page_name);


        }
        
    }
}