using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using CSBusiness.Resolver;
using System.Configuration;
using CSBusiness;
using CSBusiness.Preference;
using System.Xml;



namespace CSWeb
{
    public class Global : CSBusiness.Web.CSBaseGlobal
    {

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            //SitePreference sitePref = CSFactory.GetCacheSitePref();
            ////if (!sitePref.AttributeValuesLoaded) 
            //    sitePref.LoadAttributeValues();
            //if (sitePref.ContainsAttribute("redirecturls"))
            //{
            //    string redirectUrl = RedirectToUrls(sitePref.AttributeValues["redirecturls"].Value);
            //    if (redirectUrl.Length > 0)
            //        Response.Redirect(redirectUrl);
            //}
        }

        //private string RedirectToUrls(string xmlUrls)
        //{
        //    XmlDocument doc = new XmlDocument();
        //    doc.LoadXml(xmlUrls);
        //    string host = doc.ChildNodes[0].Attributes["redirectUrl"].Value;
        //    XmlNodeList xnResults = doc.SelectNodes("/Url/Redirect");
        //    foreach (XmlNode node in xnResults)
        //    {
        //        if (Request.Url.AbsoluteUri.EndsWith (node.Attributes["originalVersion"].Value))
        //            return Request.Url.AbsoluteUri.Replace(Request.Url.Host+ node.Attributes["originalVersion"].Value ,string.Format("{0}{1}",host,node.Attributes["originalVersion"].Value ));
        //    }

        //    return string.Empty;
        //}
    }
}
