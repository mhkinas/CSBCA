/**
   csbca - v1.0 - 2020-10-12
   https://www.hayatikinas.com
   This code is part of the CSBCA project
   And it can be used under license terms.
   Copyright Mehmet Hayati KINAŞ
 */

using SDBCS.filework;
using SDBCS.dbwork;
using SDBCS.management;
using SDBCS.utility;

namespace CSBCA.codes.parameters
{
    public class PageParams : BaseParameters
    {
        public new void initParams()
        {
            base.initParams();

            isDebug = true;
            tableNames = new string[] { "csbc_page", "vt_csbc_page" };
            fieldNames = new string[] { "id", "page_name", "adr_path", "page_type", "rec_status", "rec_user", "rec_date" };
            inputTypes = new string[] { "number", "text", "text", "text", "text", "text", "datetime-local" };
            selectFields = new string[] { "id", "page_name", "adr_path", "page_type", "rec_user", "rec_date1", "rec_date2" };
            selectITs = new string[] { "number", "text", "text", "text", "text", "date", "date" };
            setLabels();
            fileField = "page_data";
            colWidths = new int[] { 10, 30, 30, 10, 10, 10, 15 };
            readOnlyFM = new int[] { 0, -1, -1, -1, -1, 5, 6 };
            invisibleFM = new int[] { -1, -1, -1, -1, -1, -1, -1 };
            requiredFM = new int[] { -1, 1, 2, 3, -1, -1, -1 };
            equalityInt = new int[] { EQ, LK, EQ, EQ, EQ, BGE, SME };
            unqFields = new string[] { "page_name", "adr_path" };
            unqFieldTypes = new int[] { STRING };
            unqMatchs = new int[] { -1, 1, -1, -1, -1, -1, -1, -1 };
            fieldTypes = new int[] { INTEGER, STRING, STRING, STRING, STRING, STRING, DATE };
            selectFTs = new int[] { INTEGER, STRING, STRING, STRING, STRING, DATE, DATE };
            dataType = STRING; setExcelCols();
            orderBy = "page_id";
            refTableNames = new string[] { "vt_csbc_path", "vt_csbc_page_type", "vt_csbc_status", "vt_csbc_user" };
            refFieldNames = new string[] { "path_name", "page_type_name", "status_name", "user_code" };
            refFieldMatchs = new int[] { -1, -1, 2, 3, 4, 5, -1 };
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
            execTableWR.isDebug = isDebug; execFileData.isDebug = isDebug;
            menuBean.isDebug = isDebug;
            authorized = new string[] { "Admin", "Supervisor", "Normal" };
            isModal = true; isWithRefs = true;
        }

        public void setLabels()
        {
            if (isLocale)
            {
                pageTitle = "Sayfa";
                pageName = "/page/sayfa";
                sideBarName = new string[] { "Sayfalar-Sidebar", "/CSBCA/page/" };
                labelNames = new string[] { "ID", "Sayfa Adı", "Yol", "Tip", "Durum", "Kaydeden", "Kayıt Tarihi" };
                selectLabels = new string[] { "ID", "Sayfa Adı", "Yol", "Tip", "Kaydeden", "Başlangıç Tarih", "Bitiş Tarih" };
            }
            else
            {
                pageTitle = "Page";
                pageName = "/page/page";
                sideBarName = new string[] { "Pages-Sidebar", "/CSBCA/page/" }; 
                labelNames = new string[] { "ID", "Page Name", "Path", "Type", "Status", "Recorder", "Record Date" };
                selectLabels = new string[] { "ID", "Page Name", "Path", "Type", "Recorder", "Start Date", "End Date" };
            }
        }
    }
}
