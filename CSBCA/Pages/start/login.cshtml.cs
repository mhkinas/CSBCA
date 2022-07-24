using System;
using System.Data.Common;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using SDBCS.bean;
using SDBCS.dbwork;
using SDBCS.utility;

namespace CSBCA.Pages.start
{
    public class loginModel : PageModel
    {
        public string userName, userCode, userPassword, userGroup, pageSize, lang;
        string errorString = "--Empty error string!--", messageString = "--empty string--";

        bool dbQuery;
        string[] queryString;
        DbDataReader dataReader;

        RunDB runDB;
        public string pageName = "/start/login", contextRoot = "/CSBCA"; 
        int connType = RunDB.DATAFILEPATH, dbSystem = RunDB.SQLSERVER;
        string confPath = "wwwroot\\conf", confFile = "connFile.json", connPath;
        MessageBean messageBean = new MessageBean(true);

        protected IActionResult processRequest()
        {
            //return RedirectToPage("/admin/grup");
            queryString = new string[1];

            HttpRequest request = HttpContext.Request;
            request.Headers["Content-Type"] = "charset=utf-8";
            HttpResponse response = HttpContext.Response;

            userCode = request.Form["login_name"].ToString(); //Query

            if (userCode != null && userCode.Length > 0)
            {
                lang = request.Form["lang"].ToString();

                userPassword = request.Form["login_password"].ToString();
                string hashedPsw = SHAConverter.getEncoded(SHAConverter.SHA_256, userPassword.Trim(), SHAConverter.UTF_8);

                queryString[0] = "select user_name, user_group, page_size from vt_csbc_user where user_code='" + userCode.Trim() +
                                    "' and user_psw='" + hashedPsw + "' and rec_status='Active'";
                Debug.WriteLine(queryString[0]);

                connPath = Path.Combine(Directory.GetCurrentDirectory(), confPath, confFile);

                messageString = connPath;

                ISession session = HttpContext.Session;

                try
                {
                    runDB = new RunDB(connType);
                    runDB.setDB(dbSystem, connPath);

                    if (runDB.runQuery(queryString, 0, RunDB.EXECUTEREADER))
                    {
                        dataReader = runDB.dataReader;

                        if (dataReader.Read())
                        {
                            userName = dataReader.GetString(0);
                            userGroup = dataReader.GetString(1);
                            pageSize = dataReader.GetString(2);

                            dbQuery = true;
                        }
                        else
                        {
                            dbQuery = false;
                            errorString = runDB.errorString;
                            messageString += messageBean.getInvalidPassword();
                        }
                    }
                    /*else if (userCode.Equals("hayati") && userPassword.Equals("your_DefPsw4Login"))
					{					
                        userName = "Hayati KINAŞ";
                        userGroup = "Admin";
                        pageSize = "20";
                        lang = "tr";

                        dbQuery = true; //
                    }*/
                    else
                    {
                        dbQuery = false;
                        errorString = runDB.errorString;
                        messageString += messageBean.getSelectExecErr();
                    }
                }
                catch (SqlException e)
                {
                    Debug.WriteLine(e.Message);
                    errorString = e.Message;
                    dbQuery = false;
                }
                if (dbQuery)
                {
                    session.SetString("ses_name", userName);
                    session.SetString("ses_code", userCode);
                    session.SetString("ses_group", userGroup);
                    session.SetString("ses_psize", pageSize);
                    session.SetString("ses_plang", lang);

                    try
                    {
                        if (lang.Equals("en"))
                        {
                            if (userGroup.Equals("Admin"))
                                return RedirectToPage("/admin/admin"); 
                            else if (userGroup.Equals("Supervisor"))
                                return RedirectToPage("/user/user");
                            else if (userGroup.Equals("Normal"))
                                return RedirectToPage("/user/message-rew");
                        }
                        else
                        {
                            if (userGroup.Equals("Admin"))
                                return RedirectToPage("/admin/yonetim"); //grup, yonetim
                            else if (userGroup.Equals("Supervisor"))
                                return RedirectToPage("/user/kullanici");
                            else if (userGroup.Equals("Normal"))
                                return RedirectToPage("/user/mesaj-bak");
                        }
                    }
                    catch (Exception ex)
                    {
                        Debug.WriteLine(ex.Message);
                    }
                }
                else
                {
                    try
                    {
                        session.SetString("u_name", userCode + "," + userPassword + "'" + connPath);

                        if (!errorString.Equals("--Empty error string!--"))
                            session.SetString("error_string", errorString);

                        session.SetString("sql_string", queryString[0] + "," + runDB.connString);

                        if (!messageString.Equals("--empty string--"))
                            session.SetString("msg_string", messageString);

                        if (lang.Equals("en"))
                            return RedirectToPage("/start/login-error");
                        else
                            return RedirectToPage("/start/giris-hatasi");
                    }
                    catch (Exception ex)
                    {
                        Debug.WriteLine(ex.Message);
                    }
                }
            }
            else
            {
                try
                {
                    if (lang.Equals("en"))
                        return RedirectToPage("/start/login");
                    else
                        return RedirectToPage("/start/giris");
                }
                catch (Exception ex)
                {
                    Debug.WriteLine(ex.Message);
                }
            }
            if (lang.Equals("en"))
                return RedirectToPage("/start/login-error");
            else
                return RedirectToPage("/start/giris-hatasi");
        }
        public void OnGet()
        {
            //processRequest();
        }
        public IActionResult OnPost()
        {
            //return RedirectToPage("/admin/grup");
            return processRequest();
            //return Page();
        }
    }
}