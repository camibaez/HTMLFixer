<html>
<head>
<title>Teller Transaction</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ETLR00001Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

function goAction(op) {
	document.forms[0].idxrow.value = op;
	document.forms[0].submit();
}

</SCRIPT> 

</head>

<BODY>

<h3 align="center">TELLER TRANSACTIONS<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="teller_transactions_main.jsp, ETLR000"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.teller.JSETLR000" >
	<input type=HIDDEN name="SCREEN" value="200">
    <input type=HIDDEN name="idxrow">
<%
	if ( ETLR00001Help.getNoResult() ) {
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
        	<div align="center"><b>Select Transaction Code</b></div>
	  	</TD>
	</TR>
</TABLE>

<br>

<table id=cfTable class="tableinfo">
	<tr> 
      	<td NOWRAP valign="top" width="25%">
	        <table id="headTable" width="100%">
	          <tr id="trdark"> 
	            <th align=left nowrap colspan="3">&nbsp;Deposit</th>
	          </tr>
	          <%
	          ETLR00001Help.initRow();
	          while (ETLR00001Help.getNextRow()) {
	                datapro.eibs.beans.ETLR00001Message msgList = (datapro.eibs.beans.ETLR00001Message) ETLR00001Help.getRecord();
	          		if (msgList.getETLRTYP().equals("DP")) {
			 %>
			          <tr> 
			            <td NOWRAP align=CENTER width="10%"> 
			              <input type="radio" name="CURRCODE" value="<%= ETLR00001Help.getCurrentRow() %>" onclick="goAction(<%= ETLR00001Help.getCurrentRow() %>)">
			            </td>
			            <td NOWRAP  align=CENTER width="10%"><%= msgList.getETLRTCD() %></td>
			            <td NOWRAP  align="left" width="80%"><%= msgList.getETLRITD() %></td>
			          </tr>
	          <%
		           }
	           }
	          %>
	        </table>
		</td>
      	<td NOWRAP valign="top" width="25%">
	        <table id="headTable" width="100%">
	          <tr id="trdark"> 
	            <th align=left nowrap colspan="3">&nbsp;Withdrawal</th>
	          </tr>
	          <%
	          ETLR00001Help.initRow();
	          while (ETLR00001Help.getNextRow()) {
	                datapro.eibs.beans.ETLR00001Message msgList = (datapro.eibs.beans.ETLR00001Message) ETLR00001Help.getRecord();
	          		if (msgList.getETLRTYP().equals("WH")) {
			 %>
			          <tr> 
			            <td NOWRAP align=CENTER width="10%"> 
			              <input type="radio" name="CURRCODE" value="<%= ETLR00001Help.getCurrentRow() %>" onclick="goAction(<%= ETLR00001Help.getCurrentRow() %>)">
			            </td>
			            <td NOWRAP  align=CENTER width="10%"><%= msgList.getETLRTCD() %></td>
			            <td NOWRAP  align="left" width="80%"><%= msgList.getETLRITD() %></td>
			          </tr>
	          <%
		           }
	           }
	          %>
	        </table>
		</td>
      	<td NOWRAP valign="top" width="25%">
	        <table id="headTable" width="100%">
	          <tr id="trdark"> 
	            <th align=left nowrap colspan="3">&nbsp;Official Check</th>
	          </tr>
	          <%
	          ETLR00001Help.initRow();
	          while (ETLR00001Help.getNextRow()) {
	                datapro.eibs.beans.ETLR00001Message msgList = (datapro.eibs.beans.ETLR00001Message) ETLR00001Help.getRecord();
	          		if (msgList.getETLRTYP().equals("OF")) {
			 %>
			          <tr> 
			            <td NOWRAP align=CENTER width="10%"> 
			              <input type="radio" name="CURRCODE" value="<%= ETLR00001Help.getCurrentRow() %>" onclick="goAction(<%= ETLR00001Help.getCurrentRow() %>)">
			            </td>
			            <td NOWRAP  align=CENTER width="10%"><%= msgList.getETLRTCD() %></td>
			            <td NOWRAP  align="left" width="80%"><%= msgList.getETLRITD() %></td>
			          </tr>
	          <%
		           }
	           }
	          %>
	        </table>
		</td>
      	<td NOWRAP valign="top" width="25%">
	        <table id="headTable" width="100%">
	          <tr id="trdark"> 
	            <th align=left nowrap colspan="3">&nbsp;Others</th>
	          </tr>
	          <%
	          ETLR00001Help.initRow();
	          while (ETLR00001Help.getNextRow()) {
	                datapro.eibs.beans.ETLR00001Message msgList = (datapro.eibs.beans.ETLR00001Message) ETLR00001Help.getRecord();
	          		if (!msgList.getETLRTYP().equals("OF") && !msgList.getETLRTYP().equals("WH") && !msgList.getETLRTYP().equals("DP")) {
			 %>
			          <tr> 
			            <td NOWRAP align=CENTER width="10%"> 
			              <input type="radio" name="CURRCODE" value="<%= ETLR00001Help.getCurrentRow() %>" onclick="goAction(<%= ETLR00001Help.getCurrentRow() %>)">
			            </td>
			            <td NOWRAP  align=CENTER width="10%"><%= msgList.getETLRTCD() %></td>
			            <td NOWRAP  align="left" width="80%"><%= msgList.getETLRITD() %></td>
			          </tr>
	          <%
		           }
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
