<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Deals Maturity Information List</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "beanList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">

function showInquiry(app, acc) {

	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0310?SCREEN=3&APP=" + app + "&ACC=" + acc;
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

<h3 align="center">Deals Maturity Information List<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="mat_inf_list.jsp, EDL0310"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0310">

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
      <TH ALIGN=CENTER  nowrap >Deal<br>Number</TH>
      <TH ALIGN=CENTER  nowrap >Customer<br>Name</TH>
      <TH ALIGN=CENTER  nowrap >CCY</TH>
      <TH ALIGN=CENTER  nowrap >Principal</TH>      
      <TH ALIGN=CENTER  nowrap >Interest</TH>
      <TH ALIGN=CENTER  nowrap >Floating<br>Rate</TH>
      <TH ALIGN=CENTER  nowrap >Spread</TH>
      <TH ALIGN=CENTER  nowrap >Total<br>Rate</TH>
      <TH ALIGN=CENTER  nowrap >Starting<br>Date</TH>
      <TH ALIGN=CENTER  nowrap >Maturity<br>Date</TH>
      <TH ALIGN=CENTER  nowrap >Account<br>Type</TH>
    </TR>
    
    <%
    	  String E01SELFM1 = userPO.getHeader1();
    	  String E01SELFM2 = userPO.getHeader2();
    	  String E01SELFM3 = userPO.getHeader3();
    	  String E01SELACD = userPO.getHeader4();
                   
          beanList.initRow();             
          while (beanList.getNextRow()) {
               EDL031001Message msgList = (EDL031001Message) beanList.getRecord();		
       %>             
        <TR>
          <td NOWRAP align=center>
          	<a href="javascript:showInquiry('<%=msgList.getE01SELACD()%>','<%=msgList.getE01DEAACC()%>')"><%=Util.formatCell(msgList.getE01DEAACC())%></a>
		  </td>		  
		  <td NOWRAP >
			<a href="javascript:showInquiry('<%=msgList.getE01SELACD()%>','<%=msgList.getE01DEAACC()%>')"><%=Util.formatCell(msgList.getE01CUSNA1())%></a>
		  </td>		  
		  <td NOWRAP >
          	<a href="javascript:showInquiry('<%=msgList.getE01SELACD()%>','<%=msgList.getE01DEAACC()%>')"><%=Util.formatCell(msgList.getE01DEACCY())%></a>
		  </td>
		  <td NOWRAP >
          	<a href="javascript:showInquiry('<%=msgList.getE01SELACD()%>','<%=msgList.getE01DEAACC()%>')"><%=Util.formatCell(msgList.getE01DEAPRI())%></a>
		  </td>
		  <td NOWRAP >
          	<a href="javascript:showInquiry('<%=msgList.getE01SELACD()%>','<%=msgList.getE01DEAACC()%>')"><%=Util.formatCell(msgList.getE01DEAINT())%></a>
		  </td>
		  <td NOWRAP >
          	<a href="javascript:showInquiry('<%=msgList.getE01SELACD()%>','<%=msgList.getE01DEAACC()%>')"><%=Util.formatCell(msgList.getE01DEAFRT())%></a>
		  </td>
		  <td NOWRAP >
          	<a href="javascript:showInquiry('<%=msgList.getE01SELACD()%>','<%=msgList.getE01DEAACC()%>')"><%=Util.formatCell(msgList.getE01DEARTE())%></a>
		  </td>
		  <td NOWRAP >
          	<a href="javascript:showInquiry('<%=msgList.getE01SELACD()%>','<%=msgList.getE01DEAACC()%>')"><%=Util.formatCell(msgList.getE01TOTRAT())%></a>
		  </td>
		  <td NOWRAP >
          	<a href="javascript:showInquiry('<%=msgList.getE01SELACD()%>','<%=msgList.getE01DEAACC()%>')"><%=Util.formatDate(msgList.getE01DEASD1(),msgList.getE01DEASD2(),msgList.getE01DEASD3())%></a>
		  </td>
		  <td NOWRAP >
          	<a href="javascript:showInquiry('<%=msgList.getE01SELACD()%>','<%=msgList.getE01DEAACC()%>')"><%=Util.formatDate(msgList.getE01DEAMA1(),msgList.getE01DEAMA2(),msgList.getE01DEAMA3())%></a>
		  </td>
		  <td NOWRAP >
          	<a href="javascript:showInquiry('<%=msgList.getE01SELACD()%>','<%=msgList.getE01DEAACC()%>')"><%=Util.formatCell(msgList.getE01DEATYP())%></a>
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
      			   out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSEDL0310?SCREEN=2&E01SELFM1=" + E01SELFM1 + "&E01SELFM2=" + E01SELFM2 + "&E01SELFM3=" + E01SELFM3+ "&E01SELACD=" + E01SELACD + "&FromRecord=" + pos +"\" > <img src=\""+request.getContextPath()+"/images/e/previous_records.gif\" border=0></A>");
        }
%> </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> <%       
        if ( beanList.getShowNext() ) {
      			int pos = beanList.getLastRec();
      			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSEDL0310?SCREEN=2&E01SELFM1=" + E01SELFM1 + "&E01SELFM2=" + E01SELFM2 + "&E01SELFM3=" + E01SELFM3+ "&E01SELACD=" + E01SELACD + "&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/e/next_records.gif\" border=0></A>");

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
