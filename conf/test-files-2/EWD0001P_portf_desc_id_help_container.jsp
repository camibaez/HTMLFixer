<html>
<head>
<title>Portfolio Search</title>

<!-- frames -->
</head>
<SCRIPT language="JavaScript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>)
</SCRIPT>
<frameset  rows="205,*" cols="*"> 
  <frame name="query" src="<%=request.getContextPath()%>/pages/e/EWD0001P_portf_desc_id_help_search.jsp" marginwidth=0 marginheight=0 scrolling="auto" frameborder="0">
  <frame name="results" src="<%=request.getContextPath()%>/pages/e/EWD0001P_portf_desc_id_help_blank.jsp" marginwidth="0" marginheight="0" scrolling="auto" frameborder="0" noresize>
</frameset>
<noframes></noframes>








</html>



