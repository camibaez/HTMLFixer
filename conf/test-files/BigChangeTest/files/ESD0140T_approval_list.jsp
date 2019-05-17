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


<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBList"   scope="session"/>

<jsp:useBean id= "custList" class= "datapro.eibs.beans.JBList"   scope="session"/>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"   scope="session"/>

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="javascript">
 var reason = "";

 function goApproval() {
	document.forms[0].action.value = "A";
	document.forms[0].submit();
 }

 function goAction(op) {
     var op2 = '';
     if (op == 'Z') {op2 = 'A';} else {op2 = op;}
     document.forms[0].action.value = op2;

     document.forms[0].reason.value = reason;
     if (document.forms[0].ACCNUM.value !== "") {
		var accnum = document.forms[0].ACCNUM.value;
              if (document.forms[0].OFAFL.value !== "" && op != 'Z') {
		    page = "<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0092?shrAcc=" + accnum + "&shrCategory=ALL" + "&FromRecord=0&shrAction=APV";
		    CenterWindow(page,600,500,2);
             } else { 
		    if (document.forms[0].WRGFL.value !== "") {
			page = "<%=request.getContextPath()%>/servlet/datapro.eibs.alerts.JSESD0000?ACCNUM=" + accnum+"&APP=1";
			CenterWindow(page,420,300,2);
                  }
                     else {
                        document.forms[0].submit();
                  }
              }
     }
     else {
		  alert("Select an account before  this operation ");	   
     }
  }  
  
 function goExit(){
    window.location.href="<%=request.getContextPath()%>/pages/background.jsp";
  }
 
 function sendClick(cusnum) {
   var formLength= document.forms[0].elements.length;
   for(n=0;n<formLength;n++)
     {
      	var elementName= document.forms[0].elements[n].name;
      	var elementValue= document.forms[0].elements[n].value;
      	if(elementName == "CUSNUM" && elementValue== cusnum) 
      	{
        		document.forms[0].elements[n].click();
        		break;
      	}
      }
 } 

 function showAccInfo(idxRow){
   var actvTb = document.forms[0].activeTable.value;
   var dataT = document.all["dataTable"+idxRow];
   for ( var i=0; i<dataTable.rows.length; i++ ) {
       dataTable.rows[i].className="trnormal";
    }
   dataTable.rows[idxRow].className="trhighlight";
   document.all["dataTable"+actvTb].style.display="none";
   document.all["dataTable"+idxRow].style.display="";
   document.forms[0].activeTable.value="" + idxRow;
   if (dataT.rows.length >=5){
     dataDiv2.style.pixelHeight = 100;
   }
   adjustEquTables(headTable2, dataT, dataDiv2,1,false);
   showChecked("ACCNUM"+idxRow);
   
  }   
 
 function showAddInfo(account,idxRow,wrg,bkl,ofa){
   var actvTb = document.forms[0].activeTable.value;
   var dataT = document.all["dataTable"+actvTb];
   tbAddInfo.rows[0].cells[1].innerHTML=document.forms[0]["TXTDATA"+actvTb+idxRow].value;
   for(var i=0;i<dataT.rows.length;i++ ){
       dataT.rows[i].className="trnormal";
    }
   dataT.rows[idxRow].className="trhighlight";
   document.forms[0].ACCNUM.value = account;
   document.forms[0].filcod.value = document.forms[0]["TXTFILCOD"+actvTb+idxRow].value;
   adjustEquTables(headTable2, dataT, dataDiv2,1,false);
   document.forms[0].BKLFL.value = bkl;
   document.forms[0].WRGFL.value = wrg;
   document.forms[0].OFAFL.value = ofa;
  }   

function showNewInqApproval(app, account, type) {
var actvTb = document.forms[0].activeTable.value;
var formLength= document.forms[0].elements.length;
var appcode = ( trim(app) == "" ) ? "06" : app ;
   for(n=0;n<formLength;n++)
     {
      	var elementName= document.forms[0].elements[n].name;
      	var elementValue= document.forms[0].elements[n].value;
      	if(elementName == "ACCNUM"+actvTb && elementValue== account) 
      	{
        		document.forms[0].elements[n].click();
        		break;
      	}
      }
	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.approval.JSESD0140?SCREEN=3&ACCNUM=" + account + "&appCode=" + appcode + "&typeCode=" + type;
	CenterWindow(page,600,500,2);
 
}

