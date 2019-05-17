<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Letter of Credit Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">

function CheckACC(){
if ( document.forms[0].E01LCMACC.value.length < 1) {
  alert("A valid account number must be entered");
  document.forms[0].E01LCMACC.value='';
  document.forms[0].E01LCMACC.focus();
} else {
  document.forms[0].submit();
  }
}

</SCRIPT>
</head>


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id="msgLC" class="datapro.eibs.beans.ELC050001Message"  scope="session" />

<body bgcolor="#FFFFFF">

<H3 align="center">Letters Of Credit Maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="lc_enter_maint, ELC0500"></H3>

<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0500">
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="3">
  </p>
<BR>
  <table class="tbenter" width="100%" border="0">

    <tr>
      <td nowrap ALIGN=CENTER>
        Letter of Credit Number :
        <INPUT type="text" name="E01LCMACC" size="12" maxlength="9" value="" onKeypress="enterInteger()">
        <a href="javascript:GetAccount('E01LCMACC','','40','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
			<br>
 <div align="center">
	   <input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="CheckACC()">
  </div>
      </td>
    </tr>
  </table>

<script language="JavaScript">
  document.forms[0].E01LCMACC.focus();
  document.forms[0].E01LCMACC.select();
</script>
<%
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT Language="Javascript">;
            showErrors();
     </SCRIPT>
  <%
 }
%>
</form>
</body>
</html>
