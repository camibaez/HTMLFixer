<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@page import="com.datapro.generic.beanutil.DynamicDTO"%>
<%@page import="datapro.eibs.reports.ReportsData"%>
<%@page import="com.datapro.eibs.constants.Reports"%>
<%@page import="com.datapro.eibs.constants.EOD"%>
<%@page import="datapro.eibs.reports.ReportsHeader"%>
<%@page import="datapro.eibs.reports.ReportsDetail"%>
<%@page import="java.util.Collections"%><HTML>
<%@page import="java.util.HashMap"%>
<HEAD>
<TITLE>User Reports Details</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<%@ page import = "java.io.*,java.net.*,datapro.eibs.sockets.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*" %>
<LINK HREF="<%=request.getContextPath()%>/pages/style.css" REL="stylesheet">
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript" src="<%=request.getContextPath()%>/pages/e/javascripts/Ajax.js"></script>

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "reportsHeader" class= "datapro.eibs.reports.ReportsHeader"  scope="session" />
<jsp:useBean id= "modulesList" class= "datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id= "reportsList" class= "datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id= "reportsSelection" class= "datapro.eibs.beans.JBObjList" scope="session" />

<%
	HashMap reportsModules = Reports.REPORTS_MODULES;
 	modulesList.initRow();
	while (modulesList.getNextRow()){
		ReportsDetail selectItem = (ReportsDetail)modulesList.getRecord();
		String description = (String)reportsModules.get(selectItem.getIBSMOD());
		selectItem.setIBSDSC(description != null ? description : selectItem.getIBSMOD()) ;
	}
	Collections.sort(modulesList);
%>

<script language="javascript">

function openFile(nameOfFile) {
	<%	if(false){ %>
	var pg = "<%=JSEIBSProp.getEODPDFURL()%>/" + nameOfFile;
	<% 	} else { %>
	var pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSPDFParserSend?FORMAT=pdf&REPNAME=" + nameOfFile ;
	<% 	} %>
	CenterWindow(pg,600,500,2);
}

function openCSVFile(nameOfFile) {
	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSPDFParserSend?REPNAME=" + nameOfFile;
	CenterWindow(pg,600,500,2);
}
 
function reqReports() {
<% if(reportsHeader.isHistory()){ %>
	if(activateReportsDiv()){
		var form = document.forms[0];
		GetXMLResponse(form.action+"?SCREEN=101&IBSMOD="+form.IBSMOD.value, selectCallback, false);
		//return;
	}
<%  } %>
	applyFilters();
}

function applyFilters() {
	document.forms[0].submit();
}

function activateReportsDiv(){
	if(document.forms[0].IBSMOD.value == '%'){
		document.getElementById("reportsLabel").style.display='none';
		document.getElementById("reportsDiv").style.display='none';
		return false;
	} else {
		document.getElementById("reportsLabel").style.display='block';
		document.getElementById("reportsDiv").style.display='block';
		return true;
	}
}

</script>

<%	
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
%>
</HEAD>
<BODY>
<h3 align="center">End Of Day Reports<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="user_reports_list.jsp, EODPDF"></h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.reports.JSEODReports" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="<%= reportsHeader.isHistory() ? "10" : "11"%>">
<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">

