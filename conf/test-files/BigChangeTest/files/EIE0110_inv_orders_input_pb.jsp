
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
<SCRIPT language="Javascript">

   builtHPopUp();

  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }

   // Enable or disable E01ORDFL9, Custody Fee Rate field, according to 
   // Transaction Type, E01ORDTRN.
  function enableCustFeeRate(){
    var trxTypeElem = document.getElementById ("E01ORDTRN");
    var CustFeeRateElem = document.getElementById("E01ORDCFR");
    
    if (trxTypeElem.value == '1' || trxTypeElem.value == '2' || trxTypeElem.value =='3')
      CustFeeRateElem.disabled=false;
    else
      CustFeeRateElem.disabled=true;  
      
    return;   
   
      
  }


</SCRIPT>

<SCRIPT language="Javascript">

 function Calculate() {
  document.forms[0].SCREEN.value = "16";
  document.forms[0].submit();
  }

function checkDeletion() {
  if(document.forms[0].E01ORDDLT.value.trim().equals("")){ 
  document.forms[0].E01ORDDLT.value = 'Y';
  }
  if(document.forms[0].E01ORDDLT.value.equals("Y")){
  document.forms[0].E01ORDDLT.value = '';
  }
}  		
 
function recInterest(){
  if(document.forms[0].H01FLGWK3.value == 'Y'){
    document.forms[0].H01FLGWK3.value = '';
  }
  else {
    document.forms[0].H01FLGWK3.value = 'Y';
  }
  }
  
function recComm(){
  
  if(document.forms[0].H01FLGWK1.value == 'Y'){
    document.forms[0].H01FLGWK1.value = '';
  }
  else {
    document.forms[0].H01FLGWK1.value = 'Y';
  }
  }

</SCRIPT>
</head>
<body>
<INPUT TYPE=HIDDEN NAME="TYPEINQ" VALUE="A">
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }


%>
<div align="center"> 
  <h3>Private Banking - Trade  Input<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="inv_orders_input_pb.jsp,EIE0110"> 
  </h3>
