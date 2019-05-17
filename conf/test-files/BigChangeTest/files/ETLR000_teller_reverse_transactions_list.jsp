<html>
<head>
<title>Teller Transaction</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ETLR00004Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "Login" class="java.lang.String"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<script language="JavaScript">

function goAction(op) {
    if (document.getElementById(op).value == "D") {
    	alert("Transaction Reversed, please try again.");
    } else {
		document.forms[0].idxrow.value = op;
		document.forms[0].submit();
	}
}

</SCRIPT> 

<%@ page import = "datapro.eibs.master.Util" %>

</head>

<BODY>

<h3 align="center">TELLER TRANSACTIONS<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="teller_reverse_transactions_list.jsp, ETLR000"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.teller.JSETLR000" >
    <input type=HIDDEN name="idxrow">
<% 
   String scr = "";
   if (Login.equals("REVERSE")) {
        scr = "1100";
   } else {
   		scr = "1900";
   }
%>
	<input type=HIDDEN name="SCREEN" value="<%= scr %>">


<%
	if ( ETLR00004Help.getNoResult() ) {
%>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>There is no match for your search criteria</b></p><p>&nbsp;</p>
        </div>
	  </TD>
	</TR>
  </TABLE>
	<%} else {
		if ( !error.getERRNUM().equals("0")  ) {
     		error.setERRNUM("0");
     		out.println("<SCRIPT Language=\"Javascript\">");
	     	out.println("       showErrors()");
     		out.println("</SCRIPT>");
     	}
	%> 

<TABLE class="tbenter" width="50%" >
	<TR>
    	<TD > 
        	<div align="center"><b>Select Transaction Sequence</b></div>
	  	</TD>
	</TR>
</TABLE>

<br>

<table id=cfTable class="tableinfo">
	<tr> 
      	<td NOWRAP valign="top">
	        <table id="headTable" width="100%">
	          <tr id="trdark"> 
		        <th align=center nowrap width="5%"></th>
	            <th align=center nowrap width="6%">Code</th>
	            <th align=center nowrap width="20%">Description</th>
	            <th align=center nowrap width="6%">Sequence</th>
	            <th align=center nowrap width="15%">Account</th>
	            <th align=center nowrap width="15%">Amount</th>
	            <th align=center nowrap width="9%">Date</th>
	            <th align=center nowrap width="9%">Time</th>
	            <th align=center nowrap width="15%">Status</th>
	          </tr>
	          <%
	          ETLR00004Help.initRow();
	          boolean firstTime = true;
	          String chk = "";
	          while (ETLR00004Help.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
	                datapro.eibs.beans.ETLR00004Message msgList = (datapro.eibs.beans.ETLR00004Message) ETLR00004Help.getRecord();
			 %>
			          <tr> 
			            <td NOWRAP align="center" width="5%"> 
			              <input type="radio" name="CURRCODE" value="<%= ETLR00004Help.getCurrentRow() %>" <%= chk %> onclick="goAction(<%= ETLR00004Help.getCurrentRow() %>)">
			            </td>
			            <td NOWRAP  align="center" width="6%"><%= msgList.getE04TCD() %></td>
			            <td NOWRAP  align="left" width="20%"><%= msgList.getE04TRDDSC() %></td>
			            <td NOWRAP  align="center" width="6%"><%= msgList.getE04SQN() %></td>
			            <td NOWRAP  align="right" width="15%"><%= msgList.getE04ACC() %></td>
			            <td NOWRAP  align="right" width="15%"><%= msgList.getE04AMT() %></td>
			            <td NOWRAP  align="center" width="9%"><%= Util.formatDate(msgList.getE04MTH(), msgList.getE04DAY(), msgList.getE04YER())%></td>
			            <td NOWRAP  align="center" width="9%"><%= Util.formatTime(msgList.getE04TME()) %></td>
			            <%
			            	String Status = "";
							if (Login.equals("REVERSE")) { Status = "PROCESS"; }	
			            	if (msgList.getE04STA().equals("D") && Login.equals("REVERSE")) { Status = "REVERSED"; }
			            	if (msgList.getE04STA().equals("R") && Login.equals("OVERRIDE")) { Status = "REJECTED"; }
			            %>
			            <td NOWRAP  align="left" width="15%"><%= Status %></td>
			          </tr>
		              <input type=HIDDEN name="sts_<%= ETLR00004Help.getCurrentRow()%>" id = "<%= ETLR00004Help.getCurrentRow()%>" value = "<%= msgList.getE04STA()%>">
	          <%
	           }
	          %>
	        </table>
		</td>
	</tr>	
</table>
<%}%>

</form>
</body>
</html>
