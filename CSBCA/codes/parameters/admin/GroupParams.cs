/**
   csbca - v1.0 - 2020-10-12
   https://www.hayatikinas.com
   This code is part of the CSBCA project
   And it can be used under license terms.
   Copyright Mehmet Hayati KINAŞ
 */

using SDBCS.dbwork;
using SDBCS.utility;


namespace CSBCA.codes.parameters
{
    public class GroupParams : BaseParameters
    {
        public new void initParams()
        {
            base.initParams();
            
            isDebug = true;
            tableNames = new string[] { "csbc_group", "vt_csbc_group" };
            fieldNames = new string[] { "id", "group_name" };
            inputTypes = new string[] { "number", "text" };
            selectFields = new string[] { "id", "group_name" };
            selectITs = new string[] { "number", "text" };
            setLabels();
            equalityInt = new int[] { EQ, LK };
            colWidths = new int[] { 10, 20 };
            readOnlyFM = new int[] { 0, -1 };
            requiredFM = new int[] { -1, 1 };
            invisibleFM = new int[] { -1, -1 };
            unqFields = new string[] { "group_name" };
            unqFieldTypes = new int[] { STRING };
            unqMatchs = new int[] { -1, 1 };
            fieldTypes = new int[] { INTEGER, STRING };
            selectFTs = new int[] { INTEGER, STRING };
            dataType = STRING; setExcelCols();
            orderBy = "group_id";
            dateFormatter = new DateFormatter(dbSystem); dateFormatter.setIsCast(true);
            prepareQuery = new PrepareQuery();
            prepareQuery.convert2EQLs(equalityInt);
            executeTable = new ExecuteTable(runDB, tableNames, fieldNames, fieldTypes, orderBy, dateFormatter,
                                            selectFields, selectFTs, messageBean);
            executeTable.isAfterCommit = false; 
            executeTable.isDebug = isDebug; 
            authorized = new string[] { "Admin" };
            isModal = true; isWithRefs = false; 
        }

        public void setLabels()
        {
            if (isLocale)
            {
                pageTitle = "Grup";
                pageName = "/admin/grup";
                sideBarName = new string[] { "Yonetim-Sidebar", "/CSBCA/page/" };
                labelNames = new string[] { "ID", "Grup" };
            }
            else
            {
                pageTitle = "Group";
                pageName = "/admin/group";
                sideBarName = new string[] { "Admin-Sidebar", "/CSBCA/page/" };
                labelNames = new string[] { "ID", "Group" };
            }
        }
    }
}
