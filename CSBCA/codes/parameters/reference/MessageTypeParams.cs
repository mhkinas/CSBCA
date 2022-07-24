﻿using SDBCS.dbwork;
using SDBCS.utility;

namespace CSBCA.codes.parameters
{
    public class MessageTypeParams : BaseParameters
    {
        public new void initParams()
        {
            base.initParams();

            isDebug = true;
            tableNames = new string[] { "csbc_message_type", "vt_csbc_message_type" };
            fieldNames = new string[] { "id", "msg_type_name" };
            inputTypes = new string[] { "number", "text" };
            selectFields = new string[] { "id", "msg_type_name" };
            selectITs = new string[] { "number", "text" };
            setLabels();
            equalityInt = new int[] { EQ, LK };
            colWidths = new int[] { 10, 20 };
            readOnlyFM = new int[] { 0, -1 };
            requiredFM = new int[] { -1, 1 };
            invisibleFM = new int[] { -1, -1 };
            unqFields = new string[] { "msg_type_name" };
            unqFieldTypes = new int[] { STRING };
            unqMatchs = new int[] { -1, 1 };
            fieldTypes = new int[] { INTEGER, STRING };
            selectFTs = new int[] { INTEGER, STRING };
            dataType = STRING; setExcelCols();
            orderBy = "message_type_id";
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
                pageTitle = "Mesaj Tip";
                pageName = "/reference/mesaj-tip";
                sideBarName = new string[] { "Referans-Sidebar", "/CSBCA/page/" };
                labelNames = new string[] { "ID", "Mesaj Tipi" };
            }
            else
            {
                pageTitle = "Message Type";
                pageName = "/reference/message-type";
                sideBarName = new string[] { "Reference-Sidebar", "/CSBCA/page/" };
                labelNames = new string[] { "ID", "Message Type" };
            }
        }

    }
}
