<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>Product Selection</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
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
<h4>Product Selection</h4>
<table align=center class=tableinfo style="width:95%">
  <TR id=trdark> 
    <TH align=left colspan="2"  > 
      <div align="left"></div>
      <div align="left">Foreign Exchange</div>
    </TH>
  </TR>
  <tr> 
    <td width=30 > 
      <div align="center"><b>SPT</b></div>
    </td>
    <td ><a href="javascript:a('SPT')">Spot</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>FWR</b></div>
    </td>
    <td ><a href="javascript:a('FWR')">Forward</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>NDF</b></div>
    </td>
    <td ><A HREF="javascript:a('NDF')">Non Derivable Forward</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>SWP</b></div>
    </td>
    <td ><A HREF="javascript:a('SWP')">Swap</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>OPT</b></div>
    </td>
    <td ><a href="javascript:a('OPT')">Options</a></td>
  </tr>
  <tr id="trdark"> 
    <td colspan="2" > 
      <div align="left"><b>Money Market</b></div>
    </td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>FFS</b></div>
    </td>
    <td ><a href="javascript:a('FFS')"><%=currUser.getH01WK3().equals("4")?"Overnight Funds Sale":"Federal Funds Sale"%></a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>FFP</b></div>
    </td>
    <td ><a href="javascript:a('FFP')"><%=currUser.getH01WK3().equals("4")?"Overnight Funds Purchase":"Federal Funds Purchase"%></a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>CDS</b></div>
    </td>
    <td ><a href="javascript:a('CDS')">Certificates of Deposit Sale</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>CDP</b></div>
    </td>
    <td ><a href="javascript:a('CDP')">Certificates of Deposit Purchase</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>TDS</b></div>
    </td>
    <td ><a href="javascript:a('TDS')">Time Deposits Sale</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>TDP</b></div>
    </td>
    <td ><a href="javascript:a('TDP')">Time Deposits Purchase</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>PLP</b></div>
    </td>
    <td ><a href="javascript:a('PLP')">Commercial Papers</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>ACS</b></div>
    </td>
    <td ><a href="javascript:a('ACS')">Bankers Acceptance Sale</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>ACP</b></div>
    </td>
    <td ><a href="javascript:a('ACP')">Bankers Acceptance Purchase</a></td>
  </tr>
  <tr id="trdark"> 
    <td colspan="2" > 
      <div align="left"><b>Others</b></div>
    </td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>FRA</b></div>
    </td>
    <td ><a href="javascript:a('FRA')">Forward Rate Agreements</a></td>
  </tr>
  <tr>
    <td width=30 >
      <div align="center"><b>MMP</b></div>
    </td>
    <td ><a href="javascript:a('MMP')">Financial Blocks</a></td>
  </tr>
</table>
</BODY>
</HTML>
