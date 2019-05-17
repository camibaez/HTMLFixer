<html>
<head>
<title>Escrow</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EDL205001Help" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<script language="JavaScript">

function goAction(op) {

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
<h3 align="center">Escrow Payment Inquiry</h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL2050" >
  <input type=HIDDEN name="SCREEN" value="11">
  <input type=HIDDEN name="opt" value="2">
  <input type=HIDDEN name="totalRow" value="0">
  <input type=HIDDEN name="ACCOUNT">
  <input type=HIDDEN name="COMPANY">
  <input type=HIDDEN name="DEDUCTION">

  <table  class="tableinfo">
	   <tr id="trdark"> 
	    <td nowrap width="50%" > 
	      <div align="right">Account :</div>
	    </td>
	    <td nowrap width="50%" > 
	      <input type="text" name="E01DEAACC" size="13" maxlength="13" value="<%= userPO.getAccNum()%>" readonly>
	    </td>
	  </tr>
	   <tr id="trdark"> 
	    <td nowrap width="50%" > 
	      <div align="right">Customer :</div>
	    </td>
	    <td nowrap width="50%" > 
	      <input type="text" name="E01DEACUN" size="4" maxlength="3" value="<%= userPO.getCusNum()%>" readonly>
	      <input type="text" name="E01CUSNA1" size="60" maxlength="35" value="<%= userPO.getCusName()%>" readonly>
	    </td>
	  </tr>	  
   </table>

  <%
	if ( EDL205001Help.getNoResult() ) {
 %>
 
  
  <p>&nbsp;</p>
  <TABLE class="tbenter" width="100%" >
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
        <div align="center"><a href="javascript:goAction(2)"><b>Inquiry</b></a></div>
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
              <div align="center">Deduction<br>Code</div>
            </th>
            <th align=CENTER nowrap > 
              <div align="center">Description</div>
            </th>
            <th align=CENTER nowrap > 
              <div align="center">Escrow<br>Balance</div>
            </th>
            <th align=CENTER nowrap > 
              <div align="center">Expected<br>Payment Amount</div>
            </th>
            <th align=CENTER nowrap > 
              <div align="center">Payment<br>Amount</div>
            </th>
          </tr>
        </table>
     <div id="dataDiv1" class="scbarcolor" >
    <table id="dataTable" > 
		<%
                EDL205001Help.initRow();
				int k=1;
                while (EDL205001Help.getNextRow()) {
                 
                  out.println(EDL205001Help.getRecord());
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
