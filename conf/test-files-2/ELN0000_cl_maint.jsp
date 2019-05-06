<html>
<head>
<title>Credit Lines - Basic Information</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="clMant" class="datapro.eibs.beans.ELN000001Message" scope="session"/>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage" scope="session"/>

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos" scope="session"/>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBSa.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   builtNewMenu(cl_m_opt);


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
  out.println("<SCRIPT> initMenu();  </SCRIPT>");
%>
<h3 align="center">Credit Lines - Basic Information
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cl_maint.jsp,ELN0000"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.credit.JSELN0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
  <table class="tableinfo">
    <tr>
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="8%" >
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="17%" >
              <div align="left">
                <input type="text" name="E01WLNCUN" size="9" maxlength="9" value="<%= clMant.getE01WLNCUN().trim()%>">
              </div>
            </td>
            <td nowrap width="8%" >
              <div align="right"><b>Line : </b></div>
            </td>
            <td nowrap width="7%" >
              <input type="text" name="E01WLNNUM" size="5" maxlength="4" value="<%= clMant.getE01WLNNUM().trim()%>" >
            </td>
            <td nowrap width="12%" >
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="4" width="48%" >
              <div align="left">
                <input type="text" name="E01CUSNA1" size="45" maxlength="45" value="<%= clMant.getE01CUSNA1().trim()%>" >
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Basic Information</h4>
    <table class="tableinfo">
    <tr>
      <td nowrap>
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="24%" >
              <div align="right">Bank / Branch :</div>
            </td>
            <td nowrap width="28%" >
              <input type="text" name="E01WLNBNK" size="2" maxlength="2" value="<%= clMant.getE01WLNBNK().trim()%>" onkeypress="enterInteger()" >
              <input type="text" name="E01WLNBRN" size="4" maxlength="3" value="<%= clMant.getE01WLNBRN().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:GetBranch('E01WLNBRN',document.forms[0].E01WLNBNK.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom">
            </td>
            <td nowrap width="24%" >
              <div align="right">Committed :</div>
            </td>
            <td nowrap width="24%" >
              <input type="hidden" name="E01WLNCOU" value="<%= clMant.getE01WLNCOU()%>">
              <input type="radio" name="CE01WLNCOU" value="C" onClick="document.forms[0].E01WLNCOU.value='C'"
			  <%if(clMant.getE01WLNCOU().equals("C")) out.print("checked");%>>
              Yes
              <input type="radio" name="CE01WLNCOU" value="U" onClick="document.forms[0].E01WLNCOU.value='U'"
			  <%if( clMant.getE01WLNCOU().equals("U") || clMant.getE01WLNCOU().equals("") ){ out.print("checked"); } %>>
              No </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="24%" >
              <div align="right">Currency / G/L Number :</div>
            </td>
            <td nowrap width="28%" >
              <input type="text" name="E01WLNCCY" size="4" maxlength="3" value="<%= clMant.getE01WLNCCY().trim()%>" >
              <a href="javascript:GetCurrency('E01WLNCCY',document.forms[0].E01WLNBNK.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a>
              <input type="text" name="E01WLNGLN" size="16" maxlength="12" value="<%= clMant.getE01WLNGLN().trim()%>"  onkeypress="enterInteger()">
              <a href="javascript:GetLedger('E01WLNGLN',document.forms[0].E01WLNBNK.value,document.forms[0].E01WLNCCY.value,'90')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom">
            </td>
            <td nowrap width="24%" >
              <div align="right">Maturity Date :</div>
            </td>
            <td nowrap width="24%" >
              <input type="text" name="E01WLNMT1" size="2" maxlength="2" value="<%= clMant.getE01WLNMT1().trim()%>"  onkeypress="enterInteger()">
              <input type="text" name="E01WLNMT2" size="2" maxlength="2" value="<%= clMant.getE01WLNMT2().trim()%>"  onkeypress="enterInteger()">
              <input type="text" name="E01WLNMT3" size="2" maxlength="2" value="<%= clMant.getE01WLNMT3().trim()%>"  onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01WLNMT1,document.forms[0].E01WLNMT2,document.forms[0].E01WLNMT3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="24%" >
              <div align="right">Opening Date :</div>
            </td>
            <td nowrap width="28%" >
              <input type="text" name="E01WLNOP1" size="2" maxlength="2" value="<%= clMant.getE01WLNOP1().trim()%>"  onkeypress="enterInteger()">
              <input type="text" name="E01WLNOP2" size="2" maxlength="2" value="<%= clMant.getE01WLNOP2().trim()%>"  onkeypress="enterInteger()">
              <input type="text" name="E01WLNOP3" size="2" maxlength="2" value="<%= clMant.getE01WLNOP3().trim()%>"  onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01WLNOP1,document.forms[0].E01WLNOP2,document.forms[0].E01WLNOP3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom">
            </td>
            <td nowrap width="24%" >
              <div align="right">Cost Center :</div>
            </td>
            <td nowrap width="24%" >
              <input type="text" name="E01WLNCCS" size="8" maxlength="8" value="<%= clMant.getE01WLNCCS().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:GetCostCenter('E01WLNCCS',document.forms[0].E01WLNBNK.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="24%" >
              <div align="right">Terms :</div>
            </td>
            <td nowrap width="28%" >
              <input type="text" name="E01WLNTER" size="4" maxlength="3" value="<%= clMant.getE01WLNTER().trim()%>" onkeypress="enterInteger()">
              <select name="E01WLNTRC">
                <option value=" " <% if (!(clMant.getE01WLNTRC().equals("D") ||clMant.getE01WLNTRC().equals("M")||clMant.getE01WLNTRC().equals("Y"))) out.print("selected"); %>></option>
                <option value="D" <% if(clMant.getE01WLNTRC().equals("D")) out.print("selected");%>>Day(s)</option>
                <option value="M" <% if(clMant.getE01WLNTRC().equals("M")) out.print("selected");%>>Month(s)</option>
                <option value="Y" <% if(clMant.getE01WLNTRC().equals("Y")) out.print("selected");%>>Year(s)</option>
              </select>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom">
            </td>
            <td nowrap width="24%" >
              <div align="right">Authorization Date :</div>
            </td>
            <td nowrap width="24%" >
              <input type="text" name="E01WLNAU1" size="2" maxlength="2" value="<%= clMant.getE01WLNAU1().trim()%>"  onkeypress="enterInteger()">
              <input type="text" name="E01WLNAU2" size="2" maxlength="2" value="<%= clMant.getE01WLNAU2().trim()%>"  onkeypress="enterInteger()">
              <input type="text" name="E01WLNAU3" size="2" maxlength="2" value="<%= clMant.getE01WLNAU3().trim()%>"  onkeypress="enterInteger()">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="24%" >
              <div align="right">Authorization Type :</div>
            </td>
            <td nowrap width="28%" >
              <input type="text" name="E01WLNATY" size="3" maxlength="2" value="<%= clMant.getE01WLNATY().trim()%>" >
              <%-- <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom"> --%>
            </td>
            <td nowrap width="24%" >
              <div align="right">Type of Line :</div>
            </td>
            <td nowrap width="24%" >
              <input type="text" name="E01WLNTYL" size="3" maxlength="3" value="<%= clMant.getE01WLNTYL().trim()%>">
              <a href="javascript:GetCodeCNOFC('E01WLNTYL','14')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="24%" >
              <div align="right">Category of Line :</div>
            </td>
            <td nowrap width="28%" >
              <input type="text" name="E01WLNCAT" size="2" maxlength="1" value="<%= clMant.getE01WLNCAT().trim()%>" >
              <a href="javascript:GetCode('E01WLNCAT','STATIC_cl_cat.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" width="18" height="22" ></a>
            </td>
            <td nowrap width="24%" >
              <div align="right">Revision Date :</div>
            </td>
            <td nowrap width="24%" >
              <input type="text" name="E01WLNRV1" size="2" maxlength="2" value="<%= clMant.getE01WLNRV1().trim()%>"  onkeypress="enterInteger()">
              <input type="text" name="E01WLNRV2" size="2" maxlength="2" value="<%= clMant.getE01WLNRV2().trim()%>"  onkeypress="enterInteger()">
              <input type="text" name="E01WLNRV3" size="2" maxlength="2" value="<%= clMant.getE01WLNRV3().trim()%>"  onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01WLNRV1,document.forms[0].E01WLNRV2,document.forms[0].E01WLNRV3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="24%" height="22" >
              <div align="right">Amount Approved :</div>
            </td>
            <td nowrap width="28%" height="22" >
              <input type="text" name="E01WLNAMN" size="15" maxlength="15" value="<%= clMant.getE01WLNAMN().trim()%>"  onkeypress="enterDecimal()">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom">
            </td>
            <td nowrap width="24%" height="22" >
              <div align="right">Reallocation Date :</div>
            </td>
            <td nowrap width="24%" height="22" >
              <input type="text" name="E01WLNRE1" size="2" maxlength="2" value="<%= clMant.getE01WLNRE1().trim()%>"  onkeypress="enterInteger()">
              <input type="text" name="E01WLNRE2" size="2" maxlength="2" value="<%= clMant.getE01WLNRE2().trim()%>"  onkeypress="enterInteger()">
              <input type="text" name="E01WLNRE3" size="2" maxlength="2" value="<%= clMant.getE01WLNRE3().trim()%>"  onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01WLNRE1,document.forms[0].E01WLNRE2,document.forms[0].E01WLNRE3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="24%" >
              <div align="right">Reallocation Amount :</div>
            </td>
            <td nowrap width="28%" >
              <input type="text" name="E01WLNREA" size="15" maxlength="15" value="<%= clMant.getE01WLNREA().trim()%>"  onkeypress="enterSignDecimal()">
            </td>
            <td nowrap width="24%" >
              <div align="right">Term Indicator :</div>
            </td>
            <td nowrap width="24%" >
              <select name="E01WLNTRM">
                <option value=" " <% if (!(clMant.getE01WLNTRM().equals("D") ||clMant.getE01WLNTRM().equals("M")||clMant.getE01WLNTRM().equals("Y"))) out.print("selected"); %>></option>
                <option value="L" <% if(clMant.getE01WLNTRM().equals("L")) out.print("selected");%>>Long
                Term</option>
                <option value="S" <% if(clMant.getE01WLNTRM().equals("S")) out.print("selected");%>>Short
                Term</option>
                <option value="T" <% if(clMant.getE01WLNTRM().equals("T")) out.print("selected");%>>Taken
                from Correspondent</option>
              </select>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="24%" >
              <div align="right">Authorized by :</div>
            </td>
            <td nowrap width="28%" >
              <input type="text" name="E01WLNABY" size="26" maxlength="25" value="<%= clMant.getE01WLNABY().trim()%>" >
            </td>
            <td nowrap width="24%" >
              <div align="right">Line Control :</div>
            </td>
            <td nowrap width="24%" >
              <input type="text" name="E01WLNCCU" size="10" maxlength="9" value="<%= clMant.getE01WLNCCU().trim()%>"  onkeypress="enterInteger()">
              <input type="text" name="E01WLNCLN" size="5" maxlength="4" value="<%= clMant.getE01WLNCLN().trim()%>"  onkeypress="enterInteger()">
              <a href="javascript:GetCreditLine('E01WLNCLN',document.forms[0].E01WLNCCU.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="24%" >
              <div align="right">Credit Card Number :</div>
            </td>
            <td nowrap width="28%" >
              <input type="text" name="E01WLNTJT" size="16" maxlength="16" value="<%= clMant.getE01WLNTJT().trim()%>" onKeyPress="enterInteger()">
            </td>
            <td nowrap width="24%" >
              <div align="right">Payment Type :</div>
            </td>
            <td nowrap width="24%" >
              <input type="text" name="E01WLNUC1" size="5" maxlength="1" value="<%= clMant.getE01WLNUC1().trim()%>">
              <a href="javascript:GetCode('E01WLNUC1','STATIC_cl_payment.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              <input type="text" name="E01WLNDC1" size="35" maxlength="30" value="<%= clMant.getE01WLNDC1().trim()%>" onKeyPress="enterInteger()">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="24%" >
              <div align="right">Customer / Related Line :</div>
            </td>
            <td nowrap width="28%" >
              <input type="text" name="E01WLNCGM" size="10" maxlength="9" value="<%= clMant.getE01WLNCGM().trim()%>"  onKeyPress="enterInteger()">
              <input type="text" name="E01WLNLGM" size="5" maxlength="4" value="<%= clMant.getE01WLNLGM().trim()%>"  onKeyPress="enterInteger()">
              <a href="javascript:GetCreditLine('E01WLNLGM',document.forms[0].E01WLNCGM.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a></td>
            <td nowrap width="24%" >&nbsp;</td>
            <td nowrap width="24%" >&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Tariff</h4>
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="32%" >
              <div align="right">Loans Tariff Table :</div>
            </td>
            <td nowrap width="28%" >
              <input type="text" name="E01WLNTLN" size="2" maxlength="2" value="<%= clMant.getE01WLNTLN().trim()%>" >
              <a href="javascript:GetLoanTable('E01WLNTLN','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a>
            </td>
            <td nowrap width="22%" >
              <div align="right">Grace Period - Rate :</div>
            </td>
            <td nowrap width="18%" >
              <input type="text" name="E01WLNMRT" size="10" maxlength="9" value="<%= clMant.getE01WLNMRT().trim()%>" onKeypress="enterSignDecimal()">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="32%" >
              <div align="right"> L/C Tariff Table :</div>
            </td>
            <td nowrap width="28%" >
              <input type="text" name="E01WLNTLC" size="2" maxlength="2" value="<%= clMant.getE01WLNTLC().trim()%>" >
              <a href="javascript:GetTariffLC('E01WLNTLC','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a>
            </td>
            <td nowrap width="22%" >
              <div align="right">Floating Rate Type Code :</div>
            </td>
            <td nowrap width="18%" >
              <input type="text" name="E01WLNFTB" size="2" maxlength="2" value="<%= clMant.getE01WLNFTB().trim()%>">
              <a href="javascript:GetFloating('E01WLNFTB')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0"  ></a>
              <select name="E01WLNFTY">
                <option value=" " <% if (!(clMant.getE01WLNFTY().equals("FP") ||clMant.getE01WLNFTY().equals("FS"))) out.print("selected"); %>></option>
                <option value="FP" <% if (clMant.getE01WLNFTY().equals("FP")) out.print("selected"); %>>Primary</option>
                <option value="FS" <% if (clMant.getE01WLNFTY().equals("FS")) out.print("selected"); %>>Secondary</option>
              </select>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="32%" >
              <div align="right"> DDA Tariff Table :</div>
            </td>
            <td nowrap width="28%" >
              <input type="text" name="E01WLNTRT" size="2" maxlength="2" value="<%= clMant.getE01WLNTRT().trim()%>" >
              <a href="javascript:GetRetCod('E01WLNTRT','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0"  ></a>
            </td>
            <td nowrap width="22%" >
              <div align="right">Customer Credit Level :</div>
            </td>
            <td nowrap width="18%" >
              <input type="text" name="E01WLNCRR" size="2" maxlength="1" value="<%= clMant.getE01WLNCRR().trim()%>" >
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="32%" >
              <div align="right">Line Purpose :</div>
            </td>
            <td nowrap width="28%" >
              <input type="text" name="E01WLNPUR" size="36" maxlength="35" value="<%= clMant.getE01WLNPUR().trim()%>">
            </td>
            <td nowrap width="22%" >
              <div align="right"></div>
            </td>
            <td nowrap width="18%" >&nbsp; </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Charges</h4>
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="21%" >
              <div align="right">Fee Type :</div>
            </td>
            <td nowrap width="17%" >
              <input type="text" name="E01WLNFET" size="3" maxlength="2" value="<%= clMant.getE01WLNFET().trim().equals("")?"00":clMant.getE01WLNFET().trim()%>" >
              <a href="javascript:GetCode('E01WLNFET','STATIC_cl_chrg.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
            <td nowrap width="22%" >
              <div align="right">Next Charge Date :</div>
            </td>
            <td nowrap width="40%" >
              <input type="text" name="E01WLNCH1" size="2" maxlength="2" value="<%= clMant.getE01WLNCH1().trim()%>"  onkeypress="enterInteger()">
              <input type="text" name="E01WLNCH2" size="2" maxlength="2" value="<%= clMant.getE01WLNCH2().trim()%>"  onkeypress="enterInteger()">
              <input type="text" name="E01WLNCH3" size="2" maxlength="2" value="<%= clMant.getE01WLNCH3().trim()%>"  onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01WLNCH1,document.forms[0].E01WLNCH2,document.forms[0].E01WLNCH3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="21%" >
              <div align="right">Rate for Fees :</div>
            </td>
            <td nowrap width="17%" >
              <input type="text" name="E01WLNBSR" size="10" maxlength="9" value="<%= clMant.getE01WLNBSR().trim()%>"  onkeypress="enterDecimal()">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom">
            </td>
            <td nowrap width="22%" >
              <div align="right">Period Base Days:</div>
            </td>
            <td nowrap width="40%" >
              <input type="text" name="E01WLNYBS" size="4" maxlength="3" value="<%= clMant.getE01WLNYBS().trim()%>"  onkeypress="enterInteger()">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="21%" >
              <div align="right">Frequency :</div>
            </td>
            <td nowrap width="17%" >
              <input type="text" name="E01WLNPRD" size="2" maxlength="1" value="<%= clMant.getE01WLNPRD().trim()%>" >
			  <a href="javascript:GetCode('E01WLNPRD','STATIC_cl_frec.jsp')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
            <td nowrap width="22%" >
              <div align="right">Debit Account :</div>
            </td>
            <td nowrap width="40%" >
              <input type="text" name="E01WLNBDA" size="2" maxlength="2" value="<%= clMant.getE01WLNBDA().trim()%>"  onkeypress="enterInteger()">
              <input type="text" name="E01WLNDAB" size="4" maxlength="3" value="<%= clMant.getE01WLNDAB().trim()%>"  onkeypress="enterInteger()">
              <a href="javascript:GetBranch('E01WLNDAB',document.forms[0].E01WLNBDA.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a>
              <input type="text" name="E01WLNCDA" size="4" maxlength="3" value="<%= clMant.getE01WLNCDA().trim()%>" >
              <a href="javascript:GetCurrency('E01WLNCDA',document.forms[0].E01WLNBDA.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a>
              <input type="text" name="E01WLNADN" size="16" maxlength="12" value="<%= clMant.getE01WLNADN().trim()%>" onkeypress="enterInteger()" >
              <a href="javascript:GetLedgerOrAccount('E01WLNADN',document.forms[0].E01WLNBDA.value,document.forms[0].E01WLNCDA.value,'RT','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p align="center">
    <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </p>
  </form>
</body>
</html>
