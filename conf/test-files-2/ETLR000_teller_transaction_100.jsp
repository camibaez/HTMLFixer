<html>
<head>
<title>Teller Transaction</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="msgData" class="datapro.eibs.beans.ETLR47100Message"  scope="session" />
<jsp:useBean id="brnDetails" class="datapro.eibs.beans.ETLR00001Message"  scope="session" />
<jsp:useBean id= "prmData" class= "java.util.Vector"  scope="session" />
<jsp:useBean id= "prmName" class= "java.util.Vector"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<script language="JavaScript">

function goAction(op) {
	document.forms[0].SCREEN.value = op;
	if (op == 400) {
        if (document.getElementById("ACCOUNT").value == 0){
			alert("Enter an account number, please check this field.");
			document.getElementById("ACCOUNT").focus();
			return;
		}
	}		
	document.forms[0].submit();
}

function PrintPreview() {
  CenterWindow('<%=request.getContextPath()%>/servlet/datapro.eibs.teller.JSETLR000?SCREEN=600&HEADER=ACCOUNT INQUIRY&DATA=' + escape(document.getElementById("DATA").value),600,250,4);
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
%> 

<h3 align="center">TELLER TRANSACTIONS<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="teller_transaction_100.jsp, ETLR000"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.teller.JSETLR000" >
<p><input type=HIDDEN name="SCREEN" value="400"></p>
<p><input type=HIDDEN name="PAGE_NAME" value="ETLR000_teller_transaction_100.jsp"></p>
<p><input type="HIDDEN" name="ETLRSUP" size="40" maxlength="40" value="<%= brnDetails.getETLRPGM() %>" readonly></p>

  
        <table class="tableinfo">
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
  	String account = prmData.isEmpty() ? "" : Util.delLeftZero(prmData.elementAt(prmName.indexOf("T100_N#16$09")).toString());
  	if (msgData.getRecordCount() > 0) {
    	//Answer Stream...
    	if (!msgData.getError().equals("000")) { 
    		data = data + msgData.getError() + ":";  		//Error Code
    		data = data + msgData.getErrorDescription();    //Error Description
    	} else {
    	    account = Util.delLeftZero(msgData.getDDAACC().toString());
    	    data = data + "ACCOUNT NUMBER: " + account;
	    	data = data + "\r"; //Line feed and Carriage return
	    	data = data + "ACCOUNT TYPE: " + msgData.getDDAPTY().toString();			
	    	data = data + "\r"; //Line feed and Carriage return
	    	data = data + "CUSTOMER NAME: " + msgData.getDDACNM().toString();	
	    	data = data + "\r"; //Line feed and Carriage return						 						
	    	data = data + "GROSS BALANCE: " + msgData.getDDAPSG().toString() + Util.fmtCCY(msgData.getDDAPRI().toString());
	    	data = data + " " + msgData.getDDACCY().toString();
	    	data = data + "\r"; //Line feed and Carriage return						 						
	    	data = data + "AVAILABLE BALANCE: " + msgData.getDDAGSG().toString() + Util.fmtCCY(msgData.getDDAGRS().toString());
	    	data = data + " " + msgData.getDDACCY().toString();
	    	data = data + "\r"; //Line feed and Carriage return						 						
	    	data = data + "OFFICIAL CODE: " + msgData.getDDAOFF().toString();
	    }	
    	readonly = "READONLY";
    }
   %> 

<br><br>
  
<table  class="tableinfo">
	<tr id="trdark"> 
	    <td nowrap align="right" width="10%" > Account Number :</td>
	    <td nowrap align="left" width="10%"><input type="text" id="ACCOUNT" name="T100_N#16$09" size="18" maxlength="16" value="<%= account %>" <%= readonly %>>
	    <% if (!readonly.equals("READONLY")) {%>
        	<a href="javascript:GetAccount('T100_N#16$09','','RA','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0" ></a>
        <%}%>
        </td>	
    </tr>
</table>

<table  class="tableinfo">
	<tr id="trdark"> 
    	<td nowrap align="left" width="10%" > Answer :</td>
    </tr>	
	<TR id="trdark">
		<TD nowrap align="center" width="10%" >
			<textarea class="tableinfo" rows="10" id="DATA" name="txtAnswer" readonly="readonly" style="color: black;">
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
    	if (!msgData.getError().equals("000")) { 
    		command = 500;
    		label = "Back";
    	}
%>
<table class="tbenter" width=100% align=center>
	<tr> 
        <td><div align="center"><input id="EIBSBTN" type=button name="Accept" value="<%= label %>" onClick="goAction(<%= command %>)"></div></td>
        <% if (command == 500) { %>
        	<td><div align="center"><input id="EIBSBTN" type=button name="Cancel" value="Cancel" onClick="goAction(1)"></div></td>
        <% } %>	
        <td><div align="center"><input id="EIBSBTN" type=button name="Submit" value="Print"  OnClick="PrintPreview();"></div></td>
    </tr>
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
