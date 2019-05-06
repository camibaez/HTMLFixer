<html>
<head>
<title>Teller Transaction</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="msgData" class="datapro.eibs.beans.ETLR47250Message"  scope="session" />
<jsp:useBean id="brnDetails" class="datapro.eibs.beans.ETLR00001Message"  scope="session" />
<jsp:useBean id= "prmData" class= "java.util.Vector"  scope="session" />
<jsp:useBean id= "prmName" class= "java.util.Vector"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/e/javascripts/Ajax.js"> </SCRIPT>
<script	type="text/javascript" src="<%=request.getContextPath()%>/pages/e/javascripts/json2.js"></script>

<script type="text/javascript">

var reason = '';

function fixAmount(id) {
	if (document.getElementById(id).value == "") {
		document.getElementById(id).value = 0.00;
	}
}

function goAction(op) {
	document.forms[0].SCREEN.value = op;
	if (op != 1) {
		var obj = document.getElementById("BASE");
		if (getSelectedValue(obj) == "2") {
		    if (document.getElementById("CREDIT").value == "") {
				alert("Credit Account is blank, please check this field.");
				document.getElementById("CREDIT").focus();
				return;
			}
		}	
		obj = document.getElementById("FOREING");
		if (getSelectedValue(obj) == "2") {
		    if (document.getElementById("DEBIT").value == "") {
				alert("Debit Account is blank, please check this field.");
				document.getElementById("DEBIT").focus();
				return;
			}
		}
	    if (document.getElementById("AMOUNT").value == 0.00) {
			alert("This amount is 0.00, please check this field.");
			document.getElementById("AMOUNT").focus();
			return;
		}
		obj = document.getElementById("FOREING");
		if (getSelectedValue(obj) == "1") {
			document.getElementById("CASH").value = document.getElementById("AMOUNT").value;
		}
	}
	submitForm();
}

function PrintPreview() {
	var page = "<%=request.getContextPath()%>/pages/e/body_wait.jsp?ServletName=<%=request.getContextPath()%>/servlet/datapro.eibs.teller.JSETLR000";
	var parameters = "?SCREEN=600&HEADER=RECEIPT : TELLER TRANSACTION&DATA=" + escape(document.getElementById("DATA").value);
	CenterWindow(page + parameters, 600, 350, 2);
}

function updateAccount(obj) {
	var type = getSelectedValue(obj);
	if (obj.name == "T250_C#1$0Y") {
		if (isValidObject(document.getElementById("DEBIT")))	
			document.getElementById("DEBIT").value = "";
	} else {
		if (isValidObject(document.getElementById("CREDIT")))	
			document.getElementById("CREDIT").value = "";
	} 	
	if (type == "2") {
		if (obj.name == "T250_C#1$0Y") {
			if (isValidObject(document.getElementById("help1")))
				document.getElementById("help1").style.visibility = 'visible';
			if (isValidObject(document.getElementById("help3")))
				document.getElementById("help3").style.visibility = 'hidden';
			if (isValidObject(document.getElementById("DEBIT")))		
				document.getElementById("DEBIT").disabled = false;
		} else {
			if (isValidObject(document.getElementById("help2")))
				document.getElementById("help2").style.visibility = 'visible';
			if (isValidObject(document.getElementById("help4")))
				document.getElementById("help4").style.visibility = 'hidden';
			if (isValidObject(document.getElementById("CREDIT")))	
				document.getElementById("CREDIT").disabled = false;
		}
	} else 	if (type == "4") {
		if (obj.name == "T250_C#1$0Y") {
			if (isValidObject(document.getElementById("help1")))
				document.getElementById("help1").style.visibility = 'hidden';
			if (isValidObject(document.getElementById("help3")))
				document.getElementById("help3").style.visibility = 'visible';
			if (isValidObject(document.getElementById("DEBIT")))		
				document.getElementById("DEBIT").disabled = false;
		} else {
			if (isValidObject(document.getElementById("help2")))
				document.getElementById("help2").style.visibility = 'hidden';
			if (isValidObject(document.getElementById("help4")))
				document.getElementById("help4").style.visibility = 'visible';
			if (isValidObject(document.getElementById("CREDIT")))	
				document.getElementById("CREDIT").disabled = false;
		}
	} else {
		if (obj.name == "T250_C#1$0Y") {
			if (isValidObject(document.getElementById("help1")))
				document.getElementById("help1").style.visibility = 'hidden';
			if (isValidObject(document.getElementById("help3")))
				document.getElementById("help3").style.visibility = 'hidden';
			if (isValidObject(document.getElementById("DEBIT")))		
				document.getElementById("DEBIT").disabled = true;
		} else {
			if (isValidObject(document.getElementById("help2")))
				document.getElementById("help2").style.visibility = 'hidden';
			if (isValidObject(document.getElementById("help4")))
				document.getElementById("help4").style.visibility = 'hidden';
			if (isValidObject(document.getElementById("CREDIT")))	
				document.getElementById("CREDIT").disabled = true;
		}
	}
}

