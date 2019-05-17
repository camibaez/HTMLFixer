<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Source Code List</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "EDEN040List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">

function goNew() {
	document.getElementById("SCREEN").value="2";
	document.forms[0].submit();
}

function goProcess() {
	document.getElementById("SCREEN").value="3";
	document.forms[0].submit();
}

function goDelete() {
	if (!confirm("Desea borrar el registro seleccionado?")) {
		return;
	}
	document.getElementById("SCREEN").value="4";
	document.forms[0].submit();
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

<h3 align="center">Source Code List</h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.ofac.JSEDEN040">

  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="6">
 
  
	<TABLE class="tbenter"> 
		<TR>
			<TD align="CENTER" class="TDBKG" width="25%">
				<a href="javascript:goNew()"><b>New</b></a>
	      	</TD>
			<TD align="CENTER" class="TDBKG" width="25%">
				<a href="javascript:goProcess()"><b>Modify</b></a>
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
	if ( EDEN040List.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center"> There are not register to shown.</h4> 
      </div>
      </TD></TR>
   	</TABLE>
<%
	} else {
%>    
    
 <table  id="mainTable" class="tableinfo" height="50%">
 	<tr valign="top">
 		<th NOWRAP align="center" width="5%"><B>Sel</B></th>
		<th NOWRAP align="center" width="15%"><B>Code</B>	</th>
		<th NOWRAP align="center" width="80%"><B>Description</B>
	</tr>
 		<%
    	  int i = 0;
          EDEN040List.initRow();    
		  boolean firstTime = true;
		  String chk = "";
          while (EDEN040List.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
            EDEN04001Message msgList = (EDEN04001Message) EDEN040List.getRecord(); 
		%>              
		<tr valign="top">
			<td nowrap align="center" width="5%">
				<input type="radio" id="selectedRow" name="selectedRow" value="<%=EDEN040List.getCurrentRow()%>" <%=chk%> />
			</td>
			<td NOWRAP align="center" width="15%" ><%= msgList.getE01DENCDE() %></td>
			<td NOWRAP align="center" width="80%" ><%= msgList.getE01DENDSC() %></td>			
		</tr>
       <% i++; } %> 
</table>
  
  <TABLE  class="tbenter" WIDTH="88%" ALIGN=CENTER>
   	 <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25">
       <% 		
		int screen = 1;		
    	if ( EDEN040List.getShowPrev() ) {
  			int pos = EDEN040List.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.ofac.JSEDEN040?SCREEN="+screen+"&FromRecord=" + pos + "\" > <img src=\""+request.getContextPath()+"/images/e/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (EDEN040List.getShowNext()) {
  			int pos = EDEN040List.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.ofac.JSEDEN040?SCREEN="+screen+"&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/e/next_records.gif\" border=0></A>");
	    } %>
  </TD>
 </TR>
 </TABLE>
  
<BR>
<SCRIPT Language="javascript">
	showChecked("E01OCOUN");
</SCRIPT>
<%      
  }
%> 
</form>
</body>
</html>
