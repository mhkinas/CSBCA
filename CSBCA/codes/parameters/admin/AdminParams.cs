/**
   csbca - v1.0 - 2020-10-12
   https://www.hayatikinas.com
   This code is part of the CSBCA project
   And it can be used under license terms.
   Copyright Mehmet Hayati KINAŞ
 */

using SDBCS.bean;
using SDBCS.dbwork;
using SDBCS.management;
using SDBCS.utility;


namespace CSBCA.codes.parameters
{
    public class AdminParams : BaseParameters
    {
        // Some extra beans for AdminParams
        public PasswordBean passwordBean;
        public ManagePassword managePassword;

        // For initializing admin parameters
        public new void initParams()
        {
            base.initParams();

            isDebug = true;

            tableNames = new string[] { "csbc_user", "vt_csbc_user" }; // Array for table names
            fieldNames = new string[] {"id","user_name","user_code","user_psw","user_group","e_mail","rec_status","page_size",
                                        "rec_user","rec_date"}; // Array for field names
            inputTypes = new string[] { "number", "text", "text", "password", "text", "email", "text", "number", "text",
                                        "datetime-local" }; // Array for html input types
            selectFields = new string[] { "id", "user_name", "user_group", "e_mail", "rec_user", "rec_date1", "rec_date2" }; // Array for search field names
            selectITs = new string[] { "number", "text", "text", "email", "text", "date", "date" }; // Array for search html input types
            setLabels(); // For setting labale names
            // Matching check is like : if(myArray[i] == i)
            colWidths = new int[] { 10, 30, 10, 10, 10, 30, 10, 10, 10, 15 }; // For excel
            readOnlyFM = new int[] { 0, -1, -1, -1, -1, -1, -1, -1, 8, 9 }; // Read only fields map on HTML5 form
            invisibleFM = new int[] { -1, -1, -1, 3, -1, -1, -1, -1, -1, -1 }; // Integer array for matching invisible fields. 
            requiredFM = new int[] { -1, 1, 2, 3, 4, 5, -1, -1, -1, -1 }; // Integer array for matching required fields.
            equalityInt = new int[] { EQ, LK, EQ, LK, EQ, BGE, SME }; // Integer array for equality fields.
            unqFields = new string[] { "user_code" }; // String array for unique fields. 
            unqFieldTypes = new int[] { STRING }; // Integer array for unique field types.
            unqMatchs = new int[] { -1, -1, 2, -1, -1, -1, -1, -1, -1, -1 }; // Integer array for matching unique fields.
            fieldTypes = new int[] { INTEGER, STRING, STRING, STRING, STRING, STRING, STRING, INTEGER, STRING, DATE };// Integer array for field types.
            selectFTs = new int[] { INTEGER, STRING, STRING, STRING, STRING, DATE, DATE }; // Integer array for search field types.
            dataType = STRING; // Integer for data type
            setExcelCols(); // For setting excel columns
            orderBy = "user_id"; // Field name for ordering
            refTableNames = new string[] { "vt_csbc_group", "vt_csbc_status", "vt_csbc_user" }; // String array for reference table names.
            refFieldNames = new string[] { "group_name", "status_name", "user_code" }; // String array for reference field names.
            refFieldMatchs = new int[] { -1, -1, -1, -1, 4, -1, 6, -1, 8, -1 }; // Integer array for matching reference fields.
            dateFormatter = new DateFormatter(dbSystem); // For setting DateFormatter.
            dateFormatter.setIsCast(true); dateFormatter.setTimeFormat(HM); 
            prepQueryWR = new PrepQueryWithRef(); // The constructor for PrepQueryWithRef
            prepQueryWR.convert2EQLs(equalityInt); // For converting to sql comparison operators
            // The constructor for ExecTableWithRef
            execTableWR = new ExecTableWithRef(runDB, tableNames, fieldNames, fieldTypes, orderBy, selectFields, selectFTs,
                                                    dateFormatter, refTableNames, refFieldNames, refFieldMatchs, messageBean);
            // The constructor for PasswordBean
            passwordBean = new PasswordBean(runDB, tableNames[0], fieldNames[0], fieldNames[3]);
            // The constructor for ManagePassword
            managePassword = new ManagePassword(defPasw, passwordBean, defMask);
            // The constructor for ManageSelList
            manageSelList = new ManageSelList(runDB, refTableNames, refFieldNames);
            
            execTableWR.isAfterCommit = false;
            execTableWR.isDebug = isDebug;
            manageSelList.isDebug = isDebug;
            authorized = new string[] { "Admin" }; // String array for authorized groups
            isModal = true; // For setting modal or not
            isWithRefs = true; // With reference or without reference
        }

        // For setting label names as English or local language
        public void setLabels()
        {
            if (isLocale)
            {
                pageTitle = "Kullanıcı";
                pageName = "/admin/yonetim";
                sideBarName = new string[] { "Yonetim-Sidebar", "/CSBCA/page/" };
                labelNames = new string[] { "ID", "Ad Soyad", "Kod", "Şifre", "Grup", "E-posta", "Durum", "Sayfa Boyutu", "Kaydeden",
                                            "Kayıt Tarihi" };
                selectLabels = new string[] { "ID", "Ad Soyad", "Grup", "E-posta", "Kaydeden", "Başlangıç Tarih", "Bitiş Tarih" };
            }
            else
            {
                pageTitle = "User";
                pageName = "/admin/admin";
                sideBarName = new string[] { "Admin-Sidebar", "/CSBCA/page/" };
                labelNames = new string[] { "ID", "Name Surename", "Code", "Password", "Group", "E-mail", "Status", "Page Size",
                                            "Recorder", "Record Date" };
                selectLabels = new string[] { "ID", "Name Surename", "Group", "E-mail", "Recorder", "Start Date", "End Date" };
            }
        }

        // For setting password values as default mask
        public void setPasX(int col)
        {
            if (tableData != null && tableData.Length > 0)
                foreach (string[] row in (string[][])tableData)
                    row[col] = defMask;
        }
    }
}
