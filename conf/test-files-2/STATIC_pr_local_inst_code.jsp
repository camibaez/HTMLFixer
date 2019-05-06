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
  		break;
	}
 }
 top.close();
 }
//-->
</script>
</HEAD>
<BODY>

<h4> 3610 Local Instrument Codes</h4>
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
      <div align="center"><b>ANSI</b></div>
    </td>
    <td ><A HREF="javascript:a('ANSI')"> ANSI X12 format</a></td>
  </tr>
  <tr> 
    <td width=30  > 
      <div align="center"><b>COVS</b></div>
    </td>
    <td ><A HREF="javascript:a('COVS')"> Sequence B Cover Payment Structured</a></td>
  </tr>
  <tr> 
    <td width=30  > 
      <div align="center"><b>GXML</b></div>
    </td>
    <td ><a href="javascript:a('GXML')"> General XML format</a></td>
  </tr>
  <tr> 
    <td width=30  > 
      <div align="center"><b>IXML</b></div>
    </td>
    <td ><a href="javascript:a('IXML')"> ISO 20022 XML format  </a></td>
  </tr>
  <tr> 
    <td width=30  > 
      <div align="center"><b>NARR</b></div>
    </td>
    <td ><a href="javascript:a('NARR')"> Narrative Text</a></td>
  </tr>
  <tr> 
    <td width=30  > 
      <div align="center"><b>PROP</b></div>
    </td>
    <td ><a href="javascript:a('PROP')"> Proprietary Local Instrument Code </a></td>
  </tr>
  <tr> 
    <td width=30  > 
      <div align="center"><b>RMTS</b></div>
    </td>
    <td ><a href="javascript:a('RMTS')"> Remittance Information Structured </a></td>
  </tr>
  <tr> 
    <td width=30  > 
      <div align="center"><b>RRMT</b></div>
    </td>
    <td ><a href="javascript:a('RRMT')"> Related Remittance Information </a></td>
  </tr>
  <tr> 
    <td width=30  > 
      <div align="center"><b>S820</b></div>
    </td>
    <td ><a href="javascript:a('S820')"> STP 820 format </a></td>
  </tr>
  <tr> 
    <td width=30  > 
      <div align="center"><b>SWIF</b></div>
    </td>
    <td ><a href="javascript:a('SWIF')"> SWIFT field 70 (Remittance Information) </a></td>
  </tr>
  <tr> 
    <td width=30  > 
      <div align="center"><b>UEDI</b></div>
    </td>
    <td ><a href="javascript:a('UEDI')"> UN/EDIFACT format</a></td>
  </tr>
  <tr> 
    <td width=30  > 
      <div align="center"><b>NONE</b></div>
    </td>
    <td ><a href="javascript:a('')">N/A</a></td>
  </tr>
</table>
<P>
</P>
</BODY>
</HTML>
