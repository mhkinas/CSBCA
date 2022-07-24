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
    public class MenuParams : BaseParameters
    {
        public new void initParams()
        {
            base.initParams();

            isDebug = true;
            tableNames = new string[] { "csbc_menu", "vt_csbc_menu" };
            fieldNames = new string[] { "id", "menu_name", "adr_path", "menu_data", "rec_user", "rec_date" };
            inputTypes = new string[] { "number", "text", "text", "textarea", "text", "datetime-local" };
            selectFields = new string[] { "id", "menu_name", "adr_path", "rec_user", "rec_date1", "rec_date2" };
            selectITs = new string[] { "number", "text", "text", "text", "date", "date" };
            setLabels();
            colWidths = new int[] { 10, 30, 30, 100, 10, 15 };
            readOnlyFM = new int[] { 0, -1, -1, -1, 4, 5 };
            invisibleFM = new int[] { -1, -1, -1, 3, -1, -1 };
            requiredFM = new int[] { -1, 1, 2, 3, -1, -1 };
            equalityInt = new int[] { EQ, LK, EQ, EQ, BGE, SME };
            unqFields = new string[] { "menu_name", "adr_path" };
            unqFieldTypes = new int[] { STRING };
            unqMatchs = new int[] { -1, 1, -1, -1, -1, -1 };
            fieldTypes = new int[] { INTEGER, STRING, STRING, STRING, STRING, DATE };
            selectFTs = new int[] { INTEGER, STRING, STRING, STRING, DATE, DATE };
            dataType = STRING; setExcelCols();
            orderBy = "menu_id";
            refTableNames = new string[] { "vt_csbc_path", "vt_csbc_user" };
            refFieldNames = new string[] { "path_name", "user_code" };
            refFieldMatchs = new int[] { -1, -1, 2, -1, 4, -1 };
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
            authorized = new string[] { "Admin", "Supervisor" };
            isModal = false; isWithRefs = true;
        }
        public void setLabels()
        {
            if (isLocale)
            {
                pageTitle = "Menü";
                pageName = "/menu/menu-tr";
                labelNames = new string[] { "ID", "Menü Adı", "Yol", "Kayıt", "Kaydeden", "Kayıt Tarihi" };
                selectLabels = new string[] { "ID", "Menü Adı", "Yol", "Kaydeden", "Başlangıç Tarih", "Bitiş Tarih" };
            }
            else
            {
                pageTitle = "Menu";
                pageName = "/menu/menu";
                labelNames = new string[] { "ID", "Menu Name", "Path", "Record", "Recorder", "Record Date" };
                selectLabels = new string[] { "ID", "Menu Name", "Path", "Recorder", "Start Date", "End Date" };
            }
        }
    }
}
