<html>
<head>
<title></title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EIE003002Help" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<script language="JavaScript">


function goAction() {

	document.forms[0].SCREEN.value = 5;
	document.forms[0].submit();
  
}

function printReport() {

	document.forms[0].SCREEN.value = 15;
	document.forms[0].submit();
  
}

function getParams(code) {    
    document.forms[0].CODE.value = code;
}

function cancelBub(){
  event.cancelBubble = true;
}



</SCRIPT>  

</head>

<BODY>
<h3 align="center">Customer Open Position <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="transactions_inquiry.jsp, EIE0300"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0300" >
  <p> 
    <input type=HIDDEN name="SCREEN" value="3">
    <input type=HIDDEN name="opt" value="1">
    <input type=HIDDEN name="totalRow" value="0">
    <input type=HIDDEN name="CODE">
    <input type=HIDDEN name="TYPEC" value="<%= userPO.getHeader4()%>">
  </p>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="21%" > 
            </td>
            <td nowrap width="27%" > 
              <div align="left"> 
                <input type="hidden" name="CUSTOMER" size="9" maxlength="9" readonly value="<%= userPO.getCusNum()%>">
              </div>
            </td>
            <td nowrap width="14%" > 
            </td>
            <td nowrap width="38%" > 
              <div align="left"> 
                <input type="hidden" name="NAME" size="45" maxlength="45" readonly value="<%= userPO.getCusName()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%"> 
              <div align="right"><a href="javascript:showPortfolioInq(document.forms[0].CUSTOMER.value,document.forms[0].PORTFOLIO.value)"><img src="<%=request.getContextPath()%>/images/aquire.gif" alt="help" align="absbottom" border="0" > 
                Portfolio : </a></div>
            </td>
            <td nowrap colspan="3"> 
              <div align="left"> 
                <input type="text" name="PORTFOLIO" size="12" maxlength="12" value="<%= userPO.getHeader8().trim()%>" readonly>
                <b> 
                <input type="text" name="DESCRIPTION" size="30" maxlength="30" readonly value="<%= userPO.getHeader9().trim()%>">
                </b> </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="21%"> 
              <div align="right"><b>Portfolio Type :</b></div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" name="TYPE" size="30" maxlength="30" value= "<%
				if (userPO.getHeader4().equals("D")) out.print("Discretionary");
				
				else out.print("Non Discretionary");%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%"> 
              <div align="right"><b>Account Officer :</b></div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" name="OFFICER" size="35" maxlength="35" value="<%= userPO.getHeader5().trim()%>" readonly>
            </td>
            <td nowrap width="14%"> 
              <div align="right"><b>Opening Date :</b></div>
            </td>
            <td nowrap width="38%"> 
              <input type="text" name="DATE" size="12" maxlength="12" value="<%= userPO.getHeader6().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap colspan="4"> 
              <div align="center"><font color="#FF0000" size="4"><%= userPO.getHeader20()%></font></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%"> 
              <div align="right"><b>Valuation Currency :</b> </div>
            </td>
            <td nowrap> 
              <input type="text" name="CURRENCY" size="4" maxlength="3" value="<%= userPO.getHeader7().trim()%>" >
              <a href="javascript:GetCurrency('CURRENCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a> 
            </td>
            <td nowrap>
              <div align="right">Total Market Value :</div>
            </td>
            <td nowrap>
              <input type="text" name="E02CURINV" size="12" maxlength="12" value="<%= userPO.getHeader17().trim()%>" readonly>
            </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td nowrap colspan="2"> 
              <div align="center"> 
                <input id="EIBSBTN" type=submit name="Submit" value="Submit">
              </div>
            </td>
            <td nowrap colspan="2"> 
              <div align="center"> 
                <input id="EIBSBTN" type=button name="Submit2" value="Print Report" onClick="printReport()">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p><%
	if ( EIE003002Help.getNoResult() ) {
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
  <table class="tbenter" width=100% align=center>
    <tr> 
      <td class=TDBKG width="50%"> 
        <div align="center"><a href="javascript:showOpenTrans(document.forms[0].CUSTOMER.value,document.forms[0].PORTFOLIO.value,document.forms[0].CURRENCY.value,document.forms[0].CODE.value)"><b> Transactions</b></a></div>
      </td>
      <td class=TDBKG width="50%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
      </td>
    </tr>
  </table>
  <br>
  <table  id="mainTable" class="tableinfo" width="1167">
    <tr > 
      <td NOWRAP valign="top" > 
        <table id="headTable" >
          <tr id="trdark"> 
            <th align=CENTER nowrap  >&nbsp;</th>
            <th align=CENTER nowrap  >Instrument</th>
            <th align=CENTER nowrap  ></th>
            <th align=CENTER nowrap >Inst.<br>
              CCY</th>
            <th align=CENTER nowrap  >Nominal <br>
              Value</th>
            <th align=CENTER nowrap >Quantity</th>
            <th align=CENTER nowrap  >Market<br>
              Price</th>
            <th align=CENTER nowrap  >Principal<br>
              Market Value</th>
            <th align=CENTER nowrap >Today<br>
              Accrued Int.</th>
            <th align=CENTER nowrap >Investment<br>
              Market Value</th>
<% //         <th align=CENTER nowrap  >Investment<br> 
   //           Market Value</th>  %>
            <th align=CENTER nowrap  >Accrued<br>
              Days</th>
            <th align=CENTER nowrap >Custody<br>
              Fee Rate</th>    
            <th align=CENTER nowrap  >Today<br>
              Accrued Cust.Fee</th>  
                          
            <th align=CENTER nowrap bgcolor="#FFFFFF" >Purchase<br>
              Price </th>
            <th align=CENTER nowrap bgcolor="#FFFFFF">Investment<br>
              Amount</th>
            <th align=CENTER nowrap bgcolor="#FFFFFF">Accrued<br>
              Interest Pur.</th>
            <th align=CENTER nowrap bgcolor="#FFFFFF">Purchase<br>
              Amount</th>
            <th align=CENTER nowrap  bgcolor="#FFFFFF">Last Pur.<br>
              Date</th>
            <th align=CENTER nowrap >Income</th>
            <th align=CENTER nowrap  >Yield</th>
            <th align=CENTER nowrap >Exchange<br>
              Rate</th>
             
            <th align=CENTER nowrap >Coupon<br>
              Pmnt. Frec.</th>
            <th align=CENTER nowrap  >Pledge</th>
          </tr>
        </table>
        <div id="dataDiv1"  > 
          <table id="dataTable" >
            <%
                EIE003002Help.initRow();
				int k=1;
                while (EIE003002Help.getNextRow()) {
                 
                  out.println(EIE003002Help.getRecord());
                  k++;   
                }
              %> 
          </table>
        </div>
  </table>
  <p> 
    <SCRIPT language="JavaScript">
     document.forms[0].totalRow.value="<%= k %>";
     function resizeDoc() {
       divResize(false);
     adjustEquTables(headTable, dataTable, dataDiv1,1,false);
      }

     resizeDoc();
    
     window.onresize=resizeDoc;
     
     try {
	     document.forms[0].PORTF[0].click();
	 } catch (e) {
	     document.forms[0].PORTF.click();
	 }
     
     
</SCRIPT>
    <%}%> 
</form>

</body>
</html>