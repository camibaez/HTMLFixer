<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Management Portfolio System</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">



<jsp:useBean id="invTrade" class="datapro.eibs.beans.EIE013001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT> 
 <script src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"></script>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>
<SCRIPT Language="Javascript">

function recInterest(){
  
  if(document.forms[0].H01FLGWK3.value = 'Y'){
    document.forms[0].H01FLGWK3.value = '';
  }
  else {
    document.forms[0].H01FLGWK3.value = 'Y';
}
}

function checkDeletion(){
alert("deletion= " + document.forms[0].E01ORDDLT.value);
  if(document.forms[0].E01ORDDLT.value.trim() ==""){ 
  document.forms[0].E01ORDDLT.value = 'Y';
  }
  if(document.forms[0].E01ORDDLT.value == "Y") {
  document.forms[0].E01ORDDLT.value = '';
}
 

}
  
function recComm(){
  
  if(document.forms[0].H01FLGWK1.value = 'Y'){
    document.forms[0].H01FLGWK1.value = '';
  }
  else {
    document.forms[0].H01FLGWK1.value = 'Y';
}
}

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
  <h3>Trade Ticket Back Office<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="inv_trade_tickets_bo.jsp,EIE0130"> 
  </h3>
</div>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0130" >
  <h4>Basic Information
    <input type="hidden" name="SCREEN"  value="2" >
  </h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap  > 
              <div align="right">Order Number :</div>
            </td>
            <td nowrap colspan="5" > 
              <input type="text" name="E01ORDNUM" size="9" maxlength="5" value="<%= invTrade.getE01ORDNUM()%>" disabled>
            </td>
          </tr>
          
          <tr id="trdark"> 
            <td nowrap  > 
              <div align="right">Portfolio :</div>
            </td>
            <td nowrap colspan="5" > 
              <input type="text" disabled name="E01ORDPRF" size="9" maxlength="9" value="<%= invTrade.getE01ORDPRF()%>" >
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap  > 
              <div align="right">Cash Account :</div>
            </td> 
             
            <td nowrap colspan="5" > 
              <input type="text" disabled name="E01ORDHCY" size="3" maxlength="3" value="<%= invTrade.getE01ORDHCY()%>">
              <input type="text" disabled name="E01ORDHAC" size="12" maxlength="9" value="<%= invTrade.getE01ORDHAC()%>">
              
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap  > 
              <div align="right">Available Balance :</div>
            </td>
            <td nowrap  > 
              <input type="text" name="E01MEMBAL" size="17" maxlength="16" value="<%= invTrade.getE01MEMBAL()%>" onKeyPress="enterDecimal()" disabled>
            </td>
            <td nowrap  > 
              <div align="right">Balance in <%= invTrade.getE01ORDSCY()%> :</div>
            </td>
            <td nowrap  > 
              <input type="text" name="E01CNVBAL" size="17" maxlength="16" value="<%= invTrade.getE01CNVBAL()%>"
				onKeyPress="enterDecimal()" disabled>
            </td>
          </tr>
          
          <tr id="trdark" width="17%"> 
            <td nowrap  > 
              <div align="right">Exchange Rate :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" disabled name="E01ORDEXR" size="11" maxlength="11" value="<%= invTrade.getE01ORDEXR()%>">
            </td>
           
            <td nowrap width="14%"> 
              <div align="right">Tax and Withholding :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" disabled name="E01ORDWHF" size="3" maxlength="1" value="<%= invTrade.getE01ORDWHF().trim()%>">
               
            </td>
          </tr>
          
          <tr id="trclear"> 
            <td nowrap  > 
              <div align="right">Product Code : </div>
            </td>
            <td nowrap colspan="5" > 
              <div align="left"> 
                <input type="text" name="E01ORDCDE" size="5" maxlength="4" value="<%= invTrade.getE01ORDCDE()%>" >
                <input type="text" name="E01ORDPNM" size="35" maxlength="30" value="<%= invTrade.getE01ORDPNM()%>">
                <a href="javascript:GetProduct('E01ORDCDE','E01ORDPNM','IV','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a> 
                <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  > 
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap  rowspan="2" > 
              <div align="right">Product Account :</div>
            </td>
            <td nowrap > 
              <div align="center"> Bnk</div>
            </td>
            <td nowrap > 
              <div align="center"> Brn</div>
            </td>
            <td nowrap > 
              <div align="center"> CCY</div>
            </td>
            <td nowrap > 
              <div align="center"> G/L</div>
            </td>
            <td nowrap > 
              <div align="center"> Cost Center</div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap  > 
              <div align="center"> 
                <input type="text" name="E01ORDPBK" size="2" maxlength="2" value="<%= invTrade.getE01ORDPBK()%>">
              </div>
            </td>
            <td nowrap  > 
              <div align="center"> 
                <input type="text" name="E01ORDPBR" size="3" maxlength="3"
                 value="<%= invTrade.getE01ORDPBR()%>">
              </div>
            </td>
            <td nowrap  > 
              <div align="center"> 
                <input type="text" name="E01ORDPCY" size="3" maxlength="3" value="<%= invTrade.getE01ORDPCY()%>"
                >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01ORDPGL" size="15" maxlength="13" value="<%= invTrade.getE01ORDPGL()%>" 
				 >
              </div>
            </td>
            <td nowrap  > 
              <div align="center"> 
                <input type="text" name="E01ORDPCC" size="12" maxlength="9" value="<%= invTrade.getE01ORDPCC()%>" >
              </div>
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
              <select name="E01ORDPTY" disabled>
                <option value="BND" <%if (invTrade.getE01ORDPTY().equals("BND")) { out.print("selected"); }%>>Bonds</option>
                <option value="EQT" <%if (invTrade.getE01ORDPTY().equals("EQT")) {  out.print("selected"); }%>>Equity</option>
                <option value="MUT" <%if (invTrade.getE01ORDPTY().equals("MUT")) {  out.print("selected"); }%>>Mutual 
                Funds</option>
                <option value="PFS" <%if (invTrade.getE01ORDPTY().equals("PFS")) {  out.print("selected"); }%>>Preferred 
                Stocks</option>
					<OPTION value="ACD"<%if (invTrade.getE01ORDPTY().equals("ACD")) {  out.print("selected"); }%>>Commodities</OPTION>
				</select>
            </td>
            <td nowrap colspan="2" >&nbsp;</td>
          </tr>
          <tr id="trclear"> 
             
            <td nowrap width="17%" > 
              <div align="right">Instrument :</div>
            </td>
            <td nowrap colspan="3" > 
              <input type="text" name="E01ORDIIC" disabled size="9" maxlength="9" value="<%= invTrade.getE01ORDIIC()%>" >
              <input type="text"  disabled name="E01ORDICN" size="35" maxlength="30" value="<%= invTrade.getE01ORDICN()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Instrument Currency :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" name="E01ORDSCY" size="4" maxlength="3" value="<%= invTrade.getE01ORDSCY()%>"disabled>
            </td>
            <td nowrap width="14%" > 
              <div align="right">ISIN :</div>
            </td>
            <td nowrap width="33%" >
            <INPUT type="text" name="E01ORDISI" size="16" maxlength="12" value="<%= invTrade.getE01ORDISI()%>" disabled></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Last Interest Paid Date :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" disabled name="E01ORDLP1" size="3" maxlength="2" value="<%= invTrade.getE01ORDLP1()%>">
              <input type="text" disabled name="E01ORDLP2" size="3" maxlength="2" value="<%= invTrade.getE01ORDLP2()%>">
              <input type="text" disabled name="E01ORDLP3" size="3" maxlength="2" value="<%= invTrade.getE01ORDLP3()%>">
            </td>
            <td nowrap width="14%" > 
              <div align="right">CUSIP :</div>
            </td>
            <td nowrap width="33%" >
            <INPUT type="text" name="E01ORDCSP" size="16" maxlength="12" value="<%= invTrade.getE01ORDCSP()%>" disabled></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Accrual Type :</div>
            </td>
            <td nowrap width="36%" > 
              <select name="E01ORDATY" disabled>
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
              <div align="right">Interest Rate:</div>
            </td>
            <td nowrap width="33%" >
            	<input type="text" name="E01ORDRTE" size="10" maxlength="9" value="<%= invTrade.getE01ORDRTE()%>"disabled>
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
            <td nowrap colspan="4" > 
              <div align="left"> 
                <select name="E01ORDTRN" disabled>
                  <option value="1" <%if (invTrade.getE01ORDTRN().equals("1")) { out.print("selected"); }%>>Purchase</option>
                  <option value="5" <%if (invTrade.getE01ORDTRN().equals("5")) {  out.print("selected"); }%>>Multiple Purchase</option>
                  <option value="2" <%if (invTrade.getE01ORDTRN().equals("2")) {  out.print("selected"); }%>>Sale</option>
                  <option value="6" <%if (invTrade.getE01ORDTRN().equals("6")) {  out.print("selected"); }%>>Multiple Sale</option>
                  <option value="3" <%if (invTrade.getE01ORDTRN().equals("3")) {  out.print("selected"); }%>>Transfer In</option>
                  <option value="4" <%if (invTrade.getE01ORDTRN().equals("4")) {  out.print("selected"); }%>>Transfer Out</option>
                </select>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Trade Date :</div>
            </td>
            <td nowrap width="36%" colspan="2" > 
              <div align="left"> 
                <input type="text" disabled name="E01ORDIN1" size="3" maxlength="2" value="<%= invTrade.getE01ORDIN1()%>">
                <input type="text" disabled name="E01ORDIN2" size="3" maxlength="2" value="<%= invTrade.getE01ORDIN2()%>">
                <input type="text" disabled name="E01ORDIN3" size="3" maxlength="2" value="<%= invTrade.getE01ORDIN3()%>">
                 
            </td>
            
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Settlement Date : </div>
            </td>
            <td nowrap colspan="4" > 
              <input type="text" disabled name="E01ORDST1" size="3" maxlength="2" value="<%= invTrade.getE01ORDST1()%>">
              <input type="text" disabled name="E01ORDST2" size="3" maxlength="2" value="<%= invTrade.getE01ORDST2()%>">
              <input type="text" disabled name="E01ORDST3" size="3" maxlength="2" value="<%= invTrade.getE01ORDST3()%>">
               
          </tr>
			<TR id="trdark">
			  <TD nowrap>
				<DIV align="right">Delivery Date :</DIV>
			</TD>
			<TD nowrap colspan="4">
			  <INPUT type="text" disabled name="E01ORDF15A" size="3" maxlength="2" value="<%= invTrade.getE01ORDF15A()%>"> 
			  <INPUT type="text" disabled name="E01ORDF15B" size="3" maxlength="2" value="<%= invTrade.getE01ORDF15B()%>"> 
			  <INPUT type="text" disabled name="E01ORDF15C" size="3" maxlength="2" value="<%= invTrade.getE01ORDF15C()%>">  					 
			</TD>
		  </TR>
			<tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Nominal Value :</div>
            </td>
            <td nowrap colspan="4" > 
              <div align="left"> 
                <input type="text" name="E01ORDVNO" size="17" maxlength="16" value="<%= invTrade.getE01ORDVNO()%>" disabled>
                 
              Pool Factor: <INPUT type="text" disabled name="E01ORDFL7"
					size="17" maxlength="16" value="<%= invTrade.getE01ORDFL7()%>"></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Quantity : </div>
            </td>
             <td nowrap colspan="4" > 
              <div align="left"> 
                <input type="text" disabled name="E01ORDQTY" size="17" maxlength="16" value="<%= invTrade.getE01ORDQTY()%>" readonly>
                
              of <%= invTrade.getD01MEASUR()%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Bank Price :</div>
            </td>
            <td nowrap colspan="4" > 
              <div align="left"> 
                <input type="text" name="E01ORDPRB" size="17" maxlength="15" value="<%= invTrade.getE01ORDPRB()%>" disabled onKeyPress="enterDecimal()">
                 
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Customer Price :</div>
            </td>
            <td nowrap colspan="4" > 
              <div align="left"> 
                <input type="text" disabled name="E01ORDPRC" size="17" maxlength="15" value="<%= invTrade.getE01ORDPRC()%>" disabled onKeyPress="enterDecimal()">
                 
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right"><b>Investment Amount :</b></div>
            </td>
            <td nowrap colspan="4" > 
              <div align="left"> 
                <input type="text" disabled name="E01ORDIAM" size="17" maxlength="15" value="<%= invTrade.getE01ORDIAM()%>" disabled>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Accrued Interest :</div>
            </td>
            <td nowrap width="36%" colspan="2" > 
              <div align="left"> 
                <input type="text" disabled name="E01ORDIAL" size="17" maxlength="15" value="<%= invTrade.getE01ORDIAL()%>" disabled onKeyPress="enterDecimal()">
                 
            </td>
            <td nowrap width="14%" > 
              <div align="right">Accrued Days :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" name="E01ORDDYS" size="4" maxlength="3" value="<%= invTrade.getE01ORDDYS()%>" disabled>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap colspan="5" > 
              <div align="left"><b>Commissions </b></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Trade Commission : </div>
            </td>
            <td nowrap width="36%" colspan="2" > 
              <input type="text" disabled name="E01ORDOCV" size="17" maxlength="15" value="<%= invTrade.getE01ORDOCV()%>" onKeyPress="enterDecimal()">
               
            <td nowrap width="14%"> 
              <div align="right">Trade Comm. Table :</div>
            </td>
            <td nowrap width="33%"> 
              <input type="text" disabled name="E01ORDOCT" size="4" maxlength="2" value="<%= invTrade.getE01ORDOCT()%>">
               
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Profit Commission :</div>
            </td>
            <td nowrap width="36%" colspan="2"> 
              <div align="left"> 
                <input type="text" name="E01ORDTGV" size="17" maxlength="15" value="<%= invTrade.getE01ORDTGV()%>" disabled>
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
            <td nowrap width="17%" > 
              <div align="right">Custody Fee :</div>
            </td>
            <td nowrap width="36%" colspan="2" > 
              <div align="left"> 
                <input type="text" name="E01ORDFL9" size="17" maxlength="15" value="<%= invTrade.getE01ORDFL9()%>" disabled>
              </div>
            </td>   
            <td nowrap width="14%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="33%" > 
              <div align="left"> </div>
            </td>       
          </tr>
          			<TR id="trclear">
						<TD nowrap width="17%" align="right">Custody Fee Rate :</TD>
						<TD nowrap colspan="3">
						<INPUT type="text" name="E01ORDCFR"
							size="17" maxlength="15" value="<%= invTrade.getE01ORDCFR()%>"
							readonly>
						%</TD>
					</TR>
          
          <tr id="trdark"> 
            <td nowrap colspan="5" > 
              <div align="left"><b>Withholding Information</b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right"> Tax Withholding :</div>
            </td>
            <td nowrap width="36%" colspan="2" > 
              <input type="text" disabled name="E01ORDWH1" size="17" maxlength="15" value="<%= invTrade.getE01ORDWH1()%>" onKeyPress="enterDecimal()"></td>
            <td nowrap width="14%" > 
              <div align="right">Tax Rate :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" disabled name="E01ORDFL8" size="10" maxlength="9" value="<%= invTrade.getE01ORDFL8()%>">
            </td>
          </tr>
          <
          <tr id="trdark"> 
            <td nowrap colspan="5" > 
              <div align="left"><b>Totals</b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Bank Transaction Amount :</div>
            </td>
            <td nowrap colspan="4" > 
              <div align="left"> 
                <input type="text" name="E01ORDTBK" size="17" maxlength="15" value="<%= invTrade.getE01ORDTBK()%>" onKeyPress="enterDecimal()" disabled>
                 
                 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Customer Transaction Amount :</div>
            </td>
            <td nowrap colspan="4" > 
              <input type="text" name="E01ORDTVL" size="17" maxlength="15" value="<%= invTrade.getE01ORDTVL()%>" onKeyPress="enterDecimal()" disabled>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap colspan="5" > 
              <div align="left"><b>Balance on Settlement Date</b></div>
            </td>
          </tr>
          <tr id="trdark"> 
             
            <td nowrap width="17%" > 
              <div align="right">Balance In <%= invTrade.getE01ORDSCY()%> :</div>              
            </td>
             
            <td nowrap colspan="4" > 
              <input type="text" name="E01FUTBAL" size="17" maxlength="15" value="<%= invTrade.getE01FUTBAL()%>" onKeyPress="enterDecimal()" disabled>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Balance in <%= invTrade.getE01ORDSCY()%> :</div>
            </td>
            <td nowrap colspan="4" > 
              <input type="text" name="E01CNVFUB" size="17" maxlength="15" value="<%= invTrade.getE01CNVFUB()%>" onKeyPress="enterDecimal()" disabled>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Broker / Custodian Information </h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="20%" > 
              <div align="right">Broker :</div>
            </td>
            <td nowrap width="80%" > 
              <div align="left"> 
                <input type="text" disabled name="E01ORDBRK" size="5" maxlength="3" value="<%= invTrade.getE01ORDBRK()%>" >
                <input type="text" disabled name="E01ORDBKN" size="35" maxlength="30" value="<%= invTrade.getE01ORDBKN()%>">
                
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
                <input type="text" disabled name="E01ORDCUC" size="5" maxlength="3" value="<%= invTrade.getE01ORDCUC()%>" >
                <input type="text" disabled name="E01ORDCCN" size="35" maxlength="30" value="<%= invTrade.getE01ORDCCN()%>">
                 
              </div>
            </td>
           </tr>
           <tr id="trdark">
           	<td>
           		<div align="right">Custody Operation Status :</div>
           	</td>
           	<td>
			<SELECT name="E01ORDF130" size="0">
					<OPTION value="100"
						<%if (invTrade.getE01ORDF13().equals("100")) { out.print("selected"); }%>>Match</OPTION>
					<OPTION value="200"
						<%if (invTrade.getE01ORDF13().equals("200")) {  out.print("selected"); }%>>No
					Match</OPTION>
					<OPTION value="300"
						<%if (invTrade.getE01ORDF13().equals("300")) {  out.print("selected"); }%>>Pending</OPTION>
					<OPTION value="400"
						<%if (invTrade.getE01ORDF13().equals("400")) {  out.print("selected"); }%>>Settlement</OPTION>
				</SELECT></td>
           </tr>
           
           
          <tr>
          	<td nowrap width="25%" >
              <div align="right">Settlement Via :</div>
            </td>
            <td nowrap width="27%" >
              <input type="radio" disabled name="E01ORDFL1" value="F" <%if(invTrade.getE01ORDFL1().equals("F")) out.print("checked");%>>Free of Payment 
            </td>
          </tr>
            
           <tr>
            <td nowrap width="25%" >
              <div align="right"> </div>
            </td>
            <td nowrap width="27%" >               
              <input type="radio" disabled name="E01ORDFL1" value="A" <%if(invTrade.getE01ORDFL1().equals("A")) out.print("checked");%>>Against Payment
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
              <div align="center">Cost <br> Center</div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right"> <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" width="32" height="32"  > 
                Offset Account :</div>
            </td>
            <td nowrap > 
              <div align="center">Retail Account</div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01ORDHBK" size="2" maxlength="2" value="<%= invTrade.getE01ORDHBK()%>">
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E01ORDHBR" size="3" maxlength="3"
                oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E01ORDHBK.value,'','','','')" value="<%= invTrade.getE01ORDHBR()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01ORDHCY" size="3" maxlength="3" value="<%= invTrade.getE01ORDHCY()%>"
                oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E01ORDHBK.value,'','','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01ORDHGL" size="15" maxlength="13" value="<%= invTrade.getE01ORDHGL()%>" 
				oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01ORDHBK.value,document.forms[0].E01ORDHCY.value,'','','')" >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01ORDHAC5" size="12" maxlength="9" value="<%= invTrade.getE01ORDHAC()%>"
                oncontextmenu="showPopUp(accountHelp,this.name,document.forms[0].E01ORDHBK.value,'','','','RT')" >
              </div>
            </td>
            <td nowrap > 
              <div align="center">
                <input type="text" name="E01ORDHCC" size="12" maxlength="9" value="<%= invTrade.getE01ORDHCC()%>"
				oncontextmenu="showPopUp(costcenterHelp,this.name,document.forms[0].E01ORDHBK.value,'','','','')">
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
                <select name="E01ORDIPT">
                  <option value="1" <%if (invTrade.getE01ORDIPT().equals("1")) { out.print("selected"); }%>>Retail 
                  Account</option>
                  <option value="2" <%if (invTrade.getE01ORDIPT().equals("2")) {  out.print("selected"); }%>>Official 
                  Check</option>
                  <option value="3" <%if (invTrade.getE01ORDIPT().equals("3")) { out.print("selected"); }%>>G/L 
                  Account</option>
                  <option value="4" <%if (invTrade.getE01ORDIPT().equals("4")) {  out.print("selected"); }%>>Fed 
                  Transfer</option>
                  <option value="5" <%if (invTrade.getE01ORDIPT().equals("5")) { out.print("selected"); }%>>Telex 
                  Transfer</option>
                  <option value="6" <%if (invTrade.getE01ORDIPT().equals("6")) {  out.print("selected"); }%>>Swift 
                  Format MT-103</option>
                  <option value="7" <%if (invTrade.getE01ORDIPT().equals("7")) { out.print("selected"); }%>>Swift 
                  Format MT-200</option>
                  <option value="8" <%if (invTrade.getE01ORDIPT().equals("8")) {  out.print("selected"); }%>>Swift 
                  Format MT-202</option>
                </select>
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01ORDIBK" size="2" maxlength="2" value="<%= invTrade.getE01ORDIBK()%>">
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E01ORDIBR" size="3" maxlength="3"
                oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E01ORDIBK.value,'','','','')" value="<%= invTrade.getE01ORDIBR()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01ORDICY" size="3" maxlength="3" value="<%= invTrade.getE01ORDICY()%>"
                oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E01ORDIBK.value,'','','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01ORDIGL" size="15" maxlength="13" value="<%= invTrade.getE01ORDIGL()%>" 
				oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01ORDIBK.value,document.forms[0].E01ORDICY.value,'','','')" >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01ORDIAC" size="12" maxlength="9" value="<%= invTrade.getE01ORDIAC()%>"
                oncontextmenu="showPopUp(accountHelp,this.name,document.forms[0].E01ORDIBK.value,'','','','RT')" >
              </div>
            </td>
            <td nowrap > 
              <div align="center">
                <input type="text" name="E01ORDICC" size="12" maxlength="9" value="<%= invTrade.getE01ORDICC()%>"
				oncontextmenu="showPopUp(costcenterHelp,this.name,document.forms[0].E01ORDIBK.value,'','','','')">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Capital :</div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <select name="E01ORDCPT">
                  <option value="1" <%if (invTrade.getE01ORDCPT().equals("1")) { out.print("selected"); }%>>Retail 
                  Account</option>
                  <option value="2" <%if (invTrade.getE01ORDCPT().equals("2")) {  out.print("selected"); }%>>Official 
                  Check</option>
                  <option value="3" <%if (invTrade.getE01ORDCPT().equals("3")) { out.print("selected"); }%>>G/L 
                  Account</option>
                  <option value="4" <%if (invTrade.getE01ORDCPT().equals("4")) {  out.print("selected"); }%>>Fed 
                  Transfer</option>
                  <option value="5" <%if (invTrade.getE01ORDCPT().equals("5")) { out.print("selected"); }%>>Telex 
                  Transfer</option>
                  <option value="6" <%if (invTrade.getE01ORDCPT().equals("6")) {  out.print("selected"); }%>>Swift 
                  Format MT_103</option>
                  <option value="7" <%if (invTrade.getE01ORDCPT().equals("7")) { out.print("selected"); }%>>Swift 
                  Format MT-200</option>
                  <option value="8" <%if (invTrade.getE01ORDCPT().equals("8")) {  out.print("selected"); }%>>Swift 
                  Format MT-202</option>
                </select>
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01ORDCBK" size="2" maxlength="2" value="<%= invTrade.getE01ORDCBK()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01ORDCBR" size="3" maxlength="3"
                oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E01ORDCBK.value,'','','','')" value="<%= invTrade.getE01ORDCBR()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01ORDCCY" size="3" maxlength="3" value="<%= invTrade.getE01ORDCCY()%>"
                oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E01ORDCBK.value,'','','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01ORDCGL" size="15" maxlength="13" value="<%= invTrade.getE01ORDCGL()%>" 
				oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01ORDCBK.value,document.forms[0].E01ORDCCY.value,'','','')" >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01ORDCAC" size="12" maxlength="9" value="<%= invTrade.getE01ORDCAC()%>"
                oncontextmenu="showPopUp(accountHelp,this.name,document.forms[0].E01ORDCBK.value,'','','','RT')" >
              </div>
            </td>
            <td nowrap > 
              <div align="center">
                <input type="text" name="E01ORDCCC" size="12" maxlength="9" value="<%= invTrade.getE01ORDCCC()%>"
				oncontextmenu="showPopUp(costcenterHelp,this.name,document.forms[0].E01ORDCBK.value,'','','','')">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Dividends :</div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <select name="E01ORDDPT">
                  <option value="1" <%if (invTrade.getE01ORDDPT().equals("1")) { out.print("selected"); }%>>Retail 
                  Account</option>
                  <option value="2" <%if (invTrade.getE01ORDDPT().equals("2")) {  out.print("selected"); }%>>Official 
                  Check</option>
                  <option value="3" <%if (invTrade.getE01ORDDPT().equals("3")) { out.print("selected"); }%>>G/L 
                  Account</option>
                  <option value="4" <%if (invTrade.getE01ORDDPT().equals("4")) {  out.print("selected"); }%>>Fed 
                  Transfer</option>
                  <option value="5" <%if (invTrade.getE01ORDDPT().equals("5")) { out.print("selected"); }%>>Telex 
                  Transfer</option>
                  <option value="6" <%if (invTrade.getE01ORDDPT().equals("6")) {  out.print("selected"); }%>>Swift 
                  Format MT_103</option>
                  <option value="7" <%if (invTrade.getE01ORDDPT().equals("7")) { out.print("selected"); }%>>Swift 
                  Format MT-200</option>
                  <option value="8" <%if (invTrade.getE01ORDDPT().equals("8")) {  out.print("selected"); }%>>Swift 
                  Format MT-202</option>
                </select>
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01ORDDBK" size="2" maxlength="2" value="<%= invTrade.getE01ORDDBK()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01ORDDBR" size="3" maxlength="3" value="<%= invTrade.getE01ORDDBR()%>"
                oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E01ORDDBK.value,'','','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01ORDDCY" size="3" maxlength="3" value="<%= invTrade.getE01ORDDCY()%>"
                oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E01ORDDBK.value,'','','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01ORDDGL" size="15" maxlength="13" value="<%= invTrade.getE01ORDDGL()%>"
				oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01ORDDBK.value,document.forms[0].E01ORDDCY.value,'','','')"  >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01ORDDAC" size="12" maxlength="9" value="<%= invTrade.getE01ORDDAC()%>"
                oncontextmenu="showPopUp(accountHelp,this.name,document.forms[0].E01ORDDBK.value,'','','','RT')" >
              </div>
            </td>
            <td nowrap > 
              <div align="center">
                <input type="text" name="E01ORDDCC" size="12" maxlength="9" value="<%= invTrade.getE01ORDDCC()%>"
				oncontextmenu="showPopUp(costcenterHelp,this.name,document.forms[0].E01ORDDBK.value,'','','','')">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap colspan="8" > 
              <div align="left"><b>Broker Payment Account</b></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right"><img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" width="32" height="32"  > 
                Account :</div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <select name="E01ORDBPT">
                  <option value="1" <%if (invTrade.getE01ORDBPT().equals("1")) { out.print("selected"); }%>>Retail 
                  Account</option>
                  <option value="2" <%if (invTrade.getE01ORDBPT().equals("2")) {  out.print("selected"); }%>>Official 
                  Check</option>
                  <option value="3" <%if (invTrade.getE01ORDBPT().equals("3")) { out.print("selected"); }%>>G/L 
                  Account</option>
                  <option value="4" <%if (invTrade.getE01ORDBPT().equals("4")) {  out.print("selected"); }%>>Fed 
                  Transfer</option>
                  <option value="5" <%if (invTrade.getE01ORDBPT().equals("5")) { out.print("selected"); }%>>Telex 
                  Transfer</option>
                  <option value="6" <%if (invTrade.getE01ORDBPT().equals("6")) {  out.print("selected"); }%>>Swift 
                  Format MT_103</option>
                  <option value="7" <%if (invTrade.getE01ORDBPT().equals("7")) { out.print("selected"); }%>>Swift 
                  Format MT-200</option>
                  <option value="8" <%if (invTrade.getE01ORDBPT().equals("8")) {  out.print("selected"); }%>>Swift 
                  Format MT-202</option>
                </select>
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01ORDBBK" size="2" maxlength="2" value="<%= invTrade.getE01ORDBBK()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01ORDBBR" size="3" maxlength="3" value="<%= invTrade.getE01ORDBBR()%>"
                oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E01ORDBBK.value,'','','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01ORDBCY" size="3" maxlength="3" value="<%= invTrade.getE01ORDBCY()%>"
                oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E01ORDBBK.value,'','','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01ORDBGL" size="15" maxlength="13" value="<%= invTrade.getE01ORDBGL()%>"
				oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01ORDBBK.value,document.forms[0].E01ORDBCY.value,'','','')"  >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01ORDBAC" size="12" maxlength="9" value="<%= invTrade.getE01ORDBAC()%>"
                oncontextmenu="showPopUp(accountHelp,this.name,document.forms[0].E01ORDBBK.value,'','','','RT')" >
              </div>
            </td>
            <td nowrap > 
              <div align="center">
                <input type="text" name="E01ORDBCC" size="12" maxlength="9" value="<%= invTrade.getE01ORDBCC()%>"
				oncontextmenu="showPopUp(costcenterHelp,this.name,document.forms[0].E01ORDBBK.value,'','','','')">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Payment Via :</div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <select name="E01ORDBVI">
                  <option value="N" <%if (invTrade.getE01ORDBVI().equals("N")) { out.print("selected"); }%>>None</option>
                  <option value="A" <%if (invTrade.getE01ORDBVI().equals("A")) { out.print("selected"); }%>>Retail 
                  Account</option>
				  <option value="C" <%if (invTrade.getE01ORDBVI().equals("C")) { out.print("selected"); }%>>Official Check</option>
                  <option value="G" <%if (invTrade.getE01ORDBVI().equals("G")) { out.print("selected"); }%>>G/L 
                  Account</option>
                  <option value="F" <%if (invTrade.getE01ORDBVI().equals("F")) {  out.print("selected"); }%>>Fed 
                  Transfer</option>
                  <option value="T" <%if (invTrade.getE01ORDBVI().equals("T")) { out.print("selected"); }%>>Telex 
                  Transfer</option>
                  <option value="1" <%if (invTrade.getE01ORDBVI().equals("1")) {  out.print("selected"); }%>>Swift 
                  Format MT-103</option>
                  <option value="2" <%if (invTrade.getE01ORDBVI().equals("2")) { out.print("selected"); }%>>Swift 
                  Format MT-200</option>
                  <option value="3" <%if (invTrade.getE01ORDBVI().equals("3")) {  out.print("selected"); }%>>Swift 
                  Format MT-202</option>
                </select>
              </div>
            </td>
            <td nowrap >&nbsp;</td>
            <td nowrap >&nbsp;</td>
            <td nowrap >&nbsp;</td>
            <td nowrap >&nbsp;</td>
            <td nowrap >&nbsp;</td>
            <td nowrap >&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Additional Information </h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Maximum Collateral % :</div>
            </td>
            <td nowrap width="36%" >              
                <input type="text" name="E01ORDMXC" size="11" maxlength="11" value="<%= invTrade.getE01ORDMXC()%>" >
            </td>
           </tr>
           <tr id="trclear"> 
            <td nowrap width="14%" > 
              <div align="right">Trade Confirmation Via :</div>
            </td>
            <td nowrap width="33%" >                
                <select name="E01ORDCNF">
                  <option value="N" <%if (invTrade.getE01ORDCNF().equals("N")) { out.print("selected"); }%>>None</option>
                  <option value="E" <%if (invTrade.getE01ORDCNF().equals("E")) { out.print("selected"); }%>>e-Mail</option>
                  <option value="F" <%if (invTrade.getE01ORDCNF().equals("F")) { out.print("selected"); }%>>Fax</option>
                  <option value="P" <%if (invTrade.getE01ORDCNF().equals("P")) { out.print("selected"); }%>>Printer</option>
                </select>
              
            </td>            
          </tr>
          
          <tr id="trdark"> 
            <td nowrap width="29%" > 
              <div align="right">Minimum Sale Price :</div>
            </td>
            <td nowrap width="71%" > 
              <input type="text" name="E01ORDMIP" size="17" maxlength="15" value="<%= invTrade.getE01ORDMIP()%>" disabled>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%" > 
              <div align="right">Maximum Purchase Price :</div>
            </td>
            <td nowrap width="71%"> 
              <input type="text" name="E01ORDMXP" size="17" maxlength="15" value="<%= invTrade.getE01ORDMXP()%>" disabled>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="29%"> 
              <div align="right"> Order Notes :</div>
            </td>
            <td nowrap width="71%" > 
              <input type="text" name="E01ORDCO1" size="40" maxlength="35" value="<%= invTrade.getE01ORDCO1()%>" disabled>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="71%"> 
              
              <div align="left"> 
                <input type="text" name="E01ORDCO2" size="40" maxlength="35" value="<%= invTrade.getE01ORDCO2()%>" disabled>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="29%"> 
              <div align="right"> </div>
            </td>
            <td nowrap width="71%"> 
              <input type="text" name="E01ORDCO3" size="40" maxlength="35" value="<%= invTrade.getE01ORDCO3()%>" disabled>
            </td>
          </tr>
          
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Trade Ticket Notes :</div>
            </td>
            <td nowrap colspan="3" >
              <input type="text" name="E01ORDTC1" size="35" maxlength="30" value="<%= invTrade.getE01ORDTC1()%>" disabled>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right"></div>
            </td>
            <td nowrap colspan="3" >
              <input type="text" name="E01ORDTC2" size="35" maxlength="30" value="<%= invTrade.getE01ORDTC2()%>" disabled>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right"></div>
            </td>
            <td nowrap colspan="3" >
              <input type="text" name="E01ORDTC3" size="35" maxlength="30" value="<%= invTrade.getE01ORDTC3()%>" disabled>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Back Office Notes :</div>
            </td>
            <td nowrap colspan="3" > 
              <input type="text" name="E01ORDBC1" size="35" maxlength="30" value="<%= invTrade.getE01ORDBC1()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right"></div>
            </td>
            <td nowrap colspan="3" > 
              <input type="text" name="E01ORDBC2" size="35" maxlength="30" value="<%= invTrade.getE01ORDBC2()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right"></div>
            </td>
            <td nowrap colspan="3" > 
              <input type="text" name="E01ORDBC3" size="35" maxlength="30" value="<%= invTrade.getE01ORDBC3()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Reject Information </h4>
  <table  class="tableinfo">
    <tr >
     <td nowrap> 
       <table cellpadding=2 cellspacing=0 width="100%" border="0">
    	<tr id="trdark">            
      	 	<td nowrap width="5%" >
        	  <div align="center"><b>Reason  :</b></div>
       	 	</td>
       	 	<td nowrap width="60%" >
       	 	  <div align="left"></div> 
          	  <input type="text" name="E01REJDS1" disabled size="60" maxlength="65" value="<%= invTrade.getE01REJDS1() %>">           
       	 	</td>
     	</tr> 
       
     	<tr id="trdark">            
       		<td nowrap width="5%" >
          		<div align="left"><b>       </b></div>
       		</td>
       		<td nowrap width="60%" >
       	  		<div align="left"></div> 
          		<input type="text" name="E01REJDS2" disabled size="60" maxlength="65" value="<%= invTrade.getE01REJDS2() %>">           
       		</td>
     	</tr> 
       
     	<tr id="trdark">            
       		<td nowrap width="5%" >
          		<div align="left"><b>       </b></div>
       		</td>
       		<td nowrap width="60%" >
       	  		<div align="left"></div> 
          		<input type="text" name="E01REJDS3" disabled size="60" maxlength="65" value="<%= invTrade.getE01REJDS3() %>">           
       		</td>
     	</tr> 
       
     	<tr id="trdark">            
       		<td nowrap width="5%" >
          		<div align="left"><b>       </b></div>
       		</td>
       		<td nowrap width="60%" >
       	  		<div align="left"></div> 
          		<input type="text" name="E01REJDS4" disabled size="60" maxlength="65" value="<%= invTrade.getE01REJDS4() %>">           
       		</td>
     	</tr> 
       
      	<tr id="trdark">            
       		<td nowrap width="5%" >
          		<div align="left"><b>       </b></div>
       		</td>
       		<td nowrap width="60%" >
       	  		<div align="left"></div> 
          		<input type="text" name="E01REJDS5" disabled size="60" maxlength="65" value="<%= invTrade.getE01REJDS5() %>">           
       		</td>
     	</tr> 
     	
    	<tr id="trdark">            
      	 	<td nowrap width="5%" >
        	  <div align="center"><b>Rejected By  :</b></div>
       	 	</td>
       	 	<td nowrap width="60%" >
       	 	  <div align="left"></div> 
          	  <input type="text" name="E01REJUSR" disabled size="15" maxlength="15" value="<%= invTrade.getE01REJUSR() %>">           
       	 	</td>
     	</tr> 
     	
       </table>
      </td>              
    </tr>
  </table> 
     
  
  <br>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF">
      <td width="38%">
        <div align="right">Mark for Deletion</div>
      </td>
      <td width="21%"> 
        <div align="left"> 
          <input type="radio" name="E01ORDDLT" value="Y" onClick="document.forms[0].E01ORDDLT.value='Y'"
			  <%if(invTrade.getE01ORDDLT().equals("Y")) out.print("checked");%>>
          Yes 
          <input type="radio" name="E01ORDDLT" value="" onClick="document.forms[0].E01ORDDLT.value=''"
			  <%if(invTrade.getE01ORDDLT().equals("")) out.print("checked");%>>
          No</div>
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
