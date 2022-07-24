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
    public class PageLinkParams : BaseParameters
    {
        public new void initParams()
        {
            base.initParams();

            isDebug = true;
            tableNames = new string[] { "csbc_page_link", "vt_csbc_page_link" };
            fieldNames = new string[] { "id", "link_name", "adr_path", "linked_page", "position", "theme", "rec_user", "rec_date" };
            inputTypes = new string[] { "number", "text", "text", "text", "text", "text", "text", "datetime-local" };
            selectFields = new string[] { "id", "link_name", "adr_path", "linked_page", "rec_user", "rec_date1", "rec_date2" };
            selectITs = new string[] { "number", "text", "text", "text", "text", "date", "date" };
            setLabels();
            colWidths = new int[] { 10, 20, 30, 30, 10, 20, 10, 15 };
            readOnlyFM = new int[] { 0, -1, -1, -1, -1, -1, 6, 7 };
            invisibleFM = new int[] { -1, -1, -1, -1, -1, -1, -1, -1 };
            requiredFM = new int[] { -1, 1, 2, 3, 4, 5, -1, -1 };
            equalityInt = new int[] { EQ, LK, EQ, EQ, EQ, BGE, SME };
            unqFields = new string[] { "link_name" };
            unqFieldTypes = new int[] { STRING };
            unqMatchs = new int[] { -1, 1, -1, -1, -1, -1, -1, -1 };
            fieldTypes = new int[] { INTEGER, STRING, STRING, STRING, STRING, STRING, STRING, DATE };
            selectFTs = new int[] { INTEGER, STRING, STRING, STRING, STRING, DATE, DATE };
            dataType = STRING; setExcelCols();
            orderBy = "page_link_id";
            refTableNames = new string[] { "vt_csbc_path", "vt_csbc_page", "vt_csbc_position", "vt_csbc_theme", "vt_csbc_user" };
            refFieldNames = new string[] { "path_name", "page_name", "pos_name", "theme_name", "user_code" };
            refFieldMatchs = new int[] { -1, -1, 2, 3, 4, 5, 6, -1 };
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
                pageTitle = "Sayfa Link";
                pageName = "/page/sayfa-link";
                sideBarName = new string[] { "Sayfalar-Sidebar", "/CSBCA/page/" };
                labelNames = new string[] { "ID", "Link Adı", "Yol", "Sayfa", "Pozisyon", "Tema", "Kaydeden", "Kayıt Tarihi" };
                selectLabels = new string[] { "ID", "Link Adı", "Yol", "Sayfa", "Kaydeden", "Başlangıç Tarih", "Bitiş Tarih" };
            }
            else
            {
                pageTitle = "Page Link";
                pageName = "/page/page-link";
                sideBarName = new string[] { "Pages-Sidebar", "/CSBCA/page/" };
                labelNames = new string[] { "ID", "Link Name", "Path", "Page", "Position", "Theme", "Recorder", "Record Date" };
                selectLabels = new string[] { "ID", "Link Name", "Path", "Page", "Recorder", "Start Date", "End Date" };
            }
        }
    }
}
