<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>

<head>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<style>
TH {
  background: #FFFFFF;
}
</style>
<script language="JavaScript">
function enter() {
	parent.results.window.location.href="<%=request.getContextPath()%>/pages/e/MISC_search_wait.jsp?URL='<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0151?Process=P'";
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
      <td align="center">Please select the product type</td>
    </tr>
  </table>
  
<script language="JavaScript">
  	enter();
</script>
  
</form>
</body>
</html>
