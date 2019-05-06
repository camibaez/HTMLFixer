<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Account Details</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "cifAcc" class= "datapro.eibs.beans.JBList"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<!-- script language="Javascript1.1" src=" request.getContextPath()/pages/e/javascripts/optMenu.jsp"> </SCRIPT -->

<SCRIPT Language="Javascript">
  function goAction(op) {

     document.forms[0].opt.value = op;
     var formLength= document.forms[0].elements.length;
     var ok = false;
     for(n=0;n<formLength;n++)
     {
      	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "ACCNUM") 
      	{
        		ok = true;
        		break;
      	}
      }
	  if ( ok ) {
          document.forms[0].submit();
     }
     else {
			alert("Please select an account to continue.");	   
     }

  }
  
function showAddInfo(idxRow){
  var opening="<b>Bank : <br>Branch : <br>Opening : <br>Principal : <br>Interest : <br>Other : <br>Total : </b>";
  var mature="<b>Bank : <br>Branch : <br>Maturity : <br>Principal : <br>Interest : <br>Other : <br>Total : </b>";
  var codeACD=document.forms[0]["CODACD"+idxRow].value;

   if (codeACD=="01" || codeACD=="02" || codeACD=="03" || codeACD=="04"){
     tbAddInfo.rows[0].cells[0].innerHTML=opening; 
   } else {
     tbAddInfo.rows[0].cells[0].innerHTML=mature;
   }
   tbAddInfo.rows[0].cells[1].innerHTML=document.forms[0]["TXTDATA"+idxRow].value;   
   for ( var i=0; i<dataTable.rows.length; i++ ) {
       dataTable.rows[i].className="trnormal";
    }
   dataTable.rows[idxRow].className="trhighlight";
   adjustDifTables(headTable, dataTable, dataDiv1,1,1);
  }   
</SCRIPT>
<!-- script type="text/javascript">var __context_path = ' request.getContextPath() ';</script -->
<!-- script type="text/javascript" src=" request.getContextPath() /pages/e/javascripts/menu_data.js"></script -->
<!-- script type="text/javascript" src=" request.getContextPath() /pages/e/javascripts/menu_functions.js"></script -->
<script type="text/javascript">var __context_path = '<%=request.getContextPath()%>';</script>
<script type="text/javascript" src="<%= request.getContextPath() %>/pages/e/javascripts/menu_data.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/pages/e/javascripts/menu_functions.js"></script>
<script type="text/javascript">
	builtNewMenu2(ecif10_i_opt);
	window.onload = function() {initMenu(); MoveMenu();}
</script>

</head>

<BODY onload="MM_preloadImages('<%=request.getContextPath()%>/images/e/exit_over.gif','<%=request.getContextPath()%>/images/e/INQUIRY_OVER.gif','<%=request.getContextPath()%>/images/e/AVERAGE_OVER.gif','<%=request.getContextPath()%>/images/e/STATEMENT_ACCOUNT_OVER.gif')">

<%@ page import="datapro.eibs.master.Util" %>
<h3 align="center">List of Accounts<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cif_accounts.jsp,ECIF010"></h3>
<hr size="4">
  <form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF010" >
    <INPUT TYPE=HIDDEN NAME="SCREEN" value="10">
	 <INPUT TYPE=HIDDEN NAME="opt" VALUE="1">
	  <INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
<%
	if ( cifAcc.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
        
      <div align="center"> <font size="3"><b> There is no match for your criteria 
        </b></font> </div>
      </TD></TR>
   		</TABLE>
<%   		
	}
	else {
%>
  
 <table  class="tbenter" width=100% align=center>
  <tr > 
    <td class=TDBKG width="20%" > 
       <div align="center" ><a href="javascript:goAction(1)"><b>Inquiry</b></a></div>
    </td>
    <td class=TDBKG width="20%" > 
        <div align="center" ><a href="javascript:goAction(2)"><b>Statement</b></a></div>
    </td>
    <td class=TDBKG width="20%" > 
        <div align="center" ><a href="javascript:goAction(3)"><b>Averages</b></a></div>
    </td>
    <td class=TDBKG width="20%" > 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
    </td>
   </tr>
 </table>
  
<TABLE  id="mainTable" ALIGN=CENTER class=tableinfo >
<TR> 
    <TD NOWRAP valign="top" width="100%" >
  <TABLE id="headTable" >
  <TR id="trdark"> 
    <TH nowrap ALIGN=CENTER rowspan="2"></TH>
    <TH nowrap ALIGN=CENTER colspan="2">Account</TH>
    <TH nowrap ALIGN=CENTER rowspan="2">Product</TH>
	<TH nowrap ALIGN=CENTER rowspan="2">CCY</TH>
    <TH nowrap ALIGN=CENTER rowspan="2">Principal</TH>
	<TH nowrap ALIGN=CENTER rowspan="2">Officer</TH>
  </TR>
  <TR id="trdark"> 
    <TH nowrap ALIGN=CENTER>Number</TH>
    <TH nowrap ALIGN=CENTER>Status</TH>
  </TR>
  </TABLE>
  
   <div id="dataDiv1" class="scbarcolor" >
    <table id="dataTable" >
    <%
                cifAcc.initRow();
                int k=1;
                while (cifAcc.getNextRow()) {
                    if (cifAcc.getFlag().equals("")) {
                    		out.println(cifAcc.getRecord());
                    		k++;
                    }        
                }
    %> 
   </table>
   </div>
   <TABLE id="tbbotton" width="100%">
     <TR> 
      <TD nowrap align=right width="70%"><b>Principal Total :</b> </TD>
      <TD nowrap align=right><%= Util.fcolorCCY((String)session.getAttribute("Total")) %></TD>
	  <TD nowrap align=right width="15%"></TD>
     </TR>
   </TABLE>
   </TD>
   <TD nowrap ALIGN="RIGHT" valign=top>
      <Table id="tbAddInfoH" width="100%" >
        <tr id="trdark">
         <TH ALIGN=CENTER nowrap >Basic Information </TH>
        </tr>
      </Table>

     <Table id="tbAddInfo" height="100%">
      <tr id="trclear" >
         <TD  ALIGN="RIGHT"  valign="center" nowrap ></TD>
         <TD ALIGN="LEFT" valign="center" nowrap class="tdaddinfo"></TD>
      </tr>
     </Table>
   
  </TD>
  </TR>	
</TABLE>

<SCRIPT language="JavaScript">
     document.forms[0].totalRow.value="<%= k %>";
     function resizeDoc() {
       divResize(true);
      adjustDifTables(headTable, dataTable, dataDiv1,1,1);
      }
     showAddInfo(0);
     resizeDoc();
     tbAddInfoH.rows[0].cells[0].height = headTable.rows[0].cells[0].clientHeight;
     window.onresize=resizeDoc;
</SCRIPT>

<%
  }
%>

  </form>
</body>
</html>
