<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>Rejection Reason</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script language="javascript">
//<!-- Hide from old browsers
function ok() {
  	top.opener.document.forms[0].reason.value = document.forms[0].txtReason.value;
  	top.opener.goAction(top.opener.option);
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
      <div align="left">Enter Reason :
        <hr>
      </div>
    </TH>
  </TR>
  <TR> 
    <TD align="center">
		<textarea cols="50" rows="20" name="txtReason"></textarea>
    </TD>
  </TR>
</table>
 <br>
  <div align="center"> 
	   <input id="EIBSBTN" type=button name="Submit" value="Submit" onclick="ok()">
  </div>


</FORM>
</BODY>
</HTML>
