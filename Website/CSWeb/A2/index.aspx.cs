using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;
using CSCore;
using CSCore.Utils;
using CSBusiness.Preference;
using CSBusiness;
using System.Web;
using CSBusiness.Web;

namespace CSWeb.A2.Store
{
    public partial class index : CSWebBase.SiteBasePage
    {
        protected override bool IsLandingPage
        {
            get
            {
                return true;
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            //Hashtable htAdditinalInfo = new Hashtable();
            //Hashtable htAdditinalInfoResponse = new Hashtable();

            //htAdditinalInfo.Add("TRANSACTIONID", "36088288TD269925W");
            //htAdditinalInfo.Add("REFUNDTYPE", "Full");
            //htAdditinalInfo.Add("Method", "RefundTransaction");
            ////If you comment below 3 credentials then default payments will be used from config. So for testing we can comment it.
            //htAdditinalInfo.Add("APIUser", "aparma_1340123768_biz_api1.conversionsystems.com");
            //htAdditinalInfo.Add("APIPassword", "1340123791");
            //htAdditinalInfo.Add("APISignature", "AFcWxV21C7fd0v3bYYYRCpSSRl31ARlSk0Kjb6YYjKlJqWd0UyNZ.rt5");
            //if (OrderHelper.RefundOrderWithPayPalExpressCheckout(234223,htAdditinalInfo, out htAdditinalInfoResponse))
            if (!Page.IsPostBack)
            {

                SitePreference sitePrefCache = CSFactory.GetCacheSitePref();
                
                if (!sitePrefCache.GeoLocationService)
                {
                    string GeoCoountry = "";
                    GeoCoountry = CommonHelper.GetGeoTargetLocation(CommonHelper.IpAddress(HttpContext.Current));
                    if (GeoCoountry.Equals("canada"))
                    {
                        //Response.Redirect("https://www.plugnsafe.com/canada/?" + Request.QueryString);
                    }
                }
                //if (Request.Headers["X-HTTPS"] != null)
                //{
                //    if (Request.Headers["X-HTTPS"].ToLower().Equals("no"))
                //    {
                //        if (Request.Url.ToString().Contains("www"))
                //        {
                //            Response.Redirect((Request.Url.ToString().Replace("http:/", "https:/").Replace("index.aspx", "")));
                //        }
                //        else
                //        {
                //            Response.Redirect((Request.Url.ToString().Replace("http:/", "https:/").Replace("https://", "https://www.").Replace("index.aspx", "")));
                //        }
                //    }
                //}

            }

        }
    }
}