<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*,java.util.Iterator" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>
Lista de Cuentas a Aprobar
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "jbList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<SCRIPT language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"></SCRIPT>
<SCRIPT language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"></SCRIPT>

<SCRIPT language="javascript">
// var reason = '';
var accOfac = '';
var accWarn = '';

function setReason(op, _reason){
 	option = op;
 	reason  = _reason;
	var page= prefix +language + 'ELC0525_enter_reason_text.jsp';
	CenterWindow(page,500,430,3);
}

function goLetterDetail(flag, typ, accnum){
	//document.letterOfCreditForm.SCREEN.value = "5";
	//document.letterOfCreditForm.E01LCMOPT.value = flag;
	//document.letterOfCreditForm.E01LCMTYP.value = typ;
	//document.letterOfCreditForm.E01LCMACC.value = accnum;
	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0525?SCREEN=5&E01LCMOPT=" + flag + "&E01LCMTYP=" + typ + "&E01LCMACC=" + accnum;
	CenterWindow(page,600,500,2);
}

function goAction(op) {
	if(op == "A"){
		document.letterOfCreditForm.SCREEN.value = 1;
		document.letterOfCreditForm.submit();		 
	}else if(op == "D"){
		document.letterOfCreditForm.SCREEN.value = 2;
		document.letterOfCreditForm.submit();
	}else if(op == "R"){
		document.letterOfCreditForm.SCREEN.value = 4;
		document.letterOfCreditForm.submit();
	}else if(op == "M"){
		document.letterOfCreditForm.SCREEN.value = 0;
		document.letterOfCreditForm.submit();
	}
}

function goMsgSwift() {

     if (letterOfCreditForm.E01LCMACC.value !== "") {
         
		   var dx = 450;
		   var dy = 350;
		   var y0 = (screen.height - dy) / 2;
		   var x0 = (screen.width - dx) / 2;
		   var attr = 'toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no,left=' + x0 + ',top=' + y0 + ',height=' + dy + ',width=' + dx;

   		   page = "<%=request.getContextPath()%>/servlet/datapro.eibs.approval.JSEPR1080A?SCREEN=8&TRANSREFNUM="+letterOfCreditForm.E01LCMACC.value;
		   listin = window.open(page,'',attr);
         
     } else {
		  alert("Please pick an Account");	   
     }
}

function showInqWarn(fieldValue){
	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.alerts.JSESD0000?ACCNUM=" + fieldValue;
	CenterWindow(page,420,300,2);    
}

function showAddInfo(idxRow){
   tbAddInfo.rows[0].cells[1].style.color="blue";   
   tbAddInfo.rows[0].cells[1].innerHTML=extraInfo(document.letterOfCreditForm["TXTDATA"+idxRow].value,9);   
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
 
</SCRIPT>


</HEAD>

<BODY>


<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     
     error.setERRNUM("0");
 }
 
%>

