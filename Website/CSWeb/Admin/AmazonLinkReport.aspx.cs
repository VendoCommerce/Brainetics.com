using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using CSBusiness;
using CSWeb.HitLinks;
using CSBusiness.OrderManagement;
using CSCore;
using CSData;
using CSBusiness.Preference;
using System.Configuration;

namespace CSWeb.Admin
{
    public partial class AmazonLinkReport : BasePage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            BindSettings();
            if (!IsPostBack)
            {                
                liHeader.Text = DateTime.Now.ToString("MMMM") + " " + DateTime.Now.Day.ToString() + ", " + DateTime.Now.Year.ToString();
                liSubHeader.Text = DateTime.Now.DayOfWeek + " " + DateTime.Now.AddHours(3).ToShortTimeString() + " (EST)";

                if (Session["FilterFromDate"] != null && Session["FilterToDate"] != null)
                {
                    rangeDateControlCriteria.StartDateValueLocal = Convert.ToDateTime(Session["FilterFromDate"]);
                    rangeDateControlCriteria.EndDateValueLocal = Convert.ToDateTime(Session["FilterToDate"]);
                }
                else
                {

                    rangeDateControlCriteria.StartDateValueLocal = DateTime.Now.Date;
                    rangeDateControlCriteria.EndDateValueLocal = DateTime.Now.Date;

                }

                BindData(rangeDateControlCriteria.StartDateValueLocal, rangeDateControlCriteria.EndDateValueLocal);
            }
        }

        protected void BindData(DateTime? startDate, DateTime? endDate)
        {

            DateTime? timezoneStartDate = rangeDateControlCriteria.StartDateValueLocal;
            DateTime? timezoneEndDate = DateTimeUtil.GetEndDate(rangeDateControlCriteria.EndDateValueLocal);

            dsAmazonLinks.SelectParameters["from"].DefaultValue = timezoneStartDate.ToString();
            dsAmazonLinks.SelectParameters["to"].DefaultValue = timezoneEndDate.ToString();
            gvLinkReport.DataBind();

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Session["FilterFromDate"] = rangeDateControlCriteria.StartDateValueLocal.Value.ToShortDateString();
            Session["FilterToDate"] = rangeDateControlCriteria.EndDateValueLocal.Value.ToShortDateString();

            BindData(rangeDateControlCriteria.StartDateValueLocal, rangeDateControlCriteria.EndDateValueLocal);

        }

        public void BindSettings()
        {
            string cs = ConfigurationManager.AppSettings["client_db"];
            dsAmazonLinks.ConnectionString = cs;
        }
    }
}