
using CSBCA.codes.parameters;
using Microsoft.AspNetCore.Http;
using SDBCS.utility;
using System;
using System.Diagnostics;

namespace CSBCA.codes.processes
{
    public class LogProcess : BaseProcess
    {
        public new LogParams p = null;
        public string codeStrMW90 = null, codeStrBW = null;
        public void initProcess(IHttpContextAccessor httpContextA, LogParams p)
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
                jsObjData = p.jsonConverter.convLog2Json(5);

                tableData = p.tableData;
                menuString = p.menuBean.getMenu(null, false, p.menuName);
                leftSideStr = p.pageBean.getPage(null, false, p.sideBarName);

                codeStrMW90 = p.codeBean.getCode(null, false, new String[] { "modal-width-90", "/CSBCA/code/" });
                codeStrBW = p.codeBean.getCode(null, false, new String[] { "back-warn", "/CSBCA/code/" });

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
            string jsonData = "";
            int formSize = 0;

            try
            {
                if (request != null && request.Form["action"].ToString() != null)
                    p.action = request.Form["action"].ToString();
                else
                    return null;

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