function updateCharges(obj) {
	document.getElementById("CHARGES").value = obj.value;
}

function updateColor() {
	<%
		String color = "black"; 
		if (msgData.getStreamLength() > 0) {
			color = msgData.getError().equals("000") ? "black" : "red";
		}
	%>
	document.getElementById("DATA").style.color = "<%= color %>";
}

function calculate() {
	document.getElementById("b3").style.visibility = 'hidden';
    var text = "  Calculating Fees and Amount in Base Currency...";
	callWaiting("searchWait", "<%=request.getContextPath()%>/images/throbber.gif", text);

	var parameters = "SCREEN=2400";
	parameters += "&ETLRTID=" + getElement("ETLRTID").value;
	parameters += "&ETLRTCD=" + getElement("ETLRTCD").value;
	parameters += "&T250_C#1$0Y=" + getElement("T250_C#1$0Y").value;
	parameters += "&T250_C#1$0Z=" + getElement("T250_C#1$0Z").value;
	parameters += "&T250_C#3$0V=" + getElement("T250_C#3$0V").value;
	parameters += "&T250_N#15:2$0D=" + getElement("T250_N#15:2$0D").value;
	parameters += "&T250_N#15:2$0R=" + getElement("T250_N#15:2$0R").value;
	parameters += "&T250_C#2$60=" + getElement("T250_C#2$60").value;
	parameters += "&T250_C#1$62=" + getElement("T250_C#1$62").value;
	parameters += "&T250_N#11:6$0S=" + getElement("T250_N#11:6$0S").value;
	parameters += "&T250_N#15:2$0W=" + getElement("T250_N#15:2$0W").value;
	parameters += "&T250_C#1$61=1";

	var url = "<%=request.getContextPath()%>/servlet/datapro.eibs.teller.JSETLR000";
	PostXMLRequest(url, parameters, fillFields, true);
}

function fillFields(res) {
   	// clear wait Icon display area
   	var searchWait = document.getElementById("searchWait");
   	searchWait.innerHTML = "";
   	document.getElementById("b3").style.visibility = 'visible';
   	var json = JSON.parse(res.responseText);
   	if (json.type == "data") {
   		var data = json.data;
   	   	getElement("BASEAMOUNT").value = data.OUTEQV; 
   	   	getElement("COMMISSION").value = data.OUTCOM; 
   	   	getElement("TAXES").value = data.OUTTAX; 
   	   	getElement("TOTAL").value = data.OUTQT1; 
   	 	setClickValue(document.getElementsByName("T250_CHARGES"), data.OUTSCF);
   	} else {
   		var error = json.error;
   		var text = error.OUTER + ": " + error.OUTDSC;
   		alert("ERROR " + text);
   	}
}
	
</SCRIPT> 

<%@ page import = "datapro.eibs.master.Util" %>

</head>

<BODY>

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }

	String Login = userPO.getPurpose();
%> 

<h3 align="center">TELLER TRANSACTIONS<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="teller_transaction_250.jsp, ETLR000"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.teller.JSETLR000">
<input type=HIDDEN id="SCREEN" name="SCREEN" value="400">
<input type=HIDDEN name="PAGE_NAME" value="ETLR000_teller_transaction_250.jsp">
<INPUT TYPE=HIDDEN NAME="reason" VALUE="">
<input type="HIDDEN" name="ETLRSUP" size="40" maxlength="40" value="<%= brnDetails.getETLRSUP() %>" readonly>

