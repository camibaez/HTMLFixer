<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>

<head>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT> 
 <script src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"></script>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>
<style>
TH {
  background: #FFFFFF;
}
</style>
<script language="JavaScript">
function enter(){
	var AppCode = top.opener.AppCode;
	var ProductBank = top.opener.ProductBank;
	var srhProduct = document.forms[0].srhProduct.value;

	parent.results.window.location.href="<%=request.getContextPath()%>/pages/e/MISC_search_wait.jsp?URL='<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0008?AppCode=" + AppCode +"@ProductBank=" + ProductBank + "@srhProduct=" + srhProduct +  "'";
}

builtHPopUp();

function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
}

</script>
</head>

<body>
<FORM Action="javascript:enter()">
  <table id="tbhelp" align="center" width="556" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td align="center"><b>Products Search</b></td>
    </tr>
    <tr>
      <td align="center">&nbsp;</td>
    </tr>
    <tr> 
      <td align="center">Please select the Product Type :
		<input type="text" name="srhProduct" size="5" maxlength="4" oncontextmenu="showPopUp(codeDescCNOFC,'srhProduct','','','srhProduct1','','04')" >
        <input type="HIDDEN" name="srhProduct1" size="5" maxlength="4" >
        <img src="<%=request.getContextPath()%>/images/search1.gif" onClick="enter()" width="25" height="21"></td>
    </tr>
  </table>
  
<script language="JavaScript">
  document.forms[0].srhProduct.focus();
</script>
  
</form>
</body>
</html>
