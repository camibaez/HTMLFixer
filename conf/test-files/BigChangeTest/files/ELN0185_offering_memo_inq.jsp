<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Offering Memorandum</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="msgOff" class="datapro.eibs.beans.ELN018501Message" scope="session"/>
<jsp:useBean id="error" class= "datapro.eibs.beans.ELEERRMessage" scope="session"/>
<jsp:useBean id="userPO" class= "datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class= "datapro.eibs.beans.ESS0030DSMessage" scope="session" />

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

<body>
<%
 String READ_ONLY_TAG;
 String DISABLED_TAG;

 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
 if (userPO.getPurpose().equals("MAINTENANCE")) {
 	READ_ONLY_TAG = "readonly";
 	DISABLED_TAG = "disabled";
 }
 else {
 	READ_ONLY_TAG = "";
 	DISABLED_TAG = "";
 }

%>
<h3 align="center">Offering Memorandum<br>Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="offering_memo_maint.jsp, ELN0185"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.credit.JSELN0185" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
  <input type=hidden name="E01OFFCMD" value="<%= msgOff.getE01OFFCMD() %>">
  <h4>Basic Information</h4>
  <table class="tableinfo">
    <tr>
      <td nowrap>
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="24%" >
            	<div align="right">Offering Number :</div>
            </td>
            <td nowrap width="24%" >
        		<input type="text" name="E01OFFNUM" size="10" maxlength="9" value="<%= msgOff.getE01OFFNUM() %>" onKeyPress="enterInteger()" readonly> 
            </td>
            <td nowrap width="24%" >
            	<div align="right">Customer :</div>
            </td>
            <td nowrap width="28%" >
        		<input type="text" name="E01CUSCUN" size="10" maxlength="9" value="<%= msgOff.getE01CUSCUN() %>" onKeyPress="enterInteger()" readonly> 
        		<input type="text" name="E01CUSNA1" size="46" maxlength="45" value="<%= msgOff.getE01CUSNA1() %>" readonly> 
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="24%" >
            	<div align="right">Line of Credit Number :</div>
            </td>
            <td nowrap width="24%" >
		    	<input type="text" name="E01OFFLNN" size="14" maxlength="13" value="<%= msgOff.getE01OFFLNN() %>" onKeyPress="enterInteger()" readonly> 
			</td>
            <td nowrap width="24%" >
            	<div align="right">Transaction Type :</div>
            </td>
            <td nowrap width="28%" >
				<input type="text" name="E01OFFOTY" size="5" maxlength="4" value="<%= msgOff.getE01OFFOTY() %>" readonly> 
			</td>
          </tr>
          <tr id="trdark">
            <td nowrap width="24%" >
            	<div align="right">Transaction Currency :</div>
            </td>
            <td nowrap width="24%" >
				<input type="text" name="E01OFFCCY" size="4" maxlength="3" value="<%= msgOff.getE01OFFCCY() %>" readonly> 
            </td>
            <td nowrap width="24%" >
            	<div align="right">Transaction Amount :</div>
            </td>
            <td nowrap width="28%" >
				<input type="text" name="E01OFFAMT" size="20" maxlength="19" value="<%= msgOff.getE01OFFAMT() %>" onKeyPress="enterDecimal()" readonly> 
				<input type="text" name="E01TRAEQV" size="20" maxlength="19" value="<%= msgOff.getE01TRAEQV() %>" onKeyPress="enterDecimal()" readonly> 
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="24%" >
            	<div align="right">Offering Date :</div>
            </td>
            <td nowrap width="28%" >
				<input type="text" name="E01RUNDT1" size="3" maxlength="2" value="<%= msgOff.getE01RUNDT1() %>" onKeyPress="enterInteger()"> 
				<input type="text" name="E01RUNDT2" size="3" maxlength="2" value="<%= msgOff.getE01RUNDT2() %>" onKeyPress="enterInteger()"> 
				<input type="text" name="E01RUNDT3" size="3" maxlength="2" value="<%= msgOff.getE01RUNDT3() %>" onKeyPress="enterInteger()"> 
            </td>
            <td nowrap width="24%" >
            	<div align="right">Offering Expiration Date :</div>
            </td>
            <td nowrap width="24%" >
				<input type="text" name="E01EXPDT1" size="3" maxlength="2" value="<%= msgOff.getE01EXPDT1() %>" onKeyPress="enterInteger()"> 
				<input type="text" name="E01EXPDR2" size="3" maxlength="2" value="<%= msgOff.getE01EXPDR2() %>" onKeyPress="enterInteger()"> 
				<input type="text" name="E01EXPDT3" size="3" maxlength="2" value="<%= msgOff.getE01EXPDT3() %>" onKeyPress="enterInteger()"> 
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="24%" >
            	<div align="right">Original Amount :</div>
            </td>
            <td nowrap width="28%" >
				<input type="text" name="E01OFFLAA" size="20" maxlength="19" value="<%= msgOff.getE01OFFLAA() %>" onKeyPress="enterDecimal()" readonly> 
            </td>
            <td nowrap width="24%" >
            	<div align="right">Lending Limit :</div>
            </td>
            <td nowrap width="24%" >
				<input type="text" name="E01OFFLLM" size="20" maxlength="19" value="<%= msgOff.getE01OFFLLM() %>" onKeyPress="enterDecimal()" readonly> 
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="24%" >
            	<div align="right">Used Amount :</div>
            </td>
            <td nowrap width="28%" >
				<input type="text" name="E01OFFLUS" size="20" maxlength="19" value="<%= msgOff.getE01OFFLUS() %>" onKeyPress="enterDecimal()" readonly> 
            </td>
            <td nowrap width="24%" >
            	<div align="right">Pending for Approval :</div>
            </td>
            <td nowrap width="24%" >
				<input type="text" name="E01OFFAPE" size="20" maxlength="19" value="<%= msgOff.getE01OFFAPE() %>" onKeyPress="enterDecimal()" readonly> 
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="24%" >
            	<div align="right">Available Amount :</div>
            </td>
            <td nowrap width="28%" >
				<input type="text" name="E01OFFAMA" size="20" maxlength="19" value="<%= msgOff.getE01OFFAMA() %>" onKeyPress="enterDecimal()" readonly> 
            </td>
            <td nowrap width="24%" >
            </td>
            <td nowrap width="24%" >
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="24%" >
            	<div align="right">Remarks :</div>
            </td>
            <td nowrap width="28%" colspan="3">
				<input type="text" name="E01OFFCR1" size="66" maxlength="65" value="<%= msgOff.getE01OFFCR1() %>" readonly><br>
				<input type="text" name="E01OFFCR2" size="66" maxlength="65" value="<%= msgOff.getE01OFFCR2() %>" readonly><br>
				<input type="text" name="E01OFFCR3" size="66" maxlength="65" value="<%= msgOff.getE01OFFCR3() %>" readonly><br>
				<input type="text" name="E01OFFCR4" size="66" maxlength="65" value="<%= msgOff.getE01OFFCR4() %>" readonly><br>
				<input type="text" name="E01OFFCR5" size="66" maxlength="65" value="<%= msgOff.getE01OFFCR5() %>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

