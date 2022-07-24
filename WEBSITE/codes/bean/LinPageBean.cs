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
using WEBSITE.codes.parameters;

namespace WEBSITE.codes.bean
{
    public class LinPageBean
    {
		private string keyField, pageField, theme;
		private string[] tableNames, unqField, unqData = new string[1];

		private RunDB runDB;
		private DbDataReader dataReader;
		public bool dbQuery = false, isDebug = false;
		
		private string errorString = "null errorString";
		private BaseParameters p;

		public LinPageBean()
        {
			p = new BaseParameters();
			p.initParams();
			runDB = p.runDB;

			initBean();
		}
		public LinPageBean(RunDB runDB)
		{
			this.runDB = runDB;

			initBean();
		}
		public void initBean()
		{
			tableNames = new string[] {"csbc_page", "vt_csbc_page" };
			keyField = "id";
			unqField = new string[] { "page_name" };
			pageField = "page_data";
		}
		public string getLinPage(string linkName)
		{
			string pageData = null;
			string[] queryString = new string[1];
			PageBean pageBean = new PageBean(runDB, tableNames, keyField, unqField, pageField);

			try
			{
				queryString[0] = "select linked_page, theme from vt_csbc_page_link where link_name='" + linkName + "'";

				runDB.closeDataReader();

				dbQuery = runDB.runQuery(queryString, 0, RunDB.EXECUTEREADER);

				if (dbQuery)
				{
					dataReader = runDB.dataReader;

					if (dataReader.Read())
					{
						unqData[0] = dataReader.GetString(0);

						theme = dataReader.GetString(1);

						pageData = pageBean.getPage(null, false, unqData);

						if (isDebug) Console.WriteLine(pageData); // For debugging

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
				if (!runDB.errorString.Equals("null errorString"))
					errorString = runDB.errorString;
				else
					errorString = "SQL Error : " + e.Message;

				errorString += ", SQL : " + queryString[0];
				
				Console.WriteLine(errorString);
			}
			return pageData;
		}

		public String getThemePage(string position)
		{
			string pageData = null;
			string[] queryString = new string[1];
			PageBean pageBean = new PageBean(runDB, tableNames, keyField, unqField, pageField);

			try
			{
				queryString[0] = "select mapped_page from vt_csbc_page_map where theme='" + theme +
								 "' and position='" + position + "'";

				runDB.closeDataReader();

				dbQuery = runDB.runQuery(queryString, 0, RunDB.EXECUTEREADER);

				if (dbQuery)
				{
					dataReader = runDB.dataReader;

					if (dataReader.Read())
					{
						unqData[0] = dataReader.GetString(0);

						pageData = pageBean.getPage(null, false, unqData);

						if (isDebug) Console.WriteLine(pageData); // For debugging

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
				if (!runDB.errorString.Equals("null errorString"))
					errorString = runDB.errorString;
				else
					errorString = "SQL Error : " + e.Message;

				errorString += ", SQL : " + queryString[0];

				Console.WriteLine(errorString);
			}
			return pageData;
		}

		public string getMenuStr()
		{
			string menuData = null;
			string[] queryString = new string[1];
			tableNames = new string[] { "csbc_menu", "vt_csbc_menu" };
			MenuBean menuBean = new MenuBean(runDB, tableNames, "id", new string[] { "menu_name" }, "menu_data");
			try
			{
				queryString[0] = "select theme_menu from vt_csbc_theme where theme_name='" + theme + "'";

				runDB.closeDataReader();

				dbQuery = runDB.runQuery(queryString, 0, RunDB.EXECUTEREADER);

				if (dbQuery)
				{
					dataReader = runDB.dataReader;

					if (dataReader.Read())
					{
						unqData[0] = dataReader.GetString(0);

						menuData = menuBean.getMenu(null, false, unqData);

						if (isDebug) Console.WriteLine(menuData); // For debugging
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
				if (!runDB.errorString.Equals("null errorString"))
					errorString = runDB.errorString;
				else
					errorString = "SQL Error : " + e.Message;

				errorString += ", SQL : " + queryString[0];

				Console.WriteLine(errorString);
			}
			return menuData;
		}

		public void closeAll()
		{
			try
			{
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
