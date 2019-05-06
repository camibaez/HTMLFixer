<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>User Authorization Level</TITLE>
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

<h4> User Authorization Level</h4>
<table align=center class=tableinfo style="width:95%">
  <TR id=trdark> 
    <TH align=left  > 
      <div align="left"></div>
    </TH>
    <TH align=left  > 
      <div align="left">Description</div>
    </TH>
  </TR>
  <tr> 
    <td width=30  > 
      <div align="center"><b>A</b></div>
    </td>
    <td ><A HREF="javascript:a('A')">Administrator</a></td>
  </tr>
  <tr> 
    <td width=30  > 
      <div align="center"><b>B</b></div>
    </td>
    <td ><a href="javascript:a('B')">Supervisor/Operator</a></td>
  </tr>
  <tr> 
    <td width=30  > 
      <div align="center"><b>C</b></div>
    </td>
    <td ><a href="javascript:a('C')">Supervisor/Operator who may approve his own transactions</a></td>
  </tr>
  <tr> 
    <td width=30  > 
      <div align="center"><b>O</b></div>
    </td>
    <td ><a href="javascript:a('O')">Operator</a></td>
  </tr>
  <tr> 
    <td width=30  > 
      <div align="center"><b>S</b></div>
    </td>
    <td ><a href="javascript:a('S')">Supervisor</a></td>
  </tr>
  <tr> 
    <td width=30  > 
      <div align="center"><b>I</b></div>
    </td>
    <td ><a href="javascript:a('I')">Inquiries</a></td>
  </tr>
  <tr> 
    <td width=30  > 
      <div align="center"><b>Q</b></div>
    </td>
    <td ><a href="javascript:a('Q')">Inquiries/Restricted by Officer Code</a></td>
  </tr>
  
</table>
<P>
</P>
</BODY>
</HTML>
