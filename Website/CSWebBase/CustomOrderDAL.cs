using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using CSCore.DataHelper;

namespace CSWebBase
{
    public class CustomOrderDAL
    {
        public static SqlDataReader GetOrderDetails(int orderId)
        {
            string connectionString = ConfigHelper.GetDBConnection();
            String ProcName = "pr_custom_get_order_detail";
            SqlParameter[] ParamVal = new SqlParameter[1];
            ParamVal[0] = new SqlParameter("@orderId", orderId);
            return BaseSqlHelper.ExecuteReader(connectionString, ProcName, ParamVal);

        }
    }
}
