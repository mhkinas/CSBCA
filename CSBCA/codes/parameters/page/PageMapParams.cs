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
    public class PageMapParams : BaseParameters
    {
        public new void initParams()
        {
            base.initParams();

            isDebug = true;
            tableNames = new string[] { "csbc_page_map", "vt_csbc_page_map" };
            fieldNames = new string[] { "id", "mapped_page", "theme", "position", "rec_user", "rec_date" };
            inputTypes = new string[] { "number", "text", "text", "text", "text", "datetime-local" };
            selectFields = new string[] { "id", "mapped_page", "theme", "rec_user", "rec_date1", "rec_date2" };
            selectITs = new string[] { "number", "text", "text", "text", "date", "date" };
            setLabels();
            colWidths = new int[] { 10, 30, 30, 10, 10, 15 };
            readOnlyFM = new int[] { 0, -1, -1, -1, 4, 5 };
            invisibleFM = new int[] { -1, -1, -1, -1, -1, -1 };
            requiredFM = new int[] { -1, 1, 2, 3, -1, -1 };
            equalityInt = new int[] { EQ, EQ, EQ, EQ, BGE, SME };
            unqFields = new string[] { "mapped_page", "theme" };
            unqFieldTypes = new int[] { STRING, STRING };
            unqMatchs = new int[] { -1, 1, 2, -1, -1, -1 };
            fieldTypes = new int[] { INTEGER, STRING, STRING, STRING, STRING, DATE };
            selectFTs = new int[] { INTEGER, STRING, STRING, STRING, DATE, DATE };
            dataType = STRING; setExcelCols();
            orderBy = "page_map_id";
            refTableNames = new string[] { "vt_csbc_page", "vt_csbc_theme", "vt_csbc_position", "vt_csbc_user" };
            refFieldNames = new string[] { "page_name", "theme_name", "pos_name", "user_code" };
            refFieldMatchs = new int[] { -1, 1, 2, 3, 4, -1 };
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
                pageTitle = "Sayfa Map";
                pageName = "/page/sayfa-map";
                sideBarName = new string[] { "Sayfalar-Sidebar", "/CSBCA/page/" };
                labelNames = new string[] { "ID", "Sayfa", "Tema", "Pozisyon", "Kaydeden", "Kayıt Tarihi" };
                selectLabels = new string[] { "ID", "Sayfa", "Tema", "Kaydeden", "Başlangıç Tarih", "Bitiş Tarih" };
            }
            else
            {
                pageTitle = "Page Map";
                pageName = "/page/page-map";
                sideBarName = new string[] { "Pages-Sidebar", "/CSBCA/page/" };
                labelNames = new string[] { "ID", "Page", "Theme", "Position", "Recorder", "Record Date" };
                selectLabels = new string[] { "ID", "Page", "Theme", "Recorder", "Start Date", "End Date" };
            }
        }
    }
}
