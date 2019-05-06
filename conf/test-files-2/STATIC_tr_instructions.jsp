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
<h4>Instructions</h4>
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
      <div align="center"><b>SDVA</b></div>
    </td>
    <td ><a href="javascript:a('SDVA')">Payment must be executed with same  day value to the beneficiary.</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>INTC</b></div>
    </td>
    <td ><a href="javascript:a('INTC')">The payment is an intra-company payment  i.e, a payment between two companies belonging to the same group</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>REPA</b></div>
    </td>
    <td ><a href="javascript:a('REPA')">Payment has a related e-Payments reference</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>CORT</b></div>
    </td>
    <td ><A HREF="javascript:a('CORT')">Payment is made in settlement of a trade ,e.g, foreign exchange deal, securities transaction</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>BONL</b></div>
    </td>
    <td ><A HREF="javascript:a('BONL')">Payment is to made to the beneficiary customer only</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>HOLD</b></div>
    </td>
    <td ><A HREF="javascript:a('HOLD')">Beneficiary customer/claimant will call  pay upon identification</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>CHQB</b></div>
    </td>
    <td ><A HREF="javascript:a('CHQB')">Pay beneficiary customer only by check  the optional account number line in field 59 must not be used</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>PHOB</b></div>
    </td>
    <td ><A HREF="javascript:a('PHOB')">Please advice/contact beneficiary/claimant by phone</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>TELB</b></div>
    </td>
    <td ><A HREF="javascript:a('TELB')">Please advice/contact beneficiary/claimant by the most efficient means of telecommunication</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>PHON</b></div>
    </td>
    <td ><A HREF="javascript:a('PHON')">Please advice account with institution by phone</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>TELE</b></div>
    </td>
    <td ><A HREF="javascript:a('TELE')">Please advice account with institution by the most  efficient means of telecommunication</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>PHOI</b></div>
    </td>
    <td ><A HREF="javascript:a('PHOI')">Please advice the intermediary institution by phone</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>TELI</b></div>
    </td>
    <td ><A HREF="javascript:a('TELI')">Please advice the intermediary institution by the most efficient means of telecommunication</a></td>
  </tr>
  
</table>
</BODY>
</HTML>
