
using SDBCS.dbwork;
using SDBCS.management;
using SDBCS.utility;

namespace CSBCA.codes.parameters
{
    public class ContactParams : BaseParameters
    {
        public new void initParams()
        {
            base.initParams();

            isDebug = true;
            tableNames = new string[] { "csbc_contact", "vt_csbc_contact" };
            fieldNames = new string[] { "id", "contact_name", "e_mail", "web_site", "message_data", "rec_user", "rec_date" };
            inputTypes = new string[] { "number", "text", "email", "url", "textarea", "text", "datetime-local" };
            selectFields = new string[] { "id", "contact_name", "e_mail", "rec_user", "rec_date1", "rec_date2" };
            selectITs = new string[] { "number", "text", "text", "text", "date", "date" };
            setLabels();
            equalityInt = new int[] { EQ, LK, LK, EQ, BGE, SME };
            colWidths = new int[] { 10, 30, 30, 30, 100, 10, 15 };
            readOnlyFM = new int[] { 0, -1, -1, -1, -1, 5, 6 };
            requiredFM = new int[] { -1, 1, -1, -1, 4, -1, -1 };
            invisibleFM = new int[] { -1, -1, -1, -1, 4, -1, -1 };
            unqFields = new string[] { "id" };
            unqFieldTypes = new int[] { INTEGER };
            unqMatchs = new int[] { 0, -1, -1, -1, -1, -1, -1 };
            fieldTypes = new int[] { INTEGER, STRING, STRING, STRING, STRING, STRING, DATE };
            selectFTs = new int[] { INTEGER, STRING, STRING, STRING, DATE, DATE };
            dataType = STRING; setExcelCols();
            orderBy = "contact_id";
            refTableNames = new string[] { "vt_csbc_user" };
            refFieldNames = new string[] { "user_code" };
            refFieldMatchs = new int[] { -1, -1, -1, -1, -1, 5, -1 };
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
                pageTitle = "İletişim";
                pageName = "/info/iletisim";
                labelNames = new string[] { "ID", "İsim", "E-posta", "Web Sitesi", "Mesaj", "Kaydeden", "Kayıt Tarihi" };
                selectLabels = new string[] { "ID", "İsim", "E-posta", "Kaydeden", "Başlangıç Tarih", "Bitiş Tarih" };
            }
            else
            {
                pageTitle = "Contact";
                pageName = "/info/contact";
                labelNames = new string[] { "ID", "Name", "E-mail", "Web Site", "Message", "Recorder", "Record Date" };
                selectLabels = new string[] { "ID", "Name", "E-mail", "Recorder", "Start Date", "End Date" };
            }
        }
    }
}
