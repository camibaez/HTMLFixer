<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*, datapro.eibs.beans.*" %>
<title>Bloomberg / Reuters Parameters</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "prList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>
<SCRIPT Language="javascript">

function goProcess() {
	getElement("SCREEN").value="5";
	document.forms[0].submit();
}

function goNew() {
	getElement("SCREEN").value="3";
	document.forms[0].submit();
}

function goSchedule() {
	getElement("SCREEN").value="12";
	document.forms[0].submit();
}

function GetIbsCode(typ,code,name){

	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEFE0210?SCREEN=90&FLOTYP=" + typ;
	fieldName=code;
	fieldAux1=typ;
	fieldDesc=name;
	CenterWindow(page,500,450,2);
}

	builtHPopUp();

function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
}

</SCRIPT>

</head>

<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
	 error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 userPO.setPurpose("MAINTENANCE");
%>

<h3 align="center">Bloomberg / Reuters Parameters<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" ALT="bloomberg_reuters_parameters.jsp, EFE0210"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEFE0210">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">

<% 
 if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
%>

<TABLE class="tbenter">
    <TR>
		<TD align="CENTER" class="TDBKG" width="20%">
			<a href="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEFE0211?SCREEN=1"><b>General<br>Parameters</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goNew()"><b>New<br>Variable</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goProcess()"><b>Submit<br>Updates</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goSchedule()"><b>Schedule</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="20%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a>
	  	</TD>
	</TR>
</TABLE>

<%      
  }
%> 


<% 
	if ( prList.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center"> There are no items.</h4> 
      </div>
      </TD></TR>
   	</TABLE>
<%
	}
	else {
%>    
    
  <TABLE class="tableinfo" id="dataTable">
    
        <TR id=trdark>
		<td NOWRAP align="center" width="5%"><b>Delete</b></td>
		<td NOWRAP align="center" width="10%"><b>Vendor<BR>
		<IMG src="<%=request.getContextPath()%>/images/Check.gif"
			alt="mandatory field" align="bottom"> </b></td>
		<td NOWRAP align="center" width="8%"><b>Type<BR>
			<IMG src="<%=request.getContextPath()%>/images/Check.gif"
			alt="mandatory field" align="bottom"> </b></td>
		<td NOWRAP align="center" width="30%"><b>IBS Code<br>
		<B><IMG src="<%=request.getContextPath()%>/images/Check.gif"
			alt="mandatory field" align="bottom"></B></b></td>
		<td nowrap align="center" width="17%"><b>Description<BR>
		<td NOWRAP align="center" width="30%"><b>Vendor Code<br>
		<B><IMG src="<%=request.getContextPath()%>/images/Check.gif"
			alt="mandatory field" align="bottom"></B></b></td>		
		
	</TR>
 
        <%
    	  int i = 0;
          prList.initRow();    
          while (prList.getNextRow()) {
            EFE021001Message msgList = (EFE021001Message) prList.getRecord();			 
         %>             
          <TR id=trclear>

		<td NOWRAP align="center" width="5%">
			<INPUT type="checkbox"
				name="E01ACT_<%= prList.getCurrentRow() %>" 
					<% if (userPO.getPurpose().equals("INQUIRY") || userPO.getPurpose().equals("APPROVAL"))           	
              	  		out.print(" disabled"); %>>
		</td>

		<td NOWRAP align="center" width="10%">
			<SELECT name="E01FLOPRV_<%= prList.getCurrentRow() %>">
                        <OPTION value="R" <%= msgList.getE01FLOPRV().trim().equals("R")?"Selected":"" %>>Reuters</OPTION>
						<OPTION value="B" <%= msgList.getE01FLOPRV().trim().equals("B")?"Selected":"" %>>Bloomberg</OPTION>
			<% if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")))
						 out.print(" disabled=true"); %>
             </SELECT>
		</td>
		<td NOWRAP align="center" width="10%">
			<SELECT name="E01FLOTYP_<%= prList.getCurrentRow() %>">
                        <OPTION value="FX  " <%= msgList.getE01FLOTYP().trim().equals("FX")?"Selected":"" %>>FX Rates</OPTION>
						<OPTION value="FRT" <%= msgList.getE01FLOTYP().trim().equals("FRT")?"Selected":"" %>>Floating Rates</OPTION>
						<OPTION value="INST" <%= msgList.getE01FLOTYP().trim().equals("INST")?"Selected":"" %>>Investment Instruments</OPTION>
			<% if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")))
						 out.print(" disabled=true"); %>
             </SELECT>
		</td>
		<td NOWRAP align="center" width="20%">
			<INPUT type="text" name="E01FLOIBS_<%= prList.getCurrentRow() %>" 
				value="<%= msgList.getE01FLOIBS() %>" size="11" maxlength="10"  
				<% if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")))
					 out.print(" readonly"); %>
			>
			<A
				href="javascript:GetIbsCode(document.forms[0].E01FLOTYP_<%= prList.getCurrentRow() %>.value,'E01FLOIBS_<%= prList.getCurrentRow() %>','E01FLODSC_<%= prList.getCurrentRow() %>')">
				<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0">
			</A>
		</td>

		<td NOWRAP align="left" width="35%">
			<INPUT type="text" name="E01FLODSC_<%= prList.getCurrentRow() %>"
				value="<%= msgList.getE01FLODSC() %>" size="36" maxlength="35">
				<% if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")))
					 out.print(" readonly"); %>
		</td>
		<td NOWRAP align="center" width="20%">
			<INPUT type="text" name="E01FLOBLM_<%= prList.getCurrentRow() %>" 
				value="<%= msgList.getE01FLOBLM() %>" size="21" maxlength="20"  
				<% if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")))
					 out.print(" readonly"); %>
			>
		</td>
			
	</TR>
       <% 
       	 i++; 
        } 
       %> 
  </TABLE>
  <TABLE  class="tbenter" WIDTH="88%" ALIGN=CENTER>
   	 <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25">
       <%
    	if ( prList.getShowPrev() ) {
  			int pos = prList.getFirstRec() - 51;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.params.JSEFE0210?SCREEN=2&FromRecord=" + pos + "\" > <img src=\""+request.getContextPath()+"/images/e/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (prList.getShowNext()) {
  			int pos = prList.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.params.JSEFE0210?SCREEN=2&FromRecord=" + pos +  "\" ><img src=\""+request.getContextPath()+"/images/e/next_records.gif\" border=0></A>");
	    } %>
  </TD>
 </TR>
 </TABLE>
  
<BR>
<SCRIPT Language="javascript">
	document.forms[0].TOTROWS.value = <%= i%>;
	document.forms[0].NEXTROWS.value = <%= prList.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= prList.getFirstRec()%>;
</SCRIPT>
<%      
  }
%> 
</form>
</body>
</html>
