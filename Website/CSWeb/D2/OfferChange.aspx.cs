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

namespace CSWeb.D2.Store
{
    public partial class OfferChange : SiteBasePage
    {
       protected RadioButtonList rblPaymentOption;
        protected CSWeb.D2.UserControls.ShippingCreditForm bcfBillingCreditInfo;
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
        }

        protected void BindSkus(object sender, EventArgs e)
        {
            if (rblPaymentOption.SelectedValue.Equals("same"))
            {
                
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
                }

                int pid2 = 0;

                if (clientData.CustomerInfo.ShippingAddress.CountryId == 46) // Canada
                {
                    pid2 = 127;
                }
                else if (clientData.CustomerInfo.ShippingAddress.CountryId == 231) //US
                {
                    if (clientData.CustomerInfo.ShippingAddress.StateProvinceId == 1 ||
                            clientData.CustomerInfo.ShippingAddress.StateProvinceId == 389 ||
                            clientData.CustomerInfo.ShippingAddress.StateProvinceId == 388 ||
                            clientData.CustomerInfo.ShippingAddress.StateProvinceId == 11 ||
                            clientData.CustomerInfo.ShippingAddress.StateProvinceId == 390)
                    {
                        pid2 = 127;
                    }
                }
                if (pid2 > 0)
                {
                    clientData.CartInfo.AddOrUpdate(pid2, 1, false, false, false);

                }
                clientData.CartInfo.Compute();

               

            }

            Page.ClientScript.RegisterStartupScript(this.GetType(), "close", "<script language=javascript>parent.jQuery.fancybox.close();</script>");



           


        }


    }
}