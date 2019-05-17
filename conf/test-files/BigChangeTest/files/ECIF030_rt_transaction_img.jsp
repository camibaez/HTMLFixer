<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Transaction Image Viewer</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">

<SCRIPT src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"></SCRIPT>
</head>

<body bgcolor="#FFFFFF">
    <%
        String imgname;
		  try{imgname = request.getParameter("imgName");}catch(Exception e){imgname = "";}
    %>
<table width="100%" cellspacing="0" cellpadding="0" align="center">
  <tr valign="middle"> 
    <td colspan="2"> 
      <div align="center"><IMG  src="http://<%=datapro.eibs.master.JSEIBSProp.getFtpHost()%><%=request.getContextPath()%>/ftp/eibsimage/data/<%=imgname%><%=datapro.eibs.master.JSEIBSProp.getImgExt()%>" border="0" align="middle"> 
      </div>
    
  </tr>
</table>

</body>
</html>
