<html>
<head>
<title></title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EIE003202Help" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<script language="JavaScript">


function goAction() {

	document.forms[0].SCREEN.value=3;
	
	document.forms[0].submit();
  
}


function getParams(customer,portfolio,currency,nominal,quantity,insttype,custodian) {

    document.forms[0].CUSTOMER.value = customer;
    document.forms[0].PORTFOLIO.value = portfolio;
	document.forms[0].CURRENCY.value = currency;
    document.forms[0].NOMINAL.value = nominal;
    document.forms[0].QUANTITY.value = quantity;
    document.forms[0].INSTTYPE.value = insttype;
    document.forms[0].CUSTODIAN.value = custodian;
    

}

function cancelBub(){
  event.cancelBubble = true;
}



</SCRIPT>  

</head>

<BODY>
<h3 align="center">Instrument Open Position by Customer <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="sel_inst.jsp, EIE0320"></h3>
<hr size="4">

<FORM  METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0300" >
  <p> 
    <input type=HIDDEN name="SCREEN" value="3">
    <input type=HIDDEN name="opt" value="1">
    <input type=HIDDEN name="totalRow" value="0">
    <input type=HIDDEN name="PORTFOLIO">
    <input type=HIDDEN name="CURRENCY">
    <input type=HIDDEN name="CUSTOMER">
    <input type=HIDDEN name="NOMINAL">
    <input type=HIDDEN name="QUANTITY">
    <input type=HIDDEN name="INSTTYPE">
    <input type=HIDDEN name="CUSTODIAN">
    <input type=HIDDEN name="TRANCODE" value="2">	
	<input type=HIDDEN name="RCDT1" value="<%=request.getParameter("RCDT1") %>">	
	<input type=HIDDEN name="RCDT2" value="<%=request.getParameter("RCDT2") %>">
	<input type=HIDDEN name="RCDT3" value="<%=request.getParameter("RCDT3") %>">
  </p>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right"><a href="javascript:showInstrumentInq(document.forms[0].INSTRUMENT.value)"><img src="<%=request.getContextPath()%>/images/1aquire.gif" alt="help" align="absbottom" border="0" > 
                Instrument </a> :</div>
            </td>
            <td nowrap colspan="5" > 
              <div align="left"> 
                <input type=HIDDEN name="INSTRUMENT" value="<%= userPO.getHeader22()%>">
                <%= userPO.getHeader20()%></div>
            </td>
            <td nowrap > 
              <div align="right">Instrument Type :</div>
            </td>
            <td nowrap > 
              <div align="left"><%= userPO.getHeader17()%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Currency :</div>
            </td>
            <td nowrap colspan="5" ><%= userPO.getHeader15()%></td>
            <td nowrap >
              <div align="right">Net Outstanding :</div>
            </td>
            <td nowrap >
              <div align="left"><%= userPO.getHeader16()%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Custodian :</div>
            </td>
            <td nowrap colspan="7" ><%= userPO.getHeader21()%></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p><%
	if ( EIE003202Help.getNoResult() ) {
 %> </p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp; </p>
  <TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>There is no match for your search criteria</b></p>
          
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
  <%--    <td class=TDBKG width="33%">
        <div align="center"><a href="javascript:openTradeTicket(document.forms[0].CUSTOMER.value,document.forms[0].PORTFOLIO.value,document.forms[0].INSTRUMENT.value,document.forms[0].NOMINAL.value,document.forms[0].QUANTITY.value,document.forms[0].INSTTYPE.value,document.forms[0].CUSTODIAN.value,document.forms[0].TRANCODE.value)"><b>Sell</b></a></div>
      </td>  --%>
      <td class=TDBKG width="33%"> 
        <div align="center"><a href="javascript:showOpenTransRecDte(document.forms[0].CUSTOMER.value,document.forms[0].PORTFOLIO.value,document.forms[0].CURRENCY.value,document.forms[0].INSTRUMENT.value,document.forms[0].RCDT1.value,document.forms[0].RCDT2.value,document.forms[0].RCDT3.value)">
			<b>Transactions</b></a><a href="javascript:showOpenInq(document.forms[0].CUSTOMER.value,document.forms[0].PORTFOLIO.value,document.forms[0].CURRENCY.value)"></a></div>
      </td>
      <td class=TDBKG width="33%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
      </td>
    </tr>
  </table>
   
  <br>
  
  <TABLE  id="mainTable" class="tableinfo">
 <TR > 
    <TD NOWRAP valign="top" >
                
        <table id="headTable" >
          <tr id="trdark"> 
            <th align=CENTER nowrap >&nbsp;</th>
            <th align=CENTER nowrap > 
              <div align="center">Customer</div>
            </th>
            <th align=CENTER nowrap >Portfolio</th>
            <th align=CENTER nowrap > Type</th>
            <th align=CENTER nowrap >Portf. <br>
              CCY</th>
            <th align=CENTER nowrap ><%= userPO.getHeader18()%></th>
            <th align=CENTER nowrap >Market <br>
              Price</th>
            <th align=CENTER nowrap >Purchase<br>
              Price </th>
            <th align=CENTER nowrap >Pledge</th>
            <th align=CENTER nowrap >Last <br>
              Purchase<br>
              Date </th>
          </tr>
        </table>

     <div id="dataDiv1" class="scbarcolor" >
    <table id="dataTable" > 
		<%
                EIE003202Help.initRow();
				int k=1;
                while (EIE003202Help.getNextRow()) {
                 
                  out.println(EIE003202Help.getRecord());
                  k++;   
                }
              %> 
    </table>
          
        </div>
    
</Table>
  <br>
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
