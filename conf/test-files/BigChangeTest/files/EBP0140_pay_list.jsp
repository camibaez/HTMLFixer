<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Vendors</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "EBP0140List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT Language="javascript">

var ok = false;

function goInquiry() {
	isCheck();
	bilnum = getElement("E01BPBNUM").value;
    var pg = "";
 	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0160?SCREEN=3" + "&E01BPBNUM=" + bilnum;
 	CenterWindow(pg,900,600,2);
}

function goModify() {
	isCheck();
	if ( !ok ) {
		alert("Please select a bill!!!");
		return;	 
	}
	getElement("SCREEN").value="3";
	document.forms[0].submit();
}

function goPay() {
	isCheck();
	if ( !ok ) {
		alert("Please select a Bill!!!");
		return;	 
	}
	getElement("SCREEN").value="4";
	if (!confirm("Do you want to Confirm / Deny the payment for this Bill?")) {
		return;
	}
	document.forms[0].submit();
} 

function goPayAll() {
	getElement("SCREEN").value="5";
	if (!confirm("Do you want to Confirm the payment for All Bills in the list?")) {
		return;
	}
	document.forms[0].submit();
} 

function isCheck() {
	var formLength= document.forms[0].elements.length;
   	ok = false;
	for(n=0;n<formLength;n++) {
     	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "CODE") {
			if (document.forms[0].elements[n].checked == true) {
				var I = document.forms[0].elements[n].value.indexOf("|");
				getElement("E01BPBNUM").value = document.forms[0].elements[n].value.substr(0,I);
				getElement("E01BPBSEQ").value = document.forms[0].elements[n].value.substr(I+1,3);		
				ok = true;		
        		break;
			}
      	}
    }

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

<h3 align="center">
	<% 	if (userPO.getType().equals("C")) { 
			out.println("Customer "); 
	 	} else { 
	 		out.println("Vendor ");
		} 
	%>Payments Selection
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="pay_list.jsp, EBP0140"></h3>

<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0140">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="6">
  <INPUT TYPE=HIDDEN NAME="E01BPBNUM" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E01BPBSEQ" VALUE="">

