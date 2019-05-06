<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Deductions</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="deduct" class="datapro.eibs.beans.EDL037001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT LANGUAGE="JavaScript">
builtHPopUp();

function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
}
</SCRIPT>
</head>

<body>

<%
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>
<%
    String row = "0";
    try {
      row = request.getParameter("ROW");
      if (row==null) row ="0";
    }
    catch (Exception e) {
      row = "0";
    }
 %>
<h3 align="center">Deductions
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="ded_basic.jsp,EDL0370"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0370" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
  <INPUT TYPE=HIDDEN NAME="E01DEABNK"
  	value="<%if (deduct.getE01DEABNK().trim().equals("")) {
  		 	 out.println(userPO.getBank());
  		  } else {
  		  	 out.println(deduct.getE01DEABNK().trim());
  		  }%>">
  <input type=HIDDEN NAME="E01DEAACD"  value="<%= deduct.getE01DEAACD().trim()%>">
  <INPUT TYPE=HIDDEN NAME="OPT" VALUE="N">
  <INPUT TYPE=HIDDEN NAME="ROW" VALUE="<%= row %>">
  <input type=HIDDEN NAME="E01DLITYP"  value="<%= deduct.getE01DLITYP().trim()%>">
  <table class="tableinfo" id="headtable">
    <tr>
      <td nowrap>
        <table cellspacing="0" cellpadding="0" width="100%" >
          <tr id="trdark">
            <td nowrap>
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap>
              <div align="left">
                <input type="text" name="E01DEAACC" size="12" maxlength="12" value="<%= deduct.getE01DEAACC().trim()%>" readonly>
                <input type="text" name="E01CUSNA1" size="17" maxlength="17" value="<%= deduct.getE01CUSNA1().trim()%>" readonly>
              </div>
            </td>
            <td nowrap>
              <div align="right"><b>Deduction : </b></div>
            </td>
            <td nowrap>
              <div align="left">
                <input type="text" name="E01DLICDE" size="4" value="<%= deduct.getE01DLICDE().trim()%>" readonly>
                <input type="text" name="E01DLINME" size="35" value="<%= deduct.getE01DLINME().trim()%>" readonly>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
   <br></br>
   <h4>Company Information</h4>
    <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark">
            <td nowrap >
              <div align="right">Insurance Company :</div>
            </td>
            <td nowrap colspan="3">
              <input type="text" name="E01DLICIA" size="4" maxlength="3" value="<%= deduct.getE01DLICIA().trim()%>">
              <a href="javascript:GetInsuranceCompany('E01DLICIA','E01CIADSC')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
              <input type="text" name="E01CIADSC" size="36" maxlength="35" value="<%= deduct.getE01CIADSC().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right">Insurance Agent :</div>
            </td>
            <td nowrap colspan="3">
              <input type="text" name="E01DLITBL" size="4" maxlength="3" value="<%= deduct.getE01DLITBL().trim()%>">
              <a href="javascript:GetAgentInsurance('E01DLITBL','E01AGNNME')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
              <input type="text" name="E01AGNNME" size="36" maxlength="35" value="<%= deduct.getE01AGNNME().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap >
              <div align="right"> Agent Address :</div>
            </td>
            <td nowrap><input type="text" name="E01AGNAD1" size="36" maxlength="35" value="<%= deduct.getE01AGNAD1().trim()%>">
            </td>
            <td nowrap >
              <div align="right">Phone 1 :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01AGNPH1" size="16" maxlength="15"  value="<%= deduct.getE01AGNPH1().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right"> </div>
            </td>
            <td nowrap><input type="text" name="E01AGNAD2" size="36" maxlength="35" value="<%= deduct.getE01AGNAD2().trim()%>">
            </td>
            <td nowrap >
              <div align="right">Phone 2 :</div>
            </td>
            <td nowrap>
              <input type="text" name="E01AGNPH2" size="16" maxlength="15"  value="<%= deduct.getE01AGNPH2().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap >
              <div align="right">  </div>
            </td>
            <td nowrap><input type="text" name="E01AGNAD3" size="36" maxlength="35" value="<%= deduct.getE01AGNAD3().trim()%>">
            </td>
            <td nowrap >
              <div align="right">Fax :</div>
            </td>
            <td nowrap>
              <input type="text" name="E01AGNFA1" size="16" maxlength="15"  value="<%= deduct.getE01AGNFA1().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right"> City :</div>
            </td>
            <td nowrap ><input type="text" name="E01AGNCTY" size="31" maxlength="30" value="<%= deduct.getE01AGNCTY().trim()%>">
            </td>
            <td nowrap >
              <div align="right">State :</div>
            </td>
            <td nowrap>
              <input type="text" name="E01AGNSTE" size="4" maxlength="3"  value="<%= deduct.getE01AGNSTE().trim()%>">
            </td>

          </tr>
          <tr id="trdark">
            <td nowrap >
              <div align="right"> Country :</div>
            </td>
            <td nowrap ><input type="text" name="E01AGNCTR" size="21" maxlength="20" value="<%= deduct.getE01AGNCTR().trim()%>">
            </td>
            <td nowrap >
              <div align="right">Zip Code :</div>
            </td>
            <td nowrap>
              <input type="text" name="E01AGNZIP" size="11" maxlength="10"  value="<%= deduct.getE01AGNZIP().trim()%>">
            </td>
          </tr>

          <tr id="trclear">
            <td nowrap >
              <div align="right">e-mail :</div>
            </td>
            <td nowrap colspan="3" ><input type="text" name="E01AGNIA1" size="40" maxlength="40"  value="<%= deduct.getE01AGNIA1().trim()%>">
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>

   <br></br>
   <h4>Company Payment Information</h4>
    <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing=0 cellpadding=2 width="100%" border="0">

          <tr id="trdark">
            <td nowrap >
              <div align="right">Policy Number :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01DLIREF" size="20" maxlength="20" value="<%= deduct.getE01DLIREF().trim()%>"> </td>
            <td nowrap >
              <div align="right">Expiration Date :</div>
            </td>
            <td nowrap>
              <input type="text" name="E01DLIEXM" size="2" maxlength="2" value="<%= deduct.getE01DLIEXM().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DLIEXD" size="2" maxlength="2" value="<%= deduct.getE01DLIEXD().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DLIEXY" size="2" maxlength="2" value="<%= deduct.getE01DLIEXY().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01DLIEXM,document.forms[0].E01DLIEXD,document.forms[0].E01DLIEXY)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right">Coverage :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01DLIPAM" size="17" maxlength="17" value="<%= deduct.getE01DLIPAM().trim()%>" onKeypress="enterDecimal()">
            <td nowrap >
              <div align="right"></div>
            </td>
            <td nowrap >

            </td>
          </tr>
          <tr id="trdark">
            <td nowrap >
              <div align="right">Payment Amount to Company :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01DLICPA" size="17" maxlength="17" value="<%= deduct.getE01DLICPA().trim()%>" onKeypress="enterDecimal()">
            <td nowrap >
              <div align="right">Factor :</div>
            </td>
            <td nowrap >
              <select name="E01DLIFAC">
                <option value="F" <% if (!(deduct.getE01DLIFAC().equals("1") ||deduct.getE01DLIFAC().equals("2") ||deduct.getE01DLIFAC().equals("3"))) out.print("selected"); %>>Fixed Amount</option>
                <option value="1" <% if (deduct.getE01DLIFAC().equals("1")) out.print("selected"); %>>% of Original Amount</option>
                <option value="2" <% if (deduct.getE01DLIFAC().equals("2")) out.print("selected"); %>>% of Principal Amount</option>
                <option value="3" <% if (deduct.getE01DLIFAC().equals("3")) out.print("selected"); %>>% of Payment Amount</option>
              </select>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right">Next Payment Date :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01DLINPM" size="2" maxlength="2" value="<%= deduct.getE01DLINPM().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DLINPD" size="2" maxlength="2" value="<%= deduct.getE01DLINPD().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DLINPY" size="2" maxlength="2" value="<%= deduct.getE01DLINPY().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01DLINPM,document.forms[0].E01DLINPD,document.forms[0].E01DLINPY)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
            </td>
            <td nowrap >
              <div align="right">Escrow Account :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01DLICCY" size="5" maxlength="3" value="<%= deduct.getE01DLICCY().trim()%>">
              <a href="javascript:GetCurrency('E01DLICCY',document.forms[0].E01DEABNK.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
              <input type="text" name="E01DLIGLN" size="13" maxlength="12" value="<%= deduct.getE01DLIGLN().trim()%>">
              <a href="javascript:GetLedgerOrRetailAccount('E01DLIGLN', document.forms[0].E01DEABNK.value, document.forms[0].E01DLICCY.value,'RT','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
            </td>
          </tr>
         <tr id="trdark">
            <td nowrap >
              <div align="right">Total Paid to Company LTD :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01DLITPD" size="17" maxlength="17" value="<%= deduct.getE01DLITPD().trim()%>" onKeypress="enterDecimal()">
            <td nowrap >
              <div align="right">Total Paid to Company YTD :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01DLITPY" size="17" maxlength="17" value="<%= deduct.getE01DLITPY().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right">Last Payment Amount :</div>
            </td>
            <td nowrap >
				<input type="text" name="E01DLILPA" size="17" maxlength="17" value="<%= deduct.getE01DLILPA().trim()%>" onKeypress="enterDecimal()">            </td>
            <td nowrap >
              <div align="right">Last Payment Date :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01DLILPM" size="2" maxlength="2" value="<%= deduct.getE01DLILPM().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DLILPD" size="2" maxlength="2" value="<%= deduct.getE01DLILPD().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DLILPY" size="2" maxlength="2" value="<%= deduct.getE01DLILPY().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01DLILPM,document.forms[0].E01DLILPD,document.forms[0].E01DLILPY)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
            </td>
		  </tr>
          <tr id="trdark">
            <td nowrap >
              <div align="right">Remarks :</div>
            </td>
            <td nowrap colspan="3" ><input type="text" name="E01REMK01" size="81" maxlength="80"  value="<%= deduct.getE01REMK01().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right"></div>
            </td>
            <td nowrap colspan="3" ><input type="text" name="E01REMK02" size="81" maxlength="80"  value="<%= deduct.getE01REMK02().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap >
              <div align="right"></div>
            </td>
            <td nowrap colspan="3" ><input type="text" name="E01REMK03" size="81" maxlength="80"  value="<%= deduct.getE01REMK03().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right"></div>
            </td>
            <td nowrap colspan="3" ><input type="text" name="E01REMK04" size="81" maxlength="80"  value="<%= deduct.getE01REMK04().trim()%>">
            </td>
          </tr>
         </table>
      </td>
    </tr>
  </table>

