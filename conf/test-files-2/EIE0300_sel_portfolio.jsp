<html>
<head>
<title></title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EIE003001Help" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<script language="JavaScript">


function goAction() {

	document.forms[0].SCREEN.value=3;
	
	document.forms[0].submit();
  
}


function getParams(customer,portfolio,currency) {

    document.forms[0].CUSTOMER.value = customer;
    document.forms[0].PORTFOLIO.value = portfolio;
	document.forms[0].CURRENCY.value = currency;
    

}

function cancelBub(){
  event.cancelBubble = true;
}

	builtNewMenu(ecif10_i_opt);
	window.onload = function() {initMenu(); MoveMenu();}

</SCRIPT>  
</head>

<BODY>
<h3 align="center">Customer Open Position <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="sel_portfolio.jsp, EIE0300"></h3>
<hr size="4">

<FORM  METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0300" >  
  <p> 
    <input type=HIDDEN name="SCREEN" value="3">
    <input type=HIDDEN name="opt" value="1">
    <input type=HIDDEN name="totalRow" value="0">
    <input type=HIDDEN name="PORTFOLIO">
    <input type=HIDDEN name="CURRENCY">
    <input type=HIDDEN name="CODE">
  </p>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Portfolio :</div>
            </td>
            <td nowrap colspan="5" > 
              <div align="left">
                <input type=HIDDEN name="CUSTOMER" value="<%= userPO.getCusNum()%>">
                <%= userPO.getCusNum()%> - <%= userPO.getCusName()%></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p><%
	if ( EIE003001Help.getNoResult() ) {
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
      <td class=TDBKG width="33%"> 
        <div align="center"><a href="javascript:showOpenInq(document.forms[0].CUSTOMER.value,document.forms[0].PORTFOLIO.value,document.forms[0].CURRENCY.value)"><b>Open Inquiry</b></a></div>
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
              <div align="center">Portfolio</div>
            </th>
            <th align=CENTER nowrap >Type</th>
            <th align=CENTER nowrap > Currency</th>
            <th align=CENTER nowrap >Market <br>
              Value</th>
            <th align=CENTER nowrap >Book<br>
              Value </th>
             <th align=CENTER nowrap >Int/Div <br>
              Paid <BR>LTD
				</th>
            <th align=CENTER nowrap >Int/Div<br>Paid in <%= userPO.getHeader7()%>*<BR>LTD
				</th>  
            <th align=CENTER nowrap >Market <br>Value in <%= userPO.getHeader7()%>* </th>
            <th align=CENTER nowrap >Book <br>Value in <%= userPO.getHeader7()%>* </th>
           
          </tr>
        </table>

     <div id="dataDiv1" class="scbarcolor" >
    <table id="dataTable" > 
		<%
                EIE003001Help.initRow();
				int k=1;
                while (EIE003001Help.getNextRow()) {
                 
                  out.println(EIE003001Help.getRecord());
                  k++;   
                }
        %> 
    </table>
          <table width="100%" >
            <tr id="trdark">
				<TD nowrap width="78%" align="right"><B>Total Discretionary :</B></TD>
				<td nowrap  width="11%" > 
                <div align="right"><%= userPO.getHeader1()%></div>
              </td>
              <td nowrap width="13%" > 
                <div align="right"><%= userPO.getHeader4()%></div>
              </td>
			</tr>
            <tr id="trclear">
				<TD nowrap width="78%" align="right"><B>Total Non Discretionary :</B></TD>
				<td nowrap width="11%"> 
                <div align="right"><%= userPO.getHeader2()%></div>
              </td>
              <td nowrap width="13%" > 
                <div align="right"><%= userPO.getHeader5()%></div>
              </td>
			</tr>
            <tr id="trdark">
				<TD nowrap width="78%" align="right"><B>Total Position :</B></TD>
				<td nowrap width="11%"> 
                <div align="right"><%= userPO.getHeader3()%></div>
              </td>
              <td nowrap width="13%"> 
                <div align="right"><%= userPO.getHeader6()%></div>
              </td>
			</tr>
            <tr id="trclear">
				<td nowrap colspan="3">*Bank base currency</td>
				<TD nowrap></TD>
				<TD nowrap></TD>
			</tr>
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
