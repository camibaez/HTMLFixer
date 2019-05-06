<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Inquiry</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "EBP0160List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT Language="javascript">

function goSearch() {
	if (getElement("SEARCHCDE").value == "") {
		alert("Please select a code o partial code to start the list!!!");
		return;	 
	}
	document.forms[0].submit();
}

function goInquiry() {
	isCheck();
	bilnum = getElement("E01BPBNUM").value;
    var pg = "";
	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0160?SCREEN=3" + 
	        "&E01BPBNUM=" + bilnum;
	CenterWindow(pg,900,600,2);	
	
}

function isCheck() {
	getElement("E01BPBNUM").value = getElementChecked("CODE").value;
} 

</SCRIPT>

</head>

<body>



<h3 align="center"> Bills Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" ALT="bill_inqury_list.jsp, EBP0160"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0160">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="6">
  <INPUT TYPE=HIDDEN NAME="E01BPBNUM" VALUE="">

<%	
	if ( EBP0160List.getNoResult() ) {
%>
	<TABLE class="tbenter"> 
		<TR>
			<TD align="CENTER" class="TDBKG" width="100%">
				<a href="<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0160?SCREEN=1"><b>Return to<BR>Search</b></a>
	  		</TD>
		</TR>
	</TABLE> 
 	<TABLE class="tbenter" width="100%" height=50%">
 		<TR>
      		<TD align="center" width="100%"> 
     			<h4 style="text-align:center"> There are no Bills for your search criteria.</h4>
    		</TD>
      	</TR>
   	</TABLE>
<%
	}
	else {
%>    
  <TABLE class="tbenter"> 
		<TR>
			<TD align="CENTER" class="TDBKG" width="50%">
				<a href="javascript:goInquiry()"><b>Bill<br>Inquiry</b></a>
			</TD>
			<TD align="CENTER" class="TDBKG" width="50%">
				<a href="<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0160?SCREEN=1"><b>Return to<BR>Search</b></a>
	  		</TD>
		</TR>
	</TABLE>   
	<TABLE class="tableinfo" id="dataTable">
    	<TR id=trdark> 
			<td NOWRAP align="center" width="5%"><B>Sel</B></td>
			<td NOWRAP align="center" width="5%"><B>Internal<BR>Number</B></td>
			<td NOWRAP align="center" width="10%"><B>Bill<BR>Reference</B></td>
			<td NOWRAP align="center" width="5%"><B>Payment<BR>Due Date</B></td>
			<td NOWRAP align="center" width="20%"><B>Vendor Name</B></td>
			<td NOWRAP align="center" width="20%"><B>Bill Description</B></td>
			<td nowrap align="center" width="10%"><B>Amount</B></td>
			<td NOWRAP align="center" width="5%"><B>Payment<BR>Via</B></td>
			<td NOWRAP align="center" width="5%"><B>Payment<BR>Type</B></td>
			<td NOWRAP align="center" width="5%"><B>Bill<BR>Type</B></td>
			<td NOWRAP align="center" width="5%"><B>Bill<BR>Status</B></td>
		</TR>
         <%
    	  int i = 0;
          EBP0160List.initRow();    
          while (EBP0160List.getNextRow()) {
            EBP016001Message msgList = (EBP016001Message) EBP0160List.getRecord();
		%>              
    	<TR id=trclear>

			<td NOWRAP align="center" width="5%"> 
            	<INPUT type="radio" name="CODE" value="<%= msgList.getE01BPBNUM() %>">
			</td>
        	<td NOWRAP align="center" width="5%" ><%= msgList.getE01BPBNUM() %></td>
			<td NOWRAP align="left" width="10%" ><%= msgList.getE01BPBBIL() %></td>
			<td NOWRAP align="left" width="5%" ><%= datapro.eibs.master.Util.formatDate(msgList.getE01BPBPDM(),msgList.getE01BPBPDD(),msgList.getE01BPBPDY())%></td>
			<td NOWRAP align="left" width="20%" ><%= msgList.getE01BPBVCN() %></td>
			<td NOWRAP align="left" width="20%" ><%= msgList.getE01BPBDSC() %></td>
			<td NOWRAP align="right" width="10%" ><%= msgList.getE01BPBBAM() %></td>
			<td NOWRAP align="center" width="5%" >
		   		<% if(msgList.getE01BPBPVI().equals("A")) out.print("ACH");%>
		     	<% if(msgList.getE01BPBPVI().equals("R")) out.print("Retail Account");%>
		     	<% if(msgList.getE01BPBPVI().equals("G")) out.print("GL Account");%>
		     	<% if(msgList.getE01BPBPVI().equals("C")) out.print("Official Check");%>
		     	<% if(msgList.getE01BPBPVI().equals("S")) out.print("Swift");%>
		     	<% if(msgList.getE01BPBPVI().equals("P")) out.print("Petty Cash");%>
			</td>
			<td NOWRAP align="left" width="5%" >
		    	<% if(msgList.getE01BPBPTY().equals("F")) out.print("Fixed Amount");%>
		     	<% if(msgList.getE01BPBPTY().equals("V")) out.print("Variable Amount");%>
			</td>
			<td NOWRAP align="left" width="5%" ><%= msgList.getE01BPBTYPD() %></td>
			<td NOWRAP align="left" width="5%" >
				<% if (msgList.getE01BPBSTS().equals("W")) out.print("Pending");%>
	          	<% if (msgList.getE01BPBSTS().equals("A")) out.print("Active");%>
	          	<% if (msgList.getE01BPBSTS().equals("P")) out.print("Paid-Off");%>
	          	<% if (msgList.getE01BPBSTS().equals("S")) out.print("Suspended");%>
	          	<% if (msgList.getE01BPBSTS().equals("R")) out.print("Rejected");%>
	          	<% if (msgList.getE01BPBSTS().equals("V")) out.print("Void");%>   
			</td>
		</TR>
       <% 
       	 i++; 
        } 
       %> 
  	</TABLE>
  
<BR>

<%      
  }
%> 
</form>
<script type="text/javascript">
	radioClick("CODE", 0);
</script>
</body>
</html>