<% 
   String Seq = "";
   if (prmName.contains("SEQUENCE")) {
        Seq = prmData.isEmpty() ? "" : Util.delLeftZero(prmData.elementAt(prmName.indexOf("SEQUENCE")).toString());
   }
%>
<input type=HIDDEN name="SEQUENCE" value="<%= Seq %>">
<input type=HIDDEN id="CASH" name="T250_N#15:2$01" value="">
  
<table class="tableinfo" cellspacing="0" cellpadding="2" border="0">
  <tr id="trdark"> 
    <td nowrap align="right" width="10%"> Teller ID :</td>
    <td nowrap align="left" width="10%"><input type="text" name="ETLRTID" size="3" maxlength="3" value="<%= brnDetails.getETLRTID().trim()%>" readonly></td>
    <td nowrap align="right" width="20%"> Teller Currency :</td>
    <td nowrap align="left"><input type="text" name="ETLRCCY" size="3" maxlength="3" value="<%= brnDetails.getETLRCCY().trim()%>" readonly></td>
    <td nowrap align="right" width="30%" > Teller Transaction :</td>
    <td nowrap align="left" width="30%"> 
        <input type="text" name="ETLRTCD" size="3" maxlength="3" value = "<%= brnDetails.getETLRTCD() %>"  readonly>
        <input type="text" name="ETLRITD" size="40" maxlength="40" value="<%= brnDetails.getETLRITD().trim()%>" readonly>
    </td>
  </tr>
