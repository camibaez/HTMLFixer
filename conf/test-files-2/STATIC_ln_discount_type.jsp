<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>Discount Types</TITLE>
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
<h4> Discount Types</h4>
<table align=center class=tableinfo style="width:95%">
  <tr id="trdark"> 
    <td > 
      <div align="center"><b>Codes</b></div>
    </td>
    <td ><b>Description</b></td>
  </tr>
  <tr> 
    <td width=42 > 
      <div align="center"></div>
    </td>
    <td width="369" ><a href="javascript:a('')">Not Applicable</a></td>
  </tr>
  <tr> 
    <td width=42 > 
      <div align="center"><b>1</b></div>
    </td>
    <td width="369" ><a href="javascript:a('1')">Principal is booked for the 
      invoice, value discount is deducted from proceeds</a></td>
  </tr>
  <tr> 
    <td width=42 > 
      <div align="center"><b>2</b></div>
    </td>
    <td width="369" ><A HREF="javascript:a('2')"> </a><a href="javascript:a('2')">Principal 
      is booked for invoice less discount, discount is paid at maturity</a></td>
  </tr>
</table>
<P>
</P>
</BODY>
</HTML>
