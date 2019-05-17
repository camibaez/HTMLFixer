<html>
<head>
<title>Safe Deposit Locations Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import ="datapro.eibs.master.Util" %>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "msgPart" 	class= "datapro.eibs.beans.ESB003001Message"  	scope="session" />
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

<H3 align="center">Safe Deposit Box Locations Maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="safe_deposit_locations_maint, ESB0030"></H3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.safedeposit.JSESB0030">
 
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="500">

<CENTER>
<TABLE class="tableinfo">
	<TBODY>
		<TR>
			<TD>
			<TABLE cellspacing="0" cellpadding="2" width="100%" border="0">
				<TBODY>
					<TR id="trdark">
						<TD nowrap width="40%">
						<DIV align="right">Type :</DIV>
						</TD>
						<TD nowrap width="60%"><INPUT type="text" name="E01LOCLOC"
							size="4" maxlength="3" value="<%= msgPart.getE01LOCLOC() %>"
							readonly></TD>
					</TR>
					<TR id="trclear">
						<TD>
						<DIV align="right">Name :</DIV>
						</TD>
						<TD nowrap><INPUT type="text" name="E01LOCNME" size="22"
							maxlength="20" value="<%= msgPart.getE01LOCNME() %>"></TD>
					</TR>
				</TBODY>
			</TABLE>
			</TD>
		</TR>
	</TBODY>
</TABLE>
</CENTER>
<br>
  
  <p align="center"> 
    <input id="ESBSBTN" type="submit" name="Submit" value="Submit">
  </p>
</form>
</body>
</html>
