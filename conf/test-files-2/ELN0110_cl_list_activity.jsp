<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>
Line of Credit Activity List
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "clList" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "header" class= "datapro.eibs.beans.ELN011002Message"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

</HEAD>

<BODY>
<%@ page import = "datapro.eibs.master.Util" %>

<h3 align="center">Line of Credit Activity<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cl_list_activity.jsp,ELN0110"></h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.credit.JSELN0110" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="8">

<%
	if ( clList.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
        <div align="center"> <b> There is no match for your criteria </b></div>
      </TD></TR>
   		</TABLE>
<%   		
	}
	else {
%>
  <table class="tableinfo">
    <tr > 
      <td nowrap>
        
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <TD ALIGN=RIGHT width="26%"> Customer :</TD>
            <TD ALIGN=LEFT width="14%" > 
              <div align="left"><%= Util.formatCell(header.getE02LNECUN()) %></div>
            </TD>
            <TD ALIGN=LEFT width="8%" > 
              <div align="left"><%= Util.formatCell(header.getE02LNENUM()) %></div>
            </TD>
            <TD ALIGN=LEFT width="12%" > 
              <div align="right">Name :</div>
            </TD>
            <TD ALIGN=LEFT colspan="2" > 
              <div align="left"><%= Util.formatCell(header.getE02CUSNA1()) %></div>
            </TD>
          </TR>
          <tr id="trdark"> 
            <TD ALIGN=RIGHT WIDTH=26%> 
              <div align="right">Maturity Date :</div>
            </TD>
            <TD ALIGN=LEFT colspan="2"> 
              <div align="left"><%= Util.formatDate(header.getE02LNEMT1(), header.getE02LNEMT2(), header.getE02LNEMT3()) %></div>
            </TD>
            <TD ALIGN=LEFT colspan="2"> 
              <div align="right"> Original Amount :</div>
            </TD>
            <TD ALIGN=LEFT WIDTH=28%> 
              <div align="right"><%= Util.fcolorCCY(header.getE02LNEAMN()) %></div>
            </TD>
          </TR>
          <tr id="trdark"> 
            <TD ALIGN=RIGHT WIDTH=26%> 
              <div align="right">Currency Code :</div>
            </TD>
            <TD ALIGN=LEFT colspan="2"> 
              <div align="left"><%= Util.formatCell(header.getE02LNECCY()) %></div>
            </TD>
            <TD ALIGN=LEFT colspan="2"> 
              <div align="right">Reassignment :</div>
            </TD>
            <TD ALIGN=LEFT WIDTH=28%> 
              <div align="right"><%= Util.fcolorCCY(header.getE02LNEREA()) %></div>
            </TD>
          </TR>
          <tr id="trdark"> 
            <TD ALIGN=RIGHT WIDTH=26%> 
              <div align="right">Line Type :</div>
            </TD>
            <TD ALIGN=LEFT colspan="2"> 
              <div align="left"><%= Util.formatCell(header.getE02LNETYL()) %></div>
            </TD>
            <TD ALIGN=LEFT colspan="2"> 
              <div align="right">Amount Used :</div>
            </TD>
            <TD ALIGN=LEFT WIDTH=28%> 
              <div align="right"><%= Util.fcolorCCY(header.getE02USEAMT()) %></div>
            </TD>
          </TR>
          <tr id="trdark"> 
            <TD ALIGN=RIGHT WIDTH=26%> 
              <div align="right">Category :</div>
            </TD>
            <TD ALIGN=LEFT colspan="2"> 
              <div align="left"><%= Util.formatCell(header.getE02LNECAT()) %></div>
            </TD>
            <TD ALIGN=LEFT colspan="2"> 
              <div align="right">Available Amount :</div>
            </TD>
            <TD ALIGN=LEFT WIDTH=28%> 
              <div align="right"><%= Util.fcolorCCY(header.getE02AVAILA()) %></div>
            </TD>
          </TR>
          <tr id="trdark"> 
            <TD ALIGN=RIGHT WIDTH=26%> 
              <div align="right"></div>
            </TD>
            <TD ALIGN=LEFT colspan="2"> 
              <div align="left"></div>
            </TD>
            <TD ALIGN=LEFT colspan="2"> 
              <div align="right">Today's Maturity :</div>
            </TD>
            <TD ALIGN=LEFT WIDTH=28%> 
              <div align="right"><%= Util.fcolorCCY(header.getE02LNETMA()) %></div>
            </TD>
          </TR>
        </TABLE>
	  </TD>
    </TR>
  </TABLE>
<BR>
  
<TABLE class="tableinfo">
  <TR id="trdark"> 
      <TH ALIGN=CENTER>Contract Number</TH>
      <TH ALIGN=CENTER>Opening Date</TH>
      <TH ALIGN=CENTER>Maturity Date</TH>
      <TH ALIGN=CENTER>CCY</TH>
      <TH ALIGN=CENTER>Equivalent Amount</TH>
      <TH ALIGN=CENTER>Account Type</TH>
      <TH ALIGN=CENTER>Use by Type</TH>
  </TR>
  <%
                clList.initRow();
                while (clList.getNextRow()) {
                    if (clList.getFlag().equals("")) {
                    		out.println(clList.getRecord());
                    }
                }
    %> 
</TABLE>
<BR>
<TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
<%
        if ( clList.getShowPrev() ) {
      			int pos = clList.getFirstRec() - 51;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.credit.JSELN0110?SCREEN=7&Pos=" + pos + "\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/previous_records.gif\" ></A>");
        }
%>  
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>     
 <% 
        if ( clList.getShowNext() ) {
      			int pos = clList.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.credit.JSELN0110?SCREEN=7&Pos=" + pos + "\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/next_records.gif\" ></A>");
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
