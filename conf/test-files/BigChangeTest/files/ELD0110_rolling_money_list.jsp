<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Anti-Money Laundering ("AML")</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "beanList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">

function showInquiry(app, acc) {

	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELD0110?SCREEN=3&APP=" + app + "&ACC=" + acc;
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

<h3 align="center">Exception Inquiry for Anti-Money Laundering<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="rolling_money_list.jsp, ELD0110"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELD0110">

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
      <TH ALIGN=CENTER  nowrap >Account<br>Number</TH>     
      <TH ALIGN=CENTER  nowrap >Account<br>Type</TH>
      <!--<TH ALIGN=CENTER  nowrap >Transaction<br>Date</TH>
      <TH ALIGN=CENTER  nowrap >Product<br>Code</TH> --> 
      <TH ALIGN=CENTER  nowrap >Currency</TH>     
               
      <TH ALIGN=CENTER  nowrap >Activity<br>Type</TH>      
      <TH ALIGN=CENTER  nowrap >Actual<br>Counter</TH>
      <TH ALIGN=CENTER  nowrap >Expected<br>Counter</TH>
      <TH ALIGN=CENTER  nowrap >Actual<br>Amount</TH>
      <TH ALIGN=CENTER  nowrap >Expected<br>Amount</TH>     
      <TH ALIGN=CENTER  nowrap >Variance</TH>
      
    </TR>
    
    <%
    	  String E01FRODT1 = userPO.getHeader1();
    	  String E01FRODT2 = userPO.getHeader2();
    	  String E01FRODT3 = userPO.getHeader3();
    	  String E01RANGO = userPO.getHeader4();
    	   
                   
          beanList.initRow();             
          while (beanList.getNextRow()) {
               ELD011001Message msgList = (ELD011001Message) beanList.getRecord();		
       %>             
        <TR>
          <td NOWRAP >
          	<a href="javascript:showInquiry('<%=msgList.getE01RANGO()%>','<%=msgList.getE01ROLACC()%>')"><%=Util.formatCell(msgList.getE01ROLACC())%></a>
		  </td>			  		  	  
		  <td NOWRAP align=center>		    
          	 <a href="javascript:showInquiry('<%=msgList.getE01RANGO()%>','<%=msgList.getE01ROLACC()%>')"><%= Util.formatCell(msgList.getE01ROLATY())%></a> 
		  </td>
		  
		  <td NOWRAP align=center>
          	<a href="javascript:showInquiry('<%=msgList.getE01RANGO()%>','<%=msgList.getE01ROLACC()%>')"><%=Util.formatCell(msgList.getE01ROLCCY())%></a>
		  </td>
		   <td NOWRAP align=center>
          	<a href="javascript:showInquiry('<%=msgList.getE01RANGO()%>','<%=msgList.getE01ROLACC()%>')"><%=Util.formatCell(msgList.getE01ROLTYP())%></a>          	
		  </td>
		   
		  <td NOWRAP align=center>
          	<a href="javascript:showInquiry('<%=msgList.getE01RANGO()%>','<%=msgList.getE01ROLACC()%>')"><%=Util.formatCell(msgList.getE01ROLCEX())%></a>
		  </td>
		  <td NOWRAP align=center>
          	<a href="javascript:showInquiry('<%=msgList.getE01RANGO()%>','<%=msgList.getE01ROLACC()%>')"><%=Util.formatCell(msgList.getE01ROLCRE())%></a>
		  </td>
		   <td NOWRAP align=center>
          	<a href="javascript:showInquiry('<%=msgList.getE01RANGO()%>','<%=msgList.getE01ROLACC()%>')"><%=Util.formatCell(msgList.getE01ROLAEX())%></a>
		  </td>
		  
		   <td NOWRAP align=center>
          	<a href="javascript:showInquiry('<%=msgList.getE01RANGO()%>','<%=msgList.getE01ROLACC()%>')"><%=Util.formatCell(msgList.getE01ROLARE())%></a>
		  </td>
		 
		  
		  <td NOWRAP align=center>
          	<a href="javascript:showInquiry('<%=msgList.getE01RANGO()%>','<%=msgList.getE01ROLACC()%>')"><%=Util.formatCell(msgList.getE01ROLVAR())%></a>
		  
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
      			   out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSELD0110?SCREEN=2&E01FRODT1=" + E01FRODT1 + "&E01FRODT2=" + E01FRODT2 + "&E01FRODT3=" + E01FRODT3+ "&E01RANGO=" + E01RANGO + "&FromRecord=" + pos +"\" > <img src=\""+request.getContextPath()+"/images/e/previous_records.gif\" border=0></A>");
        }
%> </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> <%       
        if ( beanList.getShowNext() ) {
      			int pos = beanList.getLastRec();
      			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSELD0110?SCREEN=2&E01FRODT1=" + E01FRODT1 + "&E01FRODT2=" + E01FRODT2 + "&E01FRODT3=" + E01FRODT3+ "&E01RANGO=" + E01RANGO + "&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/e/next_records.gif\" border=0></A>");

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
