<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>
 Return Deposit Checks Approval
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
</HEAD>

<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBList"    scope="session" />
<jsp:useBean id= "error"  class= "datapro.eibs.beans.ELEERRMessage"    scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"   scope="session" />

<BODY onload="MM_preloadImages('<%=request.getContextPath()%>/images/e/approve_over.gif','<%=request.getContextPath()%>/images/e/reject_over.gif')">


<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>


<SCRIPT LANGUAGE="javascript">

function showInqApprovalBatch(refnum,bank,branch,ope,con,amount) {
   var formLength= document.forms[0].elements.length;
   for(n=0;n<formLength;n++)
     {
      	var elementName= document.forms[0].elements[n].name;
      	var elementValue= document.forms[0].elements[n].value;
      	if(elementName == "REFNUM" ) 
      	{
      		if (elementValue == refnum ) {
        		document.forms[0].elements[n].click();
        		break;
        	}
      	}
      }
   
   page = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD1201?SCREEN=900&REFNUM=" + refnum + "&BANK=" + bank + "&BRANCH=" + branch + "&OPE=" + ope + "&CON=" + con + "&AMOUNT=" + amount;
   CenterWindow(page,600,500,2);
}
</SCRIPT>
<script language="javascript">
  var reason = '';
 
  function goAction(op) {


     document.forms[0].action.value = op;
     document.forms[0].reason.value = reason;
     var formLength= document.forms[0].elements.length;
     var ok = false;
     for(n=0;n<formLength;n++)
     {
      	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "REFNUM") 
      	{
        		ok = true;
        		break;
      	}
      }
	  if ( ok ) {
          document.forms[0].submit();
     }
     else {
			alert(" Please,select reference number before this operation");	   
     }


 }  
 
 function goExit(){
   window.location.href="<%=request.getContextPath()%>/pages/background.jsp";

  }   
  
</script>
<h3 align="center">
   Approval of Return Deposit Checks 		
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="rdc_ap_list.jsp,EDD1201"> 
</h3>
  <hr size="4">  
  
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD1201">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="800">
<INPUT TYPE=HIDDEN NAME="action" VALUE="A">
<INPUT TYPE=HIDDEN NAME="reason" VALUE="">
<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
  
 <table  class="tbenter" width=100% align=center>
  <tr > 
    <td class=TDBKG width="33%" > 
       <div align="center" ><a href="javascript:goAction('A')"><b>Approval</b></a></div>
    </td>
    <td class=TDBKG width="33%" > 
        <div align="center" ><a href="javascript:goAction('R')"><b>Reject</b></a></div>
    </td>
    <td class=TDBKG width="33%" > 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
    </td>
   </tr>
 </table>
  
 <TABLE  id="mainTable" class="tableinfo" ALIGN=CENTER >
 <TR> 
    <TD NOWRAP>
  <TABLE id="headTable" >
  <TR id="trdark"> 
      <TH ALIGN=CENTER WIDTH="5%" NOWRAP></TH>
      <TH ALIGN=CENTER WIDTH="15%" NOWRAP>Reference</TH>
      <TH ALIGN=CENTER WIDTH="10%" NOWRAP>Bank</TH>
      <TH ALIGN=CENTER WIDTH="10%" NOWRAP>Branch</TH>
      <TH ALIGN=CENTER WIDTH="40%" NOWRAP>Concept</TH>
      <TH ALIGN=CENTER WIDTH="20%" NOWRAP>Amount</TH>
  </TR>
  </TABLE>
  
   <div id="dataDiv1" class="scbarcolor" >
    <table id="dataTable" >
    <%
                appList.initRow();
                int k=1;
                while (appList.getNextRow()) {
                    if (appList.getFlag().equals("")) {
                    		out.println(appList.getRecord());
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
     divResize();
     adjustEquTables(headTable, dataTable, dataDiv1,1,false);
      }
     showChecked("REFNUM");
     resizeDoc();
     window.onresize=resizeDoc;
     
</SCRIPT>

</FORM>

</BODY>
</HTML>
