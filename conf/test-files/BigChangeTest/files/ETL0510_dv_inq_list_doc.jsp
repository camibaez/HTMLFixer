<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util"%>
<HTML>
<HEAD>
<TITLE>
Others Documents
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</HEAD>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>



<jsp:useBean id= "dvList" class= "datapro.eibs.beans.JBList"  scope="session"/>



<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>


<BODY>


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>


<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%> 

<FORM>
 <h3 align="center">Miscelaneous Documents Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="cd_opening.jsp,EDL0130"> 
  </h3>
  <hr size="4">
<%
	if ( dvList.getNoResult() ) {
%>
 		<TABLE class="tbenter" width=100% height=100%>
 		<TR>
      <TD> 
        
        <div align="center"> <b>There is no match for your search 
          criteria</b> </div>
      </TD></TR>
   		</TABLE>
  <%
	}
	else {
%> 
 
  <BR>
  <TABLE class="tableinfo">
    <TR id="trdark"> 
      <TH ALIGN=CENTER  nowrap width="10%">Reference</TH>
      <TH ALIGN=CENTER  nowrap width="8%">Currency</TH>
      <TH ALIGN=CENTER  nowrap width="7%">Branch</TH>
      <TH ALIGN=CENTER  nowrap width="9%">Amount</TH>
      <TH ALIGN=CENTER  nowrap width="5%"> 
        <div align="right">Status</div>
      </TH>
      <TH ALIGN=CENTER  nowrap width="6%"> 
        <div align="center">Issued</div>
      </TH>
      <TH ALIGN=CENTER  nowrap width="55%"> 
        <div align="center">Beneficiary</div>
      </TH>
    </TR>
    <%
                dvList.initRow();
                while (dvList.getNextRow()) {
                    if (dvList.getFlag().equals("")) {
                    		out.println(dvList.getRecord());
                    }
                }
              %> 
  </TABLE>
  <BR>
  
  <TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>

<%
        if ( dvList.getShowPrev() ) {
      			int pos = dvList.getFirstRec() - 51;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSETL0510?SCREEN=1&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/e/previous_records.gif\" border=0></A>");
        }
 %>
 </TD>
 <TD WIDTH="50%" ALIGN=RIGHT>
 <%       
        if ( dvList.getShowNext() ) {
      			int pos = dvList.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSETL0510?SCREEN=1&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/e/next_records.gif\" border=0></A>");
        }
 %>
 </TD>
  </TR>
 </TABLE>
<%        
  }
%> 
</FORM>

</BODY>
</HTML>
