<html>
<head>
<title>Teller Transaction</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ETLR00003Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "Login" class="java.lang.String"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<script language="JavaScript">

function goAction(op) {
    if (document.getElementById(op).value == "P") {
    	alert("Transaction Pending, please try again.");
    } else {
        if (op < 0) op = 0;
		document.forms[0].idxrow.value = op;
		document.forms[0].submit();
	}
}

</SCRIPT> 

<%@ page import = "datapro.eibs.master.Util" %>

</head>

<BODY>

<h3 align="center">TELLER TRANSACTIONS<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="teller_override_transactions_list.jsp, ETLR000"></h3>
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
	if ( ETLR00003Help.getNoResult() ) {
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
	          ETLR00003Help.initRow();
	          boolean firstTime = true;
	          String chk = "";
	          while (ETLR00003Help.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
	                datapro.eibs.beans.ETLR00003Message msgList = (datapro.eibs.beans.ETLR00003Message) ETLR00003Help.getRecord();
			 %>
			          <tr> 
			            <td NOWRAP align="center" width="5%"> 
			              <input type="radio" name="CURRCODE" value="<%= ETLR00003Help.getCurrentRow() %>" <%= chk %> onclick="goAction(<%= ETLR00003Help.getCurrentRow() %>)">
			            </td>
			            <td NOWRAP  align="center" width="6%"><%= msgList.getE03TCD() %></td>
			            <td NOWRAP  align="left" width="20%"><%= msgList.getE03TRDDSC() %></td>
			            <td NOWRAP  align="center" width="6%"><%= msgList.getE03SQN() %></td>
			            <td NOWRAP  align="right" width="15%"><%= msgList.getE03ACC() %></td>
			            <td NOWRAP  align="right" width="15%"><%= msgList.getE03AMT() %></td>
			            <td NOWRAP  align="center" width="9%"><%= Util.formatDate(msgList.getE03MTH(), msgList.getE03DAY(), msgList.getE03YER())%></td>
			            <td NOWRAP  align="center" width="9%"><%= Util.formatTime(msgList.getE03TME()) %></td>
			            <%
			            	String Status = "";
							if (Login.equals("OVERRIDE")) { Status = "PENDING"; } 
			            	if (msgList.getE03STA().equals("A") && Login.equals("OVERRIDE")) { Status = "APPROVED"; }
			            	if (msgList.getE03STA().equals("R") && Login.equals("OVERRIDE")) { Status = "REJECTED"; }
			            %>
			            <td NOWRAP  align="left" width="15%"><%= Status %></td>
			          </tr>
		              <input type=HIDDEN name="sts_<%= ETLR00003Help.getCurrentRow()%>" id = "<%= ETLR00003Help.getCurrentRow()%>" value = "<%= msgList.getE03STA()%>">
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
