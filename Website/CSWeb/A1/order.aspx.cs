using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using CSWeb.A1.UserControls;
using System.IO;
using System.Web.Script.Serialization;
using System.Collections.Specialized;

namespace CSWeb.A1
{
    public partial class order : CSWebBase.SiteBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
        }

        //[WebMethod]
        //public static string validateInputAjax()
        //{

        //    return CSWebBase.ValidationHelper.validateInputAjax(new order().Page.Form);
        //}
    }
}