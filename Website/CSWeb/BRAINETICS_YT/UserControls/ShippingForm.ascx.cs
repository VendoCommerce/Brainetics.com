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

namespace CSWeb.BRAINETICS_YT.UserControls
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
                txtFirstName.Focus();
                rfvFirstName.ErrorMessage = ResourceHelper.GetResoureValue("FirstNameErrorMsg");
                rfvLastName.ErrorMessage = ResourceHelper.GetResoureValue("LastNameErrorMsg");
                rfvAddress1.ErrorMessage = ResourceHelper.GetResoureValue("ShippingAddress1ErrorMsg");
                rfvCity.ErrorMessage = ResourceHelper.GetResoureValue("ShippingCityErrorMsg");
                rfvZipCode.ErrorMessage = ResourceHelper.GetResoureValue("ShippingZipCodeErrorMsg");
                rfvPhone.ErrorMessage = ResourceHelper.GetResoureValue("PhoneNumberErrorMsg");
                rfvEmail.ErrorMessage = ResourceHelper.GetResoureValue("EmailErrorMsg");
                revEmail.ErrorMessage = ResourceHelper.GetResoureValue("EmailValidationErrorMsg");
                revPhone.ErrorMessage = ResourceHelper.GetResoureValue("PhoneValidationErrorMsg");
            }

            if (!IsPostBack)
            {
                BindCountries(true);
                BindRegions();

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

        /// <summary>
        /// List of Country from Cache Data
        /// </summary>
        public void BindCountries(bool setValue)
        {

            ddlCountry.DataSource = CountryManager.GetActiveCountry();
            ddlCountry.DataBind();
            if (setValue)
                ddlCountry.Items.FindByValue(ConfigHelper.DefaultCountry).Selected = true;
        }

        /// <summary>
        /// List of States from Cache Data
        /// </summary>
        private void BindRegions()
        {

            ddlState.Items.Clear();
            int countryId = Convert.ToInt32(ddlCountry.SelectedItem.Value);
            List<StateProvince> list = StateManager.GetCacheStates(countryId);
            ddlState.DataSource = list;
            ddlState.DataValueField = "StateProvinceId";
            ddlState.DataBind();
        }


        protected void Country_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            BindRegions();
        }
        public bool validateInput()
        {


            if (CommonHelper.EnsureNotNull(txtFirstName.Text) == String.Empty)
            {
                lblFirstNameError.Text = ResourceHelper.GetResoureValue("FirstNameErrorMsg");
                lblFirstNameError.Visible = true;
                _bError = true;
            }
            else
                lblFirstNameError.Visible = false;

            if (CommonHelper.EnsureNotNull(txtLastName.Text) == String.Empty)
            {
                lblLastNameError.Text = ResourceHelper.GetResoureValue("LastNameErrorMsg");
                lblLastNameError.Visible = true;
                _bError = true;

            }
            else
                lblLastNameError.Visible = false;

            if (CommonHelper.EnsureNotNull(txtAddress1.Text) == String.Empty)
            {
                lblAddress1Error.Text = ResourceHelper.GetResoureValue("ShippingAddress1ErrorMsg");
                lblAddress1Error.Visible = true;
                _bError = true;
            }
            else
                lblAddress1Error.Visible = false;

            if (CommonHelper.EnsureNotNull(txtCity.Text) == String.Empty)
            {
                lblCityError.Text = ResourceHelper.GetResoureValue("ShippingCityErrorMsg");
                lblCityError.Visible = true;
                _bError = true;
            }
            else
                lblCityError.Visible = false;


            if (ddlState.SelectedValue.Equals("select"))
            {
                lblStateError.Text = ResourceHelper.GetResoureValue("ShppingStateErrorMsg");
                lblStateError.Visible = true;
                _bError = true;
            }
            else
                lblStateError.Visible = false;

            string strPhoneNum = txtPhone.Text;

            if (!CommonHelper.IsValidPhone(strPhoneNum))
            {
                lblPhoneNumberError.Text = ResourceHelper.GetResoureValue("PhoneNumErrorMsg");
                lblPhoneNumberError.Visible = true;
                _bError = true;
            }
            else
                lblPhoneNumberError.Visible = false;

            if (CommonHelper.EnsureNotNull(txtZipCode.Text) == String.Empty)
            {
                lblZiPError.Text = ResourceHelper.GetResoureValue("ShippingZipCodeErrorMsg");
                lblZiPError.Visible = true;
                _bError = true;
            }
            else
            {
                if (ddlCountry.SelectedItem.Text.Contains("United States"))
                {
                    if (!CommonHelper.IsValidZipCode(txtZipCode.Text))
                    {
                        lblZiPError.Text = ResourceHelper.GetResoureValue("ShippingZipCodeValidationErrorMsg");
                        lblZiPError.Visible = true;
                        _bError = true;

                    }
                    else
                        lblZiPError.Visible = false;

                }
                else
                {
                    if (!CommonHelper.IsValidZipCodeCanadian(txtZipCode.Text))
                    {
                        lblZiPError.Text = ResourceHelper.GetResoureValue("ShippingZipCodeValidationErrorMsg");
                        lblZiPError.Visible = true;
                        _bError = true;

                    }
                    else
                        lblZiPError.Visible = false;
                }

            }

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
                Response.Redirect(RedirectUrl + "?PId=64&CId=" + (int)CSBusiness.ShoppingManagement.ShoppingCartType.ShippingCreditCheckout);
            }
        }
        public void SaveData()
        {
            if (Page.IsValid)
            {
                //Set Customer Information
                Address billingAddress = new Address();
                billingAddress.FirstName = CommonHelper.fixquotesAccents(txtFirstName.Text);
                billingAddress.LastName = CommonHelper.fixquotesAccents(txtLastName.Text);
                billingAddress.Address1 = CommonHelper.fixquotesAccents(txtAddress1.Text);
                billingAddress.Address2 = CommonHelper.fixquotesAccents(txtAddress2.Text);
                billingAddress.City = CommonHelper.fixquotesAccents(txtCity.Text);
                billingAddress.StateProvinceId = Convert.ToInt32(ddlState.SelectedValue);
                billingAddress.CountryId = Convert.ToInt32(ddlCountry.SelectedValue);
                billingAddress.ZipPostalCode = txtZipCode.Text;

                Customer CustData = new Customer();
                CustData.FirstName = CommonHelper.fixquotesAccents(txtFirstName.Text);
                CustData.LastName = CommonHelper.fixquotesAccents(txtLastName.Text);
                CustData.PhoneNumber = txtPhone.Text;
                CustData.Email = CommonHelper.fixquotesAccents(txtEmail.Text);
                CustData.Username = CommonHelper.fixquotesAccents(txtEmail.Text);
                CustData.BillingAddress = billingAddress;
                CustData.ShippingAddress = billingAddress;

                //Set the Client Order objects
                //Set the Client Order objects
                ClientCartContext contextData = (ClientCartContext)Session["ClientOrderData"];

                if (SiteBasePage.IsPOBoxAddress(billingAddress.Address1 + " " + billingAddress.Address2))
                {
                    if (contextData.OrderAttributeValues == null)
                        contextData.OrderAttributeValues = new Dictionary<string, CSBusiness.Attributes.AttributeValue>();

                    contextData.OrderAttributeValues.AddOrUpdateAttributeValue("IsPOBoxShipping", new AttributeValue(true));
                }

                if (contextData == null) // indicates session timeout
                    Response.Redirect("CheckoutSessionExpired.aspx?page=index.aspx", true);

                contextData.CustomerInfo = CustData;
                contextData.CartAbandonmentId = CSResolve.Resolve<ICustomerService>().InsertCartAbandonment(CustData, contextData);
                Session["ClientOrderData"] = contextData;

            }


        }

        #endregion General Methods

    }
}