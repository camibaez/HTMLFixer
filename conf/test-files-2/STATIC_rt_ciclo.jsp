<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>Frequency</TITLE>
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
<h4> Weekday </h4>
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
    <td width=30 > 
      <div align="center"><b>MO</b></div>
    </td>
    <td ><A HREF="javascript:a('MO')"> Monday</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>TU</b></div>
    </td>
    <td ><A HREF="javascript:a('TU')"> Tuesday</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>WE</b></div>
    </td>
    <td ><a href="javascript:a('WE')">Wednesday</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>TH</b></div>
    </td>
    <td ><a href="javascript:a('TH')">Thursday</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>FR</b></div>
    </td>
    <td ><a href="javascript:a('FR')">Friday</a></td>
  </tr>
  </table>
<br>
<table align=center id="tbhelp">
  <tr> 
    <th align=left > Day of the Month 
      <hr>
    </th>
  </tr>
  <tr> 
    <td>(01...31), where the numbers mean the days of the month, this selection 
      will be valid only if Monthly Frequency had been selected.</td>
  </tr>
  <tr> 
    <td height="17">&nbsp;</td>
  </tr>
</table>
<P> </P>
</BODY>
</HTML>
