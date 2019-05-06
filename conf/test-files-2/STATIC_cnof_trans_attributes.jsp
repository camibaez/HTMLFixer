<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>Transaction Attributes</TITLE>
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
<h4>Transaction Attributes</h4>
<table align=center class="tableinfo" style="width:95%">
  <tr id="trdark"> 
    <td width=83 height="18" > 
      <div align="center"><b>Code</b></div>
    </td>
    <td width="1215"> 
      <div align="left"><b>Description</b></div>
    </td>
  </tr>
  <tr> 
    <td width=83 height="18" > 
      <div align="center"><b>N</b></div>
    </td>
    <td width="1215"><a href="javascript:a('N')">Means no Attributes</a></td>
  </tr>
  <tr> 
    <td width=83 height="18" > 
      <div align="center"><b>Y</b></div>
    </td>
    <td width="1215"><a href="javascript:a('Y')">Means Adjustment or Direct Withdrawal, 
      Will not Affect Total Transactions Permitted Under Regulation "D"</a></td>
  </tr>
  <tr> 
    <td width=83 height="18" > 
      <div align="center"><b>R</b></div>
    </td>
    <td width="1215"><A HREF="javascript:a('R')"> Means Returned Item, Service 
      Charge May Be Assesed, also Counter Will Be Affected</a></td>
  </tr>
  <tr> 
    <td width=83 height="18" > 
      <div align="center"><b>D</b></div>
    </td>
    <td width="1215"><a href="javascript:a('D')">Means Customer Deposit</a></td>
  </tr>
  <tr> 
    <td width=83 height="18" > 
      <div align="center"><b>C</b></div>
    </td>
    <td width="1215"><a href="javascript:a('C')">Means Regular Check</a> </td>
  </tr>
</table>
<P>
</P>
</BODY>
</HTML>
