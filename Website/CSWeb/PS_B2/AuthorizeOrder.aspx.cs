using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using CSBusiness.PostSale;
using CSBusiness;
using System.Text.RegularExpressions;
using CSCore.Utils;
using CSBusiness.OrderManagement;
using CSBusiness.Resolver;
using CSBusiness.ShoppingManagement;
using CSBusiness.Attributes;

namespace CSWeb.PS_B2.Store
{
    public partial class AuthorizeOrder : ShoppingCartBasePage
    {

        int orderId = 0;
        private ClientCartContext CartContext
        {
            get
            {
                return Session["ClientOrderData"] as ClientCartContext;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            string[] parts = Request.Url.AbsolutePath.Split(new char[] { '/' }, StringSplitOptions.RemoveEmptyEntries);
            if (Request["oid"] != null)
            {
                orderId = Convert.ToInt32(Request["oid"].ToString());
            }
            else
            {
                orderId = CartContext.OrderId;
            }
            Order orderData = CSResolve.Resolve<IOrderService>().GetOrderDetails(orderId, true);
            if (orderData.OrderStatusId == 2)
            {
                // this means that  customer clicked back, so should be directed to receipt page.
                Response.Redirect("receipt.aspx");
            }
            if (!IsPostBack)
            {
                CSWebBase.SiteBasePage.TempOrderFix(CartContext, orderData.OrderStatusId);

                Dictionary<string, AttributeValue> orderAttributes = new Dictionary<string, AttributeValue>();

                if (orderData.CreditInfo.CreditCardNumber.Equals("4444333322221111"))
                {
                    CSResolve.Resolve<IOrderService>().UpdateOrderAttributes(orderData.OrderId, orderAttributes, 7);

                    Response.Redirect("receipt.aspx");
                }
                else if (orderData.CreditInfo.CreditCardNumber.Equals("4111111111111111") && !orderData.CreditInfo.CreditCardCSC.Equals("999"))
                {
                    CSResolve.Resolve<IOrderService>().UpdateOrderAttributes(orderData.OrderId, orderAttributes, 7);

                    Response.Redirect(string.Format("carddecline.aspx?returnUrl={0}", string.Concat("/", string.Join("/", parts, 0, parts.Length - 1), "/receipt.aspx")), true);
                }

                bool authSuccess = false;

                // Check if payment gateway service is enabled or not.
                if (CSFactory.GetCacheSitePref().PaymentGatewayService)
                {
                    try
                    {
                        authSuccess = orderData.OrderStatusId == 4
                            || orderData.OrderStatusId == 5 // fulfillment failure (fulfillment was attempted after payment success), so don't charge again.
                            || OrderHelper.AuthorizeOrder(orderId);
                    }
                    catch (Exception ex)
                    {
                        CSCore.CSLogger.Instance.LogException("AuthorizeOrder - auth error - orderid: " + Convert.ToString(orderId), ex);

                        throw;
                    }
                }
                else
                {
                    authSuccess = true;
                }

                if (authSuccess)
                {
                    // Check if fulfillment gateway service is enabled or not.
                    if (CSFactory.GetCacheSitePref().FulfillmentHouseService)
                    {
                        try
                        {
                            new CSWeb.FulfillmentHouse.DataPak().PostOrderToDataPak(orderId);
                        }
                        catch (Exception ex)
                        {
                            CSCore.CSLogger.Instance.LogException("AuthorizeOrder - fulfillment post error - orderid: " + Convert.ToString(orderId), ex);

                            throw;
                        }

                        if (Request.QueryString != null)
                        {
                            Response.Redirect("receipt.aspx?" + Request.QueryString);
                        }
                        else
                        {
                            Response.Redirect("receipt.aspx");
                        }
                    }
                }
                else
                {
                    Response.Redirect(string.Format("carddecline.aspx?returnUrl={0}", string.Concat("/", string.Join("/", parts, 0, parts.Length - 1), "/receipt.aspx")), true);
                }

            }
            Response.Redirect("receipt.aspx");
        }
    }
}