<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>User Reports Details</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<%@ page import = "java.io.*,java.net.*,datapro.eibs.sockets.*,datapro.eibs.beans.*,datapro.eibs.security.beans.*,datapro.eibs.master.*,java.math.*" %>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<link rel="stylesheet" href="<%=request.getContextPath()%>/pages/styles/menuList.css" type="text/css">

<jsp:useBean id= "menuUserId" class= "java.lang.String" scope="session" />
<jsp:useBean id= "menuOutStr" class= "java.lang.String" scope="session" />
<jsp:useBean id= "menuTableName" class= "java.lang.String" scope="session" />

<BODY onLoad="buildTree(<%=menuTableName%>,0);">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSUserMenuProfile" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="20">
<INPUT TYPE=HIDDEN NAME="userid" VALUE="<%= menuUserId %>">
<INPUT TYPE=HIDDEN NAME="tableName" VALUE="<%= menuTableName %>">
   <table cellspacing="0" cellpadding="2" class="subtitle" width="100%" align="center">
		<tr><td align="center"> <%=menuUserId %> </td></tr>
    </table>
   <table cellspacing="0" width="100%">
		<tr><td height="10">&nbsp</td></tr>
    </table>
    <table name="tree1" id="<%= menuTableName %>" border="0" cellspacing="0" cellpadding="0" width="100%" class="tableStyle">
	</table>
</FORM>
<%= menuOutStr %>

</BODY>
</HTML>
