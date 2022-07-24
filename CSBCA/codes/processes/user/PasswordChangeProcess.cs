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
    public class PasswordChangeProcess : BaseProcess
    {
        public new PasswordChangeParams p = null;
        public void initProcess(IHttpContextAccessor httpContextA, PasswordChangeParams p)
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
                menuString = p.menuBean.getMenu(null, false, p.menuName);
                leftSideStr = p.pageBean.getPage(null, false, p.sideBarName);

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
        public new string doPost()
        {
            int formSize;
            string jsonData = "null", keyData, hashedPasw;
            messages = new string[3];

            try
            {
                if (request != null && request.Form["action"].ToString() != null)
                    p.action = request.Form["action"].ToString();
                else
                    return null;

                if (p.action.Equals("update"))
                {
                    formSize = p.fieldNames.Length;
                    p.formData = new string[formSize];

                    p.formData[0] = p.sessionBean.getCode();

                    for (int i = 1; i < formSize; i++)
                    {
                        p.formData[i] = request.Form[p.fieldNames[i]].ToString();
                    }

                    keyData = p.passwordBean.getKeyData(new string[] { p.formData[0] });
                    Console.WriteLine("keyData: " + keyData);

                    hashedPasw = p.managePassword.hashPasw(keyData, p.formData[1], false);
                    Console.WriteLine("hashedPasw: " + hashedPasw);

                    if (p.formData[1] != null && hashedPasw.Equals(p.passwordBean.getPassword(keyData)) &&
                            p.formData[2] != null && p.formData[2].Length >= 8 && !ValueChecker.isNumeric(p.formData[2]))
                    {
                        if (p.formData[2] != null && p.formData[2].Equals(p.formData[1]))
                        {
                            messages[1] = p.messageBean.getPasswordNotEqual();
                        }
                        else if (p.formData[2] != null && p.formData[3] != null && p.formData[2].Equals(p.formData[3]))
                        {
                            p.formData[2] = p.managePassword.hashPasw(keyData, p.formData[2], false);

                            p.passwordBean.setPassword(keyData, p.formData[2]);

                            messages[0] = p.messageBean.getPasswordIsChanged();
                        }
                        else
                            messages[1] = p.messageBean.getPasswordNotEqual();
                    }
                    else
                        messages[1] = p.messageBean.getInvalidPassword();

                    p.jsonConverter = new JsonConverter(messages);
                    jsonData = p.jsonConverter.getMessageList(false);
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
