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
<H4>Interest Accrual Flag</H4>
<table class="tableinfo" style="width:95%" ALIGN=CENTER>
  <TR id="trdark"> 
    <TH><div align="left">Code</div></TH>
    <TH>
      <div align="left">Description</div>
    </TH>
  </TR>
  <tr> 
    <td width=30 height="18"> 
      <div align="center"><b>1</b></div>
    </td>
    <td><A HREF="javascript:a('1')"> Outstanding Principal</a></td>
  </tr>
  <tr> 
    <td width=30 height="18"> 
      <div align="center"><b>2</b></div>
    </td>
    <td><A HREF="javascript:a('2')"> Original Principal</a></td>
  </tr>
  <tr> 
    <td width=30 height="18"> 
      <div align="center"><b>3</b></div>
    </td>
    <td><A HREF="javascript:a('3')"> Outstanding Principal Less Principal Due</a></td>
  </tr>
  <tr> 
    <td width=30  height="18"> 
      <div align="center"><b>N</b></div>
    </td>
    <td><A HREF="javascript:a('N')"> None Accrual</a></td>
  </tr>
</table>
<P align="left"> </P>
</BODY>
</HTML>
