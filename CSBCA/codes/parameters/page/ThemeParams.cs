using System;
using SDBCS.dbwork;
using SDBCS.management;
using SDBCS.utility;


namespace CSBCA.codes.parameters
{
    public class ThemeParams : BaseParameters
    {
        public new void initParams()
        {
            base.initParams();

            isDebug = true;
            tableNames = new string[] { "csbc_theme", "vt_csbc_theme" };
            fieldNames = new string[] { "id", "theme_name", "adr_path", "theme_menu", "rec_user", "rec_date" };
            inputTypes = new string[] { "number", "text", "text", "text", "text", "datetime-local" };
            selectFields = new string[] { "id", "theme_name", "adr_path", "rec_user", "rec_date1", "rec_date2" };
            selectITs = new string[] { "number", "text", "text", "text", "date", "date" };
            setLabels();
            colWidths = new int[] { 10, 30, 30, 30, 10, 15 };
            readOnlyFM = new int[] { 0, -1, -1, -1, 4, 5 };
            invisibleFM = new int[] { -1, -1, -1, -1, -1, -1 };
            requiredFM = new int[] { -1, 1, 2, 3, -1, -1 };
            equalityInt = new int[] { EQ, LK, EQ, EQ, BGE, SME };
            unqFields = new string[] { "theme_name" };
            unqFieldTypes = new int[] { STRING };
            unqMatchs = new int[] { -1, 1, -1, -1, -1, -1 };
            fieldTypes = new int[] { INTEGER, STRING, STRING, STRING, STRING, DATE };
            selectFTs = new int[] { INTEGER, STRING, STRING, STRING, DATE, DATE };
            dataType = STRING; setExcelCols();
            orderBy = "theme_id";
            refTableNames = new string[] { "vt_csbc_path", "vt_csbc_menu", "vt_csbc_user" };
            refFieldNames = new string[] { "path_name", "menu_name", "user_code" };
            refFieldMatchs = new int[] { -1, -1, 2, 3, 4, -1 };
            dateFormatter = new DateFormatter(dbSystem); dateFormatter.setIsCast(true);
            dateFormatter.setTimeFormat(HM); // T
                                             //dateFormatter.setSourceDF(DateTimeFormatter.ofPattern(("yyyy-MM-dd HH:mm:ss"));
                                             //dateFormatter.setTargetDF(DateTimeFormatter.ofPattern(("dd.MM.yyyy HH:mm:ss"));
            prepQueryWR = new PrepQueryWithRef();
            prepQueryWR.convert2EQLs(equalityInt);
            execTableWR = new ExecTableWithRef(runDB, tableNames, fieldNames, fieldTypes, orderBy, selectFields, selectFTs,
                                                    dateFormatter, refTableNames, refFieldNames, refFieldMatchs, messageBean);
            manageSelList = new ManageSelList(runDB, refTableNames, refFieldNames);

            execTableWR.isAfterCommit = false;
            execTableWR.isDebug = isDebug;
            authorized = new string[] { "Admin", "Supervisor", "Normal" };
            isModal = true; isWithRefs = true;
        }

        public void setLabels()
        {
            if (isLocale)
            {
                pageTitle = "Tema";
                pageName = "/page/tema";
                sideBarName = new string[] { "Sayfalar-Sidebar", "/CSBCA/page/" };
                labelNames = new string[] { "ID", "Tema Adı", "Yol", "Menü", "Kaydeden", "Kayıt Tarihi" };
                selectLabels = new string[] { "ID", "Tema Adı", "Yol", "Kaydeden", "Başlangıç Tarih", "Bitiş Tarih" };
            }
            else
            {
                pageTitle = "Theme";
                pageName = "/page/teme";
                sideBarName = new string[] { "Pages-Sidebar", "/CSBCA/page/" };
                labelNames = new string[] { "ID", "Theme Name", "Path", "Menu", "Recorder", "Record Date" };
                selectLabels = new string[] { "ID", "Theme Name", "Path", "Recorder", "Start Date", "End Date" };
            }
        }
    }
}
