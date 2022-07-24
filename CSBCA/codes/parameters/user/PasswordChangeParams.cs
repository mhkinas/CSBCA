using System;
using SDBCS.bean;
using SDBCS.dbwork;
using SDBCS.management;
using SDBCS.utility;

namespace CSBCA.codes.parameters
{
    public class PasswordChangeParams : BaseParameters
    {
        public PasswordBean passwordBean;
        public ManagePassword managePassword;

        public new void initParams()
        {
            base.initParams();

            isDebug = true;
            tableNames = new string[] { "csbc_user", "vt_csbc_user" };
            fieldNames = new string[] { "user_code", "old_user_psw", "user_psw", "again_user_psw" };
            inputTypes = new string[] { "text", "password", "password", "password" };
            selectFields = new string[] { "user_code" };
            selectITs = new string[] { "text" };
            setLabels();
            equalityInt = new int[] { EQ };
            readOnlyFM = new int[] { -1, -1, -1, -1 };
            requiredFM = new int[] { -1, -1, -1, -1 };
            invisibleFM = new int[] { -1, -1, -1, -1 };
            unqFields = new string[] { "user_code" };
            unqFieldTypes = new int[] { STRING };
            unqMatchs = new int[] { 0, -1, -1, -1 };
            fieldTypes = new int[] { STRING, STRING, STRING, STRING };
            selectFTs = new int[] { STRING };
            dataType = STRING; setExcelCols();
            orderBy = "user_code";
            dateFormatter = new DateFormatter(dbSystem); dateFormatter.setIsCast(true);
            prepareQuery = new PrepareQuery();
            prepareQuery.convert2EQLs(equalityInt);
            passwordBean = new PasswordBean(runDB, tableNames[0], "id", fieldNames[2], unqFields);
            managePassword = new ManagePassword(defPasw, passwordBean, defMask);
            //managePassword.charset = UTF_8; // Set charset for different then UTF_8

            authorized = new string[] { "Admin", "Supervisor", "Normal" };
            isModal = false; isWithRefs = false;
        }

        public void setLabels()
        {
            if (isLocale)
            {
                pageTitle = "Şifre Değiştir";
                pageName = "/user/sifre";
                labelNames = new string[] { "Kullanıcı Kodu", "Eski Şifre", "Yeni Şifre", "Yeni Şifre Tekrar" };
            }
            else
            {
                pageTitle = "Change Password";
                pageName = "/user/password";
                labelNames = new string[] { "Code", "Old Password", "New Password", "New Password Again" };
            }
        }
    }
}
