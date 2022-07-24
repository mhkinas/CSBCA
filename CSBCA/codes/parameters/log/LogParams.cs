/**
   csbca - v1.0 - 2020-10-12
   https://www.hayatikinas.com
   This code is part of the CSBCA project
   And it can be used under license terms.
   Copyright Mehmet Hayati KINAŞ
 */

using SDBCS.dbwork;
using SDBCS.management;
using SDBCS.utility;

namespace CSBCA.codes.parameters
{
    public class LogParams : BaseParameters
	{
		public new void initParams()
		{
			base.initParams();

			isDebug = true;
			tableNames = new string[] { "csbc_log", "vt_csbc_log" };
			fieldNames = new string[] { "id", "rec_id", "form_name", "type_name", "table_name", "log_data", "rec_user", "rec_date" };
			inputTypes = new string[] { "number", "number", "text", "text", "text", "textarea", "text", "datetime-local" };
			selectFields = new string[] { "rec_id", "form_name", "type_name", "table_name", "rec_user", "rec_date1", "rec_date2" };
			selectITs = new string[] { "number", "text", "text", "text", "text", "date", "date" };
			setLabels();
			colWidths = new int[] { 10, 10, 20, 10, 20, 100, 10, 15 };
			readOnlyFM = new int[] { 0, 1, 2, 3, 4, 5, 6, 7 };
			invisibleFM = new int[] { -1, -1, -1, -1, -1, 5, -1, -1 };
			requiredFM = new int[] { -1, -1, -1, -1, -1, -1, -1, -1 };
			equalityInt = new int[] { EQ, EQ, EQ, EQ, EQ, BGE, SME };
			unqFields = new string[] { "id" };
			unqFieldTypes = new int[] { INTEGER };
			unqMatchs = new int[] { 0, -1, -1, -1, -1, -1, -1, -1 };
			fieldTypes = new int[] { INTEGER, INTEGER, STRING, STRING, STRING, STRING, STRING, DATE };
			selectFTs = new int[] { INTEGER, STRING, STRING, STRING, STRING, DATE, DATE };
			dataType = STRING; setExcelCols();
			orderBy = "log_id";
			refTableNames = new string[] { "vt_csbc_log_form", "vt_csbc_log_type", "vt_csbc_log_table", "vt_csbc_user" };
			refFieldNames = new string[] { "log_form_name", "log_type_name", "log_table_name", "user_code" };
			refFieldMatchs = new int[] { -1, -1, 2, 3, 4, -1, 6, -1 };
			dateFormatter = new DateFormatter(dbSystem); dateFormatter.setIsCast(true);
			dateFormatter.setTimeFormat(HM); // T
			dateFormatter.setIsCast(true);
			prepQueryWR = new PrepQueryWithRef();
			prepQueryWR.convert2EQLs(equalityInt);
			runDB.setMaxRecord(1000);
			execTableWR = new ExecTableWithRef(runDB, tableNames, fieldNames, fieldTypes, orderBy, selectFields, selectFTs,
													dateFormatter, refTableNames, refFieldNames, refFieldMatchs, messageBean);
			manageSelList = new ManageSelList(runDB, refTableNames, refFieldNames);
			
			execTableWR.isAfterCommit = false;
			execTableWR.isDebug = isDebug; 
			authorized = new string[] { "Admin", "Supervisor" };
			isModal = true; isWithRefs = true;
		}
		public void setLabels()
		{
			if (isLocale)
			{
				pageTitle = "Log";
				pageName = "/log/log-tr";
				sideBarName = new string[] { "Loglar-Sidebar", "/CSBCA/page/" };
				labelNames = new string[] { "ID", "Kayıt ID", "Form Adı", "Log Tipi", "Log Tablosu", "Kayıt", "Kaydeden", "Kayıt Tarihi" };
				selectLabels = new string[] { "Kayıt ID", "Form Adı", "Log Tipi", "Log Tablosu", "Kaydeden", "Başlangıç Tarih", "Bitiş Tarih" };
			}
			else
			{
				pageTitle = "Log";
				pageName = "/log/log";
				sideBarName = new string[] { "Logs-Sidebar", "/CSBCA/page/" };
				labelNames = new string[] { "ID", "Record ID", "Form Name", "Log Type", "Log Table", "Record", "Recorder", "Record Date" };
				selectLabels = new string[] { "Record ID", "Form Name", "Log Type", "Log Table", "Recorder", "Start Date", "End Date" };
			}
		}
	}
}
