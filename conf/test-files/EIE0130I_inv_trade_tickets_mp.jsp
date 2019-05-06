<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Management Portfolio System</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">



<jsp:useBean id="invMult" class="datapro.eibs.beans.EIE013002Message"  scope="session" />

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
  <h3>Trade Tickets - Multiple Orders - Inquiry <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="inv_trade_tickets_mp.jsp,EIE130I"> 
  </h3>
</div>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0130I" >
  <h4> 
    <h4> 
      <input type="hidden" name="SCREEN"  value="10" >
      <h4>Master Order Information </h4>
      <table  class="tableinfo">
        <tr > 
          <td nowrap> 
            <table cellpadding=2 cellspacing=0 width="100%" border="0">
              <tr id="trdark"> 
                <td nowrap width="17%" > 
                  <div align="right">Order Number :</div>
                </td>
                <td nowrap width="36%" > 
                  <input type="text" readonly      name="E02ORDMNU" size="9" maxlength="5" value="<%= invMult.getE02ORDMNU()%>" >
                </td>
                <td nowrap width="14%" > 
                  <div align="right"><a href="javascript:showCustomerInq(document.forms[0].E02ORDCUN.value)"><img src="<%=request.getContextPath()%>/images/aquire.gif" alt="help" align="absbottom" border="0" > 
                    Customer </a>:</div>
                </td>
                <td nowrap width="33%" > 
                  <input type="text" readonly      name="E02ORDMCU" size="9" maxlength="9" value="<%= invMult.getE02ORDMCU().trim()%>">
                  <input type="text" readonly      name="E02ORDMCN" size="35" maxlength="35" value="<%= invMult.getE02ORDMCN().trim()%>" >
                </td>
              </tr>
              <tr id="trclear"> 
                <td nowrap width="17%" > 
                  <div align="right"><a href="javascript:showInstrumentInq(document.forms[0].E02ORDMIC.value)"><img src="<%=request.getContextPath()%>/images/aquire.gif" alt="help" align="absbottom" border="0" > 
                    Instrument </a> </div>
                </td>
                <td nowrap width="36%" > 
                  <input type="text" readonly      name="E02ORDMIC" size="9" maxlength="9" value="<%= invMult.getE02ORDMIC()%>" >
                  <input type="text" readonly      name="E02ORDICN" size="35" maxlength="30" value="<%= invMult.getE02ORDICN()%>">
                </td>
                <td nowrap width="14%" > 
                  <div align="right">Instrument Currency :</div>
                </td>
                <td nowrap width="33%" > 
                  <input type="text" readonly      name="E02ORDMCY" size="4" maxlength="3" value="<%= invMult.getE02ORDMCY()%>">
                </td>
              </tr>
              <tr id="trdark"> 
                <td nowrap width="17%" > 
                  <div align="right">Product Type :</div>
                </td>
                <td nowrap width="36%" > 
                  <input type="hidden" name="E02ORDPTY"  value="<%= invMult.getE02ORDPTY()%>" >
                  <% if(invMult.getE02ORDPTY().equals("BND")) out.print("Bonds");
              				else if(invMult.getE02ORDPTY().equals("EQT")) out.print("Equity");
							else if(invMult.getE02ORDPTY().equals("MUT")) out.print("Mutual Funds");
							else if(invMult.getE02ORDPTY().equals("PFS")) out.print("Preferred Stocks");
              				else if(invMult.getE02ORDPTY().equals("ACD")) out.print("Commodities");							
							else out.print("");%> </td>
                <td nowrap width="14%" > 
                  <div align="right"></div>
                </td>
                <td nowrap width="33%" >&nbsp; </td>
              </tr>
              <tr id="trclear"> 
                <td nowrap width="17%" > 
                  <div align="right">Trade Date :</div>
                </td>
                <td nowrap width="36%" > 
                  <input type="text" readonly      name="E02ORDIN1" size="3" maxlength="2" value="<%= invMult.getE02ORDIN1()%>">
                  <input type="text" readonly      name="E02ORDIN2" size="3" maxlength="2" value="<%= invMult.getE02ORDIN2()%>">
                  <input type="text" readonly      name="E02ORDIN3" size="3" maxlength="2" value="<%= invMult.getE02ORDIN3()%>">
                </td>
                <td nowrap width="14%" > 
                  <div align="right">Settlement Date :</div>
                </td>
                <td nowrap width="33%" > 
                  <input type="text" readonly      name="E02ORDST1" size="3" maxlength="2" value="<%= invMult.getE02ORDST1()%>">
                  <input type="text" readonly      name="E02ORDST2" size="3" maxlength="2" value="<%= invMult.getE02ORDST2()%>">
                  <input type="text" readonly      name="E02ORDST3" size="3" maxlength="2" value="<%= invMult.getE02ORDST3()%>">
                </td>
              </tr>
			<TR id="trclear">
				<TD nowrap width="17%">
				<DIV align="right">DeliveryDate :</DIV>
				</TD>
				<TD nowrap width="36%"><INPUT type="text" readonly name="E02ORDF15A"
					size="3" maxlength="2" value="<%= invMult.getE02ORDF15A()%>"> <INPUT
					type="text" readonly name="E02ORDF15B" size="3" maxlength="2"
					value="<%= invMult.getE02ORDF15B()%>"> <INPUT type="text" readonly
					name="E02ORDF15C" size="3" maxlength="2"
					value="<%= invMult.getE02ORDF15C()%>"></TD>
				<TD nowrap width="14%">
				<DIV align="right"></DIV>
				</TD>
				<TD nowrap width="33%"></TD>
			</TR>
			<tr id="trdark"> 
                <td nowrap width="17%" > 
                  <div align="right"><b>Available Balance :</b></div>
                </td>
                <td nowrap width="36%" > 
                  <input type="text" readonly      name="E02ORDMTO" size="17" maxlength="15" value="<%= invMult.getE02ORDMTO()%>" onKeyPress="enterDecimal()">
                </td>
                <td nowrap width="14%" > 
                  <div align="right"><b>Total Trade Ticket :</b></div>
                </td>
                <td nowrap width="33%" > 
                  <input type="text" readonly      name="E02ORDMBA" size="17" maxlength="16" value="<%= invMult.getE02ORDMBA()%>"
				onKeyPress="enterDecimal()" >
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <h4>Basic Information </h4>
      <table  class="tableinfo" width="715">
        <tr > 
          <td nowrap> 
            <table cellpadding=2 cellspacing=0 width="100%" border="0">
              <tr id="trdark"> 
                <td nowrap width="17%" > 
                  <div align="right">Dependend Order Number :</div>
                </td>
                <td nowrap width="36%" > 
                  <div align="left"> 
                    <input type="text" readonly      name="E02ORDNUM" size="9" maxlength="9" value="<%= invMult.getE02ORDNUM()%>" >
                  </div>
                </td>
                <td nowrap width="14%" > 
                  <div align="right">Customer :</div>
                </td>
                <td nowrap width="33%" > 
                  <div align="left"> 
                    <input type="text" readonly      name="E02ORDCUN" size="11" maxlength="9" value="<%= invMult.getE02ORDCUN()%>" >
                    <input type="text" readonly      name="E02ORDCTN" size="35" maxlength="30" value="<%= invMult.getE02ORDCTN()%>">
                  </div>
                </td>
              </tr>
              <tr id="trclear"> 
                <td nowrap width="17%" > 
                  <div align="right"><a href="javascript:showRetAccountInq(document.forms[0].E02ORDHAC.value)">Portfolio 
                    : </a></div>
                </td>
                <td nowrap width="36%" > 
                  <div align="left"> 
                    <input type="text" readonly      name="E02ORDPRF" size="12" maxlength="9" value="<%= invMult.getE02ORDPRF()%>">
                  </div>
                </td>
                <td nowrap width="14%" > 
                  <div align="right"><a href="javascript:showRetAccountInq(document.forms[0].E02ORDHAC.value)"><img src="<%=request.getContextPath()%>/images/aquire.gif" alt="help" align="absbottom" border="0" > 
                    Cash Account :</a></div>
                </td>
                <td nowrap width="33%" > 
                  <div align="left"> 
                    <input type="text" readonly      name="E02ORDHCY" size="3" maxlength="3" value="<%= invMult.getE02ORDHCY()%>"
                >
                    <input type="text" readonly      name="E02ORDHAC" size="12" maxlength="9" value="<%= invMult.getE02ORDHAC()%>"
                oncontextmenu="showPopUp(accountHelp,this.name,'','','','','RT')" >
                  </div>
                </td>
              </tr>
              <tr id="trdark"> 
                <td nowrap width="17%" > 
                  <div align="right">Balance :</div>
                </td>
                <td nowrap width="36%" > 
                  <div align="left"> 
                    <input type="text" readonly      name="E02MEMBAL" size="17" maxlength="16" value="<%= invMult.getE02MEMBAL()%>" onKeyPress="enterDecimal()">
                  </div>
                </td>
                <td nowrap width="14%" > 
                  <div align="right">Exchange Rate </div>
                </td>
                <td nowrap width="33%" > 
                  <div align="left"> 
                    <input type="text" readonly      name="E02ORDEXR" size="12" maxlength="9" value="<%= invMult.getE02ORDEXR()%>">
                  </div>
                </td>
              </tr>
              <tr id="trclear"> 
                <td nowrap width="17%" > 
                  <div align="right">Balance in :</div>
                </td>
                <td nowrap width="36%" > 
                  <div align="left"> 
                    <input type="text" readonly      name="E02CNVBAL" size="17" maxlength="16" value="<%= invMult.getE02CNVBAL()%>" onKeyPress="enterDecimal()">
                  </div>
                </td>
                <td nowrap width="14%" > 
                  <div align="right">Tax and Withholding :</div>
                </td>
                <td nowrap width="33%" > 
                  <div align="left">
                  	<input type="text" readonly name="E02ORDWHF" size="30" maxlength="30" 
				  value="<% if (invMult.getE02ORDWHF().equals("1")) out.print("Withholding Deduction");
							else if (invMult.getE02ORDWHF().equals("2")) out.print("Sales Tax");
							else if (invMult.getE02ORDWHF().equals("3")) out.print("Both (Withholding & Taxes)");
							else if (invMult.getE02ORDWHF().equals("4")) out.print("Taxes in Commissions");
							else if (invMult.getE02ORDWHF().equals("5")) out.print("Taxes in Interest");
							else if (invMult.getE02ORDWHF().equals("N")) out.print("None");
							else out.print("");%>" 
				>
                  </div>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <h4>Transaction Information </h4>
    </h4>
  </h4>
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
                <select   name="E02ORDTRN" disabled>
                  <option value="1" <%if (invMult.getE02ORDTRN().equals("1")) { out.print("selected"); }%>>Purchase</option>
                  <option value="5" <%if (invMult.getE02ORDTRN().equals("5")) {  out.print("selected"); }%>>Multiple 
                  Purchase</option>
                  <option value="2" <%if (invMult.getE02ORDTRN().equals("2")) {  out.print("selected"); }%>>Sale</option>
                  <option value="6" <%if (invMult.getE02ORDTRN().equals("6")) {  out.print("selected"); }%>>Multiple 
                  Sale</option>
                  <option value="3" <%if (invMult.getE02ORDTRN().equals("3")) {  out.print("selected"); }%>>Transfer 
                  In</option>
                  <option value="4" <%if (invMult.getE02ORDTRN().equals("4")) {  out.print("selected"); }%>>Transfer 
                  Out</option>
                </select>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Nominal Value :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" readonly  name="E02ORDVNO" size="17" maxlength="16" value="<%= invMult.getE02ORDVNO()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="right">Trade Confirmation Via :</div>
            </td>
            <td nowrap > 
              <select disabled  name="E02ORDCNF">
                <option value="N" <%if (invMult.getE02ORDCNF().equals("N")) { out.print("selected"); }%>>None</option>
                <option value="E" <%if (invMult.getE02ORDCNF().equals("E")) { out.print("selected"); }%>>e-Mail</option>
                <option value="F" <%if (invMult.getE02ORDCNF().equals("F")) { out.print("selected"); }%>>Fax</option>
                <option value="P" <%if (invMult.getE02ORDCNF().equals("P")) { out.print("selected"); }%>>Printer</option>
              </select>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Quantity : </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" readonly  name="E02ORDQTY" size="17" maxlength="16" value="<%= invMult.getE02ORDQTY()%>">
              of <%= invMult.getD02MEASUR()%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Bank Price :</div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" readonly  name="E02ORDPRB" size="17" maxlength="15" value="<%= invMult.getE02ORDPRB()%>" onKeyPress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Customer Price :</div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" readonly  name="E02ORDPRC" size="17" maxlength="15" value="<%= invMult.getE02ORDPRC()%>" onKeyPress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right"><b>Investment Amount :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" readonly  name="E02ORDIAM" size="17" maxlength="15" value="<%= invMult.getE02ORDIAM()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Accrued Interest :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" readonly  name="E02ORDIAL" size="17" maxlength="15" value="<%= invMult.getE02ORDIAL()%>" onKeyPress="enterDecimal()">
              </div>
            </td>
            <td nowrap width="14%" > 
              <div align="right">Accrued Days :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" readonly  name="E02ORDDYS" size="4" maxlength="3" value="<%= invMult.getE02ORDDYS()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap colspan="4" > 
              <div align="left"><b>Commissions </b></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Trade Commission : </div>
            </td>
            <td nowrap > 
              <input type="text" readonly  name="E02ORDOCV" size="17" maxlength="15" value="<%= invMult.getE02ORDOCV()%>" onKeyPress="enterDecimal()">
            </td>
            <td nowrap > 
              <div align="right"> Comm. Table :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly  name="E02ORDOCT" size="4" maxlength="2" value="<%= invMult.getE02ORDOCT()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Profit Commission :</div>
            </td>
            <td nowrap width="36%" > 
              <div align="left"> 
                <input type="text" readonly  name="E02ORDTGV" size="17" maxlength="15" value="<%= invMult.getE02ORDTGV()%>" >
              </div>
            </td>
            <td nowrap width="14%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="33%" > 
              <div align="left"> </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap colspan="5" > 
              <div align="left"><b>Withholding Information</b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right"> Tax Withholding :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" readonly name="E02ORDWH1" size="17" maxlength="15" value="<%= invMult.getE02ORDWH1()%>" onKeyPress="enterDecimal()"></td>
            <td nowrap width="14%" > 
              <div align="right">Tax Rate :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" readonly name="E02ORDFL8" size="10" maxlength="9" value="<%= invMult.getE02ORDFL8()%>">
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
              <input type="text" readonly name="E02ORDF6C" size="6" maxlength="6" value="<%= invMult.getE02ORDF6C()%>">
              <input type="text" readonly name="D02EXMPDS" size="30" maxlength="30" value="<%= invMult.getD02EXMPDS()%>">
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
                <input type="text" readonly  name="E02ORDTBK" size="17" maxlength="15" value="<%= invMult.getE02ORDTBK()%>" onKeyPress="enterDecimal()" >
                <a href="javascript:Calculate()"> </a> </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Customer Transaction Amount :</div>
            </td>
            <td nowrap colspan="3" > 
              <input type="text" readonly  name="E02ORDTVL" size="17" maxlength="15" value="<%= invMult.getE02ORDTVL()%>" onKeyPress="enterDecimal()" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap colspan="4" > 
              <div align="left"><b>Balance on Settlement Date</b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right"> <a href="javascript:showInvHolds(document.forms[0].E02ORDCUN.value,document.forms[0].E02ORDHAC.value,document.forms[0].E02ORDST1.value
												,document.forms[0].E02ORDST2.value,document.forms[0].E02ORDST3.value)"> 
                <img src="<%=request.getContextPath()%>/images/aquire.gif" alt="help" align="absbottom" border="0" > 
                Balance in <%= invMult.getE02ORDHCY()%> : </a> </div>
            </td>
            <td nowrap colspan="3" > 
              <input type="text" readonly  name="E02FUTBAL" size="17" maxlength="15" value="<%= invMult.getE02FUTBAL()%>" onKeyPress="enterDecimal()" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Balance in <%= invMult.getE02ORDSCY()%> :</div>
            </td>
            <td nowrap colspan="3" > 
              <input type="text" readonly  name="E02CNVFUB" size="17" maxlength="15" value="<%= invMult.getE02CNVFUB()%>" onKeyPress="enterDecimal()" >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Accounts Information</h4>
  <table  class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="center"><b></b></div>
            </td>
            <td nowrap > 
              <div align="center">Payment<br>
                Type</div>
            </td>
            <td nowrap > 
              <div align="center">Bank</div>
            </td>
            <td nowrap> 
              <div align="center">Branch</div>
            </td>
            <td nowrap > 
              <div align="center">CCY</div>
            </td>
            <td nowrap > 
              <div align="center">G/L</div>
            </td>
            <td nowrap > 
              <div align="center">Reference</div>
            </td>
            <td nowrap > 
              <div align="center">Cost<br>
                Center</div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Offset Account :</div>
            </td>
            <td nowrap > 
              <div align="center">Retail Account</div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E02ORDHBK" size="2" maxlength="2" value="<%= invMult.getE02ORDHBK()%>">
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" readonly  name="E02ORDHBR" size="3" maxlength="3"
                oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E02ORDHBK.value,'','','','')" value="<%= invMult.getE02ORDHBR()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E02ORDHCY4" size="3" maxlength="3" value="<%= invMult.getE02ORDHCY()%>"
                oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E02ORDHBK.value,'','','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E02ORDHGL" size="15" maxlength="13" value="<%= invMult.getE02ORDHGL()%>" 
				oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02ORDHBK.value,document.forms[0].E02ORDHCY.value,'','','')" >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E02ORDHAC4" size="12" maxlength="9" value="<%= invMult.getE02ORDHAC()%>"
                oncontextmenu="showPopUp(accountHelp,this.name,document.forms[0].E02ORDHBK.value,'','','','RT')" >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E02ORDHCC" size="12" maxlength="9" value="<%= invMult.getE02ORDHCC()%>"
				oncontextmenu="showPopUp(costcenterHelp,this.name,document.forms[0].E02ORDHBK.value,'','','','')">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap colspan="8" > 
              <div align="left"><b>Repayment Accounts</b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Interest :</div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <select disabled  name="E02ORDIPT">
                  <option value="1" <%if (invMult.getE02ORDIPT().equals("1")) { out.print("selected"); }%>>Retail 
                  Account</option>
                  <option value="2" <%if (invMult.getE02ORDIPT().equals("2")) {  out.print("selected"); }%>>Official 
                  Check</option>
                  <option value="3" <%if (invMult.getE02ORDIPT().equals("3")) { out.print("selected"); }%>>G/L 
                  Account</option>
                  <option value="4" <%if (invMult.getE02ORDIPT().equals("4")) {  out.print("selected"); }%>>Fed 
                  Transfer</option>
                  <option value="5" <%if (invMult.getE02ORDIPT().equals("5")) { out.print("selected"); }%>>Telex 
                  Transfer</option>
                  <option value="6" <%if (invMult.getE02ORDIPT().equals("6")) {  out.print("selected"); }%>>Swift 
                  Format MT-100</option>
                  <option value="7" <%if (invMult.getE02ORDIPT().equals("7")) { out.print("selected"); }%>>Swift 
                  Format MT-200</option>
                  <option value="8" <%if (invMult.getE02ORDIPT().equals("8")) {  out.print("selected"); }%>>Swift 
                  Format MT-202</option>
                </select>
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E02ORDIBK" size="2" maxlength="2" value="<%= invMult.getE02ORDIBK()%>">
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" readonly  name="E02ORDIBR" size="3" maxlength="3"
                oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E02ORDIBK.value,'','','','')" value="<%= invMult.getE02ORDIBR()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E02ORDICY" size="3" maxlength="3" value="<%= invMult.getE02ORDICY()%>"
                oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E02ORDIBK.value,'','','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E02ORDIGL" size="15" maxlength="13" value="<%= invMult.getE02ORDIGL()%>" 
				oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02ORDIBK.value,document.forms[0].E02ORDICY.value,'','','')" >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E02ORDIAC" size="12" maxlength="9" value="<%= invMult.getE02ORDIAC()%>"
                oncontextmenu="showPopUp(accountHelp,this.name,document.forms[0].E02ORDIBK.value,'','','','RT')" >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E02ORDICC" size="12" maxlength="9" value="<%= invMult.getE02ORDICC()%>"
				oncontextmenu="showPopUp(costcenterHelp,this.name,document.forms[0].E02ORDIBK.value,'','','','')">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Capital :</div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <select disabled  name="E02ORDCPT">
                  <option value="1" <%if (invMult.getE02ORDCPT().equals("1")) { out.print("selected"); }%>>Retail 
                  Account</option>
                  <option value="2" <%if (invMult.getE02ORDCPT().equals("2")) {  out.print("selected"); }%>>Official 
                  Check</option>
                  <option value="3" <%if (invMult.getE02ORDCPT().equals("3")) { out.print("selected"); }%>>G/L 
                  Account</option>
                  <option value="4" <%if (invMult.getE02ORDCPT().equals("4")) {  out.print("selected"); }%>>Fed 
                  Transfer</option>
                  <option value="5" <%if (invMult.getE02ORDCPT().equals("5")) { out.print("selected"); }%>>Telex 
                  Transfer</option>
                  <option value="6" <%if (invMult.getE02ORDCPT().equals("6")) {  out.print("selected"); }%>>Swift 
                  Format MT-100</option>
                  <option value="7" <%if (invMult.getE02ORDCPT().equals("7")) { out.print("selected"); }%>>Swift 
                  Format MT-200</option>
                  <option value="8" <%if (invMult.getE02ORDCPT().equals("8")) {  out.print("selected"); }%>>Swift 
                  Format MT-202</option>
                </select>
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E02ORDCBK" size="2" maxlength="2" value="<%= invMult.getE02ORDCBK()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E02ORDCBR" size="3" maxlength="3"
                oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E02ORDCBK.value,'','','','')" value="<%= invMult.getE02ORDCBR()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E02ORDCCY" size="3" maxlength="3" value="<%= invMult.getE02ORDCCY()%>"
                oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E02ORDCBK.value,'','','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E02ORDCGL" size="15" maxlength="13" value="<%= invMult.getE02ORDCGL()%>" 
				oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02ORDCBK.value,document.forms[0].E02ORDCCY.value,'','','')" >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E02ORDCAC" size="12" maxlength="9" value="<%= invMult.getE02ORDCAC()%>"
                oncontextmenu="showPopUp(accountHelp,this.name,document.forms[0].E02ORDCBK.value,'','','','RT')" >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E02ORDCCC" size="12" maxlength="9" value="<%= invMult.getE02ORDCCC()%>"
				oncontextmenu="showPopUp(costcenterHelp,this.name,document.forms[0].E02ORDCBK.value,'','','','')">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Dividends :</div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <select disabled  name="E02ORDDPT">
                  <option value="1" <%if (invMult.getE02ORDDPT().equals("1")) { out.print("selected"); }%>>Retail 
                  Account</option>
                  <option value="2" <%if (invMult.getE02ORDDPT().equals("2")) {  out.print("selected"); }%>>Official 
                  Check</option>
                  <option value="3" <%if (invMult.getE02ORDDPT().equals("3")) { out.print("selected"); }%>>G/L 
                  Account</option>
                  <option value="4" <%if (invMult.getE02ORDDPT().equals("4")) {  out.print("selected"); }%>>Fed 
                  Transfer</option>
                  <option value="5" <%if (invMult.getE02ORDDPT().equals("5")) { out.print("selected"); }%>>Telex 
                  Transfer</option>
                  <option value="6" <%if (invMult.getE02ORDDPT().equals("6")) {  out.print("selected"); }%>>Swift 
                  Format MT-100</option>
                  <option value="7" <%if (invMult.getE02ORDDPT().equals("7")) { out.print("selected"); }%>>Swift 
                  Format MT-200</option>
                  <option value="8" <%if (invMult.getE02ORDDPT().equals("8")) {  out.print("selected"); }%>>Swift 
                  Format MT-202</option>
                </select>
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E02ORDDBK" size="2" maxlength="2" value="<%= invMult.getE02ORDDBK()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E02ORDDBR" size="3" maxlength="3" value="<%= invMult.getE02ORDDBR()%>"
                oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E02ORDDBK.value,'','','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E02ORDDCY" size="3" maxlength="3" value="<%= invMult.getE02ORDDCY()%>"
                oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E02ORDDBK.value,'','','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E02ORDDGL" size="15" maxlength="13" value="<%= invMult.getE02ORDDGL()%>"
				oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02ORDDBK.value,document.forms[0].E02ORDDCY.value,'','','')"  >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E02ORDDAC" size="12" maxlength="9" value="<%= invMult.getE02ORDDAC()%>"
                oncontextmenu="showPopUp(accountHelp,this.name,document.forms[0].E02ORDDBK.value,'','','','RT')" >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E02ORDDCC" size="12" maxlength="9" value="<%= invMult.getE02ORDDCC()%>"
				oncontextmenu="showPopUp(costcenterHelp,this.name,document.forms[0].E02ORDDBK.value,'','','','')">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Additional Information</h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Maximum Collateral % :</div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"></div>
              <div align="right"></div>
              <div align="left"> 
                <input type="text" readonly    name="E02ORDMXC" size="11" maxlength="11" value="<%= invMult.getE02ORDMXC()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Trade Ticket Notes :</div>
            </td>
            <td nowrap colspan="3" > 
              <input type="text" readonly    name="E02ORDTC1" size="35" maxlength="30" value="<%= invMult.getE02ORDTC1()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right"></div>
            </td>
            <td nowrap colspan="3" > 
              <input type="text" readonly    name="E02ORDTC2" size="35" maxlength="30" value="<%= invMult.getE02ORDTC2()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right"></div>
            </td>
            <td nowrap colspan="3" > 
              <input type="text" readonly    name="E02ORDTC3" size="35" maxlength="30" value="<%= invMult.getE02ORDTC3()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Back Office Notes :</div>
            </td>
            <td nowrap colspan="3" > 
              <input type="text" readonly    name="E02ORDBC1" size="35" maxlength="30" value="<%= invMult.getE02ORDBC1()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right"></div>
            </td>
            <td nowrap colspan="3" > 
              <input type="text" readonly    name="E02ORDBC2" size="35" maxlength="30" value="<%= invMult.getE02ORDBC2()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right"></div>
            </td>
            <td nowrap colspan="3" > 
              <input type="text" readonly    name="E02ORDBC3" size="35" maxlength="30" value="<%= invMult.getE02ORDBC3()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
    
  <h4><table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
      <tr bgcolor="#FFFFFF"> 
        <td width="33%"> 
          <div align="center"> 
            <input id="EIBSBTN" type=submit name="Submit" value="Back">
          </div>
        </td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td> 
          <div align="center"> </div>
        </td>
      </tr>
    </table>
  </h4>
  </form>
</body>
</html>
