<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>Documents Type</TITLE>
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
<H4>Documents Type</H4>
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
    <td width=30> 
      <div align="center"><b>SC</b></div>
    </td>
    <td ><A HREF="javascript:a('SC')">Signature Card</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>W8</b></div>
    </td>
    <td ><A HREF="javascript:a('W8')">Format W8 (USA)</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>W9</b></div>
    </td>
    <td ><A HREF="javascript:a('W9')">Format W9 (USA)</a></td>
  </tr>
  <tr> 
    <td width=30> 
      <div align="center"><b>ID</b></div>
    </td>
    <td ><A HREF="javascript:a('ID')">Document Identific.</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>CO</b></div>
    </td>
    <td ><A HREF="javascript:a('CO')">Collaterals</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>BL</b></div>
    </td>
    <td ><A HREF="javascript:a('BL')">G/L Balances</a></td>
  </tr>
  <tr> 
    <td width=30> 
      <div align="center"><b>OT</b></div>
    </td>
    <td ><A HREF="javascript:a('OT')">Other Documents</a></td>
  </tr>
 
</table>
<br>
</BODY>
</HTML>
