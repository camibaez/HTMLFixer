<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>Accounting Changes</TITLE>
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
<h4>Accounting Changes</h4>
<table class="tableinfo" style="width:95%" ALIGN=CENTER>
  <tr id="trdark">
    <td width=30 height="18" >
      <div align="left"><b>Code</b></div>
    </td>
    <td width="420">
      <div align="left"><b>Description</b></div>
    </td>
  </tr>
  <tr id="trclear"> 
    <td width=30 height="18" > 
      <div align="center"><b>0</b></div>
    </td>
    <td width="420"><a href="javascript:a('0')">Only past due amounts will be reclassified. <br>
    											The current portion of the loan will remain in the G/L for 
    											current loans, the amounts past due will be reflected in 
    											the G/L assigned for non-performing/past due loans. </a></td>
  </tr>
  <tr id="trdark"> 
    <td width=30 height="18" > 
      <div align="center"><b>1-5</b></div>
    </td>
    <td width="420"><a href="javascript:a('')">As specified in the field “Days of Change G/L  (1-5)”, as payments 
    										   become past due, the amounts are transferred to the related G/L for 
    										   past due/non-performing. When the number of days entered in the 
    										   corresponding  “Days of Change G/L” is reached by the oldest payment,
    										   the loan in its entirety is reclassified and is further reclassified 
    										   as specified in the subsequent fields.<br><br>
    										   For example <br>
											   If a “2” is entered in this field, “180” is entered in 
											   “Days of Change G/L(2)”; when a payment is past due for 180, the entire 
											   loan is reclassified and is further reclassified as specified in the 
											   remaining “Days of Change G/L  (1-5)” fields.  <br>
											   Prior to the 180 days, only past due amounts would have been reflected 
											   in the  past-due G/L as specified in “Days of Change G/L (1)” and the  
											   remainder of the loan would be recorded in the current loans G/L. </a></td>
  </tr>
  <tr id="trclear"> 
    <td width=30 height="18" > 
      <div align="center"><b>M</b></div>
    </td>
    <td width="420"><a href="javascript:a('M')">Upon reaching the final Maturity Date of the loan, the loans move from  
    											G/L to G/L as stipulated in “Days of Change G/L (1-5)”. </a></td>
  </tr>
</table>
<P>
</P>
</BODY>
</HTML>
