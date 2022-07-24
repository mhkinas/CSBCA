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
using Microsoft.AspNetCore.Http;
using SDBCS.utility;

namespace CSBCA.codes.processes
{
    public class AdminProcess : BaseProcess
    {
        public new AdminParams p = null;
        
        // To initialize process
        public void initProcess(IHttpContextAccessor httpContextA, AdminParams p)
        {
            this.p = p; 
            base.initProcess(httpContextA, p);
            isDebug = p.isDebug;
        }
        
		// For seending page parameters to PageModel
        public new string doGet()
        {
            string jsObjData = "null"; // Javascript object data string value

            try
            {
                // For executing database query operations
                dbQuery = p.execTableWR.tableActionWR(p.action, p.formData, p.prepQueryWR);

                qsql = p.execTableWR.getQueryString();
                qsql2 = p.execTableWR.selectQuery[1];

                if (dbQuery)
                {
                    // If query is true get table data from api
                    p.tableData = (string[][])p.execTableWR.selectData(p.dataType);
                    p.setPasX(3);
                }
                else
                    errorString = p.execTableWR.getErrorString();

                // JsonConverter take parameters for converting to javascript object
                p.jsonConverter = new JsonConverter(p.fieldNames, p.tableData, p.execTableWR);
                jsObjData = p.jsonConverter.convert2JSobj();

                // To setting page parameters
                tableData = p.tableData;

                messages = p.execTableWR.getMessages();

                p.selLists = p.manageSelList.getLists();
                selLists = p.selLists;

                if (selLists != null && selLists.Length > 0)
                {
                    if (isDebug) Console.WriteLine("selLists[0][0]: " + selLists[0][0]);

                    selectLists = p.jsonConverter.convert2Lists(p.refFieldMatchs, p.selLists);
                }
                else
                    selectLists = null;
            }
            catch (Exception ex)
            {
                errorString = p.manageSelList.getErrorString();
                Console.WriteLine("ManageSelList errorString: " + errorString);

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
        
		// To make database operations and send operation datas to PageModel
        public new string doPost()
        {
            bool isInsert = false;

            string jsonData = "", msgStr = "";  
            int formSize = 0, n = 0;

            string dateTF = "yyyy-MM-dd HH:mm";
            DateTime now = DateTime.Now;

            try
            {
                if (request != null && request.Form["action"].ToString() != null)
                    p.action = request.Form["action"].ToString(); // Take action from form
                else
                    return null;

                isInsert = p.action.Equals("insert");

                if (p.action.Equals("select")) // For selecting datas from database
                {
                    formSize = p.selectFields.Length;
                    p.formData = new string[formSize];
                    p.dateFormatter.setIsForm(true);
                    p.dateFormatter.setTimeFormat(BaseParameters.NO);

                    // To take form datas from ajax or fetch
                    for (int i = 0; i < formSize; i++)
                    {
                        p.formData[i] = request.Form[p.selectFields[i]].ToString();
                    }
                    
					// To execute the query after preparing
                    dbQuery = p.execTableWR.tableActionWR(p.action, p.formData, p.prepQueryWR);

                    if (dbQuery)
                        // If query is true get table data from api
                        p.tableData = (string[][])p.execTableWR.selectData(p.dataType);
                    else
                        p.tableData = null;

                    if (p.tableData != null)
                    {
                        // JsonConverter take parameters for converting to json
                        p.jsonConverter = new JsonConverter(p.fieldNames, p.tableData, p.execTableWR);
                        jsonData = p.jsonConverter.convert2Json();
                        tableData = p.tableData;
                    }
                    messages = p.execTableWR.getMessages();

                    return jsonData;
                }
                else
                {
                    formSize = p.fieldNames.Length;
                    p.formData = new string[formSize];
                    p.dateFormatter.setIsForm(true); // It is true, because date data is taken from the form

                    if (isInsert) { p.formData[0] = "0"; n = 1; }

                    for (int i = n; i < formSize-2; i++)
                    {
                        p.formData[i] = request.Form[p.fieldNames[i]].ToString();
                    }
                    if (p.formData[3] != null && p.formData[3].Length >= 8 && !ValueChecker.isNumeric(p.formData[3]))

                        // If password is suitable, managePassword will hash password.
                        p.formData[3] = p.managePassword.hashPasw(p.formData[0], p.formData[3], isInsert);
                    else
                    {
                        p.formData[3] = "xxxxxxxxx";
                        msgStr += p.messageBean.getInvalidPassword(); // If is Password invalid.
                    }

                    if (!p.managePassword.getErrorString().Equals("null errorString"))
                        msgStr += ", " + p.managePassword.getErrorString();

                    if (!ValueChecker.isEmailAddress(p.formData[5]))
                        msgStr += p.messageBean.getInvalidEmail(); // Get invalid email message, when email is not valid.

                    p.formData[formSize - 2] = p.sessionBean.getCode();
                    p.formData[formSize - 1] = now.ToString(dateTF);

                    if(isDebug)
                    {
                        for(int i = 0; i < p.formData.Length; i++)
                        {
                            Debug.WriteLine("formData[" + i + "]: " + p.formData[i]);
                        }
                        Console.WriteLine("p.execTableWR.isDebug:" + p.execTableWR.isDebug);
                        Console.WriteLine("p.execTableWR.getRefTabledNames[0]:" + p.execTableWR.getRefTableNames()[0]);
                        Console.WriteLine("p.execTableWR.getRefFieldNames[0]:" + p.execTableWR.getRefFieldNames()[0]);
                        Console.WriteLine("p.execTableWR.getRefFieldMatchs[1]:" + p.execTableWR.getRefFieldMatchs()[1]);
                    }

                    // To execute the query after preparing
                    dbQuery = p.execTableWR.tableActionWR(p.action, p.formData, p.prepQueryWR);

                    if (isDebug && !p.action.Equals("delete"))
                    {
                        Console.WriteLine("p.execTableWR.getRefDataQuery()[0]:"+p.execTableWR.getRefDataQuery()[0]);
                        Console.WriteLine("p.execTableWR.getRefData()[0]:" + p.execTableWR.getRefData()[0]);
                        Console.WriteLine(p.execTableWR.getQueryString());
                    }

                    if (dbQuery)
                    {
                        if (!isInsert) p.logBean.setLog(p, formSize); // For logging

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
                            // To get id for new record
                            p.tableData[0] = p.execTableWR.getNewRecord(p.unqFields, p.unqFieldData, p.unqFieldTypes,
                                                                         p.prepQueryWR);
                            p.formData[0] = p.tableData[0][0];

                            p.logBean.setLog(p, formSize); // For logging
                        }
                        else
                        {
                            p.tableData[0] = p.formData;
                        }

                        if (p.tableData[0] != null && p.tableData[0][3] != null)
                            p.setPasX(3);
                        else
                            msgStr += ", Attention: p.tableData[0][3] is null";

                        if (!isInsert)
                        {
                            if (p.tableData[0] != null && p.tableData[0][9] != null)
                                p.tableData[0][9] = p.dateFormatter.changeDateFormat(p.tableData[0][9]);
                            else
                                msgStr += ", Attention: p.tableData[0][9] is null";
                        }
                        tableData = p.tableData;
                    }
                    else
                    {
                        p.tableData = null;
                        messageString = "p.tableData is null!";
                        errorString = p.execTableWR.getErrorString();
                        Console.WriteLine(messageString +"\n"+ errorString);
                    }
                    messages = p.execTableWR.getMessages();

                    msgStr += formSize.ToString();
                    if (messages[1].Equals(p.execTableWR.getDefMsgScr()))
                        messages[1] = "";
                    messages[1] += msgStr + ", sqlString: " + p.execTableWR.getQueryString();

                    if (isDebug) Console.WriteLine(p.execTableWR.getQueryString());

                    p.execTableWR.setMessages(messages);

                    // JsonConverter take parameters for converting to json
                    p.jsonConverter = new JsonConverter(p.fieldNames, p.tableData, p.execTableWR);
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
    }
}
