using System;
using System.Collections.Generic;
using System.Text;
using System.Web.UI.WebControls;
using CSBusiness.OrderManagement;
using CSBusiness.Resolver;
using CSBusiness.ShoppingManagement;
using CSCore;
using CSCore.Utils;
using CSBusiness.Preference;
using CSBusiness;
using System.Web;
using CSWebBase;

namespace CSWeb.Mobile_NATIVE.Store
{
    public partial class OfferChange : SiteBasePage
    {
       protected RadioButtonList rblPaymentOption;
        
        protected override void Page_Load(object sender, EventArgs e)
        {
            // base.Page_Load(sender, e);
        }

        protected override bool SkipCartInitialization
        {
            get
            {
                return Request.QueryString["ppsend"] == "1" || Request.QueryString["ppsubmit"] == "1" || Request.QueryString["Token"] != null || Request.QueryString["PayerID"] != null;
            }
        }

        protected void BindSkus(object sender, EventArgs e)
        {
            if (rblPaymentOption.SelectedValue.Equals("same"))
            {
                Session["showpopup"] = "false";
            }
            else
            {
                ClientCartContext clientData = (ClientCartContext)Session["ClientOrderData"];
                List<string> skuRemove = new List<string>();
                List<string> skuAdd = new List<string>();
                if (clientData.CartInfo.ItemCount > 0)
                {
                    foreach(Sku s in clientData.CartInfo.CartItems)
                    {
                     
                        if (!s.AttributeValuesLoaded)
                        {
                            s.LoadAttributeValues();
                        }

                        if (s.ContainsAttribute("RelatedOnePay"))
                        {
                            if (!s.GetAttributeValue<string>("RelatedOnePay", "0").Equals("0"))
                            {
                                skuAdd.Add(s.GetAttributeValue<string>("RelatedOnePay", "0"));
                                skuRemove.Add(s.SkuId.ToString());
                            }
                        }
                    }
                }

                foreach (string sku in skuAdd)
                {
                    clientData.CartInfo.AddOrUpdate(int.Parse(sku),1,true,false,false);
                }

                foreach (string sku in skuRemove)
                {
                    clientData.CartInfo.RemoveSku(int.Parse(sku));
                    if (clientData.CartInfo.SkuExists(59))
                    {
                        clientData.CartInfo.RemoveSku(59);
                    }
                }

                
                clientData.CartInfo.Compute();

               

            }

            Page.ClientScript.RegisterStartupScript(this.GetType(), "close", "<script language=javascript>parent.jQuery.fancybox.close();</script>");



           


        }


    }
}