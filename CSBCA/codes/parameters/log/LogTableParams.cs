
using SDBCS.dbwork;
using SDBCS.utility;

namespace CSBCA.codes.parameters
{
    public class LogTableParams : BaseParameters
	{
		public new void initParams()
		{
			base.initParams();

			isDebug = true;
			tableNames = new string[] { "csbc_log_table", "vt_csbc_log_table" };
			fieldNames = new string[] { "id", "log_table_name" };
			inputTypes = new string[] { "number", "text" };
			selectFields = new string[] { "id", "log_table_name" };
			selectITs = new string[] { "number", "text" };
			setLabels();
			equalityInt = new int[] { EQ, LK };
			colWidths = new int[] { 10, 20 };
			readOnlyFM = new int[] { 0, -1 };
			requiredFM = new int[] { -1, 1 };
			invisibleFM = new int[] { -1, -1 };
			unqFields = new string[] { "log_table_name" };
			unqFieldTypes = new int[] { STRING };
			unqMatchs = new int[] { -1, 1 };
			fieldTypes = new int[] { INTEGER, STRING };
			selectFTs = new int[] { INTEGER, STRING };
			dataType = STRING; setExcelCols();
			orderBy = "log_table_id";
			dateFormatter = new DateFormatter(dbSystem); dateFormatter.setIsCast(true);
			prepareQuery = new PrepareQuery();
			prepareQuery.convert2EQLs(equalityInt);
			executeTable = new ExecuteTable(runDB, tableNames, fieldNames, fieldTypes, orderBy, dateFormatter,
											selectFields, selectFTs, messageBean);
			executeTable.isAfterCommit = false; 
			executeTable.isDebug = isDebug; 
			authorized = new string[] { "Admin", "Supervisor" };
			isModal = true; isWithRefs = false;
		}

		public void setLabels()
		{
			if (isLocale)
			{
				pageTitle = "Log Tablo";
				pageName = "/log/log-tablo";
				sideBarName = new string[] { "Loglar-Sidebar", "/CSBCA/page/" };
				labelNames = new string[] { "ID", "Log Tablo" };
			}
			else
			{
				pageTitle = "Log Table";
				pageName = "/log/log-table";
				sideBarName = new string[] { "Logs-Sidebar", "/CSBCA/page/" };
				labelNames = new string[] { "ID", "Log Table" };
			}
		}
	}
}
