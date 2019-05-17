<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*,java.util.Iterator" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>
Accounts List for Approval
</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<meta http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "jbList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </script>

<script language="javascript">
 var accOfac = '';
 var accWarn = '';

 function setReason(op, _reason){
 	option = op;
 	reason  = _reason;
	var page= prefix +language + 'ELC0100_enter_reason_text.jsp';
	CenterWindow(page,500,430,3);
 }

 function goLetterDetail(x, y){
	document.forms[0].SCREEN.value = "5";
	SelectReg(x,y);
	document.forms[0].submit();
 }
 
function enter() {
    page = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0100?SCREEN=8&E02LCRNUM=" + document.forms[0].E02LCRNUM.value + "&E02DRWNUM=" + document.forms[0].E02DRWNUM.value;
    CenterNamedWindow(page,'inquiry',750,650,2);
 }


 function SelectReg(fld1,fld2,fld3,fld4){
    document.forms[0].E02LCRNUM.value = fld1;
    document.forms[0].E02DRWNUM.value = fld2;
    document.forms[0].E01LCMACC.value = fld1;
    document.forms[0].E01PMTVIA.value = fld3;
    document.forms[0].E01TRFNUM.value = fld4;
 } 
 
 function goAction(op) {
	document.forms[0].E02ACTION.value = op;
	document.forms[0].submit();
 }

 function goMessage(opt) {
 	var page = "";
 	if (opt == "A") {
 		//Swift 
 		if (document.forms[0].E01PMTVIA.value == 5) {
   	   		page = "<%=request.getContextPath()%>/servlet/datapro.eibs.approval.JSEPR1080A?SCREEN=8&TRANSREFNUM=" + document.forms[0].E01LCMACC.value;
   	   	} else {
 			page = prefix + language + "MISC_no_result.jsp";
   	   	}	
 	} else {
 		//Funds Transfer
 		if (document.forms[0].E01PMTVIA.value == 5) {
   	   		page = "<%=request.getContextPath()%>/servlet/datapro.eibs.approval.JSEPR1080A?SCREEN=8&TRANSREFNUM=" + document.forms[0].E01TRFNUM.value;
 		} else if (document.forms[0].E01PMTVIA.value == 6) {
     		page = "<%=request.getContextPath()%>/servlet/datapro.eibs.approval.JSEPR1080A?SCREEN=100&REFNUM=" + document.forms[0].E01TRFNUM.value;
 		} else {
 			page = prefix + language + "MISC_no_result.jsp";
 		}
 	}
 	
 	if (page != "") {
	    var dx = 450;
	    var dy = 350;
	    var y0 = (screen.height - dy) / 2;
	    var x0 = (screen.width - dx) / 2;
	    var attr = 'toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no,left=' + x0 + ',top=' + y0 + ',height=' + dy + ',width=' + dx;
	    listin = window.open(page, '', attr);            
 	}
 	
 }



 function showAddInfo(idxRow){
   tbAddInfo.rows[0].cells[1].style.color="blue";   
   tbAddInfo.rows[0].cells[1].innerHTML=extraInfo(document.forms[0]["TXTDATA"+idxRow].value,8);   
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
 
</script>


</head>

<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }%>

