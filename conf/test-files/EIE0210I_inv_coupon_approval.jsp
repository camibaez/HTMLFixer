<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Payments</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">



<jsp:useBean id="invTrade" class="datapro.eibs.beans.EIE021001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT> 
 <script src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"></script>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>


</head>
<body nowrap>
<%
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }


%>
<div align="center">
  <h3>Coupon Payment Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="inv_coupon_approval.jsp,EIE210I">
  </h3>
</div>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0210" >
  <h4>
    <input type="hidden" name="SCREEN"  value="2" >
    Basic Information </h4>
  <table  class="tableinfo">
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="17%" >
              <div align="right"><a href="javascript:showInstrumentInq(document.forms[0].E01CPNIIC.value)"><img src="<%=request.getContextPath()%>/images/aquire.gif" alt="Help" border="0" >
                Instrument </a> :</div>
            </td>
            <td nowrap width="36%" >
              <input type="hidden" name="E01CPNIIC"  value="<%= invTrade.getE01CPNIIC()%>" >
              <%= invTrade.getE01CPNIIC()%> - <%= invTrade.getD01ISIDSC()%> </td>
            <td nowrap width="36%" >
              <div align="right">Coupon Status :</div>
            </td>
            <td nowrap width="36%" >
              <div align="left"><%= invTrade.getD01STSDSC()%></div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="17%" >
              <div align="right">Instrument Currency :</div>
            </td>
            <td nowrap width="36%" ><%= invTrade.getD01ISICCY()%> </td>
            <td nowrap width="36%" >&nbsp;</td>
            <td nowrap width="36%" >&nbsp;</td>
          </tr>
          <tr id="trdark">
            <td nowrap width="17%" >
              <div align="right">ISIN :</div>
            </td>
            <td nowrap width="36%" ><%= invTrade.getD01ISINUM()%> </td>
            <td nowrap width="36%" >&nbsp;</td>
            <td nowrap width="36%" >&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Custodian Information </h4>
  <table  class="tableinfo">
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap  >
              <div align="right">Custodian :</div>
            </td>
            <td nowrap colspan="7" >
              <input type="text" readonly  name="D01CSTCOD" size="5" maxlength="3" value="<%= invTrade.getD01CSTCOD()%>" >
              <input type="text" readonly  name="D01CSTNME" size="35" maxlength="30" value="<%= invTrade.getD01CSTNME()%>" >
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap  >&nbsp;</td>
            <td nowrap  >
              <div align="center">Payment Type</div>
            </td>
            <td nowrap  >
              <div align="center">Bnk</div>
            </td>
            <td nowrap  >
              <div align="center">Br</div>
            </td>
            <td nowrap >
              <div align="center">CCY</div>
            </td>
            <td nowrap  >
              <div align="center">G/L </div>
            </td>
            <td nowrap  >
              <div align="center">Account</div>
            </td>
            <td nowrap  >
              <div align="center">C.C.</div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap  >
              <div align="right">Payment Account :</div>
            </td>
            <td nowrap  >
              <div align="center">
                <select disabled  name="E01CPNCPT">
                  <option value="" <%if (invTrade.getE01CPNCPT().equals("")) { out.print("selected"); }%>>Select
                  One</option>
                  <option value="1" <%if (invTrade.getE01CPNCPT().equals("1")) { out.print("selected"); }%>>Retail
                  Account</option>
                  <option value="2" <%if (invTrade.getE01CPNCPT().equals("2")) {  out.print("selected"); }%>>Official
                  Check</option>
                  <option value="3" <%if (invTrade.getE01CPNCPT().equals("3")) { out.print("selected"); }%>>G/L
                  Account</option>
                  <option value="4" <%if (invTrade.getE01CPNCPT().equals("4")) {  out.print("selected"); }%>>Fed
                  Transfer</option>
                  <option value="5" <%if (invTrade.getE01CPNCPT().equals("5")) { out.print("selected"); }%>>Telex
                  Transfer</option>
                  <option value="6" <%if (invTrade.getE01CPNCPT().equals("6")) {  out.print("selected"); }%>>Swift
                  Format MT-100</option>
                  <option value="7" <%if (invTrade.getE01CPNCPT().equals("7")) { out.print("selected"); }%>>Swift
                  Format MT-200</option>
                  <option value="8" <%if (invTrade.getE01CPNCPT().equals("8")) {  out.print("selected"); }%>>Swift
                  Format MT-202</option>
                </select>
              </div>
            </td>
            <td nowrap  >
              <div align="center">
                <input type="text" readonly  name="E01CPNCBK" size="2" maxlength="2" value="<%= invTrade.getE01CPNCBK()%>">
              </div>
            </td>
            <td nowrap  >
              <div align="center">
                <input type="text" readonly  name="E01CPNCBR" size="3" maxlength="3" value="<%= invTrade.getE01CPNCBR()%>"
                oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E01CPNCBK.value,'','','','')">
              </div>
            </td>
            <td nowrap  >
              <div align="center">
                <input type="text" readonly  name="E01CPNCCY" size="3" maxlength="3" value="<%= invTrade.getE01CPNCCY()%>"
                oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E01CPNCBK.value,'','','','')">
              </div>
            </td>
            <td nowrap  >
              <div align="center">
                <input type="text" readonly  name="E01CPNCGL" size="15" maxlength="13" value="<%= invTrade.getE01CPNCGL()%>"
				oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01CPNCBK.value,document.forms[0].E01CPNCCY.value,'','','')"  >
              </div>
            </td>
            <td nowrap  >
              <div align="center">
                <input type="text" readonly  name="E01CPNCAC" size="12" maxlength="9" value="<%= invTrade.getE01CPNCAC()%>"
                oncontextmenu="showPopUp(accountHelp,this.name,document.forms[0].E01CPNCBK.value,'','','','RT')" >
              </div>
            </td>
            <td nowrap  >
              <div align="center">
                <input type="text" readonly  name="E01CPNCCC" size="12" maxlength="9" value="<%= invTrade.getE01CPNCCC()%>"
                oncontextmenu="showPopUp(costcenterHelp,this.name,document.forms[0].E01CPNCBK.value,'','','','')" >
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Customer Information </h4>
  <table  class="tableinfo">
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap  >
              <div align="right">Customer :</div>
            </td>
            <td nowrap colspan="7" ><%= invTrade.getD01CUSNME().trim()%> </td>
          </tr>
          <tr id="trclear">
            <td nowrap  >
              <div align="right"></div>
            </td>
            <td nowrap  >
              <div align="center">Payment Type</div>
            </td>
            <td nowrap  >
              <div align="center">Bnk</div>
            </td>
            <td nowrap  >
              <div align="center">Brn</div>
            </td>
            <td nowrap  >
              <div align="center">CCY</div>
            </td>
            <td nowrap  >
              <div align="center">G/L</div>
            </td>
            <td nowrap  >
              <div align="center">Account</div>
            </td>
            <td nowrap  >
              <div align="center">C.C.</div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap  >
              <div align="right">Payment Account :</div>
            </td>
            <td nowrap  >
              <div align="center">Retail Account </div>
            </td>
            <td nowrap  >
              <div align="center">
                <input type="text" readonly  name="D01ORDIBK" size="2" maxlength="2" value="<%= invTrade.getD01ORDIBK()%>">
              </div>
            </td>
            <td nowrap >
              <div align="center">
                <input type="text" readonly  name="D01ORDIBR" size="3" maxlength="3" value="<%= invTrade.getD01ORDIBR()%>"
                oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].D01ORDIBK.value,'','','','')">
              </div>
            </td>
            <td nowrap  >
              <div align="center">
                <input type="text" readonly  name="D01ORDICY" size="3" maxlength="3" value="<%= invTrade.getD01ORDICY()%>"
                oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].D01ORDIBK.value,'','','','')">
              </div>
            </td>
            <td nowrap  >
              <div align="center">
                <input type="text" readonly  name="D01ORDIGL" size="15" maxlength="13" value="<%= invTrade.getD01ORDIGL()%>"
				oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].D01ORDIBK.value,document.forms[0].D01ORDICY.value,'','','')"  >
              </div>
            </td>
            <td nowrap  >
              <div align="center">
                <input type="text" readonly  name="D01ORDIAC" size="12" maxlength="9" value="<%= invTrade.getD01ORDIAC()%>"
                oncontextmenu="showPopUp(accountHelp,this.name,document.forms[0].D01ORDIBK.value,'','','','RT')" >
              </div>
            </td>
            <td nowrap  >
              <div align="center">
                <input type="text" readonly  name="D01ORDICC" size="12" maxlength="9" value="<%= invTrade.getD01ORDICC()%>"
                oncontextmenu="showPopUp(costcenterHelp,this.name,document.forms[0].D01ORDIBK.value,'','','','')" >
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Transaction Information </h4>
  <table  class="tableinfo">
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap >
              <div align="right">Payment Type :</div>
            </td>
            <td nowrap >
              <div align="left"><%= invTrade.getD01PMTDSC()%> </div>
            </td>
            <td nowrap >
              <div align="right"></div>
            </td>
            <td nowrap >
              <div align="left">
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right">Projected Amount : </div>
            </td>
            <td nowrap >
              <div align="left"><%= Util.fcolorCCY(invTrade.getE01CPNAMT())%>
              </div>
            </td>
            <td nowrap >
              <div align="right">Calculation Date :</div>
            </td>
            <td nowrap >
              <div align="left">
                <input type="text" name="E01CPNPM1" size="3" maxlength="2" value="<%= invTrade.getE01CPNPM1()%>" readonly>
                <input type="text" name="E01CPNPM2" size="3" maxlength="2" value="<%= invTrade.getE01CPNPM2()%>" readonly>
                <input type="text" name="E01CPNPM3" size="3" maxlength="2" value="<%= invTrade.getE01CPNPM3()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap >
              <div align="right">Delivered Amount :</div>
            </td>
            <td nowrap>
              <input type="text" readonly name="E01CPNDAM" size="17" maxlength="15" value="<%= invTrade.getE01CPNDAM()%>" onKeyPress="enterDecimal()">
              <input type="hidden" name="D01ISIPTY"  value="<%= invTrade.getD01ISIPTY()%>" >
            </td>
            <td nowrap >
              <div align="right"> Execution Date :</div>
            </td>
            <td nowrap >
              <div align="left">
                <input type="text" readonly name="E01CPNDL1" size="3" maxlength="2" value="<%= invTrade.getE01CPNDL1()%>">
                <input type="text" readonly name="E01CPNDL2" size="3" maxlength="2" value="<%= invTrade.getE01CPNDL2()%>">
                <input type="text" readonly name="E01CPNDL3" size="3" maxlength="2" value="<%= invTrade.getE01CPNDL3()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap colspan="4" ><b>Commisions</b></td>
          </tr>
          <tr id="trdark">
            <td nowrap >
              <div align="right">Commission :</div>
            </td>
            <td nowrap >
              <div align="left">
                <input type="text" readonly name="E01CPNCOM" size="17" maxlength="15" value="<%= invTrade.getE01CPNCOM()%>" onKeyPress="enterDecimal()">
              </div>
            </td>
            <td nowrap >
              <div align="right">Commission Table :</div>
            </td>
            <td nowrap>
              <div align="left">
                <input type="text" readonly name="E01CPNTBL" size="4" maxlength="2" value="<%= invTrade.getE01CPNTBL()%>">
                <a href="javascript:GetCommCustodyTable('E01CPNTBL',document.forms[0].D01ISIPTY.value,'','')"></a>
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap colspan="4" ><b>Withholdings</b></td>
          </tr>
          <tr id="trdark">
            <td nowrap >
              <div align="right">Tax Withholding :</div>
            </td>
            <td nowrap >
              <div align="left">
                <input type="text" readonly name="E01CPNFL8" size="17" maxlength="15" value="<%= invTrade.getE01CPNFL8()%>" onKeyPress="enterDecimal()">
              </div>
            </td>
            <td nowrap >
              <div align="right">Tax Rate:</div>
            </td>
            <td nowrap>
              <div align="left">
              <input type="text" readonly name="E01TAXRTE" size="10" maxlength="8" value="<%= invTrade.getE01TAXRTE()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right"></div>
            </td>
            <td nowrap >
              <div align="left">
              </div>
            </td>
            <td nowrap >
              <div align="right">Exemption Code :</div>
            </td>
            <td nowrap>
              <div align="left">
              <input type="text" readonly name="E01EXEMPT" size="4" maxlength="2" value="<%= invTrade.getE01EXEMPT()%>">
              <input type="text" readonly name="D01EXMPDS" size="32" maxlength="30" value="<%= invTrade.getD01EXMPDS()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap colspan="4" ><b>Totals</b></td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right"> Net Amount :</div>
            </td>
            <td nowrap colspan="3" >
              <input type="text" readonly name="E01CPNPAM" readonly size="17" maxlength="15" value="<%= invTrade.getE01CPNPAM()%>" onKeyPress="enterDecimal()">
              <a href="javascript:Calculate()"></a>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap >
              <div align="right"> Foreign Exchange Rate :</div>
            </td>
            <td nowrap colspan="3" >
              <a href="javascript:Calculate()"></a><INPUT type="text"
					readonly name="E01CPNFL7" size="11" maxlength="9"
					value="<%= invTrade.getE01CPNFL7()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap colspan="4" >&nbsp;</td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right">Remarks :</div>
            </td>
            <td nowrap colspan="3" >
              <input type="text" readonly name="E01CPNRMK" size="35" maxlength="30" value="<%= invTrade.getE01CPNRMK()%>" >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
    <h4>
    <table class="tbenter" width=100% align=center>
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>EXIT</b></a></div>
    </table>
    </h4>
</form>
</body>
</html>