<table cellspacing="0" cellpadding="2" width="100%" border="1">
	<tr>
    	<td nowrap> 
        	<table cellspacing="0" cellpadding="2" class="tbhead" width="100%" align="center">
        		<% if(reportsHeader.isHistory() || reportsHeader.isReprocess()){ %>
			   <tr id="trdark"> 
			            <td nowrap width="20%" > 
			              <div align="right"><b>From :</b></div>
			            </td>
			            <td nowrap width="20%" > 
			              <div align="left">
							<% if(currUser.getE01DTF().equals("DMY")){ %>
			              	<input type="text" name="FROMDTD" maxlength="2" size="3" value="<%= reportsHeader.getFROMDTD() %>">
			                <input type="text" name="FROMDTM" maxlength="2" size="3" value="<%= reportsHeader.getFROMDTM() %>">
							<input type="text" name="FROMDTY" maxlength="2" size="3" value="<%= reportsHeader.getFROMDTY() %>">
              				<a href="javascript:DatePicker(document.forms[0].FROMDTD,document.forms[0].FROMDTM,document.forms[0].FROMDTY)">
              				<img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
							<% } else if(currUser.getE01DTF().equals("MDY")){ %>
			              	<input type="text" name="FROMDTM" maxlength="2" size="3" value="<%= reportsHeader.getFROMDTM() %>">
			                <input type="text" name="FROMDTD" maxlength="2" size="3" value="<%= reportsHeader.getFROMDTD() %>">
							<input type="text" name="FROMDTY" maxlength="2" size="3" value="<%= reportsHeader.getFROMDTY() %>">
              				<a href="javascript:DatePicker(document.forms[0].FROMDTM,document.forms[0].FROMDTD,document.forms[0].FROMDTY)">
              				<img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
							<% } %>
			              </div>
			            </td>
				        <td nowrap width="20%" > 
    						<div align="center"><input id="EIBSBTN" type=submit name="Refrescar" value="Refrescar"></div>
			            </td>
				        <td nowrap width="20%" > 
			              <div align="right"><b>To :</b></div>
			            </td>
			            <td nowrap width="20%" > 
			              <div align="left">
							<% if(currUser.getE01DTF().equals("DMY")){ %>
			              	<input type="text" name="TODTD" maxlength="2" size="3" value="<%= reportsHeader.getTODTD() %>">
			                <input type="text" name="TODTM" maxlength="2" size="3" value="<%= reportsHeader.getTODTM() %>">
							<input type="text" name="TODTY" maxlength="2" size="3" value="<%= reportsHeader.getTODTY() %>">
              				<a href="javascript:DatePicker(document.forms[0].TODTD,document.forms[0].TODTM,document.forms[0].TODTY)">
              				<img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
              				<% } else if(currUser.getE01DTF().equals("MDY")){ %>
			              	<input type="text" name="TODTM" maxlength="2" size="3" value="<%= reportsHeader.getTODTM() %>">
			                <input type="text" name="TODTD" maxlength="2" size="3" value="<%= reportsHeader.getTODTD() %>">
							<input type="text" name="TODTY" maxlength="2" size="3" value="<%= reportsHeader.getTODTY() %>">
              				<a href="javascript:DatePicker(document.forms[0].TODTM,document.forms[0].TODTD,document.forms[0].TODTY)">
              				<img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
              				<% } %>
			              </div>
			            </td>
			    </tr>
        		<%  } %>
				<tr id="trdark"> 
					<td align=right width="20%">Module :
					</td>
					<td align=left  width="20%" colspan="2"> 
						<select id="IBSMOD" name="IBSMOD" onchange="reqReports()">
						<% modulesList.initRow();
			 				out.println("<option selected value=\"%\" >  </option>");
				            while (modulesList.getNextRow()){
								ReportsDetail selectItem = (ReportsDetail)modulesList.getRecord();
								out.println("<option " 
										+ (selectItem.getIBSMOD().equals(reportsHeader.getIBSMOD()) ? "selected " : "")
										+ "value=\"" + selectItem.getIBSMOD() + "\" " + " >"
										+ selectItem.getIBSDSC() 
										+ "</option>");

							}						
						%>
						</select>
					</td>
					<td align=right width="20%"> 
						Process Type :
					</td>
					<td align=left width="20%">
		                <select name="IBSPER" onchange="document.forms[0].submit()">
							<% if(!reportsHeader.isReprocess()){ %>
							<option value="<%= EOD.END_OF_PROCESS %>" 
		                  			<% if (!(EOD.END_OF_DAY_PROCESS.equals(reportsHeader.getIBSPER()) 
		                  					|| EOD.END_OF_MONTH_PROCESS.equals(reportsHeader.getIBSPER())
		                  					|| EOD.END_OF_YEAR_PROCESS.equals(reportsHeader.getIBSPER())
		                  					|| EOD.END_OF_YEAR_REPROCESS.equals(reportsHeader.getIBSPER())
											|| EOD.END_OF_MONTH_REPROCESS.equals(reportsHeader.getIBSPER()))) 
		                  					out.print("selected");%>><b> </b>
							</option>
							<option value="<%= EOD.END_OF_DAY_PROCESS %>" <% if (EOD.END_OF_DAY_PROCESS.equals(reportsHeader.getIBSPER())) 
		                  		out.print("selected"); %>><b>End Of Day</b></option>
							<option value="<%= EOD.END_OF_MONTH_PROCESS %>" <% if (EOD.END_OF_MONTH_PROCESS.equals(reportsHeader.getIBSPER())) 
		                  		out.print("selected"); %>><b>End Of Month</b></option>
							<% } else {%>
							<option value="<%= EOD.END_OF_MONTH_REPROCESS %>" <% if (EOD.END_OF_MONTH_REPROCESS.equals(reportsHeader.getIBSPER())) 
		                  		out.print("selected"); %>><b>Month Reprocess</b></option>
							<option value="<%= EOD.END_OF_YEAR_REPROCESS %>" <% if (EOD.END_OF_YEAR_REPROCESS.equals(reportsHeader.getIBSPER())) 
		                  		out.print("selected"); %>><b>Year Reprocess</b></option>
		                  		<% } %>
		                </select>
					</td>
					</tr>
        		<% if(reportsHeader.isHistory()){ %>
 					<tr id="trdark"> 
					<td align=right>
						<div id="reportsLabel" style="position:relative; display:none;">Report :</div>
					</td>
					<td align=left colspan=4 >
						<div id="reportsDiv" style="position:relative; display:none;">
		                <select id="EDPRPN" name="EDPRPN" onchange="applyFilters()">
						<% reportsSelection.initRow();
			 				out.println("<option selected value=\"%\" ></option>");
				            while (reportsSelection.getNextRow()){
								ReportsDetail selectItem = (ReportsDetail)reportsSelection.getRecord();
								out.println("<option " 
										+ (selectItem.getIBSRPN().equals(reportsHeader.getEDPRPN()) ? "selected " : "")
										+ "value=\"" + selectItem.getIBSRPN() + "\" " + " >" 
										+ selectItem.getIBSRPN() + " - " + selectItem.getIBSDSC()
										+ "</option>");

							}						
						%>
		                </select>
		        		</div>
					</td>
					</tr>
				<%  } %>
            </table>
        </td>
	</tr>
