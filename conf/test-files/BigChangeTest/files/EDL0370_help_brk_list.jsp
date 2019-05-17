<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META http-equiv="Pragma" content="No-cache">
<META http-equiv="Pragma" content="No-cache">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script language="javascript">
//<!-- Hide from old browsers

function enter(code) {
var form = top.opener.document.forms[0];
 form[top.opener.fieldName].value = code;
 top.close();
 } 
//-->
</script>
<TITLE></TITLE>
</HEAD>
<jsp:useBean id= "brkList" class= "datapro.eibs.beans.JBListRec"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />


<%@ page import="datapro.eibs.master.Util" %>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<BODY>
<h3 align="center">Deductions List<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="help_brk_list.jsp,EDL0370"> 
</h3>
<hr size="4">
<FORM method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0370" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1">
  <INPUT TYPE=HIDDEN NAME="ROW" VALUE="">
<%
	if ( brkList.getNoResult() ) {
%>
  <TABLE class="tbenter" width=100% height=100%>
 	<TR>
      <TD> 
        
      <div align="center"> <font size="3"><b> There is no match for your search criteria</b></font> 
      </div>
      </TD></TR>
   		</TABLE>
<%
	}
	else {
%>
  <h5>Click any item to add a new deduction</h5> 
  <TABLE class="tableinfo" style="width:95%" ALIGN=CENTER>
    <TR id="trdark"> 
      <TH ALIGN=CENTER  nowrap width="10%">Code</TH>
      <TH ALIGN=CENTER  nowrap width="40%">Description</TH>
      <TH ALIGN=CENTER  nowrap width="20%">Deduction amount</TH>
      <TH ALIGN=CENTER  nowrap width="10%">Factor</TH>
      <TH ALIGN=CENTER  nowrap width="20%">Type</TH>
    </TR>
    <%
                String NameSearch = (String)request.getAttribute("NameSearch");
                String FromRecord = (String)request.getAttribute("FromRecord");
                               
                int i=0;                
                brkList.initRow();
                while (brkList.getNextRow()) {
                    if (brkList.getFlag().equals("")) {                      
    %>
        <TR> 
			<TD ALIGN=center NOWRAP><div nowrap><a href="javascript:enter('<%= brkList.getRecord(4) %>')"><%= brkList.getRecord(4) %></a></DIV></TD>
			<TD ALIGN=LEFT NOWRAP><div nowrap><a href="javascript:enter('<%= brkList.getRecord(4) %>')"><%= brkList.getRecord(9) %></a></DIV></TD>      
			<TD ALIGN=center NOWRAP><div nowrap><a href="javascript:enter('<%= brkList.getRecord(4) %>')"><%= brkList.getRecord(5) %></a></DIV></TD>
			<TD ALIGN=center NOWRAP><div nowrap><a href="javascript:enter('<%= brkList.getRecord(4) %>')"><%= brkList.getRecord(6) %></a></DIV></TD>
			<TD ALIGN=center NOWRAP><div nowrap><a href="javascript:enter('<%= brkList.getRecord(4) %>')">
			 <% if (brkList.getRecord(10).equals("A")) out.print("Car Insurance");
			    else if (brkList.getRecord(10).equals("T")) out.print("Tax Collector");
			    else if (brkList.getRecord(10).equals("I")) out.print("Insurance"); %></a></DIV></TD>            			
     	</TR>                		
    <%  
                  }
                }
    %> 
  </TABLE>
  <TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> <%
        if ( brkList.getShowPrev() ) {
      			int pos = brkList.getFirstRec() - 21;
      			 out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0023?NameSearch=" + NameSearch + "&FromRecord=" + pos +  "\" > <img src=\""+request.getContextPath()+"/images/e/previous_records.gif\" border=0></A>");
        }
%> </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> <%       
        if ( brkList.getShowNext() ) {
      			int pos = brkList.getLastRec();
      			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0023?NameSearch=" + NameSearch + "&FromRecord=" + pos +  "\" ><img src=\""+request.getContextPath()+"/images/e/next_records.gif\" border=0></A>");

        }
%> </TD>
	 </TR>
	 </TABLE>
<%      
  }
%> 
</FORM>

</BODY>
</HTML>