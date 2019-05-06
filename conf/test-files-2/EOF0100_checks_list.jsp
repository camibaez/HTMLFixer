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


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "dvList" class= "datapro.eibs.beans.JBObjList"  scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<script language="JavaScript">
  
  function ShowAction(numchk, numrow) {

    document.forms[0].E01STPCKN.value = numchk;
    document.forms[0].ROW.value = numrow;
	document.forms[0].submit();
 	 
  }
</script>

</HEAD>
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

<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEOF0100" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="3">
<INPUT TYPE=HIDDEN NAME="E01STPCKN" VALUE="">
<INPUT TYPE=HIDDEN NAME="ROW" VALUE="">

 <h3 align="center"><% if (userPO.getIdentifier().equals("D")) {out.print("Available Officials Checks for Stop Payment");} else {out.print("Stop Payment Checks for Release");}%> <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="checks_list.jsp,EOF01000"> 
  </h3>
  <hr size="4">
<%
	if ( dvList.getNoResult() ) {

    	String action = "";
	try {
		action = userPO.getHeader20();
		userPO.setHeader20("");
       }
       catch (Exception e) {
       	action = "";
       }
       String pagename = "";
       try {
       	pagename = userPO.getHeader21();
       	userPO.setHeader21("");
       }
       catch (Exception e) {
       	pagename = "";
       }
	               
       if ( action.equals("DO_MAINT") || action.equals("DO_NEW")) {
              if ( !pagename.equals("") ) {
%>
       	<SCRIPT Language="Javascript">
	   		CenterWindow('<%= pagename %>',620,500,2);
       	</SCRIPT>
<% 
              }
	}
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
	
		String action = "";
	try {
		action = userPO.getHeader20();
		userPO.setHeader20("");
       }
       catch (Exception e) {
       	action = "";
       }
       String pagename = "";
       try {
       	pagename = userPO.getHeader21();
       	userPO.setHeader21("");
       }
       catch (Exception e) {
       	pagename = "";
       }
               
       if ( action.equals("DO_MAINT") || action.equals("DO_NEW")) {
              if ( !pagename.equals("") ) {
%>
       	<SCRIPT Language="Javascript">
	   		CenterWindow('<%= pagename %>',620,500,2);
       	</SCRIPT>
<% 
              }
	}
%>	
 
 
  <BR>
  <TABLE class="tableinfo">
    <TR id="trdark"> 
      <TH ALIGN=CENTER  nowrap width="10%">Reference</TH>
      <TH ALIGN=CENTER  nowrap width="8%">Currency</TH>
      <TH ALIGN=CENTER  nowrap width="7%">Branch</TH>
      <TH ALIGN=CENTER  nowrap width="9%">Amount</TH>
      <TH ALIGN=CENTER  nowrap width="6%"> 
        <div align="center">Issued</div>
      </TH>
      <TH ALIGN=CENTER  nowrap width="55%"> 
        <div align="center">Beneficiary</div>
      </TH>
    </TR>
			    <%
		               dvList.initRow();
		                int k=1;
		               while (dvList.getNextRow()) {
		               		datapro.eibs.beans.ETL051001Message msgCh = (datapro.eibs.beans.ETL051001Message)dvList.getRecord();
			     %> 
			    <TR> 
			      <TD ALIGN=LEFT NOWRAP><a href="javascript:ShowAction('<%= msgCh.getE01OFMNCH() %>','<%= dvList.getCurrentRow() %>')"><%= Util.formatCell(msgCh.getE01OFMNCH()) %></a></TD>
			      <TD ALIGN=LEFT NOWRAP><a href="javascript:ShowAction('<%= msgCh.getE01OFMNCH() %>','<%= dvList.getCurrentRow() %>')"><%= Util.formatCell(msgCh.getE01OFMCCY()) %></a></TD>
				  <TD ALIGN=LEFT NOWRAP><a href="javascript:ShowAction('<%= msgCh.getE01OFMNCH() %>','<%= dvList.getCurrentRow() %>')"><%= Util.formatCell(msgCh.getE01OFMBRN()) %></a></TD>
			      <TD ALIGN=RIGHT NOWRAP><a href="javascript:ShowAction('<%= msgCh.getE01OFMNCH() %>','<%= dvList.getCurrentRow() %>')"><%= Util.formatCell(msgCh.getE01OFMMCH()) %></a></TD>
			      <TD ALIGN=CENTER NOWRAP><a href="javascript:ShowAction('<%= msgCh.getE01OFMNCH() %>','<%= dvList.getCurrentRow() %>')"><%= Util.formatDate(msgCh.getE01OFMID1(),msgCh.getE01OFMID2(),msgCh.getE01OFMID3()) %></a></TD>
			      <TD ALIGN=LEFT NOWRAP><a href="javascript:ShowAction('<%= msgCh.getE01OFMNCH() %>','<%= dvList.getCurrentRow() %>')"><%= Util.formatCell(msgCh.getE01OFMBNF()) %></a></TD>
			    </TR>
			    <%
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
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSEOF0100?SCREEN=2&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/e/previous_records.gif\" border=0></A>");
        }
 %>
 </TD>
 <TD WIDTH="50%" ALIGN=RIGHT>
 <%       
        if ( dvList.getShowNext() ) {
      			int pos = dvList.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSEOF0100?SCREEN=2&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/e/next_records.gif\" border=0></A>");
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
