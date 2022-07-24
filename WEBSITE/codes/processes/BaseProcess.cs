/**
   csbca - v1.0 - 2020-10-12
   https://www.hayatikinas.com
   This code is part of the CSBCA project
   And it can be used under license terms.
   Copyright Mehmet Hayati KINAŞ
 */

using WEBSITE.codes.parameters;
using Microsoft.AspNetCore.Http;
using SDBCS.utility;
using System;
using System.Diagnostics;
using System.IO;

namespace WEBSITE.codes.processes
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

        public string qsql, qsql2;
        public string[] messages;
        public string[][] tableData, selLists;

        public bool dbQuery;
        public bool isDebug { get; set; }

        public void initProcess(IHttpContextAccessor httpContextA, BaseParameters p)
        {
            initContext(httpContextA);
            initParameters(p);
        }
        public void initContext(IHttpContextAccessor httpContextA)
        {
            this.httpContextA = httpContextA;
            request = httpContextA.HttpContext.Request;
            response = httpContextA.HttpContext.Response;
            session = httpContextA.HttpContext.Session;
        }
        public void initParameters(BaseParameters p)
        {
            this.p = p;
            tableData = null;
            selLists = null;
            qsql = null;
            messages = null; // new string[3];
            menuString = null;
            leftSideStr = null;
            errorString = null;
            messageString = null;
            selectLists = null;
            dbQuery = false;
            isDebug = false;
        }
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
                    if (isDebug) Debug.WriteLine(e.Message);
                    errorString = e.Message;
                }
            }
        }
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
        public string doGet()
        {
            string jsObjData = "null";

            try
            {
                dbQuery = p.executeTable.tableAction(p.action, p.formData, p.prepareQuery);

                qsql = p.executeTable.getQueryString();
                qsql2 = p.executeTable.selectQuery[1];

                if (dbQuery)
                    p.tableData = (string[][])p.executeTable.selectData(p.dataType);
                else
                    errorString = p.executeTable.getErrorString();

                p.jsonConverter = new JsonConverter(p.fieldNames, p.tableData, p.executeTable);
                jsObjData = p.jsonConverter.convert2JSobj();

                tableData = p.tableData;
                menuString = p.menuBean.getMenu(null, false, new string[] { p.menuName });
                leftSideStr = p.pageBean.getPage(null, false, new string[] { p.sideBarName });

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
        public string doPost()
        {
            bool isInsert = false;

            string jsonData = "", msgStr = "";
            int formSize = 0, n = 0;

            try
            {
                if (request != null && request.Form["action"].ToString() != null)
                    p.action = request.Form["action"].ToString();
                else
                    return null;

                isInsert = p.action.Equals("insert");

                if (p.action.Equals("select"))
                {
                    formSize = p.selectFields.Length;
                    p.formData = new string[formSize];

                    for (int i = 0; i < formSize; i++)
                    {
                        p.formData[i] = request.Form[p.selectFields[i]].ToString();
                    }
                    dbQuery = p.executeTable.tableAction(p.action, p.formData, p.prepareQuery);

                    if (dbQuery)
                        p.tableData = (string[][])p.executeTable.selectData(p.dataType);
                    else
                        p.tableData = null;

                    if (p.tableData != null)
                    {
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

                    msgStr += formSize.ToString();
                    if (messages[1].Equals(p.executeTable.getDefMsgScr()))
                        messages[1] = "";
                    messages[1] += msgStr + ", sqlString: " + p.executeTable.getQueryString();
                    if (isDebug) Console.WriteLine(p.executeTable.getQueryString());

                    p.executeTable.setMessages(messages);

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
        public bool doUpload()
        {
            string fileNP, msgStr;
            MemoryStream stream = new MemoryStream();

            if (isDebug) Console.WriteLine("doUpload begun 01!");

            try
            {
                request.Form.Files[0].CopyTo(stream);

                if (stream == null)
                    return false;

                byte[] buffer = stream.ToArray();

                string strStream = BitConverter.ToString(buffer);

                if (isDebug) Console.WriteLine("strStream:" + strStream);

                if (buffer != null)
                {
                    p.execFileData.buffer = buffer;
                    p.execFileData.setKeyData(p.tableData[0][0]);

                    if (isDebug) Console.WriteLine("doUpload begun 02!");

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
                if (isDebug) Console.WriteLine("doUpload begun 03!");

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
        public byte[] doDownload() // File download from db
        {
            MemoryStream stream = new MemoryStream();
            string fileID = null;
            byte[] buffer = null;

            try
            {
                fileID = request.Form[p.fieldNames[0]].ToString();

                if (isDebug) Console.WriteLine("fileID:" + fileID);

                p.execFileData.setKeyData(fileID);

                p.execFileData.tableAction(p.action, true);

                buffer = p.execFileData.buffer; //stream.ToArray();

                if (buffer != null)
                {
                    string strBuffer = BitConverter.ToString(buffer);

                    if (isDebug) Console.WriteLine("strStream:" + strBuffer);

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