<% if (msgOff.getE01OFFOTY().equals("LNS")) { %>
  <h4>Loans Information</h4>
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="32%" >
            	<div align="right">Maturity Date :</div>
            </td>
            <td nowrap width="28%" >
            	<input type="text" name="E01OFFCMD1" size="3" maxlength="2" value=""  onkeypress="enterInteger()" readonly>
            	<input type="text" name="E01OFFCMD2" size="3" maxlength="2" value=""  onkeypress="enterInteger()" readonly>
            	<input type="text" name="E01OFFCMD3" size="3" maxlength="2" value=""  onkeypress="enterInteger()" readonly>
            </td>
            <td nowrap width="22%" >
            	<div align="right">Terms :</div>
            </td>
            <td nowrap width="18%" >
            	<input type="text" name="E01OFFLTR" size="4" maxlength="3" value="<%= msgOff.getE01OFFLTR().trim()%>" onkeypress="enterInteger()" readonly>
            	<select name="E01OFFTRC" disabled>
            		<option value=" " <% if (!(msgOff.getE01OFFTRC().equals("D") ||msgOff.getE01OFFTRC().equals("M")||msgOff.getE01OFFTRC().equals("Y"))) out.print("selected"); %>></option>
            		<option value="D" <% if(msgOff.getE01OFFTRC().equals("D")) out.print("selected");%>>Day(s)</option>
            		<option value="M" <% if(msgOff.getE01OFFTRC().equals("M")) out.print("selected");%>>Month(s)</option>
            		<option value="Y" <% if(msgOff.getE01OFFTRC().equals("Y")) out.print("selected");%>>Year(s)</option>
            	</select>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="32%" >
            	<div align="right">Floating Rate Table :</div>
            </td>
            <td nowrap width="28%" >
            	<input type="text" name="E01OFFLFT" size="3" maxlength="2" value="<%= msgOff.getE01OFFLFT().trim()%>" readonly>
            </td>
            <td nowrap width="22%" >
            	<div align="right">Floating Rate Type Code :</div>
            </td>
            <td nowrap width="18%" >
            	<select name="E01OFFLTY" disabled>
            		<option value=" " <% if (!(msgOff.getE01OFFLTY().equals("FP") || msgOff.getE01OFFLTY().equals("FS"))) out.print("selected"); %>></option>
            		<option value="FP" <% if (msgOff.getE01OFFLTY().equals("FP")) out.print("selected"); %>>Primary</option>
            		<option value="FS" <% if (msgOff.getE01OFFLTY().equals("FS")) out.print("selected"); %>>Secondary</option>
           		</select>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="32%" >
            	<div align="right">Base Rate :</div>
            </td>
            <td nowrap width="28%" >
            	<input type="text" name="E01OFFLSP" size="13" maxlength="12" value="<%= msgOff.getE01OFFLSP().trim()%>" onKeypress="enterSignDecimal()" readonly>
            </td>
            <td nowrap width="22%" >
            	<div align="right">Loan Table :</div>
            </td>
            <td nowrap width="18%" >
            	<input type="text" name="E01OFFLTF" size="3" maxlength="2" value="<%= msgOff.getE01OFFLTF().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="32%" >
            	<div align="right">Revision Rate Term :</div>
            </td>
            <td nowrap width="28%" >
            	<input type="text" name="E01OFFLRT" size="4" maxlength="3" value="<%= msgOff.getE01OFFLRT().trim()%>" readonly>
            	<select name="E01OFFLTF" disabled>
            		<option value=" " <% if (!(msgOff.getE01OFFLTF().equals("D") || msgOff.getE01OFFLTF().equals("M") || msgOff.getE01OFFLTF().equals("Y"))) out.print("selected"); %>></option>
            		<option value="D" <% if(msgOff.getE01OFFLTF().equals("D")) out.print("selected");%>>Day(s)</option>
            		<option value="M" <% if(msgOff.getE01OFFLTF().equals("M")) out.print("selected");%>>Month(s)</option>
            		<option value="Y" <% if(msgOff.getE01OFFLTF().equals("Y")) out.print("selected");%>>Year(s)</option>
            	</select>
            </td>
            <td nowrap width="22%" >
            	<div align="right">Basis :</div>
            </td>
            <td nowrap width="18%" >
            	<select name="E01OFFLBA" disabled>
            		<option value="" <% if (!(msgOff.getE01OFFLBA().equals("360") || msgOff.getE01OFFLBA().equals("365") || msgOff.getE01OFFLBA().equals("366"))) out.print("selected"); %>></option>
            		<option value="360" <% if (msgOff.getE01OFFLBA().equals("360")) out.print("selected"); %>>360</option>
            		<option value="365" <% if (msgOff.getE01OFFLBA().equals("365")) out.print("selected"); %>>365</option>
            		<option value="366" <% if (msgOff.getE01OFFLBA().equals("366")) out.print("selected"); %>>366</option>
           		</select>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="32%" >
            	<div align="right">IBF :</div>
            </td>
            <td nowrap width="28%" >
            	<input type="radio" name="E01OFFIBF" value="Y" <%if (msgOff.getE01OFFIBF().equals("Y")) out.print("checked"); %> disabled>Yes
            	<input type="radio" name="E01OFFIBF" value="N" <%if (msgOff.getE01OFFIBF().equals("N")) out.print("checked"); %> disabled>No
			</td>
            <td nowrap width="22%" >
            </td>
            <td nowrap width="18%" >
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="32%" >
            	<div align="right">Interest Payment Term Period :</div>
            </td>
            <td nowrap width="28%" >
            	<select name="E01OFFLIP" disabled>
            		<option value="" <% if (msgOff.getE01OFFLIP().equals("")) out.print("selected"); %>></option>
            		<option value="SCH" <% if (msgOff.getE01OFFLIP().equals("SCH")) out.print("selected"); %>>SCH</option>
            		<option value="MAT" <% if (msgOff.getE01OFFLIP().equals("MAT")) out.print("selected"); %>>MAT</option>
            		<option value="NNN" <% if (!(msgOff.getE01OFFLIP().equals("SCH") || msgOff.getE01OFFLIP().equals("MAT") || msgOff.getE01OFFLIP().equals(""))) out.print("selected"); %>>NNN</option>
           		</select>
            	<input type="text" name="E01OFFLIP1" size="4" maxlength="3" value="<% if (!(msgOff.getE01OFFLIP().equals("SCH") || msgOff.getE01OFFLIP().equals("MAT") || msgOff.getE01OFFLIP().equals(""))) out.print(msgOff.getE01OFFLIP().trim()); %>" readonly>
            </td>
            <td nowrap width="22%" >
            	<div align="right">Principal Payment Term Period :</div>
            </td>
            <td nowrap width="18%" >
            	<select name="E01OFFLPP" disabled>
            		<option value="" <% if (msgOff.getE01OFFLPP().equals("")) out.print("selected"); %>></option>
            		<option value="SCH" <% if (msgOff.getE01OFFLPP().equals("SCH")) out.print("selected"); %>>SCH</option>
            		<option value="MAT" <% if (msgOff.getE01OFFLPP().equals("MAT")) out.print("selected"); %>>MAT</option>
            		<option value="NNN" <% if (!(msgOff.getE01OFFLPP().equals("SCH") || msgOff.getE01OFFLPP().equals("MAT") || msgOff.getE01OFFLPP().equals(""))) out.print("selected"); %>>NNN</option>
           		</select>
            	<input type="text" name="E01OFFLPP1" size="4" maxlength="3" value="<% if (!(msgOff.getE01OFFLPP().equals("SCH") || msgOff.getE01OFFLPP().equals("MAT") || msgOff.getE01OFFLPP().equals(""))) out.print(msgOff.getE01OFFLPP().trim()); %>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <TABLE class="tableinfo" >
  <TR>
      <TD>
        <table class="tableinfo" style="filter:''">
          <tr id="trdark">
            <td nowrap width="20%">
              <div align="center"></div>
            </td>
            <td nowrap width="16%">
              <div align="center">Bank</div>
            </td>
            <td nowrap width="16%">
              <div align="center">Branch</div>
            </td>
            <td nowrap width="16%">
              <div align="center">Currency</div>
            </td>
            <td nowrap width="16%">
              <div align="center">General Ledger</div>
            </td>
            <td nowrap width="16%">
              <div align="center">Account</div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="20%" >
              <div align="right">
                Payments Debited To
              </div>
            </td>
            <td nowrap width="16%" >
              <div align="center">
            	<input type="text" name="E01OFFLBK" size="2" maxlength="2" value="<%= msgOff.getE01OFFLBK().trim()%>" readonly>
			  </div>
            </td>
            <td nowrap width="16%" >
              <div align="center">
            	<input type="text" name="E01OFFLBR" size="4" maxlength="3" value="<%= msgOff.getE01OFFLBR().trim()%>"
           		oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E01OFFLBK.value,'','','','')" onkeypress="enterInteger()" readonly>
              </div>
            </td>
            <td nowrap width="16%" >
              <div align="center">
            	<input type="text" name="E01OFFLCY" size="3" maxlength="3" value="<%= msgOff.getE01OFFLCY().trim()%>"
				oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E01OFFLBK.value,'','','','')" readonly>
			  </div>
            </td>
            <td nowrap width="16%" >
              <div align="center">
            	<input type="text" name="E01OFFLGL" size="13" maxlength="12" value="<%= msgOff.getE01OFFLGL().trim()%>" onkeypress="enterInteger()"
				oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01OFFLBK.value,document.forms[0].E01OFFLCY.value,'','','')" readonly>
			  </div>
            </td>
            <td nowrap width="16%" >
              <div align="center">
            	<input type="text" name="E01OFFLAC" size="13" maxlength="12" value="<%= msgOff.getE01OFFLAC().trim()%>"
				oncontextmenu="showPopUp(accountCustomerHelp,this.name,document.forms[0].E01OFFLBK.value,'','','','RT')" onKeyPress="enterInteger()" readonly>
			  </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="20%" >
              <div align="right">
                Funds Credited To
              </div>
            </td>
            <td nowrap width="16%" >
              <div align="center">
            	<input type="text" name="E01OFFLDB" size="2" maxlength="2" value="<%= msgOff.getE01OFFLDB().trim()%>" readonly>
			  </div>
            </td>
            <td nowrap width="16%" >
              <div align="center">
            	<input type="text" name="E01OFFLDR" size="4" maxlength="3" value="<%= msgOff.getE01OFFLDR().trim()%>"
           		oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E01OFFLDB.value,'','','','')" onkeypress="enterInteger()" readonly>
              </div>
            </td>
            <td nowrap width="16%" >
              <div align="center">
            	<input type="text" name="E01OFFLDC" size="3" maxlength="3" value="<%= msgOff.getE01OFFLDC().trim()%>"
				oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E01OFFLDB.value,'','','','')" readonly>
			  </div>
            </td>
            <td nowrap width="16%" >
              <div align="center">
            	<input type="text" name="E01OFFLDG" size="13" maxlength="12" value="<%= msgOff.getE01OFFLDG().trim()%>" onkeypress="enterInteger()"
				oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01OFFLDB.value,document.forms[0].E01OFFLDC.value,'','','')" readonly>
			  </div>
            </td>
            <td nowrap width="16%" >
              <div align="center">
            	<input type="text" name="E01OFFLDA" size="13" maxlength="12" value="<%= msgOff.getE01OFFLDA().trim()%>"
				oncontextmenu="showPopUp(accountCustomerHelp,this.name,document.forms[0].E01OFFLDB.value,'','','','RT')" onKeyPress="enterInteger()" readonly>
			  </div>
            </td>
          </tr>
        </table>
      </TD>  
  </TR>	
  </TABLE>    
  <% } %>
  <% if (msgOff.getE01OFFOTY().equals("LCR")) { %>
  <h4>Letter of Credit Information</h4>
  <table class="tableinfo">
    <tr>
      <td nowrap>
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="21%" >
            	<div align="right">Tariff of Charges :</div>
            </td>
            <td nowrap width="17%" >
            	<input type="text" name="E01OFFCTC" size="3" maxlength="2" value="<%= msgOff.getE01OFFCTC().trim()%>" readonly>
            </td>
            <td nowrap width="22%" >
            	<div align="right">Letter of Credit Type :</div>
            </td>
            <td nowrap width="40%" >
          		<input type="text" name="E01OFFCTY" size="3" maxlength="2" value="<%= msgOff.getE01OFFCTY().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="21%" >
            	<div align="right">Confirmed :</div>
            </td>
            <td nowrap width="17%" >
            	<input type="radio" name="E01OFFCCF" value="Y" <%if (msgOff.getE01OFFCCF().equals("Y")) out.print("checked"); %> disabled>Yes
            	<input type="radio" name="E01OFFCCF" value="N" <%if (msgOff.getE01OFFCCF().equals("N")) out.print("checked"); %> disabled>No
            </td>
            <td nowrap width="22%" >
            	<div align="right">General Ledger Number :</div>
            </td>
            <td nowrap width="40%" >
            	<input type="text" name="E01OFFCGL" size="13" maxlength="12" value="<%= msgOff.getE01OFFCGL().trim()%>"  onkeypress="enterInteger()" readonly>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="21%" >
            	<div align="right">Maturity Date :</div>
            </td>
            <td nowrap width="17%" >
            	<input type="text" name="E01OFFCMD1" size="3" maxlength="2" value=""  onkeypress="enterInteger()" readonly>
            	<input type="text" name="E01OFFCMD2" size="3" maxlength="2" value=""  onkeypress="enterInteger()" readonly>
            	<input type="text" name="E01OFFCMD3" size="3" maxlength="2" value=""  onkeypress="enterInteger()" readonly>
            </td>
            <td nowrap width="22%" >
            </td>
            <td nowrap width="40%" >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <% } %>
  <% if (msgOff.getE01OFFOTY().equals("ACC") || msgOff.getE01OFFOTY().equals("ACD") || msgOff.getE01OFFOTY().equals("ACP") || msgOff.getE01OFFOTY().equals("ACS")) { %>
  <h4>Acceptances Information</h4>
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="32%" >
            	<div align="right">Maturity Date :</div>
            </td>
            <td nowrap width="28%" >
            	<input type="text" name="E01OFFCMD1" size="3" maxlength="2" value=""  onkeypress="enterInteger()" readonly>
            	<input type="text" name="E01OFFCMD2" size="3" maxlength="2" value=""  onkeypress="enterInteger()" readonly>
            	<input type="text" name="E01OFFCMD3" size="3" maxlength="2" value=""  onkeypress="enterInteger()" readonly>
            </td>
            <td nowrap width="22%" >
            	<div align="right">Terms :</div>
            </td>
            <td nowrap width="18%" >
            	<input type="text" name="E01OFFLTR" size="4" maxlength="3" value="<%= msgOff.getE01OFFLTR().trim()%>" onkeypress="enterInteger()" readonly>
            	<select name="E01OFFTRC" disabled>
            		<option value=" " <% if (!(msgOff.getE01OFFTRC().equals("D") ||msgOff.getE01OFFTRC().equals("M")||msgOff.getE01OFFTRC().equals("Y"))) out.print("selected"); %>></option>
            		<option value="D" <% if(msgOff.getE01OFFTRC().equals("D")) out.print("selected");%>>Day(s)</option>
            		<option value="M" <% if(msgOff.getE01OFFTRC().equals("M")) out.print("selected");%>>Month(s)</option>
            		<option value="Y" <% if(msgOff.getE01OFFTRC().equals("Y")) out.print("selected");%>>Year(s)</option>
            	</select>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="32%" >
            	<div align="right">Floating Rate Table :</div>
            </td>
            <td nowrap width="28%" >
            	<input type="text" name="E01OFFLFT" size="3" maxlength="2" value="<%= msgOff.getE01OFFLFT().trim()%>" readonly>
            </td>
            <td nowrap width="22%" >
            	<div align="right">Floating Rate Type Code :</div>
            </td>
            <td nowrap width="18%" >
            	<select name="E01OFFLTY" disabled>
            		<option value=" " <% if (!(msgOff.getE01OFFLTY().equals("FP") ||msgOff.getE01OFFLTY().equals("FS"))) out.print("selected"); %>></option>
            		<option value="FP" <% if (msgOff.getE01OFFLTY().equals("FP")) out.print("selected"); %>>Primary</option>
            		<option value="FS" <% if (msgOff.getE01OFFLTY().equals("FS")) out.print("selected"); %>>Secondary</option>
           		</select>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="32%" >
            	<div align="right">Base Rate :</div>
            </td>
            <td nowrap width="28%" >
            	<input type="text" name="E01OFFLSP" size="13" maxlength="12" value="<%= msgOff.getE01OFFLSP().trim()%>" onKeypress="enterSignDecimal()" readonly>
            </td>
            <td nowrap width="22%" >
            	<div align="right">Loan Table :</div>
            </td>
            <td nowrap width="18%" >
            	<input type="text" name="E01OFFLTF" size="3" maxlength="2" value="<%= msgOff.getE01OFFLTF().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="32%" >
            	<div align="right">Revision Rate Term :</div>
            </td>
            <td nowrap width="28%" >
            	<input type="text" name="E01OFFLRT" size="4" maxlength="3" value="<%= msgOff.getE01OFFLRT().trim()%>" readonly>
            	<select name="E01OFFLTF" disabled>
            		<option value=" " <% if (!(msgOff.getE01OFFLTF().equals("D") || msgOff.getE01OFFLTF().equals("M") || msgOff.getE01OFFLTF().equals("Y"))) out.print("selected"); %>></option>
            		<option value="D" <% if(msgOff.getE01OFFLTF().equals("D")) out.print("selected");%>>Day(s)</option>
            		<option value="M" <% if(msgOff.getE01OFFLTF().equals("M")) out.print("selected");%>>Month(s)</option>
            		<option value="Y" <% if(msgOff.getE01OFFLTF().equals("Y")) out.print("selected");%>>Year(s)</option>
            	</select>
            </td>
            <td nowrap width="22%" >
            	<div align="right">Basis :</div>
            </td>
            <td nowrap width="18%" >
            	<select name="E01OFFLBA" disabled>
            		<option value="" <% if (!(msgOff.getE01OFFLBA().equals("360") || msgOff.getE01OFFLBA().equals("365") || msgOff.getE01OFFLBA().equals("366"))) out.print("selected"); %>></option>
            		<option value="360" <% if (msgOff.getE01OFFLBA().equals("360")) out.print("selected"); %>>360</option>
            		<option value="365" <% if (msgOff.getE01OFFLBA().equals("365")) out.print("selected"); %>>365</option>
            		<option value="366" <% if (msgOff.getE01OFFLBA().equals("366")) out.print("selected"); %>>366</option>
           		</select>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="32%" >
            	<div align="right">IBF :</div>
            </td>
            <td nowrap width="28%" >
            	<input type="radio" name="E01OFFIBF" value="Y" <%if (msgOff.getE01OFFIBF().equals("Y")) out.print("checked"); %> disabled>Yes
            	<input type="radio" name="E01OFFIBF" value="N" <%if (msgOff.getE01OFFIBF().equals("N")) out.print("checked"); %> disabled>No
			</td>
            <td nowrap width="22%" >
            </td>
            <td nowrap width="18%" >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <TABLE class="tableinfo" >
  <TR>
      <TD>
        <table class="tableinfo" style="filter:''">
          <tr id="trdark">
            <td nowrap width="20%">
              <div align="center"></div>
            </td>
            <td nowrap width="16%">
              <div align="center">Bank</div>
            </td>
            <td nowrap width="16%">
              <div align="center">Branch</div>
            </td>
            <td nowrap width="16%">
              <div align="center">Currency</div>
            </td>
            <td nowrap width="16%">
              <div align="center">General Ledger</div>
            </td>
            <td nowrap width="16%">
              <div align="center">Account</div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="20%" >
              <div align="right">
                Payments Debited To
              </div>
            </td>
            <td nowrap width="16%" >
              <div align="center">
            	<input type="text" name="E01OFFLBK" size="2" maxlength="2" value="<%= msgOff.getE01OFFLBK().trim()%>" readonly>
			  </div>
            </td>
            <td nowrap width="16%" >
              <div align="center">
            	<input type="text" name="E01OFFLBR" size="4" maxlength="3" value="<%= msgOff.getE01OFFLBR().trim()%>"
           		oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E01OFFLBK.value,'','','','')" onkeypress="enterInteger()" readonly>
              </div>
            </td>
            <td nowrap width="16%" >
              <div align="center">
            	<input type="text" name="E01OFFLCY" size="3" maxlength="3" value="<%= msgOff.getE01OFFLCY().trim()%>"
				oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E01OFFLBK.value,'','','','')" readonly>
			  </div>
            </td>
            <td nowrap width="16%" >
              <div align="center">
            	<input type="text" name="E01OFFLGL" size="13" maxlength="12" value="<%= msgOff.getE01OFFLGL().trim()%>" onkeypress="enterInteger()"
				oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01OFFLBK.value,document.forms[0].E01OFFLCY.value,'','','')" readonly>
			  </div>
            </td>
            <td nowrap width="16%" >
              <div align="center">
            	<input type="text" name="E01OFFLAC" size="13" maxlength="12" value="<%= msgOff.getE01OFFLAC().trim()%>"
				oncontextmenu="showPopUp(accountCustomerHelp,this.name,document.forms[0].E01OFFLBK.value,'','','','RT')" onKeyPress="enterInteger()" readonly>
			  </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="20%" >
              <div align="right">
                Funds Credited To
              </div>
            </td>
            <td nowrap width="16%" >
              <div align="center">
            	<input type="text" name="E01OFFLDB" size="2" maxlength="2" value="<%= msgOff.getE01OFFLDB().trim()%>" readonly>
			  </div>
            </td>
            <td nowrap width="16%" >
              <div align="center">
            	<input type="text" name="E01OFFLDR" size="4" maxlength="3" value="<%= msgOff.getE01OFFLDR().trim()%>"
           		oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E01OFFLDB.value,'','','','')" onkeypress="enterInteger()" readonly>
              </div>
            </td>
            <td nowrap width="16%" >
              <div align="center">
            	<input type="text" name="E01OFFLDC" size="3" maxlength="3" value="<%= msgOff.getE01OFFLDC().trim()%>"
				oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E01OFFLDB.value,'','','','')" readonly>
			  </div>
            </td>
            <td nowrap width="16%" >
              <div align="center">
            	<input type="text" name="E01OFFLDG" size="13" maxlength="12" value="<%= msgOff.getE01OFFLDG().trim()%>" onkeypress="enterInteger()"
				oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01OFFLDB.value,document.forms[0].E01OFFLDC.value,'','','')" readonly>
			  </div>
            </td>
            <td nowrap width="16%" >
              <div align="center">
            	<input type="text" name="E01OFFLDA" size="13" maxlength="12" value="<%= msgOff.getE01OFFLDA().trim()%>"
				oncontextmenu="showPopUp(accountCustomerHelp,this.name,document.forms[0].E01OFFLDB.value,'','','','RT')" onKeyPress="enterInteger()" readonly>
			  </div>
            </td>
          </tr>
        </table>
      </TD>  
  </TR>	
  </TABLE>    
  <% } %>

  <h4>Totals Summary</h4>
  <table class="tableinfo">
    <tr>
      <td nowrap>
		<TABLE cellspacing="0" cellpadding="2" width="100%" border="0">
			<TBODY>
				<TR id="trdark">
					<TD nowrap height="31" colspan="2">
					<DIV align="center"><B>Customer's Use of Funds / Assets</B></DIV>
					</TD>
					<TD nowrap height="31" colspan="2">
					<DIV align="center"><B>Funds Provided by Customer / Liabilities</B></DIV>
					</TD>
				</TR>
				<TR id="trclear">
					<TD nowrap width="28%">
					<DIV align="right">Overdrawn Accounts :</DIV>
					</TD>
					<TD nowrap width="21%">
					<DIV align="center"><INPUT type="text" id="txtright" readonly
						name="E01OFFOVD" size="17" maxlength="15"
						value="<%= Util.formatCCY(msgOff.getE01OFFOVD())%>"></DIV>
					</TD>
					<TD nowrap width="25%">
					<DIV align="right">DDA's :</DIV>
					</TD>
					<TD nowrap width="26%">
					<DIV align="center"><INPUT type="text" id="txtright" readonly
						name="E01OFFDDA" size="17" maxlength="15"
						value="<%= Util.formatCCY(msgOff.getE01OFFDDA())%>"></DIV>
					</TD>
				</TR>
				<TR id="trdark">
					<TD nowrap width="28%">
					<DIV align="right">Mortgage Loans :</DIV>
					</TD>
					<TD nowrap width="21%">
					<DIV align="center"><INPUT type="text" id="txtright" readonly
						name="E01OFFMTG" size="17" maxlength="15"
						value="<%= Util.formatCCY(msgOff.getE01OFFMTG())%>"></DIV>
					</TD>
					<TD nowrap width="25%">
					<DIV align="right">MMK & Now :</DIV>
					</TD>
					<TD nowrap width="26%">
					<DIV align="center"><INPUT type="text" id="txtright" readonly
						name="E01OFFMMK" size="17" maxlength="15"
						value="<%= Util.formatCCY(msgOff.getE01OFFMMK())%>"></DIV>
					</TD>
				</TR>
				<TR id="trclear">
					<TD nowrap width="28%">
					<DIV align="right">Leasing :</DIV>
					</TD>
					<TD nowrap width="21%">
					<DIV align="center"><INPUT type="text" id="txtright" readonly
						name="E01OFFLSG" size="17" maxlength="15"
						value="<%= Util.formatCCY(msgOff.getE01OFFLSG())%>"></DIV>
					</TD>
					<TD nowrap width="25%">
					<DIV align="right">Savings :</DIV>
					</TD>
					<TD nowrap width="26%">
					<DIV align="center"><INPUT type="text" id="txtright" readonly
						name="E01OFFSAV" size="17" maxlength="15"
						value="<%= Util.formatCCY(msgOff.getE01OFFSAV())%>"></DIV>
					</TD>
				</TR>
				<TR id="trdark">
					<TD nowrap width="28%">
					<DIV align="right">Consumer Loans :</DIV>
					</TD>
					<TD nowrap width="21%">
					<DIV align="center"><INPUT type="text" id="txtright" readonly
						name="E01OFFCSL" size="17" maxlength="15"
						value="<%= Util.formatCCY(msgOff.getE01OFFCSL())%>"></DIV>
					</TD>
					<TD nowrap width="28%">
					<DIV align="right">Certificates :</DIV>
					</TD>
					<TD nowrap width="21%">
					<DIV align="center"><INPUT type="text" id="txtright" readonly
						name="E01OFFCTF" size="17" maxlength="15"
						value="<%= Util.formatCCY(msgOff.getE01OFFCTF())%>"></DIV>
					</TD>
				</TR>
				<TR id="trclear">
					<TD nowrap width="28%">
					<DIV align="right">Other Loans :</DIV>
					</TD>
					<TD nowrap width="21%">
					<DIV align="center"><INPUT type="text" id="txtright" readonly
						name="E01OFFGRL" size="17" maxlength="15"
						value="<%= Util.formatCCY(msgOff.getE01OFFGRL())%>"></DIV>
					</TD>
					<TD nowrap width="25%">
					<DIV align="right">Participations :</DIV>
					</TD>
					<TD nowrap width="26%">
					<DIV align="center"><INPUT type="text" id="txtright" readonly
						name="E01OFFPAR" size="17" maxlength="15"
						value="<%= Util.formatCCY(msgOff.getE01OFFPAR())%>"></DIV>
					</TD>
				</TR>
				<TR id="trdark">
					<TD nowrap width="28%">
					<DIV align="right">Investments :</DIV>
					</TD>
					<TD nowrap width="21%">
					<DIV align="center"><INPUT type="text" id="txtright" readonly
						name="E01OFFINA" size="17" maxlength="15"
						value="<%= Util.formatCCY(msgOff.getE01OFFINA())%>"></DIV>
					</TD>
					<TD nowrap width="25%">
					</TD>
					<TD nowrap width="26%">
					</TD>
				</TR>
				<TR id="trclear">
					<TD nowrap width="28%">
					<DIV align="right">TDS / CDS Purchased :</DIV>
					</TD>
					<TD nowrap width="21%">
					<DIV align="center"><INPUT type="text" id="txtright" readonly
						name="E01OFFTDP" size="17" maxlength="15"
						value="<%= Util.formatCCY(msgOff.getE01OFFTDP())%>"></DIV>
					</TD>
					<TD nowrap width="28%">
					</TD>
					<TD nowrap width="21%">
					</TD>
				</TR>
				<TR id="trdark">
					<TD nowrap width="28%">
					<DIV align="right">Acceptances :</DIV>
					</TD>
					<TD nowrap width="21%">
					<DIV align="center"><INPUT type="text" id="txtright" readonly
						name="E01OFFADC" size="17" maxlength="15"
						value="<%= Util.formatCCY(msgOff.getE01OFFADC())%>"></DIV>
					</TD>
					<TD nowrap width="28%">
					<DIV align="right">Acceptances :</DIV>
					</TD>
					<TD nowrap width="21%">
					<DIV align="center"><INPUT type="text" id="txtright" readonly
						name="E01OFFACL" size="17" maxlength="15"
						value="<%= Util.formatCCY(msgOff.getE01OFFACL())%>"></DIV>
					</TD>
				</TR>
				<TR id="trclear">
					<TD nowrap width="28%">
					<DIV align="right">L/C's Confirmed :</DIV>
					</TD>
					<TD nowrap width="21%">
					<DIV align="center"><INPUT type="text" id="txtright" readonly
						name="E01OFFLCC" size="17" maxlength="15"
						value="<%= Util.formatCCY(msgOff.getE01OFFLCC())%>"></DIV>
					</TD>
					<TD nowrap width="28%">
					<DIV align="right">LC's in Process :</DIV>
					</TD>
					<TD nowrap width="21%">
					<DIV align="center"><INPUT type="text" id="txtright" readonly
						name="E01OFFLCP" size="17" maxlength="15"
						value="<%= Util.formatCCY(msgOff.getE01OFFLCP())%>"></DIV>
					</TD>
				</TR>
				<TR id="trdark">
					<TD nowrap width="28%">
					<DIV align="right">Spot Purchased :</DIV>
					</TD>
					<TD nowrap width="21%">
					<DIV align="center"><INPUT type="text" id="txtright" readonly
						name="E01OFFSPP" size="17" maxlength="15"
						value="<%= Util.formatCCY(msgOff.getE01OFFSPP())%>"></DIV>
					</TD>
					<TD nowrap width="28%">
					<DIV align="right">Spot Sold :</DIV>
					</TD>
					<TD nowrap width="21%">
					<DIV align="center"><INPUT type="text" id="txtright" readonly
						name="E01OFFSPS" size="17" maxlength="15"
						value="<%= Util.formatCCY(msgOff.getE01OFFSPS())%>"></DIV>
					</TD>
				</TR>
				<TR id="trclear">
					<TD nowrap width="28%">
					<DIV align="right">Forward Purchased :</DIV>
					</TD>
					<TD nowrap width="21%">
					<DIV align="center"><INPUT type="text" id="txtright" readonly
						name="E01OFFFWP" size="17" maxlength="15"
						value="<%= Util.formatCCY(msgOff.getE01OFFFWP())%>"></DIV>
					</TD>
					<TD nowrap width="28%">
					<DIV align="right">Forward Sold :</DIV>
					</TD>
					<TD nowrap width="21%">
					<DIV align="center"><INPUT type="text" id="txtright" readonly
						name="E01OFFFWS" size="17" maxlength="15"
						value="<%= Util.formatCCY(msgOff.getE01OFFFWS())%>"></DIV>
					</TD>
				</TR>
				<TR id="trdark">
					<TD nowrap width="28%">
					<DIV align="right">Options Purchased :</DIV>
					</TD>
					<TD nowrap width="21%">
					<DIV align="center"><INPUT type="text" id="txtright" readonly
						name="E01OFFOPU" size="17" maxlength="15"
						value="<%= Util.formatCCY(msgOff.getE01OFFOPU())%>"></DIV>
					</TD>
					<TD nowrap width="28%">
					<DIV align="right">Options Sold :</DIV>
					</TD>
					<TD nowrap width="21%">
					<DIV align="center"><INPUT type="text" id="txtright" readonly
						name="E01OFFOPS" size="17" maxlength="15"
						value="<%= Util.formatCCY(msgOff.getE01OFFOPS())%>"></DIV>
					</TD>
				</TR>
				<TR id="trclear">
					<TD nowrap width="28%">
					<DIV align="right">FRA's Purchased :</DIV>
					</TD>
					<TD nowrap width="21%">
					<DIV align="center"><INPUT type="text" id="txtright" readonly
						name="E01OFFFRP" size="17" maxlength="15"
						value="<%= Util.formatCCY(msgOff.getE01OFFFRP())%>"></DIV>
					</TD>
					<TD nowrap width="28%">
					<DIV align="right">FRA's Sold :</DIV>
					</TD>
					<TD nowrap width="21%">
					<DIV align="center"><INPUT type="text" id="txtright" readonly
						name="E01OFFFRS" size="17" maxlength="15"
						value="<%= Util.formatCCY(msgOff.getE01OFFFRS())%>"></DIV>
					</TD>
				</TR>
				<TR id="trdark">
					<TD nowrap width="28%">
					<DIV align="right">Credit Cards :</DIV>
					</TD>
					<TD nowrap width="21%">
					<DIV align="center"><INPUT type="text" id="txtright" readonly
						name="E01OFFCCD" size="17" maxlength="15"
						value="<%= Util.formatCCY(msgOff.getE01OFFCCD())%>"></DIV>
					</TD>
					<TD nowrap width="28%">
					</TD>
					<TD nowrap width="21%">
					</TD>
				</TR>
				<TR id="trclear">
					<TD nowrap width="28%">
					<DIV align="right"><B>Total Assets :</B></DIV>
					</TD>
					<TD nowrap width="21%">
					<DIV align="center"><INPUT type="text" id="txtright" readonly
						name="E01OFFTOA" size="17" maxlength="15"
						value="<%= Util.formatCCY(msgOff.getE01OFFTOA())%>"></DIV>
					</TD>
					<TD nowrap width="25%">
					<DIV align="right"><B>Total Liabilities :</B></DIV>
					</TD>
					<TD nowrap width="26%">
					<DIV align="center"><INPUT type="text" id="txtright" readonly
						name="E01OFFTOP" size="17" maxlength="15"
						value="<%= Util.formatCCY(msgOff.getE01OFFTOP())%>"></DIV>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
      </td>
    </tr>
  </table>

  <h4>Line of Credit Detail</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap height="36"> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="21%" > 
              <div align="center">Amount Approved</div>
      		</td>
      		<td width="23%"> 
              <div align="center">Amount Used</div>
      		</td>
      		<td width="20%"> 
              <div align="center">Available Amount</div>
      		</td>
      		<td width="20%"> 
              <div align="center">Participations</div>
      		</td>
      		<td width="20%"> 
              <div align="center">Today's Offerings</div>
      		</td>
    	  </tr>
    	  <tr>
      		<td width="17%"> 
        		<div align="center">
          			<input type="text" id="txtright" readonly name="E01OFFLTA"  size="17" maxlength="15" value="<%= Util.formatCCY(msgOff.getE01OFFLTA())%>" >
        		</div>
     		</td>
      		<td width="23%"> 
        		<div align="center">
          			<input type="text" id="txtright" readonly name="E03OFFLTU"  size="17" maxlength="15" value="<%= Util.formatCCY(msgOff.getE01OFFLTU())%>">
        		</div>
      		</td>
      		<td width="20%"> 
              	<div align="center"> 
              		<input type="text" id="txtright" readonly name="E01OFFLTV"  size="17" maxlength="15" value="<%= Util.formatCCY(msgOff.getE01OFFLTV())%>">
              	</div>
      		</td>
      		<td width="20%"> 
              	<div align="center">
                	<input type="text" id="txtright" readonly name="E01OFFLTP"  size="17" maxlength="15" value="<%= Util.formatCCY(msgOff.getE01OFFLTP())%>">
              	</div>
      		</td>
      		<td width="20%"> 
        		<div align="center">
          			<input type="text" id="txtright" readonly name="E01OFFLTO"  size="17" maxlength="15" value="<%= Util.formatCCY(msgOff.getE01OFFLTO())%>">
        		</div>
      		</td>
    	  </tr>
  		</table>
      </td>
    </tr>
  </table>
  <h4>Totals Contigencies</h4>
