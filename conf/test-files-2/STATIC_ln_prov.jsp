<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>Interest Accrual Flag</TITLE>
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

<h4> Interest Accrual Flag</h4>
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
    <td width=30  > 
      <div align="center"><b>1</b></div>
    </td>
    <td ><a href="javascript:a('1')">Outstanding Principal</a></td>
  </tr>
  <tr> 
    <td width=30  > 
      <div align="center"><b>2</b></div>
    </td>
    <td ><a href="javascript:a('2')">Original Principal</a></td>
  </tr>
  <tr> 
    <td width=30  > 
      <div align="center"><b>3</b></div>
    </td>
    <td ><A HREF="javascript:a('3')"> Outstanding Principal Less Principal 
      Due </a></td>
  </tr>
  <tr> 
    <td width=30  > 
      <div align="center"><b>N</b></div>
    </td>
    <td ><A HREF="javascript:a('N')">No Accrual</a></td>
  </tr>
</table>
<P>
</P>
</BODY>
</HTML>
