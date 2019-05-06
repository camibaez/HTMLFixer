<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<%@ page import = "datapro.eibs.master.Util" %>
<head> 
<title>Front Office - Foreign Exchange Rates Inquiry</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" /> 
<jsp:useBean id="msgInq" class="datapro.eibs.beans.EFO016002Message" scope="session" />   
<jsp:useBean id="ccyList" class="datapro.eibs.beans.JBList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </script>
<SCRIPT Language="Javascript">
<!--- hide script from old browsers
 //  Process according with user selection
 function goAction(op) {
	
   	switch (op){
	// Validate & Generate FX Transaction
  	case 1:  {
    	document.forms[0].SCREEN.value = '1';
		document.forms[0].submit();
       	break;
        }
	// Return to Previus Screen
	case 2:  {
    	pg = "<%=request.getContextPath()%>/pages/background.jsp";
		window.location.href=pg;
        break;
        }
	// Validate & get FX Rate
  	default:  {
		document.forms[0].SCREEN.value = '1';
		document.forms[0].submit();
       	break;
		}

    }  
 }

// end hiding from old browsers -->
</SCRIPT>


</head>
<body>

<%if (!error.getERRNUM().equals("0")) {
	error.setERRNUM("0");
	out.println("<SCRIPT Language=\"Javascript\">");
	out.println("       showErrors()");
	out.println("</SCRIPT>");
}
%>
<div align="center">
<h3>Foreign Exchange Rates Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" alt="front_FX_rates_inquiry.jsp,EFO0160"></h3>
</div>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEFO0160">
<INPUT type="hidden" name="SCREEN" value="3">

<TABLE class="tbenter" width="100%">
 	<tr id="trintrot"> 
    	<td colspan="7"><%= currUser.getH01USR()%></td>
        <td width="20%"> 
          <div align="right"><%= datapro.eibs.master.Util.formatDate(currUser.getE01RDM(),currUser.getE01RDD(),currUser.getE01RDY())%></div>
        </td>
    </tr>    
	<TR> 
	</TR>
</TABLE>


<h4> Foreign Exchange Rates</h4>

<TABLE  id="mainTable" class="tableinfo" ALIGN=CENTER >
 <TR> 
    <TD NOWRAP valign="top" width="100%" >
    	<TABLE id="headTable" >
     		<TR id="trdark"> 
      			<TH ALIGN=CENTER NOWRAP>Currency</TH>
     			<TH ALIGN=CENTER NOWRAP>Description</TH>
     			<TH ALIGN=CENTER NOWRAP>Purchase<br>Rate</TH>
     			<TH ALIGN=CENTER NOWRAP>Purchase<br>Maximum<br>Amount</TH>
				<TH ALIGN=CENTER NOWRAP>Purchase<br>Status</TH>
     			<TH ALIGN=CENTER NOWRAP>Sell<br>Rate</TH>
     			<TH ALIGN=CENTER NOWRAP>Sell<br>Maximum<br>Amount</TH>
     			<TH ALIGN=CENTER NOWRAP>Sell<br>Status</TH>
  	 		</TR>
		</TABLE> 
        <div id="dataDiv1" class="scbarcolor"> 
           	<table id="dataTable" >
             	<%
               		ccyList.initRow();
               		int k=1;
               		while (ccyList.getNextRow()) {
                   		if (ccyList.getFlag().equals("")) {
                   			out.println(ccyList.getRecord());
                   		k++;
                   		}        
               		}
           		%>
           	</table>
          </div>
       </td>
  	</tr>
  </table>
  
<table width="100%">		
  	<tr>
  		<td width="50%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Refresh" value="Refresh" onClick="javascript:goAction(1);">
     	  </div>	
  		</td>
  		<td width="50%"> 
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Return" value="Return" onClick="javascript:goAction(2);">
     	  </div>	
  		</td>
  	</tr>	
</table>	

<SCRIPT language="JavaScript">
     function resizeDoc() {
      adjustEquTables(headTable, dataTable, dataDiv1,1,false);
      }
     resizeDoc();
     window.onresize=resizeDoc;
</SCRIPT>

</form>
</body>
</html>
