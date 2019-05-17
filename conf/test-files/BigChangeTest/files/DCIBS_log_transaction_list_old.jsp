<html>
<head>
<title>Maestro de Agencias</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<%@ page import = "datapro.eibs.master.Util" %>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "paramters" class= "datapro.eibs.beans.DC_SEARCH"  scope="session" />
<jsp:useBean id= "lstTransactions" class= "datapro.eibs.beans.JBObjList"  scope="session" />


<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>


<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
%>


<H3 align="center">Select Entity <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="DCIBS_log_transaction_list.jsp, DCIBS"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/com.datapro.eibs.internet.JSLogTransSearch" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1">
  
<%
if ( lstTransactions.getNoResult() ) {
%>
	<TABLE class="tbenter" width=100% height=50%>
 		<TR>
      		<TD>
      			<div align="center"> <b>Your search criteria does not exist in files</b></div>
      		</TD>
      	</TR>
   	</TABLE>
   	
<% } else { %>

	<TABLE class="tableinfo" style="width:95%" ALIGN=CENTER>
	    <TR id="trdark"> 
	      <TH ALIGN=CENTER  nowrap width="5%">Date</TH>
	      <TH ALIGN=CENTER  nowrap width="5%">Time</TH>
	      <TH ALIGN=CENTER  nowrap width="10%">User</TH>
	      <TH ALIGN=CENTER  nowrap width="10%">Transaction</TH>
	      <TH ALIGN=CENTER  nowrap width="10%">Debit Account</TH>
	      <TH ALIGN=CENTER  nowrap width="10%">Credit Account</TH>
	      <TH ALIGN=CENTER  nowrap width="10%">Amount</TH>
	      <TH ALIGN=LEFT  nowrap width="40%">Remark</TH>
	    </TR>
	     	<%
	        lstTransactions.initRow(); 
	        while (lstTransactions.getNextRow()) {
	           datapro.eibs.beans.DC_LOG msg = (datapro.eibs.beans.DC_LOG) lstTransactions.getRecord();
	     	%>               
	        <TR>
	        	<TD NOWRAP ALIGN="CENTER"><%= Util.formaDate(msg.getTDATE()) %>&nbsp;</TD>
	        	<TD NOWRAP ALIGN="CENTER"><%= Util.formaTime(msg.getDTTM()) %>&nbsp;</TD>
	        	<TD NOWRAP ALIGN="CENTER"><%= msg.getUSERID() %>&nbsp;</TD>
	        	<TD ALIGN="LEFT"><%= msg.getTRANSCODE() %>&nbsp;</TD>
	        	<TD NOWRAP ALIGN="LEFT"><%= msg.getDEBITACC() %>&nbsp;</TD>
	        	<TD NOWRAP ALIGN="LEFT"><%= msg.getCREDITACC() %>&nbsp;</TD>
	        	<TD NOWRAP ALIGN="RIGHT"><%= msg.getAMOUNT() %>&nbsp;</TD>
	        	<TD ALIGN="LEFT"><%= msg.getREMARK() %></TD>
			</TR>   		
	    	<%}%>   
	  </TABLE>
	  
	<TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    	<TR>
      		<TD WIDTH="50%" ALIGN=LEFT height="25"> 
      		<%
        		if ( lstTransactions.getShowPrev() ) {
      				int pos = lstTransactions.getFirstRec() - 50;
      			   	out.print("<A HREF=\""+request.getContextPath() +
      			   	          "/servlet/com.datapro.eibs.internet.JSLogTransSearch?SCREEN=2" + 
      			   	          "&FromRecord=" + pos + 
      			   	          "&ENTITY=" + paramters.getENTITYID() + 
      			   	          "&SEARCH=" + paramters.getSEARCH() + 
      			   	          "&TRANSCODE=" + paramters.getTRANSCODE() + 
      			   	          "&FD1=" + paramters.getFD1() + 
      			   	          "&FD2=" + paramters.getFD2() + 
      			   	          "&FD3=" + paramters.getFD3() + 
      			   	          "&ED1=" + paramters.getED1() + 
      			   	          "&ED2=" + paramters.getED2() + 
      			   	          "&ED3=" + paramters.getED3() + 
      			   	          "\" ><img src=\"" + 
      			   	          request.getContextPath() +
      			   	          "/images/e/previous_records.gif\" border=0></A>");
        		}
			%> 
			</TD>
 	  		<TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  		<%       
        		if ( lstTransactions.getShowNext() ) {
      				int pos = lstTransactions.getLastRec();
      				out.print("<A HREF=\""+request.getContextPath() +
      				          "/servlet/com.datapro.eibs.internet.JSLogTransSearch?SCREEN=2" +
      				          "&FromRecord=" + pos + 
      			   	          "&ENTITY=" + paramters.getENTITYID() + 
      			   	          "&SEARCH=" + paramters.getSEARCH() + 
      			   	          "&TRANSCODE=" + paramters.getTRANSCODE() + 
      			   	          "&FD1=" + paramters.getFD1() + 
      			   	          "&FD2=" + paramters.getFD2() + 
      			   	          "&FD3=" + paramters.getFD3() + 
      			   	          "&ED1=" + paramters.getED1() + 
      			   	          "&ED2=" + paramters.getED2() + 
      			   	          "&ED3=" + paramters.getED3() + 
      				          "\" ><img src=\"" +
      				          request.getContextPath() + 
      				          "/images/e/next_records.gif\" border=0></A>");

        		}
			%> 
			</TD>
	 	</TR>
	</TABLE>

<% } %>

<table class="tbenter" width=100% align=center>
	<tr> 
        <td><div align="center"><input id="EIBSBTN" type=submit name="Return" value="Return"></div></td>
    </tr>
</table>
  
  </form>
</body>
</html>
