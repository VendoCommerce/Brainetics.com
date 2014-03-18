using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Xml;
using System.Xml.Serialization;
using System.Net;
using System.Net.Mail;
using System.IO;
using System.Collections;
using System.Globalization;
using System.Runtime.InteropServices;
using HitsLinkVisitorBySite.com.hitslink.www;

namespace HitsLinkVisitorBySite
{
    class Batch
    {
        static DataSet getsql(string sql)
        {
            string connstr = System.Configuration.ConfigurationSettings.AppSettings["connectionstringProd"];
            System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection(connstr);
            conn.Open();
            DataSet ds = new DataSet();
            SqlDataAdapter adp = new SqlDataAdapter(sql, conn);
            adp.Fill(ds);
            conn.Close();
            return ds;
        }

        static DataTable getDataTable(string StoredProcedureName)
        {
            string connstr = System.Configuration.ConfigurationSettings.AppSettings["connectionstringProd"];

            string strMessage;
            SqlCommand oCmd = null;
            SqlDataAdapter da;

            DataTable dt = null;
            try
            {
                oCmd = new SqlCommand();
                oCmd.CommandText = StoredProcedureName;
                oCmd.CommandType = CommandType.StoredProcedure;

                oCmd.Connection = new SqlConnection(connstr);
                oCmd.Prepare();

                dt = new DataTable();
                da = new SqlDataAdapter(oCmd);
                da.Fill(dt);
            }
            catch (Exception ex)
            {
                strMessage = "Problem running procedure:  " + oCmd.CommandText + ". Error---" + ex.Message;
            }
            finally
            {
                if (oCmd != null)
                {
                    oCmd.Parameters.Clear();
                    oCmd.Connection = null;
                    oCmd.Dispose();
                }
            }
            oCmd = null;
            return dt;
        }

        static DataTable Get_Sites_HitsLinkVisitor(DateTime StartofDay, DateTime EndofDay)
        {
            string connstr = System.Configuration.ConfigurationSettings.AppSettings["connectionstringProd"];

            bool bReturn = false;
            string strMessage;

            SqlCommand oCmd = null;
            SqlDataAdapter da;
            DataTable dt = null;
            try
            {
                oCmd = new SqlCommand();
                oCmd.CommandText = "pr_get_Sites_HitsLinkVisitor";
                oCmd.CommandType = CommandType.StoredProcedure;
                oCmd.Parameters.Add(new SqlParameter("@StartofDay", SqlDbType.DateTime, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, StartofDay));
                oCmd.Parameters.Add(new SqlParameter("@EndofDay", SqlDbType.DateTime, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Default, EndofDay));
                oCmd.Connection = new SqlConnection(connstr);
                oCmd.Prepare();
                dt = new DataTable();
                da = new SqlDataAdapter(oCmd);
                da.Fill(dt);
            }
            catch (Exception ex)
            {
                strMessage = "Problem running procedure:  " + oCmd.CommandText + ". Error---" + ex.Message;
            }
            finally
            {
                if (oCmd != null)
                {
                    oCmd.Parameters.Clear();
                    oCmd.Connection = null;
                    oCmd.Dispose();
                }
            }
            oCmd = null;
            return dt;
        }

        static void runsql(string sql)
        {
            string connstr = System.Configuration.ConfigurationSettings.AppSettings["connectionstringProd"];
            System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection(connstr);
            conn.Open();
            SqlCommand cm = new SqlCommand(sql, conn);
            cm.ExecuteNonQuery();
            conn.Close();
        }

        static DateTime EndOfDay(DateTime date)
        {
            return new DateTime(date.Year, date.Month, date.Day, 23, 59, 59, 999);
        }

        static DateTime StartOfDay(DateTime date)
        {
            return new DateTime(date.Year, date.Month, date.Day, 0, 0, 0, 0);
        }

