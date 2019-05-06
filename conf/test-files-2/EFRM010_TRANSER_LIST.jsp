<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EFRM01001Message"%>
<%@page import="com.datapro.constants.EibsFields"%>

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
<title>Reports of Foreign Transaction Excess $5000</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="list" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </script>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

  function goAction(op,row) {
	  if(isNaN(row) && typeof(row) != "undefined"){
	    getElement("ALL").value= 'YES';
	  }else{
		clickElement("key", row);
	  }	
	  getElement("SCREEN").value = op;
	  document.forms[0].submit();		
}

</SCRIPT>  

</head>

<body>
<% 

 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center">Reports of Foreign Transaction Excess $5000 <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="TRANSFER_LIST.jsp,EFRM010"></h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.reports.JSEFRM010">
<input type="hidden" id="SCREEN" name="SCREEN" value="500"> 
<input type="hidden" id="ALL" name="ALL" value=""> 
  
<table class="tbenter" width="100%" height="10%">
	<tr>
		<% 	if (!list.getNoResult()){ %>
		<td align="center" class="tdbkg" width="20%">
			<a href="javascript:goAction('500')"> <b>Show Single PDF</b> </a></td>
		<td align="center" class="tdbkg" width="20%">
			<a href="javascript:goAction('500','Y')"> <b>Show All PDFS</b> </a></td>
		<% } %>
		<td align="center" class="tdbkg" width="20%">
			<a href="javascript:goAction('100')"> <b>New Date Range</b> </a></td>
		<td align="center" class="tdbkg" width="20%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a>
		</td>
	</tr>
</table>

<%
	if (list.getNoResult()) {
%>
<table class="tbenter" width=100% height=80%>
	<tr>
		<td>
		<div align="center">
			<font size="3">
				<b> There are no results that match your search criteria. </b>
			</font>
		</div>
		</td>
	</tr>
</table>
<%
	} else {
%>

  <TABLE  id="mainTable" class="tableinfo" style="height:400px;">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="100%">
			<tr id="trdark">
				<th align="center" nowrap width="5%">&nbsp;</th>
				<th align="center" nowrap width="20%">Customer</th>
				<th align="center" nowrap width="20%">Type of Account</th>
				<th align="center" nowrap width="20%">Toal Amount</th>
				<th align="center" nowrap width="20%">Date of Transaction</th>
				<th align="center" nowrap width="15%"></th>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
			<%
				String arguments = "";
			    StringBuilder sb = new StringBuilder();	
				boolean firstTime = true;
				String chk = "";
				list.initRow();
				while (list.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
					EFRM01001Message msg = (EFRM01001Message) list.getRecord();
			        sb.append("'").append("500").append("',"); //Screen Value to ShowPDF
			        sb.append("'").append(list.getCurrentRow()).append("'");		
			        arguments = sb.toString();		
			%>
			<tr id="dataTable<%=list.getCurrentRow()%>">
			<td nowrap align="center" width="5%">
				<input type="radio" id="key" name="key" value="<%=list.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= list.getCurrentRow() %>)"/>
			</td>
	    	<td nowrap align="center" width="20%">
				<a href="javascript:goAction(<%= arguments%>)">
					<%= Util.formatCell(msg.getE01CUENTA())%>
				</a>
			</td>
	    	<td nowrap align="center" width="20%">
				<a href="javascript:goAction(<%= arguments%>)">
					<%= Util.formatCell(msg.getE01TIPCTA().equals("S") ? "Savings Account" : ( msg.getE01TIPCTA().equals("D") ? "Checking Account" : ""))%>
				</a>
			</td>
	    	<td nowrap align="right" width="20%">
				<a href="javascript:goAction(<%= arguments%>)">
					<%= Util.formatCCY(msg.getE01TOTAM())%>
				</a>
			</td>
	    	<td nowrap align="center" width="20%">
				<a href="javascript:goAction(<%= arguments%>)">
					<%= Util.formatCell(msg.getE01TRSDAT())%>
				</a>
			</td>
			<td align="center" nowrap width="15%"></td>
			
		</tr>
		<% 
		 sb.setLength(0); // set length of buffer to 0
		 sb.trimToSize(); // trim the underlying buffer
			}
		%> 
	   </table>
	 </div>
   </td>
   </tr>
</table>
<%
	}
%>
</form>
<SCRIPT language="JavaScript">
	showChecked("key");
</SCRIPT>
</body>
</html>

