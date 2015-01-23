using CSBusiness.OrderManagement;
using CSBusiness.Resolver;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Xml;

namespace CSWeb.App_Code
{
    public class Simpova
    {
        public static IEnumerable<double> GetTaxRates(string zip)
        {
            string jurisdiction = "combined";
            //you will need these
            //using System.Xml;
            //using System.Net;
            //using System.Text;
            //using System.IO;

            double taxRate = 0.00;
            string sTaxRate = "";
            string sContentTemp = "";
            string serverURL = "http://lookup.prosalestax.com/rtst.php?key=5E78A739EEE4&postalcode=" + zip;

            //Create a HttpWebRequest object for the server URL
            HttpWebRequest webreq = (HttpWebRequest)WebRequest.Create(serverURL);

            //safe setting for redirects
            webreq.MaximumAutomaticRedirections = 60;

            //tell em what browser we have
            webreq.UserAgent = "Mozilla/4.0 (compatible; MSIE 6.0b;Windows NT 5.0)";

            //a response to put the request into                  
            HttpWebResponse webresp = (HttpWebResponse)webreq.GetResponse();

            //Create StreamReader object and pass the response stream as parameter, with ASCII encoding for text
            StreamReader strm = new StreamReader(webresp.GetResponseStream(), Encoding.ASCII);

            //output the strm to a string variable
            sContentTemp = strm.ReadToEnd();

            //open a string reader, so we can hand it to the XMLTextReader, passing it our string var
            StringReader sReader = new StringReader(sContentTemp);

            //create an XML Text Reader, to hold our XML response
            System.Xml.XmlTextReader reader = new XmlTextReader(sReader);
            while (reader.Read())
            {
                if (reader.NodeType == XmlNodeType.Element)
                {
                    //jurisdiction should be enum, for sample though it's an arg
                    if (reader.Name == jurisdiction)
                    {
                        sTaxRate = reader.ReadString();
                        if (sTaxRate != "")
                        {
                            double.TryParse(sTaxRate, out taxRate);
                            yield return taxRate;
                        }
                    }
                }
            }
        }

        public static void CalculateTax(int orderId)
        {
            try
            {

                Order orderItem = new OrderManager().GetBatchProcessOrders(orderId);
                //Only if state is taxed
                if (!IsTaxState(orderItem)) return;

                double taxAmount = 0;
                IEnumerable<double> taxes = GetTaxRates(orderItem.CustomerInfo.ShippingAddress.ZipPostalCode);
                foreach (var taxRate in GetTaxRates(orderItem.CustomerInfo.ShippingAddress.ZipPostalCode))
                {
                    if (taxRate > taxAmount)
                        taxAmount = taxRate;
                }
                //taxAmount =(decimal) 
                if (taxAmount > 0)
                {
                    CSResolve.Resolve<IOrderService>().UpdateOrderTax(orderId, (decimal)taxAmount * (orderItem.SubTotal));// + orderItem.ShippingCost - orderItem.DiscountAmount));
                }
            }
            catch (Exception)
            {
            }
        }

        private static bool IsTaxState(Order orderItem)
        {
            int stateId = orderItem.CustomerInfo.ShippingAddress.StateProvinceId;
            if (stateId == 6 || stateId == 17 || stateId == 22 || stateId == 31)
                return true;
            return false;
        }

    }
}