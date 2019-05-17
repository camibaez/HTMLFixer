<html>
<head>
<title></title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EIE003002Help" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

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

function getParams(code,idxRow) {
    document.forms[0].CODE.value = code;
    tbAddInfo.rows[0].cells[1].innerHTML=document.forms[0]["TXTDATA"+idxRow].value;
    for ( var i=0; i<dataTable.rows.length; i++ ) {
       dataTable.rows[i].className="trnormal";
    }
    dataTable.rows[idxRow].className="trhighlight";
    adjustEquTables(headTable, dataTable, dataDiv1,1,false);
}

function cancelBub(){
  event.cancelBubble = true;
}



</SCRIPT>

</head>

<BODY>
<h3 align="center">Customer Open Position <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="sel_portfolio.jsp, EIE0300"></h3>
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
              <div align="right"><a href="javascript:showCustomerInq(document.forms[0].CUSTOMER.value)"><img src="<%=request.getContextPath()%>/images/aquire.gif" alt="Help" border="0" >
                Customer :</a></div>
            </td>
            <td nowrap width="27%" >
              <div align="left">
                <input type="text" name="CUSTOMER" size="9" maxlength="9" readonly value="<%= userPO.getCusNum()%>">
              </div>
            </td>
            <td nowrap width="14%" >
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap width="38%" >
              <div align="left">
                <input type="text" name="NAME" size="45" maxlength="45" readonly value="<%= userPO.getCusName()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="21%">
              <div align="right"><a href="javascript:showPortfolioInq(document.forms[0].CUSTOMER.value,document.forms[0].PORTFOLIO.value)"><img src="<%=request.getContextPath()%>/images/aquire.gif" alt="Help" border="0" >
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
  <p>


  <TABLE  id="mainTable" class="tableinfo">
 <TR >
    <TD NOWRAP valign="top" width="100%" >
  		<TABLE id="headTable" >
          <tr id="trdark">
            <th align=CENTER nowrap >&nbsp;</th>
            <th align=CENTER nowrap >Instrument</th>
            <th align=CENTER nowrap >Inst.<br>
              CCY</th>
            <th align=CENTER nowrap >Nominal <br>
              Value</th>
            <th align=CENTER nowrap >Quantity</th>
            <th align=CENTER nowrap >Market<br>Price</th>
          </tr>
        </table>

     <div id="dataDiv1" class="scbarcolor" >
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
	 </TD>
   <TD nowrap ALIGN="RIGHT" valign="top">
      <Table id="tbAddInfoH"   width="100%" >
        <tr id="trdark">
         <TH ALIGN=CENTER nowrap >Basic Information </TH>
        </tr>
      </Table>

     <Table id="tbAddInfo"  >
      <tr id="trclear" >
            <TD  ALIGN="RIGHT"  valign ="top" nowrap ><b>
			  Purchase Price : <br>
              Inv. Amount : <br>
              Accrued Int. Pur.: <br>
			  Purchase Amount : <br>
			  Last Purchase Date : <br><br>

              Principal Market Value : <br>
              Today Accrued Int.: <br>
              Inv. Market Value : <br>
			  Accrued Days : <br><br>

			  Income : <br>
			  Yield : <br>
			  Exchange Rate : <br><br>
			  Coupon Pmnt. Frec. : <br><br>
			  Pledge :
         </b>
         </TD>
         <TD ALIGN="LEFT"  nowrap class="tdaddinfo"></TD>
      </tr>
     </Table>
  </TD>
  </TR>
</Table>


  <SCRIPT language="JavaScript">
     document.forms[0].totalRow.value="<%= k %>";
     function resizeDoc() {
       divResize(true);
       adjustEquTables(headTable, dataTable, dataDiv1,1,false);
     }
	 showChecked("PORTF");
     resizeDoc();
     tbAddInfoH.rows[0].cells[0].height = headTable.rows[0].cells[0].clientHeight;
     window.onresize=resizeDoc;

    </SCRIPT>
  <%}%>
</form>

</body>
</html>
