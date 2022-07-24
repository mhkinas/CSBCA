using SDBCS.dbwork;
using SDBCS.management;
using SDBCS.utility;
using System;

namespace CSBCA.codes.parameters
{
    public class CodeMapParams : BaseParameters
    {
        public new void initParams()
        {
            base.initParams();

            isDebug = true;
            tableNames = new string[] { "csbc_code_map", "vt_csbc_code_map" };
            fieldNames = new string[] { "id", "mapped_code", "page_link", "rec_user", "rec_date" };
            inputTypes = new string[] { "number", "text", "text", "text", "datetime-local" };
            selectFields = new string[] { "id", "mapped_code", "page_link", "rec_user", "rec_date1", "rec_date2" };
            selectITs = new string[] { "number", "text", "text", "text", "date", "date" };
            setLabels();
            colWidths = new int[] { 10, 30, 30, 10, 15 };
            readOnlyFM = new int[] { 0, -1, -1, 3, 4 };
            invisibleFM = new int[] { -1, -1, -1, -1, -1 };
            requiredFM = new int[] { -1, 1, 2, -1, -1 };
            equalityInt = new int[] { EQ, EQ, EQ, EQ, BGE, SME };
            unqFields = new string[] { "mapped_code", "page_link" };
            unqFieldTypes = new int[] { STRING, STRING };
            unqMatchs = new int[] { -1, 1, 2, -1, -1 };
            fieldTypes = new int[] { INTEGER, STRING, STRING, STRING, DATE };
            selectFTs = new int[] { INTEGER, STRING, STRING, STRING, DATE, DATE };
            dataType = STRING; setExcelCols();
            orderBy = "code_map_id";
            refTableNames = new string[] { "vt_csbc_code", "vt_csbc_page_link", "vt_csbc_user" };
            refFieldNames = new string[] { "code_name", "link_name", "user_code" };
            refFieldMatchs = new int[] { -1, 1, 2, 3, -1 };
            dateFormatter = new DateFormatter(dbSystem); dateFormatter.setIsCast(true);
            dateFormatter.setTimeFormat(HM); // T
            prepQueryWR = new PrepQueryWithRef();
            prepQueryWR.convert2EQLs(equalityInt);
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
                pageTitle = "Kod Map";
                pageName = "/code/kod-map";
                sideBarName = new string[] { "Kodlar-Sidebar", "/CSBCA/page/" };
                labelNames = new string[] { "ID", "Kod", "Sayfa", "Kaydeden", "Kayıt Tarihi" };
                selectLabels = new string[] { "ID", "Kod", "Sayfa", "Kaydeden", "Başlangıç Tarih", "Bitiş Tarih" };
            }
            else
            {
                pageTitle = "Code Map";
                pageName = "/code/code-map";
                sideBarName = new string[] { "Codes-Sidebar", "/CSBCA/page/" };
                labelNames = new string[] { "ID", "Code", "Page", "Recorder", "Record Date" };
                selectLabels = new string[] { "ID", "Code", "Page", "Recorder", "Start Date", "End Date" };
            }
        }
    }
}