        private void LogToFile(string AdditionalInfo)
        {
            bool bResult = false;
            StreamWriter log;

            StringBuilder sb = new StringBuilder();
            sb.Append(DateTime.Now);
            //if (Error != null)
            //{
            //    sb.Append("Exception error:" + Error.ToString() + "-");
            //}
            sb.Append("-" + AdditionalInfo + "-");
            try
            {
                if (!File.Exists(System.Configuration.ConfigurationSettings.AppSettings["ErrorLogFile"]))
                {
                    log = new StreamWriter(System.Configuration.ConfigurationSettings.AppSettings["ErrorLogFile"]);
                }
                else
                {
                    log = File.AppendText(System.Configuration.ConfigurationSettings.AppSettings["ErrorLogFile"]);
                }
                log.WriteLine(sb.ToString());
                log.Close();
            }
            catch (Exception ex)
            {
                bResult = false;
            }
            //  return bResult;
        } 

        void CheckDataBase_Connection()
        {
            DataSet DS = getsql("Select * from [Sites]");
            DataTable DT = DS.Tables[0];
            if (DT.Rows.Count > 0)
            {
                Console.WriteLine(DT.Rows.Count.ToString());
            }
        }

        public void SendEmailToAdmin(string ErrorMessage)
        {
            try
            {
                StringBuilder _sbEmailMessageBody = new StringBuilder();
                _sbEmailMessageBody.Append("<html><body><table>");
                _sbEmailMessageBody.Append("<tr><td><b>HitsLink Visitor BySite - Error :</b></td></tr>");
                _sbEmailMessageBody.Append("<tr><td>This report was generated at " + DateTime.Now.ToString("MM/dd/yyyy-HH:mm") + "</td></tr>");
                _sbEmailMessageBody.Append("<tr><td>" + ErrorMessage + "</td></tr>");
                _sbEmailMessageBody.Append("<tr><td> Please do not reply to this email.</b></td></tr>");
                _sbEmailMessageBody.Append("</table></body></html>");
                string AdminEmail = System.Configuration.ConfigurationSettings.AppSettings["AdminEmail"];
                string fromEmail = System.Configuration.ConfigurationSettings.AppSettings["fromEmail"];
                string AdminEmailCC = System.Configuration.ConfigurationSettings.AppSettings["AdminEmailCC"];
                MailMessage _oMailMessage = new MailMessage(fromEmail, AdminEmail, "HitsLink Visitor BySite Batch Error", _sbEmailMessageBody.ToString());
                _oMailMessage.CC.Add(AdminEmailCC);
                _oMailMessage.IsBodyHtml = true;
                _oMailMessage.Body = _sbEmailMessageBody.ToString();
                SendMail(_oMailMessage);
            }
            catch (Exception e)
            {
                LogToFile("Error sending email---" + e.Message);
            }
        }

        public bool SendMail(MailMessage oMsg)
        {
            SmtpClient client;
            bool bResult = false;
            try
            {
                //client = new SmtpClient();
                //client.Send(oMsg);                
                client = new SmtpClient(System.Configuration.ConfigurationSettings.AppSettings["SmtpServer"]);
                client.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis;
                client.Send(oMsg);
                bResult = true;
            }
            catch (Exception ex)
            {
                LogToFile("Error sending email---" + ex.Message);
            }
            return bResult;
        }

        public static string fixquotesAccents(string s)
        {
            string s1;
            s1 = s.Replace("'", "''");
            return ClearAccents(s1);

        }

        public static string ClearAccents(string text)
        {
            //url = Regex.Replace(url, @"\s+", "-");
            string stFormD = text.Normalize(NormalizationForm.FormD);
            StringBuilder sb = new StringBuilder();

            for (int ich = 0; ich < stFormD.Length; ich++)
            {
                UnicodeCategory uc = CharUnicodeInfo.GetUnicodeCategory(stFormD[ich]);
                if (uc != UnicodeCategory.NonSpacingMark)
                {
                    sb.Append(stFormD[ich]);
                }
            }
            sb.Replace("'", "''");
            return (sb.ToString());
        }

        public static string EnsureNotNull(string str)
        {
            if (String.IsNullOrEmpty(str))
                return string.Empty;

            return str;
        }