<TABLE class="tableinfo">
	<TBODY>
		<TR>
			<TD nowrap height="36">
			<TABLE cellspacing="0" cellpadding="2" width="100%" border="0">
				<TBODY>
					<TR id="trdark">
						<TD nowrap height="31" colspan="2">
						<DIV align="center"><B>Debits</B></DIV>
						</TD>
						<TD nowrap height="31" colspan="2">
						<DIV align="center"><B>Credits</B></DIV>
						</TD>
					</TR>
					<TR id="trclear">
						<TD nowrap width="28%"></TD>
						<TD nowrap width="22%"></TD>
						<TD nowrap width="26%">
						<DIV align="right">Cash Collaterals :</DIV>
						</TD>
						<TD nowrap width="24%">
						<DIV align="center"><INPUT type="text" id="txtright" readonly
							name="E01OFFCSH" size="17" maxlength="15"
							value="<%= Util.formatCCY(msgOff.getE01OFFCSH())%>"></DIV>
						</TD>
					</TR>
					<TR id="trdark">
						<TD nowrap width="28%"></TD>
						<TD nowrap width="22%"></TD>
						<TD nowrap width="26%">
						<DIV align="right">International Collections :</DIV>
						</TD>
						<TD nowrap width="24%">
						<DIV align="center"><INPUT type="text" id="txtright" readonly
							name="E01OFFICL" size="17" maxlength="15"
							value="<%= Util.formatCCY(msgOff.getE01OFFICL())%>"></DIV>
						</TD>
					</TR>
					<TR id="trclear">
						<TD nowrap width="28%">
						<DIV align="right">Bank Acceptances :</DIV>
						</TD>
						<TD nowrap width="22%">
						<DIV align="center"><INPUT type="text" id="txtright" readonly
							name="E01OFFBAC" size="17" maxlength="15"
							value="<%= Util.formatCCY(msgOff.getE01OFFBAC())%>"></DIV>
						</TD>
						<TD nowrap width="26%">
						<DIV align="right">Local Collections :</DIV>
						</TD>
						<TD nowrap width="24%" height="22">
						<DIV align="center"><INPUT type="text" id="txtright" readonly
							name="E01OFFLOC" size="17" maxlength="15"
							value="<%= Util.formatCCY(msgOff.getE01OFFLOC())%>"></DIV>
						</TD>
					</TR>
					<TR id="trdark">
						<TD nowrap width="28%">
						<DIV align="right">L/C's Unconfirmed :</DIV>
						</TD>
						<TD nowrap width="22%">
						<DIV align="center"><INPUT type="text" id="txtright" readonly
							name="E01OFFULC" size="17" maxlength="15"
							value="<%= Util.formatCCY(msgOff.getE01OFFULC())%>"></DIV>
						</TD>
						<TD nowrap width="26%">
						<DIV align="right">Documents in Custody :</DIV>
						</TD>
						<TD nowrap width="24%" height="22">
						<DIV align="center"><INPUT type="text" id="txtright" readonly
							name="E01OFFDIC" size="17" maxlength="15"
							value="<%= Util.formatCCY(msgOff.getE01OFFDIC())%>"></DIV>
						</TD>
					</TR>
					<TR id="trclear">
						<TD nowrap width="28%">
						<DIV align="right">Received Collections :</DIV>
						</TD>
						<TD nowrap width="22%">
						<DIV align="center"><INPUT type="text" id="txtright" readonly
							name="E01OFFCSH" size="17" maxlength="15"
							value="<%= Util.formatCCY(msgOff.getE01OFFCSH())%>"></DIV>
						</TD>
						<TD nowrap width="26%">
						<DIV align="right">Pledge Certificates :</DIV>
						</TD>
						<TD nowrap width="24%" height="22">
						<DIV align="center"><INPUT type="text" id="txtright" readonly
							name="E01OFFPLG" size="17" maxlength="15"
							value="<%= Util.formatCCY(msgOff.getE01OFFPLG())%>"></DIV>
						</TD>
					</TR>
					<TR id="trdark">
						<TD nowrap width="28%">
						<DIV align="right"><B>Total Debits :</B></DIV>
						</TD>
						<TD nowrap width="22%">
						<DIV align="center"><INPUT type="text" id="txtright" readonly
							name="E01TOTCDB" size="17" maxlength="15"
							value="<%= Util.formatCCY(msgOff.getE01TOTCDB())%>"></DIV>
						</TD>
						<TD nowrap width="26%">
						<DIV align="right"><B>Total Credits :</B></DIV>
						</TD>
						<TD nowrap width="24%" height="22">
						<DIV align="center"><INPUT type="text" id="txtright" readonly
							name="E01TOTCCR" size="17" maxlength="15"
							value="<%= Util.formatCCY(msgOff.getE01TOTCCR())%>"></DIV>
						</TD>
					</TR>
				</TBODY>
			</TABLE>

			</TD>
		</TR>
	</TBODY>
