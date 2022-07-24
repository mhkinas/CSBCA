/**
   csbca - v1.0 - 2020-10-12
   https://www.hayatikinas.com
   This code is part of the CSBCA project
   And it can be used under license terms.
   Copyright Mehmet Hayati KINAŞ
 */

using SDBCS.dbwork;
using SDBCS.bean;
using SDBCS.management;
using SDBCS.utility;

namespace CSBCA.codes.parameters
{
    public class UserParams : BaseParameters
    {
        public PasswordBean passwordBean;
        public ManagePassword managePassword;

        public new void initParams()
        {
            base.initParams();

            isDebug = true;
            tableNames = new string[] { "csbc_user", "vt_csbc_user_s" };
            fieldNames = new string[] {"id","user_name","user_code","user_psw","user_group","e_mail","rec_status","page_size",
                                        "rec_user", "rec_date"};
            inputTypes = new string[] { "number", "text", "text", "password", "text", "email", "text", "number", "text", 
                                        "datetime-local" };
            selectFields = new string[] { "id", "user_name", "user_group", "e_mail", "rec_user", "rec_date1", "rec_date2" };
            selectITs = new string[] { "number", "text", "text", "email", "text", "date", "date" };
            setLabels();
            colWidths = new int[] { 10, 30, 10, 10, 10, 30, 10, 10, 10, 15 };
            readOnlyFM = new int[] { 0, -1, -1, -1, -1, -1, -1, -1, 8, 9 };
            invisibleFM = new int[] { -1, -1, -1, 3, -1, -1, -1, -1, -1, -1 };
            requiredFM = new int[] { -1, 1, 2, 3, 4, 5, -1, -1, -1, -1 };
            equalityInt = new int[] { EQ, LK, EQ, LK, EQ, BGE, SME };
            unqFields = new string[] { "user_code" };
            unqFieldTypes = new int[] { STRING };
            unqMatchs = new int[] { -1, -1, 2, -1, -1, -1, -1, -1, -1, -1 };
            fieldTypes = new int[] { INTEGER, STRING, STRING, STRING, STRING, STRING, STRING, INTEGER, STRING, DATE };
            selectFTs = new int[] { INTEGER, STRING, STRING, STRING, STRING, DATE, DATE };
            dataType = STRING; setExcelCols();
            orderBy = "user_id";
            refTableNames = new string[] { "vt_csbc_group_s", "vt_csbc_status", "vt_csbc_user_s" };
            refFieldNames = new string[] { "group_name", "status_name", "user_code" };
            refFieldMatchs = new int[] { -1, -11, -1, -1, 4, -1, 6, -1, 8, -1 };
            dateFormatter = new DateFormatter(dbSystem); dateFormatter.setIsCast(true);
            dateFormatter.setTimeFormat(HM);
            prepQueryWR = new PrepQueryWithRef();
            prepQueryWR.convert2EQLs(equalityInt);
            execTableWR = new ExecTableWithRef(runDB, tableNames, fieldNames, fieldTypes, orderBy, selectFields, selectFTs,
                                                    dateFormatter, refTableNames, refFieldNames, refFieldMatchs, messageBean);
            passwordBean = new PasswordBean(runDB, tableNames[0], fieldNames[0], fieldNames[3]);
            managePassword = new ManagePassword(defPasw, passwordBean, defMask);
            //managePassword.charset = UTF_8; // Set charset for different then UTF_8
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
                pageTitle = "Kullanıcı";
                pageName = "/user/kullanici";
                labelNames = new string[] { "ID", "Ad Soyad", "Kod", "Şifre", "Grup", "E-posta", "Durum", "Sayfa Boyutu", "Kaydeden", "Kayıt Tarihi" };
                selectLabels = new string[] { "ID", "Ad Soyad", "Grup", "E-posta", "Kaydeden", "Başlangıç Tarih", "Bitiş Tarih" };
            }
            else
            {
                pageTitle = "User";
                pageName = "/user/user";
                labelNames = new string[] { "ID", "Name Surename", "Code", "Password", "Group", "E-mail", "Status", "Page Size", "Recorder", "Record Date" };
                selectLabels = new string[] { "ID", "Name Surename", "Group", "E-mail", "Recorder", "Start Date", "End Date" };
            }
        }

        public void setPasX(int col)
        {
            if (tableData != null && tableData.Length > 0)
                foreach (string[] row in (string[][])tableData)
                    row[col] = defMask;
        }
    }
}
