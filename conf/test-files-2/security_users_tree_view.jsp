<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>User List</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<%@ page import = "java.io.*,java.net.*,datapro.eibs.sockets.*,datapro.eibs.beans.*,datapro.eibs.security.beans.*,datapro.eibs.master.*,java.math.*" %>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<link rel="stylesheet" href="<%=request.getContextPath()%>/pages/style.css" type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/pages/styles/userList.css" type="text/css">


<jsp:useBean id= "userOutStr" class= "java.lang.String" scope="session" />
<jsp:useBean id= "userTableName" class= "java.lang.String" scope="session" />
<jsp:useBean id= "userListMessage" class= "java.lang.String" scope="session" />
<jsp:useBean id= "lstUsr" class= "java.lang.String" scope="session" />
<jsp:useBean id= "lstGrp" class= "java.lang.String" scope="session" />

<script language="javascript">
<!--
function swapImage(imgName,fileName){
	eval("document.all."+imgName+".src='"+fileName+"'");
}
function hideAllDivs(){
	document.all.data1.value="";
	document.all.data2.value="";
	document.all.f1.value="";
	document.all.f2.selectedIndex=0;
	document.all.s2.checked=false;
	document.all.f3.value="";
	document.all.s3.selectedIndex=0;
	document.all.f4.selectedIndex=0;
	document.all.f5.selectedIndex=0;
	document.all.s5.selectedIndex=0;
	document.all.f6.selectedIndex=0;
	document.all.s6.selectedIndex=0;
		
	document.all.newGroup.style.display="none";
	document.all.deleteGroup.style.display="none";
	document.all.newUser.style.display="none";
	document.all.deleteUser.style.display="none";
	document.all.moveUser.style.display="none";
	document.all.setStatus.style.display="none";
}
var groupField="";
var userField="";
function loadGroup(field){
	groupField=field;
	if(document.all.SELECTED.value!=""){
		var caption = "";
		var f = eval("document.all."+field);
		if(eval(document.all.SELECTED.value+"[8]")==null)
			caption = eval(document.all.SELECTED.value+'[1]');
		else
			caption = eval(eval(document.all.SELECTED.value+'[8]')+'[1]');
		for(var i=0;i<f.length;i++)
			if(f.options[i].value==caption){
				f.selectedIndex=i;
				break;
			}
	}
}
function loadUser(field){
	userField=field;
	if(document.all.SELECTED.value!=""){
		var caption = "";
		var f = eval("document.all."+field);
		if(eval(document.all.SELECTED.value+"[8]")!=null)
			caption = eval(document.all.SELECTED.value+'[1]');
		for(var i=0;i<f.length;i++)
			if(f.options[i].value==caption){
				f.selectedIndex=i;
				break;
			}
	}
}
var previousRow;
function select(idx){
	var row;
	var id = eval(idx+'[0]');
	if(previousRow!=null)
		previousRow.className="treeRow";
	row=eval("document.all."+id);
	previousRow = row;
	row.className="selected";
	loadUG();
}
function loadUG(){
	if(groupField!="")
		loadGroup(groupField)
	if(userField!="")
		loadUser(userField)
}

-->
</script>
<STYLE>
.selected {
  	background-color : #DAE1E8;
 	}
</STYLE>
</HEAD>

