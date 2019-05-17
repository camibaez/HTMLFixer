<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>

<html>
<head>
<title>Trade Tickets</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">

<jsp:useBean id="invTrade" class="datapro.eibs.beans.EIE012001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />


<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language = "javascript">
function doPrint(){
	if(!window.print){
       var msg ="This browser doesn't allow print";
	   alert(msg);
	   return;}
	
    window.focus();
	window.print();

	return;
}
</SCRIPT>

</head>

<body>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEWD0309">
  <h3 align="center"> Trade Ticket Confirmation <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="inv_trade_tickets_confirm.jsp,EIE0120">
    <input type="hidden" name="SCREEN"  value="3" ></h3>
<hr size="4">
  <table class="tableinfo">
    <tr> 
      <td> 
        <div align="center">The operation has been finished sucesfully</div>
      </td>
    </tr>
  </table>
  <h4> 
    <h4>Basic Information </h4>
  </h4>
  <table border="0">
    <tr> 
      <td> 
        <div align="right">Order Number :</div>
      </td>
      <td> 
        <div align="left"> 
          <input type="text" readonly  name="E01ORDNUM" size="9" maxlength="5" value="<%= invTrade.getE01ORDNUM()%>" >
        </div>
      </td>
    </tr>
  </table>
  <br>
  <table  class="tableinfo" width="715">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right"><a href="javascript:showCustomerInq(document.forms[0].E01ORDCUN.value)"> 
                Customer </a>:</div>
            </td>
            <td nowrap colspan="3" > 
              <input type="text" readonly  name="E01ORDCUN" size="9" maxlength="9" value="<%= invTrade.getE01ORDCUN().trim()%>">
              <input type="text" readonly  name="E01ORDCTN" size="35" maxlength="35" value="<%= invTrade.getE01ORDCTN().trim()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Portfolio :</div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" readonly  name="E01ORDPRF" size="9" maxlength="9" value="<%= invTrade.getE01ORDPRF()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right"><a href="javascript:showRetAccountInq(document.forms[0].E01ORDHAC.value)"> 
                Cash Account: </a></div>
            </td>
            <td nowrap colspan="3" > 
              <input type="text" readonly  name="E01ORDHCY" size="3" maxlength="3" value="<%= invTrade.getE01ORDHCY()%>"
                >
              <input type="text" readonly  name="E01ORDHAC" size="12" maxlength="9" value="<%= invTrade.getE01ORDHAC()%>"
                >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Available Balance :</div>
            </td>
            <td nowrap colspan="3" > 
              <input type="text" readonly  name="E01MEMBAL" size="17" maxlength="16" value="<%= invTrade.getE01MEMBAL()%>"
				onKeyPress="enterDecimal()" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Exchange Rate : </div>
            </td>
            <td nowrap colspan="3" > 
              <input type="text" readonly  name="E01ORDEXR" size="11" maxlength="11" value="<%= invTrade.getE01ORDEXR()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Balance in Inst. Currency :</div>
            </td>
            <td nowrap colspan="3" > 
              <input type="text" readonly  name="E01CNVBAL" size="17" maxlength="16" value="<%= invTrade.getE01CNVBAL()%>"
				onKeyPress="enterDecimal()" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Tax and Withholding :</div>
            </td>
            <td nowrap colspan="3" >
              <input type="text" readonly name="E01ORDWHF" size="30" maxlength="30" 
				  value="<% if (invTrade.getE01ORDWHF().equals("1")) out.print("Withholding Deduction");
							else if (invTrade.getE01ORDWHF().equals("2")) out.print("Sales Tax");
							else if (invTrade.getE01ORDWHF().equals("3")) out.print("Both (Withholding & Taxes)");
							else if (invTrade.getE01ORDWHF().equals("4")) out.print("Taxes in Commissions");
							else if (invTrade.getE01ORDWHF().equals("5")) out.print("Taxes in Interest");
							else if (invTrade.getE01ORDWHF().equals("N")) out.print("None");
							else out.print("");%>" 
				>
            </td>
          </tr>
          
        </table>
      </td>
    </tr>
  </table>
  <h4>Instrument Information </h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Product Type :</div>
            </td>
            <td nowrap width="36%" > 
              <select disabled  name="E01ORDPTY">
                <option value="BND" <%if (invTrade.getE01ORDPTY().equals("BND")) { out.print("selected"); }%>>Bonds</option>
                <option value="EQT" <%if (invTrade.getE01ORDPTY().equals("EQT")) {  out.print("selected"); }%>>Equity</option>
                <option value="MUT" <%if (invTrade.getE01ORDPTY().equals("MUT")) {  out.print("selected"); }%>>Mutual 
                Funds</option>
                <option value="PFS" <%if (invTrade.getE01ORDPTY().equals("PFS")) {  out.print("selected"); }%>>Preferred 
                Stocks</option>
                <option value="ACD" <%if (invTrade.getE01ORDPTY().equals("ACD")) {  out.print("selected"); }%>>Commodities</option>
              </select>
            </td>
            <td nowrap colspan="2" >&nbsp;</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right"><a href="javascript:showInstrumentInq(document.forms[0].E01ORDIIC.value)"> 
                Instrument </a> :</div>
            </td>
            <td nowrap colspan="3" > 
              <input type="text" readonly  name="E01ORDIIC" size="9" maxlength="9" value="<%= invTrade.getE01ORDIIC()%>" >
              <input type="text" readonly  name="E01ORDICN" size="35" maxlength="30" value="<%= invTrade.getE01ORDICN()%>">
              <div align="right"></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Instrument Currency :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" readonly  name="E01ORDSCY" size="4" maxlength="3" value="<%= invTrade.getE01ORDSCY()%>">
            </td>
            <td nowrap width="14%" > 
              <div align="right">ISIN : </div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" readonly  name="E01ORDISI" size="16" maxlength="12" value="<%= invTrade.getE01ORDISI()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Last Interest Paid Date :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" readonly  name="E01ORDLP1" size="3" maxlength="2" value="<%= invTrade.getE01ORDLP1()%>" >
              <input type="text" readonly  name="E01ORDLP2" size="3" maxlength="2" value="<%= invTrade.getE01ORDLP2()%>" >
              <input type="text" readonly  name="E01ORDLP3" size="3" maxlength="2" value="<%= invTrade.getE01ORDLP3()%>" >
            </td>
            <td nowrap width="14%" ><div align="right"><a href="javascript:GetSymbolInfo(document.forms[0].E01ORDSYM.value)">:</a>CUSIP :</div>
            </td>
            <td nowrap width="33%" >
            <INPUT type="text" readonly name="E01ORDCSP" size="16"
					maxlength="12" value="<%= invTrade.getE01ORDCSP()%>"></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Accrual Type :</div>
            </td>
            <td nowrap width="36%" > 
              <select disabled   name="E01ORDATY">
                <option value="1" <%if (invTrade.getE01ORDATY().equals("1")) { out.print("selected"); }%>>Actual/Actual</option>
                <option value="2" <%if (invTrade.getE01ORDATY().equals("2")) {  out.print("selected"); }%>>Actual/365</option>
                <option value="3" <%if (invTrade.getE01ORDATY().equals("3")) {  out.print("selected"); }%>>Actual/365(366 
                Leap Year)</option>
                <option value="4" <%if (invTrade.getE01ORDATY().equals("4")) {  out.print("selected"); }%>>Actual/360</option>
                <option value="5" <%if (invTrade.getE01ORDATY().equals("5")) {  out.print("selected"); }%>>30/360</option>
                <option value="6" <%if (invTrade.getE01ORDATY().equals("6")) {  out.print("selected"); }%>>30E/360</option>
                <option value="7" <%if (invTrade.getE01ORDATY().equals("7")) {  out.print("selected"); }%>>22/252</option>
              </select>
            </td>
            <td nowrap width="14%" > 
              <div align="right">Interest Rate :</div>
            </td>
            <td nowrap width="33%" >
            	<input type="text" name="E01ORDRTE" size="10" maxlength="9" value="<%= invTrade.getE01ORDRTE()%>"readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Order Information </h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="29%" > 
              <div align="right">Minimum Sale Price :</div>
            </td>
            <td nowrap width="71%" > 
              <input type="text" readonly  name="E01ORDMIP" size="17" maxlength="15" value="<%= invTrade.getE01ORDMIP()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%" > 
              <div align="right">Maximum Purchase Price :</div>
            </td>
            <td nowrap width="71%"> 
              <input type="text" readonly  name="E01ORDMXP" size="17" maxlength="15" value="<%= invTrade.getE01ORDMXP()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="29%"> 
              <div align="right"> Order Notes :</div>
            </td>
            <td nowrap width="71%" > 
              <input type="text" readonly  name="E01ORDCO1" size="40" maxlength="35" value="<%= invTrade.getE01ORDCO1()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="71%"> 
              <div align="right"></div>
              <div align="left"> 
                <input type="text" readonly  name="E01ORDCO2" size="40" maxlength="35" value="<%= invTrade.getE01ORDCO2()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="29%"> 
              <div align="right"> </div>
            </td>
            <td nowrap width="71%"> 
              <input type="text" readonly  name="E01ORDCO3" size="40" maxlength="35" value="<%= invTrade.getE01ORDCO3()%>" >
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
            <td nowrap width="17%" > 
              <div align="right">Transaction Type :</div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <select disabled  name="E01ORDTRN">
                  <option value="1" <%if (invTrade.getE01ORDTRN().equals("1")) { out.print("selected"); }%>>Purchase</option>
                  <option value="5" <%if (invTrade.getE01ORDTRN().equals("5")) {  out.print("selected"); }%>>Multiple 
                  Purchase</option>
                  <option value="2" <%if (invTrade.getE01ORDTRN().equals("2")) {  out.print("selected"); }%>>Sale</option>
                  <option value="6" <%if (invTrade.getE01ORDTRN().equals("6")) {  out.print("selected"); }%>>Multiple 
                  Sale</option>
                  <option value="3" <%if (invTrade.getE01ORDTRN().equals("3")) {  out.print("selected"); }%>>Transfer 
                  In</option>
                  <option value="4" <%if (invTrade.getE01ORDTRN().equals("4")) {  out.print("selected"); }%>>Transfer 
                  Out</option>
                </select>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Trade Date :</div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" readonly  name="E01ORDIN1" size="3" maxlength="2" value="<%= invTrade.getE01ORDIN1()%>">
                <input type="text" readonly  name="E01ORDIN2" size="3" maxlength="2" value="<%= invTrade.getE01ORDIN2()%>">
                <input type="text" readonly  name="E01ORDIN3" size="3" maxlength="2" value="<%= invTrade.getE01ORDIN3()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Settlement Date : </div>
            </td>
            <td nowrap colspan="3" > 
              <input type="text" readonly  name="E01ORDST1" size="3" maxlength="2" value="<%= invTrade.getE01ORDST1()%>">
              <input type="text" readonly  name="E01ORDST2" size="3" maxlength="2" value="<%= invTrade.getE01ORDST2()%>">
              <input type="text" readonly  name="E01ORDST3" size="3" maxlength="2" value="<%= invTrade.getE01ORDST3()%>">
            </td>
          </tr>
                    <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Delivery Date : </div>
            </td>
            <td nowrap colspan="3" > 
              <input type="text" readonly  name="E01ORDF15A" size="3" maxlength="2" value="<%= invTrade.getE01ORDF15A()%>">
              <input type="text" readonly  name="E01ORDF15B" size="3" maxlength="2" value="<%= invTrade.getE01ORDF15B()%>">
              <input type="text" readonly  name="E01ORDF15C" size="3" maxlength="2" value="<%= invTrade.getE01ORDF15C()%>">
            </td>
          </tr>
          
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Nominal Value :</div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" readonly  name="E01ORDVNO" size="17" maxlength="16" value="<%= invTrade.getE01ORDVNO()%>">
              Pool Factor : <INPUT type="text" readonly name="E01ORDFL7" size="17"
					maxlength="16" value="<%= invTrade.getE01ORDFL7()%>"></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Quantity : </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" readonly  name="E01ORDQTY" size="17" maxlength="16" value="<%= invTrade.getE01ORDQTY()%>">
              of <%= invTrade.getD01MEASUR()%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Bank Price :</div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" readonly  name="E01ORDPRB" size="17" maxlength="15" value="<%= invTrade.getE01ORDPRB()%>" onKeyPress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Customer Price :</div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" readonly  name="E01ORDPRC" size="17" maxlength="15" value="<%= invTrade.getE01ORDPRC()%>" onKeyPress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Accrued Interest :</div>
            </td>
            <td nowrap width="36%" > 
              <div align="left"> 
                <input type="text" readonly  name="E01ORDIAL" size="17" maxlength="15" value="<%= invTrade.getE01ORDIAL()%>" onKeyPress="enterDecimal()">
              </div>
            </td>
            <td nowrap width="14%" > 
              <div align="right">Accrued Days :</div>
            </td>
            <td nowrap width="33%" > 
              <div align="left"> 
                <input type="text" readonly  name="E01ORDDYS" size="4" maxlength="3" value="<%= invTrade.getE01ORDDYS()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap colspan="4" ><b>Commissions</b></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Trade Commissions :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" readonly  name="E01ORDOCV" size="17" maxlength="15" value="<%= invTrade.getE01ORDOCV()%>" onKeyPress="enterDecimal()">
            </td>
            <td nowrap width="14%" > 
              <div align="right">Trade Comm. Table :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" readonly  name="E01ORDOCT" size="4" maxlength="2" value="<%= invTrade.getE01ORDOCT()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Profit Commissions :</div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" readonly  name="E01ORDTGV" size="17" maxlength="15" value="<%= invTrade.getE01ORDTGV()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="17%" > 
              <div align="right">Custody Fee :</div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E01ORDFL9" size="17" maxlength="15" value="<%= invTrade.getE01ORDFL9()%>" readonly>
              </div>
            </td>          
          </tr> 
          <tr id="trdark"> 

            <td nowrap colspan="4" > 
              <div align="left"><b>Withholding Information</b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right"> Tax Withholding :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" readonly name="E01ORDWH1" size="17" maxlength="15" value="<%= invTrade.getE01ORDWH1()%>" onKeyPress="enterDecimal()"></td>
            <td nowrap width="14%" > 
              <div align="right">Tax Rate :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" readonly name="E01ORDFL8" size="10" maxlength="9" value="<%= invTrade.getE01ORDFL8()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right"> </div>
            </td>
            <td nowrap width="36%" > 
            <td nowrap width="14%" > 
              <div align="right">Exemption Code :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" readonly name="E01ORDF6C" size="6" maxlength="6" value="<%= invTrade.getE01ORDF6C()%>">
              <input type="text" readonly name="D01EXMPDS" size="30" maxlength="30" value="<%= invTrade.getD01EXMPDS()%>">
            </td>
          </tr>         
          <tr id="trclear"> 
            <td nowrap colspan="4" > 
              <div align="left"><b>Totals</b></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Bank Transaction Amount :</div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" readonly  name="E01ORDTBK" size="17" maxlength="15" value="<%= invTrade.getE01ORDTBK()%>" onKeyPress="enterDecimal()" >
                <a href="javascript:Calculate()"> </a></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Customer Transaction Amount :</div>
            </td>
            <td nowrap colspan="3" > 
              <input type="text" readonly  name="E01ORDTVL" size="17" maxlength="15" value="<%= invTrade.getE01ORDTVL()%>" onKeyPress="enterDecimal()" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap colspan="4" > 
              <div align="left"><b>Balance on Settlement Date</b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right"> <a href="javascript:showInvHolds(document.forms[0].E01ORDCUN.value,document.forms[0].E01ORDHAC.value,document.forms[0].E01ORDST1.value
												,document.forms[0].E01ORDST2.value,document.forms[0].E01ORDST3.value)"> 
                Balance in <%= invTrade.getE01ORDHCY()%> : </a> </div>
            </td>
            <td nowrap colspan="3" > 
              <input type="text" readonly  name="E01FUTBAL" size="17" maxlength="15" value="<%= invTrade.getE01FUTBAL()%>" onKeyPress="enterDecimal()" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Balance in <%= invTrade.getE01ORDSCY()%> :</div>
            </td>
            <td nowrap colspan="3" > 
              <input type="text" readonly  name="E01CNVFUB" size="17" maxlength="15" value="<%= invTrade.getE01CNVFUB()%>" onKeyPress="enterDecimal()" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap colspan="4" >&nbsp;</td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Trade Ticket Notes :</div>
            </td>
            <td nowrap colspan="3" > 
              <input type="text" readonly  name="E01ORDTC1" size="35" maxlength="30" value="<%= invTrade.getE01ORDTC1()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" >&nbsp;</td>
            <td nowrap colspan="3" > 
              <input type="text" readonly  name="E01ORDTC2" size="35" maxlength="30" value="<%= invTrade.getE01ORDTC2()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" >&nbsp;</td>
            <td nowrap colspan="3" > 
              <input type="text" readonly  name="E01ORDTC3" size="35" maxlength="30" value="<%= invTrade.getE01ORDTC3()%>" >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Broker / Custodian Information </h4>
  <table  class="tableinfo" width="715">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="20%" > 
              <div align="right">Broker :</div>
            </td>
            <td nowrap width="80%" > 
              <div align="left"> 
                <input type="text" readonly  name="E01ORDBRK" size="5" maxlength="3" value="<%= invTrade.getE01ORDBRK()%>" >
                <input type="text" readonly  name="E01ORDBKN" size="35" maxlength="30" value="<%= invTrade.getE01ORDBKN()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" > 
              <div align="right">Custodian :</div>
            </td>
            <td nowrap width="80%" > 
              <div align="left"></div>
              <div align="right"></div>
              <div align="left"> 
                <input type="text" readonly  name="E01ORDCUC" size="5" maxlength="3" value="<%= invTrade.getE01ORDCUC()%>" >
                <input type="text" readonly  name="E01ORDCCN" size="35" maxlength="30" value="<%= invTrade.getE01ORDCCN()%>">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="33%">&nbsp;</td>
      <td width="33%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="33%"> 
        <div align="center"> 
          <input id="EIBSBTN" type=button name="Submit" value="Print" onClick="doPrint()">
        </div>
      </td>
      <td width="33%"> 
        <div align="center"> 
          <input id="EIBSBTN" type=submit name="Submit2" value="Continue">
        </div>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td> 
        <div align="center"> </div>
      </td>
      <td>&nbsp;</td>
    </tr>
  </table>
  </form>
</body>
</html>
