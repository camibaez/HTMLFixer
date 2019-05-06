
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<TITLE>Rate Revision Cycle</TITLE>
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
    <td width=30 > 
      <div align="center"><b>NNN</b></div>
    </td>
    <td ><A HREF="javascript:a('NNN')"> Revision on NNN Days Period</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>PMT</b></div>
    </td>
    <td ><A HREF="javascript:a('PMT')"> Revision on Payment Date</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>MAN</b></div>
    </td>
    <td ><A HREF="javascript:a('MAN')"> Revision by Department</a></td>
  </tr>
</table>

</BODY>
</HTML>
