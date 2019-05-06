<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>

<head>
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="JavaScript">
function enter(){
var NameSearch = document.forms[0].NameSearch.value
var FromRecord = 0
	if (NameSearch.length > 0){
		for(var i = 0; i < document.forms[0].Type.length; i++) {
			if (document.forms[0].Type[i].checked){
			var Type = document.forms[0].Type[i].value
			}
 		}


    parent.results.window.location.href="<%=request.getContextPath()%>/pages/e/MISC_search_wait.jsp?URL='<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0001W?NameSearch=" + NameSearch + "@Type=" + Type + "@FromRecord=" + FromRecord + "'";

	}else{
	alert("A value must be entered into the search field")
	}
}

</script>
<TITLE></TITLE>
</head>

<body>
<FORM Action="javascript:enter()">

<table id="TBHELP" align="center">
<tr><td nowrap>
		<TABLE>
			<TBODY>
				<TR>
					<TD nowrap>
					<TABLE border="0" bordercolor="Black" cellpadding="0"
						cellspacing="0">
						<TBODY>
							<TR>
								<TD nowrap>
								<TABLE id="TBHELP0" align="center" width="140" border="0"
									cellspacing="0" cellpadding="0">
									<TBODY>
										<TR>
											<TH nowrap id="THHELP" colspan="2">SEARCH CRITERIA</TH>
										</TR>
										<TR>
											<TD nowrap><B>Customers</B></TD>
											<TD nowrap><INPUT type="radio" name="Type" value="S" checked> Short
											Name</TD>
										</TR>
										<TR>
											<TH nowrap></TH>
											<TD nowrap><INPUT type="radio" name="Type" value="I">
											Identification</TD>
										</TR>
										<TR>
											<TD nowrap></TD>
											<TD nowrap><INPUT type="radio" name="Type" value="W"> By Word</TD>
										</TR>
										<TR>
											<TD nowrap height="9"></TD>
											<TD nowrap height="9"></TD>
										</TR>
										<TR>
											<TD nowrap height="31"><B>Portfolios</B></TD>
											<TD nowrap height="31"><INPUT type="radio" name="Type"
												value="8" > Short Name</TD>
										</TR>
										<TR>
											<TD nowrap></TD>
											<TD nowrap><INPUT type="radio" name="Type" value="6">
											Identification</TD>
										</TR>
										<TR>
											<TD nowrap></TD>
											<TD nowrap><INPUT type="radio" name="Type" value="9"> By Word</TD>
										</TR>
									</TBODY>
								</TABLE>
								</TD>
							</TR>
						</TBODY>
					</TABLE>

					</TD>
					<TD nowrap><INPUT type="text" name="NameSearch" size="14">
					&nbsp;&nbsp;<IMG
						src="<%=request.getContextPath()%>/images/search1.gif"
						onclick="enter()" width="25" height="21"></TD>
				</TR>
			</TBODY>
		</TABLE>
		</td><td nowrap></td></tr></table>
<hr>

<script language="JavaScript">
  document.forms[0].NameSearch.focus();
</script>

</form>
</body>
</html>
