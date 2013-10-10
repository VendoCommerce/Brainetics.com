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
    public partial class productdetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SitePreference sitePrefCache = CSFactory.GetCacheSitePref();

            if (sitePrefCache.GetAttributeValue("PS_Redirect_Ver").ToString() != null)
            {
                string redirect_version = sitePrefCache.GetAttributeValue("PS_Redirect_Ver").ToString();
                if (!redirect_version.Equals(""))
                    if (Request.QueryString.ToString().Length > 0)
                    {
                        Response.Redirect("https://Brainetics.com/" + redirect_version + "/" + GetCurrentPageName() + "?" + Request.QueryString);
                    }
                    else
                    {
                        Response.Redirect("https://Brainetics.com/" + redirect_version + "/" + GetCurrentPageName());
                    }
            }


        }
        public string GetCurrentPageName()
        {
            string sPath = System.Web.HttpContext.Current.Request.Url.AbsolutePath;
            System.IO.FileInfo oInfo = new System.IO.FileInfo(sPath);
            string sRet = oInfo.Name;
            return sRet;
        }
    }
}