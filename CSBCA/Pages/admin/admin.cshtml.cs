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

namespace CSBCA.Pages.admin
{
    public class adminModel : PageModel
    {
        public AdminParams p = null;
        AdminProcess process = null;
        public ArrayToString arrayToString = new ArrayToString();

        public string jsObjData = null, pageName = null, pageTitle = null, errorString = null, qsql = null, qsql2 = null, 
                      menuString = null, leftSideStr = null, selectLists = null, messageString = null, excelCols = null;

        public string[] labelNames = null, fieldNames = null, selectFields = null, inputTypes = null, selectLabels = null,
                        selectITs = null, messages = null;
        public SessionBean sessionBean = null;
        public string[][] tableData = null, selLists = null;
        public int[] readOnlyFM = null, invisibleFM = null, requiredFM = null;
        public bool isModal = false, isWithRefs = false, isLocale = false, dbQuery = false, isDebug = false;
        public DateFormatter dateFormatter = null;
        IHttpContextAccessor httpContextA = null;

        // To initialize model
		private void initModel()
        {
            p = new AdminParams();

            if (isLocale)
                p.setLangLoc();
            else
                p.setLangEN();

            p.initParams();

            p.action = "select";
            p.formData = new string[p.selectFields.Length];
            p.dateFormatter.setIsForm(false);

            // For setting user info to SessionBean
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
            isDebug = p.isDebug;

            pageName = p.pageName; 
            excelCols = p.excelCols;  
            pageTitle = p.pageTitle;
        }
        
		// For setting page parameters at first opening
        public void OnGet()
        {
            try
            {
                process = new AdminProcess();
 
                httpContextA = new HttpContextAccessor();
                httpContextA.HttpContext = HttpContext; // For transferring HttpContext to process

                isLocale = !HttpContext.Session.GetString("ses_plang").Equals("en"); // Check for locale language or english

                initModel(); // Model initialization

                process.initProcess(httpContextA, p); // Process initialization

                process.checkSession(); // Session control
                process.checkAuthorized(); // User authorization control

                jsObjData = process.doGet();; // To call the page process for first landing
                dbQuery = process.dbQuery;

                if (jsObjData == null || !dbQuery)
                {
                    errorString = process.errorString;
                }
                else // For setting page parameters
                {
                    tableData = process.tableData;
                    menuString = process.menuString;
                    leftSideStr = process.leftSideStr;
                    selectLists = process.selectLists;
                    selLists = process.selLists; 
                      
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
        
		// To send select, insert, update, delete processes to sdbcs api
        public IActionResult OnPost() 
        {
            string procData = null;
            ContentResult contentResult = null;

            try
            {
                if (process == null) process = new AdminProcess();

                HttpContext.Request.Headers["Content-Type"] = "charset=utf-8";

                if (httpContextA == null)
                {
                    httpContextA = new HttpContextAccessor();
                }
                httpContextA.HttpContext = HttpContext; // For transferring HttpContext to process

                initModel(); // Model initialization

                process.initProcess(httpContextA, p); // Process initialization
                process.isDebug = p.isDebug;

                process.checkSession(); // Session control
                process.checkAuthorized(); // User authorization control

                procData = process.doPost(); // To call the page process for sending actions to api
                if (p.isDebug) Console.WriteLine("procData : " + procData);

                dbQuery = process.dbQuery;

                if (procData == null || !dbQuery)
                {
                    errorString = process.errorString;
                    if (p.isDebug) Console.WriteLine("CS errorString : " + errorString);
                }
                else
                {
                    tableData = process.tableData;
                    if (p.isDebug) Console.WriteLine("tableData[0][1] : " + tableData[0][1]);
                }
                p = process.p;
                messages = process.messages;
                messageString = process.messageString;
                if (p.isDebug) Console.WriteLine("messages[0] : " + messages[0]);
                if (p.isDebug) Debug.WriteLine("messageString : " + messageString);

                contentResult = new ContentResult();
                contentResult.Content = procData; // To send datas to ajax
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