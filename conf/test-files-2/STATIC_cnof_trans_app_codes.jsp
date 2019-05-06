<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>Transaction Application Codes</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script language="javascript">
//<!-- Hide from old browsers
function a(code) {
var formLength= top.top.opener.document.forms[0].elements.length;
for(n=0;n<formLength;n++)
{
	var elementName= top.top.opener.document.forms[0].elements[n].name;
	if(elementName == top.top.opener.fieldName) 
	{
  		top.top.opener.document.forms[0].elements[n].value = code;
  		break;
	}
 }
 top.close();
 }
//-->
</script>
</HEAD>
<BODY>
<h4>Transaction Application Codes</h4>
<h5>Installment Loans</h5>
<table align=center class="tableinfo" style="width:95%">
  <tr id="trdark"> 
    <td width=85 height="18" > 
      <div align="center"><b>Code</b></div>
    </td>
    <td width="1099"> 
      <div align="left"><b>Description</b></div>
    </td>
  </tr>
  <tr> 
    <td width=85 height="18" > 
      <div align="center"><b>P</b></div>
    </td>
    <td width="1099"><a href="javascript:a('P')">Applied to Principal Balance</a></td>
  </tr>
  <tr> 
    <td width=85 height="18" > 
      <div align="center"><b>I</b></div>
    </td>
    <td width="1099"><a href="javascript:a('I')">Applied to Interest Balance</a></td>
  </tr>
  <tr> 
    <td width=85 height="18" > 
      <div align="center"><b>B</b></div>
    </td>
    <td width="1099"><A HREF="javascript:a('B')"> Applied to Dealer Reserve Balance</a></td>
  </tr>
  <tr> 
    <td width=85 height="22" > 
      <div align="center"><b>L</b></div>
    </td>
    <td width="1099" height="22"><a href="javascript:a('L')">Appplied to Late 
      Charges Balance</a></td>
  </tr>
  <tr> 
    <td width=85 height="18" > 
      <div align="center"><b>F</b></div>
    </td>
    <td width="1099"><a href="javascript:a('F')">Applied to Amortized Fee</a></td>
  </tr>
  <tr> 
    <td width=85 height="18" > 
      <div align="center"><b>O</b></div>
    </td>
    <td width="1099"><a href="javascript:a('O')">Payoff Transactions</a> </td>
  </tr>
</table>
<h5>Mortage Loans</h5>
<table align=center class="tableinfo" style="width:95%">
  <tr id="trdark"> 
    <td width=85 height="18" > 
      <div align="center"><b>Code</b></div>
    </td>
    <td width="1099"> 
      <div align="left"><b>Description</b></div>
    </td>
  </tr>
  <tr> 
    <td width=85 height="18" > 
      <div align="center"><b>P</b></div>
    </td>
    <td width="1099"><a href="javascript:a('P')">Applied to Principal Balance</a></td>
  </tr>
  <tr> 
    <td width=85 height="18" > 
      <div align="center"><b>I</b></div>
    </td>
    <td width="1099"><a href="javascript:a('I')">Applied to Interest Balance</a></td>
  </tr>
  <tr> 
    <td width=85 height="18" > 
      <div align="center"><b>1,2,3</b></div>
    </td>
    <td width="1099"><a href="javascript:a('1')"> Applied to Escrow Taxes Balance</a></td>
  </tr>
  <tr> 
    <td width=85 height="22" > 
      <div align="center"><b>4,5,6</b></div>
    </td>
    <td width="1099" height="22"><a href="javascript:a('4')">Appplied to Escrow 
      Insurance Balance</a></td>
  </tr>
  <tr> 
    <td width=85 height="18" > 
      <div align="center"><b>L</b></div>
    </td>
    <td width="1099"><a href="javascript:a('F')">Applied to Late Fees Balance</a></td>
  </tr>
  <tr> 
    <td width=85 height="18" > 
      <div align="center"><b>U</b></div>
    </td>
    <td width="1099"><a href="javascript:a('U')">Applied to Unapplied Balance</a> 
    </td>
  </tr>
  <tr> 
    <td width=85 height="18" > 
      <div align="center"><b>F</b></div>
    </td>
    <td width="1099"> 
      <div align="left"><a href="javascript:a('F')">Applied to Closing Fees Balance</a> 
      </div>
    </td>
  </tr>
  <tr> 
    <td width=85 height="18" > 
      <div align="center"><b>R</b></div>
    </td>
    <td width="1099"> 
      <div align="left"><a href="javascript:a('R')">Payment Reversal Transaction</a> 
      </div>
    </td>
  </tr>
  <tr> 
    <td width=85 height="20" > 
      <div align="center"><b>*</b></div>
    </td>
    <td width="1099" height="20"> 
      <div align="left"><a href="javascript:a('*')">Distributed by Payment Disposition 
        Filed from the Mortgage Loan</a> </div>
    </td>
  </tr>
</table>
<h5>Demand Deposit Account</h5>
<table align=center class="tableinfo" style="width:95%">
  <tr id="trdark"> 
    <td width=85 height="18" > 
      <div align="center"><b>Code</b></div>
    </td>
    <td width="1099"> 
      <div align="left"><b>Description</b></div>
    </td>
  </tr>
  <tr> 
    <td width=85 height="18" > 
      <div align="center"><b>D</b></div>
    </td>
    <td width="1099"><a href="javascript:a('D')">Direct Deposit</a></td>
  </tr>
  <tr> 
    <td width=85 height="18" > 
      <div align="center"><b>E</b></div>
    </td>
    <td width="1099"><a href="javascript:a('E')">Electronic Transaction</a></td>
  </tr>  
  <tr> 
    <td width=85 height="18" > 
      <div align="center"><b>Y</b></div>
    </td>
    <td width="1099"><a href="javascript:a('Y')">Check Book Control</a></td>
  </tr>  
  
</table>
<P> </P>
</BODY>
</HTML>
