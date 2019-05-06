<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Approval Cards</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<%@ page import = "datapro.eibs.master.Util" %>
<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBObjList"   scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"   scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>
<script language="javascript">
  
  var reason = '';
  var accOfac = '';
  var accWarn = '';

  function goApproval() {
	document.forms[0].action.value = "A";
    document.forms[0].submit();
  }

  function goApprovalList() {
	//document.forms[0].action.value = "L";
	document.forms[0].SCREEN.value = "4";
	if (document.forms[0].NUM.value == "A"){
		document.forms[0].CARDNUM.value = "";
		document.forms[0].CUSTNUM.value = "";
	    document.forms[0].submit();
	}
	else if (document.forms[0].NUM.value == "D"){
		document.forms[0].ACCTNUM.value = "";
		document.forms[0].CUSTNUM.value = "";
    	document.forms[0].submit();
	}
	else if (document.forms[0].NUM.value == "C"){
		document.forms[0].ACCTNUM.value = "";
		document.forms[0].CARDNUM.value = "";
	    document.forms[0].submit();
	}
	else {
		alert("Por favor, seleccione uno de los métodos de búsqueda directa.");
	}
  }

  function goAction(op) {
     var op2 = '';
     if (op == 'Z') {op2 = 'A';} else {op2 = op;}
     
     document.forms[0].action.value = op2;
     document.forms[0].reason.value = reason;
     
     var formLength= document.forms[0].elements.length;
     var ok = false;
     for(var n=0;n<formLength;n++)
     {
      	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "ACCNUM") 
      	{
        		ok = true;
        		break;
      	}
      }
      if ( ok ) {
          if (accOfac != "" && op != 'Z' && op != 'D') {

             page = "<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0092?shrAcc=" + accOfac + "&shrCategory=ALL" + "&FromRecord=0&shrAction=APV";
	
	     CenterWindow(page,600,500,2);

          } else {
            if (accWarn != "" && op != 'D') {
   		 page = "<%=request.getContextPath()%>/servlet/datapro.eibs.alerts.JSESD0000?ACCNUM=" + accWarn+"&APP=1";
 	        CenterWindow(page,420,300,2);
            } else {
              document.forms[0].submit();
            }
          }
      }
      else {
 	alert("Select account before this operation");	   
      }

 }
  
 function goExit(){
    window.location.href="<%=request.getContextPath()%>/pages/background.jsp";
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
 
 function showAddInfo(idxRow){
   tbAddInfo.rows[0].cells[1].style.color="white";
   <%
	 if (userPO.getOption().equals("CD")) {
   %>
	   tbAddInfo.rows[0].cells[1].innerHTML=extraInfo(document.forms[0]["TXTDATA"+idxRow].value,11);
   <%
	 }
	else {
   %>
	   tbAddInfo.rows[0].cells[1].innerHTML=document.forms[0]["TXTDATA"+idxRow].value;
   <%
	 }
   %>
   if (document.forms[0]["STSOFAC"+idxRow].value == "3") {
      var formLength = document.forms[0].elements.length;
      for (var n=0;n<formLength;n++){
        var elemt = document.forms[0].elements[n];
        if ( elemt.checked ) {
              accOfac=elemt.value;
              break;
        }
      }      
   } else {
      accOfac = "";
   }

 if (document.forms[0]["STSWARN"+idxRow].value == "A") {
      var formLength = document.forms[0].elements.length;
      for (var n=0;n<formLength;n++){
        var elemt = document.forms[0].elements[n];
        if ( elemt.checked ) {
              accWarn=elemt.value;
              break;
        }
      }      
   } else {
      accWarn = "";
   }

   if (tbAddInfo.rows[0].cells[1].filters[0])	
   	tbAddInfo.rows[0].cells[1].filters[0].apply();
   tbAddInfo.rows[0].cells[1].style.color="";
   if (tbAddInfo.rows[0].cells[1].filters[0])
    tbAddInfo.rows[0].cells[1].filters[0].Play();
   for ( var i=0; i<dataTable.rows.length; i++ ) {
       dataTable.rows[i].className="trnormal";
    }
   dataTable.rows[idxRow].className="trhighlight";
   adjustDifTables(headTable, dataTable, dataDiv1,2,1);
  }   

function showInqOFAC(fieldValue){
        document.forms[0].ACCNUM.value=fieldValue;

	var formLength= document.forms[0].elements.length;
   	for(n=0;n<formLength;n++)
     	{
      		var elementName= document.forms[0].elements[n].name;
      		var elementValue= document.forms[0].elements[n].value;
      		if(elementName == "ACCNUM" && elementValue== fieldValue) 
      			{
        		document.forms[0].elements[n].click();
        		break;
      		}
      	}
	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0092?shrAcc=" + fieldValue + "&shrCategory=ALL" + "&FromRecord=0&shrAction=INQ";
	CenterWindow(page,600,500,2);    
 }

 function showInqWarn(fieldValue){
       document.forms[0].ACCNUM.value=fieldValue;
	var formLength= document.forms[0].elements.length;
   	for(n=0;n<formLength;n++)
     	{
      		var elementName= document.forms[0].elements[n].name;
      		var elementValue= document.forms[0].elements[n].value;
      		if(elementName == "ACCNUM" && elementValue== fieldValue) 
      			{
        		document.forms[0].elements[n].click();
        		break;
      		}
      	}
	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.alerts.JSESD0000?ACCNUM=" + fieldValue;
	CenterWindow(page,420,300,2);    
 }
 
 function showReceipt() {
	var page="";
	var receiptwin = null;
	page= "<%=request.getContextPath()%>/pages/e/EDL0140_receipt_CD_viewer.jsp";
	receiptwin = CenterNamedWindow(page,'Receipt',500,400,2);
 }
 
function closeHiddenDivSearch(){
	setVisibility(document.getElementById("hiddenDivSearch"), "hidden");
}

function showHiddenDivSearch(evt) {
	evt = (evt) ? evt : ((window.event) ? window.event : "");
 	
	var hiddenDivSearch = document.getElementById("hiddenDivSearch");

	var y=evt.clientY + document.body.scrollTop;
	var x=evt.clientX + document.body.scrollLeft;
     
	cancelBub(evt);

	moveElement(hiddenDivSearch, y, x);
	setVisibility(hiddenDivSearch, "visible");
	 
}

document.onclick= closeHiddenDivSearch;

</script>
</HEAD>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 } else {
   if (userPO.getRedirect().equals("DO_PRINT")) {
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showReceipt()");
     out.println("</SCRIPT>"); 
     userPO.setRedirect("");    
   }
 } 
