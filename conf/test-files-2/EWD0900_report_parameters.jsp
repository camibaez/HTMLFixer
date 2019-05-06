<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>

<%@ page import = "datapro.eibs.master.*, datapro.eibs.beans.*" %>

<title>Procesar Reportes</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "reportParams" class= "datapro.eibs.beans.JBObjList"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">

function goProcess() {
		
		var p = "";
		
		for (k=0; k<document.forms[0].elements.length; k++) {
			if (document.forms[0].elements[k].name.indexOf("RPTPARAM_") == 0) {
				p += "@" + document.forms[0].elements[k].name + "=" + document.forms[0].elements[k].value;
			}
		} 
		var page = "<%=request.getContextPath()%>/pages/e/MISC_report_wait.jsp?URL='<%= JSEIBSProp.getCRVEngine() %>?DATASOURCE=" + document.forms[0].DATASOURCE.value + "@TNAME=" + document.forms[0].REPORT.value + p + "'";
		CenterNamedWindow(page,'PDF',500,500,7);		
}

function update(name) {
	
	day = document.forms[0]["PMSVAL_" + name + "_DD"].value;
	day = day.length == 1 ? "0" + day : day;
	month = document.forms[0]["PMSVAL_" + name + "_MM"].value;
	month = month.length == 1 ? "0" + month : month;
	year = "20" + document.forms[0]["PMSVAL_" + name + "_YY"].value;
	
	document.forms[0]["RPTPARAM_" + name].value = year + month + day;
}

</SCRIPT>
</head>

<body>

<%
	String reportTitle = request.getAttribute("TITLE") == null ? "" : (String) request.getAttribute("TITLE"); 
	String reportName = request.getAttribute("REPORT") == null ? "" : (String) request.getAttribute("REPORT"); 
	String dataSource = request.getAttribute("DATASOURCE") == null ? "" : (String) request.getAttribute("DATASOURCE"); 
%>

<h3 align="center">Report Process<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="report_parameters.jsp, EWD0900"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.general.JSEWD0900">

	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="3">
	<INPUT TYPE=HIDDEN NAME="REPORT" VALUE="<%=reportName%>">
	<INPUT TYPE=HIDDEN NAME="DATASOURCE" VALUE="<%=dataSource%>">

<% 
	if ( !reportParams.isEmpty() ) {
%>
    
	<TABLE class="tbenter">
    	<TR>
      		<TD ALIGN=CENTER class="TDBKG" width="50%"><a href="javascript:goProcess()">Procesar</a></TD>
      		<TD ALIGN=CENTER class="TDBKG" width="50%"><a href="<%=request.getContextPath()%>/pages/background.jsp">Salir</a></TD>
    	</TR>
  	</TABLE>
  
  	<TABLE class="tableinfo" id="dataTable">
		<TR id=trdark>
            <td NOWRAP align=center colspan="2"><b><%=reportTitle%></b></td>		  
		</TR>
        <TR id=trdark>
          	<td NOWRAP align="right" ><b>Parámetro&nbsp;</b></td>		  
		  	<td NOWRAP align="left" ><b>&nbsp;Valor</b></td>
		</TR>
<%
		reportParams.initRow();  
        while (reportParams.getNextRow()) {
           JBParameter entry = (JBParameter) reportParams.getRecord();			 
%>             
			<TR id=trclear>
          		<td NOWRAP align="right"><%=Util.formatCell(entry.getDescription())%>&nbsp;: </td>		  
		  		<td NOWRAP align="left" >
<%				if (entry.getType().equals("date")) { %>
					<INPUT TYPE=HIDDEN NAME="RPTPARAM_<%= entry.getName() %>" VALUE="<%= entry.getValue() %>">
		  			<input type="text" size="2" maxlength="2" name="PMSVAL_<%= entry.getName() %>_DD" readonly="readonly" value="">
                    <input type="text" size="2" maxlength="2" name="PMSVAL_<%= entry.getName() %>_MM" readonly="readonly" value="">
                    <input type="text" size="2" maxlength="2" name="PMSVAL_<%= entry.getName() %>_YY" readonly="readonly" value="">                    
                    	<a href="javascript:DatePicker(document.forms[0].PMSVAL_<%= entry.getName() %>_DD, document.forms[0].PMSVAL_<%= entry.getName() %>_MM, document.forms[0].PMSVAL_<%= entry.getName() %>_YY)" 
                    		onblur="update('<%= entry.getName() %>')">
                    	<img src="<%=request.getContextPath()%>/images/calendar.gif" title="help" align="middle" border="0"></a>
<%				} else if (entry.getType().equals("integer")) { %>
					<input type="text" name="RPTPARAM_<%= entry.getName() %>" value="<%= entry.getValue() %>" size="<%= entry.getSize() + 2 %>" maxlength="<%= entry.getSize() %>" onkeypress="enterInteger()">		  				
<%				} else if (entry.getType().equals("decimal")) { %>
					<input type="text" name="RPTPARAM_<%= entry.getName() %>" value="<%= entry.getValue() %>" size="<%= entry.getSize() + 2 %>" maxlength="<%= entry.getSize() %>" onkeypress="enterDecimal()">		  				
<%				} else if (entry.getType().equals("user")) { %>
					<input type="text" name="RPTPARAM_<%= entry.getName() %>" value="<%= entry.getValue() %>" size="12" maxlength="10"> 		  				
			        	<a href="javascript:GetUser('RPTPARAM_<%= entry.getName() %>','','')"> 
						<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></A>
<%				} else if (entry.getType().equals("branch")) { %>
					<input type="text" name="RPTPARAM_<%= entry.getName() %>" value="<%= entry.getValue() %>" size="<%= entry.getSize() + 2 %>" maxlength="<%= entry.getSize() %>"> 		  				
						<a href="javascript:GetBranch('RPTPARAM_<%= entry.getName() %>','')" >
						<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> 
<%				} else if (entry.getType().equals("cnofc")) { %>
					<input type="text" name="RPTPARAM_<%= entry.getName() %>" value="<%= entry.getValue() %>" size="<%= entry.getSize() + 2 %>" maxlength="<%= entry.getSize() %>"> 		  				
						<A href="javascript:GetCodeDescCNOFC('RPTPARAM_<%= entry.getName() %>','','<%= entry.getCode() %>')">
						<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></A>
<%				} else if (entry.getType().equals("portfolio")) { %>
					<input type="text" name="RPTPARAM_<%= entry.getName() %>" value="<%= entry.getValue() %>" size="<%= entry.getSize() + 2 %>" maxlength="<%= entry.getSize() %>"> 		  				
						<A href="javascript:GetPortfolioDescIdInvest('RPTPARAM_<%= entry.getName() %>','','')">
						<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></A>
<%				} else { %>
					<input type="text" name="RPTPARAM_<%= entry.getName() %>" value="<%= entry.getValue() %>" size="<%= entry.getSize() + 2 %>" maxlength="<%= entry.getSize() %>"> 		  				
<%				} %>						
			</TR>
<%		} %> 
  	</TABLE>

<%	} %>
 
</form>
</body>
</html>