</table>
  
  <% 
  	String data = "";
  	String readonly = "";
  	String disabled = "";
  	String type = brnDetails.getETLRTCD().startsWith("92") ? "S" : "P";

  	String foreing = "1"; //0Y 
  	String payment = "1"; //0Z
  	String currency = ""; //0V
  	String rate = "0.000000"; //0S
  	String amount = "0.00"; //0W - 01
  	String debit = ""; //09
  	String credit = ""; //0A
  	String beneficiary = ""; //88
  	String remark = ""; //87
  	String concept = ""; //86

  	String base = "0.00"; //13
  	String tablecomm = ""; //60
  	String charges = "0"; //62
  	String commission = "0.00"; //0D
  	String taxes = "0.00"; //0R
  	String total = "0.00"; //02
  	
  	
  	if (prmName.contains("T250_N#12$09")) {
  		debit = prmData.isEmpty() ? "" : Util.delLeftZero(prmData.elementAt(prmName.indexOf("T250_N#12$09")).toString());
  	}	
  	if (prmName.contains("T250_N#12$0A")) {
  		credit = prmData.isEmpty() ? "" : Util.delLeftZero(prmData.elementAt(prmName.indexOf("T250_N#12$0A")).toString());
  	}	
  	if (prmName.contains("T250_C#1$0Y")) {
  		foreing = prmData.isEmpty() ? "1" : prmData.elementAt(prmName.indexOf("T250_C#1$0Y")).toString();
  	}	
  	if (prmName.contains("T250_C#1$0Z")) {
  		payment = prmData.isEmpty() ? "1" : prmData.elementAt(prmName.indexOf("T250_C#1$0Z")).toString();
  	}	
  	if (prmName.contains("T250_C#3$0V")) {
  		currency = prmData.isEmpty() ? "" : prmData.elementAt(prmName.indexOf("T250_C#3$0V")).toString();
  	}	
  	if (prmName.contains("T250_N#11:6$0S")) {
  		rate = prmData.isEmpty() ? "0.000000" : Util.delLeftZero(prmData.elementAt(prmName.indexOf("T250_N#11:6$0S")).toString());
  		if (rate == "") rate = "0.000000";
  	}	
  	if (prmName.contains("T250_N#15:2$0W")) {
  		amount = prmData.isEmpty() ? "0.00" : Util.delLeftZero(prmData.elementAt(prmName.indexOf("T250_N#15:2$0W")).toString());
  		if (amount == "") amount = "0.00";
  	}	
  	if (prmName.contains("T250_N#15:2$13")) {
  		base = prmData.isEmpty() ? "0.00" : Util.delLeftZero(prmData.elementAt(prmName.indexOf("T250_N#15:2$13")).toString());
  		if (base == "") base = "0.00";
  	}	
  	if (prmName.contains("T250_N#15:2$0D")) {
  		commission = prmData.isEmpty() ? "0.00" : Util.delLeftZero(prmData.elementAt(prmName.indexOf("T250_N#15:2$0D")).toString());
  		if (commission == "") commission = "0.00";
  	}	
  	if (prmName.contains("T250_N#15:2$0R")) {
  		taxes = prmData.isEmpty() ? "0.00" : Util.delLeftZero(prmData.elementAt(prmName.indexOf("T250_N#15:2$0R")).toString());
  		if (taxes == "") taxes = "0.00";
  	}	
  	if (prmName.contains("T250_N#15:2$02")) {
  		total = prmData.isEmpty() ? "0.00" : Util.delLeftZero(prmData.elementAt(prmName.indexOf("T250_N#15:2$02")).toString());
  		if (total == "") total = "0.00";
  	}	
  	if (prmName.contains("T250_C#30$88")) {
  		beneficiary = prmData.isEmpty() ? "" : prmData.elementAt(prmName.indexOf("T250_C#30$88")).toString();
  	}	
  	if (prmName.contains("T250_C#30$87")) {
  		remark = prmData.isEmpty() ? "" : prmData.elementAt(prmName.indexOf("T250_C#30$87")).toString();
  	}	
  	if (prmName.contains("T250_C#30$86")) {
  		concept = prmData.isEmpty() ? "" : prmData.elementAt(prmName.indexOf("T250_C#30$86")).toString();
  	}	
  	if (prmName.contains("T250_C#2$60")) {
  		tablecomm = prmData.isEmpty() ? "" : prmData.elementAt(prmName.indexOf("T250_C#2$60")).toString();
  	}	
  	if (prmName.contains("T250_C#1$62")) {
  		charges = prmData.isEmpty() ? "0" : prmData.elementAt(prmName.indexOf("T250_C#1$62")).toString();
  	}	


  	String date = prmData.isEmpty() ? "" : prmData.elementAt(prmName.indexOf("DATE")).toString();
  	String time = prmData.isEmpty() ? "" : prmData.elementAt(prmName.indexOf("TIME")).toString();
  	if (msgData.getRecordCount() > 0) {
    	//Answer Stream...
    	if (!msgData.getError().equals("000")) { 
    		data += msgData.getError() + ":";  		//Error Code
    		data += msgData.getErrorDescription();  //Error Description
    	} else if (msgData.reqApprove()) {			
    		data = msgData.getOUTERD();    						//Qverride Description
	    	data = data + " - ";						 		//Line feed and Carriage return 
	    	data = data + "SEQUENCE : " + msgData.getOUTSQN();	//Teller Sequence 
    	} else {
	    	data = brnDetails.getETLRTCD() + " " + brnDetails.getETLRITD(); // Transaction Code and Description
	    	data = data + "\r"; //Line feed and Carriage return
	    	data = data + date + " " + time + " " + brnDetails.getETLRTID().trim() + "-" + msgData.getOUTSQN().toString(); //Date, Time, Teller ID and Message Sequence
	    	data = data + "\r"; //Line feed and Carriage return
	    	data = data + "======================================="; 
	    	data = data + "\r"; //Line feed and Carriage return
	    	data = data + "BENEFICIARY NAME: " + msgData.getOUTBNF().toString(); //Beneficiary Name
	    	data = data + "\r"; //Line feed and Carriage return
	    	data = data + "ACCOUNT: " + (credit.equals("") ? debit : credit); //Credit or Debit Account Number	
	    	data = data + "\r"; //Line feed and Carriage return
	    	data = data + "AMOUNT: " + currency + " " + amount; //Currency and Total Amount
	    	data = data + "\r"; //Line feed and Carriage return
	    	data = data + "EXCHANGE RATE: " + rate; //Rate
	    	data = data + "\r"; //Line feed and Carriage return
	    	data = data + "BASE CURRENCY: " + base; //Base Currency
	    	data = data + "\r"; //Line feed and Carriage return
	    	data = data + "COMMISSION: " + commission; //Commission
	    	data = data + "\r"; //Line feed and Carriage return
	    	data = data + "SALES TAX: " + taxes; //Taxes
	    	data = data + "\r"; //Line feed and Carriage return
	    	data = data + "TOTAL: " + total; //Total
	    	data = data + "\r"; //Line feed and Carriage return
	    	data = data + "======================================="; 
	    	data = data + "\r"; //Line feed and Carriage return
	    	data = data + "CONCEPT: " + concept; //Concept
	    	data = data + "\r"; //Line feed and Carriage return
            data = data + "REMARKS: " + remark; //Remarks
	    }	
    	readonly = "READONLY";
    	disabled = "disabled";
    }

    int submit = 400;
    int cancel = 1;
    String action_label = "Submit";
    
   if (Login.equals("REVERSE") || Login.equals("QUERY") || Login.equals("OVERRIDE") || Login.equals("PRINTER") || Login.equals("APPROVED")) {
    	readonly = "READONLY";
    	disabled = "disabled";    
   }	
   %> 

