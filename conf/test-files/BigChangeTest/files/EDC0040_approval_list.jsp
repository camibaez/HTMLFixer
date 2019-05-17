<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Collection Approval</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">

<%@ page import ="datapro.eibs.master.Util"%>

<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBObjList"   scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"   scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="javascript">
 var reason = "";

 //function goApproval() {
//	document.forms[0].action.value = "A";
//	document.forms[0].submit();
// }
 
 function goAction(op) {
	if (op == "A") {
		document.forms[0].SCREEN.value = 2;
		document.forms[0].submit();		 
	}
	else if (op == "D") {
		document.forms[0].SCREEN.value = 4;
		document.forms[0].submit();
	}    
 }
 
 function goCollectionDetail(apc, accnum){
    page = "<%=request.getContextPath()%>/servlet/datapro.eibs.approval.JSEDC0040?SCREEN=3&E01DCMACD="+apc+"&E01DCMACC="+accnum;
 	CenterWindow(page,820,600,2);
 }

 function showAddInfo(idxRow){
   tbAddInfo.rows[0].cells[1].style.color="blue";   
   tbAddInfo.rows[0].cells[1].innerHTML=extraInfo(document.forms[0]["TXTDATA"+idxRow].value,9);   
 }
   
 function extraInfo(textfields,noField) {
 	var pos=0
 	var s= textfields;
 	for ( var i=0; i<noField ; i++ ) {
   		pos=textfields.indexOf("<br>",pos+1);
  	}
 	s=textfields.substring(0,pos);
 	return(s);
 }

 function goExit(){
    window.location.href="<%=request.getContextPath()%>/pages/background.jsp";
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
<h3 align="center">Collections Approval
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="approval_list.jsp, EDC0040">
</h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.approval.JSEDC0040">

<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
<INPUT TYPE=HIDDEN NAME="E01DCMACC" VALUE="">
<INPUT TYPE=HIDDEN NAME="action" VALUE="A">
<INPUT TYPE=HIDDEN NAME="reason" VALUE="">

	<TABLE class="tbenter" width="100%">
		<TR> 
			<TD width="35%" class=TDBKG> 
				<DIV align="center"><A id="linkApproval" href="javascript:goAction('A')"><B>Approval</B></A></DIV>
		  </TD>
			<TD width="35%" class=TDBKG> 
				<DIV align="center"><A id="linkDelete" href="javascript:goAction('D')"><B>Delete</B></A></DIV>
		  </TD>
			<TD width="30%" class=TDBKG> 
				<DIV align="center"><A href="<%=request.getContextPath()%>/pages/background.jsp"><B>Exit</B></A></DIV>
		  </TD>  
	  </TR>
	</TABLE>
  
	<TABLE  id="mainTable" class="tableinfo" >
		<TR> 
			<TD NOWRAP valign="top">
				<TABLE id="headTable" width="100%">
					<TR id="trdark"> 
						<TH ALIGN=CENTER nowrap></TH>
						<TH ALIGN=CENTER nowrap>Account</TH>
						<TH ALIGN=CENTER nowrap>Name</TH>						
						<TH ALIGN=CENTER nowrap>Product</TH>
						<TH ALIGN=CENTER nowrap>Currency</TH>
						<TH ALIGN=CENTER nowrap>Amount</TH>
						<TH ALIGN=CENTER nowrap>Comment</TH>						
					</TR>
						<%
					       	int k=0;
					        appList.initRow(); 
							boolean firstTime = true;
							String chk = "";
					        while (appList.getNextRow()) {
								if (firstTime) {
									firstTime = false;
									chk = "checked";
								} else {
									chk = "";
								}
					           datapro.eibs.beans.EDC004001Message msgPart = (datapro.eibs.beans.EDC004001Message) appList.getRecord();
					    %>               
						        <TR>
									<TD NOWRAP ><INPUT type="radio" name="ACCNUM_TEMP" value="<%=msgPart.getE01DCMACC()%>" onClick="document.forms[0].E01DCMACC.value = this.value; showAddInfo(<%=k%>);" <%=chk%>></TD>
									<TD NOWRAP ALIGN="LEFT"><A   href="javascript:goCollectionDetail('<%=msgPart.getE01DCMACD()%>','<%=msgPart.getE01DCMACC()%>');"><%=Util.formatCell(msgPart.getE01DCMACC())%></A></TD>
									<TD NOWRAP ALIGN="CENTER"><A href="javascript:goCollectionDetail('<%=msgPart.getE01DCMACD()%>','<%=msgPart.getE01DCMACC()%>');"><%=Util.formatCell(msgPart.getE01CUSNA1())%></A></TD>
									<TD NOWRAP ALIGN="CENTER"><A href="javascript:goCollectionDetail('<%=msgPart.getE01DCMACD()%>','<%=msgPart.getE01DCMACC()%>');"><%=Util.formatCell(msgPart.getE01DCMPRO())%></A></TD>
									<TD NOWRAP ALIGN="CENTER"><A href="javascript:goCollectionDetail('<%=msgPart.getE01DCMACD()%>','<%=msgPart.getE01DCMACC()%>');"><%=Util.formatCell(msgPart.getE01DCMCCY())%></A></TD>									
									<TD NOWRAP ALIGN="CENTER"><A href="javascript:goCollectionDetail('<%=msgPart.getE01DCMACD()%>','<%=msgPart.getE01DCMACC()%>');"><%=Util.formatCell(msgPart.getE01DCMAMN())%></A></TD>									
									<TD NOWRAP ALIGN="CENTER"><A href="javascript:goCollectionDetail('<%=msgPart.getE01DCMACD()%>','<%=msgPart.getE01DCMACC()%>');"><%=Util.formatCell(msgPart.getE01REMARK())%></A>
									<%
										String ls = "";
										ls = ls + Util.formatCell(msgPart.getE01REMARK()) + "<br>";
										ls = ls + Util.fcolorCCY(msgPart.getE01DCMCCY())  + "<br>";
										ls = ls + Util.formatCell(msgPart.getE01DCMAMN()) + "<br>";
										ls = ls + Util.formatCell(msgPart.getE01DCMBNK()) + "<br>";
										ls = ls + Util.formatCell(msgPart.getE01DCMBRN()) + "<br>";
										ls = ls + Util.formatCell(msgPart.getE01DCMGLN()) + "<br>";
										ls = ls + Util.formatCell(msgPart.getE01DCMCCN()) + "<br>";
										ls = ls + Util.formatCell(msgPart.getE01DCMUBT()) + "<br>";
										ls = ls + Util.formatCell(msgPart.getE01DCMOPR()) + "<br>";
									%>
										<INPUT TYPE="HIDDEN" NAME="TXTDATA<%=k%>" value="<%=ls%>">
									</TD>
								</TR>    		
				    	<%
				    			k++;
				    		}
				    	%>    
				</TABLE>		
			</TD>	
			<TD nowrap ALIGN="RIGHT" valign="top">
				<Table id="tbAddInfoH" width="100%" >
					<TR id="trdark">
					 <TH ALIGN=CENTER nowrap >Basic Information</TH>
					</TR>
				</Table>
				
				<Table id="tbAddInfo" >
					<TR id="trclear">
						<TD ALIGN="RIGHT" valign="middle" nowrap><B>Comment : <BR>Currency : <BR>Amount : <BR>Bank : <BR>Branch : <BR>G/L Account : <BR>Cost Center : <BR>Batch Number :<BR>Operator : </B></TD>
						<TD ALIGN="LEFT" valign="middle" nowrap class="tdaddinfo"></TD>
					</TR>
				</Table>
			</TD>
		</TR>	
	</TABLE>

	<SCRIPT language="JavaScript">
	  function resizeDoc() {
		  showAddInfo(0);
	  	  <% if(k>1){ %>
    	  document.forms[0].E01DCMACC.value = document.forms[0].ACCNUM_TEMP[0].value;	  
    	  <%}else{ %>
     	  document.forms[0].E01DCMACC.value = document.forms[0].ACCNUM_TEMP.value;	  
    	  <% } %>
	  }
	  resizeDoc();
	</SCRIPT>

</FORM>

</BODY>
</HTML>
