/**
   csbca - v1.0 - 2020-10-12
   https://www.hayatikinas.com
   This code is part of the CSBCA project
   And it can be used under license terms.
   Copyright Mehmet Hayati KINAŞ
 */

using SDBCS.bean;
using SDBCS.dbwork;
using SDBCS.filework;
using SDBCS.management;
using SDBCS.utility;
using System.IO;

namespace WEBSITE.codes.parameters
{
    public class BaseParameters
{
        public const int STRING = PrepareQuery.STRING   // String Data
                       , INTEGER = PrepareQuery.INTEGER  // Integer Data
                       , DATE = PrepareQuery.DATE     // Date Data
                       , NUMBER = PrepareQuery.NUMBER;  // Number Data

        public const int BEGINEXECUTENONQUERY = RunDB.BEGINEXECUTENONQUERY  // Execute Multi Insert, Update, Delete 
                        , BEGINEXECUTEREADER = RunDB.BEGINEXECUTEREADER  // Execute Multi Select
                        , EXECUTENONQUERY = RunDB.EXECUTENONQUERY  // Insert, Update, Delete
                        , EXECUTEREADER = RunDB.EXECUTEREADER  // Select
                        , EXECUTESCALAR = RunDB.EXECUTESCALAR; // Scalar

        public const int DATAFILEPATH = 0 // If file path for connection string
                        , CONNECTIONSTRING = 1; // If connection string

        public const int MYSQL = RunDB.MYSQL     // MySQL RDBMS
                        , SQLSERVER = RunDB.SQLSERVER  // SQL Server RDBMS
                        , ORACLE = RunDB.ORACLE     // Oracle RDBMS
                        , POSTGRESQL = RunDB.POSTGRESQL // Postgresql RDBMS
                        , DB2 = RunDB.DB2;          // DB2 RDBMS

        public const int UTF_8 = SHAConverter.UTF_8 // If utf-8 char set
        //              , UTF_16 = SHAConverter.UTF_16; // If utf-16 char set
                        , UTF_32 = SHAConverter.UTF_32; // If utf-32 char set

        public const int SHA_256 = SHAConverter.SHA_256 // If sha-256 algorithm
                        , SHA_384 = SHAConverter.SHA_384 // If sha-384 algorithm
                        , SHA_512 = SHAConverter.SHA_512; // If sha-512 algorithm

        public const int TURK_DATE = DateFormatter.TURK_DATE  // Türk (German) formatı 104
                        , US_DATE = DateFormatter.US_DATE    // U.S. format 101
                        , ANSI_DATE = DateFormatter.ANSI_DATE  // ANSI format 102
                        , BF_DATE = DateFormatter.BF_DATE    // Biritish French 103
                        , DEF_PMS = DateFormatter.DEF_PMS    // Default 109
                        , HHMMSS = DateFormatter.HHMMSS     // HHMMSS 108
                        , HMSM = DateFormatter.HMSM       // HMSM 114
                        , TMSTMP = DateFormatter.TMSTMP;    // TimeStamp 120

        public const int POINT = DateFormatter.POINT  // .
                        , SLASH = DateFormatter.SLASH  // /
                        , DASH = DateFormatter.DASH   // -
                        , SPACE = DateFormatter.SPACE; // 

        public const int DMY = DateFormatter.DMY  // DateMonthYear
                        , MDY = DateFormatter.MDY  // MonthDateYear
                        , YMD = DateFormatter.YMD; // YearMonthDate

        public const int NO = DateFormatter.NO // No HourMinute
                        , HM = DateFormatter.HM // HourMinute
                        , T = DateFormatter.T; // HourMinuteSecond

        public const int EQ = PrepareQuery.EQ   // Equal
                        , SM = PrepareQuery.SM   // Smaller
                        , BG = PrepareQuery.BG   // Bigger
                        , SME = PrepareQuery.SME  // Smaller or Equal
                        , BGE = PrepareQuery.BGE  // Bigger or Equal
                        , NEQ = PrepareQuery.NEQ  // Not Equal
                        , LK = PrepareQuery.LK;  // Like

        public RunDB runDB;
        public string[] tableNames, formData, fieldNames, labelNames, inputTypes, selectFields, selectLabels, selectITs;
        public int[] fieldTypes, equalityInt, selectFTs, readOnlyFM, invisibleFM, requiredFM, colWidths;
        public string orderBy, action, confPath, confFile, connPath, contextRoot;
        public DateFormatter dateFormatter;
        public int dbSystem, brackets, dateFormat, hourFormat, sqlDF, connType, dataType, algorithm;
        public bool isSimple, isModal, isWithRefs;
        public PrepareQuery prepareQuery;
        public ExecuteTable executeTable;

        public PrepQueryWithRef prepQueryWR;
        public ExecTableWithRef execTableWR;
        public string[] refTableNames, refFieldNames; //refTableFields, 
        public int[] refFieldMatchs; //, refFieldTypes;

        public string[][] tableData;
        public string[][] selLists;

        public SessionBean sessionBean;
        public MenuBean menuBean;
        public PageBean pageBean;
        public CodeBean codeBean;
        public ManageSelList manageSelList;
        public JsonConverter jsonConverter;
        public MessageBean messageBean;

        public string[] unqFields, unqFieldData;
        public int[] unqFieldTypes, unqMatchs;

        public string fileField, defPasw, defMask, pageTitle;
        public Stream inpStream;
        public StringReader reader;
        public StreamWriter writer;
        public Stream outStream;
        public ExecuteFileData execFileData;

        public string[] authorized;
        public bool isAuth, isLocale, isDebug;

        public string path, seProc, ueProc, menuName, sideBarName, pageName;
        public string[] strAry;

        public void initParams()
        {
            connType = DATAFILEPATH;
            runDB = new RunDB(connType);
            dbSystem = SQLSERVER;
            confPath = "wwwroot\\conf";
            confFile = "connFile.json";
            connPath = Path.Combine(Directory.GetCurrentDirectory(), confPath, confFile);
            runDB.setDB(dbSystem, connPath);
            algorithm = SHA_256;
            isAuth = false;
            action = "empty";
            sessionBean = new SessionBean();
            messageBean = new MessageBean(isLocale);
            contextRoot = "CSBCA";
        }
        public void setLangEN()
        {
            isLocale = false;
        }
        public void setLangLoc()
        {
            isLocale = true;
        }
    }
}