<br><br>

<table  class="tableinfo" cellspacing="0" cellpadding="2" border="0">
	<tr id="trdark"> 
	    <td nowrap align="right" width="25%" > Foreign Type :</td>
	    <td nowrap align="left" width="25%">
	    	<select id="FOREING" name="T250_C#1$0Y" <%= disabled %> onchange="updateAccount(this)">
	    		<option value="1">Cash</option>
	    		<option value="2">Account</option>
	    		<option value="3">Check</option>
	    		<option value="4">Other</option>
	    	</select>
	    </td>	
	    <td nowrap align="right" width="25%" > Payment Type :</td>
	    <td nowrap align="left" width="25%">
	    	<select id="BASE" name="T250_C#1$0Z" <%= disabled %> onchange="updateAccount(this)">
	    		<option value="1">Cash</option>
	    		<option value="2">Account</option>
	    		<option value="3">Check</option>
	    		<option value="4">Other</option>
	    	</select>
	    </td>	
    </tr>
	<tr id="trclear"> 
   		<th colspan="2" align="center">Foreign Currency Amount</th>
   		<th colspan="2" align="center">Base Currency Amount</th>
   	</tr>
	<tr id="trdark"> 
	    <td nowrap align="right" width="25%" > Currency :</td>
	    <td nowrap align="left" width="25%">
	    	<input type="text" id="CURRENCY" name="T250_C#3$0V" size="6" maxlength="3" value="<%= currency %>" <%= readonly %> style="text-align: center">
		    <% if (!readonly.equals("READONLY")) {%>
	        	<a href="javascript:GetCurrencyRate('T250_C#3$0V','', 'T250_N#11:6$0S', '<%=type%>')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0" ></a>
	        <%}%>
	        &nbsp;
	        Commission Table :
	    	<input type="text" id="TABLECOMM" name="T250_C#2$60" size="4" maxlength="2" value="<%= tablecomm %>" <%= readonly %> style="text-align: center">
		    <% if (!readonly.equals("READONLY")) {%>
	        	<a href="javascript:GetCommissionTable('T250_C#2$60', getElement('CURRENCY').value, getElement('ETLRTCD').value)">
	        		<img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0" ></a>
	        <%}%>
	    </td>    
	    <td nowrap align="right" width="25%" > Base Amount :</td>
	    <td nowrap align="left" width="25%">
	    	<input type="text" id="BASEAMOUNT" name="T250_N#15:2$13" size="18" maxlength="15" value="<%= base %>" readonly="readonly"
	    		style="text-align: right; font-weight: bold; background-color: silver;">
	    </td>	
    </tr>
	<tr id="trclear"> 
	    <td nowrap align="right" width="25%" > Charges to :</td>
	    <td nowrap align="left" width="25%">
	    	<input type="radio" name="T250_CHARGES" value="0" <%= disabled %> checked="checked" onclick="updateCharges(this)">&nbsp;Debit
	    	<input type="radio" name="T250_CHARGES" value="1" <%= disabled %> onclick="updateCharges(this)">&nbsp;Credit
	    	<input type=HIDDEN id="CHARGES" name="T250_C#1$62" value="<%=charges%>">
	    </td>	
	    <td nowrap align="right" width="25%" > Commission Amount :</td>
	    <td nowrap align="left" width="25%">
	    	<input type="text" id="COMMISSION" name="T250_N#15:2$0D" size="18" maxlength="15" value="<%= commission %>" 
	    		style="text-align: right">
	    </td>	
    </tr>
	<tr id="trdark"> 
	    <td nowrap align="right" width="25%" > Rate :</td>
	    <td nowrap align="left" width="25%">
	    	<input type="text" id="RATE" name="T250_N#11:6$0S" size="18" maxlength="11" value="<%= rate %>" <%= readonly %> style="text-align: right">
	    </td>	
	    <td nowrap align="right" width="25%" > Taxes :</td>
	    <td nowrap align="left" width="25%">
	    	<input type="text" id="TAXES" name="T250_N#15:2$0R" size="18" maxlength="15" value="<%= taxes %>" 
	    		style="text-align: right">
	    </td>	
    </tr>
	<tr id="trclear"> 
	    <td nowrap align="right" width="25%" > Amount :</td>
	    <td nowrap align="left" width="25%">
	    	<input type="text" id="AMOUNT" name="T250_N#15:2$0W" size="18" maxlength="15" value="<%= amount %>" <%= readonly %> 
	    		onkeypress = "enterDecimal()" style="text-align: right">
	    </td>	
	    <td nowrap align="right" width="25%" > Credit Amount :</td>
	    <td nowrap align="left" width="25%">
	    	<input type="text" id="TOTAL" name="T250_N#15:2$02" size="18" maxlength="15" value="<%= total %>" readonly="readonly" 
	    		style="text-align: right; font-weight: bold; background-color: silver;">
	    </td>	
    </tr>
	<tr id="trdark"> 
	    <td nowrap align="right" width="25%" > Account Number :</td>
	    <td nowrap align="left" width="25%">
	    	<input type="text" id="DEBIT" name="T250_N#12$09" size="18" maxlength="12" value="<%= debit %>" <%= readonly %>>
		    <% 	if (!readonly.equals("READONLY")) { %>
	        	<a id="help1" href="javascript:GetAccount('T250_N#12$09','','RA','')" 
	        		style="visibility: hidden; position: absolute;">
	        		<img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0" >
	        	</a>
	        	<a id="help3" href="javascript:GetLedger('T250_N#12$09','',document.getElementById('CURRENCY').value,'')" 
	        		style="visibility: hidden; position: absolute;">
	        		<img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0" >
	        	</a>
	        <%	} %>
	    </td>    
	    <td nowrap align="right" width="25%" > Account Number :</td>
	    <td nowrap align="left" width="25%">
	    	<input type="text" id="CREDIT" name="T250_N#12$0A" size="18" maxlength="12" value="<%= credit %>" <%= readonly %>>
		    <% if (!readonly.equals("READONLY")) {%>
	        	<a id="help2" href="javascript:GetAccount('T250_N#12$0A','','RA','')" 
	        		style="visibility: hidden; position: absolute;">
	        		<img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0" >
	        	</a>
	        	<a id="help4" href="javascript:GetLedger('T250_N#12$0A','','<%=brnDetails.getETLRCCY().trim()%>','')" 
	        		style="visibility: hidden; position: absolute;">
	        		<img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0" >
	        	</a>
	        <%}%>
	    </td>    
    </tr>
	<tr id="trclear"> 
	    <td nowrap align="right" width="25%" > Beneficiary :</td>
	    <td nowrap align="left" width="25%">
	    	<input type="text" id="BENEFICIARY" name="T250_C#30$88" size="40" maxlength="30" value="<%= beneficiary %>" <%= readonly %>>
	    </td>	
	    <td nowrap align="right" width="25%" > Remark :</td>
	    <td nowrap align="left" width="25%">
	    	<input type="text" id="REMARK" name="T250_C#30$87" size="40" maxlength="30" value="<%= remark %>" <%= readonly %>>
	    </td>	
    </tr>
	<tr id="trdark"> 
	    <td nowrap align="right" width="25%" > Concept :</td>
	    <td nowrap align="left" width="25%">
	    	<input type="text" id="CONCEPT" name="T250_C#30$86" size="40" maxlength="30" value="<%= concept %>" <%= readonly %>>
	    </td>	
	    <td nowrap align="center" colspan="2" >
	    	<input class="EIBSBTN" id="b3" type=button name="Calculate" value="Calculate" onClick="calculate()" 
	    		alt="Get Base Currency and Commissions" style="visibility: visible;">
	    	<span id="searchWait"></span>
	    </td>
    </tr>
