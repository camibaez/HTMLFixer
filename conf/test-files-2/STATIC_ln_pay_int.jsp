
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<TITLE>Forma de pagos en Préstamos</TITLE>
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
<h4>Loan Payments</h4>
<table class="tableinfo" style="width:95%" ALIGN=CENTER>
  <tr id="trdark">
    <td width=30 height="18" >
      <div align="left"><b>Code</b></div>
    </td>
    <td width="420">
      <div align="left"><b>Description</b></div>
    </td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>nnn</b></div>
    </td>
    <td width="420"><a href="javascript:a('')">Cycle Payments (030, 090, 180)</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>MAT</b></div>
    </td>
    <td width="420"><a href="javascript:a('MAT')">Payments at Maturity</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>SC1</b></div>
    </td>
    <td width="420"><A HREF="javascript:a('SC1')"> Payment Schedule and Extrarodinary Payments</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>SC2</b></div>
    </td>
    <td width="420"><a href="javascript:a('SC2')"> Double Amortization Schedule %</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>SC3</b></div>
    </td>
    <td width="420"><A HREF="javascript:a('SC3')">Amortization Schedule with Escrow </a></td>
  </tr>
</table>
<P>
</P>
</BODY>
</HTML>
