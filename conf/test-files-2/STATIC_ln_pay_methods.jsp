
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<TITLE>Methods of Payment</TITLE>
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
<h4>METHODS OF GENERATING A PAYMENT SCHEDULE </h4>
<table class="tableinfo" style="width:95%" ALIGN=CENTER>
  <tr id="trdark">
    <td >
      <p>SCH = (Payment Schedule) Is generated by the user and are entered manually</p>
	  <p>SC2 = (Double Amortization Schedule) Even leveled payments, with a double payments, Example 60% is paid monthly and 40% paid annually </p> 
	  <p>SC3 = (Amortization Schedule with Escrow and Deductions) Even leveled payments for Principal, Interest and deductions</p> 
	  <p>000 = (The Principal & Interest Cycle will be defined at the time of Opening to Loans) </p> 
	  <p>MAT = (The Principal Balance will be due in full at Maturity Date) </p>
      <p>Nnn = (Payment Cycle) A value is entered between 001 and 999 indicating the number of days for the payment cycle of interest and principal accompanied by the date of the next payment, the amount of the payment  can be calculated by the system or entered manually by the user, the amount of the payment can be for principal amount or for the principal amount plus interest.
      </p><p>Nnn for interest and SCH for principal amount = interest payments are calculated by the system and the payment amount of principal is entered by the user manually
      </p>
    </td>
    
</table>
<P align=center>
	<input id="EIBSBTN" type=button value="Close" onclick="top.close()">
</P>
</BODY>
</HTML>
