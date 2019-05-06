<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>Line of Credit category</TITLE>
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
<h4>Category of Line </h4>
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
    <td width=32 >&nbsp;</td>
    <td >Customer Level</td>
  </tr>
  <tr> 
    <td width=32 > 
      <div align="center"><b>A</b></div>
    </td>
    <td ><a href="javascript:a('A')">Authorized / Active</a></td>
  </tr>
  <tr> 
    <td width=32 > 
      <div align="center"><b>G</b></div>
    </td>
    <td ><a href="javascript:a('G')">Collateral Required</a></td>
  </tr>
  <tr> 
    <td width=32 > 
      <div align="center"><b>I</b></div>
    </td>
    <td ><a href="javascript:a('I')">Non Process / Inactive</a></td>
  </tr>
  <tr> 
    <td width=32 > 
      <div align="center"><b>S</b></div>
    </td>
    <td ><a href="javascript:a('S')">Supervised</a> </td>
  </tr>
  <tr> 
    <td width=32 > 
      <div align="center"><b>N</b></div>
    </td>
    <td ><a href="javascript:a('N')">Non Revolving Line</a> </td>
  </tr>
  <tr> 
    <td width=32 > 
      <div align="center"><b>R</b></div>
    </td>
    <td ><a href="javascript:a('R')">Renewal Line</a></td>
  </tr>
  <tr>
    <td width=32 >&nbsp;</td>
    <td >Bank Level</td>
  </tr>
  <tr> 
    <td width=32 > 
      <div align="center"><b>C</b></div>
    </td>
    <td ><a href="javascript:a('C')">Line Control</a></td>
  </tr>
</table>
<P>
</P>
</BODY>
</HTML>
