<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>Message</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script language="javascript">
//<!-- Hide from old browsers
function ok() {
  	top.opener.message = document.forms[0].txtMessage.value;
  	top.opener.sendMsg();
	top.close();
 }
//-->
</script>
</HEAD>
<BODY>
<FORM  action="javascript:ok()">
<table align=center width="100%" id="tbhelp">
  <TR> 
    <TH> 
      <div align="left">Enter Text :
        <hr>
      </div>
    </TH>
  </TR>
  <TR> 
    <TD align="center">
		<textarea cols="50" rows="20" name="txtMessage"></textarea>
    </TD>
  </TR>
</table>
  
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="33%"> 
        <div align="center"> 
          <input id="EIBSBTN" type=button name="Submit" value="Close" onclick="ok()">
        </div>
      </td>
    </tr>
  </table>
  <p align="center">&nbsp; </p>
<script language="JavaScript">
  document.forms[0].txtMessage.focus();
  document.forms[0].txtMessage.select();
</script>
</FORM>
</BODY>
</HTML>
