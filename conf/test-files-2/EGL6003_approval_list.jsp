<HTML>
<HEAD>
<TITLE>    
 List of Lots To Approve Month Previous  
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">

<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBList"    scope="session" />

<jsp:useBean id= "error"  class= "datapro.eibs.beans.ELEERRMessage"    scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"   scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

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
      	if(elementName == "BTHNUM") 
      	{
        		ok = true;
        		break;
      	}
      }
	  if ( ok ) {
          document.forms[0].submit();
     }
     else {
			alert(" It selects a lot before conducting this operation");	   
     }

 }  
 
 function goExit(){
   window.location.href="<%=request.getContextPath()%>/pages/background.jsp";

  }   
  
 function showAddInfo(idxRow){
   for ( var i=0; i<dataTable.rows.length; i++ ) {
       dataTable.rows[i].className="trnormal";
    }
   dataTable.rows[idxRow].className="trhighlight";
  }   
</script>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>
</HEAD>
<BODY>

<SCRIPT LANGUAGE="javascript">

function showInqApprovalBatch(batch,bank,branch) {
   var formLength= document.forms[0].elements.length;
   for(n=0;n<formLength;n++)
     {
      	var elementName= document.forms[0].elements[n].name;
      	var elementValue= document.forms[0].elements[n].value;
      	if(elementName == "BTHNUM" && elementValue== batch) 
      	{
        		document.forms[0].elements[n].checked = true;
        		break;
      	}
      }           
   
   pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEGL0035IM?SCREEN=200&BATCH=" + batch + "&BANK=" + bank + "&BRANCH=" + branch;
   CenterWindow(pg,650,500,2);
 
}
</SCRIPT>
<h3 align="center">
  Approval of Countable Lots Previous Month
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="approval_list.jsp,EGL6003"></H3>  
<hr size="4"> 
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEGL6003" >  
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
<INPUT TYPE=HIDDEN NAME="action" VALUE="A">
<INPUT TYPE=HIDDEN NAME="reason" VALUE="">
<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">

 
  <TABLE class="tbenter">
    <TR>
      <TD class="TDBKG" width="33%">
  			<a href="javascript:goAction('A')" id="linkApproval" >Approval</a>
      </TD>
      <TD class="TDBKG" width="34%">
  			<a href="javascript:goExit()" >Exit</a>
      </TD>
    </TR>
  </TABLE>


<TABLE  id="mainTable" class="tableinfo">
 <TR> 
    <TD NOWRAP>
  <TABLE id="headTable">
  <TR id="trdark">  
      <TH ALIGN=CENTER nowrap></TH>
      <TH ALIGN=CENTER nowrap>Lot</TH>
      <TH ALIGN=CENTER nowrap>Bank</TH>
      <TH ALIGN=CENTER nowrap>Branch</TH>
      <TH ALIGN=CENTER nowrap>Date</TH>
      <TH ALIGN=CENTER nowrap>Operator</TH>
      <TH ALIGN=CENTER nowrap>Status</TH>
      <TH ALIGN=CENTER nowrap>Total Debit</TH>
      <TH ALIGN=CENTER nowrap>Total Credit</TH>
      <TH ALIGN=CENTER nowrap>No.Trans.</TH>
  </TR>
  </TABLE>
  
   <div id="dataDiv1" class="scbarcolor" style="padding:0">
    <table id="dataTable">
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
  showChecked("BTHNUM");
  resizeDoc();
  window.onresize=resizeDoc;
     
</SCRIPT>

</FORM>

</BODY>
</HTML>
