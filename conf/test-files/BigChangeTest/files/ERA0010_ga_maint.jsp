<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>

<html>
<head>
<title>Basic Information </title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="gaMant"	class= "datapro.eibs.beans.ERA001001Message"	scope="session"/>
<jsp:useBean id="error" 	class= "datapro.eibs.beans.ELEERRMessage"  		scope="session"/>
<jsp:useBean id="userPO" 	class= "datapro.eibs.beans.UserPos"  			scope="session"/>
<jsp:useBean id="insList" 	class= "datapro.eibs.beans.JBObjList"   		scope="session"/>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

<% if( request.getParameter("SCREEN") != null && !request.getParameter("SCREEN").equals("300") ){ %>
	builtNewMenu(colla_M_opt);
	initMenu(); 
<% } %>
   
function goAction(op) {
	var delok= false;
	
	if (op == 1 || op == 2) {
	    if (op == 1) 
	      	{page = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0010?SCREEN=1100";}
		else 
		  	{page = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0010?SCREEN=1300&ROW=" + document.forms[0].ACTROW.value;}
		CenterWindow(page,600,500,2);
 	}
 	else {
		delok = confirm("Are you sure you want to delete the selected policy?"); 
	 	if ( delok) {
	 		document.forms[0].SCREEN.value = '1400';
	 		document.forms[0].submit();
	 	}
	}
	      
 }

function setRow(actrow) {
	document.forms[0].ACTROW.value = actrow;
}

function hidePoliza(value){
	if (value) {
		Poliza.style.display="";}
	else{
		Poliza.style.display="none"; }
}

</SCRIPT>

</head>
<%
	boolean firstTime = true;
 	String chk = "";
 	int row;
 	try {
	  	row = Integer.parseInt(request.getParameter("ROW"));
	  	firstTime = false;
	} catch (Exception e) {
		row = 0;
		firstTime = true;		
	} 
 	
 	if ( !error.getERRNUM().equals("0")  ) {
    	error.setERRNUM("0");
	    out.println("<SCRIPT Language=\"Javascript\">");
    	out.println("       showErrors()");
    	out.println("</SCRIPT>");
 	}
%>

<body bgcolor="#FFFFFF">
<h3 align="center">Collaterals - Basic Information

<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="ga_maint.jsp,ERA0010"></h3> 
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0010" >

<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
<INPUT TYPE=HIDDEN NAME="opt" VALUE="1">
  
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="8%" > 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="16%" > 
              <div align="left"> 
                <input type="text" name="E01ROCCUN" readonly size="9" maxlength="9" value="<%= gaMant.getE01ROCCUN().trim()%>">
              </div>
            </td>
            <td nowrap width="13%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" width="41%" > 
              <div align="left"> 
                <input type="text" name="E01CUSNA1" readonly size="45" maxlength="45" value="<%= gaMant.getE01CUSNA1().trim()%>" >
             </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Basic Information</h4>
      <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="21%" > 
              <div align="right">Bank /Branch /Currency :</div>
            </td>
            <td nowrap colspan="3" > 
            	<%if (userPO.getPurpose().equals("READONLY")) {%>
	              	<input type="text" name="E01ROCBNK" size="2" maxlength="2" value="<%= gaMant.getE01ROCBNK().trim()%>" readonly>
	              	/ 
	              	<input type="text" name="E01ROCBRN" size="4" maxlength="3" value="<%= gaMant.getE01ROCBRN().trim()%>" readonly>
	              	/ 
	              	<input type="text" name="E01ROCCCY" size="4" maxlength="3" value="<%= gaMant.getE01ROCCCY().trim()%>" readonly>
            	<%} else {%>
	              	<input type="text" name="E01ROCBNK" size="2" maxlength="2" value="<%= gaMant.getE01ROCBNK().trim()%>" >
	              	/ 
	              	<input type="text" name="E01ROCBRN" size="4" maxlength="3" value="<%= gaMant.getE01ROCBRN().trim()%>" >
	              	<a href="javascript:GetBranch('E01ROCBRN',document.forms[0].E01ROCBNK.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absmiddle" border="0" width="18" height="22" ></a> 
	              	<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" > 
	              	/ 
	              	<input type="text" name="E01ROCCCY" size="4" maxlength="3" value="<%= gaMant.getE01ROCCCY().trim()%>" >
	              	<a href="javascript:GetCurrency('E01ROCCCY',document.forms[0].E01ROCBNK.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="absmiddle" border="0" ></a> 
	              	<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" > 
            	<%}%>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" height="23" > 
              <div align="right">G/L Number :</div>
            </td>
            <td nowrap colspan="3" height="23" > 
            	<%if (userPO.getPurpose().equals("READONLY")) {%>
	              	<input type="text" name="E01ROCGLN" size="16" maxlength="16" value="<%= gaMant.getE01ROCGLN().trim()%>" readonly>
            	<%} else {%>
	            	<a href="javascript:GetBranch('E01WLNBRN',document.forms[0].E01WLNBNK.value)"></a> 
	              	<input type="text" name="E01ROCGLN" size="16" maxlength="16" value="<%= gaMant.getE01ROCGLN().trim()%>" >
	              	<a href="javascript:GetLedger('E01ROCGLN',document.forms[0].E01ROCBNK.value,document.forms[0].E01ROCCCY.value,'91')">
	              	<img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0" ></a> 
	              	<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" > 
            	<%}%>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="21%" height="23" > 
              <div align="right">Reference Number :</div>
            </td>
            <td nowrap colspan="3" height="23" >
               	<%if ( !userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("READONLY")) {%>
              		<input type="text" name="E01ROCREF" size="10" maxlength="9" value="<%= gaMant.getE01ROCREF().trim()%>"  readonly >
              	<%} else {%>
  					<input type="text" name="E01ROCREF" size="10" maxlength="9" value="<%= gaMant.getE01ROCREF().trim()%>" >
  				<%}%>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" height="40" > 
              <div align="right">Collateral Type :</div>
            </td>
            <td nowrap colspan="3" height="40" >
            	<%if (userPO.getPurpose().equals("READONLY")) {%>
              		<input type="text" name="E01ROCTYP" size="4" maxlength="4" value="<%= gaMant.getE01ROCTYP().trim()%>" readonly >
              	<%} else {%>
              		<input type="text" name="E01ROCTYP" size="4" maxlength="4" value="<%= gaMant.getE01ROCTYP().trim()%>" >
              		<a href="javascript:GetCodeCNOFC('E01ROCTYP','05')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0" ></a> 
              		<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" > 
  				<%}%>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="21%" height="23" > 
              <div align="right"> Collateral Owner :</div>
            </td>
            <td nowrap colspan="3" height="23" > 
            	<%if (userPO.getPurpose().equals("READONLY")) {%>
              		<input type="text" name="E01ROCOWN" size="10" maxlength="9"  value="<%= gaMant.getE01ROCOWN().trim()%>" readonly >
              		/ 
              		<input type="text" name="E01CUSNAM" size="35" maxlength="35" value="<%= gaMant.getE01CUSNAM().trim()%>" readonly >
              	<%} else {%>
              		<input type="text" name="E01ROCOWN" size="10" maxlength="9"  value="<%= gaMant.getE01ROCOWN().trim()%>" >
              		/ 
              		<input type="text" name="E01CUSNAM" size="35" maxlength="35" value="<%= gaMant.getE01CUSNAM().trim()%>" >
              		<a href="javascript:GetCustomerDescId('E01ROCOWN','E01CUSNAM','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0" ></a> 
  				<%}%>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" > 
              <div align="right">Description :</div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
            	<%if (userPO.getPurpose().equals("READONLY")) {%>
                	<input type="text" name="E01ROCDES" size="35" maxlength="35" value="<%= gaMant.getE01ROCDES().trim()%>" readonly >
              	<%} else {%>
                	<input type="text" name="E01ROCDES" size="35" maxlength="35" value="<%= gaMant.getE01ROCDES().trim()%>" >
                	<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" > 
  				<%}%>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="21%" > 
              <div align="right"> Location :</div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E01ROCLOC" size="35" maxlength="35" value="<%= gaMant.getE01ROCLOC().trim()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Summary</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="23%" > 
              <div align="right">Purchased Price / Unit:</div>
            </td>
            <td nowrap width="19%" > 
              <input type="text" name="E01ROCPPU" size="17" maxlength="15" value="<%= gaMant.getE01ROCPPU().trim()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Units / Value: </div>
            </td>
            <td nowrap width="38%" >
              <input type="text" name="E01ROCNUN" size="10" maxlength="9" value="<%= gaMant.getE01ROCNUN().trim()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>>
              / 
              <input type="text" name="E01ROCMPU" size="17" maxlength="15" value="<%= gaMant.getE01ROCMPU().trim()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="23%" height="34" > 
              <div align="right">Appraised Value:</div>
            </td>
            <td nowrap width="19%" height="34" > 
              	<%if (userPO.getPurpose().equals("READONLY")) {%>
              		<input type="text" name="E01ROCAPA" size="15" maxlength="15" value="<%= gaMant.getE01ROCAPA().trim()%>" readonly>
				<%} else {%>
              		<input type="text" name="E01ROCAPA" size="15" maxlength="15" value="<%= gaMant.getE01ROCAPA().trim()%>" >
              		<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" > 
				<%}%>
            </td>
            <td nowrap width="20%" height="34" > 
              <div align="right">Exchange Rate: </div>
            </td>
            <td nowrap width="38%" height="34" > 
              <input type="text" name="E01ROCOFX" size="11" maxlength="11" value="<%= gaMant.getE01ROCOFX().trim()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="23%" > 
              <div align="right">Ineligible Value:</div>
            </td>
            <td nowrap width="19%" > 
              <input type="text" name="E01ROCINA" size="15" maxlength="15" value="<%= gaMant.getE01ROCINA().trim()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Appraised by: </div>
            </td>
            <td nowrap width="38%" >
              	<%if (userPO.getPurpose().equals("READONLY")) {%>
              		<input type="text" name="E01ROCABY" size="15" maxlength="15" value="<%= gaMant.getE01ROCABY().trim()%>" readonly>
				<%} else {%>
              		<input type="text" name="E01ROCABY" size="15" maxlength="15" value="<%= gaMant.getE01ROCABY().trim()%>" >
              		<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" > 
				<%}%>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="23%" > 
              <div align="right">Eligible Value:</div>
            </td>
            <td nowrap width="19%" > 
              <input type="text" name="E01ROCLIV" size="15" maxlength="15" value="<%= gaMant.getE01ROCLIV().trim()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Last Appraisal: </div>
            </td>
            <td nowrap width="38%" >
              	<%if (userPO.getPurpose().equals("READONLY")) {%>
              		<input type="text" name="E01ROCAP1" size="2" maxlength="2" value="<%= gaMant.getE01ROCAP1().trim()%>" readonly>
              		<input type="text" name="E01ROCAP2" size="2" maxlength="2" value="<%= gaMant.getE01ROCAP2().trim()%>" readonly>
              		<input type="text" name="E01ROCAP3" size="2" maxlength="2" value="<%= gaMant.getE01ROCAP3().trim()%>" readonly>
				<%} else {%>
              		<input type="text" name="E01ROCAP1" size="2" maxlength="2" value="<%= gaMant.getE01ROCAP1().trim()%>" >
              		<input type="text" name="E01ROCAP2" size="2" maxlength="2" value="<%= gaMant.getE01ROCAP2().trim()%>" >
              		<input type="text" name="E01ROCAP3" size="2" maxlength="2" value="<%= gaMant.getE01ROCAP3().trim()%>" >
              		<a href="javascript:DatePicker(document.forms[0].E01ROCAP1,document.forms[0].E01ROCAP2,document.forms[0].E01ROCAP3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
              		<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" > 
				<%}%>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="23%" > 
              <div align="right">Advance Rate Percent:</div>
            </td>
            <td nowrap width="19%" > 
              <input type="text" name="E01ROCRAT" size="10" maxlength="9" value="<%= gaMant.getE01ROCRAT().trim()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Opening Date:</div>
            </td>
            <td nowrap width="38%" >
              	<%if (userPO.getPurpose().equals("READONLY")) {%>
              		<input type="text" name="E01ROCOP1" size="2" maxlength="2" value="<%= gaMant.getE01ROCOP1().trim()%>" readonly>
              		<input type="text" name="E01ROCOP2" size="2" maxlength="2" value="<%= gaMant.getE01ROCOP2().trim()%>" readonly>
              		<input type="text" name="E01ROCOP3" size="2" maxlength="2" value="<%= gaMant.getE01ROCOP3().trim()%>" readonly>
				<%} else {%>
              		<input type="text" name="E01ROCOP1" size="2" maxlength="2" value="<%= gaMant.getE01ROCOP1().trim()%>" >
              		<input type="text" name="E01ROCOP2" size="2" maxlength="2" value="<%= gaMant.getE01ROCOP2().trim()%>" >
              		<input type="text" name="E01ROCOP3" size="2" maxlength="2" value="<%= gaMant.getE01ROCOP3().trim()%>" >
              		<a href="javascript:DatePicker(document.forms[0].E01ROCOP1,document.forms[0].E01ROCOP2,document.forms[0].E01ROCOP3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
              		<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" > 
				<%}%>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="23%" > 
              <div align="right">Face Value:</div>
            </td>
            <td nowrap width="19%" > 
              <input type="text" name="E01ROCFAA" size="15" maxlength="15" value="<%= gaMant.getE01ROCFAA().trim()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Maturity Date:</div>
            </td>
            <td nowrap width="38%" >
              	<%if (userPO.getPurpose().equals("READONLY")) {%>
              		<input type="text" name="E01ROCMT1" size="2" maxlength="2" value="<%= gaMant.getE01ROCMT1().trim()%>" readonly>
              		<input type="text" name="E01ROCMT2" size="2" maxlength="2" value="<%= gaMant.getE01ROCMT2().trim()%>" readonly>
              		<input type="text" name="E01ROCMT3" size="2" maxlength="2" value="<%= gaMant.getE01ROCMT3().trim()%>" readonly>
				<%} else {%>
              		<input type="text" name="E01ROCMT1" size="2" maxlength="2" value="<%= gaMant.getE01ROCMT1().trim()%>" >
              		<input type="text" name="E01ROCMT2" size="2" maxlength="2" value="<%= gaMant.getE01ROCMT2().trim()%>" >
              		<input type="text" name="E01ROCMT3" size="2" maxlength="2" value="<%= gaMant.getE01ROCMT3().trim()%>" >
              		<a href="javascript:DatePicker(document.forms[0].E01ROCMT1,document.forms[0].E01ROCMT2,document.forms[0].E01ROCMT3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
              		<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" > 
				<%}%>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="23%" > 
              	<div align="right">Insurance Collaterals: </div>
            </td>
            <td nowrap width="19%" > 
              	<input type="hidden" name="E01ROCEND" value="<%= gaMant.getE01ROCEND()%>">
			  	<%if (userPO.getPurpose().equals("READONLY")) {
			  		if (gaMant.getE01ROCEND().equals("Y")) 
			  			out.print("Yes");
			  		else 
			  			out.print("No");
			  		%>
			  	<%} else {%>
              		<input type="radio" name="CE01ROCEND" value="Y" onClick="document.forms[0].E01ROCEND.value='Y'"
			  		<%if(gaMant.getE01ROCEND().equals("Y")) out.print("checked");%>>
              		Yes 
              		<input type="radio" name="CE01ROCEND" value="N" onClick="document.forms[0].E01ROCEND.value='N'"
			  		<%if(gaMant.getE01ROCEND().equals("N")) out.print("checked");%>>
              		No 
		  		<%}%>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Revision Date:</div>
            </td>
            <td nowrap width="38%" >
              	<%if (userPO.getPurpose().equals("READONLY")) {%>
              		<input type="text" name="E01ROCRE1" size="2" maxlength="2" value="<%= gaMant.getE01ROCRE1().trim()%>" readonly>
              		<input type="text" name="E01ROCRE2" size="2" maxlength="2" value="<%= gaMant.getE01ROCRE2().trim()%>" readonly>
              		<input type="text" name="E01ROCRE3" size="2" maxlength="2" value="<%= gaMant.getE01ROCRE3().trim()%>" readonly>
				<%} else {%>
              		<input type="text" name="E01ROCRE1" size="2" maxlength="2" value="<%= gaMant.getE01ROCRE1().trim()%>" >
              		<input type="text" name="E01ROCRE2" size="2" maxlength="2" value="<%= gaMant.getE01ROCRE2().trim()%>" >
              		<input type="text" name="E01ROCRE3" size="2" maxlength="2" value="<%= gaMant.getE01ROCRE3().trim()%>" >
              		<a href="javascript:DatePicker(document.forms[0].E01ROCRE1,document.forms[0].E01ROCRE2,document.forms[0].E01ROCRE3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
              		<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" > 
				<%}%>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

<BR>
<%if (!userPO.getPurpose().equals("NEW")) {%>
<h4>Insurance Policy List</h4>
	<input type="hidden" name="ACTROW" value="<%= row %>">
	<input type="hidden" name="opt" value="1">
	<table class="tbenter">
	  	<%if (!userPO.getPurpose().equals("READONLY")) {%>
	  	<tr>
	  		<td class=tdBKG> 
	        	<div align="center"><a href="javascript:goAction('1')">New</a> </div>
			</td>
	 	<%}
		if ( !(insList.getNoResult() )) {
	 		if (!userPO.getPurpose().equals("READONLY")) {%>
				<td class=tdBKG>
		        	<div align="center"><a href="javascript:goAction(2)">Maintenance</a> </div>
		      	</td>
		      	<td class=tdBKG> 
		        	<div align="center"><a href="javascript:goAction('3')">Delete</a> </div>
		      	</td>
	 		<%} else {%>
				<td class=tdBKG>
		        	<div align="center"><a href="javascript:goAction(2)">Detail</a> </div>
		      	</td>
	 		<%}
	 	}%>
		</tr>
	</table>
  
	<table  id="mainTable" class="tableinfo" border=1>
	 	<tr > 
	    	<td nowrap valign="top" width="100%" >
			<table id="headTable" width="100%">
				<tr id="trdark"> 
					<th align="center" width="5%"> </th>
					<th align="center" width="55%">Description</th>
					<th align="center" width="20%">Policy Number</th>
					<th align="center" width="20%">Maturity Date</th>
				</tr>
	    	</table>

	<%
	if (insList.getNoResult() ) {
 	%>
		   	<table class="tbenter" width=100%  height=75%>
		   		<tr><td> 
					<div align="center"> <b>There are no results for your search criteria</b></div>
				</td></tr>
		   	</table>
	<%   		
	}
	else 
	{
		insList.initRow();
		while (insList.getNextRow()) {
     	if (firstTime) {
			firstTime = false;
			chk = "checked";
  	 	}
  	 	else 
  	 	{
			if (insList.getCurrentRow() == row )
				chk = "checked";
			else 
				chk = "";
  		}
    	datapro.eibs.beans.ERA001003Message msgList = (datapro.eibs.beans.ERA001003Message) insList.getRecord();
    %>              
			<div id="dataDiv1" class="scbarcolor" >
			<table id="datatable" width="100%">
				<tr>
				<td nowrap width="5%"><input type="radio" name="SEQ" value="<%= msgList.getE03ROCSEQ()%>" <%=chk%> onClick="setRow('<%=insList.getCurrentRow()%>')"></td>
				<td nowrap align="left" width="55%"><%=Util.formatCell(msgList.getE03ROCIPD())%></td>
				<td nowrap align="center" width="20%"><%=Util.formatCell(msgList.getE03ROCCIN())%></td>
				<td nowrap align="center" width="20%"><%=Util.formatDate(msgList.getE03ROCMD1(), msgList.getE03ROCMD2(), msgList.getE03ROCMD3())%></td>
				</tr>
      
    <%
    }
    %> 
			</table>
			</div>
	<%
	}
	%>
    		</td>
    	</tr>
 	</table>
<%}
	if (!userPO.getPurpose().equals("READONLY")) {%>
	  <p align="center">
	     <input id="EIBSBTN" type=submit name="Submit" value="Submit">
	  </p>
<%	}%>
</form>
</body>
</html>
