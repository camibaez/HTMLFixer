<html>
<head>
<title>Instrument Search</title>

<!-- frames -->
</head>
<SCRIPT language="JavaScript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>)
</SCRIPT>
<frameset  rows="113,420*" cols="*"> 
  <frame name="query" src="<%=request.getContextPath()%>/pages/e/EWD0308I_inst_help_search.jsp" marginwidth=0 marginheight=0 scrolling="no" frameborder="0">
  <frame name="results" src="<%=request.getContextPath()%>/pages/e/EWD0308I_inst_help_blank.jsp" marginwidth="0" marginheight="0" scrolling="auto" frameborder="0" noresize>
</frameset>
<noframes></noframes>








</html>



