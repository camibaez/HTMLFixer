<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>IOTA Relationship Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" 	class= "datapro.eibs.beans.ELEERRMessage"  		scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos" 			scope="session" />
<jsp:useBean id= "account" 	class= "datapro.eibs.beans.EDD057501Message"  	scope="session" />

<SCRIPT Language="javascript">
function CheckACC(){
	if(document.forms[0].E01FRMACC.value.length < 1){
		alert("A valid account number must be entered");
		document.forms[0].E01FRMACC.value='';
		document.forms[0].E01FRMACC.focus();
	} else {
  		document.forms[0].submit();
	}
}
</SCRIPT>

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

<h3 align="center">IOTA Relationship Maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="EDD0575_iota_enter.jsp"></h3>
<hr size="4">

<form method="post"  action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0575">
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="100">
    <INPUT TYPE=HIDDEN NAME="Type" VALUE="<%= userPO.getType()%>">

  <table  class="tbenter" width="100%" border="0" cellspacing=0 cellpadding=2>
	<tr>
    	<td align="right">
            From Account :
        </td>
    	<td align="left">
            <input type="text" name="E01FRMACC" size="18" maxlength="16" onkeypress="enterInteger()" value="<%= account.getE01FRMACC()%>">
        	<a href="javascript:GetAccount('E01FRMACC','','RT','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
    	</td>
    </tr>
	<tr>
    	<td align="center" colspan="2">
			<input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="CheckACC()">
    	</td>
    </tr>
   </table>

<script language="JavaScript">
  document.forms[0].E01FRMACC.focus();
  document.forms[0].E01FRMACC.select();
</script>

<%if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
%>
     <SCRIPT Language="Javascript">
            showErrors();
     </SCRIPT>
<%}%>
</form>
</body>
</html>
