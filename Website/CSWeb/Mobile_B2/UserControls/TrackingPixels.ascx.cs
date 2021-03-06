﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CSBusiness;
using CSBusiness.Attributes;
using CSBusiness.OrderManagement;
using CSBusiness.Resolver;

namespace CSWeb.Mobile_B2.UserControls
{
    public partial class TrackingPixels : System.Web.UI.UserControl
    {
        public Order CurrentOrder = null;
        public string versionName = "";
        public string versionNameReferrer = "";
        public string versionNameClientFunction = ""; 
        public decimal cartTotal = 0;
        public StringBuilder rejoinerPixel = new StringBuilder();
        public int TotalQty = 0;
        public string ProductID = "";

        public ClientCartContext CartContext
        {
            get
            {
                return Session["ClientOrderData"] != null ? Session["ClientOrderData"] as ClientCartContext : null;
            }
            set { Session["ClientOrderData"] = value; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            versionName = CSWeb.OrderHelper.GetDynamicVersionName();
            if (versionName == "")
            {
                versionName = "control";
                List<CSBusiness.Version> list = (CSFactory.GetCacheSitePref()).VersionItems;
                CSBusiness.Version item = list.Find(x => x.Title.ToLower() == versionName.ToLower());
                if (item != null)
                    versionName = item.Title.ToUpper();
            }
            versionNameClientFunction = "GetClientVersionName('" + versionName + "')";
            //versionNameReferrer = CSWeb.OrderHelper.GetVersionNameByReferrer(CartContext);
            SetHomePagePnl();
            SetHomeAndSubPagesPnl();
            SetPostSalePnl();
            SetCartPagePnl();
            SetAllPagesPnl();
            SetReceiptPagePnl();
        }
        private string GetEncodedJS(string str)
        {
            if (str == null)
                return string.Empty;

            return str.Replace("'", "\\'").Replace("\r", " ").Replace("\n", " ");
        }
        private void WriteGAPixel()
        {
            StringBuilder sbGAPixel = new StringBuilder();
            sbGAPixel.AppendFormat("pageTracker._addTrans('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}' );\n",
               CurrentOrder.OrderId.ToString(), "", Math.Round(CurrentOrder.Total, 2), Math.Round(CurrentOrder.Tax, 2), Math.Round(CurrentOrder.ShippingCost, 2),
               CurrentOrder.CustomerInfo.BillingAddress.City, CurrentOrder.CustomerInfo.BillingAddress.StateProvinceName, CurrentOrder.CustomerInfo.BillingAddress.CountryCode);
            int counter = 0;
            ProductID = "";
            TotalQty = 0;
            foreach (Sku sku in CurrentOrder.SkuItems)
            {
                sbGAPixel.AppendFormat("pageTracker._addItem('{0}','{1}','{2}','{3}','{4}','{5}');\n",
                    CurrentOrder.OrderId.ToString(), sku.SkuCode, sku.LongDescription, "",
                    Math.Round(Convert.ToDouble(sku.InitialPrice), 2), sku.Quantity.ToString());
                
                TotalQty = TotalQty + sku.Quantity;
                if (counter == 0)
                {
                    ProductID = ProductID + GetEncodedJS(sku.SkuCode);
                }
                else
                {
                    ProductID = ProductID + "," + GetEncodedJS(sku.SkuCode);
                }
                counter = counter + 1;
            }



            litGAReceiptPixel.Text = sbGAPixel.ToString();
        }


        private void MDGConfirmPixel()
        {
            StringBuilder MDGConfirm = new StringBuilder();

            MDGConfirm.AppendFormat("piwikTracker.setCustomVariable(1, \"OrderID\", \"'{0}'\", \"visit\");\n",
             CurrentOrder.OrderId.ToString());

            MDGConfirm.AppendFormat("piwikTracker.setCustomVariable(2, \"OrderPrice\", \"'{0}'\", \"visit\");\n",
               Math.Round(CurrentOrder.Total, 2));

            //litMdgConfirm.Text = MDGConfirm.ToString();
        }
        private void SetHomePagePnl()
        {
            string url = Request.Url.AbsolutePath.ToLower();

            if (url.EndsWith("/index.aspx"))
            {
                pnlHomePage.Visible = true;
            }
            else
            {
                pnlHomePage.Visible = false;
            }
        }

        private void SetPostSalePnl()
        {
            string url = Request.Url.AbsolutePath.ToLower();

            if (url.EndsWith("/postsale.aspx") && ViewState["RejoinerVisible"] == null)
            {
                pnlPoseSale.Visible = true;
                ViewState["RejoinerVisible"] = "Viewed";
            }
            else
            {
                pnlPoseSale.Visible = false;
            }
        }

        private void SetCartPagePnl()
        {
            string url = Request.Url.AbsolutePath.ToLower();

            if (url.EndsWith("/cart.aspx"))
            {
                SetRejoinerPixel();
                //SetCartListrakPixel();
                pnlCartPages.Visible = true;

            }
            else
            {
                pnlCartPages.Visible = false;
            }
        }
        private void SetAllPagesPnl()
        {
            if (!(Request.RawUrl.ToLower().Contains("checkoutthankyou") || Request.RawUrl.ToLower().Contains("postsale") || Request.RawUrl.ToLower().Contains("receipt")))
            {
                pnlAllPages.Visible = true;

            }
            else
            {
                pnlAllPages.Visible = false;
            }

        }
        private void SetHomeAndSubPagesPnl()
        {
            if (!(Request.RawUrl.ToLower().Contains("checkoutthankyou") || Request.RawUrl.ToLower().Contains("postsale") || Request.RawUrl.ToLower().Contains("receipt") || Request.RawUrl.ToLower().Contains("cart")))
            {
                pnlHomeAndSubPages.Visible = true;

            }
            else
            {
                pnlHomeAndSubPages.Visible = false;
            }

        }
        private void SetCurrentOrder()
        {
            int orderId = 0;
            if (Request["oid"] != null)
            {
                orderId = Convert.ToInt32(Request["oid"].ToString());
            }
            else if (CartContext != null)
            {
                orderId = CartContext.OrderId;
            }
            CurrentOrder = new OrderManager().GetBatchProcessOrders(orderId);
            CurrentOrder.LoadAttributeValues();


        }

        private void SetReceiptPagePnl()
        {
            if (Request.RawUrl.ToLower().Contains("checkoutthankyou") || Request.RawUrl.ToLower().Contains("receipt"))
            {
                SetCurrentOrder();
                WriteGAPixel();
                MDGConfirmPixel();
                pnlReceiptPage.Visible = true;

                //////string[] testCreditCards;
                ////testCreditCards = ResourceHelper.GetResoureValue("TestCreditCard").Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries); ;

                ////foreach (string word in testCreditCards)
                ////{
                ////    if (CurrentOrder.CreditInfo.CreditCardNumber.Equals(word))
                ////    {
                ////        pnlReceiptPage.Visible = false;
                ////    }
                ////    else
                ////    {
                ////    }
                ////}
                SetConversionListrakPixel();
                SetTotalsForAdwardsAndBing();
                //reset entire Context object
                //this.CartContext.EmptyData();
                //CartContext = null;

            }

        }

        private void SetConversionListrakPixel()
        {
            StringBuilder sbListrakPixel = new StringBuilder();
            sbListrakPixel.AppendLine("<script type=\"text/javascript\">");
            sbListrakPixel.AppendLine("_ltk.Order.SetCustomer('" + CurrentOrder.Email + "', '" + CurrentOrder.CustomerInfo.BillingAddress.FirstName + "', '" + CurrentOrder.CustomerInfo.BillingAddress.LastName + "')");
            sbListrakPixel.AppendLine("_ltk.Order.OrderNumber = '" + CurrentOrder.OrderId + "'");
            sbListrakPixel.AppendLine("_ltk.Order.ItemTotal = '" + Math.Round(CurrentOrder.SubTotal, 2) + "'");
            sbListrakPixel.AppendLine("_ltk.Order.ShippingTotal = '" + Math.Round(CurrentOrder.ShippingCost, 2) + "'");
            sbListrakPixel.AppendLine("_ltk.Order.TaxTotal = '" + Math.Round(CurrentOrder.Tax, 2) + "'");
            sbListrakPixel.AppendLine("_ltk.Order.HandlingTotal = '0.00'");
            sbListrakPixel.AppendLine("_ltk.Order.OrderTotal = '" + Math.Round(CurrentOrder.SubTotal + CurrentOrder.Tax + CurrentOrder.ShippingCost, 2) + "'");

            foreach (Sku sku in CurrentOrder.SkuItems)
            {
                sbListrakPixel.AppendLine("_ltk.Order.AddItem('" + sku.SkuCode + "', " + sku.Quantity + ", '" + Math.Round(sku.InitialPrice, 2) + "');");
            }
            sbListrakPixel.AppendLine("_ltk.Order.Submit();");
            sbListrakPixel.AppendLine("</script>");


            sbListrakPixel.AppendLine("<script type=\"text/javascript\">");
            sbListrakPixel.AppendLine("_ltk.SCA.OrderNumber = '" + CurrentOrder.OrderId + "';"); // required
            sbListrakPixel.AppendLine("_ltk.SCA.SetCustomer('" + CurrentOrder.Email + "', '" + CurrentOrder.CustomerInfo.BillingAddress.FirstName + "', '" + CurrentOrder.CustomerInfo.BillingAddress.LastName + "');"); // required
            sbListrakPixel.AppendLine("_ltk.SCA.Submit();");
            sbListrakPixel.AppendLine("</script>");
            //ltlConversionListrakPixel.Text = sbListrakPixel.ToString();
        }

        private void SetCartListrakPixel()
        {
            StringBuilder sbListrakPixel = new StringBuilder();
            sbListrakPixel.AppendLine("<script type=\"text/javascript\">");
            sbListrakPixel.AppendLine("_ltk.SCA.SetCustomer('" + CartContext.CustomerInfo.Email + "', '" + CartContext.CustomerInfo.FirstName + "', '" + CartContext.CustomerInfo.LastName + "');");
            foreach (Sku s in CartContext.CartInfo.CartItems)
            {
                sbListrakPixel.AppendLine("_ltk.SCA.AddItemWithLinks('" + s.SkuCode + "', " + s.Quantity + ", '" + Math.Round(s.InitialPrice, 2) + "', '" + s.Title + "', '" + s.ImagePath + "', 'index.aspx');"); // one line per item
            }
            sbListrakPixel.AppendLine("_ltk.SCA.Submit();");
            sbListrakPixel.AppendLine("</script>");
            //ltlCartListTrakPixel.Text = sbListrakPixel.ToString();
        }

        private void SetRejoinerPixel()
        {
            foreach (Sku s in CartContext.CartInfo.CartItems)
            {
                rejoinerPixel.AppendLine("_rejoiner.push(['setCartItem', {");
                rejoinerPixel.AppendLine(string.Format("'product_id': '{0}',", s.SkuCode));
                rejoinerPixel.AppendLine(string.Format("'qty_price': '{0}',", Math.Round(s.FullPrice, 2).ToString().Replace(".", "")));
                rejoinerPixel.AppendLine(string.Format("'name': '{0}',", s.Title));
                rejoinerPixel.AppendLine(string.Format("'description': '{0}',", s.Title));
                rejoinerPixel.AppendLine(string.Format("'price': '{0}',", Math.Round(s.FullPrice * s.Quantity, 2).ToString().Replace(".", "")));
                rejoinerPixel.AppendLine(string.Format("'image_url': 'https://www.brainetics.com{0}',", s.ImagePath, 2));
                rejoinerPixel.AppendLine("}]);");
            }

        }
        
        private void SetTotalsForAdwardsAndBing()
        {
            try
            {
                if (CartContext.CartInfo != null)
                {
                    cartTotal = CartContext.CartInfo.SubTotalFullPrice + CartContext.CartInfo.TaxFullPrice + CartContext.CartInfo.ShippingCost;

                }
            }
            catch { }
        }


        public string GetVersionName()
        {
            return versionName;
        }
    }
}