</table>

<table  class="tableinfo">
	<tr id="trdark"> 
    	<td nowrap align="left" width="10%" > Answer :</td>
    </tr>	
	<TR id="trdark">
		<TD nowrap align="center" width="10%" >
			<textarea class="tableinfo" rows="10" id="DATA" name="T250_C#40$20" readonly="readonly" style="color: black;">
				<%= data %>
			</textarea>
		</TD>
	</TR>
</table>

<br><br>
  
<%
if (readonly.equals("READONLY")) {
		int command = 1;
		String label = "Accept";
		if ((msgData.getRecordCount() > 0)) {
	    	if (!msgData.getError().equals("000")) { 
	    		command = 500;
	    		label = "Back";
	    	}
			if (msgData.reqApprove()) {
	    		command = 700;
	    		if (Login.equals("APPROVED")) Login = "";
	    		label = "Override";
			}
		}
%>
<table class="tbenter" width=100% align=center>
	<tr> 
<%
	if (Login.equals("REVERSE")) {
%>         
    	<td><div align="center"><input id="EIBSBTN" type=button name="Submit" value="Reverse" onClick="goAction(1200)"></div></td>
        <td><div align="center"><input id="EIBSBTN" type=button name="Cancel" value="Cancel" onClick="goAction(2)"></div></td>
<%        
    } else if (Login.equals("REVERSE_LIST")) {
%>
    	<td><div align="center"><input id="EIBSBTN" type=button name="Submit" value="Close" onClick="goAction(2)"></div></td>
<%  	 
    } else if (Login.equals("QUERY")) {
%>
    	<td><div align="center"><input id="EIBSBTN" type=button name="Submit" value="Close" onClick="checkClose()"></div></td>
<%  	 
    } else if (Login.equals("PRINTER")) {
%>
       	<td><div align="center"><input id="EIBSBTN" type=button name="Cancel" value="Cancel" onClick="goAction(3)"></div></td>
        <td><div align="center"><input id="EIBSBTN" type=button name="Submit" value="Print"  OnClick="PrintPreview();"></div></td>
<%  	 
    } else if (Login.equals("OVERRIDE")) {
%>
        <td><div align="center"><input id="EIBSBTN" type=button name="Approve" value="Approve" onClick="goAction(1300)"></div></td>
        <td><div align="center"><input id="EIBSBTN" type=button name="Rejected" value="Rejected"  onClick="javascript:enterReason('R')"></div></td>
       	<td><div align="center"><input id="EIBSBTN" type=button name="Cancel" value="Cancel" onClick="goAction(800)"></div></td>
<%
    } else if (Login.equals("APPROVED")) {
%>
    	<td><div align="center"><input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="goAction(400)"></div></td>
<%  	 
    } else {
%>
        <td><div align="center"><input id="EIBSBTN" type=button name="Accept" value="<%= label %>" onClick="goAction(<%= command %>)"></div></td>
        <% if (command == 500) { %>
        	<td><div align="center"><input id="EIBSBTN" type=button name="Cancel" value="Cancel" onClick="goAction(1)"></div></td>
        <% } %>	
        <td><div align="center"><input id="EIBSBTN" type=button name="Submit" value="Print"  OnClick="PrintPreview();"></div></td>
    </tr>
<%
	}
%>    
</table>
<%
} else {
%>
<table class="tbenter" width=100% align=center>
	<tr> 
    	<td><div align="center"><input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="goAction(400)"></div></td>
        <td><div align="center"><input id="EIBSBTN" type=button name="Cancel" value="Cancel" onClick="goAction(1)"></div></td>
    </tr>
</table>
<%
}
%>
     
</form>

<script type="text/javascript">
	setClickValue(document.getElementsByName("T250_CHARGES"), '<%=charges%>');
	setSelectedValue(document.getElementById("FOREING"), '<%=foreing%>');
	updateAccount(document.getElementById("FOREING"));
	setSelectedValue(document.getElementById("BASE"), '<%=payment%>');
	updateAccount(document.getElementById("BASE"));
	updateColor();
	
	document.getElementById("b3").style.visibility = (<%=Login.equals("OVERRIDE")%> ? 'hidden' : 'visible');
	
	document.getElementById("DEBIT").value = '<%=debit%>';
	document.getElementById("CREDIT").value = '<%=credit%>';
	
</script>

</body>
</html>