<FORM name="letterOfCreditForm" method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0525">
	<INPUT TYPE=HIDDEN NAME="E01LCMACC" value="">	
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
	<INPUT TYPE=HIDDEN NAME="E01LCMOPT" VALUE="">
	<INPUT TYPE=HIDDEN NAME="E01LCMTYP" VALUE="">
	<INPUT TYPE=HIDDEN NAME="reason">
	<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
	<H3 align="center">Letters Of Credit Approval<IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="approval_letter_of_credit_list.jsp, ELC0525">
	</H3>
	<HR size="4">
    
	<TABLE class="tbenter" width="100%">
		<TR> 
			<TD width="25%" class=TDBKG> 
				<DIV align="center"><A name="linkApproval" href="javascript:goAction('A')"><B>Approve</B></A></DIV>
		  </TD>
			<TD width="25%" class=TDBKG> 
				<DIV align="center"><A href="javascript:goAction('D')"><B>Delete</B></A></DIV>
		  </TD>
			<TD width="25%" class=TDBKG> 
				<DIV align="center"><A href="javascript:goMsgSwift()"><B>SWIFT<BR>Message</B></A></DIV>
		  </TD>
			<TD width="25%" class=TDBKG> 
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
						<TH ALIGN=CENTER nowrap>Remarks</TH>						
					</TR>
						<%
					       	int k=0;
					        jbList.initRow(); 
							boolean firstTime = true;
							String chk = "";
					        while (jbList.getNextRow()) {
								if (firstTime) {
									firstTime = false;
									chk = "checked";
								} else {
									chk = "";
								}
					           ELC052501Message msgPart = (ELC052501Message) jbList.getRecord();
					    %>               
						        <TR>
									<TD NOWRAP ><INPUT type="radio" name="ACCNUM_TEMP" value="<%=msgPart.getE01LCMACC()%>" onClick="document.forms[0].E01LCMACC.value = this.value; showAddInfo(<%=k%>);"></TD>
									<TD NOWRAP ALIGN="LEFT"><A   href="javascript:goLetterDetail('<%=msgPart.getE01LCMOPT()%>','<%=msgPart.getE01LCMTYP()%>','<%=msgPart.getE01LCMACC()%>');"><%=Util.formatCell(msgPart.getE01LCMACC())%></A>
										<% if (msgPart.getH01FLGWK2().equals("A")) { %>
											<a href="javascript:showInqWarn('<%=msgPart.getE01LCMACC()%>')"><img src="../images/warning01.gif" alt="Warnings" align="middle" border="0" ></a> 
										<% } %>
									</TD>
									<TD NOWRAP ALIGN="CENTER"><A href="javascript:goLetterDetail('<%=msgPart.getE01LCMOPT()%>','<%=msgPart.getE01LCMTYP()%>','<%=msgPart.getE01LCMACC()%>');"><%=Util.formatCell(msgPart.getE01CUSNA1())%></A></TD>
									<TD NOWRAP ALIGN="CENTER"><A href="javascript:goLetterDetail('<%=msgPart.getE01LCMOPT()%>','<%=msgPart.getE01LCMTYP()%>','<%=msgPart.getE01LCMACC()%>');"><%=Util.formatCell(msgPart.getE01LCMPRO())%></A></TD>
									<TD NOWRAP ALIGN="CENTER"><A href="javascript:goLetterDetail('<%=msgPart.getE01LCMOPT()%>','<%=msgPart.getE01LCMTYP()%>','<%=msgPart.getE01LCMACC()%>');"><%=Util.formatCell(msgPart.getE01LCMCCY())%></A></TD>									
									<TD NOWRAP ALIGN="CENTER"><A href="javascript:goLetterDetail('<%=msgPart.getE01LCMOPT()%>','<%=msgPart.getE01LCMTYP()%>','<%=msgPart.getE01LCMACC()%>');"><%=Util.formatCell(msgPart.getE01LCMAMN())%></A></TD>									
									<TD NOWRAP ALIGN="CENTER"><A href="javascript:goLetterDetail('<%=msgPart.getE01LCMOPT()%>','<%=msgPart.getE01LCMTYP()%>','<%=msgPart.getE01LCMACC()%>');"><%=Util.formatCell(msgPart.getE01REMARK())%></A>
									<%
										String ls = "";
										ls = ls + Util.formatCell(msgPart.getE01REMARK()) + "<br>";
										ls = ls + Util.formatCell(msgPart.getE01LCMCCY())  + "<br>";
										ls = ls + Util.fcolorCCY(msgPart.getE01LCMAMN()) + "<br>";
										ls = ls + Util.formatCell(msgPart.getE01LCMBNK()) + "<br>";
										ls = ls + Util.formatCell(msgPart.getE01LCMBRN()) + "<br>";
										ls = ls + Util.formatCell(msgPart.getE01LCMGLN()) + "<br>";
										ls = ls + Util.formatCell(msgPart.getE01LCMCCN()) + "<br>";
										ls = ls + Util.formatCell(msgPart.getE01LCMUBT()) + "<br>";
										ls = ls + Util.formatCell(msgPart.getE01LCMOPR()) + "<br>";
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
						<TD ALIGN="RIGHT" nowrap><B>Remarks : <BR>Currency : <BR>Amount : <BR>Bank : <BR>Branch : <BR>G/L Account : <BR>Cost Center : <BR>Batch Number :<BR>Operator : </B></TD>
						<TD ALIGN="LEFT" nowrap class="tdaddinfo"></TD>
					</TR>
				</Table>
			</TD>
		</TR>	
	</TABLE>

	<SCRIPT language="JavaScript">
//	  document.forms[0].totalRow.value="<%= k %>";
	  function resizeDoc() {
		  showAddInfo(0);
    	  document.forms[0].E01LCMACC.value = document.forms[0].ACCNUM_TEMP[0].value;	  
//	       divResize(true);
//	       adjustDifTables_(headTable, dataTable, dataDiv1,2,1);
	  }
//	  showChecked("ACCNUM");
	  resizeDoc();
//	  tbAddInfoH.rows[0].cells[0].height = headTable.rows[0].cells[0].clientHeight;
//	  window.onresize=resizeDoc;
	</SCRIPT>


</FORM>
</BODY>
</HTML>
