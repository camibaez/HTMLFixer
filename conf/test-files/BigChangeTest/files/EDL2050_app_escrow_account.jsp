<html>
<head>
<title>Escrow</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EDL205501Help" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<script language="JavaScript">

function goAction(op) {
    document.forms[0].reason.value = reason;
	document.forms[0].opt.value = op;
	document.forms[0].submit();
  
}


function getParams(account,company,deduction) {

    document.forms[0].ACCOUNT.value = account;
	document.forms[0].COMPANY.value = company;
	document.forms[0].DEDUCTION.value = deduction;
    
}


</SCRIPT>  

</head>

<BODY>
<h3 align="center">Approval Company Payment File </h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL2050" >
  <input type=HIDDEN name="SCREEN" value="6">
  <input type=HIDDEN name="opt" value="2">
  <input type=HIDDEN name="totalRow" value="0">
  <input type=HIDDEN name="ACCOUNT">
  <input type=HIDDEN name="COMPANY">
  <input type=HIDDEN name="DEDUCTION">
  <INPUT TYPE=HIDDEN NAME="action" VALUE="A">
  <INPUT TYPE=HIDDEN NAME="reason" VALUE="">


  <%
	if ( EDL205501Help.getNoResult() ) {
 %> 
  <p>&nbsp;</p><TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p><b>There is no match for your search criteria </b></p>
          </div>

	  </TD>
	</TR>
    </TABLE>
	
  <%  
		}
	else {
%> <% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%> 
  <p> 

          
  <table class="tbenter" width=100% align=center>
    <tr> 
      <td class=TDBKG width="33%"> 
        <div align="center"><a href="javascript:goAction(A)" id="linkApproval"><b>Approval</b></a></div>
      </td>
      <td class=TDBKG width="33%">
        <div align="center"><a href="javascript:goAction(R)" id="linkReject"><b>Reject</b></a></div>
      </td>
      <td class=TDBKG width="33%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
      </td>
    </tr>
  </table>
   
  <br>
  
  <TABLE  id="mainTable" class="tableinfo">
 <TR > 
    <TD NOWRAP valign="top" width="100%" >
        <table id="headTable" width="100%" >
          <tr id="trdark"> 
            <th align=CENTER nowrap >&nbsp;</th>
            <th align=CENTER nowrap > 
              <div align="center">Reference<br>Number</div>
            </th>
            <th align=CENTER nowrap > 
              <div align="center">Company</div>
            </th>
            <th align=CENTER nowrap > 
              <div align="center">Deduction</div>
            </th>
            <th align=CENTER nowrap > 
              <div align="center">Payment<br>Amount</div>
            </th>
            <th align=CENTER nowrap >Remarks</th>
            <th align=CENTER nowrap > 
              <div align="center">Amount</div>
            </th>
          </tr>
        </table>
     <div id="dataDiv1" class="scbarcolor" >
    <table id="dataTable" > 
		<%
                EDL205501Help.initRow();
				int k=1;
                while (EDL205501Help.getNextRow()) {
                 
                  out.println(EDL205501Help.getRecord());
                  k++;   
                }
              %> 
    </table>
   </div>
</Table>
<SCRIPT language="JavaScript">
     document.forms[0].totalRow.value="<%= k %>";
     function resizeDoc() {
       divResize(false);
     adjustEquTables(headTable, dataTable, dataDiv1,1,false);
      }

     resizeDoc();
    
     window.onresize=resizeDoc;
     
     try {
	     document.forms[0].index[0].click();
	 } catch (e) {
	     document.forms[0].index.click();
	 }
     
</SCRIPT>
  <%}%>
</form>

</body>
</html>