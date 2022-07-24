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
    public class MessageParams : BaseParameters
    {
        public new void initParams()
        {
            base.initParams();

            isDebug = true;
            tableNames = new string[] { "csbc_message", "vt_csbc_message" };
            fieldNames = new string[] { "id", "msg_name", "message_type", "rec_status", "msg_data", "rec_user", "rec_date" };
            inputTypes = new string[] { "number", "text", "text", "text", "textarea", "text", "datetime-local" };
            selectFields = new string[] { "id", "msg_name", "message_type", "rec_user", "rec_date1", "rec_date2" };
            selectITs = new string[] { "number", "text", "text", "text", "date", "date" };
            setLabels();
            colWidths = new int[] { 10, 30, 10, 10, 100, 10, 15 };
            readOnlyFM = new int[] { 0, -1, -1, -1, -1, 5, 6 };
            invisibleFM = new int[] { -1, -1, -1, -1, 4, -1, -1 };
            requiredFM = new int[] { -1, 1, 2, 3, 4, -1, -1 };
            equalityInt = new int[] { EQ, LK, EQ, EQ, BGE, SME };
            unqFields = new string[] { "msg_name" };
            unqFieldTypes = new int[] { STRING };
            unqMatchs = new int[] { -1, 1, -1, -1, -1, -1, -1 };
            fieldTypes = new int[] { INTEGER, STRING, STRING, STRING, STRING, STRING, DATE };
            selectFTs = new int[] { INTEGER, STRING, STRING, STRING, DATE, DATE };
            dataType = STRING; setExcelCols();
            orderBy = "message_id";
            refTableNames = new string[] { "vt_csbc_message_type", "vt_csbc_status", "vt_csbc_user" };
            refFieldNames = new string[] { "msg_type_name", "status_name", "user_code" };
            refFieldMatchs = new int[] { -1, -1, 2, 3, -1, 5, -1 };
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
                pageTitle = "Mesaj";
                pageName = "/user/mesaj";
                labelNames = new string[] { "ID", "Mesaj Adı", "Tip", "Durum", "Kayıt", "Kaydeden", "Kayıt Tarihi" };
                selectLabels = new string[] { "ID", "Mesaj Adı", "Tip", "Kaydeden", "Başlangıç Tarih", "Bitiş Tarih" };
            }
            else
            {
                pageTitle = "Message";
                pageName = "/user/message";
                labelNames = new string[] { "ID", "Message Name", "Type", "Status", "Record", "Recorder", "Record Date" };
                selectLabels = new string[] { "ID", "Message Name", "Type", "Recorder", "Start Date", "End Date" };
            }
        }
    }
}
