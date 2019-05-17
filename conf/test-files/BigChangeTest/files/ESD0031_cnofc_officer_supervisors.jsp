<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Officers /Supervisors Exchange</title>
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

function goProcess() {
	getElement("SCREEN").value="5";
	document.forms[0].submit();
}

function changeAll() {
	if (getElement("CNONSU").value=="") {
			getElement("SUPDSC").value="";
	}	
	for (j = 0; j < document.getElementById("TOTROWS").value; j++) {
		getElement("E01CNONSU_" + j).value=getElement("CNONSU").value;
		getElement("E01SUPDSC_" + j).value=getElement("SUPDSC").value;
	}
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

<h3 align="center"><%= userPO.getOption()%> Reassignment<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" ALT="cnofc_officer_supervisors.jsp, ESD0031"></h3>
<hr size="4">
<h3 align="center"><%= userPO.getOption()%> : <%= userPO.getType()%> / <%= userPO.getHeader20()%></h3>


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0031">

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
		<TD align="CENTER" class="EIBSBTN" width="50%"><A href="javascript:goProcess()" id="linkUpdate">
      		<img name="Image2" border="0" src="<%=request.getContextPath()%>/images/e/update.gif" ></a> 
      	</TD>
      	<TD align="CENTER" class="EIBSBTN" width="50%"><a href="javascript:goExit()" id=linkExit">
      		<img name="Image7" border="0" src="<%=request.getContextPath()%>/images/e/exit.gif" ></a>
      	</td>	
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
		<td NOWRAP align="left" width="35%"><b>New<br><%= userPO.getOption()%></b><br>
			<% if (userPO.getPurpose().equals("MAINTENANCE")) { %>
				<INPUT type="text" name="CNONSU" size="4" maxlength="3">
				<INPUT type="text" name="SUPDSC" size="45" maxlength="45" readonly>
				<%  if (userPO.getOption().equals("SUPERVISOR")){ %>
				<A href="javascript:GetCodeDescCNOFC('CNONSU','SUPDSC','45')">
				<%	} else { %>
				<A href="javascript:GetCodeDescCNOFC('CNONSU','SUPDSC','15')">
  				<%	} %>
				<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="bottom" border="0">
				</A>
				<A href="javascript:changeAll()"> <IMG src="<%=request.getContextPath()%>/images/refresh.gif" alt="Populate to the list." align="bottom" border="0">
				</A>
			<% } %>	
		</td>
		
		<%  if (userPO.getOption().equals("SUPERVISOR")){ %>
			<td NOWRAP align="center" width="15%"><b>Officer<br>Code<br></b></td>
			<td NOWRAP align="center" width="30%"><b>Officer Name<br></b></td>
			<td nowrap align="center" width="10%"><B>Branch</B></td>	
		<%	} else { %>
			<td NOWRAP align="center" width="15%"><b>Portfolio<br>Number<br></b></td>
			<td NOWRAP align="center" width="30%"><b>Customer Name<br></b></td>
			<td nowrap align="center" width="10%"><B>Customer<br>Number</B></td>
		<%  } %>	
	</TR>
 
        <%
    	  int i = 0;
          prList.initRow();    
          while (prList.getNextRow()) {
               ESD003101Message msgList = (ESD003101Message) prList.getRecord();			 
         %>             
          <TR id=trclear>

		<td NOWRAP align="center" width="5%">
			<INPUT type="checkbox"
				name="E01ACT_<%= prList.getCurrentRow() %>" 
					<% if (userPO.getPurpose().equals("INQUIRY") || userPO.getPurpose().equals("APPROVAL")
							|| userPO.getOption().equals("OFFICER"))           	
              	  		out.print(" disabled"); %>>
		</td>

		<td NOWRAP align="left" width="35%">
			<INPUT type="text" name="E01CNONSU_<%= prList.getCurrentRow() %>" 
				value="<%= msgList.getE01CNONSU() %>" size="4" maxlength="3" 
			<% if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")))
					 out.print(" readonly"); %>>
			<INPUT type="text" name="E01SUPDSC_<%= prList.getCurrentRow() %>" size="45" maxlength="45" readonly>
					<%  if (userPO.getOption().equals("SUPERVISOR")){ %>
					<A href="javascript:GetCodeDescCNOFC('E01CNONSU_<%= prList.getCurrentRow() %>','E01SUPDSC_<%= prList.getCurrentRow() %>','45')">
					<%	} else { %>
					<A href="javascript:GetCodeDescCNOFC('E01CNONSU_<%= prList.getCurrentRow() %>','E01SUPDSC_<%= prList.getCurrentRow() %>','15')">
	  				<%	} %>
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ."
						align="bottom" border="0">
					</A>
		</td>
		<td NOWRAP align="center" width="15%">
		<%  if (userPO.getOption().equals("SUPERVISOR")){ %>
			<INPUT type="text" name="E01CNORCD_<%= prList.getCurrentRow() %>"
				value="<%= msgList.getE01CNORCD() %>" size="4" maxlength="4" readonly>
		<%	} else { %>	
			<INPUT type="text" name="E01CNONUM_<%= prList.getCurrentRow() %>"
				value="<%= msgList.getE01CNONUM() %>" size="9" maxlength="9" readonly>
		<%	} %>	
		</td>
			
		<td NOWRAP align="left" width="35%">
			<INPUT type="text" name="E01CNODSC_<%= prList.getCurrentRow() %>" size="45" maxlength="45"
					value="<%= msgList.getE01CNODSC()%>" readonly>
		</td>
		
		<TD nowrap align="center" width="10%">
		<%  if (userPO.getOption().equals("SUPERVISOR")){ %>	
			<INPUT type="text" name="E01CNOFRP_<%= prList.getCurrentRow() %>"
			value="<%= msgList.getE01CNOFRP() %>" size="4" maxlength="4" readonly>
		
		<%	} else { %>	
			<INPUT type="text" name="E01CNOCUN_<%= prList.getCurrentRow() %>"
			value="<%= msgList.getE01CNOCUN() %>" size="9" maxlength="9" readonly>
		<%	} %>
		</TD>

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
  			int pos = prList.getFirstRec() - 101;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.params.JSESD0031?SCREEN=2&FromRecord=" + pos + "\" > <img src=\""+request.getContextPath()+"/images/e/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (prList.getShowNext()) {
  			int pos = prList.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.params.JSESD0031?SCREEN=2&FromRecord=" + pos +  "\" ><img src=\""+request.getContextPath()+"/images/e/next_records.gif\" border=0></A>");
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
