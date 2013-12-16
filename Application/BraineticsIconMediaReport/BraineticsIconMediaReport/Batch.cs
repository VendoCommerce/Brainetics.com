﻿using System;
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
using Com.ConversionSystems.DataAccess;
using Com.ConversionSystems.Utility;
using System.Threading;
using System.Configuration ;
using Tamir.SharpSsh;

namespace Brainetics_IconMedia
{
    class Batch  
    {
        LogData log = new LogData();

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

        static DataTable getDataTable(string StoredProcedureName,int selection)
        {
             string connstr="";
             switch (selection)
             {
                 case 1:
                     connstr = System.Configuration.ConfigurationSettings.AppSettings["connectionstringProd"];
                     break;
                 case 2:
                      connstr = System.Configuration.ConfigurationSettings.AppSettings["connectionstringBraineticsProd2"];
                     break;
             }

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
               
        static DataTable getDataTable(string StoredProcedureName, string StartDate, string EndDate,int selection)
        {

            string connstr = "";
            switch (selection)
            {
                case 1:
                    connstr = System.Configuration.ConfigurationSettings.AppSettings["connectionstringProd"];
                    break;
                case 2:
                    connstr = System.Configuration.ConfigurationSettings.AppSettings["connectionstringBraineticsProd2"];
                    break;
            }

            bool bReturn = false;
            string strMessage;

            SqlCommand oCmd = null;
            SqlDataAdapter da;

            DataTable dt = null;
            try
            {
                oCmd = new SqlCommand();
                oCmd.CommandText = StoredProcedureName; // 
                oCmd.CommandType = CommandType.StoredProcedure;

                SqlParameter[] para = new SqlParameter[2];
                para[0] = new SqlParameter("@startdate", SqlDbType.VarChar);
                para[0].Value = StartDate;
                para[1] = new SqlParameter("@enddate", SqlDbType.VarChar);
                para[1].Value = EndDate;
                oCmd.Parameters.AddRange(para);                
                
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

        static DataSet getDataTables(string StoredProcedureName, DateTime StartDate, DateTime EndDate, int selection)
        {
            DataSet ds = new DataSet();
            string connstr = "";
            switch (selection)
            {
                case 1:
                    connstr = System.Configuration.ConfigurationSettings.AppSettings["connectionstringProd"];
                    break;
                case 2:
                    connstr = System.Configuration.ConfigurationSettings.AppSettings["connectionstringBraineticsProd2"];
                    break;
            }

            bool bReturn = false;
            string strMessage;

            SqlCommand oCmd = null;
            SqlDataAdapter da;

            DataTable dt = null;
            try
            {
                oCmd = new SqlCommand();
                oCmd.CommandText = StoredProcedureName; // 
                oCmd.CommandType = CommandType.StoredProcedure;

                SqlParameter[] para = new SqlParameter[2];
                para[0] = new SqlParameter("@startdate", SqlDbType.DateTime );
                para[0].Value = StartDate;
                para[1] = new SqlParameter("@enddate", SqlDbType.DateTime);
                para[1].Value = EndDate;
                oCmd.Parameters.AddRange(para);

                oCmd.Connection = new SqlConnection(connstr);
                oCmd.Prepare();

               
                da = new SqlDataAdapter(oCmd);
               
                da.Fill(ds);
               return ds;
                
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
            return ds;
        }
        public void WriteToCSVFile(DataTable OrdersInfo, string strFilePath)
        {
            try
            {
                // Create the CSV file to which grid data will be exported.
               StreamWriter sw ;
                if (File.Exists (strFilePath )) 
                {
                     sw = new StreamWriter(strFilePath, true );
                }
                else
                {
                     sw = new StreamWriter(strFilePath, false);
                }
                
               
                string[] aLine;
                aLine = new string[21];
                foreach (DataRow dr in OrdersInfo.Rows)
                {

                    string strTemp = "";
                    char pad = '0';

                    aLine[0] = "";


                    aLine[1] = "LAUN".PadRight(6);
                    aLine[2] = "WEB".PadRight(6);
                    aLine[3] = "8888888888";
                    aLine[4] = "BTS4".PadRight(12);// dr["ProductCode"].ToString().Trim().PadRight(12);
                    aLine[5] = "".ToString().PadRight(2);
                    DateTime OrderDate = Convert.ToDateTime(dr["CreatedDate"]);
                    aLine[6] = OrderDate.ToString("yyyyMMdd");
                    aLine[7] = OrderDate.ToString("HH");
                    aLine[8] = dr["SkuCode"].ToString().Trim().PadRight(15);
                    string skuCode = aLine[8].Trim ();
                     string isUpsell ="";
                    switch (skuCode.ToLower())
                    { 
                        case "main" :
                            isUpsell="R";
                            break;
                        case "onep":
                            isUpsell = "R";
                            break;
                        case "dlx1":
                            isUpsell = "R";
                            break;
                        case "dl1p":
                            isUpsell = "R";
                            break;
                        case "dcbc":
                            isUpsell = "U";
                            break;
                        case "sndh":
                            isUpsell = "U";
                            break;
                        case "brp1":
                            isUpsell = "U";
                            break;
                        case "bdlx":
                            isUpsell = "U";
                            break;
                        case "dl1b":
                            isUpsell = "U";
                            break;
                        case "rush":
                            isUpsell = "U";
                            break;
                        case "rus2":
                            isUpsell = "U";
                            break;
                        case "schg":
                            isUpsell = "U";
                            break;

                    }


                    aLine[9] = isUpsell;
                    string[] tempArr ;
                        tempArr= new string[2];
                    decimal FAmmount,shipping;
                    string specifier = "0.00";
                    decimal.TryParse(dr["FullAmount"].ToString(), out FAmmount);
                    decimal.TryParse(dr["Shipping"].ToString(), out shipping);
                    if (FAmmount == 0 && shipping != 0)
                    {
                        strTemp = shipping.ToString(specifier);
                    }
                    else
                    {
                        strTemp = FAmmount.ToString(specifier);
                    }
                    tempArr = strTemp.Split(new Char[] { '.' });
                    if (tempArr.Length > 1)
                    {
                        strTemp = tempArr[0].ToString() + tempArr[1].ToString();
                    }
                    strTemp = strTemp.PadLeft(6, pad);
                    aLine[10] = strTemp;
                    aLine[11] = dr["Quantity"].ToString().PadLeft(4, pad);
                    aLine[12] = "0001";
                    aLine[13] = OrderDate.ToString("mm");
                    aLine[14] = dr["City"].ToString().Trim().PadRight(28);
                    aLine[15] = dr["Province"].ToString().Trim ();
                    aLine[16] = dr["ZipPostalCode"].ToString().Trim().PadRight(9); ;
                    strTemp = dr["Country"].ToString();
                    if (strTemp.Trim().Equals( "US"))
                    {
                        strTemp = "U";
                    }
                    else
                    {
                        strTemp = "C";
                    }

                    aLine[17] = strTemp;
                    aLine[18] = "".PadLeft(9);//3x 3 spaces for last 3 unused fields
                    aLine[19] = "";
                    aLine[20] = "";

                    for (int i = 1; i < 20; i++)
                    {
                        sw.Write(aLine[i].ToString());
                    }



                    sw.WriteLine(); 
                    
                }
               
                sw.Write ("/*");

                
                sw.Close();
            }
            catch (Exception ex)
            {
                throw ex;

            }
        }
         public void WriteHeaderCSVFile( DataSet  DS , string strFilePath)
        {
            try
            {
                // Create the CSV file to which grid data will be exported.
               StreamWriter sw  ;
               
                     sw = new StreamWriter(strFilePath, false);
              
                
                char pad = '0';
                DataTable dt1,dt2,dt3 = new DataTable ();
                dt1= DS.Tables[0];
                dt2= DS.Tables[1];
    

                if ( !DS.Tables[0].Rows[0][0].ToString().Equals ("0") )
                {
                sw.Write("CVSS".PadRight(10) );
                sw.Write("04");
                sw.Write(dt2.Rows.Count.ToString().PadLeft(9, pad));
                sw.Write(dt1.Rows[0]["InquiryCount"].ToString().PadLeft(9, pad));
                sw.Write(DateTime.Today.ToString("yyyyMMdd".ToString()));
                sw.Write(DateTime.Now.ToString("hhmm".ToString()));
                
                DateTime OrderDate = Convert.ToDateTime(dt2.Rows[0]["CreatedDate"]);
                   sw.Write(OrderDate.ToString("yyyyMMddhhmm"));



                    sw.Write(sw.NewLine);
                
                
                }
                sw.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        static DataTable AddToDataTable(string StoredProcedureName, string StartDate, string EndDate,DataTable orgDT)
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
                oCmd.CommandText = StoredProcedureName; // 
                oCmd.CommandType = CommandType.StoredProcedure;

                SqlParameter[] para = new SqlParameter[2];
                para[0] = new SqlParameter("@startdate", SqlDbType.VarChar);
                para[0].Value = StartDate;
                para[1] = new SqlParameter("@enddate", SqlDbType.VarChar);
                para[1].Value = EndDate;
                oCmd.Parameters.AddRange(para);

                oCmd.Connection = new SqlConnection(connstr);
                oCmd.Prepare();

                dt = new DataTable();
                da = new SqlDataAdapter(oCmd);
                da.Fill(dt);
                foreach (DataRow dr in orgDT.Rows)
                {
                    dt.Rows.Add(dr.ItemArray);
                }
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

            return (sb.ToString());
        }
        public static string fixstring(object s1)
        {
            string s = "";
            if (s1 != null) { s = s1.ToString(); }

            s = s.Replace("&", "&amp;");
            s = s.Replace("<", "&lt;");
            s = s.Replace(">", "&gt;");
            s = s.Replace(((char)(34)).ToString(), "&quot;");
            s = s.Replace("'", "&apos;");
            return s;

        }
        public static string fixQuot(object s1)
        {
            string s = "";
            if (s1 != null) { s = s1.ToString(); }
            s = s.Replace("'", "&apos;");
            return s;

        }
    
        public static void sendEmailToAdmin(string ErrorMSg, string subject)
        {
            StringBuilder sb = new StringBuilder();
            MailMessage message = new MailMessage();
            //  message.To.Add(new MailAddress(Helper.AppSettings["AdminEmail"]));
            message.To.Add(Helper.AppSettings["AdminEmail"]);
            message.From = new MailAddress("info@ConversionSystems.com");

            message.Subject = subject;
            sb.Append("Brainetics.Com , error sending Icon Media report file. ");
            

            string st;
            st = sb.ToString();

            st = st.Replace("~", ((char)(13)).ToString() + ((char)(10)).ToString());
            message.Body = st;
            message.IsBodyHtml = false;
            SmtpClient client = new SmtpClient();
            Helper.SendMail(message);
        }

        public void SendEmailToClient(string path)
        {
            try
            {
                StringBuilder _sbEmailMessageBody = new StringBuilder();
                _sbEmailMessageBody.Append("<html><body><table>");
                _sbEmailMessageBody.Append("<tr><td><b>Brainetics.com   - Icon Media Daily Report: </b></td></tr>");
                _sbEmailMessageBody.Append("<tr><td>This report was generated at " + DateTime.Now.ToString("MM/dd/yyyy-HH:mm") + "</td></tr>");
                _sbEmailMessageBody.Append("<tr><td> Please do not reply to this email.</b></td></tr>");
                _sbEmailMessageBody.Append("</table></body></html>");
                MailMessage _oMailMessage = new MailMessage(Helper.AppSettings["FromEmail"].ToString(), Helper.AppSettings["ClientEmail"].ToString(), "Brainetics - IconMedia Report", _sbEmailMessageBody.ToString());
                _oMailMessage.IsBodyHtml = true;
                _oMailMessage.Body = _sbEmailMessageBody.ToString();
                Attachment a = new Attachment(path);
                _oMailMessage.Attachments.Add(a);
                bool status= Helper.SendMail(_oMailMessage);
                if (status  )
                {
                log.LogToFile( "Email sent successfully to :" + _oMailMessage.To.ToString() + " on :"  + DateTime.Now.ToString()); 
                }
                else
                {
                log.LogToFile( "Email NOT sent to :" + _oMailMessage.To.ToString() + " on :"  + DateTime.Now.ToString());
                }

            }
            catch (Exception e)
            {
                log.LogToFile("Error sending email---" + e.Message);
            }
        }
        public string CheckSQLInjection(string input)
        {
            input = input.Replace("'", "''"); //' espace the single quote
            input = input.Replace("\"\"", ""); // "
            input = input.Replace(")", ""); // ) 
            input = input.Replace("(", ""); // (
            input = input.Replace(";", ""); // ;
            input = input.Replace("-", ""); // -
            input = input.Replace("|", ""); // |
            return input;
        }


        void LoadMediaIconData(DateTime ImportDateStart, DateTime ImportDateEnd)
        {

            try
            {
                log.LogToFile("***************************************************************************");
                log.LogToFile("Start Weekly File for Icon Media Batch " + ImportDateStart.ToString() + " to " + ImportDateEnd.ToString());




                Console.WriteLine("Loading Brainetics data from Date: " + ImportDateStart.ToString());
                Console.WriteLine("Loading Brainetics data to Date: " + ImportDateEnd.ToString());
       

               
           
                String DatePart = DateTime.Now.ToString("yyyyMMdd", CultureInfo.InvariantCulture);

                string SavePath = Helper.AppSettings["FileDirectoryPath"].ToString();
                string procName = Helper.AppSettings["ProcName"].ToString();
                DataSet DS = new DataSet();
                DS = getDataTables(procName, ImportDateStart, ImportDateEnd, 1);
                 
                
                string fullPathFileName = SavePath + "\\" +"BRN_CVSS" +DatePart + ".txt";
                if (! DBNull.Value.Equals ( DS.Tables[0].Rows[0][0]))
                {
                WriteHeaderCSVFile(DS, fullPathFileName);
                WriteToCSVFile(DS.Tables[1], fullPathFileName);

                SendEmailToClient(fullPathFileName);

                log.LogToFile("Finished Importing data to IconMedia");
                }
            }
            catch (Exception ex)
            {
                string error = "ERROR: Catch Block " + ex.Message + " StackTrace :: " + ex.StackTrace;
                log.LogToFile(error);

                sendEmailToAdmin(error, "Alert - Barinetics.com - Error generating IconMedia report." + error);
            }
        }
        
        public void add_Order_totxtFile(DataRow dr,StreamWriter  sw  )
        {
            try
            {
               
                StringBuilder sb = new StringBuilder("");
                sb.Clear();
                sb.Append(dr["FirstName"].ToString() + "\t");
                sb.Append(dr["LastName"].ToString() + "\t");
                sb.Append(dr["Email"].ToString() + "\t");
                sb.Append(dr["Address"].ToString() + "\t");
                sb.Append(dr["City"].ToString() + "\t");
                sb.Append(dr["State"].ToString() + "\t");

                sb.Append(dr["Country"].ToString() + "\t");
                sb.Append(dr["PhoneNumber"].ToString() + "\t");
                sb.Append(dr["PurchasedFrom"].ToString() + "\t");
                sb.Append(dr["ID"].ToString() + "\t");
                sb.Append(dr["EnteredOn"].ToString() + "\t");
                sb.Append(dr["ExpiredOn"].ToString() + "\t");
                sb.Append(dr["GiftItem"].ToString() + "\t");
                sb.Append(dr["Product1"].ToString() + "\t");
                sb.Append(dr["Product2"].ToString() + "\t");
                sb.Append(dr["Product3"].ToString() + "\t");
                sb.Append(dr["Product4"].ToString() + "\t");
                sb.Append(dr["Product5"].ToString() + "\t");
                sb.Append(dr["ZipCode"].ToString());
                sw.WriteLine(sb.ToString());
                sb.Clear();
                
            }
            catch (Exception ex)
            { 
                string error =  "Catch Block " + ex.Message + " StackTrace :: " + ex.StackTrace;
                log.LogToFile(error);
                
            
            }

        }
   
        public bool upload_FTP(string fullPathFileName)
        {
            // Get the objects used to communicate with the server.
            bool response;
            string FTP_Site = Helper.AppSettings["sFTPsite"].ToString();
            string FTP_username = Helper.AppSettings["FTPusername"].ToString();
            string FTP_pass = Helper.AppSettings["FTPpassword"].ToString();
            string FTP_folder = Helper.AppSettings["FTPsiteFolder"].ToString();
            string Chk_folder = Helper.AppSettings["ChkFolder"].ToString();
            try
            {
               // Use 
                Sftp sftpClient = new Sftp(FTP_Site, FTP_username, FTP_pass);
                
                sftpClient.Connect();
                 string absoluteFileName = Path.GetFileName(fullPathFileName);
                 sftpClient.Put(@fullPathFileName, FTP_folder + "/" + absoluteFileName);
                 ArrayList post_response = sftpClient.GetFileList(FTP_folder);
                 if (post_response.IndexOf(absoluteFileName) >= 0)
                 {
                     string dest = Chk_folder + "\\" + "chkd_" + absoluteFileName;
                     string source = "/" + FTP_folder + "/" + absoluteFileName;
                     sftpClient.Get(source, @dest);
                     response = true;
                 }
                     else
                 {
                     response = false;
                     
                 }
                return response ;
            }

           
            catch (Exception ex)
            {
                
                string error =  "FTP ERROR: Catch Block " + ex.Message + " StackTrace :: " + ex.StackTrace;
                log.LogToFile(error);

                sendEmailToAdmin(error, "Alert - Brainetics.com - Error uploading data to IconMedia FTP.");
            
                return false;
            }
        
        }

        public static DateTime GetEndDate(DateTime input)
        {
            DateTime val = input;
            val = val.AddHours(23).AddMinutes(59).AddSeconds(59);

            return val;
        }

        public static DateTime GetEastCoastStartDate(DateTime input)
        {
            DateTime val = input;
           
                val = val.AddDays(-1).AddHours(21).AddMinutes(00).AddSeconds(00);

            return val;
        }

        public static DateTime GetEastCoastDate(DateTime input)
        {
            DateTime val = input;
           
                val = val.AddHours(21).AddMinutes(00).AddSeconds(00);

            return val;
        }

       
   
        static void Main(string[] args)
        {            
            Console.WriteLine("Start Importing data to IconMedia : " + DateTime.Now.ToString()  );
            Batch StartBatch = new Batch();
            DateTime ImportDate = DateTime.Today.AddDays(-1) ;
           // DateTime ImportDate1 = DateTime.Parse("08/01/2013");
            //DateTime ImportDate2 = DateTime.Today.AddDays(-1);


            DateTime timezoneStartDate = GetEastCoastStartDate(ImportDate);
            DateTime timezoneEndDate = GetEastCoastDate(ImportDate);



            StartBatch.LoadMediaIconData(timezoneStartDate, timezoneEndDate);
            Console.WriteLine("End Importing data to IconMedia : " + DateTime.Now.ToString());
            
        }
    }
}
