﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CSBusiness;
using CSBusiness.ShoppingManagement;
using CSBusiness.CustomerManagement;
using CSBusiness.Resolver;
using CSBusiness.OrderManagement;
using CSWeb.Store;
using CSCore.DataHelper;

namespace CSWeb.Store
{
    public partial class AddProduct : System.Web.UI.Page
    {
        protected int skuId, cId, dId=0, qId=1;
        protected Cart cartObject;
        public ClientCartContext clientData;
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if(!Page.IsPostBack)
            {
                if (Request.Params["PId"] != null)
                    skuId = Convert.ToInt32(Request.Params["PId"]);

                if(Request.Params["CId"] != null)
                    cId = Convert.ToInt32(Request.Params["CId"]);

                if (Request.Params["DId"] != null)
                    dId = Convert.ToInt32(Request.Params["DId"]);

                if (Request.Params["QId"] != null)
                    qId = Convert.ToInt32(Request.Params["QId"]);

                if(skuId > 0)
                {
                    
                    if (cId == (int)ShoppingCartType.SingleCheckout)
                    {
                        clientData = (ClientCartContext)Session["ClientOrderData"];
                        cartObject = clientData.CartInfo;
                        cartObject.AddItem(skuId, qId, true, false);
                        if (dId > 0)
                        {
                            bool settingVal = Convert.ToBoolean(ConfigHelper.ReadAppSetting("DisCountCardDisplay", "false"));
                            cartObject.AddItem(dId, qId, settingVal, false);
                        }

                        //CSWebBase.SiteBasePage.AddAdditionalItems(clientData.CartInfo);

                        cartObject.ShippingAddress = clientData.CustomerInfo.BillingAddress;
                        cartObject.Compute();
                        cartObject.ShowQuantity = false;
                        clientData.CartInfo = cartObject;

                        if (CSFactory.OrderProcessCheck() == (int)OrderProcessTypeEnum.InstantOrderProcess)
                        {   
                            int orderId = CSResolve.Resolve<IOrderService>().SaveOrder(clientData);

                            clientData.OrderId = orderId;
                            //clientData.ResetData();
                                                        
                            Session["ClientOrderData"] = clientData;
                        }

                        Response.Redirect("PostSale.aspx");

                        //Response.Redirect("AuthorizeOrder.aspx?card_check=1", true); // When we hit this page, we need to do a $1 test charge only to see if card is valid before going to postsale (upsells). 
                    }
                    else if(cId == (int)ShoppingCartType.ShippingCreditCheckout)
                    {
                        clientData = (ClientCartContext)Session["ClientOrderData"];
                        cartObject = new Cart();
                        cartObject.AddItem(skuId, qId, true, false);
                        if (dId > 0)
                        {
                            bool settingVal = Convert.ToBoolean(ConfigHelper.ReadAppSetting("DisCountCardDisplay", "false"));
                            cartObject.AddItem(dId, qId, settingVal, false);
                        }
                        cartObject.ShippingAddress = clientData.CustomerInfo.BillingAddress;
                        cartObject.Compute();
                        cartObject.ShowQuantity = false;
                        clientData.CartInfo = cartObject;
                        Session["ClientOrderData"] = clientData;
                        Response.Redirect("cart.aspx");
                    }

                    else
                    {

                        //we may set this object in index page to capture request information
                        if (Session["ClientOrderData"] == null)
                        {
                            clientData = new ClientCartContext();
                            clientData.CartInfo = new Cart();
                        }
                        else
                        {
                            clientData = (ClientCartContext)Session["ClientOrderData"];
                            if(clientData.CartInfo == null)
                                clientData.CartInfo = new Cart();
                        }

                        clientData.CartInfo.AddItem(skuId, qId, true, false);
                        if (dId > 0)
                        {
                            bool settingVal = Convert.ToBoolean(ConfigHelper.ReadAppSetting("DisCountCardDisplay", "false"));
                            cartObject.AddItem(dId, qId, settingVal, false);
                        }
                        clientData.CartInfo.Compute();
                        clientData.CartInfo.ShowQuantity = false;
                
                        Session["ClientOrderData"] = clientData;
                        Response.Redirect("ShoppingCartV4.aspx");
                    }
                    
                }
                
                
            }
        }
    }
}

