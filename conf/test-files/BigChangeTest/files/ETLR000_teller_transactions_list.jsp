<html>
<head>
<title>Teller Transaction</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ETLR00003Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript" >

function goAction(op) {
    if (op < 0) op = 0;
	document.forms[0].idxrow.value = op;
	document.forms[0].submit();
}

</SCRIPT> 

<%@ page import = "datapro.eibs.master.Util" %>

</head>

<BODY>

<h3 align="center">TELLER TRANSACTIONS<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="teller_transactions_list.jsp, ETLR000"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.teller.JSETLR000" >
    <input type=HIDDEN name="idxrow">
<% 
	String Login = userPO.getPurpose(); 	
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
	            <th align=center nowrap width="5%">Code</th>
	            <th align=center nowrap width="5%">Currency</th>
	            <th align=center nowrap width="20%">Description</th>
	            <th align=center nowrap width="5%">Sequence</th>
	            <th align=center nowrap width="10%">Account</th>
	            <th align=center nowrap width="10%">Amount</th>
	            <th align=center nowrap width="10%">Date</th>
	            <th align=center nowrap width="10%">Time</th>
	            <th align=center nowrap width="10%">Status</th>
	            <th align=center nowrap width="10%">Supervisor</th>
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
			              <input type="radio" name="CURRCODE" value="<%= ETLR00003Help.getCurrentRow() %>" onclick="goAction(<%= ETLR00003Help.getCurrentRow() %>)">
			            </td>
			            <td NOWRAP  align="center" width="5%"><%= msgList.getE03TCD() %></td>
			            <td NOWRAP  align="center" width="5%"><%= msgList.getE03CCY() %></td>
			            <td NOWRAP  align="left" width="20%"><%= msgList.getE03TRDDSC().trim() %></td>
			            <td NOWRAP  align="center" width="5%"><%= msgList.getE03SQN() %></td>
			            <td NOWRAP  align="center" width="10%"><%= msgList.getE03ACC().trim() %></td>
			            <td NOWRAP  align="right" width="10%"><%= msgList.getE03AMT().trim() %></td>
			            <td NOWRAP  align="center" width="10%"><%= Util.formatDate(msgList.getE03MTH(), msgList.getE03DAY(), msgList.getE03YER())%></td>
			            <td NOWRAP  align="center" width="10%"><%= Util.formatTime(msgList.getE03TME()) %></td>
			            <%
			            	String Status = "UNDEFINED";
							if (msgList.getE03STA().equals("A")) { 
								Status = "APPROVED"; 
							} else if (msgList.getE03STA().equals("P")) { 
								Status = "PENDING"; 
							} else if (msgList.getE03STA().equals("R")) { 
								Status = "REJECTED"; 
							}
			            %>
			            <td NOWRAP  align="center" width="10"><%= Status %></td>
			            <td NOWRAP  align="center" width="10%"><%= msgList.getE03SUP().trim() %></td>
			          </tr>
	          <%
	           }
	          %>
	        </table>
		</td>
	</tr>	
</table>
<%}%>
<br><br>

</form>
</body>
</html>
