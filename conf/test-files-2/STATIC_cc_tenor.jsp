<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>Tenor</TITLE>
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
<H4>Tenor</H4>
<table class="tableinfo" style="width:95%" ALIGN=CENTER>
  <TR id="trdark"> 
    <TH><div align="left">Code</div></TH>
    <TH>
      <div align="left">Description</div>
    </TH>
  </TR>
  <tr> 
    <td width=30 height="18"> 
      <div align="center"><b>S</b></div>
    </td>
    <td><A HREF="javascript:a('S')"> Sight</a></td>
  </tr>
  <tr> 
    <td width=30 height="18"> 
      <div align="center"><b>A</b></div>
    </td>
    <td><A HREF="javascript:a('A')"> Acceptance</a></td>
  </tr>
  <tr> 
    <td width=30 height="18"> 
      <div align="center"><b>M</b></div>
    </td>
    <td><A HREF="javascript:a('M')"> Mixed</a></td>
  </tr>
  <tr> 
    <td width=30  height="18"> 
      <div align="center"><b>D</b></div>
    </td>
    <td><A HREF="javascript:a('D')"> Deferred Payment</a></td>
  </tr>
   <tr> 
    <td width=30  height="18"> 
      <div align="center"><b>N</b></div>
    </td>
    <td><A HREF="javascript:a(N')"> Negotiation</a></td>
  </tr>
</table>
</BODY>
</HTML>
