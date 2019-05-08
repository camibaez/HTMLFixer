<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>

<html>
<head>
<title>Orders</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">

<jsp:useBean id="invOrders" class="datapro.eibs.beans.EIE011001Message"  scope="session" />

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
<h3 align="center">Operation Executed </h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEWD0309">
  <input type="hidden" name="SCREEN"  value="1" >
  <table class="tableinfo">
    <tr>
      <td>
        <div align="center">The operation has been finished sucesfully</div>
      </td>
    </tr>
  </table>
  <br>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="26%" > 
              <div align="right">Order Number :</div>
            </td>
            <td nowrap width="15%" > 
              <input type="text" readonly  name="E01ORDNUM" size="9" maxlength="5" value="<%= invOrders.getE01ORDNUM()%>" >
            </td>
            <td nowrap width="26%" > 
              <div align="right">Exchange Rate :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" readonly  name="E01ORDEXR" size="11" maxlength="11" value="<%= invOrders.getE01ORDEXR()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="26%" > 
              <div align="right">Customer :</div>
            </td>
            <td nowrap colspan="3" > 
              <div align="right"></div>
              <div align="left">
                <input type="text" readonly  name="E01ORDCUN" size="9" maxlength="9" value="<%= invOrders.getE01ORDCUN().trim()%>">
                <input type="text" readonly  name="E01ORDCTN" size="30" maxlength="30" value="<%= invOrders.getE01ORDCTN().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="26%" > 
              <div align="right">Cash Account :</div>
            </td>
            <td nowrap width="15%" > <a href="javascript:GetInstrument('E01ORDIIC','E01ORDICN')"> 
              </a> 
              <input type="text" readonly  name="E01ORDHCY" size="3" maxlength="3" value="<%= invOrders.getE01ORDHCY()%>"
                >
              <input type="text" readonly  name="E01ORDHAC" size="12" maxlength="9" value="<%= invOrders.getE01ORDHAC()%>"
                oncontextmenu="showPopUp(accountHelp,this.name,document.forms[0].E01ORDHBK.value,'','','','RT')" >
            </td>
            <td nowrap width="26%" > 
              <div align="right">Portfolio :</div>
            </td>
            <td nowrap width="33%" > <a href="javascript:GetInstrument('E01ORDIIC','E01ORDICN')"> 
              </a> 
              <input type="text" readonly  name="E01ORDPRF" size="9" maxlength="9" value="<%= invOrders.getE01ORDPRF()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="26%" > 
              <div align="right">Balance :</div>
            </td>
            <td nowrap width="15%" > 
              <div align="left"> 
                <input type="text" readonly  name="E01MEMBAL" size="17" maxlength="16" value="<%= invOrders.getE01MEMBAL()%>" >
              </div>
            </td>
            <td nowrap width="26%" > 
              <div align="right">Balance in <%= invOrders.getE01ORDSCY()%> :</div>
            </td>
            <td nowrap width="33%" > 
              <div align="left"> 
                <input type="text" readonly  name="E01CNVBAL" size="17" maxlength="16" value="<%= invOrders.getE01CNVBAL()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="26%" > 
              <div align="right">Instrument : </div>
            </td>
            <td nowrap width="15%" > 
              <div align="left"> 
                <input type="text" readonly  name="E01ORDIIC" size="9" maxlength="9" value="<%= invOrders.getE01ORDIIC()%>" >
                <input type="text" readonly  name="E01ORDICN" size="35" maxlength="30" value="<%= invOrders.getE01ORDICN()%>">
              </div>
            </td>
            <td nowrap width="26%" > 
              <div align="right">Product Type :</div>
            </td>
            <td nowrap width="33%" > 
              <div align="left"><a href="javascript:GetInstrument('E01ORDIIC','E01ORDICN')"> 
                <select disabled name="E01ORDPTY">
                  <option value="BND" <%if (invOrders.getE01ORDPTY().equals("BND")) { out.print("selected"); }%>>Bonds</option>
                  <option value="EQT" <%if (invOrders.getE01ORDPTY().equals("EQT")) {  out.print("selected"); }%>>Equity</option>
                  <option value="MUT" <%if (invOrders.getE01ORDPTY().equals("MUT")) {  out.print("selected"); }%>>Mutual 
                  Funds</option>
                  <option value="PFS" <%if (invOrders.getE01ORDPTY().equals("PFS")) {  out.print("selected"); }%>>Preferred 
                  Stocks</option>
                  <option value="ACD" <%if (invOrders.getE01ORDPTY().equals("ACD")) {  out.print("selected"); }%>>Commodities</option>
                </select>
                </a></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="26%" > 
              <div align="right">Instrument Currency :</div>
            </td>
            <td nowrap width="15%" > 
              <div align="left"> 
                <input type="text" readonly  name="E01ORDSCY" size="4" maxlength="3" value="<%= invOrders.getE01ORDSCY()%>" >
              </div>
            </td>
            <td nowrap width="26%" > 
              <div align="right">Transaction Type :</div>
            </td>
            <td nowrap width="33%" > 
              <select disabled name="E01ORDTRN">
                <option value="1" <%if (invOrders.getE01ORDTRN().equals("1")) { out.print("selected"); }%>>Purchase</option>
                <option value="2" <%if (invOrders.getE01ORDTRN().equals("2")) {  out.print("selected"); }%>>Sale</option>
                <option value="3" <%if (invOrders.getE01ORDTRN().equals("3")) {  out.print("selected"); }%>>Transfer 
                In</option>
                <option value="4" <%if (invOrders.getE01ORDTRN().equals("4")) {  out.print("selected"); }%>>Transfer 
                Out</option>
                <option value="5" <%if (invOrders.getE01ORDTRN().equals("5")) {  out.print("selected"); }%>>Multiple 
                Purchase</option>
                <option value="6" <%if (invOrders.getE01ORDTRN().equals("6")) {  out.print("selected"); }%>>Adjustment(Increment)</option>
                <option value="7" <%if (invOrders.getE01ORDTRN().equals("7")) {  out.print("selected"); }%>>Adjustment(Decrement)</option>
              </select>
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
              <div align="right">Nominal Value :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly  name="E01ORDVNO" size="17" maxlength="16" value="<%= invOrders.getE01ORDVNO()%>">
            Pool Factor: <INPUT type="text" readonly name="E01ORDFL7"
					size="17" maxlength="16" value="<%= invOrders.getE01ORDFL7()%>"></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Quantity :</div>
            </td>
            <td nowrap >
              <input type="text" readonly  name="E01ORDQTY" size="17" maxlength="16" value="<%= invOrders.getE01ORDQTY()%>">
            of <%=invOrders.getD01MEASUR()%></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Minimum Price :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly  name="E01ORDMIP" size="17" maxlength="15" value="<%= invOrders.getE01ORDMIP()%>" onKeyPress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Maximum Price :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly  name="E01ORDMXP" size="17" maxlength="15" value="<%= invOrders.getE01ORDMXP()%>" onKeyPress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Customer Price :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly  name="E01ORDPRC" size="17" maxlength="16" value="<%= invOrders.getE01ORDPRC()%>" onKeyPress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Total Order Amount :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly  name="E01ORDTVL" size="17" maxlength="15" value="<%= invOrders.getE01ORDTVL()%>" onKeyPress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Notes :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly  name="E01ORDCO1" size="40" maxlength="35" value="<%= invOrders.getE01ORDCO1()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right"></div>
            </td>
            <td nowrap > 
              <div align="right"></div>
              <div align="left"> 
                <input type="text" readonly  name="E01ORDCO2" size="40" maxlength="35" value="<%= invOrders.getE01ORDCO2()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right"> </div>
            </td>
            <td nowrap > 
              <input type="text" readonly  name="E01ORDCO3" size="40" maxlength="35" value="<%= invOrders.getE01ORDCO3()%>">
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
