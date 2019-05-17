<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Money Market List</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "beanList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">

function showInquiry(app, acc) {

	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0320?SCREEN=3&APP=" + app + "&ACC=" + acc;
	CenterWindow(page,600,500,2);
 
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

<h3 align="center">Money Market Processing List<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="matt_inq_list.jsp, EDL0320"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0320">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="3">
  <INPUT TYPE=HIDDEN NAME="opt" VALUE="">
    
<%
	if ( beanList.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center"> There is no Result for your search criteria.</h4> 
      </div>
      </TD></TR>
   	</TABLE>
<%
	}
	else {
%>
  
  <TABLE class="tableinfo" id="dataTable">
    <TR id="trdark">
      <TH ALIGN=CENTER  nowrap >Event</TH>
      <TH ALIGN=CENTER  nowrap >Event<br>Date</TH>
      <TH ALIGN=CENTER  nowrap >Account<br>Number</TH>
      <TH ALIGN=CENTER  nowrap >Type</TH>
      <TH ALIGN=CENTER  nowrap >Customer</TH>
      <TH ALIGN=CENTER  nowrap >CCY</TH>
      <TH ALIGN=CENTER  nowrap >Principal</TH>      
      <TH ALIGN=CENTER  nowrap >Interest</TH>
      <TH ALIGN=CENTER  nowrap >Interest<br>Rate</TH>
      <TH ALIGN=CENTER  nowrap >Maturity<br>Date</TH>
    </TR>
    
    <%
    	  String E01DTEFRM = userPO.getHeader1();
    	  String E01DTEFRD = userPO.getHeader2();
    	  String E01DTEFRY = userPO.getHeader3();
    	  
    	  String E01DTETOM = userPO.getHeader4();
    	  String E01DTETOD = userPO.getHeader5();
    	  String E01DTETOY = userPO.getHeader6();
    	  
    	  String E01EVETYP = userPO.getHeader7();
                   
          beanList.initRow();             
          while (beanList.getNextRow()) {
               EDL032001Message msgList = (EDL032001Message) beanList.getRecord();		
       %>             
        <TR>
		  <td NOWRAP >
          	<a href="javascript:showInquiry('<%=msgList.getE01EDLACD()%>','<%=msgList.getE01EDLACC()%>')"><%=Util.formatCell(msgList.getE01EDLTYD())%></a>
		  </td>   
		  <td NOWRAP >
          	<a href="javascript:showInquiry('<%=msgList.getE01EDLACD()%>','<%=msgList.getE01EDLACC()%>')"><%=Util.formatDate(msgList.getE01EDLEV1(),msgList.getE01EDLEV2(),msgList.getE01EDLEV3())%></a>
		  </td>   
          <td NOWRAP align=center>
          	<a href="javascript:showInquiry('<%=msgList.getE01EDLACD()%>','<%=msgList.getE01EDLACC()%>')"><%=Util.formatCell(msgList.getE01EDLACC())%></a>
		  </td>		  	  
		  <td NOWRAP >
          	<a href="javascript:showInquiry('<%=msgList.getE01EDLACD()%>','<%=msgList.getE01EDLACC()%>')"><%=Util.formatCell(msgList.getE01EDLDEA())%></a>
		  </td>
		  <td NOWRAP >
			<a href="javascript:showInquiry('<%=msgList.getE01EDLACD()%>','<%=msgList.getE01EDLACC()%>')"><%=Util.formatCell(msgList.getE01EDLNA1())%></a>
		  </td>		  
		  <td NOWRAP >
          	<a href="javascript:showInquiry('<%=msgList.getE01EDLACD()%>','<%=msgList.getE01EDLACC()%>')"><%=Util.formatCell(msgList.getE01EDLCCY())%></a>
		  </td>
		  <td NOWRAP >
          	<a href="javascript:showInquiry('<%=msgList.getE01EDLACD()%>','<%=msgList.getE01EDLACC()%>')"><%=Util.formatCell(msgList.getE01EDLPRI())%></a>
		  </td>
		  <td NOWRAP >
          	<a href="javascript:showInquiry('<%=msgList.getE01EDLACD()%>','<%=msgList.getE01EDLACC()%>')"><%=Util.formatCell(msgList.getE01EDLINT())%></a>
		  </td>
		  <td NOWRAP >
          	<a href="javascript:showInquiry('<%=msgList.getE01EDLACD()%>','<%=msgList.getE01EDLACC()%>')"><%=Util.formatCell(msgList.getE01EDLRTE())%></a>
		  </td>		  
		  <td NOWRAP >
          	<a href="javascript:showInquiry('<%=msgList.getE01EDLACD()%>','<%=msgList.getE01EDLACC()%>')"><%=Util.formatDate(msgList.getE01EDLSD1(),msgList.getE01EDLSD2(),msgList.getE01EDLSD3())%></a>
		  </td>
		</TR>
		
        <% 
         }
         %> 
  </TABLE>
  <TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> <%
        if ( beanList.getShowPrev() ) {
      			int pos =beanList.getFirstRec() - 51;
      			   out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSEDL0320?SCREEN=2&E01DTEFRM=" + E01DTEFRM + "&E01DTEFRD=" + E01DTEFRD + "&E01DTEFRY=" + E01DTEFRY+ "&E01EVETYP=" + E01EVETYP + "&FromRecord=" + pos +"\" > <img src=\""+request.getContextPath()+"/images/e/previous_records.gif\" border=0></A>");
        }
%> </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> <%       
        if ( beanList.getShowNext() ) {
      			int pos = beanList.getLastRec();
      			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSEDL0320?SCREEN=2&E01DTEFRM=" + E01DTEFRM + "&E01DTEFRD=" + E01DTEFRD + "&E01DTEFRY=" + E01DTEFRY+ "&E01EVETYP=" + E01EVETYP + "&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/e/next_records.gif\" border=0></A>");

        }
%> </TD>
	 </TR>
	 </TABLE>
<%      
  }
%> 
</form>
</body>
</html>
