
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<TITLE>Special Control Parameters</TITLE>
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
<h4>Stand-by Letters of Credit Commission Payment Cycle</h4>
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
      <div align="center"><b>Y</b></div>
    </td>
    <td width="420"><a href="javascript:a('Y')">
    	Will be Computed and Charged to the Customer in-advance by Periods</a>
    </td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>N</b></div>
    </td>
    <td width="420"><a href="javascript:a('N')">
		Will be Computed For The Whole Life of the L/C and Cherged to the Customer <br>
		Only Once</a>
	</td>
  </tr> 
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>Q</b></div>
    </td>
    <td width="420"><a href="javascript:a('Q')">
		Will be Computed and Charged to the Customer in-advance by Calendar quarters</a>
	</td>
  </tr>   
</table>
<P>
</P>
</BODY>
</HTML>
