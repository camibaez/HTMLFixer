<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>Charges Frequency</TITLE>
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
<h4> Charges Frequency</h4>
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
      <div align="center"><b>M</b></div>
    </td>
    <td ><a href="javascript:a('M')">Monthly</a></td>
  </tr>
  <tr> 
    <td width=32 > 
      <div align="center"><b>Q</b></div>
    </td>
    <td ><a href="javascript:a('Q')">Quarterly</a></td>
  </tr>
  <tr> 
    <td width=32> 
      <div align="center"><b>S</b></div>
    </td>
    <td ><A HREF="javascript:a('S')"> </a><a href="javascript:a('F')">Semi - Annually 
      </a></td>
  </tr>
  <tr> 
    <td width=32 > 
      <div align="center"><b>R</b></div>
    </td>
    <td ><a href="javascript:a('R')">Rollover</a> </td>
  </tr>
</table>
<P>
</P>
</BODY>
</HTML>