%>

<BODY onload="MM_preloadImages('<%=request.getContextPath()%>/images/e/approve_over.gif','<%=request.getContextPath()%>/images/e/reject_over.gif')">

<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC0140">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
<INPUT TYPE=HIDDEN NAME="action" VALUE="A">
<INPUT TYPE=HIDDEN NAME="reason" VALUE="">
 <INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
  <input type=HIDDEN name="appCode" value="<%= userPO.getHeader10()%>">
  <h3 align="center"> Cards Approve</h3>
<hr size="4">
<p>
<div id="hiddenDivSearch" class="hiddenDiv">
 <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
	<tr id="trdark"> 
      <td align=CENTER width="2%"> 
		<INPUT TYPE=HIDDEN NAME="NUM" VALUE="">
        <input type="radio" name="NUMFIND" value="A" onClick="document.forms[0].NUM.value='A'">
      </td>
      <td align=CENTER width="18%"> 
        <div align="right">Account Number : </div>
      </td>
      <td align=CENTER width="34%"> 
        <div align="left"> 
        	<input type="text" name="ACCTNUM" size="14" maxlength="13" > 
        	<a href="javascript:GetAccount('ACCTNUM','','RT','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="absbottom" border="0" ></a> 
        </div>
      </td>
    </tr>
	<tr id="trdark"> 
      <td align=CENTER width="2%"> 
          <input type="radio" name="NUMFIND" value="D" onClick="document.forms[0].NUM.value='D'">
      </td>
      <td align=CENTER width="18%"> 
        <div align="right">Card Number : </div>
      </td>
      <td align=CENTER width="34%"> 
        <div align="left"> 
         <input type="text" name="CARDNUM" size="21" maxlength="20" > 
        </div>
      </td>
    </tr>
	<tr id="trdark"> 
      <td align=CENTER width="2%"> 
          <input type="radio" name="NUMFIND" value="C"  onClick="document.forms[0].NUM.value='C'">
      </td>
      <td align=CENTER width="18%"> 
        <div align="right">Customer Number : </div>
      </td>
      <td align=CENTER width="34%"> 
        <div align="left"> 
        	<input type="text" name="CUSTNUM" size="10" maxlength="9" > 
	    	<a href="javascript:GetCustomerDescId('CUSTNUM','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="absbottom" border="0" ></a></div>
        </div>
      </td>
    </tr>
   <tr id="trclear">
   
   <TD ALIGN=center nowrap colspan="3">
	     <input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="goApprovalList()"> 
   </TD>
   
   </tr>
 </TABLE>