        private bool BindData(DateTime ReportDate, int SiteID, string hitslinkusername, string hitslinkpassword)
        {
            bool status = false;
            Console.WriteLine(ReportDate);
            Hashtable hashtable = new Hashtable();
                DateTime yesterday = ReportDate.AddDays(-1);
                DateTime endDate =  new DateTime(ReportDate.Year, ReportDate.Month, ReportDate.Day, 21, 0, 0);
                DateTime startDate = new DateTime(ReportDate.AddDays(-1).Year, yesterday.Month, yesterday.Day, 21, 0, 0);
            try
            {
                string Visityear = ReportDate.Year.ToString();
                Console.WriteLine(startDate);
                Console.WriteLine(endDate);

                StringBuilder sb = new StringBuilder();
                ReportWS ws = new ReportWS();
                int i = 0;
                Data rptData = default(Data);
                //   Call the webservice and retrieve the report data 
                rptData = ws.GetDataFromTimeframe(hitslinkusername,hitslinkpassword, ReportsEnum.LatestVisitors, TimeFrameEnum.Daily, startDate, endDate, 100000000, 0, 0);
                                
                string query = "";                 
                for (i = 0; i < rptData.Rows.Length; i++)
                {
                    //Console.WriteLine(rptData.Rows[i].Columns[0].Value);
                    //Console.WriteLine(rptData.Rows[i].Columns[1].Value);                    
                    // query1 = query.Replace("<VisitDate>", rptData.Rows[i].Columns[0].Value).Replace("<IPAddress>", rptData.Rows[i].Columns[1].Value);
                    // Console.WriteLine(query1);
                    query = "INSERT INTO [HitsLinkVisitors] ([VisitDate],[VisitYear],[IPAddress], [SiteID] ,[VisitorID],[From_Domain],[Referred_By],[Visit_No],[No_Pages_Accessed],[Browser],[PlatForm],[Language],[Resolution],[Java_Support],[Cookie_Support],[Country],[City],[State],[Organization]) VALUES ('" + fixquotesAccents(EnsureNotNull(rptData.Rows[i].Columns[0].Value)) + "','" + EnsureNotNull(Visityear) + "','" + fixquotesAccents(rptData.Rows[i].Columns[1].Value) + "'," + SiteID + ",'" + fixquotesAccents(EnsureNotNull(rptData.Rows[i].Columns[3].Value)) + "','" + fixquotesAccents(EnsureNotNull(rptData.Rows[i].Columns[4].Value)) + "','" + fixquotesAccents(EnsureNotNull(rptData.Rows[i].Columns[5].Value)) + "','" + fixquotesAccents(EnsureNotNull(rptData.Rows[i].Columns[6].Value)) + "','" + fixquotesAccents(EnsureNotNull(rptData.Rows[i].Columns[7].Value)) + "','" + fixquotesAccents(EnsureNotNull(rptData.Rows[i].Columns[8].Value)) + "','" + fixquotesAccents(EnsureNotNull(rptData.Rows[i].Columns[9].Value)) + "','" + fixquotesAccents(EnsureNotNull(rptData.Rows[i].Columns[10].Value)) + "','" + fixquotesAccents(EnsureNotNull(rptData.Rows[i].Columns[11].Value)) + "','" + fixquotesAccents(EnsureNotNull(rptData.Rows[i].Columns[12].Value)) + "','" + fixquotesAccents(EnsureNotNull(rptData.Rows[i].Columns[13].Value)) + "','" + fixquotesAccents(EnsureNotNull(rptData.Rows[i].Columns[14].Value)) + "','" + fixquotesAccents(EnsureNotNull(rptData.Rows[i].Columns[15].Value)) + "','" + fixquotesAccents(EnsureNotNull(rptData.Rows[i].Columns[16].Value)) + "','" + fixquotesAccents(EnsureNotNull(rptData.Rows[i].Columns[17].Value)) + "'" + ")";
                    runsql(query);                    
                }
                status = true;                
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                LogToFile("BindData Error" + ex.Message);
                LogToFile("BindData Error" + ex.StackTrace);
                status = false;
                string error = "SiteID = " + SiteID.ToString() + "<br/> Error <br/>" + ex.Message + "<br/> StackTrace <br/>" + ex.StackTrace;
                SendEmailToAdmin(error);
            }

            try
            {
              
                Console.WriteLine(startDate);
                Console.WriteLine(endDate);

                StringBuilder sb = new StringBuilder();
                ReportWS ws = new ReportWS();
                int i = 0;
                Data rptData = default(Data);
                //   Call the webservice and retrieve the report data 
                rptData = ws.GetDataFromTimeframe(hitslinkusername, hitslinkpassword, ReportsEnum.eCommerceTransactions, TimeFrameEnum.Daily, startDate, endDate, 100000000, 0, 0);

                string query = "";
                for (i = 0; i < rptData.Rows.Length; i++)
                {
                    //Console.WriteLine(rptData.Rows[i].Columns[0].Value);
                    //Console.WriteLine(rptData.Rows[i].Columns[1].Value);                    
                    // query1 = query.Replace("<VisitDate>", rptData.Rows[i].Columns[0].Value).Replace("<IPAddress>", rptData.Rows[i].Columns[1].Value);
                    // Console.WriteLine(query1);
                    query = "INSERT INTO [HitsLinkTransactions]([Hitslink_Visitor_ID], [SiteID] ,[OrderID]) VALUES('" + EnsureNotNull(rptData.Rows[i].Columns[8].Value) + "'," + SiteID + ",'" + EnsureNotNull(rptData.Rows[i].Columns[5].Value) + "'" + ")";
                    runsql(query);
                }
                status = true;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                LogToFile("BindData Error" + ex.Message);
                LogToFile("BindData Error" + ex.StackTrace);
                status = false;
                string error = "SiteID = " + SiteID.ToString() + "<br/> Error <br/>" + ex.Message + "<br/> StackTrace <br/>" + ex.StackTrace;
                SendEmailToAdmin(error);
            }
            return status;
        }