<form name="letterOfCreditForm" method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0100">
	<input type=HIDDEN name="E01LCMACC" value="">	
	<input type=HIDDEN name="E01PMTVIA" value="">	
	<input type=HIDDEN name="SCREEN" value="2">
	<input type=HIDDEN name="E01LCMOPT" value="">
	<input type=HIDDEN name="E01LCMTYP" value="">
	<input type=HIDDEN name="E02ACTION" value="">
	<input type=HIDDEN name="E02LCRNUM" value="">
	<input type=HIDDEN name="E02DRWNUM" value="">
	<input type="hidden" name="E01TRFNUM" value="">
	<input type=HIDDEN name="reason">
	<input type=HIDDEN name="totalRow" value="0">
	
	<h3 align="center">Letters Of Credit Negotiation and Payment Approval
		<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="lc_nego_apr_list.jsp, ELC0100">
	</h3>
	<hr size="4">
    
	<table class="tbenter" width="100%">
		<tr> 
			<td width="20%" class=TDBKG> 
				<div align="center"><a name="linkApproval" href="javascript:goAction('A')"><b>Approve</b></a></div>
		  </td>
			<td width="20%" class=TDBKG> 
				<div align="center"><a name="linkReject" href="javascript:goAction('D')"><b>Delete</b></a></div>
		  </td>
		  <TD width="20%" class=TDBKG> 
				<DIV align="center"><A href="javascript:goMessage('A')"><B>Swift<BR>Message</B></A></DIV>
		  </TD>
		  <TD width="20%" class=TDBKG> 
				<DIV align="center"><A href="javascript:goMessage('B')"><B>Funds<BR>Transfer</B></A></DIV>
		  </TD>		  
		  <td width="20%" class=TDBKG> 
				<div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
		  </td>  
	  </tr>
	</table>
  
	<table  id="mainTable" class="tableinfo" >
		<tr> 
			<td nowrap valign="top">
				<table id="headTable" width="100%">
					<tr id="trdark"> 
						<th align=CENTER nowrap></th>
						<th align=CENTER nowrap>Letter of Credit </th>
						<th align=CENTER nowrap>Negotiation</th>						
						<th align=CENTER nowrap>Operation Type</th>						
						<th align=CENTER nowrap>Amount</th>
						<th align=CENTER nowrap>Date</th>
						<th align=CENTER nowrap>Customer Name</th>						
					</tr>
						<% 
							String warnImg= "";
							String warnFlag= "";
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
					           ELC010001Message msgPart = (ELC010001Message) jbList.getRecord();
					           
								if (msgPart.getH01FLGWK2().trim().equals("A")) {
									warnImg= "<IMG border=\"0\" src=\"../images/warning01.gif\" ALT=\"\" onClick=\"showWarnings('" + msgPart.getE01LCRNUM() + "','ACCNUM_TEMP')\">";
									warnFlag = msgPart.getH01FLGWK2().trim();
								}else{
									warnImg= "";
									warnFlag = "";
								}
					    %>               
						        <tr>
									<td nowrap >
									   <input type="radio" name="ACCNUM_TEMP" value="<%= msgPart.getE01LCRNUM() %>" 
									   		onClick="SelectReg('<%= msgPart.getE01LCRNUM() %>','<%= msgPart.getE01DRWNUM() %>','<%= msgPart.getE01PMTVIA() %>','<%= msgPart.getE01TRFNUM() %>'); 
										   		showAddInfo(<%=k%>);" <%=chk%>>
									   <input type="HIDDEN" name="XXXWNUM" value="<%= msgPart.getE01DRWNUM() %>">
									</td>
									<td nowrap align="CENTER"><a href="javascript:SelectReg('<%= msgPart.getE01LCRNUM() %>','<%= msgPart.getE01DRWNUM() %>');enter();"><%=Util.formatCell(msgPart.getE01LCRNUM())%></a>
										<%=warnImg%></td>
									<td nowrap align="CENTER"><a href="javascript:SelectReg('<%= msgPart.getE01LCRNUM() %>','<%= msgPart.getE01DRWNUM() %>');enter();"><%=Util.formatCell(msgPart.getE01DRWNUM())%></a></td>
									<td nowrap align="LEFT"><a   href="javascript:SelectReg('<%= msgPart.getE01LCRNUM() %>','<%= msgPart.getE01DRWNUM() %>');enter();"><%=Util.formatCell(msgPart.getE01OPCDSC())%></a></td>									
									<td nowrap align="CENTER"><a href="javascript:SelectReg('<%= msgPart.getE01LCRNUM() %>','<%= msgPart.getE01DRWNUM() %>');enter();"><%=Util.formatCell(msgPart.getE01DRWAMN())%></a></td>
									<td nowrap align="CENTER"><a href="javascript:SelectReg('<%= msgPart.getE01LCRNUM() %>','<%= msgPart.getE01DRWNUM() %>');enter();">
									<%=Util.formatCell(msgPart.getE01NEGDTM() + "/" + msgPart.getE01NEGDTD() + "/" + msgPart.getE01NEGDTY())%></a></td>									
									<td nowrap align="CENTER"><a href="javascript:SelectReg('<%= msgPart.getE01LCRNUM() %>','<%= msgPart.getE01DRWNUM() %>');enter();"><%=Util.formatCell(msgPart.getE01CUSNA1())%></a></td>
								</tr>
								<%
									String ls = "";
									ls += Util.formatCell(msgPart.getE01LCRNUM()) + "<br>";
									ls += Util.formatCell(msgPart.getE01DRWNUM()) + "<br>";
									ls += Util.formatCell(msgPart.getE01OPCDSC()) + "<br>";
									ls += Util.formatCell(msgPart.getE01LCMCCY()) + "<br>";
									ls += Util.formatCell(msgPart.getE01DRWAMN()) + "<br>";
									ls += Util.formatCell(msgPart.getE01LCCBTH()) + "<br>";
									ls += Util.formatCell(msgPart.getE01LCCOPR()) + "<br>";
									ls += Util.formatCell(msgPart.getE01TRFNUM()) + "<br>";
								%>
									<input type="HIDDEN" name="TXTDATA<%=k%>" value="<%=ls%>">
									
				    	<%k++;
				    	}%>    
				</table>		
			</td>	
			<td nowrap align="RIGHT" valign="top">
				<table id="tbAddInfoH" width="100%" >
					<tr id="trdark">
					 <th align=CENTER nowrap >Basic Information</th>
					</tr>
				</table>
				
				<table id="tbAddInfo" >
					<tr id="trclear">
						<td align="RIGHT" nowrap><b>Account: <br>Negotiation: <br>Operation Type: <br>Currency: <br>Amount: <br>Batch Number: <br>Operator: <br> <b>Transfer: </b></b></td>
						<td align="LEFT" nowrap class="tdaddinfo"></td>
					</tr>
				</table>
			</td>
		</tr>	
	</table>

	<script language="JavaScript">
	  document.forms[0].totalRow.value="<%= k %>";
	  function resizeDoc() {
		  if(document.forms[0].totalRow.value>1){
			  showAddInfo(0);
	    	  document.forms[0].E01LCMACC.value = document.forms[0].ACCNUM_TEMP[0].value;	
	    	  document.forms[0].E02LCRNUM.value = document.forms[0].ACCNUM_TEMP[0].value;	
	    	  document.forms[0].E02DRWNUM.value = document.forms[0].XXXWNUM[0].value;	
	      }else if(document.forms[0].totalRow.value == 1){
			  showAddInfo(0);
	          document.forms[0].E01LCMACC.value = document.forms[0].ACCNUM_TEMP.value;	
	          document.forms[0].E02LCRNUM.value = document.forms[0].ACCNUM_TEMP.value;	
	          document.forms[0].E02DRWNUM.value = document.forms[0].XXXWNUM.value;	
	      }
	       	  
//	       divResize(true);
//	       adjustDifTables_(headTable, dataTable, dataDiv1,2,1);
	  }
//	  showChecked("ACCNUM");
	  resizeDoc();
//	  tbAddInfoH.rows[0].cells[0].height = headTable.rows[0].cells[0].clientHeight;
//	  window.onresize=resizeDoc;
	</script>


</form>

</body>
</html>
