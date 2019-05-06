<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Lista de Códigos de Negación</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "EDEN025List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
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

<h3 align="center">Negation Code List<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="our_denial_list.jsp, EDEN025"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.ofac.JSEDEN025">

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
	if ( EDEN025List.getNoResult() ) {
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
    
 <TABLE  id="mainTable" class="tableinfo" height="50%">
 	<tr>
 		<th NOWRAP align="center" width="5%"><B>Sel</B></th>
		<th NOWRAP align="center" width="15%"><B>Code</B>	</th>
		<th NOWRAP align="center" width="80%"><B>Description</B>
	</tr>
 	
        <%
    	  int i = 0;
          EDEN025List.initRow();    
		  boolean firstTime = true;
		  String chk = "";
          while (EDEN025List.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
            EDEN02501Message msgList = (EDEN02501Message) EDEN025List.getRecord(); 
		%>              
		<tr>
			<td nowrap align="center" width="5%"><input type="radio" id="selectedRow" name="selectedRow" value="<%=EDEN025List.getCurrentRow()%>" <%=chk%> class="highlight"/></td>
			<td NOWRAP align="center" width="15%" ><%= msgList.getE01DTCCDE() %></td>
			<td NOWRAP align="left" width="80%" ><%= msgList.getE01DTCDSC() %></td>			
		</TR>
       <% i++; } %> 

</table>
  
  <TABLE  class="tbenter" WIDTH="88%" ALIGN=CENTER>
   	 <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25">
       <% 		
		int screen = 1;		
    	if ( EDEN025List.getShowPrev() ) {
  			int pos = EDEN025List.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.ofac.JSEDEN025?SCREEN="+screen+"&FromRecord=" + pos + "\" > <img src=\""+request.getContextPath()+"/images/e/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (EDEN025List.getShowNext()) {
  			int pos = EDEN025List.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.ofac.JSEDEN025?SCREEN="+screen+"&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/e/next_records.gif\" border=0></A>");
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
