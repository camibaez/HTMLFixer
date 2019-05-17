<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Clearing House EOD</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">

function CheckUser(){
	var usr = document.forms[0].USER.value.toUpperCase();
	var usr1 = document.forms[0].E01USER.value.toUpperCase();
	if ((usr != usr1) || (document.forms[0].E01USER.value.length < 1)) {
	  alert("A valid user must be entered");
	  document.forms[0].E01USER.value='';
	  document.forms[0].E01USER.focus();
	}
	else {
	  document.forms[0].submit();
	  }
}

</SCRIPT>
</head>


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body bgcolor="#FFFFFF">

<H3 align="center">Clearing House EOD<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="enter_user, EDD0924"></H3>

<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.approval.JSEDD0924">
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="12">
    <INPUT TYPE=HIDDEN NAME="opt" VALUE="CH">
    <INPUT TYPE=HIDDEN NAME="USER" VALUE="<%=currUser.getH01USR()%>">
  </p>

  <table class="tbenter" HEIGHT="75%" width="100%" border="0">
    <tr> 
      <td nowrap ALIGN=CENTER> 
        Are you sure to process this task?
        <br>
  
      </td>
    </tr>  
    <tr> 
      <td nowrap ALIGN=CENTER> 
        User : 
        <INPUT type="text" name="E01USER" size="12" maxlength="10" >
        <br>
 <div align="center"> 
	   <input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="CheckUser()">
  </div>     
      </td>
    </tr>
  </table>
  
<script language="JavaScript">
  document.forms[0].E01USER.focus();
  document.forms[0].E01USER.select();
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
