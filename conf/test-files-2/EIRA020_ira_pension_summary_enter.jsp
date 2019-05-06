<html>
<head>
<title>IRA Pension Summary Enter</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import ="datapro.eibs.master.Util" %>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" 	class= "datapro.eibs.beans.ELEERRMessage"  		scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos"  			scope="session"/>

<% 
if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
%>
<SCRIPT Language="Javascript">
        showErrors();
</SCRIPT>
<%}%>

</head>
<body>

<H3 align="center">IRA Pension Summary Enter<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="ira_pension_summary_enter, EIRA020"></H3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEIRA020">
 
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="11111">
  
  <table class="tableinfo" width="100%">
  <TR> 
    <TD NOWRAP valign=top>
  	 <TABLE id="dataTable" width="100%">
   	<TR>
      <TD nowrap width="20%"> 
        <div align="right"> 
        Customer :</div>
      </TD>
      <TD nowrap width="60%">
        <div align="left"> 
        <INPUT type="text" name="E02IRACUN" size="10" maxlength="10"
			value="<%= userPO.getHeader1() %>" readonly>
		<INPUT type="text"	name="D02CUSNA1" size="45" maxlength="45"
			value="<%= userPO.getHeader2() %>" readonly></div>
	</TD>
</TR>
   	<TR>
   		<TD nowrap height="10"></TD>
   		<TD nowrapwidth="60%"></TD>
   	</TR>	
   	<TR>
		<TD nowrap>
				<DIV align="right"> Year :</DIV>
		</TD>
      <TD nowrap width="60%">
        <div align="left"> 
        <INPUT type="text" name="E02IRAYEA" size="4" maxlength="4"></div>
	</TD>
   	</TR>
  </table>
  <p align="center"> 
    <input id="EIBSBTN" type="submit" name="Submit" value="Submit">
  </p>
</form>
</body>
</html>
