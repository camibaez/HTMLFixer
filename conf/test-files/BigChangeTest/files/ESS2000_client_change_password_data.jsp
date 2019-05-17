<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Corporate User</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="cusdata" class="datapro.eibs.beans.ESS200001Message" scope="session" />

</head>

<body>

 <h3 align="center">Internet Banking Change Password<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="client_change_password_data, ESS2000"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/com.datapro.eibs.internet.JSESS2000" onsubmit="return FieldNotBlank(this)">
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="401">
    <INPUT TYPE=HIDDEN NAME="TYPE" VALUE="1">
  </p>
  <h4 align="center">Internet Banking Change Password</h4>
  <p>&nbsp; </p>
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap align="right" valign="middle" width="49%">User ID :</td>
            <td nowrap align="left" valign="middle"  width="51%"><INPUT type="text" name="CUSID" READONLY value="<%= cusdata.getE01EUSUSR().trim()%>" maxlength="10" size="10"></td>
          </tr>
          <tr id="teclear"> 
            <td nowrap align="right" valign="middle" width="49%">New Password :</td>
            <td nowrap align="left" valign="middle"  width="51%"><INPUT type="password" ID="MANDATORY" name="CUSPASS" value="" maxlength="10" size="10"><img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  ></td> 
          </tr>
          <tr id="trdark"> 
            <td nowrap align="right" valign="middle" width="49%">Confirm Password :</td>
            <td nowrap align="left" valign="middle"  width="51%"><INPUT type="password" ID="MANDATORY" name="CUSCONFPASS" value="" maxlength="10" size="10"><img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  ></td> 
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p align="center"> 
   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </p>
<script language="JavaScript">
  document.forms[0].CUSPASS.focus();
  document.forms[0].CUSPASS.select();
</script>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT Language="Javascript">
            showErrors();
     </SCRIPT>
 <%
 }
%>
</form>
</body>
</html>