<BODY onLoad="buildTree(<%= userTableName %>,0);">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSUserMenuProfile" target="_parent">
<INPUT TYPE=HIDDEN NAME="SCREEN" value="10">
<INPUT TYPE=HIDDEN NAME="tableName" value="<%= userTableName %>">
<INPUT TYPE=HIDDEN NAME="SELECTED" value="">
<INPUT TYPE=HIDDEN NAME="data1" value="">
<INPUT TYPE=HIDDEN NAME="data2" value="">

	<table class="tableinfo" width="100%">
		<%if(!userListMessage.equalsIgnoreCase("")){%>
		<tr><td align="center" class="message"> <%=userListMessage %> </td></tr>
		<% session.setAttribute("userListMessage","");}%>
		<tr><td>
			<table id="headTable" width="100%">
				<tr id="trdark"><th align="center" nowrap>USER LIST</th></tr>
			</table>
		</td></tr>
		<tr><td>
		   <table cellspacing="0" cellpadding="1" width="100%" align="center">
					<tr>
						<td align="center">
							<a href="#" onClick="hideAllDivs();document.all.newGroup.style.display='block';document.all.f1.focus();" onMouseOut="swapImage('Image1','<%=request.getContextPath()%>/images/useroptions/useroption1up.gif')" onMouseOver="swapImage('Image1','<%=request.getContextPath()%>/images/useroptions/useroption1down.gif')"><img id="Image1" alt="new group" border="0" src="<%=request.getContextPath()%>/images/useroptions/useroption1up.gif" width="28" height="34"></a> 
						</td>
						<td align="center">
							<a href="#" onClick="hideAllDivs();document.all.deleteGroup.style.display='block';loadGroup('f2');document.all.f2.focus();" onMouseOut="swapImage('Image2','<%=request.getContextPath()%>/images/useroptions/useroption2up.gif')" onMouseOver="swapImage('Image2','<%=request.getContextPath()%>/images/useroptions/useroption2down.gif')"><img id="Image2" alt="delete group" border="0" src="<%=request.getContextPath()%>/images/useroptions/useroption2up.gif" width="28" height="34"></a> 
						</td>
						<td align="center">
							<a href="#" onClick="hideAllDivs();document.all.newUser.style.display='block';loadGroup('s3');document.all.f3.focus();" onMouseOut="swapImage('Image3','<%=request.getContextPath()%>/images/useroptions/useroption3up.gif')" onMouseOver="swapImage('Image3','<%=request.getContextPath()%>/images/useroptions/useroption3down.gif')"><img id="Image3" alt="new user" border="0" src="<%=request.getContextPath()%>/images/useroptions/useroption3up.gif" width="28" height="34"></a> 
						</td>
						<td align="center">
							<a href="#" onClick="hideAllDivs();document.all.deleteUser.style.display='block';loadUser('f4');document.all.f4.focus();" onMouseOut="swapImage('Image4','<%=request.getContextPath()%>/images/useroptions/useroption4up.gif')" onMouseOver="swapImage('Image4','<%=request.getContextPath()%>/images/useroptions/useroption4down.gif')"><img id="Image4" alt="delete user" border="0" src="<%=request.getContextPath()%>/images/useroptions/useroption4up.gif" width="28" height="34"></a> 
						</td>
						<td align="center">
							<a href="#" onClick="hideAllDivs();document.all.moveUser.style.display='block';loadUser('f5');loadGroup('s5');document.all.f5.focus();" onMouseOut="swapImage('Image5','<%=request.getContextPath()%>/images/useroptions/useroption5up.gif')" onMouseOver="swapImage('Image5','<%=request.getContextPath()%>/images/useroptions/useroption5down.gif')"><img id="Image5" alt="move user" border="0" src="<%=request.getContextPath()%>/images/useroptions/useroption5up.gif" width="28" height="34"></a> 
						</td>
						<td align="center">
							<a href="#" onClick="hideAllDivs();document.all.setStatus.style.display='block';loadUser('f6');document.all.f6.focus();" onMouseOut="swapImage('Image6','<%=request.getContextPath()%>/images/useroptions/useroption6up.gif')" onMouseOver="swapImage('Image6','<%=request.getContextPath()%>/images/useroptions/useroption6down.gif')"><img id="Image6" alt="set status" border="0" src="<%=request.getContextPath()%>/images/useroptions/useroption6up.gif" width="28" height="34"></a> 
						</td>
					</tr>
		    </table>
		</td></tr>
		<tr><td>
			<table width="100%" cellpadding="0" cellspacing="0">
			<tr><td>
			<div id="newGroup" style="display:none">
			   <table cellspacing="0" width="100%">
					<tr bgcolor="#DAE1E8"><td align="right"><a href="#" onClick="hideAllDivs();" onMouseOut="swapImage('cerrar1','<%=request.getContextPath()%>/images/useroptions/cerrarup.gif')" onMouseOver="swapImage('cerrar1','<%=request.getContextPath()%>/images/useroptions/cerrardown.gif')"><span class="close">close&nbsp;</span><img align="bottom" id="cerrar1" alt="close" border="0" src="<%=request.getContextPath()%>/images/useroptions/cerrarup.gif" width="13" height="13"></a></td></tr>
					<tr><td class="text">new group:</td></tr>
					<tr><td style="white-space:nowrap">
					<input id="f1" type="text" class="text" maxlength="10">
					<a href="#" onClick="document.all.SCREEN.value='101';document.all.data1.value=document.all.f1.value;document.forms[0].submit();" onMouseOut="swapImage('submit1','<%=request.getContextPath()%>/images/useroptions/submitup.gif')" onMouseOver="swapImage('submit1','<%=request.getContextPath()%>/images/useroptions/submitdown.gif')"><img align="top" id="submit1" alt="submit" border="0" src="<%=request.getContextPath()%>/images/useroptions/submitup.gif"></a></td></tr>
			    </table>
				<hr>
			</div>
			<div id="deleteGroup" style="display:none">
			   <table cellspacing="0" width="100%">
					<tr bgcolor="#DAE1E8"><td align="right"><a href="#" onClick="hideAllDivs();" onMouseOut="swapImage('cerrar2','<%=request.getContextPath()%>/images/useroptions/cerrarup.gif')" onMouseOver="swapImage('cerrar2','<%=request.getContextPath()%>/images/useroptions/cerrardown.gif')"><span class="close">close&nbsp;</span><img align="bottom" id="cerrar2" alt="close" border="0" src="<%=request.getContextPath()%>/images/useroptions/cerrarup.gif" width="13" height="13"></a></td></tr>
					<tr><td class="text">delete group:</td></tr>
					<tr><td style="white-space:nowrap">
					<select id="f2" class="text">
						<option value="">&lt;select group&gt;</option>
						<%= lstGrp %>
					</select>
					<a href="#" onClick="document.all.SCREEN.value='102';document.all.data1.value=document.all.f2.value;document.all.data2.value=document.all.s2.checked;document.forms[0].submit();" onMouseOut="swapImage('submit2','<%=request.getContextPath()%>/images/useroptions/submitup.gif')" onMouseOver="swapImage('submit2','<%=request.getContextPath()%>/images/useroptions/submitdown.gif')"><img align="top" id="submit2" alt="submit" border="0" src="<%=request.getContextPath()%>/images/useroptions/submitup.gif"></a></td></tr>
					<tr><td class="text"><input id="s2" type="checkbox">delete all users in group</td></tr>
			    </table>
				<hr>
			</div>
			<div id="newUser" style="display:none">
			   <table cellspacing="0" width="100%">
					<tr bgcolor="#DAE1E8"><td align="right"><a href="#" onClick="hideAllDivs();" onMouseOut="swapImage('cerrar3','<%=request.getContextPath()%>/images/useroptions/cerrarup.gif')" onMouseOver="swapImage('cerrar3','<%=request.getContextPath()%>/images/useroptions/cerrardown.gif')"><span class="close">close&nbsp;</span><img align="bottom" id="cerrar3" alt="close" border="0" src="<%=request.getContextPath()%>/images/useroptions/cerrarup.gif" width="13" height="13"></a></td></tr>
					<tr><td class="text">new user:</td></tr>
					<tr><td><input id="f3" type="text" class="text" maxlength="10"></td></tr>
					<tr><td class="text">in group:</td></tr>
					<tr><td style="white-space:nowrap">
					<select id="s3" class="text">
						<option value="">&lt;select group&gt;</option>
						<%= lstGrp %>
					</select>
					<a href="#" onClick="document.all.SCREEN.value='103';document.all.data1.value=document.all.f3.value;document.all.data2.value=document.all.s3.value;document.forms[0].submit();" onMouseOut="swapImage('submit3','<%=request.getContextPath()%>/images/useroptions/submitup.gif')" onMouseOver="swapImage('submit3','<%=request.getContextPath()%>/images/useroptions/submitdown.gif')"><img align="top" id="submit3" alt="submit" border="0" src="<%=request.getContextPath()%>/images/useroptions/submitup.gif"></a></td></tr>
			    </table>
				<hr>
			</div>
			<div id="deleteUser" style="display:none">
			   <table cellspacing="0" width="100%">
					<tr bgcolor="#DAE1E8"><td align="right"><a href="#" onClick="hideAllDivs();" onMouseOut="swapImage('cerrar4','<%=request.getContextPath()%>/images/useroptions/cerrarup.gif')" onMouseOver="swapImage('cerrar4','<%=request.getContextPath()%>/images/useroptions/cerrardown.gif')"><span class="close">close&nbsp;</span><img align="bottom" id="cerrar4" alt="close" border="0" src="<%=request.getContextPath()%>/images/useroptions/cerrarup.gif" width="13" height="13"></a></td></tr>
					<tr><td class="text">delete user:</td></tr>
					<tr><td style="white-space:nowrap">
					<select id="f4" class="text">
						<option value="">&lt;select user&gt;</option>
						<%= lstUsr %>
					</select>
					<a href="#" onClick="document.all.SCREEN.value='104';document.all.data1.value=document.all.f4.value;document.forms[0].submit();" onMouseOut="swapImage('submit4','<%=request.getContextPath()%>/images/useroptions/submitup.gif')" onMouseOver="swapImage('submit4','<%=request.getContextPath()%>/images/useroptions/submitdown.gif')"><img align="top" id="submit4" alt="submit" border="0" src="<%=request.getContextPath()%>/images/useroptions/submitup.gif"></a></td></tr>
			    </table>
				<hr>
			</div>
			<div id="moveUser" style="display:none">
			   <table cellspacing="0" width="100%">
					<tr bgcolor="#DAE1E8"><td align="right"><a href="#" onClick="hideAllDivs();" onMouseOut="swapImage('cerrar5','<%=request.getContextPath()%>/images/useroptions/cerrarup.gif')" onMouseOver="swapImage('cerrar5','<%=request.getContextPath()%>/images/useroptions/cerrardown.gif')"><span class="close">close&nbsp;</span><img align="bottom" id="cerrar5" alt="close" border="0" src="<%=request.getContextPath()%>/images/useroptions/cerrarup.gif" width="13" height="13"></a></td></tr>
					<tr><td class="text">move user:</td></tr>
					<tr><td>
					<select id="f5" class="text">
						<option value="">&lt;select user&gt;</option>
						<%= lstUsr %>
					</select>
					</td></tr>
					<tr><td class="text">to group:</td></tr>
					<tr><td style="white-space:nowrap">
					<select id="s5" class="text">
						<option value="">&lt;select group&gt;</option>
						<%= lstGrp %>
					</select>
					<a href="#" onClick="document.all.SCREEN.value='105';document.all.data1.value=document.all.f5.value;document.all.data2.value=document.all.s5.value;document.forms[0].submit();" onMouseOut="swapImage('submit5','<%=request.getContextPath()%>/images/useroptions/submitup.gif')" onMouseOver="swapImage('submit5','<%=request.getContextPath()%>/images/useroptions/submitdown.gif')"><img align="top" id="submit5" alt="submit" border="0" src="<%=request.getContextPath()%>/images/useroptions/submitup.gif"></a></td></tr>
					</td></tr>
			    </table>
				<hr>
			</div>
			<div id="setStatus" style="display:none">
			   <table cellspacing="0" width="100%">
					<tr bgcolor="#DAE1E8"><td align="right"><a href="#" onClick="hideAllDivs();" onMouseOut="swapImage('cerrar6','<%=request.getContextPath()%>/images/useroptions/cerrarup.gif')" onMouseOver="swapImage('cerrar6','<%=request.getContextPath()%>/images/useroptions/cerrardown.gif')"><span class="close">close&nbsp;</span><img align="bottom" id="cerrar6" alt="close" border="0" src="<%=request.getContextPath()%>/images/useroptions/cerrarup.gif" width="13" height="13"></a></td></tr>
					<tr><td class="text">set status of user:</td></tr>
					<tr><td>
					<select id="f6" class="text">
						<option value="">&lt;select user&gt;</option>
						<%= lstUsr %>
					</select>
					</td></tr>
					<tr><td class="text">to:</td></tr>
					<tr><td style="white-space:nowrap">
					<select id="s6" class="text">
						<option value="">&lt;select status&gt;</option>
						<option value="active">active</option>
						<option value="inactive">inactive</option>
						<option value="pending activation">pending activation</option>
					</select>
					<a href="#" onClick="document.all.SCREEN.value='106';document.all.data1.value=document.all.f6.value;document.all.data2.value=document.all.s6.value;document.forms[0].submit();" onMouseOut="swapImage('submit6','<%=request.getContextPath()%>/images/useroptions/submitup.gif')" onMouseOver="swapImage('submit6','<%=request.getContextPath()%>/images/useroptions/submitdown.gif')"><img align="top" id="submit6" alt="submit" border="0" src="<%=request.getContextPath()%>/images/useroptions/submitup.gif"></a></td></tr>
					</td></tr>
			    </table>
				<hr>
			</div>
			</td></tr>
			</table>
		</td></tr>
		<tr><td>
		    <table name="<%= userTableName %>" id="<%= userTableName %>" border="0" cellspacing="0" cellpadding="0" width="100%">
			</table>
		</td></tr>
		<tr><td>&nbsp;</td></tr>
	</table>
</FORM>
<%= userOutStr %>


</BODY>
</HTML>
