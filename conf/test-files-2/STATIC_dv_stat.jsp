<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>Document Inquiry</TITLE>
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

<h4> Document Status</h4>
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
      <div align="center"></div>
    </td>
    <td ><a href="javascript:a(' ')">Issued not Available</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>D</b></div>
    </td>
    <td ><a href="javascript:a('D')">Available</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>P</b></div>
    </td>
    <td ><A HREF="javascript:a('P')"> Paid</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>C</b></div>
    </td>
    <td ><a href="javascript:a('C')">Cancelled</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>S</b></div>
    </td>
    <td ><a href="javascript:a('S')">Suspended</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>E</b></div>
    </td>
    <td ><a href="javascript:a('E')">Release to the Customer</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>R</b></div>
    </td>
    <td ><a href="javascript:a('R')">Certification Reversed</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>T</b></div>
    </td>
    <td ><A HREF="javascript:a('T')">All Status</a></td>
  </tr>
</table>
<P>
</P>
</BODY>
</HTML>
