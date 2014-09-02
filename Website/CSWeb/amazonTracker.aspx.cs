using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CSWeb
{
    public partial class amazonTracker : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.AppSettings["client_db"];
            dsClicks.ConnectionString = cs;
            
            dsClicks.InsertParameters["VersionID"].DefaultValue = Request.QueryString["vid"];
            dsClicks.InsertParameters["Url"].DefaultValue = Request.QueryString["url"];
            dsClicks.Insert();
            Response.Redirect(Request.QueryString["url"]);
        }
    }
}