<%
    String dedNew = "";
    try {
      dedNew = request.getParameter("NEW");
      if (dedNew==null) dedNew="N";
    }
    catch (Exception e) {
      dedNew = "N";
    }

    if (dedNew.equals("Y")) { %>
  <table border="0" width="100%">
    <tr>
      <td>
        <div align="center">
          <input id="EIBSBTN" type=submit name="Submit" value="Submit">
        </div>
      </td>
    </tr>
  </table>
  <p>
  <div align="center"> </div>
  <% } else {%>
  <table border="0" width="100%">
    <tr>
      <td>
        <div align="center">
          <input type="checkbox" name="DELDED" value="Y">Delete Deduction
        </div>
      </td>
    </tr>
    <tr>
      <td>
        <div align="center">
          <input id="EIBSBTN" type=button onClick="javascript:checkDelDed()" value="Submit">
        </div>
      </td>
    </tr>
  </table>
  <p>
  <div align="center"> </div>
  <% } %>
<SCRIPT LANGUAGE="JavaScript">

 function checkDelDed(){
  var okdel=false;

  document.forms[0].OPT.value="M";
  // alert("opt=" + document.forms[0].OPT.value);
  if (document.forms[0].DELDED.checked) {
    okdel = confirm("Are you sure you want to delete this deduction?");
    if ( okdel ) document.forms[0].OPT.value="D"; else return false;
  }
  document.forms[0].submit();
 }

</SCRIPT>
</form>
</body>
</html>
