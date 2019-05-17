<html>
<head>
<title>Offering Search</title>

<!-- frames -->
</head>
<SCRIPT language="JavaScript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>)
</SCRIPT>
<frameset  rows="99,573*" cols="*" onLoad="if (self != top) top.location = self.location"> 
  <frame name="query" src="<%=request.getContextPath()%>/pages/e/EWD0150_client_help_search.jsp" marginwidth=0 marginheight=0 scrolling="no" frameborder="0" border = "0">
  <frame name="results" src="<%=request.getContextPath()%>/pages/e/EWD0150_client_help_helpmessage.jsp" marginwidth="0" marginheight="0" scrolling="auto" frameborder="0" border = "0" noresize>
</frameset>
<noframes></noframes>








</html>



