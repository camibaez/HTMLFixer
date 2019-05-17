<html>
<head>
<title>Safe Deposit New</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import ="datapro.eibs.master.Util" %>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "msgPart" 	class= "datapro.eibs.beans.ESB011001Message"  	scope="session" />
<jsp:useBean id= "error" 	class= "datapro.eibs.beans.ELEERRMessage"  		scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos"  			scope="session"/>

<SCRIPT Language="Javascript">
	function enable_disable_refNumber(op){
        if (op == 1){   
        	GetDepositNumber('E01SBLDEP','','','D01CUSNA1')
        } else if (op == 2){
        	document.forms[0].E01SBLDEP.value = "";        
        	GetCustomerDescId('E01SBLCUN','D01CUSNA1','')
        }
    }
                
</SCRIPT>

<% 
if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
%>
<SCRIPT Language="Javascript">
        showErrors();
                
</SCRIPT>
<%}%>

</head>
<body>

<H3 align="center">Safe Deposit Box Visits Log-Search<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="safe_deposit_visit_search, ESB0020"></H3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.safedeposit.JSESB0020">
 
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="11">
  
  <table class="tableinfo">
   <tr> 
   <td>
    <table cellspacing=0 cellpadding=2 width="100%" border="0">    
     	
     	<TR>
            <td nowrap width="17%" >
              <div align="right">  Date Range :</div>
            </td>
              <td nowrap > 
                <div align="left"> 
                  <input type="text" name="S01FRDT1" size="2" maxlength="2" onkeypress="enterInteger()">
                  <input type="text" name="S01FRDT2" size="2" maxlength="2" onkeypress="enterInteger()">
                  <input type="text" name="S01FRDT3" size="2" maxlength="2" onkeypress="enterInteger()">
                  <a href="javascript:DatePicker(document.forms[0].S01FRDT1,document.forms[0].S01FRDT2,document.forms[0].S01FRDT3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
                </div>
              </td>
            <td nowrap width="17%" >
				<div align="center">To :</div>
				</td>
              <td nowrap > 
                <div align="left"> 
                  <input type="text" name="S01TODT1" size="2" maxlength="2" onkeypress="enterInteger()">
                  <input type="text" name="S01TODT2" size="2" maxlength="2" onkeypress="enterInteger()">
                  <input type="text" name="S01TODT3" size="2" maxlength="2" onkeypress="enterInteger()">
                  <a href="javascript:DatePicker(document.forms[0].S01TODT1,document.forms[0].S01TODT2,document.forms[0].S01TODT3)">
                  <img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
                </div>
              </td>
			</TR>
     	<tr id=trdark> 
	      <td nowrap> 
	        <div align="right">Safe Deposit Number : </div>
	      </td>
				<td nowrap colspan="3">
					<div align="left">
					<input type="text" name="E01SBLDEP" size="16"
					maxlength="14"> <a
					href="javascript:enable_disable_refNumber(1)">
					<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"
					align="bottom" border="0"></a>
					</div>
				</td>
			</tr>
     	<TR>
	      <td nowrap> 
	        <div align="right">Customer : </div>
	      </td>
				<td nowrap colspan="3">
				<div align="left">
					<input type="hidden" name="E01SBLCUN" size="10"	maxlength="10">
					<input type="text" name="D01CUSNA1" size="47" maxlength="45" readonly>
					<a href="javascript:enable_disable_refNumber(2)">
					<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"
					align="bottom" border="0"></a></div>
				</td>
			</TR></table>
    </td>
   </tr>
  </table>
  <br>
  
  <p align="center"> 
    <input id="ESBSBTN" type="submit" name="Submit" value="Search">
  </p>
</form>
</body>
</html>
