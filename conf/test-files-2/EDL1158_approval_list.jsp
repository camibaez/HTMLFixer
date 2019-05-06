<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>
Customer List
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">

<%@ page import ="datapro.eibs.master.Util"%>

<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "list" class= "datapro.eibs.beans.JBObjList"   scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"   scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="javascript">

function goAction( screenCode ){

	document.forms[0].SCREEN.value = screenCode ;
	document.forms[0].submit() ;
}

function goExit(){
    window.location.href="<%=request.getContextPath()%>/pages/background.jsp";
}
</script>
</HEAD>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<BODY>
<h3 align="center">Approval Change Rate<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="approval_list.jsp,EDL1158">
</h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.approval.JSEDL1158">
	<INPUT type="hidden" name="SCREEN" />

  <TABLE class="tbenter">
    <TR> 
      <TD class="TDBKG" ALIGN=CENTER width="25%"><a href="javascript:goAction( 2 )" id="linkApproval">Approval</a></TD>
      <TD class="TDBKG" ALIGN=CENTER width="25%"><a href="javascript:goAction( 3 )" id="linkReject">Reject</a></TD>
      <TD class="TDBKG" ALIGN=CENTER width="25%"><a href="javascript:goAction( 4 )">Delete</a></TD>
      <TD class="TDBKG" ALIGN=CENTER width="25%"><a href="javascript:goExit()">Exit</a></TD>
    </TR>
  </TABLE>
 					
  <TABLE id="tableinfo" width="100%"  >
  	<TR id="trdark"> 
  	  <TH>&nbsp;</TH>
      <TH ALIGN=CENTER NOWRAP>Account</TH>
      <TH ALIGN=CENTER NOWRAP>Customer Name</TH>
	  <TH ALIGN=CENTER NOWRAP>Procces Date</TH>
	  <TH ALIGN=CENTER NOWRAP>Interest Rate</TH>
      <TH ALIGN=CENTER NOWRAP>Floating Table</TH>
      <TH ALIGN=CENTER NOWRAP>Floating Type</TH>
    </TR>

    <%
    list.initRow();
    int k=0;
	
    while (list.getNextRow()) {
        datapro.eibs.beans.EDL115801Message beanlist = (datapro.eibs.beans.EDL115801Message) list.getRecord();
        k = list.getCurrentRow();
	%>
					
	<TR>
		<TD NOWRAP>
			<input type="radio" name="ROW" value="<%=k%>" >
		</TD>
		<TD NOWRAP ALIGN="CENTER"><%= Util.formatCell(beanlist.getE01DEAACC())%></TD>
		<TD NOWRAP ALIGN="LEFT"><%= Util.formatCell(beanlist.getE01CUSNA1())%></TD>
	    <TD ALIGN=CENTER><%= Util.formatDate( beanlist.getE01CDVUD1(), beanlist.getE01CDVUD2(), beanlist.getE01CDVUD3()) %></TD>
	    <TD ALIGN=CENTER><%= Util.fcolorCCY( beanlist.getE01CDVNRT() ) %></TD>
		<TD ALIGN=CENTER><%= Util.formatCell( beanlist.getE01CDVFTB() ) %></TD>
		<TD ALIGN=CENTER><%= Util.formatCell( beanlist.getE01CDVFTY() ) %></TD>
	</TR>
	                 
   <%                         
   	}
   %> 
</TABLE>

</FORM>

</BODY>
</HTML>
