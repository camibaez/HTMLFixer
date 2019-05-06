
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<TITLE>Forma de Uso</TITLE>
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
<h4>Use Form</h4> 
<table class="tableinfo" style="width:95%" ALIGN=CENTER>
  <tr id="trdark">
    <td width=32  height="18">
      <div align="left"><b>Code</b></div>
    </td>
    <td width="406">
      <div align="left"><b>Description</b></div>
    </td>
  </tr>
  <tr> 
    <td width=32  height="18"> 
      <div align="center"><b>1</b></div>
    </td>
    <td width="406"><A HREF="javascript:a('1')"> General</a></td>
  </tr>
  <tr> 
    <td width=32  height="18"> 
      <div align="center"><b>2</b></div>
    </td>
    <td width="406"><A HREF="javascript:a('2')"> ATM </a></td>
  </tr>
  <tr> 
    <td width=32  height="18"> 
      <div align="center"><b>3</b></div>
    </td>
    <td width="406"><A HREF="javascript:a('3')"> Domestic </a></td>
  </tr>
</table>
<P align="left"> </P>
</BODY>
</HTML>
