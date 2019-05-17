<html>
<head>
<title>Teller Transaction</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="msgData" class="datapro.eibs.beans.ETLR47130Message"  scope="session" />
<jsp:useBean id="brnDetails" class="datapro.eibs.beans.ETLR00001Message"  scope="session" />
<jsp:useBean id= "prmData" class= "java.util.Vector"  scope="session" />
<jsp:useBean id= "prmName" class= "java.util.Vector"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">

var reason = '';

function fixAmount(id) {
	if (document.getElementById(id).value == "") {
		document.getElementById(id).value = 0.00;
	}
}

function goAction(op) {
    if (op == 'R') {
    	document.forms[0].SCREEN.value = 1400;
        document.forms[0].reason.value = reason;
    } else {    
		document.forms[0].SCREEN.value = op;
		if (op == 400) {
			/*
			if (document.getElementById("ACCOUNT").value == 0){
				alert("Enter an account number, please check this field.");
				document.getElementById("ACCOUNT").focus();
				return;
			}
			*/	
			if (document.getElementById("SERIAL").value == "") {
				alert("Enter a serial number, please check this field.");
				document.getElementById("SERIAL").focus();
				return;
			}
			
		    
		    if (document.getElementById("CHECK_AMOUNT").value == 0.00) {
				alert("Check amounts are 0.00, please check those fields.");
				document.getElementById("CHECK_AMOUNT").focus();
				return;
			}
	        
	        document.getElementById("TOTAL").value = document.getElementById("CHECK_AMOUNT").value;
	        
	        /*
	        totalamount = parseFloat(document.getElementById("CHECK_AMOUNT").value);
			if (parseFloat(document.getElementById("TOTAL").value) != totalamount) {
				alert("Sum of amounts and Total amount must be equals, please check this field.");
				document.getElementById("TOTAL").focus();
				return;
			}
			*/
		}
	}		
	document.forms[0].submit();
}

