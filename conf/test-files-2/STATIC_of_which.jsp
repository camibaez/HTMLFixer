
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<TITLE>"Of Which" Items</TITLE>
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
<h4>"Of Which" Items </h4>
<table class="tableinfo" style="width:95%" ALIGN=CENTER>
  <tr id="trdark">
    <td >
      <p>BC & BC (SA)</p>
	  <p>7 = Item selected for column 1-5 is related to a FOREIGN OFFICIAL INST </p> 
	  <p>8 = Item selected for column 1-5 is also related to OWN FGN OFFICE</p> 
	  <p>9 = Item selected for column 1-5, has been taken under a REPO AGREEMENT and does not refer to FGN OFFICIAL INT nor OWN FGN OFFICES </p> 
	  <p>F = Item selected is also related to FGN OFFICIAL INST and has been taken under a Resale Agreement </p>
      <p>O = Item reported in column 1-5 is related to OWN FGN OFFICE and has been taken under a Resale Agreement</p>
      <br>
      <p>BL-1 & BL-1 (SA)</p>
      <p>8 = In addition to being reported in column 1-7, item also refers OWN FGN OFFICES</p>
      <p>9 = Item reported in column 1-7 also reported to a REPO</p>
      <p>O = In addition to being reported in 1-7, the item refers to OWN FGN</p>
    </td>
    
</table>
<P align=center>
	<input id="EIBSBTN" type=button value="Close" onclick="top.close()">
</P>
</BODY>
</HTML>
