<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>Interest Calculation Type</TITLE>
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
<H4>Linear Formula</H4>
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
      <div align="center"><b>S</b></div>
    </td>
    <td ><A HREF="javascript:a('S')"> Simple Interest</a></td>
  </tr>
  <tr> 
    <td width=30> 
      <div align="center"><b>M</b></div>
    </td>
    <td ><A HREF="javascript:a('M')"> Simple Interest Commercial Months</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>P</b></div>
    </td>
    <td ><A HREF="javascript:a('P')"> Prepaid Interest</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>A</b></div>
    </td>
    <td ><A HREF="javascript:a('A')"> Prepaid Interest Commercial Months</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>D</b></div>
    </td>
    <td ><A HREF="javascript:a('D')"> Discount Interest Calendar Months</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>T</b></div>
    </td>
    <td ><A HREF="javascript:a('T')"> Discount Interest Commercial 
      Months </a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>R</b></div>
    </td>
    <td ><A HREF="javascript:a('R')"> Reinvestment (CD's)</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>C</b></div>
    </td>
    <td ><A HREF="javascript:a('C')"> Compound Interest</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>8</b></div>
    </td>
    <td ><A HREF="javascript:a('8')"> Rule 78</a></td>
  </tr>

</table>
</BODY>
</HTML>
