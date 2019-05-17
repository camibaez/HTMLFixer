<html>
<head>
<title>Teller Transaction</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ETLR00004Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

function goAction(op) {
    if (op < 0) op = 0;
	document.forms[0].idxrow.value = op;
	document.forms[0].submit();
}

</SCRIPT> 

<%@ page import = "datapro.eibs.master.Util" %>

</head>

<BODY>

<h3 align="center">TELLER TRANSACTIONS<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="teller_reverse_list.jsp, ETLR000"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.teller.JSETLR000" >
	<input type=HIDDEN name="SCREEN" value="1100">
    <input type=HIDDEN name="idxrow">
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

<TABLE  id="mainTable" class="tableinfo" style="width: 90%; height: 80%;" align="center">
 	<TR height="5%"> 
   		<TD NOWRAP valign="top" width="80%"> 
	        <table id="headTable" width="100%">
	          <tr id="trdark"> 
		        <th align=center nowrap width="5%"></th>
	            <th align=center nowrap width="5%">Code</th>
	            <th align=center nowrap width="10%">Currency</th>
	            <th align=center nowrap width="20%">Description</th>
	            <th align=center nowrap width="10%">Sequence</th>
	            <th align=center nowrap width="10%">Account</th>
	            <th align=center nowrap width="10%">Amount</th>
	            <th align=center nowrap width="10%">Date</th>
	            <th align=center nowrap width="10%">Time</th>
	            <th align=center nowrap width="10%">Status</th>
	          </tr>
 				</table>
		</TD>
	</TR>
  	<TR height="95%"> 
    	<TD NOWRAP valign="top" width="80%">
		  	<div id="dataDiv1" style="height:400px; overflow:auto;"> 
				<table id=dataTable cellspacing="0" cellpadding="0" border="0" width="100%" >
	          <%
	          ETLR00004Help.initRow();
	          while (ETLR00004Help.getNextRow()) {
	                datapro.eibs.beans.ETLR00004Message msgList = (datapro.eibs.beans.ETLR00004Message) ETLR00004Help.getRecord();
			 %>
			          <tr> 
			            <td NOWRAP align="center" width="5%"> 
			              <input type="radio" name="CURRCODE" value="<%= ETLR00004Help.getCurrentRow() %>" onclick="goAction(<%= ETLR00004Help.getCurrentRow() %>)">
			            </td>
			            <td NOWRAP  align="center" width="5%"><%= msgList.getE04TCD() %></td>
			            <td NOWRAP  align="center" width="10%"><%= msgList.getE04CCY() %></td>
			            <td NOWRAP  align="left" width="20%"><%= msgList.getE04TRDDSC() %></td>
			            <td NOWRAP  align="center" width="10%"><%= msgList.getE04SQN() %></td>
			            <td NOWRAP  align="center" width="10%"><%= msgList.getE04ACC() %></td>
			            <td NOWRAP  align="right" width="10%"><%= msgList.getE04AMT() %></td>
			            <td NOWRAP  align="center" width="10%"><%= Util.formatDate(msgList.getE04MTH(), msgList.getE04DAY(), msgList.getE04YER())%></td>
			            <td NOWRAP  align="center" width="10%"><%= Util.formatTime(msgList.getE04TME()) %></td>
			            <%
			            	String Status = "ACCOUNTED";
			            	if (msgList.getE04STA().equals("D")) { Status = "REVERSED"; }
			            %>
			            <td NOWRAP align="center" align="left" width="10%"><%= Status %></td>
			          </tr>
	          <%
	           }
	          %>
	        </table>
	    </div>    
		</td>
	</tr>	
</table>
<%}%>

</form>
</body>
</html>
