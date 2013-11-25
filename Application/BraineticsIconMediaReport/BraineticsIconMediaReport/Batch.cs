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
using Com.ConversionSystems.DataAccess;
using Com.ConversionSystems.Utility;
using System.Threading;
using System.Configuration ;

using Tamir.SharpSsh;

namespace StonedineWarrantyDB_MyDataTree
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

        static DataSet  getDataTables(string StoredProcedureName, string StartDate, string EndDate, int selection)
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
                para[0] = new SqlParameter("@startdate", SqlDbType.VarChar);
                para[0].Value = StartDate;
                para[1] = new SqlParameter("@enddate", SqlDbType.VarChar);
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
                
                
                // First we will write the headers.
                //DataTable dt = m_dsProducts.Tables[0];
               
                //int iColCount = dt.Columns.Count;
                //for (int i = 0; i < iColCount; i++)
                //{
                //    sw.Write(dt.Columns[i]);
                //    if (i < iColCount - 1)
                //    {
                //        sw.Write(",");
                //    }
                //}
                //sw.Write(sw.NewLine);

                // Now write all the rows.

                foreach (DataRow dr in OrdersInfo.Rows)
                {


                    char pad = '0';
                    sw.Write("CS".PadRight(6) );    
                    sw.Write("WEB".PadRight(6) );    
                    sw.Write("8888888888");    

                    //!Convert.IsDBNull(dr["Pcode"]) ? sw.Write(dr["Pcode"].ToString().PadRight(12)): sw.Write("".toString().PadRight(12));
                    sw.Write("".PadRight(12));
                   sw.Write("".ToString().PadRight(2));
                   DateTime OrderDate = Convert.ToDateTime(dr["CreatedDate"]);
                   sw.Write(OrderDate.ToString("yyyyMMddhhmm"));
                   sw.Write(dr["SkuCode"].ToString().PadRight(15));
                   
                   string temp = dr["IsUpSell"].ToString();
                   if  (temp == "False") 
                   {temp = "R";
                   }
                   else
                   {
                        temp = "U";
                   }
                   sw.Write(temp);
                   sw.Write(dr["FullAmount"].ToString().PadLeft(6, pad));
                   sw.Write(dr["Quantity"].ToString().PadLeft(4, pad));
                   sw.Write("0001");
                   sw.Write(OrderDate.ToString("mm"));
                   sw.Write(dr["City"].ToString().PadRight(28));
                   sw.Write(dr["Province"].ToString());
                    sw.Write(dr["ZipPostalCode"].ToString());
                    
                    temp = dr["Country"].ToString();
                    if (temp == "USA")
                    { temp = "U";
                    }
                    else
                    {
                        temp = "C";
                    }
                    
                    sw.Write(temp.ToString());
                    sw.Write ("".PadLeft (9));
sw.WriteLine ();



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
                if (File.Exists (strFilePath )) 
                {
                     sw = new StreamWriter(strFilePath, true );
                }
                else
                {
                     sw = new StreamWriter(strFilePath, false);
                }
                char pad = '0';
                DataTable dt1,dt2,dt3 = new DataTable ();
                dt1= DS.Tables[0];
                dt2= DS.Tables[1];
                dt3= DS.Tables[2];

                sw.Write("CS".PadRight(10) );
                sw.Write("04");
                sw.Write(dt1.Rows[0]["orderCount"].ToString().PadLeft(9, pad));
                sw.Write(dt2.Rows[0]["InquiryCount"].ToString().PadLeft(9, pad));
                sw.Write(DateTime.Today.ToString("yyyyMMdd".ToString()));
                sw.Write(DateTime.Now.ToString("hhmm".ToString()));
                
                DateTime OrderDate = Convert.ToDateTime(dt3.Rows[0]["CreatedDate"]);
                   sw.Write(OrderDate.ToString("yyyyMMddhhmm"));



                    sw.Write(sw.NewLine);
                
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
            sb.Append("Here is the response from MyDataTree API for Warranty Database. Please address this Warranty import:");
            sb.Append(ErrorMSg);

            string st;
            st = sb.ToString();

            st = st.Replace("~", ((char)(13)).ToString() + ((char)(10)).ToString());
            message.Body = st;
            message.IsBodyHtml = false;
            SmtpClient client = new SmtpClient();
            Helper.SendMail(message);
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
                log.LogToFile("Start Weekly File for Icon Media Batch " + ImportDateStart.ToShortDateString() + " to " + ImportDateEnd.ToShortDateString());
               

              

                Console.WriteLine("Loading Brainetics data from Date: " + ImportDateStart.ToShortDateString());
                Console.WriteLine("Loading Brainetics data to Date: " + ImportDateEnd.ToShortDateString());
       

               
           
                String DatePart = DateTime.Now.ToString("yyyyMMddhhmmss", CultureInfo.InvariantCulture);

                string SavePath = Helper.AppSettings["FileDirectoryPath"].ToString();
                string procName = Helper.AppSettings["ProcName"].ToString();
                DataSet DS = new DataSet();
                DS = getDataTables(procName, ImportDateStart.ToShortDateString(), ImportDateEnd.ToShortDateString(), 1);
                 
                
                string fullPathFileName = SavePath + "\\" + DatePart + ".csv";
                WriteHeaderCSVFile(DS, fullPathFileName);
                WriteToCSVFile(DS.Tables[2], fullPathFileName);
                
                //write_file_header(sw);
                //DataTable dt_stoneDine = getDataTable("ReportWarrantyMyDataTree", startDate.ToShortDateString(), endDate.ToShortDateString(), 1);
                //DataTable dt_stoneDineShop = getDataTable("ReportWarrantyMyDataTree", startDate.ToShortDateString(), endDate.ToShortDateString(), 2);
                //if (dt_stoneDine.Rows.Count > 0)
                //{
                //    Console.WriteLine("Record Found = " + dt_stoneDine.Rows.Count.ToString());

                //    foreach (DataRow dr in dt_stoneDine.Rows)
                //    {
                //        Console.WriteLine(DateTime.Now.ToLongTimeString());
                //        add_Order_totxtFile(dr, sw);

                //        Thread.Sleep(1000);


                //    }
                //}
                //else
                //{
                //    log.LogToFile("No Record Found for importing data to MyDataTree from StoneDine");
                //    Console.WriteLine("No Record Found  on StoneDine");
                //}

                //Console.WriteLine("Record Found = " + dt_stoneDineShop.Rows.Count.ToString());
                //if (dt_stoneDineShop.Rows.Count > 0)
                //{
                //    foreach (DataRow dr in dt_stoneDineShop.Rows)
                //    {
                //        Console.WriteLine(DateTime.Now.ToLongTimeString());
                //        add_Order_totxtFile(dr, sw);

                //        Thread.Sleep(1000);


                //    }
                //}
                //else
                //{
                //    log.LogToFile("No Record Found for importing data to MyDataTree  from StoneDineShop");
                //    Console.WriteLine("No Record Found  on StoneDineShop");
                //}


                //sw.Close();
                //bool upload_status = upload_FTP(fullPathFileName);

                //string statusID;
                //if (upload_status)
                //{
                //    statusID = "2";
                //}
                //else
                //{
                //    statusID = "3";
                //}
                //foreach (DataRow dr in dt_stoneDine.Rows)
                //{
                //    string id = dr["id"].ToString();

                //    string update_sql = "update WarrantyRegistration set MDT_Response='" + upload_status.ToString() + "', MDT_Submitted=getdate(), MDT_Status= " + statusID + " where id=" + id.ToString();
                //    runsql_stoneDine(update_sql);

                //}
                //foreach (DataRow dr in dt_stoneDineShop.Rows)
                //{
                //    string id = dr["id"].ToString();

                //    string update_sql = "update WarrantyRegistration set MDT_Response='" + upload_status.ToString() + "', MDT_Submitted=getdate(), MDT_Status= " + statusID + " where WarrantyRegistrationId=" + id.ToString();
                //    runsql_stoneDineShop(update_sql);
                //}

                log.LogToFile("Finished Importing data to MyDataTree");
            }
            catch (Exception ex)
            {
                string error = "ERROR: Catch Block " + ex.Message + " StackTrace :: " + ex.StackTrace;
                log.LogToFile(error);

                sendEmailToAdmin(error, "Alert - StoneDine.com - Error generating MyDataTree report.");
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
              
                sendEmailToAdmin(error, "Alert - StoneDine.com - Error uploading data to MyDataTree FTP.");
            
                return false;
            }
        
        }
           

        
   
        static void Main(string[] args)
        {            
            Console.WriteLine("Start Importing data to MyDataTree : " + DateTime.Now.ToString()  );
            Batch StartBatch = new Batch();
            DateTime ImportDateStart = DateTime.Now.AddDays(-7);
            DateTime ImportDateEnd = DateTime.Today ;
            StartBatch.LoadMediaIconData(ImportDateStart, ImportDateEnd);
            Console.WriteLine("End Importing data to MyDataTree : " + DateTime.Now.ToString() );
            
        }
    }
}
