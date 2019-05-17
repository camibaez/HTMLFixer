<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Sales Agents - User Access</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "prList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>
<SCRIPT Language="javascript">

//<!-- Hide from old browsers
function goProcess() {
	getElement("SCREEN").value="5";
	document.forms[0].submit();
}

function goNew() {
	getElement("SCREEN").value="3";
	document.forms[0].submit();
}

function goExit(op) {
	document.forms[0].SCREEN.value = '1';
	document.forms[0].submit();
}

	builtHPopUp();

function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
}

function getACode(code,des,field) {
	level = -1;
	for (i=document.getElementsByName(field).length-1; i > -1; i--) {
		if (document.getElementsByName(field)[i].checked) {
			level = i + 1;  i = -1;	
		}
	}
	switch (level){
   	case 1:
        {
         GetCodeDescCNOFC(code,des, '15');
         break;
        }
   	case 2:
        {
         GetCodeDescCNOFC(code,des, '45');
         break;
        }
    case 3:
        {
		 GetBranchDsc(code,des,'01');
         break;
        }
   	case 4:
        {
         GetCodeDescCNOFC(code,des, '03');
         break;
        }    
   	case 5:
        {
         GetCodeDescCNOFC(code,des, '07');
         break;
        }    
   default: {
        }
   }
}

//-->
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
%>

<h3 align="center">User Access - <%= userPO.getPurpose()%><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" ALT="agents_user_access.jsp, ESD0610"></h3>
<hr size="4">
<h3 align="center">User : <%= userPO.getType()%> / <%= userPO.getHeader20()%></h3>


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0610">

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
		<TD align="CENTER" class="EIBSBTN" width="33%"><A href="javascript:goNew()" id="linkNew">
      		<img name="Image1" border="0" src="<%=request.getContextPath()%>/images/e/new.gif" ></a> 
      </TD>
		<TD align="CENTER" class="EIBSBTN" width="33%"><A href="javascript:goProcess()" id="linkUpdate">
      		<img name="Image2" border="0" src="<%=request.getContextPath()%>/images/e/update.gif" ></a> 
      </TD>
		<TD align="CENTER" class="EIBSBTN" width="34%"><A href="javascript:goExit()" id=linkExit">
      		<img name="Image7" border="0" src="<%=request.getContextPath()%>/images/e/exit.gif" ></a>
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
		<td NOWRAP align="center" width="45%"><b>Level<BR>
		<IMG src="<%=request.getContextPath()%>/images/Check.gif"
			alt="mandatory field" align="bottom"> </b></td>
		<td NOWRAP align="center" width="15%"><b>Code<br><BR>
			<IMG src="<%=request.getContextPath()%>/images/Check.gif"
			alt="mandatory field" align="bottom"> </b></td>
		<td NOWRAP align="center" width="35%"><b>Description<br></b></td>
		
	</TR>
 
        <%
    	  int i = 0;
          prList.initRow();    
          while (prList.getNextRow()) {
               ESD061001Message msgList = (ESD061001Message) prList.getRecord();			 
         %>             
    <TR id=trclear>
		<td NOWRAP align="center" width="5%">
			<INPUT type="hidden" name="E01AGUSEQ_<%= prList.getCurrentRow()%>" value="<%= msgList.getE01AGUSEQ() %>">
			<INPUT type="checkbox" name="E01ACT_<%= prList.getCurrentRow() %>" 
			<% if (userPO.getPurpose().equals("INQUIRY") || userPO.getPurpose().equals("APPROVAL"))           	
              		out.print(" disabled"); %>>
		</td>
		
		<%if (msgList.getE01AGULEV().equals("")) msgList.setE01AGULEV("1"); %>
		<td NOWRAP align="center" width="45% ">
			<INPUT type="radio" name="E01AGULEV_<%= prList.getCurrentRow()%>" value="1" <%if (msgList.getE01AGULEV().equals("1")) out.print("checked"); %>
			  <% if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")))
				 out.print(" readonly"); %>
			>Agent 
			<INPUT type="radio" name="E01AGULEV_<%= prList.getCurrentRow()%>" value="2" <%if (msgList.getE01AGULEV().equals("2")) out.print("checked"); %>
			  <% if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")))
				 out.print(" readonly"); %>
			>Supervisor
			<INPUT type="radio" name="E01AGULEV_<%= prList.getCurrentRow()%>" value="3" <%if (msgList.getE01AGULEV().equals("3")) out.print("checked"); %>
			  <% if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")))
				 out.print(" readonly"); %>
			>Branch
			<INPUT type="radio" name="E01AGULEV_<%= prList.getCurrentRow()%>" value="4" <%if (msgList.getE01AGULEV().equals("4")) out.print("checked"); %>
			  <% if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")))
				 out.print(" readonly"); %>
			>Country			
			<INPUT type="radio" name="E01AGULEV_<%= prList.getCurrentRow()%>" value="5" <%if (msgList.getE01AGULEV().equals("5")) out.print("checked"); %>
			  <% if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")))
				 out.print(" readonly"); %>
			>Region
		</td>
		
		<td NOWRAP align="center" width="15%">
			<INPUT type="text" name="E01AGUCOD_<%= prList.getCurrentRow() %>" value="<%= msgList.getE01AGUCOD() %>" size="3" maxlength="3"  
			   	<% if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")))
					 out.print(" readonly"); %>>
			<A href="javascript:getACode('E01AGUCOD_<%= prList.getCurrentRow() %>','E01AGUDES_<%= prList.getCurrentRow() %>','E01AGULEV_<%= prList.getCurrentRow() %>')">
			   <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0">
			</A>
		</td>

		<td NOWRAP align="left" width="35%">
			<INPUT type="text" name="E01AGUDES_<%= prList.getCurrentRow() %>"
				value="<%= msgList.getE01AGUDES()%>" size="45" maxlength="45" readonly">
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
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.params.JSESD0610?SCREEN=2&FromRecord=" + pos + "\" > <img src=\""+request.getContextPath()+"/images/e/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (prList.getShowNext()) {
  			int pos = prList.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.params.JSESD0610?SCREEN=2&FromRecord=" + pos +  "\" ><img src=\""+request.getContextPath()+"/images/e/next_records.gif\" border=0></A>");
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
