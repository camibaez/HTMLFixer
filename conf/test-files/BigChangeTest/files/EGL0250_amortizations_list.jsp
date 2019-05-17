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
<jsp:useBean id= "msgList" class= "datapro.eibs.beans.JBObjList"   scope="session"/>
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

		document.forms[0].action.value = op;
     
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
	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEGL0250?SCREEN=1200&ROW=" + row;

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
<INPUT TYPE=HIDDEN NAME="action" VALUE="">
 <INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
 
  <h3 align="center"> Stop/Delete Amortizations<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="approval_list.jsp, EFE1000"> 
  </h3>
<hr size="4">

  <TABLE class="tbenter">
    <TR>
      <TD class=TDBKG> 
        <div align="center"><a href="javascript:goAction('S')"><b>Stop Amortization</b></a></div>
      </TD>
      <TD class=TDBKG> 
        <div align="center"><a href="javascript:goAction('D')"><b>Delete Transaction</b></a></div>
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
      <TH ALIGN=CENTER NOWRAP>Branch</TH>
      <TH ALIGN=CENTER NOWRAP>Currency</TH>
      <TH ALIGN=CENTER NOWRAP>Gral Ledger</TH>
      <TH ALIGN=CENTER NOWRAP>Date</TH>
      <TH ALIGN=CENTER NOWRAP>Description</TH>
      <TH ALIGN=CENTER NOWRAP>Amount</TH>
    </TR>
    </TABLE>
  
   <div id="dataDiv1" class="scbarcolor" >
    <table id="dataTable" >
     	<%
        msgList.initRow(); 
		boolean firstTime = true;
		String chk = "";
		int indexRow = 0;
        while (msgList.getNextRow()) {
			if (firstTime) {
				firstTime = false;
				chk = "checked";
			} else {
				chk = "";
			}
            datapro.eibs.beans.EGL025001Message msgPart = (datapro.eibs.beans.EGL025001Message) msgList.getRecord();
        
   
     	%>               
        <TR>
			<TD NOWRAP width="2%">
				<input type="radio" name="ROW" value="<%= indexRow %>" <%=chk%> ></TD>
			<TD NOWRAP ALIGN="LEFT">
				<A HREF="javascript:getDetail('<%= indexRow %>')">
								<%=Util.formatCell(msgPart.getE01AMOBNK())%></A></TD>
			<TD NOWRAP ALIGN="CENTER">
				<A HREF="javascript:getDetail('<%= indexRow %>')">
								<%=Util.formatCell(msgPart.getE01AMOBRN())%></A></TD>
			<TD NOWRAP ALIGN="CENTER">
				<A HREF="javascript:getDetail('<%= indexRow %>')">
								<%=Util.formatCell(msgPart.getE01AMOCCY())%></A></TD>
			<TD NOWRAP ALIGN="CENTER">
				<A HREF="javascript:getDetail('<%= indexRow %>')">
								<%=Util.formatCell(msgPart.getE01AMOGLN())%></A></TD>
			<TD NOWRAP ALIGN="CENTER">
				<a href="javascript:getDetail('<%= indexRow %>')">
				<%= Util.formatDate(msgPart.getE01AMOBD1(),msgPart.getE01AMOBD2(),msgPart.getE01AMOBD3()) %></a>
			</TD>
			<TD NOWRAP ALIGN="CENTER">
				<A HREF="javascript:getDetail('<%= indexRow %>')">
								<%=Util.formatCell(msgPart.getE01AMONAR())%></A></TD>
			<TD NOWRAP ALIGN="CENTER">
				<A HREF="javascript:getDetail('<%= indexRow %>')">
								<%=Util.formatCell(msgPart.getE01AMOOAM())%></A></TD>

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

