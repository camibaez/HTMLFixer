<html>
<head>
<title>Teller Transaction</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="msgData" class="datapro.eibs.beans.ETLR47170Message"  scope="session" />
<jsp:useBean id="brnDetails" class="datapro.eibs.beans.ETLR00001Message"  scope="session" />
<jsp:useBean id= "prmData" class= "java.util.Vector"  scope="session" />
<jsp:useBean id= "prmName" class= "java.util.Vector"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">

function goAction(op) {
	if (getElement("ETLRTID").value.length == 0) {
		alert("You don't have a Teller ID valid. Please fix this problem and try again.");
		getElement("ETLRTID").focus();
	} else {
		document.forms[0].SCREEN.value = op;
		document.forms[0].submit();
	}
}

function PrintPreview() {
	var page = "<%=request.getContextPath()%>/pages/e/body_wait.jsp?ServletName=<%=request.getContextPath()%>/servlet/datapro.eibs.teller.JSETLR000";
	var parameters = "?SCREEN=600&HEADER=BRANCH CLOSING&DATA=" + escape(document.getElementById("DATA").value);
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

	String supervisor = "".equals(brnDetails.getETLRSUP()) ? "NO" : "YES";
%> 

<h3 align="center">TELLER TRANSACTIONS
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="teller_transaction_170.jsp, ETLR000"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.teller.JSETLR000" >
<p><input type=HIDDEN name="SCREEN" value="400"></p>
<p><input type=HIDDEN name="PAGE_NAME" value="ETLR000_teller_transaction_170.jsp"></p>
<p><input type="HIDDEN" name="ETLRSUP" size="40" maxlength="40" value="<%= brnDetails.getETLRSUP() %>"></p>

  
        <table class="tableinfo">
          <tr id="trdark"> 
            <td nowrap align="right" width="10%"> Teller ID :</td>
            <td nowrap align="left" width="10%">
            	<input type="text" name="ETLRTID" size="3" maxlength="3" value="<%= brnDetails.getETLRTID().trim()%>" readonly>
			    <% if (supervisor.equals("YES")) {%>
		        	<a href="javascript:GetTellerID('ETLRTID')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0" ></a>
		        <%}%>
            </td>
            <td nowrap align="right" width="30%" > Teller Transaction :</td>
            <td nowrap align="left" width="30%"> 
                <input type="text" name="ETLRTCD" size="3" maxlength="3" value = "<%= brnDetails.getETLRTCD() %>"  readonly>
                <input type="text" name="ETLRITD" size="40" maxlength="40" value="<%= brnDetails.getETLRITD().trim()%>" readonly>
            </td>
          </tr>
        </table>
     
  
  <% 
  	String readonly = "";
  	String data = "";
  	String date = prmData.isEmpty() ? "" : prmData.elementAt(prmName.indexOf("DATE")).toString();
  	String time = prmData.isEmpty() ? "" : prmData.elementAt(prmName.indexOf("TIME")).toString();
  	if (msgData.getRecordCount() > 0) {
    	//Answer Stream...
    	if (!msgData.getError().equals("000")) { 
    		data = data + msgData.getError() + ":";  		//Error Code
    		data = data + msgData.getErrorDescription();    //Error Description
    	} else {
	    	data = brnDetails.getETLRTCD() + " " + brnDetails.getETLRITD(); // Transaction Code and Description
	    	data = data + "\r"; //Line feed and Carriage return
	    	data = data + date + " " + time; //Date, Time, Teller ID and Message Sequence
	    	data = data + "\r"; //Line feed and Carriage return
	    	data = data + "======================================="; 
	    	data = data + "\r"; //Line feed and Carriage return
    		data = data + "           Teller Closed.";
	    	data = data + "\r"; //Line feed and Carriage return
	    	data = data + "======================================="; 
	    }	
    	readonly = "READONLY";
    }
   %> 

<table  class="tableinfo">
	<tr id="trdark"> 
    	<td nowrap align="left" width="10%" > Answer :</td>
    </tr>	
	<TR id="trdark">
		<TD nowrap align="center" width="10%" >
			<textarea class="tableinfo" rows="10" id="DATA" name="T170_C#40$20" readonly="readonly" style="color: black; text-align: left;">
				<%= data %>
			</textarea>
		</TD>
	</TR>
</table>

<br><br><br><br>

<%
if (readonly.equals("READONLY")) {
		int command = 1;
		String label = "Aceptar";
    	if (!msgData.getError().equals("000")) { 
    		command = 500;
    		label = "Atras";
    	}
%>
<table class="tbenter" width=100% align=center>
	<tr> 
        <td><div align="center"><input id="EIBSBTN" type=button name="Accept" value="<%= label %>" onClick="goAction(<%= command %>)"></div></td>
        <% 
        	if (command == 500) {  	
        		if (supervisor.equals("YES")) { 
        %>
        		<td><div align="center"><input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onClick="checkClose()"></div></td>
        <%	
        		} else { 
        %>
        		<td><div align="center"><input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onClick="goAction(1)"></div></td>
        <%	
        		}  
        	} 
        %>	
        <td><div align="center"><input id="EIBSBTN" type=button name="Submit" value="Imprimir"  OnClick="PrintPreview();"></div></td>
    </tr>
</table>
<%
} else {
%>
<table class="tbenter" width=100% align=center>
	<tr> 
    	<td><div align="center"><input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction(400)"></div></td>
	    <% 	if (supervisor.equals("YES")) {%>
        		<td><div align="center"><input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onClick="checkClose()"></div></td>
        <%	} else { %>
        		<td><div align="center"><input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onClick="goAction(1)"></div></td>
        <%	} %>
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
