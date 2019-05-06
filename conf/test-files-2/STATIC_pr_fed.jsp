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
  		break;
	}
 }
 top.close();
 }
//-->
</script>
</HEAD>
<BODY>

<h4> FED Product Code</h4>
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
      <div align="center"><b>BTR</b></div>
    </td>
    <td ><A HREF="javascript:a('BTR')"> Bank Transfer</a></td>
  </tr>
  <tr> 
    <td width=30  > 
      <div align="center"><b>CTR</b></div>
    </td>
    <td ><a href="javascript:a('CTR')">Customer Transfer</a></td>
  </tr>
  <tr> 
    <td width=30  > 
      <div align="center"><b>COV</b></div>
    </td>
    <td ><a href="javascript:a('COV')">Cover Transfer</a></td>
  </tr>
  <tr> 
    <td width=30  > 
      <div align="center"><b>DEP</b></div>
    </td>
    <td ><a href="javascript:a('DEP')">Deposit Sender's Account</a></td>
  </tr>
  <tr> 
    <td width=30  > 
      <div align="center"><b>DRB</b></div>
    </td>
    <td ><a href="javascript:a('DRB')">Bank to Bank Drawdown</a></td>
  </tr>
  <tr> 
    <td width=30  > 
      <div align="center"><b>DRC</b></div>
    </td>
    <td ><a href="javascript:a('DRC')">Customer or Corp. Drawdown</a></td>
  </tr>
  <tr> 
    <td width=30  > 
      <div align="center"><b>FFR</b></div>
    </td>
    <td ><a href="javascript:a('FFR')">Fed Funds Return</a></td>
  </tr>
  <tr> 
    <td width=30  > 
      <div align="center"><b>FFS</b></div>
    </td>
    <td ><a href="javascript:a('FFS')">Fed Funds Sold</a></td>
  </tr>
  <tr> 
    <td width=30  > 
      <div align="center"><b>IRS</b></div>
    </td>
    <td ><a href="javascript:a('IRS')">IRS Tax Payment</a></td>
  </tr>
  <tr> 
    <td width=30  > 
      <div align="center"><b>CKS</b></div>
    </td>
    <td ><a href="javascript:a('CKS')">Check Same Day Settlement</a></td>
  </tr>
  <tr> 
    <td width=30  > 
      <div align="center"><b>SVC</b></div>
    </td>
    <td ><a href="javascript:a('SVC')">Service Message</a></td>
  </tr>
  tr> 
    <td width=30  > 
      <div align="center"><b>IAT</b></div>
    </td>
    <td ><a href="javascript:a('IAT')">International ACH Transaction</a></td>
  </tr>
</table>
<P>
</P>
</BODY>
</HTML>
