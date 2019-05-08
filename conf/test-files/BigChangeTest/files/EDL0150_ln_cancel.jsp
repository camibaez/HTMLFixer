<html>
<head>
<title>Loans Prepayment</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

</head>

<jsp:useBean id= "lnCancel" class= "datapro.eibs.beans.EDL015007Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />


<body nowrap>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%> 
<SCRIPT Language="Javascript">

	builtHPopUp();

  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }

</SCRIPT>
<H3 align="center">Loans Prepayment <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="ln_cancel.jsp,EDL0150"> </H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0150">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="10">
  <INPUT TYPE=HIDDEN NAME="E07DEABNK" VALUE="<%= lnCancel.getE07DEABNK().trim()%>">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left">
                <input type="text" size="9" maxlength="9" name="E07DEACUN" value="<%= lnCancel.getE07DEACUN().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" size="45" maxlength="45" name="E07CUSNA1" value="<%= lnCancel.getE07CUSNA1().trim()%>">
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
                <input type="text" size="12" maxlength="9" name="E07DEAACC" value="<%= lnCancel.getE07DEAACC().trim()%>">
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E07DEACCY" size="3" maxlength="3" value="<%= lnCancel.getE07DEACCY().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <input type="text" size="4" maxlength="4" name="E07DEAPRO" value="<%= lnCancel.getE07DEAPRO().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Financial Information </h4>
 <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="35%"> 
              <div align="right">Principal Amount :</div>
            </td>
            <td nowrap width="18%"> 
              <input type="text" name="E07DEAPRI" size="15" maxlength="13" value="<%= lnCancel.getE07DEAPRI().trim()%>" onkeypress="enterDecimal()">
            </td>
            <td nowrap width="24%"> 
              <div align="right">Last Calculation Date :</div>
            </td>
            <td nowrap width="23%"> 
              <input type="text" name="E07DEALC1" size="2" maxlength="2" value="<%= lnCancel.getE07DEALC1().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E07DEALC2" size="2" maxlength="2" value="<%= lnCancel.getE07DEALC2().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E07DEALC3" size="2" maxlength="2" value="<%= lnCancel.getE07DEALC3().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E07DEALC1,document.forms[0].E07DEALC2,document.forms[0].E07DEALC3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="35%"> 
              <div align="right">Adjust Amount:</div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" name="E07DEAREA" size="15" maxlength="13" value="<%= lnCancel.getE07DEAREA().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="35%" height="23"> 
              <div align="right">Interest Amount:</div>
            </td>
            <td nowrap height="23" colspan="3"> 
              <input type="text" name="E07DEAINT" size="15" maxlength="13" value="<%= lnCancel.getE07DEAINT().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="35%" height="19"> 
              <div align="right">Penalty Charges :</div>
            </td>
            <td nowrap height="19" colspan="3"> 
              <input type="text" name="E07DEAMOR" size="15" maxlength="13" value="<%= lnCancel.getE07DEAMOR().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="35%"> 
              <div align="right">Deductions :</div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" name="E07DEADED" size="15" maxlength="13" value="<%= lnCancel.getE07DEADED().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="35%"> 
              <div align="right">Charges :</div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" name="E07DEACOM" size="15" maxlength="13" value="<%= lnCancel.getE07DEACOM().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="35%"> 
              <div align="right">Taxes and Withholding :</div>
            </td>
            <td nowrap colspan="3">
              <input type="text" name="E07DEAIMP" size="15" maxlength="13" value="<%= lnCancel.getE07DEAIMP().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="35%"> 
              <div align="right"> Sales Taxes :</div>
            </td>
            <td nowrap colspan="3">
              <input type="text" name="E07DEAIVA" size="15" maxlength="13" value="<%= lnCancel.getE07DEAIVA().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="35%"> 
              <div align="right">Total :</div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" name="E07DEATOT" size="15" maxlength="13" value="<%= lnCancel.getE07DEATOT().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p></p>
  <h4>Transaction Information</h4>
