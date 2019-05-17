<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Vendors</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "EBP0110List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">

function goSearch() {
	if (getElement("SEARCHCDE").value == "0") {
		alert("Please select a code or partial code to start the list!!!");
		return;	 
	}
	<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){%>
			getElement("SCREEN").value="1";
	<% } else { %>
			getElement("SCREEN").value="6";
	<% }%>
	document.forms[0].submit();
}

function goNew() {
	getElement("SCREEN").value="2";
	document.forms[0].submit();
}

function goProcess() {
	isCheck();
	getElement("SCREEN").value = "3";
	document.forms[0].submit();
}

function goDelete() {
	isCheck();
	getElement("SCREEN").value="4";
	if (!confirm("Do you want to delete this record?")) {
		return;
	}
	document.forms[0].submit();
} 

function isCheck() {
	getElement("E01BPVCOD").value = getElementChecked("CODE").value;
}

function stopRKey(evt) {
  var evt = getEvent(evt);
  var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null);
  if ((evt.keyCode == 13) && (node.type=="text"))  {return false;}
}

document.onkeypress = stopRKey; 

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

<h3 align="center">Vendors<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" ALT="vendors_list.jsp, EBP0110"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0110">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="6">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="E01BPVCOD" VALUE="">
<% 
 if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
%>

<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goNew()"><b>New</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goProcess()"><b>Update</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goDelete()"><b>Delete</b></a>
		</TD>
	  	<TD align="CENTER" class="TDBKG" width="25%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a>
	  	</TD>
	</TR>
</TABLE> 

<%      
  } else {
%> 

<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="50%">
			<a href="javascript:goProcess()"><b>Inquiry</b></a>
      	</TD>
	  	<TD align="CENTER" class="TDBKG" width="50%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a>
	  	</TD>
	</TR>
</TABLE> 


<%
  }	 
	if ( EBP0110List.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center">There are no Vendors.</h4> 
      </div>
      </TD></TR>
   	</TABLE>
<%
	}
	else {
%>    
    
  <TABLE class="tableinfo" id="dataTable">
    <TR id=trdark> 
		<td NOWRAP align="center" width="5%"><B>Sel</B></td>
		<td NOWRAP align="center" width="5%"><B>Code</B></td>
		<td NOWRAP align="center" width="25%"><B>Name</B></td>
		<td nowrap align="center" width="25%"><B>Address</B></td>
		<td NOWRAP align="center" width="10%"><B>Phone Number</B></td>
		<td NOWRAP align="center" width="5%"><B>Country</B></td>
		<td NOWRAP align="center" width="5%"><B>State</B></td>
		<td nowrap align="center" width="10%"><B>Zip Code</B></td>
		<td NOWRAP align="center" width="10%"><B>Default <BR>
		Payment Via</B></td>
		
	</TR>
    <TR id=trdark>
		<td NOWRAP align="center" width="5%"></td>
		<td NOWRAP align="center" width="5%">
			<INPUT type="text" name="SEARCHCDE" size="11" maxlength="10" value="<%= userPO.getProdCode() %>">
				<IMG src="<%=request.getContextPath()%>/images/ico5.gif" onclick="goSearch()" width="15" height="11"
				 alt="Order and position in...">
		</td>
		<td NOWRAP align="center" width="25%"></td>
		<td nowrap align="center" width="25%"></td>
		<td nowrap align="center" width="10%"></td>
		<td NOWRAP align="center" width="5%"></td>
		<td NOWRAP align="center" width="5%"></td>
		<td nowrap align="center" width="10%"></td>
		<td nowrap align="center" width="10%"></td>
	</TR>
         <%
    	  int i = 0;
          EBP0110List.initRow();    
          while (EBP0110List.getNextRow()) {
            EBP011001Message msgList = (EBP011001Message) EBP0110List.getRecord();
		%>              
    <TR id=trclear>

		<td NOWRAP align="center" width="5%"> 
            <INPUT type="radio" name="CODE" value="<%= msgList.getE01BPVCOD() %>">
		</td>

		<td NOWRAP align="center" width="5%" ><%= msgList.getE01BPVCOD() %></td>
		<td NOWRAP align="left" width="20%" ><%= msgList.getE01BPVNM1() %></td>
		<td NOWRAP align="left" width="20%" ><%= msgList.getE01BPVNM3() %></td>
		<td NOWRAP align="left" width="10%" ><%= msgList.getE01BPVPHN() %></td>
		<td NOWRAP align="center" width="5%" ><%= msgList.getE01BPVCNT() %></td>
		<td NOWRAP align="left" width="5%" ><%= msgList.getE01BPVSTE() %></td>
		<td NOWRAP align="center" width="10%" ><%= msgList.getE01BPVZIP() %></td>
		<td NOWRAP align="center" width="10%" ><%= msgList.getE01BPVPVD() %></td>
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
		int screen = 6;
		if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
			screen = 1;
		} 
    	if ( EBP0110List.getShowPrev() ) {
  			int pos = EBP0110List.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.bap.JSEBP0110?SCREEN="+screen+"&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getProdCode() + "\" > <img src=\""+request.getContextPath()+"/images/e/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (EBP0110List.getShowNext()) {
  			int pos = EBP0110List.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.bap.JSEBP0110?SCREEN="+screen+"&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getProdCode() + "\" ><img src=\""+request.getContextPath()+"/images/e/next_records.gif\" border=0></A>");
	    } %>
  </TD>
 </TR>
 </TABLE>
  
<BR>
<SCRIPT Language="javascript">
	document.forms[0].TOTROWS.value = <%= i%>;
	document.forms[0].NEXTROWS.value = <%= EBP0110List.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= EBP0110List.getFirstRec()%>;
	radioClick("CODE", 0);
</SCRIPT>
<%      
  }
%> 
</form>
</body>
</html>