</div>
</p>

  <TABLE class="tbenter">
    <TR>
      <TD class=TDBKG> 
        <div align="center"><a href="javascript:goAction('A')"><b>Approve</b></a></div>
      </TD>
      <TD class=TDBKG> 
		<div id="eibsSearch" align="center" style="cursor:pointer"><a><b>Search<BR></b></a></div>
      </TD>
      <TD class=TDBKG> 
        <div align="center"><a href="javascript:enterReason('R')"><b>Reject</b></a></div>
      </TD>
      <!-- 
      <TD class=TDBKG> 
        <div align="center"><a href="javascript:goAction('D')"><b>Eliminar</b></a></div>
      </TD>
       -->
    </TR>
  </TABLE>
  
 <TABLE  id="mainTable" class="tableinfo">
 <TR > 
    <TD NOWRAP valign="top" width="100%" >
  <TABLE id="headTable" >
  <TR id="trdark"> 
      <TH ALIGN=CENTER rowspan="2" NOWRAP> </TH>
      <TH ALIGN=CENTER rowspan="2" NOWRAP>Account</TH>
      <TH ALIGN=CENTER colspan="2" NOWRAP>Customer</TH>
      <TH ALIGN=CENTER rowspan="2" NOWRAP>Product<br>Code</TH>
    </TR>
    <TR id="trdark"> 
      <TH ALIGN=CENTER NOWRAP>Number</TH>
      <TH ALIGN=CENTER NOWRAP>Name</TH>
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
            datapro.eibs.beans.ECC014001Message msgPart = (datapro.eibs.beans.ECC014001Message) appList.getRecord();
           
			String chkOfac = (msgPart.getH01FLGWK3().equals("3")
							? "<a href=\"javascript:showInqOFAC('"	
								+ msgPart.getE01CCMACC()
								+ "')\"><img src=\"../images/warning_16.jpg\" alt=\"OFAC Match List\" align=\"absmiddle\" border=\"0\" ></a>"
								: "");
			String chkWarn = (msgPart.getH01FLGWK2().equals("A")
							? "<a href=\"javascript:showInqWarn('"
								+ msgPart.getE01CCMACC()
								+ "')\"><img src=\"../images/warning01.gif\" alt=\"Warnings\" align=\"absmiddle\" border=\"0\" ></a>"
								: "");        
     	%>               
        <TR>
			<TD NOWRAP width="2%"><input type="radio" name="ACCNUM" value="<%= msgPart.getE01CCMACC()%>" <%=chk%>
				 onClick="showAddInfo(<%=indexRow%>)"></TD>
			<TD NOWRAP ALIGN="LEFT">
				<A HREF="javascript:showInqApprovalCards('<%=msgPart.getE01CCMACD()%>', '<%=msgPart.getE01CCMACC()%>', '<%=msgPart.getH01FLGWK1()%>', '<%=msgPart.getE01CCMNUM()%>' )">
								<%=Util.formatCell(msgPart.getE01CCMACC())%></A> <%=chkOfac%> <%=chkWarn%></TD>
			<TD NOWRAP ALIGN="CENTER">
				<A HREF="javascript:showInqApprovalCards('<%=msgPart.getE01CCMACD()%>', '<%=msgPart.getE01CCMACC()%>', '<%=msgPart.getH01FLGWK1()%>', '<%=msgPart.getE01CCMNUM()%>')">
								<%=Util.formatCell(msgPart.getE01CCMCUN())%></A></TD>
			<TD NOWRAP ALIGN="CENTER">
				<A HREF="javascript:showInqApprovalCards('<%=msgPart.getE01CCMACD()%>', '<%=msgPart.getE01CCMACC()%>', '<%=msgPart.getH01FLGWK1()%>', '<%=msgPart.getE01CCMNUM()%>')">
								<%=Util.formatCell(msgPart.getE01CUSNA1())%></A></TD>
			<TD NOWRAP ALIGN="CENTER">
				<A HREF="javascript:showInqApprovalCards('<%=msgPart.getE01CCMACD()%>', '<%=msgPart.getE01CCMACC()%>', '<%=msgPart.getH01FLGWK1()%>', '<%=msgPart.getE01CCMNUM()%>')">
								<%=Util.formatCell(msgPart.getE01CCMPRO())%></A>
				<INPUT TYPE=HIDDEN NAME="STSOFAC<%=indexRow%>" VALUE="<%=msgPart.getH01FLGWK3()%>">
				<INPUT TYPE=HIDDEN NAME="STSWARN<%=indexRow%>" VALUE="<%=msgPart.getH01FLGWK2()%>">
				<INPUT TYPE=HIDDEN NAME="TXTDATA<%=indexRow%>" VALUE="<%=Util.formatCell(msgPart.getE01CCMRMK())%><br>
					<%=Util.formatCell(msgPart.getE01CCMCCY())%> <br>
					<%=Util.formatCell(msgPart.getE01CCMBNK())%> <br>
					<%=Util.formatCell(msgPart.getE01CCMBRN())%> <br>
					<%=Util.formatCell(msgPart.getE01CCMGLN())%> <br>
					<%=Util.formatCell(msgPart.getE01CCMCCN())%> <br>
					<%=Util.formatCell(msgPart.getE01CCMUBT())%> <br>
					<%=Util.formatCell(msgPart.getE01CCMUSR())%> <br>
					<%=Util.formatCell(msgPart.getE01CCMNUM())%> ">
			</TD>
		</TR>    		
    	<%	indexRow++;
    	}
    	%>      
    
    
   </table>
   </div>
   </TD>
   <TD nowrap ALIGN="RIGHT" valign="top">
      <Table id="tbAddInfoH"   width="100%" >
        <tr id="trdark">
         <TH ALIGN=CENTER nowrap >Basic Information</TH>
        </tr>
      </Table>

     <Table id="tbAddInfo"  >
      <tr id="trclear" >
         <TD  ALIGN="RIGHT"  nowrap >
         <b>Narrative : <br>Currency : <br>Bank : <br>Branch : <br>
          GL Account: <br> Cost Center : <br>Batch Number: <br>User : <br> Card number : </b>
         </TD>
         <TD ALIGN="LEFT"  nowrap class="tdaddinfo"></TD>
      </tr>
     </Table>
  </TD>
  </TR>	
</TABLE>

<SCRIPT language="JavaScript">
     document.forms[0].totalRow.value="<%= indexRow %>";
     function resizeDoc() {
       divResize(true);
     adjustDifTables(headTable, dataTable, dataDiv1,2,1);
      }
     showChecked("ACCNUM");
     resizeDoc();
     tbAddInfoH.rows[0].cells[0].height = headTable.rows[0].cells[0].clientHeight;
     window.onresize=resizeDoc;
     
</SCRIPT>
  <SCRIPT language="JavaScript">
	 	document.getElementById("hiddenDivSearch").onclick=cancelBub;
		document.getElementById("eibsSearch").onclick=showHiddenDivSearch; 
     </SCRIPT>

</FORM>

</BODY>

</HTML>