<table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="40%"> 
              <div align="right">Principal :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E07TRNPRI" size="15" maxlength="13" value="<%= lnCancel.getE07TRNPRI().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="40%"> 
              <div align="right">Adjustment Value :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E07TRNREA" size="15" maxlength="13" value="<%= lnCancel.getE07TRNREA().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%"> 
              <div align="right">Interest :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E07TRNINT" size="15" maxlength="13" value="<%= lnCancel.getE07TRNINT().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="40%"> 
              <div align="right">Mora :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E07TRNMOR" size="15" maxlength="13" value="<%= lnCancel.getE07TRNMOR().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%"> 
              <div align="right">Deductions :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E07TRNDED" size="15" maxlength="13" value="<%= lnCancel.getE07TRNDED().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="40%"> 
              <div align="right">Charges :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E07TRNCOM" size="15" maxlength="13" value="<%= lnCancel.getE07TRNCOM().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="40%">
              <div align="right">Taxes and Withholding :</div>
            </td>
            <td nowrap width="60%">
              <input type="text" name="E07TRNIMP" size="15" maxlength="13" value="<%= lnCancel.getE07TRNIMP().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="40%"> 
              <div align="right">Sales Taxes :</div>
            </td>
            <td nowrap width="60%">
              <input type="text" name="E07TRNIVA" size="15" maxlength="13" value="<%= lnCancel.getE07TRNIVA().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%"> 
              <div align="right">Payment Amount:</div>
            </td>
            <td nowrap width="60%">
              <input type="text" name="E07TRNTOT" size="15" maxlength="13" value="<%= lnCancel.getE07TRNTOT().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
        </table>
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trclear"> 
            <td nowrap align="center"> 
              <b>Payment Via</b>
            </td>
          </tr>
        </table>
        <table class="tableinfo" style="filter:''">
          <tr id="trdark"> 
            <td nowrap  > 
              <div align="center">Concept</div>
            </td>
            <td nowrap  > 
              <div align="center">Bank</div>
            </td>
            <td nowrap  > 
              <div align="center">Branch</div>
            </td>
            <td nowrap  > 
              <div align="center">Currency</div>
            </td>
            <td nowrap  > 
              <div align="center">Reference</div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap  > 
              <div align="center"> 
                <input type=HIDDEN name="E07TRNOPC" value="<%= lnCancel.getE07TRNOPC().trim()%>">
                <input type=HIDDEN name="E07TRNGLN" value="<%= lnCancel.getE07TRNGLN().trim()%>">
                <input type="text" size="25" maxlength="25" readonly name="E07TRNCON" value="<%= lnCancel.getE07TRNCON().trim()%>"
                   oncontextmenu="showPopUp(conceptHelp,this.name,document.forms[0].E07DEABNK.value,'','E07TRNGLN','E07TRNOPC','10')">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" size="2" maxlength="2" value="<%= lnCancel.getE07TRNBNK().trim()%>" name="E07TRNBNK" onkeypress="enterInteger()">
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" size="3" maxlength="3" value="<%= lnCancel.getE07TRNBRN().trim()%>" name="E07TRNBRN" 
                 oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E07TRNBNK.value,'','','','')" onkeypress="enterInteger()">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" size="3" maxlength="3" name="E07TRNCCY" value="<%= lnCancel.getE07TRNCCY().trim()%>"
                oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E07TRNBNK.value,'','','','')">
              </div>
            </td>
            <td nowrap  > 
              <div align="center"> 
                <input type="text" size="16" maxlength="16" value="<%= lnCancel.getE07TRNACC().trim()%>" name="E07TRNACC" 
                 oncontextmenu="showPopUp(accountHelp,this.name,document.forms[0].E07TRNBNK.value,'','','','RT')"  onkeypress="enterInteger()">
					</div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <div align="center"> 
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>

</form>
</body>
</html>
