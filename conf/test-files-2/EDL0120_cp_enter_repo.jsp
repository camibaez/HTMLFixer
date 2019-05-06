<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Inquiry of Commercial Paper</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">

function CheckACC(){
if(document.forms[0].E01DLSACC.value.length < 1){
alert("A valid number must be entered");
document.forms[0].E01DLSACC.value='';
document.forms[0].E01DLSACC.focus();
}
else {
  document.forms[0].submit();
}
}

</SCRIPT>

</head>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<jsp:useBean id= "cdMant" class= "datapro.eibs.beans.EDL0120DSMessage"  scope="session" />

<body bgcolor="#FFFFFF">

<h3 align="center">Comercial Paper Re-Purchase<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cp_enter_repo, EDL0120"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0120">
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="750">
  </p>

  <table class="tbenter" height="75%" width="100%" border="0">
    <tr>
          <td nowrap align="center">
              Account Number :
              <INPUT type="text" name="E01DLSACC" size="12" maxlength="9" onkeypress="enterInteger()" value="<%= cdMant.getE01DLSACC() %>">
              <a href="javascript:GetAccount('E01DLSACC','','13','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
		<p align="center">
		</p>
		 <br>
  <div align="center">
	   <input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="CheckACC()">
  </div>
            </td>
          </tr>
        </table>

  </form>
<script language="JavaScript">
document.forms[0].E01DLSACC.focus();
document.forms[0].E01DLSACC.select();
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
</body>
</html>
