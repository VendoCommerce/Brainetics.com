﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CSCore.Utils;
using CSBusiness;

namespace CSWeb.A5.UserControls
{
    public partial class Contact : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                rfvFirstName.ErrorMessage = ResourceHelper.GetResoureValue("FirstNameErrorMsg");
                rfvLastName.ErrorMessage = ResourceHelper.GetResoureValue("LastNameErrorMsg");
                rfvEmail.ErrorMessage = ResourceHelper.GetResoureValue("EmailErrorMsg");
                revEmail.ErrorMessage = ResourceHelper.GetResoureValue("EmailValidationErrorMsg");

                rfvMessage.ErrorMessage = "Please enter your message.";

                pnlSubmitSuccessMsg.Visible = Request.QueryString["success"] == "1";
            }
        }

        public bool validateInput()
        {
            bool _bError = false;

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

            return _bError;
        }

        public void imgBtn_OnClick(object sender, EventArgs e)
        {
            if (!validateInput())
            {
                try
                {
                    CSWebBase.DAL.InsertContactMike(txtFirstName.Text, txtLastName.Text, txtEmail.Text, txtSubject.Text, txtMessage.Text, txtSchoolName.Text, txtCity.Text, txtState.Text, txtPhoneNumber.Text);
                }
                catch (Exception ex)
                {
                    CSCore.CSLogger.Instance.LogException("Error trying to save contact email", ex);
                }

                if (OrderHelper.SendWriteToMikeEmail(txtFirstName.Text, txtLastName.Text, txtEmail.Text, txtSubject.Text, txtMessage.Text, txtSchoolName.Text, txtCity.Text, txtState.Text, txtPhoneNumber.Text))
                {
                    lblStatus.Text = string.Empty;
                    Response.Redirect("send_email.aspx?success=1", true);
                }
                else
                {
                    lblStatus.Text = "There was an error sending the email. Please try again later.";
                }
            }
        }
    }
}