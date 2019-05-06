<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V5.1 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>Roll-Over Codes</TITLE>
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

<h4>Roll-Over Codes</h4>
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
    <td width=30> 
      <div align="center"><b>A</b></div>
    </td>
    <td><A HREF="javascript:a('A')"> Principal plus Interest will be roll-over for the
						same period of time</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>B</b></div>
    </td>
    <td ><A HREF="javascript:a('B')"> Interest will be paid to 
						Account (Retail, Savings, etc.) or to 
						other Certificate. Principal will be roll-over
						for the same period of time</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>C</b></div>
    </td>
    <td ><A HREF="javascript:a('C')"> Interest will be paid to the General
						Ledger number  , generating an Official Check, or generated for 
						via Funds Transfer. Principal will be roll-over for the same period of
						time.</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>D</b></div>
    </td>
    <td ><a href="javascript:a('D')">When Certificate matures cancel the
						Deposit plus Interest payable to the General Ledger number, or generating an 
						Official Check, or generated via Funds Transfer.</a></td>
  </tr>
  <tr> 
    <td width=30> 
      <div align="center"><b>E</b></div>
    </td>
    <td ><a href="javascript:a('E')">When Certificate matures cancel the
						Deposit crediting to the Account number (Retail, Savings, etc.).</a></td>
  </tr>
	<TR>
		<TD width="30">
		<DIV align="center"><B>F</B></DIV>
		</TD>
		<TD><A href="javascript:a('F')">When Certificate matures roll-over the Deposit
						plus Interest, increasing it or 
						decreasing it,  against the Account
						number  (Retail, Savings, etc.).</A></TD>
	</TR>
	<TR>
		<TD width="30">
		<DIV align="center"><B>G</B></DIV>
		</TD>
		<TD><A href="javascript:a('G')">When Certificate matures roll-over the
						Deposit plus Interest, by the same period of time, decreasing
						interests and, crediting to the
						Account number  (Retail, Savings, etc.).</A></TD>
	</TR>
	<TR>
		<TD width="30">
		<DIV align="center"><B>H</B></DIV>
		</TD>
		<TD><A href="javascript:a('H')">    Interest will be paid in periods  to the 
						Account (Retail, Savings, etc.) , or to the 
						Certificate. Principal will be roll-over
						for the same period of time.</A></TD>
	</TR>
	<TR>
		<TD width="30">
		<DIV align="center"><B>I</B></DIV>
		</TD>
		<TD><A href="javascript:a('I')">Interest will be paid in periods  to the General Ledger number, or
						Official Check, or generated
						via Funds Transfer. Principal will be roll-over for the same period of
						time.</A></TD>
	</TR>
	<TR>
		<TD width="30">
		<DIV align="center"><B>J</B></DIV>
		</TD>
		<TD><A href="javascript:a('J')">Interest plus Principal will be paid to the
						Certificate of Deposit number . There is no renovation in
						this option</A></TD>
	</TR>
	<TR>
		<TD width="30">
		<DIV align="center"><B>K</B></DIV>
		</TD>
		<TD><A href="javascript:a('K')">Interest will be paid 
						by  on specific date or at the end of the month to 
						Account(Retail, Savings, etc.) or to a 
						Certificate.</A></TD>
	</TR>
	<TR>
		<TD width="30">
		<DIV align="center"><B>P</B></DIV>
		</TD>
		<TD><A href="javascript:a('P')">Deposit has no renovations Instructions, it will
						be automatically roll-over after the waiting period.</A></TD>
	</TR>
	<TR>
		<TD width="30">
		<DIV align="center"><B>S</B></DIV>
		</TD>
		<TD><A href="javascript:a('S')">Principal and Interest will be paid based on
						schedule of payments , and will
						be paid to the General Ledger number , or to the Retail Account , or generating an 
						Official Check, or generated
						via Funds Transfer.</A></TD>
	</TR></table>



</BODY>
</HTML>
