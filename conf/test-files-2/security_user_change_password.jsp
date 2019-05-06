<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>User Reports Details</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<%@ page import = "java.io.*,java.net.*,datapro.eibs.sockets.*,datapro.eibs.beans.*,datapro.eibs.security.beans.*,datapro.eibs.master.*,java.math.*" %>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<link rel="stylesheet" href="<%=request.getContextPath()%>/pages/style.css" type="text/css">
<jsp:useBean id= "message" class= "java.lang.String" scope="session" />
<jsp:useBean id= "userid" class= "java.lang.String" scope="session" />

<SCRIPT language="javascript">
<!--
function checkPasswords(){
var op=document.all.op;
var p1=document.all.p1;
var p2=document.all.p2;
if(p1.value==p2.value){
	if(p1.value!=""&&op.value!="")
		return true;
	else
		alert("Password can't be blank. Please enter password again.");		
	}
else{
	alert("Passwords don't match. Please enter new password again.");
	p1.focus();
	}
return false;
}

//-->
</SCRIPT>

<BODY>
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSPassword">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="10">
<INPUT TYPE=HIDDEN NAME="PASSWORD" VALUE="">

<H3 align="center">Change Password<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="UserProfile_maint"></H3>
<hr size="4">
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
		<tr height=10><td>&nbsp;</td></tr>
		<tr><td>
			<table id="headTable" width="100%">
				<tr id="trdark"><td align="right">enter old password:</td><td align="left"><input id="op" name="oldPassword" type="password"></td></tr>
				<tr height=10><td>&nbsp;</td></tr>
				<tr id="trlight"><td align="right">enter new password:</td><td align="left"><input id="p1" name="newPassword1" type="password"></td></tr>
				<tr id="trlight"><td align="right">reenter new password:</td><td align="left"><input id="p2" name="newPassword2" type="password"></td></tr>
			</table>
		</td></tr>
	</table>
   <table cellspacing="0" cellpadding="2" class="tbenter" width="100%" align="center">
		<tr><td align="center">&nbsp;</td></tr>
		<tr bgcolor="#FFFFFF"><td align="center"><input id="EIBSBTN" type="button" name="Submit" value="Submit" onClick="if(checkPasswords())document.forms[0].submit();"></td></tr>
    </table>
</FORM>
</BODY>
</HTML>