function showOfac(fieldValue){
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

<BODY onload="MM_preloadImages('<%=request.getContextPath()%>/images/e/approve_over.gif','<%=request.getContextPath()%>/images/e/reject_over.gif')">
<h3 align="center">Approvals	
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="approval_list.jsp,ESD0140">
</h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.approval.JSESD0140">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
<INPUT TYPE=HIDDEN NAME="ACCNUM" VALUE="">
<INPUT TYPE=HIDDEN NAME="action" VALUE="A">
<INPUT TYPE=HIDDEN NAME="reason" VALUE="">
<INPUT TYPE=HIDDEN NAME="activeTable" VALUE="0">
<INPUT TYPE=HIDDEN NAME="appCode" VALUE="">
<INPUT TYPE=HIDDEN NAME="filcod" VALUE="">
<INPUT TYPE=HIDDEN NAME="WRGFL" VALUE="">
<INPUT TYPE=HIDDEN NAME="BKLFL" VALUE="">
<INPUT TYPE=HIDDEN NAME="OFAFL" VALUE="">


 <TABLE  id="mainTable1" class="tableinfo">
 <TR > 
    <TD NOWRAP width="100%" >
    <TABLE id="headTable1" >
     <TR id="trdark"> 
      <TH ALIGN=CENTER NOWRAP></TH>
      <TH ALIGN=CENTER NOWRAP>Customer Number</TH>
      <TH ALIGN=CENTER NOWRAP>Customer Name</TH>
     </TR>
    </TABLE>
  
   <div id="dataDiv1" class="scbarcolor">
    <table id="dataTable">
    <%
                custList.initRow();
                int i=1;
                while (custList.getNextRow()) {
                    if (!custList.getFlag().equals("")) {
                    		out.println(custList.getRecord());
                    i++;
                    }        
                }
    %> 
   </table>
   </div>
   </TD>
 </tr>
</table>

  <TABLE class="tbenter">
    <TR> 
      <TD ALIGN=CENTER width="24%"> <a href="javascript:goAction('A')" id="linkApproval" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','<%=request.getContextPath()%>/images/e/approve_over.gif',1)"><img name="Image1" alt="Approval" border="0" src="<%=request.getContextPath()%>/images/e/approve.gif" ></a></TD>
      <TD ALIGN=CENTER width="25%"> <a href="javascript:enterReason('R')" id="linkReject" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image2','','<%=request.getContextPath()%>/images/e/reject_over.gif',1)"><img name="Image2" alt="Reject" border="0" src="<%=request.getContextPath()%>/images/e/reject.gif" ></a> 
      </TD>
      <TD ALIGN=CENTER width="24%"><a href="javascript:goAction('D')" id="linkApproval" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image11','','<%=request.getContextPath()%>/images/e/delete_over.gif',1)"><img name="Image11" alt="Delete" border="0" src="<%=request.getContextPath()%>/images/e/delete.gif" width="70" height="55" ></a></TD>
      <TD ALIGN=CENTER width="27%"> <a href="javascript:goExit()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image5','','<%=request.getContextPath()%>/images/e/exit_over.gif',1)"><img name="Image5" border="0" src="<%=request.getContextPath()%>/images/e/exit.gif" ></a> 
      </TD>
    </TR>
    <TR> 
      <TD colspan="4" align="center"><b>Accounts or Transfers associated to selected 
        customer :</b></TD>
    </TR>
  </TABLE>
  
 <TABLE  id="mainTable" class="tableinfo">
 <TR > 
    <TD NOWRAP valign="top" width="100%" >
      
  <TABLE id="headTable2" >
  	<TR id="trdark"> 
      <TH ALIGN=CENTER NOWRAP></TH>
      <TH ALIGN=CENTER NOWRAP>Account/<br>Reference No.</TH>
	  <TH ALIGN=CENTER NOWRAP>CCY</TH>
	  <TH ALIGN=CENTER NOWRAP>Amount</TH>
      <TH ALIGN=CENTER NOWRAP>Description</TH>
      <TH ALIGN=CENTER NOWRAP>Product<br>Code</TH>
    </TR>
   </TABLE>
  
   <div id="dataDiv2" class="scbarcolor">
    <%
                custList.initRow();
                int j=0;
                while (custList.getNextRow()) {
    %>                
    <table id="dataTable<%=j%>" style="display:none;">
    <%
                appList.initRow();
                int k=1;
                while (appList.getNextRow()) {
                    if (appList.getFlag().equals(custList.getFlag())) {
                    		out.println(appList.getRecord());
                    k++;
                    }        
                }
    %> 
   </table>
   <%  
               j++;      
            }
    %> 
   </div>
   </TD>
   <TD nowrap ALIGN="RIGHT" valign="top">
      <Table id="tbAddInfoH" width="100%" >
        <tr id="trdark">
         <TH ALIGN=CENTER nowrap >Basic Information </TH>
        </tr>
      </Table>

     <Table id="tbAddInfo" >
      <tr id="trclear" >
            <TD  ALIGN="RIGHT"  valign="center" nowrap ><b>Bank : <br>Branch : <br>Gral. Ledger : <br>Cost Center : <br>Batch :<br>User : </b></TD>
         <TD ALIGN="LEFT" valign="center" nowrap class="tdaddinfo"></TD>
      </tr>
     </Table>
  </TD>
  </TR>	
</TABLE>

<SCRIPT language="JavaScript">
     if (dataTable.rows.length >=5){
	   dataDiv1.style.height="120"; 
   	   dataDiv1.style.overflowY="scroll";
   	 }
     function resizeDoc() {
      var actvTb = document.forms[0].activeTable.value;
      var dataT = document.all["dataTable"+actvTb];
       adjustEquTables(headTable1, dataTable, dataDiv1,1,false);
       adjustEquTables(headTable2, dataT, dataDiv2,1,false);
      }
	 showChecked("CUSNUM");
     resizeDoc();
     tbAddInfoH.rows[0].cells[0].height = headTable2.rows[0].cells[0].clientHeight;
     window.onresize=resizeDoc;
     
</SCRIPT>

</FORM>

</BODY>
</HTML>
