/**
   csbca - v1.0 - 2020-10-12
   https://www.hayatikinas.com
   This code is part of the CSBCA project
   And it can be used under license terms.
   Copyright Mehmet Hayati KINAŞ
 */

using SDBCS.bean;
using SDBCS.dbwork;
using System;
using System.Data.Common;
using System.Data.SqlClient;

namespace CSBCA.codes.bean
{
    public class StatusBean
    {
        private string tableName, keyField, keyData, statusField;
        private string[] unqField;

        private RunDB runDB;
        private DbDataReader dataReader;
        private bool dbQuery = false;

        private string errorString = "null errorString";

        public StatusBean(RunDB runDB, string tableName, string keyField, string[] unqField, string statusField)
        {
            this.runDB = runDB;
            this.tableName = tableName;
            this.keyField = keyField;
            this.unqField = unqField;
            this.statusField = statusField;
        }

        public void getKeyData(string[] unqData)
        {
            KeyDataBean keyDataBean = new KeyDataBean(runDB, tableName, keyField, unqField);

            keyData = keyDataBean.getKeyData(unqData);

            keyDataBean.closeDR();
        }

        public string getStatus(string keyData, bool isKey, string[] unqData)
        {
            string statusData = null;
            string[] queryString = new string[1];

            try
            {
                if (!isKey)
                    getKeyData(unqData);
                else
                    this.keyData = keyData;

                queryString[0] = "select " + statusField + " from " + tableName + " where " + keyField + "=" + this.keyData;

                runDB.closeDataReader();

                dbQuery = runDB.runQuery(queryString, 0, RunDB.EXECUTEREADER);

                if (dbQuery)
                {
                    dataReader = runDB.dataReader;

                    if (dataReader.Read())
                    {
                        statusData = dataReader.GetString(0);
                    }
                    else
                    {
                        errorString = "Record did not found!";
                    }
                }
                else
                {
                    errorString = "Query did not work! SQL : " + queryString[0];
                }
            }
            catch (SqlException e)
            {
                Console.WriteLine(e.Message);

                if (!runDB.errorString.Equals("null errorString"))
                    errorString = "RunDB " + runDB.errorString;
                else
                    errorString = "SQL Error : " + e.Message;

                errorString += ", SQL : " + queryString[0];
            }
            return statusData;
        }


        public bool setStatus(string keyData, bool isKey, string[] unqData, string statusData)
        {
            string[] queryString = new string[1];

            try
            {
                if (!isKey)
                    getKeyData(unqData);
                else
                    this.keyData = keyData;

                queryString[0] = "update " + tableName + " set " + statusField + "=" + statusData + " where " + keyField + "=" + this.keyData;

                runDB.runQuery(queryString, 0, RunDB.EXECUTENONQUERY);
            }
            catch (SqlException e)
            {
                Console.WriteLine(e.Message);

                if (!runDB.errorString.Equals("null errorString"))

                    errorString = "RunDB " + runDB.errorString;
                else
                    errorString = "SQL Error : " + e.Message;

                errorString += ", SQL : " + queryString[0];
                return false;
            }
            return true;
        }

        public void closeAll()
        {
            try
            {
                //if (dataReader != null) dataReader.Close();

                runDB.closeAll();
            }
            catch (SqlException e)
            {
                errorString = "close Error: " + e;
            }
        }

        public string getErrorString()
        {
            return errorString;
        }
    }
}
