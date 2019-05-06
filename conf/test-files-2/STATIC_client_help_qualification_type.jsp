<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>Classification</TITLE>
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
<h4> Classification Types</h4>
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
    <td > 
      <div align="center"><b>1</b></div>
    </td>
    <td ><A HREF="javascript:a('1')"> To calculate the 
      Loan Losses Provision utilizes the highest score of both (objective or subjective)</a></td>
  </tr>
  <tr> </tr>
  <tr> 
    <td width=28 > 
      <div align="center"><b>2</b></div>
    </td>
    <td ><A HREF="javascript:a('2')"> Will not perform 
      any Provision.</a></td>
  </tr>
  <tr> 
    <td > 
      <div align="center"><b>3</b></div>
    </td>
    <td ><A HREF="javascript:a('3')"> The subjective score 
      will utilized to compute the Loan Losses Provision.</a></td>
  </tr>
  <tr> </tr>
</table>
</BODY>
</HTML>
