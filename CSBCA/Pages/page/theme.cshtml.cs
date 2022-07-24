/**
   csbca - v1.0 - 2020-10-12
   https://www.hayatikinas.com
   This code is part of the CSBCA project
   And it can be used under license terms.
   Copyright Mehmet Hayati KINAŞ
 */

using System;
using System.Diagnostics;
using CSBCA.codes.parameters;
using CSBCA.codes.processes;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using SDBCS.bean;
using SDBCS.utility;

namespace CSBCA.Pages.page
{
    public class themeModel : PageModel
    {
        public ThemeParams p = null;
        ThemeProcess process = null;
        public ArrayToString arrayToString = new ArrayToString();

        public string jsObjData = null, pageName = null, pageTitle = null, errorString = null, qsql = null, qsql2 = null,
                      menuString = null, leftSideStr = null, selectLists = null, messageString = null, fileField = null,
                      excelCols = null;

        public string[] labelNames = null, fieldNames = null, selectFields = null, inputTypes = null, selectLabels = null,
                        selectITs = null, messages = null;
        public SessionBean sessionBean = null;
        public string[][] tableData = null, selLists = null;
        public int[] readOnlyFM = null, invisibleFM = null, requiredFM = null;
        public bool isModal = false, isWithRefs = false, isLocale = false, dbQuery = false, isDebug = false;
        public DateFormatter dateFormatter = null;
        IHttpContextAccessor httpContextA = null;

        private void initModel()
        {
            p = new ThemeParams();

            if (isLocale)
                p.setLangLoc();
            else
                p.setLangEN();

            p.initParams();

            p.action = "select";
            p.formData = new string[p.selectFields.Length];
            p.dateFormatter.setIsForm(false);

            p.sessionBean.setCode(HttpContext.Session.GetString("ses_code"));
            p.sessionBean.setName(HttpContext.Session.GetString("ses_name"));
            p.sessionBean.setGroup(HttpContext.Session.GetString("ses_group"));
            p.sessionBean.setLineCount(HttpContext.Session.GetString("ses_psize"));

            p.setMenuName();

            labelNames = p.labelNames;
            fieldNames = p.fieldNames;
            selectFields = p.selectFields;
            inputTypes = p.inputTypes;
            sessionBean = p.sessionBean;
            readOnlyFM = p.readOnlyFM;
            invisibleFM = p.invisibleFM;
            requiredFM = p.requiredFM;
            isModal = p.isModal;
            isWithRefs = p.isWithRefs;

            selectLabels = p.selectLabels;
            selectITs = p.selectITs;
            dateFormatter = p.dateFormatter;
            fileField = p.fileField;
            isDebug = p.isDebug;

            pageName = p.pageName; excelCols = p.excelCols; pageTitle = p.pageTitle;
        }
        public void OnGet()
        {
            try
            {
                process = new ThemeProcess();

                httpContextA = new HttpContextAccessor();
                httpContextA.HttpContext = HttpContext;

                isLocale = !HttpContext.Session.GetString("ses_plang").Equals("en");

                initModel();

                process.initProcess(httpContextA, p);
                process.isDebug = p.isDebug;

                process.checkSession();
                process.checkAuthorized();

                jsObjData = process.doGet();
                dbQuery = process.dbQuery;

                if (jsObjData == null || !dbQuery)
                {
                    errorString = process.errorString;
                }
                else
                {
                    tableData = process.tableData;
                    menuString = process.menuString;
                    leftSideStr = process.leftSideStr;
                    selectLists = process.selectLists;
                    selLists = process.selLists;  

                    if (isDebug) Debug.WriteLine("leftSideStr: " + leftSideStr);
                }
                p = process.p;
                messages = process.messages;
                qsql = process.qsql;
                qsql2 = process.qsql2;
                messageString = process.messageString;
                errorString = process.errorString;
            }
            catch (Exception ex)
            {
                errorString = "dbQuery = " + dbQuery.ToString() + ", onGet Errror : " + ex.Message;
                Console.WriteLine(errorString);
            }
        }
        public IActionResult OnPost() //JsonResult
        {
            string procData = null;
            ContentResult contentResult = null;

            try
            {
                if (process == null) process = new ThemeProcess();

                HttpContext.Request.Headers["Content-Type"] = "charset=utf-8";

                if (httpContextA == null)
                {
                    httpContextA = new HttpContextAccessor();
                }
                httpContextA.HttpContext = HttpContext;

                initModel();

                process.initProcess(httpContextA, p);
                process.isDebug = p.isDebug;

                process.checkSession();
                process.checkAuthorized();

                p.action = process.formAction();

                procData = process.doPost();
                if (p.isDebug) Console.WriteLine("procData : " + procData);

                dbQuery = process.dbQuery;

                if (procData == null || !dbQuery)
                {
                    errorString = process.errorString;
                    if (p.isDebug) Debug.WriteLine("CS errorString : " + errorString);
                }
                else
                {
                    tableData = process.tableData;
                    if (p.isDebug) Debug.WriteLine("tableData[0][1] : " + tableData[0][1]);
                }
                p = process.p;
                messages = process.messages;
                messageString = process.messageString;
                if (p.isDebug) Console.WriteLine("messages[0] : " + messages[0]);// !!!
                if (p.isDebug) Debug.WriteLine("messageString : " + messageString);

                contentResult = new ContentResult();
                contentResult.Content = procData;
            }
            catch (Exception ex)
            {
                errorString = "onPost Errror : " + ex.Message;
                Console.WriteLine(errorString);
            }
            return contentResult;
        }
    }
}