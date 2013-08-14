using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using CSWeb.A1.UserControls;
using System.IO;
using System.Web.Script.Serialization;
using System.Collections.Specialized;
using System.Dynamic;
using CSBusiness;

namespace CSWeb.A1
{
    public partial class order : CSWebBase.SiteBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
        }

        [WebMethod]
        public static string populateStates()
        {
            string jsonPost = null;
            HttpContext.Current.Request.InputStream.Position = 0;
            using (StreamReader inputStream = new StreamReader(HttpContext.Current.Request.InputStream))
            {
                jsonPost = inputStream.ReadToEnd();
            }

            if (jsonPost != null)
            {
                var serializer = new JavaScriptSerializer();
                dynamic obj = serializer.Deserialize(jsonPost, typeof(object));
                string countryId = obj["data"];
                List<StateProvince> states = StateManager.GetCacheStates(Convert.ToInt32(countryId));
                return serializer.Serialize(states);
            }

            return null;
        }

        public override void Validate()
        {
            ucBillingShippingCreditForm.PageValidate();
            
            base.Validate();
        }
    }
}