</div>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0110" >
  <input type="hidden" name="SCREEN" value="2">
  <input type="hidden" name="LEVELNUM" value="1">
  <h4>Basic Information </h4>
  <table border="0">
    <tr>
      <td>
        <div align="right">Order Number :</div>
      </td>
      <td> 
        <div align="left">
          <input type="text" name="E01ORDNUM" size="9" maxlength="5" value="<%= invTrade.getE01ORDNUM()%>" readonly>
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
   		 <% //          <div align="right"><a href="javascript:showCustomerInq(document.forms[0].E01ORDCUN.value)"> 
      		 //         Customer </a>:</div> %>
           		 </td>
           	 <td nowrap > 
              <input type="hidden" name="E01ORDCUN" size="9" maxlength="9" value="<%= invTrade.getE01ORDCUN().trim()%>">               
          	  </td>
          </tr>
      	<td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Portfolio :</div>
            </td>
            <td nowrap colspan="2" > 
              <div align="left"> 
                <input type="text" name="E01ORDPRF" size="9" maxlength="9" value="<%= invTrade.getE01ORDPRF()%>" >
                <INPUT type="text" name="E01ORDCTN" size="35" maxlength="35" disabled value="<%= invTrade.getE01ORDCTN().trim()%>">
                <a href="javascript:GetPortfolioDescIdInvest('E01ORDPRF','E01ORDCTN','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absbottom" border="0" ></a> 
                <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  > 
              </div>
            </td>
	       <td nowrap colspan="2" ><a href="javascript:GetInvestmentsByCustomer(document.forms[0].E01ORDCUN.value,'E01ORDPRF','E01ORDIIC','E01ORDICN','E01ORDSCY','E01ORDCUC','E01ORDCCN','E01ORDPTY','E01ORDVNO','E01ORDQTY','E01ORDCSP','E01ORDSYM','E01ORDISI','E01ORDATY','E01ORDLP1','E01ORDLP2','E01ORDLP3')"> 
        	    Investments by Customer<img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absbottom" border="0" ></a> 
    	    </td>                 
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right"><a href="javascript:showRetAccountInq(document.forms[0].E01ORDHAC.value)"><img src="<%=request.getContextPath()%>/images/aquire.gif" alt="help" align="absbottom" border="0" > 
                Cash Account: </a></div>
            </td>
            <td nowrap colspan="3" > 
              <input type="text" name="E01ORDHCY" size="3" maxlength="3" value="<%= invTrade.getE01ORDHCY()%>"
                readonly >
              <input type="text" name="E01ORDHAC" size="12" maxlength="9" value="<%= invTrade.getE01ORDHAC()%>"
                >
              <a href="javascript:GetCashAccount('E01ORDHCY','E01ORDHAC','E01MEMBAL',document.forms[0].E01ORDCUN.value,document.forms[0].E01ORDPRF.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0"  ></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  > 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Available Balance :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" name="E01MEMBAL" size="17" maxlength="16" value="<%= invTrade.getE01MEMBAL()%>"
				onKeyPress="enterDecimal()" disabled>
            </td>
              
            <td nowrap width="14%" > 
              <div align="right">Balance in Inst. Currency :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" name="E01CNVBAL" size="17" maxlength="16" value="<%= invTrade.getE01CNVBAL()%>"
				onKeyPress="enterDecimal()" disabled>
            </td>
           
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Exchange Rate : </div>
            </td>
            <td nowrap colspan="3" > 
              <input type="text" name="E01ORDEXR" size="11" maxlength="11" value="<%= invTrade.getE01ORDEXR()%>" onkeypress="enterDecimal()">              
            </td>           
            <td nowrap width="17%" > 
            </td>
            <td nowrap colspan="3" > 
            </td>
          </tr>
          
        </table>
      </td>
     
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
              <select name="E01ORDPTY">
                <option value="BND" <%if (invTrade.getE01ORDPTY().equals("BND")) { out.print("selected"); }%>>Bonds</option>
                <option value="EQT" <%if (invTrade.getE01ORDPTY().equals("EQT")) {  out.print("selected"); }%>>Equity</option>
                <option value="MUT" <%if (invTrade.getE01ORDPTY().equals("MUT")) {  out.print("selected"); }%>>Mutual 
                Funds</option>
                <option value="PFS" <%if (invTrade.getE01ORDPTY().equals("PFS")) {  out.print("selected"); }%>>Preferred 
                Stocks</option>
                <option value="ACD" <%if (invTrade.getE01ORDPTY().equals("ACD")) { out.print("selected"); }%>>Commodities</option>
              </select>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  > 
            </td>
            <td nowrap colspan="2" >&nbsp;</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right"><a href="javascript:showInstrumentInq(document.forms[0].E01ORDIIC.value)"><img src="<%=request.getContextPath()%>/images/aquire.gif" alt="help" align="absbottom" border="0" > 
                Instrument </a> :</div>
            </td>
            <td nowrap colspan="3" > 
              <input type="text" name="E01ORDIIC" size="9" maxlength="9" value="<%= invTrade.getE01ORDIIC()%>" >
              <input type="text" name="E01ORDICN" size="35" maxlength="30" value="<%= invTrade.getE01ORDICN()%>">
              <a href="javascript:GetInstrumentParams('E01ORDIIC','E01ORDICN','E01ORDSCY','E01ORDSYM','E01ORDISI','E01ORDCSP','E01ORDPTY')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0"></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  > 
               Pool Factor : <INPUT type="text" disabled name="E01ORDFL7" size="17" maxlength="16"
					value="<%= invTrade.getE01ORDFL7()%>">
              
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Instrument Currency :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" name="E01ORDSCY" size="4" maxlength="3" value="<%= invTrade.getE01ORDSCY()%>"disabled>
            Symbol : <INPUT type="text" name="E01ORDSYM" size="16"
					maxlength="15" value="<%= invTrade.getE01ORDSYM()%>" disabled></td>
            <td nowrap width="14%" > 
              <div align="right">ISIN : </div>
            </td>
            <td nowrap width="33%" >
              <input type="text" name="E01ORDISI" size="16" maxlength="12" value="<%= invTrade.getE01ORDISI()%>"disabled></td>
          </tr>
		  
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Last Interest Paid Date :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" name="E01ORDLP1" size="3" maxlength="2" value="<%= invTrade.getE01ORDLP1()%>" disabled>
              <input type="text" name="E01ORDLP2" size="3" maxlength="2" value="<%= invTrade.getE01ORDLP2()%>" disabled>
              <input type="text" name="E01ORDLP3" size="3" maxlength="2" value="<%= invTrade.getE01ORDLP3()%>" disabled>
            </td>
            <td nowrap width="14%" > 
              <div align="right">CUSIP :</div>
            </td>
            <td nowrap width="33%" >
              <input type="text" name="E01ORDCSP" size="16" maxlength="12" value="<%= invTrade.getE01ORDCSP()%>"disabled>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Accrual Type :</div>
            </td>
            <td nowrap width="36%" > 
              <select  name="E01ORDATY">
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
            <td nowrap colspan="3" > 
              <div align="left">              
               
                                
              
                <%if (invTrade.getE01ORDTYP().equals("P")) {%> 
                  <select <%if (!invTrade.getE01ORDLVL().equals("1")){%> disabled <%}%> name="E01ORDTRN" onchange="enableCustFeeRate();">
                    <option value=" " <%if (!(invTrade.getE01ORDTRN().equals("1")||invTrade.getE01ORDTRN().equals("2")||invTrade.getE01ORDTRN().equals("3")||invTrade.getE01ORDTRN().equals("4")||invTrade.getE01ORDTRN().equals("5")||invTrade.getE01ORDTRN().equals("6"))) out.print("selected"); %>></option>
                  	<option value="1" <%if (invTrade.getE01ORDTRN().equals("1")) {  out.print("selected"); }%>>Purchase</option>
                  	<option value="5" <%if (invTrade.getE01ORDTRN().equals("5")) {  out.print("selected"); }%>>Multiple Purchase</option>
                 	<option value="2" <%if (invTrade.getE01ORDTRN().equals("2")) {  out.print("selected"); }%>>Sale</option>
                 	<option value="6" <%if (invTrade.getE01ORDTRN().equals("6")) {  out.print("selected"); }%>>Multiple Sale</option>
                  	<option value="3" <%if (invTrade.getE01ORDTRN().equals("3")) {  out.print("selected"); }%>>Transfer In</option>
                 	<option value="4" <%if (invTrade.getE01ORDTRN().equals("4")) {  out.print("selected"); }%>>Transfer Out</option>
                  </select>
                <%}else if (invTrade.getE01ORDTYP().equals("T")) {%> 
                  <select <%if (!invTrade.getE01ORDLVL().equals("1")){%> disabled <%}%> name="E01ORDTRN" onchange="enableCustFeeRate();">
                    <option value=" " <%if (!(invTrade.getE01ORDTRN().equals("1")||invTrade.getE01ORDTRN().equals("2")||invTrade.getE01ORDTRN().equals("5")||invTrade.getE01ORDTRN().equals("6"))) out.print("selected"); %>></option>
                  	<option value="1" <%if (invTrade.getE01ORDTRN().equals("1")) { out.print("selected"); }%>>Purchase</option>
                  	<option value="5" <%if (invTrade.getE01ORDTRN().equals("5")) {  out.print("selected"); }%>>Multiple Purchase</option>
                 	<option value="2" <%if (invTrade.getE01ORDTRN().equals("2")) {  out.print("selected"); }%>>Sale</option>
                 	<option value="6" <%if (invTrade.getE01ORDTRN().equals("6")) {  out.print("selected"); }%>>Multiple Sale</option>                  	
                  </select>
                <%}else{%>
                 <select <%if (invTrade.getE01ORDOPE().equals("M")){%> disabled <%}%> name="E01ORDTRN" >
                  <option value="9" <%if (invTrade.getE01ORDTRN().equals("9")) { out.print("selected"); }%>>User Not Autorized</option>                  	                	
                 </select> 
                <%}%>
                 
                
                <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  ></div>
            </td>
          </tr>
			
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Trade Date :</div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E01ORDIN1" size="3" maxlength="2" value="<%= invTrade.getE01ORDIN1()%>">
                <input type="text" name="E01ORDIN2" size="3" maxlength="2" value="<%= invTrade.getE01ORDIN2()%>">
                <input type="text" name="E01ORDIN3" size="3" maxlength="2" value="<%= invTrade.getE01ORDIN3()%>">
                <a href="javascript:DatePicker(document.forms[0].E01ORDIN1,document.forms[0].E01ORDIN2,document.forms[0].E01ORDIN3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
                <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  > 
              </div>
            </td>
          </tr> 
          
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Settlement Date : </div>
            </td>
            <td nowrap colspan="3" > 
              <input type="text" name="E01ORDST1" size="3" maxlength="2" value="<%= invTrade.getE01ORDST1()%>">
              <input type="text" name="E01ORDST2" size="3" maxlength="2" value="<%= invTrade.getE01ORDST2()%>">
              <input type="text" name="E01ORDST3" size="3" maxlength="2" value="<%= invTrade.getE01ORDST3()%>">
              <a href="javascript:DatePicker(document.forms[0].E01ORDST1,document.forms[0].E01ORDST2,document.forms[0].E01ORDST3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  > 
            </td>
          </tr>
           <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Delivery Date : </div>
            </td>
            <td nowrap colspan="3" > 
              <input type="text" name="E01ORDF15A" size="3" maxlength="2" value="<%= invTrade.getE01ORDF15A()%>">
              <input type="text" name="E01ORDF15B" size="3" maxlength="2" value="<%= invTrade.getE01ORDF15B()%>">
              <input type="text" name="E01ORDF15C" size="3" maxlength="2" value="<%= invTrade.getE01ORDF15C()%>">
              <A	href="javascript:DatePicker(document.forms[0].E01ORDF15A,document.forms[0].E01ORDF15B,document.forms[0].E01ORDF15C)"><IMG
					src="<%=request.getContextPath()%>/images/calendar.gif" alt="help"
					align="absmiddle" border="0"></A><a href="javascript:DatePicker(document.forms[0].E01ORDF15A,document.forms[0].E01ORDF15B,document.forms[0].E01ORDF15C)"></a> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Nominal Value :</div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E01ORDVNO" size="17" maxlength="16" value="<%= invTrade.getE01ORDVNO()%>" onkeypress="enterDecimal()">
                
                <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  > 
             </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Quantity : </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E01ORDQTY" size="17" maxlength="16" value="<%= invTrade.getE01ORDQTY()%>" onkeypress="enterDecimal()">
                <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  > 
              of <%= invTrade.getD01MEASUR()%></div>
            </td>
          </tr>
           
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Customer Price :</div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E01ORDPRC" size="17" maxlength="15" value="<%= invTrade.getE01ORDPRC()%>" onKeyPress="enterDecimal()">
                <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  > 
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="17%" >
              <div align="right"><b>Investment Amount :</b></div>
            </td>
            <td nowrap width="36%" >
              <input type="text" name="E01ORDIAM" size="17" maxlength="15" value="<%= invTrade.getE01ORDIAM()%>" disabled>
            </td>
            <td nowrap width="14%" >&nbsp;</td>
            <td nowrap width="33%" >&nbsp;</td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Accrued Interest :</div>
            </td>
            <td nowrap width="36%" > 
              <div align="left"> 
                <input type="text" name="E01ORDIAL" size="17" maxlength="15" value="<%= invTrade.getE01ORDIAL()%>" onKeyPress="enterDecimal()">
                <input type="hidden" name="H01FLGWK3"  value="<%= invTrade.getH01FLGWK3()%>" >
                Recalculate : 
                <input type="radio" name="CH01FLGWK3" value="Y" onClick="document.forms[0].H01FLGWK3.value='Y'"
			  <%if(invTrade.getH01FLGWK3().equals("Y") || invTrade.getH01FLGWK3().equals("")) out.print("checked");%>>
                Yes 
                <input type="radio" name="CH01FLGWK3" value="" onClick="document.forms[0].H01FLGWK3.value='N'"
			  <%if(invTrade.getH01FLGWK3().equals("N")) out.print("checked");%>>
                No </div>
                 
            </td>
            <td nowrap width="14%" > 
              <div align="right">Accrued Days :</div>
            </td>
            <td nowrap width="33%" > 
              <div align="left"> 
                <input type="text" name="E01ORDDYS" size="4" maxlength="3" value="<%= invTrade.getE01ORDDYS()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap colspan="4" ><b>Commissions</b></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Trade Commissions :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" name="E01ORDOCV" size="17" maxlength="15" value="<%= invTrade.getE01ORDOCV()%>" onKeyPress="enterDecimal()">
              <input type="hidden" name="H01FLGWK1"  value="<%= invTrade.getH01FLGWK1()%>" >
             Recalculate : 
              <input type="radio" name="CH01FLGWK1" value="Y" onClick="document.forms[0].H01FLGWK1.value='Y'"
			  <%if(invTrade.getH01FLGWK1().equals("Y")) out.print("checked");%>>
              Yes 
              <input type="radio" name="CH01FLGWK1" value="" onClick="document.forms[0].H01FLGWK1.value=''"
			  <%if(invTrade.getH01FLGWK1().equals("")) out.print("checked");%>>
              No </td>
               
            <td nowrap width="14%" > 
              <div align="right">Trade Comm. Table :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" name="E01ORDOCT" size="4" maxlength="2" value="<%= invTrade.getE01ORDOCT()%>">
              <a href="javascript:GetCommCustodyTable('E01ORDOCT',document.forms[0].E01ORDPTY.value,'','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0"></a> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Profit Commissions :</div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E01ORDTGV" size="17" maxlength="15" value="<%= invTrade.getE01ORDTGV()%>" disabled>
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="17%" > 
              <div align="right">Custody Fee :</div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E01ORDFL9" size="17" maxlength="15" value="<%= invTrade.getE01ORDFL9()%>" disabled>
              </div>
            </td>          
          </tr>
			<TR id="trclear">
						<TD nowrap width="17%" align="right">Custody Fee Rate :</TD>
						<TD nowrap colspan="3">
						<INPUT type="text" name="E01ORDCFR"
							size="17" maxlength="15" value="<%= invTrade.getE01ORDCFR()%>"
							onkeypress="enterDecimal()" <%= !invTrade.getE01ORDTRN().equals("1") ?"disabled":""%>>
						%</TD>
			</TR>
			<TR id="trdark">
						<TD nowrap width="17%" align="right">Broker Fee Amount :</TD>
						<TD nowrap colspan="3">
						<INPUT type="text" name="E01ORDF11"
							size="17" maxlength="15" value="<%= invTrade.getE01ORDF11()%>"
							onkeypress="enterDecimal()" disabled>
						</TD>
			</TR>
					
			<tr id="trclear"> 

            <td nowrap colspan="4" > 
              <div align="left"><b>Withholding Information</b></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right"> Tax Withholding :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" disabled name="E01ORDWH1" size="17" maxlength="15" value="<%= invTrade.getE01ORDWH1()%>" onKeyPress="enterDecimal()"></td>
            <td nowrap width="14%" > 
              <div align="right">Tax Rate :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" name="E01ORDFL8" size="10" maxlength="9" value="<%= invTrade.getE01ORDFL8()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right"> </div>
            </td>
            <td nowrap width="36%" > 
            <td nowrap width="14%" > 
              <div align="right">Exemption Code :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" name="E01ORDF6C" size="6" maxlength="6" value="<%= invTrade.getE01ORDF6C()%>">
              <A href="javascript:GetSpecUsrTab('E01ORDF6C','12')"><IMG
					src="<%=request.getContextPath()%>/images/1b.gif" alt="help"
					align="absmiddle" border="0"></A>
            </td>
          </tr>
          <tr id="trdark"> 

            <td nowrap colspan="4" > 
              <div align="left"><b>Totals</b></div>
            </td>
          </tr>
           
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Customer Transaction Amount :</div>
            </td>
            <td nowrap colspan="3" > 
              <input type="text" name="E01ORDTVL" size="17" maxlength="15" value="<%= invTrade.getE01ORDTVL()%>" onKeyPress="enterDecimal()" disabled>
              <a href="javascript:Calculate()"> <img src="<%=request.getContextPath()%>/images/calculator.gif" alt="calculator" align="absmiddle" border="0" > 
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
                <img src="<%=request.getContextPath()%>/images/aquire.gif" alt="help" align="absbottom" border="0" > 
                Balance in <%= invTrade.getE01ORDHCY()%> : </a> </div>
            </td>
            <td nowrap colspan="3" > 
              <input type="text" name="E01FUTBAL" size="17" maxlength="15" value="<%= invTrade.getE01FUTBAL()%>" onKeyPress="enterDecimal()" disabled>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Balance in <%= invTrade.getE01ORDSCY()%> :</div>
            </td>
            <td nowrap colspan="3" > 
              <input type="text" name="E01CNVFUB" size="17" maxlength="15" value="<%= invTrade.getE01CNVFUB()%>" onKeyPress="enterDecimal()" disabled>
            </td>
          </tr>
          
        </table>
      </td>
    </tr>
  </table>
  
  
    <h4>Adicional Information 
     </h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="29%" > 
              <div align="right">Minimum Sale Price :</div>
            </td>
            <td nowrap width="71%" > 
              <input type="text" name="E01ORDMIP" size="17" maxlength="15" value="<%= invTrade.getE01ORDMIP()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%" > 
              <div align="right">Maximum Purchase Price :</div>
            </td>
            <td nowrap width="71%"> 
              <input type="text" name="E01ORDMXP" size="17" maxlength="15" value="<%= invTrade.getE01ORDMXP()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap colspan="4" >&nbsp;</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right"> Orders Notes :</div>
            </td>
            <td nowrap colspan="3" > 
              <input type="text" name="E01ORDCO1" size="35" maxlength="30" value="<%= invTrade.getE01ORDCO1()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" >&nbsp;</td>
            <td nowrap colspan="3" > 
              <input type="text" name="E01ORDCO2" size="35" maxlength="30" value="<%= invTrade.getE01ORDCO2()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" >&nbsp;</td>
            <td nowrap colspan="3" > 
              <input type="text" name="E01ORDCO3" size="35" maxlength="30" value="<%= invTrade.getE01ORDCO3()%>" >
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
      <td width="38%">&nbsp;</td>
      <td width="21%"> 
        <div align="left">
          <input type="checkbox" name="E01ORDDLT" <% if(invTrade.getE01ORDDLT().equals("Y")){ out.print("checked");} %> onClick="javascript:checkDeletion()">
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
