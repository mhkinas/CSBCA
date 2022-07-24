using CSBCA.codes.parameters;
using SDBCS.dbwork;
using SDBCS.utility;
using System;
using System.Data.Common;
using System.Data.SqlClient;

namespace CSBCA.codes.bean
{
    public class LogBean
    {
		private string[] tableNames, fieldNames, refTableNames, refFieldNames, logData, refKeyFields;
		private int[] refFieldMatchs;

		private RunDB runDB;
		private DbDataReader dataReader;
		private bool dbQuery = false, isDebug = false;

		private string errorString = "null errorString", queryStr = null;

		public LogBean(RunDB runDB)
		{
			this.runDB = runDB;

			tableNames = new string[] { "csbc_log", "vt_csbc_log" };
			fieldNames = new string[] { "id", "rec_id", "form_name", "type_name", "table_name", "log_data", "rec_user", "rec_date" };
			refTableNames = new string[] { "vt_csbc_log_form", "vt_csbc_log_type", "vt_csbc_log_table", "vt_csbc_user" };
			refFieldNames = new string[] { "log_form_name", "log_type_name", "log_table_name", "user_code" };
			refFieldMatchs = new int[] { -1, -1, 2, 3, 4, -1, 6, -1 };
			refKeyFields = new string[] { "id", "id", "id", "id" };

			logData = new string[fieldNames.Length];
			dbQuery = false;
		}

		public bool setLog(BaseParameters p, int formSize)
		{
			string refID = null;
			string[] queryString = new string[1];
			isDebug = p.isDebug;
			if (isDebug) Console.WriteLine("LogBean ilerleme 01!");

			logData[0] = "0";
			logData[1] = p.formData[0];
			logData[2] = p.pageTitle;
			logData[3] = p.action;
			logData[4] = p.tableNames[0];
			logData[5] = "'{";
			if (isDebug) Console.WriteLine("LogBean ilerleme 02!");

			for (int i = 0; i < formSize - 2; i++)
			{
				if (i != p.invisibleFM[i])
				{
					logData[5] += "\"" + p.fieldNames[i] + "\": \"" + p.formData[i] + "\"";

					if (i < p.fieldNames.Length - 3)
						logData[5] += ",";
				}
			}
			if (isDebug) Console.WriteLine("LogBean ilerleme 03!");
			logData[5] += "}'";
			if (p.dbSystem == RunDB.SQLSERVER) logData[5] = ValueChecker.remUnvChr4Log(logData[5]);
			logData[6] = p.formData[formSize - 2];
			logData[7] = p.dateFormatter.getStringToDate(p.formData[formSize - 1].Trim());

			queryStr = logData[5];
			if(isDebug) Console.WriteLine("LogBean q1: "+queryStr);

			try
			{
				queryString[0] = "insert into " + tableNames[0] + " (";

				for (int i = 1; i < fieldNames.Length; i++)
				{
					queryString[0] += fieldNames[i];

					if (i < fieldNames.Length - 1)
						queryString[0] += ",";
				}
				queryString[0] += ") values(";
				if (isDebug) Console.WriteLine("LogBean ilerleme 04!");

				int j = 0;
				for (int i = 1; i < fieldNames.Length; i++)
				{
					if (isDebug) Console.WriteLine("LogBean ilerleme 05!");

					if (i == refFieldMatchs[i])
					{
						refID = getRefID(j, logData[i]);

						if (isDebug) Console.WriteLine("LogBean ilerleme 051!");
						if (isDebug) Console.WriteLine("refID :"+refID);

						if (refID != null)
							queryString[0] += refID;
						else
						{
							errorString = "Error : Number " + i + " refID is null!";
							return false;
						}
						refID = null; j++;
					}
					else
					{
						queryString[0] += logData[i];
					}
					if (i < fieldNames.Length - 1)
						queryString[0] += ",";
				}
				queryString[0] += ")";

				queryStr = queryString[0];

				if (isDebug) Console.WriteLine("LogBean q2: " + queryStr);

				if (!errorString.Equals("null errorString"))
				{
					Console.WriteLine(errorString);
					Console.WriteLine(queryString[0]);
				}
				runDB.closeDataReader();

				runDB.runQuery(queryString, 0, RunDB.EXECUTENONQUERY);
			}
			catch (Exception e)
			{
				Console.WriteLine(e.Message);

				string eStr = runDB.errorString;

				if (!eStr.Equals("null errorString"))

					errorString = "RunDB " + eStr;
				else
					errorString = "Error : " + e.Message;

				errorString += ", SQL : " + queryStr;
				return false;
			}
			return true;
		}

		private string getRefID(int i, String refData)
		{
			string refID = null;
			string[] queryString = new string[1];

			try
			{
				queryString[0] = "select " + refKeyFields[i] + " from " + refTableNames[i] + " where " + refFieldNames[i] + " = '" + refData + "'";

				runDB.closeDataReader();

				dbQuery = runDB.runQuery(queryString, 0, RunDB.EXECUTEREADER);

				if (dbQuery)
				{
					dataReader = runDB.dataReader;

					if (dataReader.Read())
					{
						refID = dataReader.GetString(0);
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
			return refID;
		}

		public void closeAll()
		{
			try
			{
				runDB.closeAll();
			}
			catch (Exception e)
			{
				errorString = "close Error: " + e;
			}
		}

		public int getFieldLength()
		{
			return fieldNames.Length;
		}

		public String getErrorString()
		{
			return errorString;
		}

		public void setRefKeyFields(string[] refKeyFields)
		{
			this.refKeyFields = refKeyFields;
		}

		public String getQueryStr()
		{
			return queryStr;
		}
	}
}
