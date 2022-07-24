using System;
using System.Data.Common;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.RazorPages;
using SDBCS.bean;
using SDBCS.dbwork;
using SDBCS.utility;

namespace CSBCA.Pages.start
    {
        public class unauthorized_entryModel : PageModel
        {
            String userName, userCode, userPassword, userGroup, pageSize, lang;
            String errorString = "--Empty error string!--", messageString = "--empty string--";

            bool dbQuery;
            string[] queryString;
            DbDataReader dataReader;

            RunDB runDB;
        public String pageName = "/start/unauthorized-entry", contextRoot = "CSBCA";
            int connType = RunDB.DATAFILEPATH, dbSystem = RunDB.SQLSERVER;
            String confPath = "wwwroot\\conf", connPath = "connFile.json";
            MessageBean messageBean = new MessageBean(true);

            protected void processRequest()
            {
                queryString = new String[1];

                HttpRequest request = HttpContext.Request;
                request.Headers["Content-Type"] = "charset=utf-8";
                HttpResponse response = HttpContext.Response;

                userCode = request.Form["login_name"].ToString();

                if (userCode != null && userCode.Length > 0)
                {
                    lang = request.Form["lang"].ToString();

                    userPassword = request.Form["login_password"].ToString();
                    String hashedPsw = SHAConverter.getEncoded(SHAConverter.SHA_256, userPassword.Trim(), SHAConverter.UTF_8);

                    queryString[0] = "select user_name, user_group, page_size from vt_csbc_user where user_code='" + userCode.Trim() +
                                        "' and user_psw='" + hashedPsw + "' and rec_status='Active'";
                    Debug.WriteLine(queryString[0]);

                    connPath = Path.Combine(Directory.GetCurrentDirectory(), confPath, connPath);

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
                        else
                        {
                            dbQuery = false;
                            messageString = messageBean.getSelectExecErr();
                        }
                    }
                    catch (SqlException e)
                    {
                        Debug.WriteLine(e.Message);
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
                                    RedirectToPage("/admin/admin");
                                else if (userGroup.Equals("Supervisor"))
                                    RedirectToPage("/user/user");
                                else if (userGroup.Equals("Normal"))
                                    RedirectToPage("/user/message-rew");
                            }
                            else
                            {
                                if (userGroup.Equals("Admin"))
                                    RedirectToPage("/admin/yonetim");
                                else if (userGroup.Equals("Supervisor"))
                                    RedirectToPage("/user/kullanici");
                                else if (userGroup.Equals("Normal"))
                                    RedirectToPage("/user/mesaj-bak");
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
                            session.SetString("u_name", userCode);

                            if (!errorString.Equals("--Empty error string!--"))
                                session.SetString("error_string", errorString);

                            session.SetString("sql_string", queryString[0]);

                            if (!messageString.Equals("--empty string--"))
                                session.SetString("msg_string", messageString);

                            if (lang.Equals("en"))
                                RedirectToPage("/start/login-error");
                            else
                                RedirectToPage("/start/giris-hatasi");
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
                            RedirectToPage("/start/login");
                        else
                            RedirectToPage("/start/giris");
                    }
                    catch (Exception ex)
                    {
                        Debug.WriteLine(ex.Message);
                    }
                }
                //return Page();
            }
            public void OnGet()
            {

            }
            public void OnPost()
            {
                processRequest();
            }
        }
    }