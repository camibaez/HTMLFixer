<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>Loan Type</TITLE>
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

<h4> Loan Type</h4>
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
      <div align="center"><b>A</b></div>
    </td>
    <td><a href="javascript:a('A')">Leasing</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>C</b></div>
    </td>
    <td ><a href="javascript:a('C')">Consumer Loans</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>L</b></div>
    </td>
    <td ><a href="javascript:a('L')">Regular Loans</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>H</b></div>
    </td>
    <td ><a href="javascript:a('H')">Home Equity Plans</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>G</b></div>
    </td>
    <td ><a href="javascript:a('G')">Factoring </a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>V</b></div>
    </td>
    <td ><a href="javascript:a('V')">Local Collections</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>M</b></div>
    </td>
    <td ><a href="javascript:a('M')">Mortgage Loans</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>F</b></div>
    </td>
    <td ><a href="javascript:a('F')">Fixed Payments Loans</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>O</b></div>
    </td>
    <td ><a href="javascript:a('O')">Loan for Overdraft</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>B</b></div>
    </td>
    <td ><a href="javascript:a('B')">ACC & ACE</a></td>
  </tr>

</table>
<P>
</P>
</BODY>
</HTML>
