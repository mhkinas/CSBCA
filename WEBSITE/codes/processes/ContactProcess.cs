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
using WEBSITE.codes.bean;

namespace WEBSITE.codes.processes
{
    public class ContactProcess : BaseProcess
    {
        public new ContactParams p = null;
        public string centerPageStr = null, rightSiteStr = null, topPageStr = null, bottomPageStr = null;
        LinPageBean linPageBean = null;
        public void initProcess(IHttpContextAccessor httpContextA, ContactParams p)
        {
            this.p = p;
            base.initProcess(httpContextA, p);
        }
        public new string doGet()
        {
            string jsObjData = "null";
            
            try
            {
                linPageBean = new LinPageBean(p.runDB);

                centerPageStr = linPageBean.getLinPage("contact");

                //rightSiteStr = linPageBean.getThemePage("right");

                topPageStr = linPageBean.getThemePage("top");

                bottomPageStr = linPageBean.getThemePage("buttom");

                menuString = linPageBean.getMenuStr();
            }
            catch (Exception ex)
            {

                if (!linPageBean.getErrorString().Equals("null errorString"))
                    errorString = linPageBean.getErrorString();
                else
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
            bool isInsert = false;

            string jsonData = "null", msgStr = ""; 
            int formSize = 0, n = 0;

            string dateTF = "yyyy-MM-dd HH:mm";
            DateTime now = DateTime.Now;

            try
            {
                isInsert = p.action.Equals("insert");

                if (!isInsert)
                    return "null";
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
                    p.formData[4] = ValueChecker.remUnvChr(p.formData[4]);

                    p.formData[formSize - 1] = now.ToString(dateTF);

                    dbQuery = p.executeTable.tableAction(p.action, p.formData, p.prepQueryWR);

                    if (dbQuery)
                    {
                        p.tableData = new string[1][];

                        p.tableData[0] = p.formData;

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
                        errorString = p.executeTable.getErrorString();
                        Console.WriteLine(messageString + "\n" + errorString);
                    }
                    messages = p.executeTable.getMessages();

                    msgStr += formSize.ToString();
                    if (messages[1].Equals(p.executeTable.getDefMsgScr()))
                        messages[1] = "";
                    messages[1] += msgStr + ", sqlString: " + p.executeTable.getQueryString();

                    p.execTableWR.setMessages(messages);

                    p.jsonConverter = new JsonConverter(p.fieldNames, p.tableData, p.executeTable);
                    jsonData = p.jsonConverter.convert2Json();
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
            return jsonData;
        }
    }
}