</table>
<TABLE  id="mainTable" class="tableinfo" ALIGN=CENTER >
	<TR> 
  		<TD NOWRAP>
  			<TABLE id="headTable" >
 			 <TR id="trdark">  
				<td align=center width="9%" NOWRAP>Agency</td>
				<td align=center width="20%" NOWRAP>Report</td>
				<td align=center width="69%" NOWRAP>Description</td>
				<td align=center width="1%" NOWRAP>Excel</td>
			 </tr>
		   </TABLE>
  
   <div id="dataDiv1" class="scbarcolor" >
    <table id="dataTable" >
<%
	boolean firstItem = true;
	String chk = "checked";
	reportsList.initRow();
	while (reportsList.getNextRow()) {
		ReportsData dtoItem = (ReportsData) reportsList.getRecord();
		String report = dtoItem.getEDPRPN() + "(" + Util.formatDate(dtoItem.getEDPDTD(), dtoItem.getEDPDTM(), dtoItem.getEDPDTY()) + ")"; 
%>
		<tr id="trclear">
			<td nowrap>
				<a href="javascript:openFile('<%= dtoItem.getEDPPTH() %>')" alt="<%= report %>" title=""><%= dtoItem.getEDPBRN() %></a>
			</td>
			<td nowrap>
				<a href="javascript:openFile('<%= dtoItem.getEDPPTH() %>')" alt="<%= report %>" title=""><%= report %></a>
			</td>
			<td nowrap>
				<a href="javascript:openFile('<%= dtoItem.getEDPPTH() %>')" alt="<%= report %>" title=""><%= dtoItem.getIBSDSC() %></a>
			</td>
<%		if (dtoItem.getEDPEXT().toLowerCase().equals("pdf")) { %>
			<td nowrap align="center" width="1%">
				<a href="javascript:openCSVFile('<%= dtoItem.getEDPPTH() %>')">
				<img src="<%=request.getContextPath()%>/images/calendar.gif" align="center" vspace="0" hspace="0" border="0"></a>
			</td>
<%		} else { %>
			<td nowrap align="center" width="1%"></td>
<% 		} %>
		</tr>
<%	} %>
</table>
   </div>
   
  </TD>
  </TR>	
</TABLE>

<SCRIPT language="JavaScript">
	document.forms[0].totalRow.value="<%=reportsList.size()%>";
	function resizeDoc() {
		divResize();
		adjustEquTables(headTable, dataTable, dataDiv1, 1, false);
	}
	resizeDoc();
	window.onresize=resizeDoc;
<% if(reportsHeader.isHistory()){ %>
	activateReportsDiv();	
<% } %>
</SCRIPT>
<p> &nbsp</p>
<p> &nbsp</p>
<TABLE border="0" width="607" class="tbenter">
	<TBODY>
		<TR>
			<TD></TD>
			<TD align="center">NOTE : To see the reports, you need <A
				href="http://www.acrobat.com" target="_blank">Acrobat Reader </A>installed
			</TD>
			<TD></TD>
		</TR>
		<TR>
			<TD></TD>
			<TD valign="middle" align="center">
				<A href="http://www.acrobat.com" target="_blank">
				<IMG src="<%=request.getContextPath()%>/images/e/getacro.gif" width="88" height="31" border="0"></A>
			</TD>
			<TD></TD>
		</TR>
	</TBODY>
</TABLE>
</FORM>
</BODY>
</HTML>
