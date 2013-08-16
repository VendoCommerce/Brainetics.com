using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CSBusiness.OrderManagement;
using System.Data.SqlClient;
using CSData.Order;
using CSBusiness.Payment;
using CSBusiness;
using CSCore.Utils;

namespace CSWebBase
{
    public class CustomOrderManager
    {
        public static Order GetOrderDetails(int orderId)
        {
            return GetOrderDetails(orderId, false);
        }

        public static Order GetOrderDetails(int orderId, bool paymentInfo)
        {

            Order item = new Order();
            using (SqlDataReader reader = OrderDAL.GetOrderDetails(orderId))
            {
                while (reader.Read())
                {

                    item.OrderId = Convert.ToInt32(reader["OrderId"]);
                    item.CustomerId = Convert.ToInt32(reader["CustomerId"]);
                    item.Email = reader["Email"].ToString();
                    item.SubTotal = Convert.ToDecimal(reader["SubTotal"]);
                    item.FullPriceSubTotal = Convert.ToDecimal(reader["FullPriceSubTotal"]);
                    item.ShippingCost = Convert.ToDecimal(reader["ShippingCost"]);
                    item.RushShippingCost = Convert.ToDecimal(reader["RushShippingCost"]);
                    item.Tax = Convert.ToDecimal(reader["Tax"]);
                    item.AdditionalShippingCharge = Convert.ToDecimal(reader["AdditionalShippingCharge"]);
                    item.DiscountAmount = Convert.ToDecimal(reader["DiscountAmount"]);
                    item.DiscountCode = reader["DiscountCode"].ToString();
                    item.CreatedDate = Convert.ToDateTime(reader["CreatedDate"]);
                    item.Total = Convert.ToDecimal(reader["Total"]);
                    item.IpAddress = reader["IpAddress"].ToString();
                    item.VersionName = Convert.ToString(reader["Version"] ?? string.Empty);
                    item.FullPriceTax = Convert.ToDecimal(reader["FullPriceTax"]);
                    item.OrderStatusId = Convert.ToInt32(reader["OrderStatusId"]);
                    if (paymentInfo)
                    {
                        PaymentInformation paymentDataInfo = new PaymentInformation();

                        paymentDataInfo.CreditCardNumber = CommonHelper.Decrypt(reader["CreditCardNumber"].ToString());
                        paymentDataInfo.CreditCardType = Convert.ToInt32(reader["CreditCardType"]);
                        paymentDataInfo.CreditCardName = reader["CreditCardName"].ToString(); ;
                        paymentDataInfo.CreditCardExpired = Convert.ToDateTime(reader["CreditCardExpired"]);
                        paymentDataInfo.CreditCardCSC = reader["CreditCardCSC"].ToString();
                        paymentDataInfo.AuthorizationCode = Convert.ToString(reader["AuthorizationCode"] ?? string.Empty);
                        paymentDataInfo.TransactionCode = Convert.ToString(reader["TransactionCode"] ?? string.Empty);

                        item.CreditInfo = paymentDataInfo;
                    }

                }

                reader.NextResult();
                item.SkuItems = new List<Sku>();
                while (reader.Read())
                {
                    Sku skuItem = new Sku();
                    skuItem.SkuId = Convert.ToInt32(reader["SkuId"]);
                    skuItem.LongDescription = reader["LongDescription"].ToString();
                    skuItem.ImagePath = reader["ImagePath"].ToString();
                    skuItem.InitialPrice = Convert.ToDecimal(reader["InitialAmount"]);
                    skuItem.FullPrice = Convert.ToDecimal(reader["FullPrice"]);  //sku level info
                    skuItem.Quantity = Convert.ToInt32(reader["Quantity"]);
                    skuItem.TaxableFullAmount = Convert.ToDecimal(reader["TaxAmount"]);
                    skuItem.Title = reader["Title"].ToString();
                    skuItem.SkuCode = reader["SkuCode"].ToString();
                    skuItem.OfferCode = reader["OfferCode"].ToString();
                    skuItem.TotalPrice = Math.Round(Convert.ToInt32(reader["Quantity"]) * Convert.ToDecimal(reader["InitialAmount"]), 2);
                    item.SkuItems.Add(skuItem);

                }

                reader.NextResult();
                item.CustomFiledInfo = new List<OrderCustomField>();
                while (reader.Read())
                {
                    OrderCustomField filedItem = new OrderCustomField();
                    filedItem.FieldId = Convert.ToInt32(reader["FieldId"]);
                    filedItem.FieldName = reader["FieldName"].ToString();
                    filedItem.FieldValue = reader["FieldValue"].ToString();
                    item.CustomFiledInfo.Add(filedItem);

                }



            }

            return item;
        }
    }
}
