<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>Types</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script language="javascript">
//<!-- Hide from old browsers
function a(code) {
 top.opener.document.forms[0][top.opener.fieldName].value = code;
 top.opener.document.forms[0][top.opener.fieldName].focus();
 top.close();
 }
//-->
</script>
</HEAD>
<BODY>

<h4>Rate Revision Cycle</h4>
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
    <td width=60  > 
      <div align="center"><b>NNN = </b></div>
    </td>
    <td ><A HREF="javascript:a('NNN')"> Revision on NNN Days Period</a></td>
  </tr>
    <tr> 
    <td width=60  > 
      <div align="center"><b>PMT = </b></div>
    </td>
    <td ><a href="javascript:a('PMT')">Revision on Payment Day</a></td>
  </tr>
    <tr> 
    <td width=60  > 
      <div align="center"><b>MAN = </b></div>
    </td>
    <td ><a href="javascript:a('MAN')">Revision by Department</a></td>
  </tr>
</table>
<P>
</P>
</BODY>
</HTML>
