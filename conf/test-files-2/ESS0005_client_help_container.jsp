<html>
<head>
<title>B�squeda Cliente</title>

<!-- frames -->
</head>
<SCRIPT language="JavaScript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>)
</SCRIPT>
<frameset  rows="160,*" cols="*"> 
  <frame name="query" src="<%=request.getContextPath()%>/pages/s/ESS0005_client_help_search.jsp" marginwidth=0 marginheight=0 scrolling="auto" frameborder="0">
  <frame name="results" src="<%=request.getContextPath()%>/pages/s/ESS0005_client_help_blank.jsp" marginwidth="0" marginheight="0" scrolling="auto" frameborder="0" noresize>
</frameset>
<noframes></noframes>








</html>



