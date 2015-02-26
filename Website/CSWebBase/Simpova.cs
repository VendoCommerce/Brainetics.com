using CSBusiness.OrderManagement;
using CSBusiness.Resolver;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Xml;

namespace CSWebBase
{
    public class Simpova
    {
        /// <summary>
        /// Retireves and returns list of tax rates for a zip code
        /// </summary>
        /// <param name="zip"></param>
        /// <returns></returns>
        public static IEnumerable<double> GetTaxRates(string zip)
        {
            string jurisdiction = "combined";
            double taxRate = 0.00;
            string sTaxRate = "";
            string sContentTemp = "";
            //Read from appsettings? database?
            string serverURL = ConfigurationManager.AppSettings["SimpovaUrl"];
            serverURL += zip;

            HttpWebRequest webreq = (HttpWebRequest)WebRequest.Create(serverURL);

            webreq.MaximumAutomaticRedirections = 60;
            webreq.UserAgent = "Mozilla/4.0 (compatible; MSIE 6.0b;Windows NT 5.0)";

            HttpWebResponse webresp = (HttpWebResponse)webreq.GetResponse();
            StreamReader strm = new StreamReader(webresp.GetResponseStream(), Encoding.ASCII);

            sContentTemp = strm.ReadToEnd();
            StringReader sReader = new StringReader(sContentTemp);

            System.Xml.XmlTextReader reader = new XmlTextReader(sReader);
            while (reader.Read())
            {
                if (reader.NodeType == XmlNodeType.Element)
                {
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

        /// <summary>
        /// Gets the highest tax rate for the zip code and state
        /// </summary>
        /// <param name="zipCode"></param>
        /// <param name="stateId"></param>
        /// <returns></returns>
        public static double GetTaxRate(string zipCode, int stateId)
        {
            try
            {

                //Only if state is taxed
                if (!IsTaxState(stateId)) return 0;

                double taxAmount = 0;

                foreach (var taxRate in GetTaxRates(zipCode))
                {
                    if (taxRate > taxAmount)
                        taxAmount = taxRate;
                }
                return taxAmount;
            }
            catch (Exception)
            {
                //Log error here
            }
            return 0;
        }

        /// <summary>
        /// Will calculate tax and updates order
        /// </summary>
        /// <param name="orderId"></param>
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
                    CSResolve.Resolve<IOrderService>().UpdateOrderTax(orderId, (decimal)taxAmount * (orderItem.FullPriceSubTotal));// + orderItem.ShippingCost - orderItem.DiscountAmount));
                }
            }
            catch (Exception)
            {
                //Log error here
            }
        }

        /// <summary>
        /// Ignores states that are not taxed
        /// </summary>
        /// <param name="orderItem"></param>
        /// <returns></returns>
        private static bool IsTaxState(Order orderItem)
        {
            int stateId = orderItem.CustomerInfo.ShippingAddress.StateProvinceId;
            return IsTaxState(stateId);
        }

        /// <summary>
        /// Ignores states that are not taxed
        /// </summary>
        /// <param name="orderItem"></param>
        /// <returns></returns>
        private static bool IsTaxState(int stateId)
        {
            if (stateId == 6 || stateId == 17 || stateId == 31)
                return true;
            return false;
        }

    }
}