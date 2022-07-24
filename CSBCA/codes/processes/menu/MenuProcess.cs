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

namespace CSBCA.codes.processes
{
    public class MenuProcess : BaseProcess
    {
        public new MenuParams p = null;
        public void initProcess(IHttpContextAccessor httpContextA, MenuParams p)
        {
            this.p = p;
            base.initProcess(httpContextA, p);
            isDebug = p.isDebug;
        }
        public new string doGet()
        {
            string jsObjData = "null";

            try
            {
                dbQuery = p.execTableWR.tableActionWR(p.action, p.formData, p.prepQueryWR);

                qsql = p.execTableWR.getQueryString();
                qsql2 = p.execTableWR.selectQuery[1];

                if (dbQuery)
                {
                    p.tableData = (string[][])p.execTableWR.selectData(p.dataType);
                }
                else
                    errorString = p.execTableWR.getErrorString();

                p.jsonConverter = new JsonConverter(p.fieldNames, p.tableData, p.execTableWR);
                jsObjData = p.jsonConverter.convert2JSobj();

                tableData = p.tableData;
                menuString = p.menuBean.getMenu(null, false, p.menuName);
                leftSideStr = p.pageBean.getPage(null, false, p.sideBarName);

                if (isDebug) Console.WriteLine("p.sideBarName: " + p.sideBarName[0] + ", p.menuName :" + p.menuName[0]);
                if (isDebug) Console.WriteLine("menuString: " + menuString);

                messages = p.execTableWR.getMessages();

                p.selLists = p.manageSelList.getLists();
                selLists = p.selLists;

                if (isDebug) Debug.WriteLine("selLists[0][0]: " + selLists[0][0]);

                if (selLists != null && selLists.Length > 0)

                    selectLists = p.jsonConverter.convert2Lists(p.refFieldMatchs, p.selLists);
                else
                    errorString = p.manageSelList.getErrorString();
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
        public new string doPost()
        {
            try
            {
                bool isInsert = p.action.Equals("insert");

                string jsonData = "", msgStr = ""; // qsql = null, 
                int formSize = 0, n = 0;

                string dateTF = "yyyy-MM-dd HH:mm";
                DateTime now = DateTime.Now;

                if (p.action.Equals("select"))
                {
                    formSize = p.selectFields.Length;
                    p.formData = new string[formSize];
                    p.dateFormatter.setIsForm(true);
                    p.dateFormatter.setTimeFormat(BaseParameters.NO);

                    for (int i = 0; i < formSize; i++)
                    {
                        p.formData[i] = request.Form[p.selectFields[i]].ToString();
                    }
                    dbQuery = p.execTableWR.tableActionWR(p.action, p.formData, p.prepQueryWR);

                    if (dbQuery)
                        p.tableData = (string[][])p.execTableWR.selectData(p.dataType);
                    else
                        p.tableData = null;

                    if (p.tableData != null)
                    {
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
                    p.dateFormatter.setIsForm(true);

                    if (isInsert) { p.formData[0] = "0"; n = 1; }

                    for (int i = n; i < formSize - 2; i++)
                    {
                        p.formData[i] = request.Form[p.fieldNames[i]].ToString();
                    }
                    p.formData[3] = ValueChecker.remUnvChr(p.formData[3]);

                    p.formData[formSize - 2] = p.sessionBean.getCode();
                    p.formData[formSize - 1] = now.ToString(dateTF);

                    dbQuery = p.execTableWR.tableActionWR(p.action, p.formData, p.prepQueryWR);

                    if (dbQuery)
                    {
                        if (!isInsert) p.logBean.setLog(p, formSize);

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
                            p.tableData[0] = p.execTableWR.getNewRecord(p.unqFields, p.unqFieldData, p.unqFieldTypes,
                                                                         p.prepQueryWR);
                            p.formData[0] = p.tableData[0][0];

                            p.logBean.setLog(p, formSize);
                        }
                        else
                        {
                            p.tableData[0] = p.formData;
                        }

                        if (!isInsert)
                        {
                            if (p.tableData[0] != null && p.tableData[0][5] != null)
                                p.tableData[0][5] = p.dateFormatter.changeDateFormat(p.tableData[0][5]);
                            else
                                msgStr += ", Attention: p.tableData[0][5] is null";
                        }
                        tableData = p.tableData;
                    }
                    else
                    {
                        p.tableData = null;
                        messageString = "p.tableData is null!";
                        errorString = p.execTableWR.getErrorString();
                        Console.WriteLine(messageString + "\n" + errorString);
                    }
                    messages = p.execTableWR.getMessages();

                    msgStr += formSize.ToString();
                    if (messages[1].Equals(p.execTableWR.getDefMsgScr()))
                        messages[1] = "";
                    messages[1] += msgStr + ", sqlString: " + p.execTableWR.getQueryString();

                    if (isDebug) Console.WriteLine(p.execTableWR.getQueryString());

                    p.execTableWR.setMessages(messages);

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
