<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Management Portfolio System</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">



<jsp:useBean id="invTrade" class="datapro.eibs.beans.EIE012001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>
<SCRIPT Language="Javascript">

   builtHPopUp();

  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }

</SCRIPT>

<SCRIPT Language="Javascript">
 function Calculate(){
  document.forms[0].SCREEN.value = '16';
  document.forms[0].submit();

}
</SCRIPT>
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
  <h3>Trade Tickets Multiple <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="inv_orders_input.jsp,EIE110"> 
  </h3>
</div>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0120" >
  <h4> 
    <input type="hidden" name="SCREEN"  value="2" >
    Transaction Information </h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="31%" > 
              <div align="right">Master Order Number :</div>
            </td>
            <td nowrap colspan="3" > 
              <input type="text" name="E01ORDNUM" size="9" maxlength="5" value="<%= invTrade.getE01ORDNUM()%>" readonly>
            </td>
            <td nowrap width="24%" >&nbsp;</td>
            <td nowrap width="24%" >&nbsp;</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="31%" > 
              <div align="right">Product Type :</div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <select name="E01ORDPTY">
                  <option value="BND" <%if (invTrade.getE01ORDPTY().equals("BND")) { out.print("selected"); }%>>Bonds</option>
                  <option value="EQT" <%if (invTrade.getE01ORDPTY().equals("EQT")) {  out.print("selected"); }%>>Equity</option>
                  <option value="MUT" <%if (invTrade.getE01ORDPTY().equals("MUT")) {  out.print("selected"); }%>>Mutual 
                  Funds</option>
                  <option value="PFS" <%if (invTrade.getE01ORDPTY().equals("PFS")) {  out.print("selected"); }%>>Preferred 
                  Stocks</option>
                  <option value="ACD" <%if (invTrade.getE01ORDPTY().equals("ACD")) {  out.print("selected"); }%>>Commodities</option>
                </select>
              </div>
            </td>
            <td nowrap width="24%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="24%" >&nbsp; </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="31%" > 
              <div align="right"><a href="javascript:showInstrumentInq(document.forms[0].E01ORDIIC.value)"><img src="<%=request.getContextPath()%>/images/1aquire.gif" alt="help" align="absbottom" border="0" > 
                Instrument :</a> </div>
            </td>
            <td nowrap colspan="5" > 
              <div align="left"> </div>
              <div align="left"> 
                <input type="text" name="E01ORDIIC" size="9" maxlength="9" value="<%= invTrade.getE01ORDIIC()%>" >
                <input type="text" name="E01ORDICN" size="35" maxlength="30" value="<%= invTrade.getE01ORDICN()%>">
                <a href="javascript:GetInstrumentParams('E01ORDIIC','E01ORDICN','E01ORDSCY','','E01ORDISI','','E01ORDPTY')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0"></a> 
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="31%" > 
              <div align="right">Instrument Currency :</div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E01ORDSCY" size="4" maxlength="3" value="<%= invTrade.getE01ORDSCY()%>"readonly>
              </div>
            </td>
            <td nowrap width="24%" > 
              <div align="right">ISIN :</div>
            </td>
            <td nowrap width="24%" > 
              <input type="text" name="E01ORDISI" size="16" maxlength="12" value="<%= invTrade.getE01ORDISI()%>"readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="31%" > 
              <div align="right">Transaction Type :</div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <select name="E01ORDTRN">
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
            <td nowrap width="24%" align="right">&nbsp;Delivery Date:</td>
            <td nowrap width="24%" >
                <input type="text" name="E01ORDF15A" size="3" maxlength="2" value="<%= invTrade.getE01ORDF15A()%>">
                <input type="text" name="E01ORDF15B" size="3" maxlength="2" value="<%= invTrade.getE01ORDF15B()%>">
                <input type="text" name="E01ORDF15C" size="3" maxlength="2" value="<%= invTrade.getE01ORDF15C()%>">
                <a href="javascript:DatePicker(document.forms[0].E01ORDF15A,document.forms[0].E01ORDF15B,document.forms[0].E01ORDF15C)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
          </tr>
          <tr id="trclear"> 
            <td nowrap width="31%" > 
              <div align="right">Trade Date :</div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E01ORDIN1" size="3" maxlength="2" value="<%= invTrade.getE01ORDIN1()%>">
                <input type="text" name="E01ORDIN2" size="3" maxlength="2" value="<%= invTrade.getE01ORDIN2()%>">
                <input type="text" name="E01ORDIN3" size="3" maxlength="2" value="<%= invTrade.getE01ORDIN3()%>">
                <a href="javascript:DatePicker(document.forms[0].E01ORDIN1,document.forms[0].E01ORDIN2,document.forms[0].E01ORDIN3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
              </div>
            </td>
            <td nowrap width="24%" > 
              <div align="right">Settlement Date :</div>
            </td>
            <td nowrap width="24%" > 
              <div align="left"> 
                <input type="text" name="E01ORDST1" size="3" maxlength="2" value="<%= invTrade.getE01ORDST1()%>">
                <input type="text" name="E01ORDST2" size="3" maxlength="2" value="<%= invTrade.getE01ORDST2()%>">
                <input type="text" name="E01ORDST3" size="3" maxlength="2" value="<%= invTrade.getE01ORDST3()%>">
                <a href="javascript:DatePicker(document.forms[0].E01ORDST1,document.forms[0].E01ORDST2,document.forms[0].E01ORDST3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="31%" > 
              <div align="right">Nominal Value :</div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E01ORDVNO" size="17" maxlength="16" value="<%= invTrade.getE01ORDVNO()%>">
              </div>
            </td>
            <td nowrap width="24%" >&nbsp;</td>
            <td nowrap width="24%" >&nbsp;</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="31%" > 
              <div align="right">Quantity : </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E01ORDQTY" size="17" maxlength="16" value="<%= invTrade.getE01ORDQTY()%>">
              </div>
            </td>
            <td nowrap width="24%" >&nbsp;of <%= invTrade.getD01MEASUR()%></td>
            <td nowrap width="24%" >&nbsp;</td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="31%" > 
              <div align="right">Bank Price :</div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E01ORDPRB" size="17" maxlength="15" value="<%= invTrade.getE01ORDPRB()%>" onKeyPress="enterDecimal()">
              </div>
            </td>
            <td nowrap width="24%" >&nbsp;</td>
            <td nowrap width="24%" >&nbsp;</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="31%" > 
              <div align="right">Customer Price :</div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E01ORDPRC" size="17" maxlength="15" value="<%= invTrade.getE01ORDPRC()%>" onKeyPress="enterDecimal()">
              </div>
            </td>
            <td nowrap width="24%" >&nbsp;</td>
            <td nowrap width="24%" >&nbsp;</td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="31%" > 
              <div align="right">Bank Transaction Amount :</div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E01ORDTBK" size="17" maxlength="15" value="<%= invTrade.getE01ORDTBK()%>" onKeyPress="enterDecimal()" readonly>
                <a href="javascript:Calculate()"> </a></div>
            </td>
            <td nowrap width="24%" >&nbsp;</td>
            <td nowrap width="24%" >&nbsp;</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="31%" > 
              <div align="right">Broker :</div>
            </td>
            <td nowrap colspan="5" > 
              <div align="left"> 
                <input type="text" name="E01ORDBRK" size="5" maxlength="3" value="<%= invTrade.getE01ORDBRK()%>" >
                <input type="text" name="E01ORDBKN" size="35" maxlength="30" value="<%= invTrade.getE01ORDBKN()%>">
                <a href="javascript:GetBrokerI('E01ORDBRK','E01ORDBKN')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0"></a> 
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="31%" > 
              <div align="right">Custodian :</div>
            </td>
            <td nowrap colspan="5" > 
              <div align="left"> 
                <input type="text" name="E01ORDCUC" size="5" maxlength="3" value="<%= invTrade.getE01ORDCUC()%>" >
                <input type="text" name="E01ORDCCN" size="35" maxlength="30" value="<%= invTrade.getE01ORDCCN()%>">
                <a href="javascript:GetCustodian('E01ORDCUC','E01ORDCCN')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0"></a> 
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF">
      <td width="38%">&nbsp;</td>
      <td width="21%"> 
        <div align="left">
          <input type="checkbox" name="E01ORDDLT" value="Y" <% if(invTrade.getE01ORDDLT().equals("Y")){ out.print("checked");} %>>
          Mark for Deletion </div>
      </td>
      <td width="41%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="38%"> 
        <div align="right"> </div>
        <div align="center"> </div>
      </td>
      <td width="21%"> 
        <div align="left">
          <input type="checkbox" name="H01FLGWK2" value="A" <% if(invTrade.getH01FLGWK2().equals("A")){ out.print("checked");} %>>
          Accept with Warnings </div>
      </td>
      <td width="41%"> 
        <div align="center"> </div>
      </td>
    </tr>
  </table>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td colspan="3"> 
        <div align="center"> 
          <input id="EIBSBTN" type=submit name="Submit" value="Submit">
        </div>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="3"> 
        <div align="center"> </div>
      </td>
    </tr>
  </table>
 
  </form>
</body>
</html>
