<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>

<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="JavaScript">

function enterAction(code,desc,id) {
	var form = top.top.opener.document.forms[0];
	
	if(top.top.opener.fieldDesc !== ""){
		form[top.top.opener.fieldDesc].value = desc;
	 	if (form[top.top.opener.fieldDesc].type !== "hidden") {
			form[top.top.opener.fieldDesc].focus();
		}
		form[top.top.opener.fieldDesc].select();
	}
	if(top.top.opener.fieldId !== ""){
		form[top.top.opener.fieldId ].value = id;
		if (form[top.top.opener.fieldId].type !== "hidden") {
			form[top.top.opener.fieldId].focus();
		}
		form[top.top.opener.fieldId].select();
	}
	if(top.top.opener.fieldName !== ""){
		form[top.top.opener.fieldName].value = code;
		if (form[top.top.opener.fieldName].type !== "hidden"){
			form[top.top.opener.fieldName].focus();
		}
		form[top.top.opener.fieldName].select();
	}
	  
	top.close();
}

function enter(){
	var NameSearch = document.forms[0].NameSearch.value;
	var FromRecord = 0
	var CusType = top.top.opener.fieldAux1;

	if (NameSearch.length < 1){
		NameSearch=".";
	}
	
	for(var i = 0; i < document.forms[0].Type.length; i++) {
			if (document.forms[0].Type[i].checked){
			var Type = document.forms[0].Type[i].value
			}
 	}

//	parent.results.window.location.href="<%=request.getContextPath()%>/pages/e/MISC_search_wait.jsp?URL='<%=request.getContextPath()%>/pages/e/EWD0001_client_desc_id_help_helpmessage.jsp?NameSearch=" + NameSearch + "@Type=" + Type + "@FromRecord=" + FromRecord + "'";
    parent.results.window.location.href="<%=request.getContextPath()%>/pages/e/MISC_search_wait.jsp?URL='<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0001C?NameSearch=" + NameSearch + "@Type=" + Type + "@FromRecord=" + FromRecord + "@CusType=" + CusType + "'";
}
// ?NameSearch=" + NameSearch + "&Type=" + Type + "&FromRecord=" + FromRecord
</script>
<META name="GENERATOR" content="IBM WebSphere Studio">
</head>

<body>
<FORM Action="javascript:enter()">

<table id="TBHELP" align="center">
<tr><td nowrap>
<table border="0" bordercolor="Black" cellpadding=0 cellspacing=0><tr><td nowrap>
<table  id="TBHELP" align="center" width="140" border="0" cellspacing="0" cellpadding="0">
<tr>
<th nowrap id="THHELP">Type of Search</th>
</tr>
<tr>
<td nowrap>
<input type="radio" name="Type" value="S" checked>Short Name</td>
</tr>
<tr>
<td nowrap><input type="radio" name="Type" value="I">Identify</td>
</tr>
<tr>
<td nowrap><input type="radio" name="Type" value="D">Long Identify</td>
</tr>
<tr>
<td nowrap><input type="radio" name="Type" value="W">By Words</td>
</tr>
</table>
</td></tr>

</table>

</td><td nowrap>
<input type="text" name="NameSearch"  size=25 maxlength="30">
        &nbsp;&nbsp;<img src="<%=request.getContextPath()%>/images/search1.gif" onClick="enter()" width="25" height="20"> 
      </td>
    </tr>
</table>
  <hr align="center" width="90%">
</form>
<script language="JavaScript">
  document.forms[0].NameSearch.focus();
</script>

</body>
</html>
