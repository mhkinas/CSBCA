using SDBCS.dbwork;
using SDBCS.filework;
using SDBCS.management;
using SDBCS.utility;

namespace CSBCA.codes.parameters
{
    public class CodeParams : BaseParameters
    {
        public new void initParams()
        {
            base.initParams();

            isDebug = true;
            tableNames = new string[] { "csbc_code", "vt_csbc_code" };
            fieldNames = new string[] { "id", "code_name", "adr_path", "code_type", "rec_user", "rec_date" };
            inputTypes = new string[] { "number", "text", "text", "text", "text", "datetime-local" };
            selectFields = new string[] { "id", "code_name", "adr_path", "code_type", "rec_user", "rec_date1", "rec_date2" };
            selectITs = new string[] { "number", "text", "text", "text", "text", "date", "date" };
            setLabels();
            fileField = "code_data";
            colWidths = new int[] { 10, 30, 30, 10, 10, 15 };
            readOnlyFM = new int[] { 0, -1, -1, -1, 5, 6 };
            invisibleFM = new int[] { -1, -1, -1, -1, -1, -1 };
            requiredFM = new int[] { -1, 1, 2, 3, -1, -1, -1 };
            equalityInt = new int[] { EQ, LK, EQ, EQ, EQ, BGE, SME };
            unqFields = new string[] { "code_name", "adr_path" };
            unqFieldTypes = new int[] { STRING };
            unqMatchs = new int[] { -1, 1, -1, -1, -1, -1 };
            fieldTypes = new int[] { INTEGER, STRING, STRING, STRING, STRING, DATE };
            selectFTs = new int[] { INTEGER, STRING, STRING, STRING, STRING, DATE, DATE };
            dataType = STRING; setExcelCols();
            orderBy = "code_id";
            refTableNames = new string[] { "vt_csbc_path", "vt_csbc_code_type", "vt_csbc_user" };
            refFieldNames = new string[] { "path_name", "code_type_name", "user_code" };
            refFieldMatchs = new int[] { -1, -1, 2, 3, 4, -1 };
            dateFormatter = new DateFormatter(dbSystem); dateFormatter.setIsCast(true);
            dateFormatter.setTimeFormat(HM); // T
            //dateFormatter.setSourceDF(DateTimeFormatter.ofPattern(("yyyy-MM-dd HH:mm:ss"));
            //dateFormatter.setTargetDF(DateTimeFormatter.ofPattern(("dd.MM.yyyy HH:mm:ss"));
            prepQueryWR = new PrepQueryWithRef();
            prepQueryWR.convert2EQLs(equalityInt);
            execTableWR = new ExecTableWithRef(runDB, tableNames, fieldNames, fieldTypes, orderBy, selectFields, selectFTs,
                                               dateFormatter, refTableNames, refFieldNames, refFieldMatchs, messageBean);
            execFileData = new ExecuteFileData(runDB, tableNames, fieldNames[0], fileField, unqFields, unqFieldTypes,
                                                ExecuteFileData.CLOB, isLocale);
            manageSelList = new ManageSelList(runDB, refTableNames, refFieldNames);

            execFileData.dbSystem = dbSystem;
            execTableWR.isAfterCommit = false;
            execTableWR.isDebug = isDebug;
            execFileData.isDebug = isDebug;
            authorized = new string[] { "Admin", "Supervisor" };
            isModal = true; isWithRefs = true;
        }

        public void setLabels()
        {
            if (isLocale)
            {
                pageTitle = "Kod";
                pageName = "/code/kod";
                sideBarName = new string[] { "Kodlar-Sidebar", "/CSBCA/page/" };
                labelNames = new string[] { "ID", "Kod Adı", "Yol", "Tip", "Kaydeden", "Kayıt Tarihi" };
                selectLabels = new string[] { "ID", "Kod Adı", "Yol", "Tip", "Kaydeden", "Başlangıç Tarih", "Bitiş Tarih" };
            }
            else
            {
                pageTitle = "Code";
                pageName = "/code/code";
                sideBarName = new string[] { "Codes-Sidebar", "/CSBCA/page/" };
                labelNames = new string[] { "ID", "Code Name", "Path", "Type", "Recorder", "Record Date" };
                selectLabels = new string[] { "ID", "Code Name", "Path", "Type", "Recorder", "Start Date", "End Date" };
            }
        }
    }
}