        private void Load_Sites_HitsLinkVisitor(DateTime ReportDate)
        {
            int SiteID = 8;
            string query = "";
            string hitslinkusername="";
            string hitslinkpassword = "";
            DateTime current = DateTime.Now;
            DateTime StartofDay = StartOfDay(current);
            DateTime EndofDay = EndOfDay(current);
            DataTable DT = Get_Sites_HitsLinkVisitor(StartofDay, EndofDay);
            Console.WriteLine("Site Counts = " + DT.Rows.Count.ToString());
            string BatchLogtime = DateTime.Now.ToString();            
            if (DT.Rows.Count > 0)
            {                
                for (int index = 0; index < DT.Rows.Count; index++)
                {
                    try
                    {
                        SiteID = Convert.ToInt32(DT.Rows[index]["SiteId"].ToString());
                        hitslinkusername = DT.Rows[index]["HitsLinkUserName"].ToString();
                        hitslinkpassword = DT.Rows[index]["HitsLinkPassword"].ToString();
                        bool status = BindData(ReportDate, SiteID, hitslinkusername, hitslinkpassword);
                        BatchLogtime = DateTime.Now.ToString();
                        string statusid = "";
                        if (status)
                        {
                            statusid = "1";
                        }
                        else
                        {
                            statusid = "0";
                        }
                        query = "INSERT INTO [HitsLinkLog] ([CreateDate],[SiteId],[BatchStatus],[ReportName])  VALUES ('" + BatchLogtime + "'," + SiteID.ToString() + ", " + statusid + ", 'LatestVisitors')";
                        runsql(query);
                    }
                    catch (Exception ex)
                    {
                        LogToFile("Error "+ex.Message);
                        LogToFile("StackTrace " + ex.StackTrace);
                        string error = ex.Message + "<br/> StackTrace <br/>" +ex.StackTrace;
                        SendEmailToAdmin(error);
                    }
                }
            }
        }

        static void Main(string[] args)
        {
            DateTime ReportDate = DateTime.Now;
            Console.WriteLine("Start HitsLink Visitor By Site Batch");
            Console.WriteLine(ReportDate.ToString());
            Batch DailyBatch = new Batch();            
            // DailyBatch.CheckDataBase_Connection();
            DailyBatch.LogToFile("Start HitsLink Visitor By Site Batch");
            DailyBatch.Load_Sites_HitsLinkVisitor(ReportDate);            
            Console.WriteLine("End HitsLink Visitor By Site Batch");
            DailyBatch.LogToFile("End HitsLink Visitor By Site Batch");
        }
       }
}
