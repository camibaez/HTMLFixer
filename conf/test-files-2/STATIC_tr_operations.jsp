<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>Payment Via</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script language="javascript">
//<!-- Hide from old browsers
function a(code) {
var formLength= top.opener.document.forms[0].elements.length;
for(n=0;n<formLength;n++)
{
	var elementName= top.opener.document.forms[0].elements[n].name;
	if(elementName == top.opener.fieldName) 
	{
  		top.opener.document.forms[0].elements[n].value = code;
  		break;
	}
 }
 top.close();
 }
//-->
</script>
</HEAD>
<BODY>
<h4>Bank Operations Code</h4>
<table align=center class=tableinfo style="width:95%">
  <TR id=trdark> 
    <TH align=left  > 
      <div align="left">Code</div>
    </TH>
    <TH align=left  > 
      <div align="left">Description</div>
    </TH>
  </TR>
  <tr> 
    <td width=30 > 
      <div align="center"><b>CRED</b></div>
    </td>
    <td ><a href="javascript:a('CRED')">This message contains a credit transfer where  there is no SWIFT Service Level involved.</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>CRTS</b></div>
    </td>
    <td ><a href="javascript:a('CRTS')">This message contains a credit transfer  for test purpose</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>SPAY</b></div>
    </td>
    <td ><a href="javascript:a('SPAY')">This message contains a credit transfer to be  processed according to the SWIFTPay Service Level</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>SPRI</b></div>
    </td>
    <td ><A HREF="javascript:a('SPRI')">This message contains a credit transfer to be  processed according to the Priority Service Level</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>SSTD</b></div>
    </td>
    <td ><A HREF="javascript:a('SSTD')">This message contains a credit transfer to be  processed according to the Standard Service Level</a></td>
  </tr>
  
</table>
</BODY>
</HTML>
