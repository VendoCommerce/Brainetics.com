using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CSBusiness;

namespace CSWeb
{
    public partial class index : CSWebBase.SiteBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
        }

        protected void lbOrderNowAccelerated_Click(object sender, EventArgs e)
        {
            AddProduct(47);
        }

        protected void lbOrderNowEnhanced_Click(object sender, EventArgs e)
        {
            AddProduct(44);
        }

        public void AddProduct(int skuId)
        {
            MainSkuAdd = skuId;

            Response.Redirect("Order.aspx", true);
        }
    }
}