<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>

<head>
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="JavaScript">
function enterAction(code,desc,id) {
	var form = top.top.opener.document.forms[0];
	  
	if(top.top.opener.fieldName !== ""){
		form[top.top.opener.fieldName].value = code;
		if(form[top.opener.fieldName].onchange){
			form[top.opener.fieldName].onchange();
		}
	}
	if(top.top.opener.fieldDesc !== ""){
		form[top.top.opener.fieldDesc].value = desc;
		if(form[top.opener.fieldDesc].onchange){
			form[top.opener.fieldDesc].onchange();
		}
	}
  	if(top.top.opener.fieldId !== ""){
  		form[top.top.opener.fieldId ].value = id;
		if(form[top.opener.fieldId].onchange){
			form[top.opener.fieldId].onchange();
		}
  	}
  
top.close();
 }
function enter(){
var NameSearch = document.forms[0].NameSearch.value
var FromRecord = 0
	if (NameSearch.length > 0){
		for(var i = 0; i < document.forms[0].Type.length; i++) {
			if (document.forms[0].Type[i].checked){
			var Type = document.forms[0].Type[i].value
			}
 		}

    parent.results.window.location.href="<%=request.getContextPath()%>/pages/e/MISC_search_wait.jsp?URL='<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0001?NameSearch=" + NameSearch + "@Type=" + Type + "@FromRecord=" + FromRecord + "'";

	}else{
	alert("Field can not be blank");
	}
}

</script>
<TITLE></TITLE>
</head>

<body>
<FORM Action="javascript:enter()">

<table id="TBHELP" align="center">
	<tr>
		<td nowrap>
		<table border="0" bordercolor="Black" cellpadding=0 cellspacing=0>
			<tr>
				<td nowrap>
				<table id="TBHELP" align="center" width="140" border="0"
					cellspacing="0" cellpadding="0">
					<tr>
						<th nowrap id="THHELP" colspan="2">SEARCH CRITERIA</th></tr>
					<TR>
						<TD nowrap><B>Customers</B></TD>
						<TD nowrap><INPUT type="radio" name="Type" value="S" checked> Short Name</TD>
					</TR>
					<TR>
						<TH nowrap></TH>
						<TD nowrap><INPUT type="radio" name="Type" value="I">
						Identification</TD>
					</TR>
					<tr>
						<td nowrap></td>
						<TD nowrap><INPUT type="radio" name="Type" value="W"> By Word</TD>
					</tr>
					<TR>
						<TD nowrap height="9"></TD>
						<TD nowrap height="9"></TD>
					</TR>
					<tr>
						<td nowrap height="31"><B>Portfolios</B></td>
						<TD nowrap height="31"><INPUT type="radio" name="Type" value="8" >
						Short Name</TD>
					</tr>
					<tr>
						<td nowrap></td>
						<TD nowrap><INPUT type="radio" name="Type" value="6">
						Identification</TD>
					</tr>
					<TR>
						<TD nowrap></TD>
						<TD nowrap><INPUT type="radio" name="Type" value="9"> By Word</TD>
					</TR>
				</table>
				</td>
			</tr>
		</table>

		</td>
		<td nowrap><input type="text" name="NameSearch" size=14> &nbsp;&nbsp;<img
			src="<%=request.getContextPath()%>/images/search1.gif"
			onClick="enter()" width="25" height="21"></td>
	</tr>
</table>
<hr>

<script language="JavaScript">
  document.forms[0].NameSearch.focus();
</script>

</form>
</body>
</html>
