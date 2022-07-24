/**
   csbca - v1.0 - 2020-10-12
   https://www.hayatikinas.com
   This code is part of the CSBCA project
   And it can be used under license terms.
   Copyright Mehmet Hayati KINAŞ
 */

using CSBCA.codes.parameters;
using Microsoft.AspNetCore.Http;
using SDBCS.utility;
using System;
using System.Diagnostics;
using System.IO;

namespace CSBCA.codes.processes
{
    public class BaseProcess
    {
        public IHttpContextAccessor httpContextA;
        public HttpRequest request;
        public HttpResponse response;
        public ISession session;
        public BaseParameters p;

        public string menuString { get; set; }
        public string leftSideStr { get; set; }
        public string errorString { get; set; }
        public string messageString { get; set; }
        public string selectLists { get; set; }

        public string qsql, qsql2, excelCols;
        public string[] messages;
        public string[][] tableData, selLists;

        public bool dbQuery, isSSList = true;
        public bool isDebug { get; set; }

        /* For initializing HttpContext and parameters
         */
        public void initProcess(IHttpContextAccessor httpContextA, BaseParameters p)
        {
            initContext(httpContextA);
            initParameters(p);
        }
        // For initializing HttpContext, Request, Response and Session
        public void initContext(IHttpContextAccessor httpContextA)
        { 
            this.httpContextA = httpContextA;
            request = httpContextA.HttpContext.Request;
            response = httpContextA.HttpContext.Response;
            session = httpContextA.HttpContext.Session;
        }
        // For initializing parameters
        public void initParameters(BaseParameters p)
        {
            this.p = p;
            tableData = null;
            selLists = null;
            qsql = null;
            messages = null; 
            menuString = null;
            leftSideStr = null;
            errorString = null;
            messageString = null;
            selectLists = null;
            dbQuery = false;
            isDebug = false;
        }
        // For checking session is available
        public void checkSession()
        {
            if (!session.IsAvailable)
            {
                try
                {
                    response.Redirect(Path.Combine(p.path, p.seProc));
                }
                catch (Exception e)
                {
                    if(isDebug) Debug.WriteLine(e.Message);
                    errorString = e.Message;
                }
            }
        }
        // It is to check whether the user authorization exists.
        public void checkAuthorized()
        {
            foreach (string auth in p.authorized)
            {
                if (p.sessionBean.getGroup().Equals(auth)) // ?
                    p.isAuth = true;
            }
            if (!p.isAuth)
                response.Redirect(Path.Combine(Directory.GetCurrentDirectory(), p.path, p.ueProc));

        }
        // First time, for getting page data to user
        public string doGet()
        {
            string jsObjData = "null"; // Javascript object data string value

            try
            {
                // For executing database query operations
                dbQuery = p.executeTable.tableAction(p.action, p.formData, p.prepareQuery);

                qsql = p.executeTable.getQueryString();
                qsql2 = p.executeTable.selectQuery[1];

                if (dbQuery)
                    // If query is true get table data from api
                    p.tableData = (string[][])p.executeTable.selectData(p.dataType);
                else
                    errorString = p.executeTable.getErrorString();

                // JsonConverter take parameters for converting to javascript object
                p.jsonConverter = new JsonConverter(p.fieldNames, p.tableData, p.executeTable);
                jsObjData = p.jsonConverter.convert2JSobj();

                // To setting page parameters
                tableData = p.tableData;
                menuString = p.menuBean.getMenu(null, false, p.menuName);
                leftSideStr = p.pageBean.getPage(null, false, p.sideBarName);

                messages = p.executeTable.getMessages();

                if (menuString == null)
                    errorString = p.menuBean.getErrorString();

                if (leftSideStr == null)
                    errorString = p.pageBean.getErrorString();
            }
            catch (Exception ex)
            {
                errorString = ex.Message;
                Debug.WriteLine("D01, " + errorString);
                Console.WriteLine("C01, " + errorString);
            }
            finally
            {
                p.runDB.closeAll();
            }
            return jsObjData;
        }
        // For post actions select, insert, update and delete (also download for files)
        public string doPost()
        {
            bool isInsert = false;

            string jsonData = "", msgStr = "";
            int formSize = 0, n = 0;

            try
            {
                if (request != null && request.Form["action"].ToString() != null)
                    p.action = request.Form["action"].ToString();// Take action from form
                else
                    return null;

                isInsert = p.action.Equals("insert");

                if (p.action.Equals("select"))
                {
                    formSize = p.selectFields.Length;
                    p.formData = new string[formSize];

                    // To take form datas from ajax or fetch
                    for (int i = 0; i < formSize; i++)
                    {
                        p.formData[i] = request.Form[p.selectFields[i]].ToString();
                    }
                    
					// To execute the query after preparing
                    dbQuery = p.executeTable.tableAction(p.action, p.formData, p.prepareQuery);

                    if (dbQuery)
                        // If query is true get table data from api
                        p.tableData = (string[][])p.executeTable.selectData(p.dataType);
                    else
                        p.tableData = null;

                    if (p.tableData != null)
                    {
                        // JsonConverter take parameters for converting to json
                        p.jsonConverter = new JsonConverter(p.fieldNames, p.tableData, p.executeTable);
                        jsonData = p.jsonConverter.convert2Json();
                        tableData = p.tableData;
                    }
                    messages = p.executeTable.getMessages();

                    return jsonData;
                }
                else
                {
                    formSize = p.fieldNames.Length;
                    p.formData = new string[formSize];

                    if (isInsert) { p.formData[0] = "0"; n = 1; }

                    for (int i = n; i < formSize; i++)
                    {
                        p.formData[i] = request.Form[p.fieldNames[i]].ToString();
                    }

                    // To execute the query after preparing
                    dbQuery = p.executeTable.tableAction(p.action, p.formData, p.prepareQuery);

                    if (dbQuery)
                    {
                        p.tableData = new string[1][];

                        if (isInsert)
                        {
                            int k = 0;
                            p.unqFieldData = new string[p.unqFields.Length];

                            for (int i = 0; i < formSize; i++)
                            {
                                if (i == p.unqMatchs[i])
                                {
                                    p.unqFieldData[k] = p.formData[i];
                                    k++;
                                }
                            }
                            if (isDebug) Console.WriteLine("p.unqFieldData[0]: " + p.unqFieldData[0]);

                            // To get id for new record
                            p.tableData[0] = p.executeTable.getNewRecord(p.unqFields, p.unqFieldData, p.unqFieldTypes,
                                                                         p.prepareQuery);
                        }
                        else
                            p.tableData[0] = p.formData;

                        tableData = p.tableData;
                    }
                    else
                    {
                        p.tableData = null;
                        messageString = "p.tableData is null!";
                        errorString = p.executeTable.getErrorString();
                        Console.WriteLine(messageString + "\n" + errorString);
                    }
                    messages = p.executeTable.getMessages();

                    // For debugging purposes
                    /*msgStr += formSize.ToString();
                    if (messages[1].Equals(p.executeTable.getDefMsgScr()))
                        messages[1] = "";
                    messages[1] += msgStr + ", sqlString: " + p.executeTable.getQueryString();
                    if (isDebug) Console.WriteLine(p.executeTable.getQueryString());*/

                    p.executeTable.setMessages(messages);

                    // JsonConverter takes parameters for converting to json
                    p.jsonConverter = new JsonConverter(p.fieldNames, p.tableData, p.executeTable);
                    jsonData = p.jsonConverter.convert2Json();

                    return jsonData;
                }
            }
            catch (Exception ex)
            {
                errorString = ex.Message;
                Debug.WriteLine("D02, " + errorString);
                Console.WriteLine("C02, " + errorString);
            }
            finally
            {
                p.runDB.closeAll();
            }
            return null;
        }
        // To take action from ajax or fetch
        public string formAction()
        {
            if (request != null && request.Form["action"].ToString() != null)
            {
                p.action = request.Form["action"].ToString();

                return p.action;
            }
            else
                return null;
        }
        // To upload files to database
        public bool doUpload()
        {
            string fileNP, msgStr;
            MemoryStream stream = new MemoryStream();

            if (isDebug) Console.WriteLine("doUpload begun 01!");

            try
            {
                request.Form.Files[0].CopyTo(stream); // To take file to MemoryStream

                if (stream == null)
                    return false;

                byte[] buffer = stream.ToArray(); // Stream to byte array

                string strStream = BitConverter.ToString(buffer);

                if (buffer != null)
                {
                    // For transferring byte[] buffer and keyData to api
                    p.execFileData.buffer = buffer;
                    p.execFileData.setKeyData(p.tableData[0][0]);

                    if (isDebug) Console.WriteLine("doUpload begun 02!");

                    // To control file upload with api
                    if (!p.execFileData.tableAction(p.action, true))
                    {
                        errorString = p.execFileData.getErrorString();

                        Console.WriteLine("Process error : " + errorString);

                        return false;
                    }
                }
                else
                {
                    fileNP = "Can't find stream";
                    Console.WriteLine("fileNP : " + fileNP);
                }
                if (!p.execFileData.getMessageScript().Equals("null messageScript"))
                {
                    msgStr = p.execFileData.getMessageScript();
                    if (!msgStr.Equals("null messageScript")) Console.WriteLine("msgStr :" + msgStr);
                }
                if (isDebug) Console.WriteLine("doUpload ended!");

                return true;
            }
            catch (Exception ex)
            {
                errorString = ex.Message;
                Debug.WriteLine("D03, " + errorString);
                Console.WriteLine("C03, " + errorString);

                return false;
            }
            finally
            {
                if (stream != null) stream.Close();

                p.runDB.closeAll();
            }
        }
        // To download files from db
        public byte[] doDownload() 
        {
            MemoryStream stream = new MemoryStream();
            string fileID = null;
            byte[] buffer = null;

            try
            {
                fileID = request.Form[p.fieldNames[0]].ToString();

                if (isDebug) Console.WriteLine("fileID:" + fileID);

                p.execFileData.setKeyData(fileID); // Key data is  set

                p.execFileData.tableAction(p.action, true); // Database operation is executed

                buffer = p.execFileData.buffer; // The buffer is taken

                if (buffer != null) // The operation is ok than return buffer
                {
                    if (isDebug) // for debugging purpose
                    {
                        string strBuffer = BitConverter.ToString(buffer);

                        Console.WriteLine("strStream:" + strBuffer);
                    }

                    return buffer;
                }
                else
                {
                    if (isDebug) Console.WriteLine("File buffer is null!");
                    return null;
                }
            }
            catch (Exception ex)
            {
                errorString = ex.Message;
                Debug.WriteLine("D04, " + errorString);
                Console.WriteLine("C04, " + errorString);
            }
            finally
            {
                p.runDB.closeAll();
            }
            return null;
        }
    }
}
