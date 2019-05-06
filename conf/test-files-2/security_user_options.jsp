<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>User Reports Details</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<%@ page import = "java.io.*,java.net.*,datapro.eibs.sockets.*,datapro.eibs.beans.*,datapro.eibs.security.beans.*,datapro.eibs.master.*,java.math.*" %>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<link rel="stylesheet" href="<%=request.getContextPath()%>/pages/styles/optionList.css" type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/pages/style.css" type="text/css">

<jsp:useBean id= "userid" class= "java.lang.String" scope="session" />
<jsp:useBean id= "outstr" class= "java.lang.String" scope="session" />
<jsp:useBean id= "hiddenFields" class= "java.lang.String" scope="session" />
<jsp:useBean id= "message" class= "java.lang.String" scope="session" />
<jsp:useBean id= "tableName" class= "java.lang.String" scope="session" />

<BODY onLoad="buildTree(<%= tableName %>,0);">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSUserMenuProfile">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="20">
<INPUT TYPE=HIDDEN NAME="userid" VALUE="<%= userid %>">
<INPUT TYPE=HIDDEN NAME="tableName" VALUE="<%= tableName %>">
<%= hiddenFields %>
	<table class="tableinfo">
		<%if(!message.equalsIgnoreCase("")){%>
		<tr><td align="center" class="message"> <%=message %> </td></tr>
		<% session.setAttribute("message","");}%>
		<tr><td>
			<table id="headTable" width="100%">
				<tr id="trdark">
				<th align="center" nowrap><%=userid %></th>
				</tr>
			</table>
		</td></tr>
		<tr><td>
		    <table name="tree1" id="<%=tableName %>"  border="0" cellspacing="0" cellpadding="0" width="100%">
			</table>
		</td></tr>
		<tr height=10><td>&nbsp;</td></tr>
	</table>
   <table cellspacing="0" cellpadding="2" class="tbenter" width="100%" align="center">
		<tr><td align="center">&nbsp;</td></tr>
		<tr bgcolor="#FFFFFF"><td align="center"><input id="EIBSBTN" type="button" name="Submit" value="Submit" onClick="checkSubmit(<%=tableName %>);document.forms[0].submit();"></td></tr>
    </table>
</FORM>
<%=outstr %>

</BODY>
</HTML>
