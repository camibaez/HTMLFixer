<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>Instrucciones para Impuestos</TITLE>
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

<h4> Transfers Types</h4>
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
    <td width=32 > 
      <div align="center"><b>F</b></div>
    </td>
    <td><A HREF="javascript:a('F')"> Fed</a></td>
  </tr>
  <tr> 
    <td width=32 > 
      <div align="center"><b>S</b></div>
    </td>
    <td width="406"><A HREF="javascript:a('S')"> Swift</a></td>
  </tr>
  <tr> 
    <td width=32 > 
      <div align="center"><b>R</b></div>
    </td>
    <td ><A HREF="javascript:a('R')"> Telex</a></td>
  </tr>
  <tr> 
    <td width=32 > 
      <div align="center"><b>I</b></div>
    </td>
    <td ><A HREF="javascript:a('I')"> Internal/External</a></td>
  </tr>
</table>
<P align="left"> </P>
</BODY>
</HTML>
