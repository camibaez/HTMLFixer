<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>FED Codes</TITLE>
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
  		top.opener.document.forms[0].elements[n].focus();
  		if(top.opener.document.forms[0].elements[n].onchange){
			top.opener.document.forms[0].elements[n].onchange();
		}
  		break;
	}
 }
 top.close();
 }
//-->
</script>
</HEAD>
<BODY>

<h4> FED-CTP {5010} Party Identifier</h4>
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
      <div align="center"><b>/</b></div>
    </td>
    <td ><A HREF="javascript:a('/')"> Account Number </a></td>
  </tr>
  <tr> 
    <td width=30  > 
      <div align="center"><b>ARNU/</b></div>
    </td>
    <td ><A HREF="javascript:a('ARNU/')"> Alien Registration Number</a></td>
  </tr>
  <tr> 
    <td width=30  > 
      <div align="center"><b>CCPT/</b></div>
    </td>
    <td ><a href="javascript:a('CCPT/')">Passport Number</a></td>
  </tr>
  <tr> 
    <td width=30  > 
      <div align="center"><b>CUST/</b></div>
    </td>
    <td ><a href="javascript:a('CUST/')">Customer Identification Number</a></td>
  </tr>
  <tr> 
    <td width=30  > 
      <div align="center"><b>DRLC/</b></div>
    </td>
    <td ><a href="javascript:a('DRLC/')">Driver?s License Number</a></td>
  </tr>
  <tr> 
    <td width=30  > 
      <div align="center"><b>EMPL/</b></div>
    </td>
    <td ><a href="javascript:a('EMPL/')">Employer Number</a></td>
  </tr>
  <tr> 
    <td width=30  > 
      <div align="center"><b>NIDN/</b></div>
    </td>
    <td ><a href="javascript:a('NIDN/')">National Identify Number</a></td>
  </tr>
  <tr> 
    <td width=30  > 
      <div align="center"><b>SOSE/</b></div>
    </td>
    <td ><a href="javascript:a('SOSE/')">Social Security Number </a></td>
  </tr>
  <tr> 
    <td width=30  > 
      <div align="center"><b>TXID/</b></div>
    </td>
    <td ><a href="javascript:a('TXID/')">Tax Identification Number </a></td>
  </tr>
</table>
<P>
</P>
</BODY>
</HTML>