function PrintPreview() {
	var page = "<%=request.getContextPath()%>/pages/e/body_wait.jsp?ServletName=<%=request.getContextPath()%>/servlet/datapro.eibs.teller.JSETLR000";
	var parameters = "?SCREEN=600&HEADER=RECEIPT : TELLER TRANSACTION&DATA=" + escape(document.getElementById("DATA").value);
	CenterWindow(page + parameters, 600, 350, 2);
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

<h3 align="center">TELLER TRANSACTIONS<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="teller_transaction_130.jsp, ETLR000"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.teller.JSETLR000">
<p><input type=HIDDEN name="SCREEN" value="400"></p>
<p><input type=HIDDEN name="PAGE_NAME" value="ETLR000_teller_transaction_130.jsp"></p>
<p><INPUT TYPE=HIDDEN NAME="reason" VALUE=""></p>
<p><input type="HIDDEN" name="ETLRSUP" size="40" maxlength="40" value="<%= brnDetails.getETLRSUP() %>"></p>

<% 
   String Seq = "";
   if (prmName.contains("SEQUENCE")) {
        Seq = prmData.isEmpty() ? "" : Util.delLeftZero(prmData.elementAt(prmName.indexOf("SEQUENCE")).toString());
   }
%>
<p><input type=HIDDEN name="SEQUENCE" value="<%= Seq %>"></p>
<p><input type=HIDDEN id="TOTAL" name="T130_N#15:2$06" value=""></p>
  
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
  	String account = "";
  	String serial = "";
  	String cash = "0.00";
  	String check = "0.00";
  	String other_bank_check = "0.00";
  	String other_country_check = "0.00";
  	String cash_back = "0.00";
  	String total = "0.00";
  	String description = "";
  	if (prmName.contains("T130_N#16$09")) {
  		account = prmData.isEmpty() ? "" : Util.delLeftZero(prmData.elementAt(prmName.indexOf("T130_N#16$09")).toString());
  	}	
  	if (prmName.contains("T130_N#9$0B")) {
  		serial = prmData.isEmpty() ? "" : Util.delLeftZero(prmData.elementAt(prmName.indexOf("T130_N#9$0B")).toString());
  	}	
  	if (prmName.contains("T130_N#15:2$0E")) {
	  	check = prmData.isEmpty() ? "0.00" : Util.delLeftZero(prmData.elementAt(prmName.indexOf("T130_N#15:2$0E")).toString());
  		if (check == "") check = "0.00";
	}  	
  	if (prmName.contains("T130_N#15:2$06")) {
	  	total = prmData.isEmpty() ? "0.00" : Util.delLeftZero(prmData.elementAt(prmName.indexOf("T130_N#15:2$06")).toString());
  		if (total == "") total = "0.00";
	}  	
  	if (prmName.contains("T130_C#40$20")) {
  		data = prmData.isEmpty() ? "" : prmData.elementAt(prmName.indexOf("T130_C#40$20")).toString();
  	}	
  	if (prmName.contains("T110_C#30$32")) {
  		description = prmData.isEmpty() ? "" : prmData.elementAt(prmName.indexOf("T110_C#30$32")).toString();
  	}	
  	String date = prmData.isEmpty() ? "" : prmData.elementAt(prmName.indexOf("DATE")).toString();
  	String time = prmData.isEmpty() ? "" : prmData.elementAt(prmName.indexOf("TIME")).toString();
  	if (msgData.getRecordCount() > 0) {
    	//Answer Stream...
    	if (!msgData.getError().equals("000")) { 
    		data = data + msgData.getError() + ":";  		//Error Code
    		data = data + msgData.getErrorDescription();    //Error Description
    	} else if (msgData.reqApprove()) {			
    		data = msgData.getOUTERD();    						//Qverride Description
	    	data = data + " - ";						 		//Line feed and Carriage return 
	    	data = data + "SEQUENCE : " + msgData.getOUTSQN();	//Teller Sequence 
    	} else {
	    	data = brnDetails.getETLRTCD() + " " + brnDetails.getETLRITD(); // Transaction Code and Description
	    	data = data + "\r"; //Line feed and Carriage return
	    	data = data + "AMOUNT: " + brnDetails.getETLRCCY().trim() + " " + total; //Currency and Total Amount
	    	data = data + "\r"; //Line feed and Carriage return
	    	data = data + date + " " + time + " " + brnDetails.getETLRTID().trim() + "-" + msgData.getOUTSQN().toString(); //Date, Time, Teller ID and Message Sequence
	    	data = data + "\r"; //Line feed and Carriage return
	    	data = data + "======================================="; 
	    	data = data + "\r"; //Line feed and Carriage return
	    	data = data + "CUSTOMER NAME: " + msgData.getOUTNME().toString(); //Customer Name
	    	data = data + "\r"; //Line feed and Carriage return
	    	data = data + "ACCOUNT: " + account; //Account Number	
	    	data = data + "\r"; //Line feed and Carriage return
	    	data = data + "REFERENCE: " + serial; //Reference
	    	data = data + "\r"; //Line feed and Carriage return
            data = data + "REMARKS: " + brnDetails.getETLRITD(); //Transaction Description
	    	data = data + "\r"; //Line feed and Carriage return
	    	data = data + "AMOUNT: " + brnDetails.getETLRCCY().trim() + " " + total; //Currency and Total Amount
	    	data = data + "\r"; //Line feed and Carriage return
			data = data + "ALL CREDITS SUBJECT TO FINAL SETTLEMENT";
	    }	
    	readonly = "READONLY";
    }

    String cash_disabled = "disabled";
    String check_disabled = "disabled";
    String cash_back_disabled = "disabled";
   	if (brnDetails.getETLREFE().equals("Y")) { //Cash
   		cash_disabled = ""; 
   	} else { //Check
   		check_disabled = "";
   	}
   	if (brnDetails.getETLRCYN().equals("Y")) { //Cash Back
   		cash_back_disabled = "";
   	}
   	if (brnDetails.getETLRMYN().equals("Y")) { //Multiple
    	cash_disabled = "";
    	check_disabled = "";
   	}
   	check_disabled = "";
    int submit = 400;
    int cancel = 1;
    String action_label = "Submit";	

    if (Login.equals("REVERSE") || Login.equals("QUERY") || Login.equals("OVERRIDE") || Login.equals("PRINTER") || Login.equals("APPROVED")) {
    	readonly = "READONLY";
    }	
    
   %> 

<br><br>
  
<table  class="tableinfo" cellspacing="0" cellpadding="2" border="0">
<% if (!brnDetails.getETLROFC().equals("C")) { %>
	<tr id="trdark"> 
	    <td nowrap align="right" width="40%" > Account Number :</td>
	    <td nowrap align="left" colspan="2"><input type="text" id="ACCOUNT" name="T130_N#16$09" size="18" maxlength="16" value="<%= account %>" <%= readonly %>>
	    <% if (!readonly.equals("READONLY")) {%>
        	<a href="javascript:GetAccount('T130_N#16$09','','RA','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0" ></a>
        <%}%>
        </td>	
    </tr>
<% } %>    
	<tr id="trclear"> 
	    <td nowrap align="right" width="40%" > Check Number :</td>
	    <td nowrap align="left" colspan="2">
	    	<input type="text" id="SERIAL" name="T130_N#9$0B" size="18" maxlength="9" value="<%= serial %>" <%= readonly %>>
	    </td>	
    </tr>
	<tr id="trdark"> 
	    <td nowrap align="right" width="40%"> Check Amount :</td>
	    <td nowrap align="left" colspan="2">
	    	<input type="text" id="CHECK_AMOUNT" <%= check_disabled %> name="T130_N#15:2$0E" size="18" maxlength="15" value="<%= check %>" <%= readonly %> onkeypress = "enterDecimal()" style="text-align: right;">
	    </td>	
    </tr>
	<tr id="trclear"> 
	    <td nowrap align="right" width="10%" > Description :</td>
	    <td nowrap align="left" colspan="2">
	    	<input type="text" id="DESCRIPTION" name="T110_C#30$32" size="40" maxlength="30" value="<%= description %>" <%= readonly %>>
	    </td>	
    </tr>
</table>

<table  class="tableinfo">
	<tr id="trdark"> 
    	<td nowrap align="left" width="10%" > Answer :</td>
    </tr>	
	<TR id="trdark">
		<TD nowrap align="center" width="10%" >
			<textarea class="tableinfo" rows="10" id="DATA" name="T130_C#40$20" readonly="readonly" style="color: black;">
				<%= data %>
			</textarea>
		</TD>
	</TR>
</table>

<br>

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
	updateColor();
</script>
</body>
</html>