<%	 
	if ( EBP0140List.getNoResult() ) {
%>
	<TABLE class="tbenter"> 
		<TR>
	  		<TD align="CENTER" class="TDBKG" width="100%">
				<a href="<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0140?SCREEN=1"><b>Return to<BR>Search</b></a>
	  		</TD>
		</TR>
	</TABLE>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      		<TD>         
      			<div align="center"> <h4 style="text-align:center">There are no Bills for your search criteria.</h4> 
      			</div>
      		</TD></TR>
   	</TABLE>
<%
	}
	else {
%>    
	<TABLE class="tbenter"> 
		<TR>
			<TD align="CENTER" class="TDBKG" width="20%">
				<a href="javascript:goInquiry()"><b>Bill<br>Inquiry</b></a>
			</TD>
			<TD align="CENTER" class="TDBKG" width="20%">
				<a href="javascript:goModify()"><b>Modify<br>Payment</b></a>
      		</TD>
			<TD align="CENTER" class="TDBKG" width="20%">
				<a href="javascript:goPay()"><b>Confirm/Deny</b></a>
			</TD>
			<TD align="CENTER" class="TDBKG" width="20%">
				<a href="javascript:goPayAll()"><b>Confirm<br>All</b></a>
			</TD>
	  		<TD align="CENTER" class="TDBKG" width="20%">
				<a href="<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0140?SCREEN=1"><b>Return to<BR>Search</b></a>
	  		</TD>
		</TR>
	</TABLE> 

  <TABLE class="tableinfo" id="dataTable">
    <TR id=trdark> 
		<td NOWRAP align="center" width="2%"><B>Sel</B></td>
		<td NOWRAP align="center" width="5%"><B>Internal<BR>Number</B></td>
		<td NOWRAP align="center" width="2%"><B>Seq</B></td>
		<td NOWRAP align="center" width="5%"><B>Status</B></td>
		<td NOWRAP align="center" width="5%"><B>Bill<BR>Ref.</B></td>
		<td NOWRAP align="center" width="8%"><B>Due<BR>Date</B></td>
		<td NOWRAP align="center" width="8%"><B>Payment<BR>Date</B></td>
		<td NOWRAP align="center" width="15%"><B>Vendor Name</B></td>
		<td NOWRAP align="center" width="15%"><B>Bill Description</B></td>
		<td nowrap align="center" width="8%"><B>Bill<BR>Amount</B></td>
		<td nowrap align="center" width="8%"><B>Payment<BR>Amount</B></td>
		<td NOWRAP align="center" width="5%"><B>Bill<BR>Via</B></td>
		<td NOWRAP align="center" width="5%"><B>Payment<BR>Via</B></td>
		<td NOWRAP align="center" width="5%"><B>Payment<BR>Type</B></td>
		<td NOWRAP align="center" width="6%"><B>Bill<BR>Type</B></td>
	</TR>
    <TR id=trdark>
		<td NOWRAP align="center" width="2%"></td>
		<td NOWRAP align="center" width="5%"></td>
		<td NOWRAP align="center" width="2%"></td>
		<td NOWRAP align="center" width="5%"></td>
		<td nowrap align="center" width="5%"></td>
		<td NOWRAP align="center" width="8%"></td>
		<td NOWRAP align="center" width="8%"></td>
		<td nowrap align="center" width="15%"></td>
		<td nowrap align="center" width="13%"></td>
		<td nowrap align="center" width="8%"></td>
		<td nowrap align="center" width="8%"></td>
		<td nowrap align="center" width="5%"></td>
		<td nowrap align="center" width="5%"></td>
		<td nowrap align="center" width="5%"></td>
		<td nowrap align="center" width="6%"></td>

	</TR>
         <%
    	  int i = 0;
          EBP0140List.initRow();    
          while (EBP0140List.getNextRow()) {
            EBP014001Message msgList = (EBP014001Message) EBP0140List.getRecord();
		%>              
    <TR id=trclear>

		<td NOWRAP align="center" width="2%"> 
            <INPUT type="radio" name="CODE" value="<%= msgList.getE01BPBNUM()%>|<%= msgList.getE01BPBSEQ()%>" >
		</td>
		<td NOWRAP align="center" width="5%" ><%= msgList.getE01BPBNUM() %></td>
		<td NOWRAP align="center" width="2%" ><%= msgList.getE01BPBSEQ() %></td>		
        <td NOWRAP align="left" width="5%" >
        	<FONT color="green"><b>
        	<% if(msgList.getE01BPPSTS().equals("W")) out.print("Pending");%>
        	<% if(msgList.getE01BPPSTS().equals("C")) out.print("Confirm");%>
        	<% if(msgList.getE01BPPSTS().equals("A")) out.print("Approved");%>
        	<% if(msgList.getE01BPPSTS().equals("R")) out.print("Rejected");%>
        	</b></FONT>
		</td>    
		<td NOWRAP align="left" width="5%" ><%= msgList.getE01BPBBIL() %></td>
		<td NOWRAP align="center" width="8%" >
			<%= datapro.eibs.master.Util.formatDate(msgList.getE01BPBPDM(),msgList.getE01BPBPDD(),msgList.getE01BPBPDY())%>
		</td>
		<td NOWRAP align="center" width="8%" >
			<FONT color="green">
			<%= datapro.eibs.master.Util.formatDate(msgList.getE01BPPPDM(),msgList.getE01BPPPDD(),msgList.getE01BPPPDY())%>
			</FONT>
		</td>
		<td NOWRAP align="left" width="15%" ><%= msgList.getE01BPBVCN() %></td>
		<td NOWRAP align="left" width="13%" ><%= msgList.getE01BPBDSC() %></td>
		<td NOWRAP align="right" width="8%" ><%= msgList.getE01BPBBAM() %></td>
		<td NOWRAP align="right" width="8%" >
			<FONT color="green"><%= msgList.getE01BPPAMT() %></FONT>
		</td>
		<td NOWRAP align="center" width="5%" >
		     <% if(msgList.getE01BPBPVI().equals("A")) out.print("ACH");%>
		     <% if(msgList.getE01BPBPVI().equals("R")) out.print("Retail");%>
		     <% if(msgList.getE01BPBPVI().equals("G")) out.print("GL Account");%>
		     <% if(msgList.getE01BPBPVI().equals("C")) out.print("Check");%>
		     <% if(msgList.getE01BPBPVI().equals("S")) out.print("Swift");%>
		     <% if(msgList.getE01BPBPVI().equals("P")) out.print("Petty Cash");%>
		</td>
		<td NOWRAP align="center" width="5%" >
			<FONT color="green">
		     <% if(msgList.getE01BPPPVI().equals("A")) out.print("ACH");%>
		     <% if(msgList.getE01BPPPVI().equals("R")) out.print("Retail");%>
		     <% if(msgList.getE01BPPPVI().equals("G")) out.print("GL Account");%>
		     <% if(msgList.getE01BPPPVI().equals("C")) out.print("Check");%>
		     <% if(msgList.getE01BPPPVI().equals("S")) out.print("Swift");%>
		     <% if(msgList.getE01BPPPVI().equals("P")) out.print("Petty Cash");%>
		    </FONT> 
		</td>
		<td NOWRAP align="left" width="5%" >
		     <% if(msgList.getE01BPBPTY().equals("F")) out.print("Fixed");%>
		     <% if(msgList.getE01BPBPTY().equals("V")) out.print("Variable");%>
		</td>
		<td NOWRAP align="left" width="6%" ><%= msgList.getE01BPBTYPD() %></td>

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
</body>
</html>
