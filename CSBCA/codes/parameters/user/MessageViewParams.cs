
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
    public class MessageViewParams : BaseParameters
    {
        public new void initParams()
        {
            base.initParams();

            isDebug = true;
            tableNames = new string[] { "vt_csbc_view_message", "vt_csbc_view_message" };
            fieldNames = new string[] { "id", "msg_name", "message_type", "rec_status", "msg_data", "user_group", "rec_user",
                                        "rec_date" };
            inputTypes = new string[] { "number", "text", "text", "text", "textarea", "text", "text", "datetime-local" };
            selectFields = new string[] { "id", "msg_name", "message_type", "rec_status", "rec_user", "rec_date1", "rec_date2",
                                          "user_group" };
            selectITs = new string[] { "number", "text", "text", "text", "text", "date", "date" };
            setLabels();
            colWidths = new int[] { 10, 30, 10, 10, 100, 10, 10, 15 };
            readOnlyFM = new int[] { 0, 1, 2, 3, 4, 5, 6, 7 };
            invisibleFM = new int[] { -1, -1, -1, -1, 4, -1, -1, -1 };
            requiredFM = new int[] { -1, -1, -1, -1, -1, -1, -1, -1 };
            equalityInt = new int[] { EQ, LK, EQ, EQ, EQ, BGE, SME };
            unqFields = new string[] { "msg_name" };
            unqFieldTypes = new int[] { STRING };
            unqMatchs = new int[] { -1, 1, -1, -1, -1, -1, -1, -1 };
            fieldTypes = new int[] { INTEGER, STRING, STRING, STRING, STRING, STRING, STRING, DATE };
            selectFTs = new int[] { INTEGER, STRING, STRING, STRING, STRING, DATE, DATE, STRING };
            dataType = STRING; setExcelCols();
            orderBy = "message_id desc";
            refTableNames = new string[] { "vt_csbc_message_type", "vt_csbc_status", "vt_csbc_user" };
            refFieldNames = new string[] { "msg_type_name", "status_name", "user_code" };
            refFieldMatchs = new int[] { -1, -1, 2, 3, -1, -1, 6, -1 };
            dateFormatter = new DateFormatter(dbSystem); dateFormatter.setIsCast(true);
            dateFormatter.setTimeFormat(HM); // T
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
                pageTitle = "Mesaj Bak";
                pageName = "/user/mesaj-bak";
                labelNames = new string[] { "ID", "Mesaj Adı", "Tip", "Durum", "Kayıt", "Grup", "Kaydeden", "Kayıt Tarihi" };
                selectLabels = new string[] { "ID", "Mesaj Adı", "Tip", "Durum", "Kaydeden", "Başlangıç Tarih", "Bitiş Tarih" };
            }
            else
            {
                pageTitle = "Message View";
                pageName = "/user/message-rew";
                labelNames = new string[] { "ID", "Message Name", "Type", "Status", "Record", "Group", "Recorder", "Record Date" };
                selectLabels = new string[] { "ID", "Message Name", "Type", "Status", "Recorder", "Start Date", "End Date" };
            }
        }
    }
}
