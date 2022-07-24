/*! action-part - v1.0 - 2020-10-24
* https://hayatikinas.com
* This code a part of CSBCA project
* And it can be used under license terms.
* Copyright Mehmet Hayati KINAŞ; Proprietary Software */

/*! messages */

function putMessages()
{
	let alerts = "";
	
	if(jsObjData.resultMessage != undefined)
	{
		alerts += "<div id=\"alertrm\" class=\"alert alert-info\">"+
					"<strong>resultMessage: </strong>"+jsObjData["resultMessage"]+
				  "</div>";
	}
	if(jsObjData.messageScript != undefined)
	{
		alerts += "<div id=\"alertms\" class=\"alert alert-warning\">"+
					"<strong>messageScript: </strong>"+jsObjData["messageScript"]+
				  "</div>";
	}
	if(jsObjData.errorString != undefined)
	{
		alerts += "<div id=\"alertes\" class=\"alert alert-danger\">"+
					"<strong>errorString: </strong>"+jsObjData["errorString"]+
				  "</div>";
	}
	if(alerts !== "")
		document.getElementById("alerts").innerHTML = alerts;
}

//________________________________________________________________________________________________________________________________________

/*! logging */

function logFD(formData)
{
	for (let key of formData.keys()) 
	{
	   console.log(key); 
	}
	for (let value of formData.values()) 
	{
	   console.log(value); 
	}	
}

function logJD(jsonD)
{
	console.log(JSON.stringify(jsonD));
}

function logStr(str)
{
	console.log(str);
}

/*! action */

function sendInsert(url, formId)
{
	let formElement = document.getElementById(formId);
	
	let formData = new FormData(formElement);

	formData.append("action","insert");

	formData.append("isLocale", window.isLocale);
	
	logFD(formData);
	
	sendForm(url, insertResponse, formData);
}

function insertResponse(xhr)
{
	let dataRow = null;
	
	if(xhr.responseText !== "")
	{
		logStr(xhr.responseText);
		
		window.jsObjData = JSON.parse(xhr.responseText); 	

		putMessages();
	}else
		logStr("json data is empty!");
	
	logStr(jsObjData);
}

function sendForm(url, callFunc, formData) 
{
  var xhr = window.XMLHttpRequest ? new XMLHttpRequest() : new ActiveXObject("Microsoft.XMLHTTP");
  
  xhr.open("POST", url, true);

  xhr.onreadystatechange = function() 
  {
    if (xhr.readyState == 4 && xhr.status == 200) 
	{
      callFunc(xhr);
    }
  };
  xhr.send(formData);
}

