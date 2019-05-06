<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>Transaction Process Type</TITLE>
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
<H4>Transaction Process Type</H4>
<table align=center class=tableinfo style="width:95%">
  <TR id=trdark> 
    <TH align=left  > 
      <div align="left">Code</div>
    </TH>
     <TH align=left  > 
      <div align="left">Description</div>
    </TH>

  </TR>

  <tr id=trdark> 
    <td width=30 colspan="2"> 
      <div ><b>SERVICES</b></div>
    </td>
  </tr>
  <tr> 
    <td width=30> 
      <div align="center"><b>SP</b></div>
    </td>
    <td ><A HREF="javascript:a('SP')"> Place a Stop Payment</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>SR</b></div>
    </td>
    <td ><A HREF="javascript:a('SR')"> Release Stop Payment</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>SV</b></div>
    </td>
    <td ><A HREF="javascript:a('SV')"> Service Collection</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>PU</b></div>
    </td>
    <td ><A HREF="javascript:a('PU')"> Update PassBook</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>DP</b></div>
    </td>
    <td ><A HREF="javascript:a('DP')"> Deposit</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>WH</b></div>
    </td>
    <td ><A HREF="javascript:a('WH')"> Withdrawals</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>PF</b></div>
    </td>
    <td ><A HREF="javascript:a('PF')"> Official Check Proof of Deposit</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>PB</b></div>
    </td>
    <td ><A HREF="javascript:a('PB')"> On Us Check Proof of Deposit</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>PN</b></div>
    </td>
    <td ><A HREF="javascript:a('PN')"> Other Checks Proof of Deposit</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>GT</b></div>
    </td>
    <td ><A HREF="javascript:a('GT')"> General Ledger Transaction</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>RU</b></div>
    </td>
    <td ><A HREF="javascript:a('RU')"> Release of Uncollected Funds</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>OF</b></div>
    </td>
    <td ><A HREF="javascript:a('OF')"> Official Check Sale/Payment</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>HP</b></div>
    </td>
    <td ><A HREF="javascript:a('HP')"> Hold Placement</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>HR</b></div>
    </td>
    <td ><A HREF="javascript:a('HR')"> Release Hold</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>MC</b></div>
    </td>
    <td ><A HREF="javascript:a('MC')"> Miscellaneous Credit</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>MD</b></div>
    </td>
    <td ><A HREF="javascript:a('MD')"> Miscellaneous Debit</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>AL</b></div>
    </td>
    <td ><A HREF="javascript:a('AL')"> New PassBook</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>TT</b></div>
    </td>
    <td ><A HREF="javascript:a('TT')"> Teller Totals</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>CT</b></div>
    </td>
    <td ><A HREF="javascript:a('CT')"> Branch Closing</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>TR</b></div>
    </td>
    <td ><A HREF="javascript:a('TR')"> Account Transfers</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>FX</b></div>
    </td>
    <td ><A HREF="javascript:a('FX')"> Foreign Exchange</a></td>
  </tr>
  
  <tr id=trdark> 
    <td width=30 colspan="2"> 
      <div ><b>INQUIRIES</b></div>
    </td>
  </tr>  
  <tr> 
    <td width=30> 
      <div align="center"><b>IB</b></div>
    </td>
    <td ><A HREF="javascript:a('IB')"> Account Balances</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>IL</b></div>
    </td>
    <td ><A HREF="javascript:a('IL')"> Last Transaction</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>IU</b></div>
    </td>
    <td ><A HREF="javascript:a('IU')"> Uncollected/Holds</a></td>
  </tr>
  <tr>   
  <tr> 
    <td width=30> 
      <div align="center"><b>IH</b></div>
    </td>
    <td ><A HREF="javascript:a('IH')"> Transaction History</a></td>
  </tr>
  
  <tr id=trdark> 
    <td width=30 colspan="2"> 
      <div ><b>PLATFORM</b></div>
    </td>
  </tr>  
  
  <tr> 
    <td width=30 > 
      <div align="center"><b>CI</b></div>
    </td>
    <td ><A HREF="javascript:a('CI')"> Customer Inquiry</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>CA</b></div>
    </td>
    <td ><A HREF="javascript:a('CA')"> New Customer</a></td>
  </tr>
  <tr>
    <td width=30 > 
      <div align="center"><b>CM</b></div>
    </td>
    <td ><A HREF="javascript:a('CM')"> Customer Maintenance</a></td>
  </tr>
   <tr>
    <td width=30 > 
      <div align="center"><b>CC</b></div>
    </td>
    <td ><A HREF="javascript:a('CC')"> Customer Complem. Information</a></td>
  </tr>
   <tr>
    <td width=30 > 
      <div align="center"><b>AI</b></div>
    </td>
    <td ><A HREF="javascript:a('AI')"> Account Information Inquiry</a></td>
  </tr>
   <tr>
    <td width=30 > 
      <div align="center"><b>AA</b></div>
    </td>
    <td ><A HREF="javascript:a('CA')"> Open New Account </a></td>
  </tr>
   <tr>
    <td width=30 > 
      <div align="center"><b>AM</b></div>
    </td>
    <td ><A HREF="javascript:a('AM')"> Account Maintenance</a></td>
  </tr>
   <tr>
    <td width=30 > 
      <div align="center"><b>AC</b></div>
    </td>
    <td ><A HREF="javascript:a('AC')"> Cancel Account</a></td>
  </tr>
   <tr>
    <td width=30 > 
      <div align="center"><b>TI</b></div>
    </td>
    <td ><A HREF="javascript:a('TI')"> TDS Inquiry</a></td>
  </tr>
   <tr>
    <td width=30 > 
      <div align="center"><b>TA</b></div>
    </td>
    <td ><A HREF="javascript:a('TA')"> TDS Opening</a></td>
  </tr>
   <tr>
    <td width=30 > 
      <div align="center"><b>TM</b></div>
    </td>
    <td ><A HREF="javascript:a('TM')"> TDS Maintenance</a></td>
  </tr>
   <tr>
    <td width=30 > 
      <div align="center"><b>LI</b></div>
    </td>
    <td ><A HREF="javascript:a('LI')"> Loan Inquiry</a></td>
  </tr>
   <tr>
    <td width=30 > 
      <div align="center"><b>LA</b></div>
    </td>
    <td ><A HREF="javascript:a('LA')"> Loan Opening</a></td>
  </tr>
   <tr>
    <td width=30 > 
      <div align="center"><b>LP</b></div>
    </td>
    <td ><A HREF="javascript:a('LP')"> Loan Payment</a></td>
  </tr>
    
</table>
<br>
</BODY>
</HTML>
