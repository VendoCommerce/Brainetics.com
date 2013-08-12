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

namespace CSWeb.A3.Store
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
                if (Request.Headers["X-HTTPS"] != null)
                {
                    if (Request.Headers["X-HTTPS"].ToLower().Equals("no"))
                    {
                        if (Request.Url.ToString().Contains("www"))
                        {
                            Response.Redirect((Request.Url.ToString().Replace("http:/", "https:/").Replace("index.aspx", "")));
                        }
                        else
                        {
                            Response.Redirect((Request.Url.ToString().Replace("http:/", "https:/").Replace("https://", "https://www.").Replace("index.aspx", "")));
                        }
                    }
                }

            }

        }

        protected void lbOrderNow_Click(object sender, EventArgs e)
        {
            ClientCartContext cartContext = ClientOrderData;

            cartContext.CartInfo.AddOrUpdate(44, 1, true, false, false);

            ClientOrderData = cartContext;

            Response.Redirect("Cart.aspx", true);
        }
    }
}