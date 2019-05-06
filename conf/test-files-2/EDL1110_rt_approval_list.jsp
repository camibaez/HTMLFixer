<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<TITLE>Approval Customer List</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR"
	content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">

<jsp:useBean id="appList" class="datapro.eibs.beans.JBList"
	scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"
	scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos"
	scope="session" />

<script language="Javascript1.1"
	src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="javascript">
var reason = '';
 
function goAction(op) {
	document.forms[0].action.value = op;
	document.forms[0].submit();
}
 
function goExit(){
	window.location.href="<%=request.getContextPath()%>/pages/background.jsp";
}

function getParams(param){
	document.forms[0].TBLNUM.value = param;
}
  
function showAddInfo(idxRow){
	tbAddInfo.rows[0].cells[1].innerHTML=document.forms[0]["TXTDATA"+idxRow].value;
	for ( var i=0; i<dataTable.rows.length; i++ ) {
		dataTable.rows[i].className="trnormal";
	}
	dataTable.rows[idxRow].className="trhighlight";
	adjustEquTables(headTable, dataTable, dataDiv1,1,false);
}    
</script>
</HEAD>

<%
		if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
%>

<BODY
	onload="MM_preloadImages('<%=request.getContextPath()%>/images/s/approve_over.gif','<%=request.getContextPath()%>/images/s/reject_over.gif')">
<h3 align="center">Approval Floating Rates<img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" ALT="rt_approval_list.jsp, EDL1110"></h3>
<hr size="4">

<FORM Method="post"
	Action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL1110">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2"> <INPUT TYPE=HIDDEN
	NAME="action" VALUE="A"> <INPUT TYPE=HIDDEN NAME="totalRow"
	VALUE="0"> <INPUT TYPE=HIDDEN NAME="TBLNUM"
	VALUE="<%=userPO.getHeader10()%>">

<TABLE class="tbenter">
	<TR>
		<TD ALIGN=CENTER width="25%"><a href="javascript:goAction('A')"
			id="linkApproval" onMouseOut="MM_swapImgRestore()"
			onMouseOver="MM_swapImage('Image1','','<%=request.getContextPath()%>/images/e/approve_over.gif',1)"><img
			name="Image1" alt="Aprrove" border="0"
			src="<%=request.getContextPath()%>/images/e/approve.gif"></a></TD>
		<TD ALIGN=CENTER width="25%"><a
			href="javascript:enterReason('R')" id="linkReject"
			onMouseOut="MM_swapImgRestore()"
			onMouseOver="MM_swapImage('Image2','','<%=request.getContextPath()%>/images/e/reject_over.gif',1)"><img
			name="Image2" alt="Reject" border="0"
			src="<%=request.getContextPath()%>/images/e/reject.gif"></a></TD>
		<TD ALIGN=CENTER width="25%"><a href="javascript:goAction('D')"
			id="linkDelete" onMouseOut="MM_swapImgRestore()"
			onMouseOver="MM_swapImage('Image3','','<%=request.getContextPath()%>/images/e/delete_over.gif',1)"><img
			name="Image3" alt="Delete" border="0"
			src="<%=request.getContextPath()%>/images/e/delete.gif"></a></TD>
		<TD ALIGN=CENTER width="25%"><a href="javascript:goExit()"
			onMouseOut="MM_swapImgRestore()"
			onMouseOver="MM_swapImage('Image5','','<%=request.getContextPath()%>/images/e/exit_over.gif',1)"><img
			name="Image5" border="0"
			src="<%=request.getContextPath()%>/images/e/exit.gif"></a></TD>
	</TR>
</TABLE>

<h4>Floating Rates</h4>
<TABLE id="mainTable" class="tableinfo">
	<TR>
		<TD NOWRAP valign="top" width="100%">
		<table id="headTable">
			<tr id="trdark">
				<th align=CENTER nowrap>&nbsp;</th>
				<th align=CENTER nowrap>
				<div align="center">Table</div>
				</th>
				<th align=CENTER nowrap>
				<div align="center">Description</div>
				</th>
				<th align=CENTER nowrap>Type</th>

				<th align=CENTER nowrap>
				<div align="center">Primary<br>
				Rate</div>
				</th>
				<th align=CENTER nowrap>
				<div align="center">Secondary<br>
				Rate</div>
				</th>
				<th align=CENTER nowrap>
				<div align="center">Date</div>
				</th>
			</tr>
		</table><br>
	<div id="dataDiv1" class="scbarcolor">
	<table id="dataTable">
		<%
			appList.initRow();
			int k = 1;
			while (appList.getNextRow()) {
				if (appList.getFlag().equals("")) {
					out.println(appList.getRecord());
					k++;
				}
			}
		%>
	</table>
	</div>
	</td>
	<td nowrap ALIGN="RIGHT" valign="top">
	<table id="tbAddInfoH" width="100%">
		<tr id="trdark">
			<TH ALIGN=CENTER nowrap>Basic Information</TH>
		</tr>
	</table>
	<table id="tbAddInfo">
		<tr id="trclear">
			<td align="RIGHT" valign="middle" nowrap><b>
			  Date Transfer : <br>
              Debit Account : <br>
              Currency : <br>
              Bank : <br>
              Branch : <br>
			  Beneficiary : <br>
              Batch : <br>
              User : </b></td>
			<td align="LEFT" valign="middle" nowrap class="tdaddinfo"></td>
		</tr>
	</table>
	</td>
	</tr>
</table>

<script type="text/javascript">
 document.forms[0].totalRow.value="<%=k%>";
     function resizeDoc() {
       divResize(true);
     adjustEquTables(headTable, dataTable, dataDiv1,1,false);
      }
     showChecked("ACCNUM");
     resizeDoc();
     tbAddInfoH.rows[0].cells[0].height = headTable.rows[0].cells[0].clientHeight;
     window.onresize=resizeDoc;
     
</script></form>
</body>
</html>
