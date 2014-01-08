using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using CSCore.DataHelper;

namespace CSWebBase
{
    public class PrepaidCardDAL
    {
        public static bool IsPrepaidCard(int cardNo)
        {
            using (SqlDataReader reader = GetPrepaidCard(cardNo))
            {
                if (reader.HasRows)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            return false;
        }
        public static SqlDataReader GetPrepaidCard(int cardNo)
        {
            string connectionString = ConfigHelper.GetDBConnection();
            String ProcName = "pr_get_prepaidcard";
            SqlParameter[] ParamVal = new SqlParameter[1];
            ParamVal[0] = new SqlParameter("@card", cardNo);
            return BaseSqlHelper.ExecuteReader(connectionString, ProcName, ParamVal);
        }

    }
}
