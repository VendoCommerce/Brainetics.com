using System;
using System.Collections.Generic;
using System.Text;
using System.Web.UI;
using CSBusiness;
using CSBusiness.CustomerManagement;
using CSCore.Utils;
using CSCore.DataHelper;
using CSWeb.Root.Store;
using System.Web;
using CSBusiness.Resolver;
using CSBusiness.Preference;
using CSWebBase;
using CSBusiness.Attributes;

namespace CSWeb.K2.UserControls
{
    public partial class ShippingForm : System.Web.UI.UserControl
    {
        #region Variable and Events Declaration
        bool _bError = false;
        public string RedirectUrl
        {
            get
            {
                return (string)(ViewState["RedirectUrl"] ?? String.Empty);
            }
            set
            {
                ViewState["RedirectUrl"] = value;
            }
        }
        public ClientCartContext ClientOrderData
        {
            get
            {
                return (ClientCartContext)Session["ClientOrderData"];
            }
            set
            {
                Session["ClientOrderData"] = value;
            }
        }
        #endregion Variable and Events Declaration

        #region Page Events

        protected void Page_Load(object sender, EventArgs e)
        {
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
            if (!IsPostBack)
            {
                rfvEmail.ErrorMessage = ResourceHelper.GetResoureValue("EmailErrorMsg");
                revEmail.ErrorMessage = ResourceHelper.GetResoureValue("EmailValidationErrorMsg");
            }

        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            //ScriptManager.RegisterClientScriptInclude(Page, Page.GetType(), "jquery", Page.ResolveUrl("~/Scripts/jquery-1.6.4.min.js"));
            //ScriptManager.RegisterClientScriptInclude(Page, Page.GetType(), "jquery.autotab", Page.ResolveUrl("~/Scripts/jquery.autotab-1.1b.js"));


            //ScriptManager.RegisterStartupScript(this, this.GetType(), "autotab" + TextBoxArea.ClientID,
            //     String.Format(@"$('#{0}').autotab({{ target: '{1}', format: 'numeric' }});", TextBoxArea.ClientID, TextBoxPhoneNum1.ClientID), true);

            //ScriptManager.RegisterStartupScript(this, this.GetType(), "autotab" + TextBoxPhoneNum1.ClientID,
            //    String.Format(@"$('#{0}').autotab({{ target: '{1}', format: 'numeric', previous: '{2}' }});", TextBoxPhoneNum1.ClientID, TextBoxPhoneNum2.ClientID, TextBoxArea.ClientID), true);

            //ScriptManager.RegisterStartupScript(this, this.GetType(), "autotab" + TextBoxPhoneNum2.ClientID,
            //    String.Format(@"$('#{0}').autotab({{ target: '{1}', format: 'numeric', previous: '{2}' }});", TextBoxPhoneNum2.ClientID, TextBoxEmail.ClientID, TextBoxPhoneNum1.ClientID), true);


        }

        #endregion Page Events

        #region General Methods

        public bool validateInput()
        {

            if (CommonHelper.EnsureNotNull(txtEmail.Text) == String.Empty)
            {
                lblEmailError.Text = ResourceHelper.GetResoureValue("EmailErrorMsg");
                lblEmailError.Visible = true;
                _bError = true;
            }
            else
            {
                if (!CommonHelper.IsValidEmail(txtEmail.Text))
                {
                    lblEmailError.Text = ResourceHelper.GetResoureValue("EmailValidationErrorMsg");
                    lblEmailError.Visible = true;
                    _bError = true;
                }
                else
                    lblEmailError.Visible = false;
            }

            SitePreference sitePrefCache = CSFactory.GetCacheSitePref();

            if (!sitePrefCache.AttributeValuesLoaded)
                sitePrefCache.LoadAttributeValues();

            if (sitePrefCache.GetAttributeValue<bool>("DuplicateOrderCheck", true))
            {
                if (DuplicateOrderDAL.IsDuplicateOrder(txtEmail.Text))
                {
                    lblEmailError.Text = ResourceHelper.GetResoureValue("DuplicateEmailCheck") + "<br /><br />";
                    lblEmailError.Visible = true;
                    _bError = true;
                }
                else
                    lblEmailError.Visible = false;
            }

            return _bError;

        }



        protected void imgBtn_OnClick(object sender, ImageClickEventArgs e)
        {
            if (!validateInput())
            {
                SaveData();
                //Response.Redirect("Cart.aspx");
                string pid = "64";
                Response.Redirect(string.Format("AddProduct.aspx?PId={0}&CId={1}",
        pid, Convert.ToString((int)CSBusiness.ShoppingManagement.ShoppingCartType.SingleCheckout)));
            }
        }
        public void SaveData()
        {
            if (Page.IsValid)
            {
                Customer CustData = new Customer();
                CustData.Email = CommonHelper.fixquotesAccents(txtEmail.Text);
                CustData.Username = CommonHelper.fixquotesAccents(txtEmail.Text);

                //Set the Client Order objects
                //Set the Client Order objects
                ClientCartContext contextData = (ClientCartContext)Session["ClientOrderData"];

                if (contextData == null) // indicates session timeout
                    Response.Redirect("CheckoutSessionExpired.aspx?page=index.aspx", true);

                contextData.CustomerInfo = CustData;
                //contextData.CartAbandonmentId = CSResolve.Resolve<ICustomerService>().InsertCartAbandonment(CustData, contextData);
                Session["ClientOrderData"] = contextData;

            }


        }

        #endregion General Methods

    }
}