﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CSBusiness;
using CSBusiness.Email;
using CSCore.Utils;

namespace CSWeb.Admin
{
    public partial class EmailItem : System.Web.UI.Page
    {
        public int emailId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["emailId"] != null)
                emailId = Convert.ToInt32(Request["emailId"].ToString());

            if (!Page.IsPostBack)
            {

                if (emailId > 0)
                {
                    LoadEmalTemplate(emailId);
                }

            }

        }

        protected void LoadEmalTemplate(int emailId)
        {
            EmailSetting emailItem = EmailManager.GetEmail(emailId);
            txtName.Text = emailItem.Title;
            txtfromAddress.Text = emailItem.FromAddress;
            txtToAddress.Text = emailItem.ToAddress;
            txtSubject.Text = emailItem.Subject;
            EmailBodyDesc.Content = emailItem.Body;
            
        }

        protected void btnAction_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Save")
            {
                if (Page.IsValid)
                {
                    EmailSetting item = new EmailSetting();
                    item.EmailId = emailId;
                    item.Title = CommonHelper.fixquotesAccents(txtName.Text);
                    item.Subject = CommonHelper.fixquotesAccents(txtSubject.Text);
                    item.FromAddress = CommonHelper.fixquotesAccents(txtfromAddress.Text);
                    item.ToAddress = CommonHelper.fixquotesAccents(txtToAddress.Text);
                    item.Body = EmailBodyDesc.Content; // CommonHelper.fixquotesAccents(EmailBodyDesc.Content);

                    EmailManager.SaveEmail(item);

                }
            }

            Response.Redirect("EmailList.aspx");
        }
    }
}