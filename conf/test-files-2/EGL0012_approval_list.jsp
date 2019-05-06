<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>
 Batch List Approval
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
</HEAD>

<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBObjList"    scope="session" />

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

function showInqApprovalBatch(batch,bank,branch) {
   var formLength= document.forms[0].elements.length;
   for(n=0;n<formLength;n++)
     {
      	var elementName= document.forms[0].elements[n].name;
      	var elementValue= document.forms[0].elements[n].value;
      	if(elementName == "BTHNUM"  && elementValue== batch) 
      	{
        		document.forms[0].elements[n].click();
        		break;
      	}
      }  
<%  
 	String port = session.getAttribute("TARGET") == null ? "EGL0035" : (String) session.getAttribute("TARGET");
 	
 	if ( port.equals("EGL0012M") ) {
 		port = "EGL0035IM";
 	} else {
 		if ( port.equals("EGL0012Y") ) {
    		port = "py.EGL0035";
    	}	
 	}  
   
%>      
   page = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEGL0035I?SCREEN=200&PORT=<%= port %>&BATCH=" + batch + "&BANK=" + bank + "&BRANCH=" + branch;
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
			alert(" Please,select batch before this operation");	   
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
  
  function Refresh() {
  	document.forms[0].SCREEN.value = '1';
  	document.forms[0].submit();
  }
 

<%  
 String title = "Approval of Batch";
 if (port.equals("EGL0012M") ) {
 	title = title + " Monthly";
 } else {
 	if ( port.equals("EGL0012A") ) {
    	title = title + " Years";
    }	
 }   
%>
  
</script>
<h3 align="center">
  <%= title %>		
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="approval_list.jsp,EGL0012"> 
</h3>
  <hr size="4">  
  
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEGL0012">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
<INPUT TYPE=HIDDEN NAME="action" VALUE="A">
<INPUT TYPE=HIDDEN NAME="reason" VALUE="">
<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
 <INPUT TYPE=HIDDEN NAME="PORT" VALUE="<%=session.getAttribute("TARGET")%>">

<TABLE class="tbenter">
    <TR>      
	  <TD ALIGN=CENTER  width="100%" colspan="4">
	  	<b>Refresh Screen When Batch Status Appears "In Process". </b>
      </TD>           
    </TR>    
    <TR>
      <TD ALIGN=CENTER width="25%">
  			<a href="javascript:goAction('A')" id="linkApproval" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','<%=request.getContextPath()%>/images/e/approve_over.gif',1)"><img name="Image1" alt="Approval" border="0" src="<%=request.getContextPath()%>/images/e/approve.gif" ></a>
      </TD>
	  <TD ALIGN=CENTER class=TDBKG width="25%">
	  	<a href="javascript:Refresh()"><b>Refresh</b></a>
      </TD>
      <TD ALIGN=CENTER width="25%">
  			<a href="javascript:enterReason('R')" id="linkReject" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image2','','<%=request.getContextPath()%>/images/e/reject_over.gif',1)"><img name="Image2" alt="Reject" border="0" src="<%=request.getContextPath()%>/images/e/reject.gif" ></a>
      </TD>
      <TD ALIGN=CENTER width="25%">
  			<a href="javascript:goExit()"  onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image5','','<%=request.getContextPath()%>/images/e/exit_over.gif',1)"><img name="Image5" border="0" src="<%=request.getContextPath()%>/images/e/exit.gif" ></a>
      </TD>
    </TR>
  </TABLE>
  
 <TABLE  id="mainTable" class="tableinfo" ALIGN=CENTER >
 <TR> 
    <TD NOWRAP>
  <TABLE id="headTable" >
  <TR id="trdark"> 
      <TH ALIGN=CENTER  NOWRAP></TH>
      <TH ALIGN=CENTER  NOWRAP>Batch</TH>
      <TH ALIGN=CENTER  NOWRAP>Bank</TH>
      <TH ALIGN=CENTER  NOWRAP>Branch</TH>
      <TH ALIGN=CENTER  NOWRAP>Date</TH>
      <TH ALIGN=CENTER  NOWRAP>Operator</TH>
      <TH ALIGN=CENTER  NOWRAP>Status</TH>
      <TH ALIGN=CENTER  NOWRAP>Total Debit</TH>
      <TH ALIGN=CENTER  NOWRAP>Total Credit</TH>
      <TH ALIGN=CENTER  NOWRAP># Trans.</TH>
  </TR>
  </TABLE>
  
   <div id="dataDiv1" class="scbarcolor" >
    <table id="dataTable" >
    <%
                appList.initRow();
                int k=1;
                while (appList.getNextRow()) {
              		out.println(appList.getRecord());
                    k++;
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