</TABLE>

  <h4>Totals Assets Under Management</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap height="36"> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="21%" > 
              <div align="right">Open Position :</div>
            </td>
            <td width="23%"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E01OFFOPO" size="17" maxlength="15" value="<%= Util.formatCCY(msgOff.getE01OFFOPO())%>" >
              </div>
            </td>
            <td width="20%"> 
              <div align="center"></div>
            </td>
            <td width="20%"> 
              <div align="center"></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="17%"> 
              <div align="right">Collateral Amount :</div>
            </td>
            <td width="23%"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E01OFFCLA" size="17" maxlength="15" value="<%= Util.formatCCY(msgOff.getE01OFFCLA())%>">
              </div>
            </td>
            <td width="20%"> 
              <div align="right">Available :</div>
            </td>
            <td width="20%"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E01OFFAMA" size="17" maxlength="15" value="<%= Util.formatCCY(msgOff.getE01OFFAMA())%>">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

<br>
  <p align="center">
    <input id="EIBSBTN" type=submit name="submit" value="Back">
  </p>

<SCRIPT Language="Javascript">

	var matdate = document.forms[0].E01OFFCMD.value;
	if (matdate != null || matdate != "") {
		if (matdate.length == 5) {
			matdate = "0" + matdate;
		}
		document.forms[0].E01OFFCMD1.value = matdate.substr(0,2);
		document.forms[0].E01OFFCMD2.value = matdate.substr(2,2);
		document.forms[0].E01OFFCMD3.value = matdate.substr(4,2);
	}

</SCRIPT>

  </form>
</body>
</html>
