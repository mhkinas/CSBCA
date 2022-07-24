/**
   csbca - v1.0 - 2020-10-12
   https://www.hayatikinas.com
   This code is part of the CSBCA project
   And it can be used under license terms.
   Copyright Mehmet Hayati KINAŞ
 */

using SDBCS.dbwork;
using SDBCS.utility;

namespace WEBSITE.codes.parameters
{
    public class ContactParams : BaseParameters
	{
		public new void initParams()
		{
			base.initParams();

			tableNames = new string[] { "csbc_contact", "vt_csbc_contact" };
			fieldNames = new string[] { "id", "contact_name", "e_mail", "web_site", "message_data", "rec_date" };
			inputTypes = new string[] { "number", "text", "email", "url", "textarea" };
			selectFields = new string[] { "contact_name", "e_mail", "web_site" };
			selectITs = new string[] { "text", "text", "text" };
			setLabels();
			equalityInt = new int[] { LK, LK, LK };
			fieldTypes = new int[] { INTEGER, STRING, STRING, STRING, STRING, DATE };
			selectFTs = new int[] { STRING, STRING, STRING };
			dataType = STRING;
			orderBy = "id";
			dateFormatter = new DateFormatter(dbSystem);
			prepareQuery = new PrepareQuery();
			prepareQuery.convert2EQLs(equalityInt);
			executeTable = new ExecuteTable(runDB, tableNames, fieldNames, fieldTypes, orderBy, dateFormatter,
											selectFields, selectFTs, messageBean);
			authorized = new string[] { "Admin", "Supervisor" };
			isModal = true; isWithRefs = false;
		}

		public void setLabels()
		{
			if (isLocale)
			{
				labelNames = new string[] { "ID", "İsim", "E-posta", "Web Sitesi", "Mesaj" };
			}
			else
			{
				labelNames = new string[] { "ID", "Name", "E-mail", "Web Site", "Message" };
			}
		}
	}
}
