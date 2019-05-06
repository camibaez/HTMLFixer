
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<TITLE>Payment Options</TITLE>
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
<h4>PAYMENT OPTIONS </h4>
<table class="tableinfo" style="width:95%" ALIGN=center>
  <tr id="trdark">
    <td >

      <p>MANUAL DISTRIBUTION OF PAYMENT  <br>
•	The user will determine the amounts to be applied to principal, interest, late fees and escrow.<br>   
•	The system will calculate the total amount due on the payment automatically.<br>
•	This option may be used to apply lump sums to Principal as extraordinary payments when necessary<br>
      </p>

 	  <p>PAYOFF <br>
•	The system will calculate the total amount to payoff the loan.  Amounts to be applied to principal, interest, late fees and escrow will be determined automatically by the system using this option.<br> 
 	   </p>

	  <p>EXTRAORDINARY PAYMENT <br>
•	The system will prompt for an amount where the user will enter sum to be applied to the loan.<br>  
•	The system will distribute this amount as follows: <br>
•	Any past-due amounts will be applied first. This includes principal, interest, escrows, and late fees.<br>  
•	Any remaining amount is applied to Principal. If there are no amounts in arrears, the entire payment is applied to principal.<br> 
This option does not affect interest that is due and unbilled.<br>
	   </p> 

	  <p>PARTIAL/EARLY PAYMENT <br>
•	The user will select this option, when payment is made before or after the installments become due.<br>  
•	The system applies the payment to any past-due amounts first. <br>
•	After applying the amounts due or past-due, the system will apply the payment to the Interest due to date, this amount will be applied to the interest on the next installment.<br>  
•	If any balance of the payment remains, the system will apply this amount to principal.  This amount is set aside and can be seen in the “Partial/Early Payment” field of the Inquiry of the Loan. When the next installment becomes due, at that time, any “early payment” amount is deducted from principal and applied to the installment (interest, escrow, etc.).  Once all the amounts are covered (principal, interest and escrow) the installment will be marked as “paid” and the loan will be current.<br> 
If the Customer sends a payment incomplete (short payment) the system will also take the difference from the “Partial/Early Payment” field and apply as needed.<br>
	   </p> 

	  <p>PAYMENTS DUE <br>
•	The system will determine the amount to be paid. <br>
•	Payments will be applied to all due and past-due installments.<br>
	   </p> 

      <p>NUMBER OF PAYMENTS <br>
•	The system will determine the amount to be paid, based on a number between one and 99 that is entered by the user. <br>  
•	The system will look at the number of installments that the user requested and will apply to past and future payments.<br>  
•	A negative interest balance may result of interest payments are applied prior to the interest being accrued.  As interest is accrued, the “overpaid” amount of interest is reduced.<br>
       </p>

      <p>TOTAL PAYMENT <br>
•	The user enters the amount to be paid.<br>
•	The system will apply the amount to any past due balances.<br>
•	The remaining balance if any will be applied to the outstanding interest balance to date, deducting this amount from the interest due on the next installment. The rest will be applied to principal.<br>
•	If the “Apply to Installments” box is checked, the system will distribute any remaining amounts and apply them against payments due on a future date.<br>
•	A negative interest balance may result of interest payments are applied prior to the interest being accrued.  As interest is accrued, the “overpaid” amount of interest is reduced.<br>
      </p>

    </td>
    
</table>
<P align=center>
	<input id="EIBSBTN" type=button value="Close" onclick="top.close()">
</P>
</BODY>
</HTML>
