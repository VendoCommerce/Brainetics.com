using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.IO;
using System.Web.Script.Serialization;
using System.Collections.Specialized;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CSWebBase
{
    public class ValidationHelper
    {
        //public static string validateInputAjax(System.Web.UI.HtmlControls.HtmlForm form)
        //{
        //    bool _bError = false;

        //    HttpContext.Current.Request.InputStream.Position = 0;
        //    using (System.IO.StreamReader sr = new System.IO.StreamReader(HttpContext.Current.Request.InputStream))
        //    {
        //        string json = sr.ReadToEnd();
        //        JavaScriptSerializer serializer = new JavaScriptSerializer();
        //        dynamic data = serializer.Deserialize(json, typeof(object));

        //        NameValueCollection querystring = HttpUtility.ParseQueryString(data["data"]);

        //        foreach (string clientId in querystring.AllKeys)
        //        {                    
        //            foreach (System.Web.UI.Control control in form.Controls)
        //            {
                        
        //            }
        //        }
        //    }

        //    return _bError ? "1" : "0";
        //}
    }
}
