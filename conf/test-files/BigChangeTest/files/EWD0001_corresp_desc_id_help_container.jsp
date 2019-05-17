<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Customer Search</title>

<!-- frames -->
</head>
<SCRIPT language="JavaScript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>)
</SCRIPT>
<frameset  rows="105,*" cols="*" BORDER=0>                       
  <frame name="query" src="<%=request.getContextPath()%>/pages/e/EWD0001_coresp_desc_id_help_search.jsp" marginwidth=0 marginheight=0 scrolling="auto" frameborder="0">
  <frame name="results" src="<%=request.getContextPath()%>/pages/e/EWD0001_client_desc_id_help_blank.jsp" marginwidth="0" marginheight="0" scrolling="auto" frameborder="0" noresize>
</frameset>
</html>
