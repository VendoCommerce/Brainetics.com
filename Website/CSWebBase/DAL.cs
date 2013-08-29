using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CSCore.DataHelper;
using System.Data.SqlClient;

namespace CSWebBase
{
    public class DAL
    {
        public static void InsertContactMike(string firstName, string lastName, string email, string subject, string message, string schoolName,
            string city, string state, string phoneNumber)
        {
            string connectionString = ConfigHelper.GetDBConnection();
            String ProcName = "pr_custom_insert_contactmike";
            List<SqlParameter> parameters = new List<SqlParameter>();

            parameters.Add(new SqlParameter("FirstName", firstName));
            parameters.Add(new SqlParameter("LastName", lastName));
            parameters.Add(new SqlParameter("Email", email));
            parameters.Add(new SqlParameter("Subject", subject));
            parameters.Add(new SqlParameter("Message", message));
            parameters.Add(new SqlParameter("SchoolName", schoolName));
            parameters.Add(new SqlParameter("City", city));
            parameters.Add(new SqlParameter("State", state));
            parameters.Add(new SqlParameter("PhoneNumber", phoneNumber));

            BaseSqlHelper.ExecuteScalar(connectionString, ProcName, parameters.ToArray());
        }

    }
}
