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

namespace CSWeb.Rebate
{
    public partial class index : System.Web.UI.Page
    {

        int orderId = 0;
        protected static readonly DateTime MinDate = new DateTime(1900, 1, 2);
        protected static readonly DateTime MaxDate = new DateTime(2079, 5, 6);
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
                try
                {
                    orderId = CartContext.OrderId;
                }
                catch
                {

                    orderId = 0;
                }

            }
            if (!IsPostBack)
            {

                if (orderId > 0)
                {
                    Order orderData = CSResolve.Resolve<IOrderService>().GetOrderDetails(orderId, true);
                    if (!orderData.AttributeValuesLoaded)
                        orderData.LoadAttributeValues();

                    bool bookPurchased = orderData.ContainsAttribute("BookPurchased") && orderData.GetAttributeValue<bool>("BookPurchased", false);

                    if (orderData.CreatedDate.AddHours(1) < DateTime.Now)
                    {
                        // this means that  customer clicked back, so should be directed to receipt page.
                        //Response.Redirect("receipt.aspx");
                        pnlNotEligible.Visible = true;
                        pnlRebateForm.Visible = false;
                    }
                    else if (bookPurchased)
                    {
                        pnlNotEligible.Visible = true;
                        pnlRebateForm.Visible = false;
                        ltMessage.Text = "You have already redeemed your rebate!";
                    }
                    else if (orderData.OrderStatusId == 4 || orderData.OrderStatusId == 1 || orderData.CreditInfo.CreditCardNumber.Equals("341111111111111"))
                    {
                        pnlNotEligible.Visible = false;
                        pnlRebateForm.Visible = true;
                    }
                }
                else
                {
                    ltMessage.Text = "There is no valid order associated with your request!";
                    pnlNotEligible.Visible = true;
                    pnlRebateForm.Visible = false;
                }

            }


        }

        protected void imgbtnOnClick(object sender, ImageClickEventArgs e)
        {
            if (Request["oid"] != null)
            {
                orderId = Convert.ToInt32(Request["oid"].ToString());
            }
            else
            {
                try
                {
                    orderId = CartContext.OrderId;
                }
                catch
                {

                    orderId = 0;
                }

            }
            Order orderData = CSResolve.Resolve<IOrderService>().GetOrderDetails(orderId, true);
            Dictionary<string, AttributeValue> orderAttributes = new Dictionary<string, AttributeValue>();
            orderAttributes.Add("BookPurchased", new CSBusiness.Attributes.AttributeValue(true));
            orderAttributes.Add("BookPurchasedStore", new CSBusiness.Attributes.AttributeValue(ddlBookStore.SelectedValue));
            orderAttributes.Add("BookPurchasedDate", new CSBusiness.Attributes.AttributeValue(textboxDate.Text));
            orderAttributes.Add("BookPurchasedReceipt", new CSBusiness.Attributes.AttributeValue(txtReceipt.Text));
            CSResolve.Resolve<IOrderService>().UpdateOrderAttributes(orderId, orderAttributes, orderData.OrderStatusId);

            ltMessage.Text = "You have successfully redeemed your rebate!";
            pnlNotEligible.Visible = true;
            pnlRebateForm.Visible = false;

        }
    }
}