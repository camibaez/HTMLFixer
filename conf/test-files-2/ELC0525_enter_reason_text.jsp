<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<TITLE>Rejected Reason</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script language="javascript">
//<!-- Hide from old browsers

function enter() {
}

function ok() {
	top.opener.document.forms[0][top.opener.reason].value = document.forms[0].txtReason.value;
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
<P align="center">
<a href="javascript:ok()"><b> Close </b></a>
</P>
</FORM>
</BODY>
</HTML>
