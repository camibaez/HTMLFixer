<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>
Account List Approval
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBList"    scope="session" />

<jsp:useBean id= "error"  class= "datapro.eibs.beans.ELEERRMessage"    scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"   scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="javascript">
  var reason = '';
  var accOfac = '';
  var accWarn = '';

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
            if (accWarn != "" && op != 'D') {
   		 		page = "<%=request.getContextPath()%>/servlet/datapro.eibs.alerts.JSESD0000?ACCNUM=" + accWarn+"&APP=1";
 	        	CenterWindow(page,420,300,2);
            } else {
             	 document.forms[0].submit();
            }
          
      }
      else {
 	alert("Select GL Account Number before this operation");	   
      }

 }
  
 function goExit(){
    window.location.href="<%=request.getContextPath()%>/pages/background.jsp";
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

</script>

</HEAD>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
	 error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<BODY onload="MM_preloadImages('<%=request.getContextPath()%>/images/e/approve_over.gif','<%=request.getContextPath()%>/images/e/reject_over.gif')">

<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEGL1000">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
<INPUT TYPE=HIDDEN NAME="action" VALUE="A">
<INPUT TYPE=HIDDEN NAME="reason" VALUE="">
<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
<h3 align="center">
 Approval of General Ledger Accounts		  
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="approval_list.jsp,EGL1000"> 
</h3>
  <hr size="4">
 <TABLE class="tbenter">
    <TR>
      <TD ALIGN=CENTER width="33%">
  			<a href="javascript:goAction('A')" id="linkApproval" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','<%=request.getContextPath()%>/images/e/approve_over.gif',1)"><img name="Image1" alt="Approval" border="0" src="<%=request.getContextPath()%>/images/e/approve.gif" ></a>
      </TD>
      <TD ALIGN=CENTER width="33%">
      </TD>
      <TD ALIGN=CENTER width="34%">
  			<a href="javascript:goAction('D')" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image5','','<%=request.getContextPath()%>/images/e/delete_over.gif',1)"><img name="Image5" border="0" src="<%=request.getContextPath()%>/images/e/delete.gif" ></a>
      </TD>
    </TR>
  </TABLE>
   
<TABLE  id="mainTable" class="tableinfo" >
 <TR> 
    <TD NOWRAP valign="top" >
  <TABLE id="headTable"  >
    <TR id="trdark"> 
      <TH ALIGN=CENTER rowspan="2" NOWRAP></TH>
      <TH ALIGN=CENTER rowspan="2" NOWRAP>Bank</TH>
      <TH ALIGN=CENTER colspan="2" NOWRAP>Currency</TH>
      <TH ALIGN=CENTER rowspan="2" NOWRAP>GL Number</TH>
      <TH ALIGN=CENTER rowspan="2" NOWRAP>Description</TH>
	  <TH ALIGN=CENTER rowspan="2" NOWRAP>Remarks</TH>
	  <TH ALIGN=CENTER rowspan="2" NOWRAP>Batch</TH>
	  <TH ALIGN=CENTER rowspan="2" NOWRAP>User</TH>
    </TR>
  </TABLE>
  
   <div id="dataDiv1" class="scbarcolor"> <%-- style="padding:0" NOWRAP> --%>
    <table id="dataTable"  >
    <%
                appList.initRow();
                int k=1;
                while (appList.getNextRow()) {
                    if (appList.getFlag().equals("")) { %>
                   		<%-- out.println(appList.getRecord()); --%>
						<%= appList.getRecord() %>
	<%
                    k++;
                    }        
                }                 
    %> 
   </table>
   </div>
   </TD>
  </TR>	
</TABLE>
      
<SCRIPT language="JavaScript">
  document.forms[0].totalRow.value="<%= k %>";
  function resizeDoc() {
       //divResize(true);
       adjustDifTables(headTable, dataTable, dataDiv1,2,1);
  }
  showChecked("GLMNUM");
  resizeDoc();
  <%-- tbAddInfoH.rows[0].cells[0].height = headTable.rows[0].cells[0].clientHeight; --%>
  window.onresize=resizeDoc;
     
</SCRIPT>


</FORM>

</BODY>
</HTML>
