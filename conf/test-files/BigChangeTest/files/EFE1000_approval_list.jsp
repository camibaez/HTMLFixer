<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>
Customer List
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<%@ page import = "datapro.eibs.master.Util" %>
<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBObjList"   scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"   scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="javascript">
  var reason = '';

  function goApproval() {
	document.forms[0].action.value = "A";
    document.forms[0].submit();
  }

	function goAction(op) {
		var op2 = '';
		if (op == 'Z') {op2 = 'A';} else {op2 = op;}    

		document.forms[0].action.value = op2;
		document.forms[0].reason.value = reason;
     
		var formLength= document.forms[0].elements.length;
		var ok = false;
		for(var n=0;n<formLength;n++){
			var elementName= document.forms[0].elements[n].name;
      		if(elementName == "ROW") {
				ok = true;
				break;
			}
		}
		if ( ok ) {
			document.forms[0].submit();
		} else {
			alert("Select record before this operation");
		}

	}
  
 function goExit(){
    window.location.href="<%=request.getContextPath()%>/pages/background.jsp";
  }

function showThisInqApproval(row) {
var formLength= document.forms[0].elements.length;
   for(n=0;n < formLength;n++)
     {
      	var elementName= document.forms[0].elements[n].name;
      	var elementValue= document.forms[0].elements[n].value;
      	if(elementName == "ROW" && elementValue == row) 
      	{
        		document.forms[0].elements[n].click();
        		break;
      	}
      }
	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEFE0220?SCREEN=1200&ROW=" + row;

	CenterWindow(page,600,500,2);
 
}

 
</script>
</HEAD>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 } 
%>

<BODY>

<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.approval.JSEFE1000">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
<INPUT TYPE=HIDDEN NAME="action" VALUE="A">
<INPUT TYPE=HIDDEN NAME="reason" VALUE="">
 <INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
 
  <h3 align="center"> Foreign Exchange Rates<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="approval_list.jsp, EFE1000"> 
  </h3>
<hr size="4">

  <TABLE class="tbenter">
    <TR>
      <TD class=TDBKG> 
        <div align="center"><a href="javascript:goAction('A')"><b>Approval</b></a></div>
      </TD>
      <TD class=TDBKG> 
        <div align="center"><a href="javascript:enterReason('R')"><b>Reject</b></a></div>
      </TD>
      <TD class=TDBKG> 
        <div align="center"><a href="javascript:goAction('D')"><b>Delete</b></a></div>
      </TD>
    </TR>
  </TABLE>
  
 <TABLE  id="mainTable" class="tableinfo">
 <TR > 
    <TD NOWRAP valign="top" width="100%" >
  <TABLE id="headTable" >
  	<TR id="trdark"> 
      <TH ALIGN=CENTER NOWRAP> </TH>
      <TH ALIGN=CENTER NOWRAP>Bank</TH>
      <TH ALIGN=CENTER NOWRAP>Currency</TH>
      <TH ALIGN=CENTER NOWRAP>Spot Rate</TH>
      <TH ALIGN=CENTER NOWRAP>Sale Rate</TH>
      <TH ALIGN=CENTER NOWRAP>Purchase Rate</TH>
      <TH ALIGN=CENTER NOWRAP>User</TH>
      <TH ALIGN=CENTER NOWRAP>Remarks</TH>
    </TR>
    </TABLE>
  
   <div id="dataDiv1" class="scbarcolor" >
    <table id="dataTable" >
     	<%
        appList.initRow(); 
		boolean firstTime = true;
		String chk = "";
		int indexRow = 0;
        while (appList.getNextRow()) {
			if (firstTime) {
				firstTime = false;
				chk = "checked";
			} else {
				chk = "";
			}
            datapro.eibs.beans.EFE100001Message msgPart = (datapro.eibs.beans.EFE100001Message) appList.getRecord();
        
   
     	%>               
        <TR>
			<TD NOWRAP width="2%">
				<input type="radio" name="ROW" value="<%= indexRow %>" <%=chk%> ></TD>
			<TD NOWRAP ALIGN="LEFT">
				<A HREF="javascript:showThisInqApproval('<%= indexRow %>')">
								<%=Util.formatCell(msgPart.getE01RATBNK())%></A></TD>
			<TD NOWRAP ALIGN="CENTER">
				<A HREF="javascript:showThisInqApproval('<%= indexRow %>')">
								<%=Util.formatCell(msgPart.getE01RATCCY())%></A></TD>
			<TD NOWRAP ALIGN="CENTER">
				<A HREF="javascript:showThisInqApproval('<%= indexRow %>')">
								<%=Util.formatCell(msgPart.getE01RATEXR())%></A></TD>
			<TD NOWRAP ALIGN="CENTER">
				<A HREF="javascript:showThisInqApproval('<%= indexRow %>')">
								<%=Util.formatCell(msgPart.getE01RATFSR())%></A></TD>
			<TD NOWRAP ALIGN="CENTER">
				<A HREF="javascript:showThisInqApproval('<%= indexRow %>')">
								<%=Util.formatCell(msgPart.getE01RATFPR())%></A></TD>
			<TD NOWRAP ALIGN="CENTER">
				<A HREF="javascript:showThisInqApproval('<%= indexRow %>')">
								<%=Util.formatCell(msgPart.getH01USERID())%></A></TD>
			<TD NOWRAP ALIGN="CENTER">
				<A HREF="javascript:showThisInqApproval('<%= indexRow %>')">
								<%=Util.formatCell(msgPart.getE01RATDSC())%></A></TD>
		</TR>    		
    	<%	indexRow++;
    	}
    	%>      
    
    
   </table>
   </div>
   </TD>
   </TR>	
</TABLE>

<SCRIPT language="JavaScript">
     document.forms[0].totalRow.value="<%= indexRow %>";
     function resizeDoc() {
       divResize(false);
     adjustEquTables(headTable, dataTable, dataDiv1,1,false);
      }
     showChecked("ROW");
     resizeDoc();
     window.onresize=resizeDoc;
     
</SCRIPT>

</FORM>

</BODY>
</HTML>

