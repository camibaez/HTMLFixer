<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>ACH Inquiry</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "EACH500List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">
var ok = false;
 
function goDetail() {
	isCheck();
	if (!ok) {
		alert("Please select an ACH Transaction!!!");
		return;	 
	}
	achnum = getElement("E01ACHNRO").value;
	reqtyp = getElement("E01REQTYP").value;
	reqsts = getElement("E01REQSTS").value;
	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.ach.JSEACH500?E01ACHNRO=" + achnum + "&E01REQTYP=" + reqtyp + "&E01REQSTS=" + reqsts + "&SCREEN=3";
	CenterWindow(page,800,600,2);
}

function goPage(p) {
	getElement("FromRecord").value = p;
	getElement("SCREEN").value="2";
	document.forms[0].submit();
}


function isCheck() {
	var formLength= document.forms[0].elements.length;
   	ok = false;
	for(n=0;n<formLength;n++) {
     	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "ROW") {
			if (document.forms[0].elements[n].checked == true) {
				ok = true;
				break;
			}
      	}
    }
}

function setKey(num) {
	getElement("E01ACHNRO").value = num;
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

<h3 align="center">ACH Inquiry for <% if (userPO.getType().equals("I")) { 
										out.println("INCOMING"); 
									  } else { out.println("OUGTOING");
									  } 
									%> Transactions. 
    <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" ALT="ach_inquiry_list.jsp, EACH500">
</h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.ach.JSEACH500">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="FromRecord" VALUE="0"> 
  <INPUT TYPE=HIDDEN NAME="E01ACHNRO" VALUE="0"> 
  <INPUT TYPE="HIDDEN" name="E01REQTYP" value="<%= userPO.getType().trim() %>">
  <INPUT TYPE="HIDDEN" name="E01REQORD" value="<%= userPO.getHeader1().trim() %>">
  <INPUT TYPE="HIDDEN" name="E01REQSTS" value="<%= userPO.getHeader2().trim() %>">
  <INPUT TYPE="HIDDEN" name="E01REQFRM" value="<%= userPO.getHeader3().trim() %>">
  <INPUT TYPE="HIDDEN" name="E01REQDA1" value="<%= userPO.getHeader4().trim() %>">
  <INPUT TYPE="HIDDEN" name="E01REQDA2" value="<%= userPO.getHeader5().trim() %>">
  <INPUT TYPE="HIDDEN" name="E01REQDA3" value="<%= userPO.getHeader6().trim() %>">

<TABLE class="tbenter" width="100%"> 
	<TR>
		<TD align="right" width="34%"></TD>
		<TD align="right" width="33%"><B><U>Search Criteria</U></B></TD>
	  	<TD align="CENTER" width="33%"></TD>	  	
	</TR>
	<TR>
		<TD align="CENTER" width="34%"></TD>
		<TD align="right" width="33%"><B>Order By :</B></TD>
		<TD align="left" width="33%"><% if (userPO.getHeader1().equals("C")) { 
				out.println("Customer from "  + userPO.getHeader3()); 
			   } else if (userPO.getHeader1().equals("N")) { 
				out.println("ACH Number from "  + userPO.getHeader3()); 
			   } else if (userPO.getHeader1().equals("D")) { 
				out.println("Date from " + datapro.eibs.master.Util.formatDate(userPO.getHeader4(),userPO.getHeader5(),userPO.getHeader6()));
			   } else if (userPO.getHeader1().equals("A")) { 
				out.println("Account from " + userPO.getHeader3());  	
			   } else  { out.println("ACH Batch from " + userPO.getHeader3());
			   }%> 
			  
		</TD>
	</TR>
    <TR>
		<TD align="CENTER" width="34%"></TD>
		<TD align="right" width="33%"><B>With Status :</B></TD>
		<TD align="left" width="33%"><% if (userPO.getHeader2().equals("P")) { 
				out.println("Pending for approval"); 
			   } else if (userPO.getHeader2().equals("A")) { 
				out.println("Approved"); 
			   } else if (userPO.getHeader2().equals("*")) { 
				out.println("Processed");
			   } else if (userPO.getHeader2().equals("R")) { 
				out.println("In Return Process");  	
			   } %></TD>
	</TR>
	
</TABLE> 

<%	if ( EACH500List.getNoResult() ) { %>
 	<TABLE class="tbenter" width=100% height=30%">
 	<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center"> There are no results for your search criteria.</h4></div>
      </TD>
	</TR>
	<TR>
	  	<TD align="CENTER" class="TDBKG" width="100%">
			<a href="<%=request.getContextPath()%>/servlet/datapro.eibs.ach.JSEACH500?SCREEN=1"><b>Return to<BR>Search</b></a>
      	</TD>
	</TR>
	
   	</TABLE>
<%
	} else {
%>    

<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="50%">
			<a href="javascript:goDetail()"><b>See <br>Transaction</b></a>
      	</TD>
	  	<TD align="CENTER" class="TDBKG" width="50%">
			<a href="<%=request.getContextPath()%>/servlet/datapro.eibs.ach.JSEACH500?SCREEN=1"><b>Return to<BR>Search</b></a>
      	</TD>
	</TR>
</TABLE> 
    
  <TABLE class="tableinfo" id="dataTable">
    <TR id=trdark> 
		<td NOWRAP align="center" width="5%"><B>Sel</B></td>
		<td NOWRAP align="center" width="5%"><B>ACH<BR>Number</B></td>
		<TD nowrap align="center" width="10%"><B>Process<BR>Date</B></TD>
		<td NOWRAP align="center" width="10%"><B>Value<BR>Date</B></td>
		<TD nowrap align="center" width="10%"><B>Account</B></TD>
		<TD nowrap align="center" width="10%"><B>Custumer<BR>Number</B></TD>
		<TD nowrap align="center" width="20%"><B>Recipient Name</B></TD>
		<TD nowrap align="center" width="10%"><B>Amount</B></TD>
		<TD nowrap align="center" width="5%"><B>Entry<BR>Class</B></TD>
		<TD nowrap align="center" width="5%"><B>TR</B></TD>
		<TD nowrap align="center" width="5%"><B>Status</B></TD>
		<TD nowrap align="center" width="5%"><B>Reference</B></TD>				
	</TR>
 
        <%
          String ofacImg = "";
    	  int i = 0;
          EACH500List.initRow();    
          while (EACH500List.getNextRow()) {
            EACH50001Message msgList = (EACH50001Message) EACH500List.getRecord();	
			if (msgList.getH01FLGWK3().trim().equals("3")) {
					ofacImg = "<IMG border=\"0\" src=\"../images/warning_16.jpg\" alt=\"OFAC Match List\" onClick=\"showOfac('" + msgList.getE01ACHNRO() + "')\">";
			} 
         %>   
                    
    <TR id=trclear>
		<td NOWRAP align="center" width="5%">
           	<INPUT TYPE="radio" name="ROW"  value="<%= EACH500List.getCurrentRow()%>" onClick="setKey('<%=msgList.getE01ACHNRO()%>')">
			<%=ofacImg%>
		</td>
		
		<td NOWRAP align="center" width="5%" ><%= msgList.getE01ACHNRO() %></td>
		<td NOWRAP align="center" width="10%" ><%= datapro.eibs.master.Util.formatDate(msgList.getE01ACHRDM(),msgList.getE01ACHRDD(),msgList.getE01ACHRDY())%></td>
		<td NOWRAP align="center" width="10%" ><%= datapro.eibs.master.Util.formatDate(msgList.getE01ACHVDM(),msgList.getE01ACHVDD(),msgList.getE01ACHVDY())%></td>
		<td NOWRAP align="left" width="10%" ><%= msgList.getE01ACHACC() %></td>
		<td NOWRAP align="right" width="10%" ><%= msgList.getE01ACHCUN() %></td>
		<td NOWRAP align="left" width="20%" ><%= msgList.getE01CUNDSC() %></td>
		<td NOWRAP align="right" width="10%" ><%= msgList.getE01ACHAMT() %></td>
		<td NOWRAP align="center" width="5%" ><%= msgList.getE01ACHECD() %></td>
		<td NOWRAP align="center" width="5%" ><%= msgList.getE01ACHCDE() %>-<%= msgList.getE01ACHDC() %></td>
		<td NOWRAP align="left" width="5%" ><%= msgList.getE01ACHSTS() %></td>
		<td NOWRAP align="right" width="5%" ><%= msgList.getE01ACHREF() %></td>
	</TR>
       <% 
       	 i++; 
        } 
       %> 
  </TABLE> 

  <TABLE  class="tbenter" WIDTH="88%" ALIGN=CENTER>
   	 <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25">
       <%
    	if ( EACH500List.getShowPrev() ) {
  			int pos = EACH500List.getFirstRec() - 21;
  			out.print("<img src=\""+request.getContextPath()+"/images/e/previous_records.gif\" border=0 onclick=\"goPage(" + pos + ")\">");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (EACH500List.getShowNext()) {
  			int pos = EACH500List.getLastRec();
  			out.print("<img src=\""+request.getContextPath()+"/images/e/next_records.gif\" border=0 onclick=\"goPage(" + pos + ")\">");
	    } %>
      </TD>
     </TR>
 </TABLE>
  
<BR>

<SCRIPT Language="javascript">
	document.forms[0].TOTROWS.value = <%= i%>;
	document.forms[0].NEXTROWS.value = <%= EACH500List.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= EACH500List.getFirstRec()%>;
</SCRIPT>
<% } %>    
</form>
</body>
</html>
