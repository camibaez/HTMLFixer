<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<jsp:useBean id= "chkList" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<TITLE>
Image Viewer
</TITLE>
</HEAD>
<BODY>
<SCRIPT language="javascript">
	 <%
     int row = Integer.parseInt(request.getParameter("ROW"));
     chkList.setCurrentRow(row);
     String number = chkList.getRecord(0);
     %>
     window.location.href = "<%=request.getContextPath()%>/pages/e/MISC_search_wait.jsp?URL='<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=200@Type=A@DocType=SC@Number=<%=number%>'";
	
</SCRIPT>
</BODY>
</HTML>
