<html>
<head>
<title>IRA Activity Corrections</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import ="datapro.eibs.master.Util" %>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id= "msgPart" 	class= "datapro.eibs.beans.EIRA01001Message"  	scope="session" />
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
<SCRIPT Language="Javascript">
    builtNewMenu(cd_m_opt);
    initMenu();
</SCRIPT>
</head>
<body>

<H3 align="center">IRA Activity Corrections Enter<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="ira_activity_corrections_enter, EIRA010"></H3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEIRA010">
 
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="11">
  
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
        <INPUT type="text" name="D01DEACUN" size="10" maxlength="10"
			value="<%= userPO.getHeader1() %>" readonly><INPUT type="text"
			name="D01CUSNA1" size="45" maxlength="45"
			value="<%= userPO.getHeader2() %>" readonly></div>

				
				</TD>
</TR>
   	<TR>
      <TD nowrap>
		<div align="right">Account :</div>
		</TD>
      <TD nowrap width="60">
        <div align="left"> 
        <INPUT type="text" name="E01IRDACC" size="10" maxlength="10"
			value="<%= userPO.getHeader3() %>" readonly></div>

				
				</TD>
   	</TR>
   	<TR>
   		<TD nowrap height="10"></TD>
   		<TD nowrapwidth="60%"></TD>
   	</TR>	
   	<TR>
		<TD nowrap>
				<DIV align="right">TAX Year :</DIV>
		</TD>
	      <td nowrap width="60%"> 
                <select name="E01IRDTXY" >
                  <option value="C">Current Year</option>
                  <option value="P">Prior Year</option>
                </select>
	      </td>
   	</TR>
  </table>
  </TD>
  </TR>
  </table>
  <p align="center"> 
    <input id="EIBSBTN" type="submit" name="Submit" value="Submit">
  </p>
</form>
</body>
</html>
