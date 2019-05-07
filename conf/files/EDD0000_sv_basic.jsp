<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Savings Account</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="svBasic" class="datapro.eibs.beans.EDD000001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "msgUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT> 
 <script src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"></script>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

	builtNewMenu(sv_m_opt);
  builtHPopUp();

  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }

  initMenu();
</SCRIPT>
<%
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>
<H3 align="center">
<% if (userPO.getPurpose().equals("NEW")) out.print("Savings Account Opening");
   else if (userPO.getPurpose().equals("MAINTENANCE")) out.print("Savings Account Maintenance");
   else out.print("");%><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="sv_basic, EDD0000"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="30">
  <INPUT TYPE=HIDDEN NAME="SCRACMBNK" VALUE="<%= svBasic.getE01ACMBNK().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01ACMATY" VALUE="<%= svBasic.getE01ACMATY().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01ACMACD" VALUE="<%= svBasic.getE01ACMACD().trim()%>">
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
                <input type="text" name="E01ACMCUN" size="9" maxlength="9" value="<%= svBasic.getE01ACMCUN().trim()%>"  <%=(msgUser.getE01CCU().equals("Y"))?"" : "readonly" %>>
                <% if (msgUser.getE01CCU().equals("Y")) { %>
                <a href="javascript:GetCustomerDescId('E01ACMCUN','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a></div>
                 <%}%>
            </td>
            <td nowrap width="16%" >
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" >
              <div align="left">
                <input type="text" name="E01CUSNA1" size="45" maxlength="45" value="<%= svBasic.getE01CUSNA1().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%">
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="20%">
              <div align="left">
                <input type="text" name="E01ACMACC" size="12" maxlength="9" value="<%= svBasic.getE01ACMACC().trim()%>">
              </div>
            </td>
            <td nowrap width="16%">
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="16%">
              <div align="left"><b>
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%">
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%">
              <div align="left"><b>
                <input type="text" name="E01ACMPRO" size="4" maxlength="4" value="<%= svBasic.getE01ACMPRO().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <H4> Basic Information</H4>
<table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="29%">
              <div align="right">Opening Date:</div>
            </td>
            <td nowrap width="19%">
              <input type="text" name="E01ACMOP1" size="2" maxlength="2" value="<%= svBasic.getE01ACMOP1().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01ACMOP2" size="2" maxlength="2" value="<%= svBasic.getE01ACMOP2().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01ACMOP3" size="2" maxlength="2" value="<%= svBasic.getE01ACMOP3().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01ACMOP1,document.forms[0].E01ACMOP2,document.forms[0].E01ACMOP3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  >
            </td>
            <td nowrap width="26%">
              <div align="right">Referral Code:</div>
            </td>
            <td nowrap width="26%">
              <select name="E01ACMRCD">
                <option value=" "<% if (!(svBasic.getE01ACMRCD().equals("D") ||svBasic.getE01ACMRCD().equals("C")||svBasic.getE01ACMRCD().equals("A"))) out.print("selected"); %>></option>
                <option value="D"<% if (svBasic.getE01ACMRCD().equals("D")) out.print("selected"); %>>Include
                Debits Only</option>
                <option value="C"<% if (svBasic.getE01ACMRCD().equals("C")) out.print("selected"); %>>Include
                Credits Only</option>
                <option value="A"<% if (svBasic.getE01ACMRCD().equals("A")) out.print("selected"); %>>Include
                Both</option>
              </select>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="29%">
              <div align="right"> Withholding Deductions:</div>
            </td>
            <td nowrap width="19%">
              <input type="text" name="E01ACMWHF" size="2" maxlength="1" value="<%= svBasic.getE01ACMWHF().trim()%>">
              <a href="javascript:GetCode('E01ACMWHF','STATIC_cd_taxes.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  >
            </td>
            <td nowrap width="26%">
              <div align="right">Type of Signatures:</div>
            </td>
            <td nowrap width="26%">
              <select name="E01ACMPEC" size="1">
                <option value=" " <% if (!(svBasic.getE01ACMPEC().equals("1") || svBasic.getE01ACMPEC().equals("2") || svBasic.getE01ACMPEC().equals("3") || svBasic.getE01ACMPEC().equals("4"))) out.print("selected"); %>></option>
                <option value="1"<%if (svBasic.getE01ACMPEC().equals("1")) out.print("selected"); %>>Individual</option>
                <option value="2"<%if (svBasic.getE01ACMPEC().equals("2")) out.print("selected"); %>>Both</option>
                <option value="3"<%if (svBasic.getE01ACMPEC().equals("3")) out.print("selected"); %>>Either</option>
                <option value="4"<%if (svBasic.getE01ACMPEC().equals("4")) out.print("selected"); %>>Other</option>
              </select>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="29%" height="23">
              <div align="right">Direct Deposit :</div>
            </td>
            <td nowrap width="19%" height="23">
              <input type="radio" name="E01ACMF042" value="Y" onClick="document.forms[0].E01ACMF042.value='Y'"
			  <%if(svBasic.getE01ACMF042().equals("Y")) out.print("checked");%>>Yes
              <input type="radio" name="E01ACMF042" value="N" onClick="document.forms[0].E01ACMF042.value='N'"
			  <%if(svBasic.getE01ACMF042().equals("N")) out.print("checked");%>>No
			</td>
            <td nowrap width="26%" height="23">
              <div align="right">Payable Through:</div>
            </td>
            <td nowrap width="26%" height="23">
              <input type="hidden" name="E01ACMPTF" value="<%= svBasic.getE01ACMPTF()%>">
              <input type="radio" name="CE01ACMPTF" value="Y" onClick="document.forms[0].E01ACMPTF.value='Y'"
			  <%if(svBasic.getE01ACMPTF().equals("Y")) out.print("checked");%>>
              Yes
              <input type="radio" name="CE01ACMPTF" value="N" onClick="document.forms[0].E01ACMPTF.value='N'"
			  <%if(svBasic.getE01ACMPTF().equals("N")) out.print("checked");%>>
              No </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="29%" height="19">
              <div align="right">Mailing Address:</div>
            </td>
            <td nowrap width="19%" height="19">
              <input type="text" name="E01ACMMLA" size="2" maxlength="1" value="<%= svBasic.getE01ACMMLA().trim()%>">
              <a href="javascript:GetMailing('E01ACMMLA',document.forms[0].E01ACMCUN.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0"></a>
            </td>
            <td nowrap width="26%" height="19">
              <div align="right">Cost Center:</div>
            </td>
            <td nowrap width="26%" height="19">
              <input type="text" name="E01ACMCCN" size="8" maxlength="6" value="<%= svBasic.getE01ACMCCN().trim()%>" onKeyPress="enterInteger()">
              <a href="javascript:GetCostCenter('E01ACMCCN',document.forms[0].SCRACMBNK.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  >
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="29%" height="19">
              <div align="right">Special Local Float:</div>
            </td>
            <td nowrap width="19%" height="19">
              <input type="text" size="2" maxlength="1" value="<%= svBasic.getE01ACMWLF().trim()%>" name="E01ACMWLF">
              <a href="javascript:GetCode('E01ACMWLF','STATIC_rt_delay.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
            <td nowrap width="26%" height="19">
              <div align="right">Special Non-local Float:</div>
            </td>
            <td nowrap width="26%" height="19">
              <input type="text" size="2" maxlength="1" value="<%= svBasic.getE01ACMWNF().trim()%>" name="E01ACMWNF">
              <a href="javascript:GetCode('E01ACMWNF','STATIC_rt_delay.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="29%" height="19">
              <div align="right">Required Document Table:</div>
            </td>
            <td nowrap width="19%" height="19">
              <input type="text" size="2" maxlength="1" readonly value="<%= svBasic.getE01APCTNU().trim()%>" name="E01APCTNU">
            </td>
            <td nowrap width="26%" height="19">
            	<div align="right">Inquiry Level (0-9) :</div>
            </td>
            <td nowrap width="26%" height="19">
				<input type="text" size="2" maxlength="1" value="<%= svBasic.getE01ACMF043().trim()%>" name="E01ACMF043">
			</td>
          </tr>
          <tr id="trdark">
            <td nowrap width="29%" height="19">
              <div align="right">Bank/Branch :</div>
            </td>
            <td nowrap width="19%" height="19">
             <% if (svBasic.getH01SCRCOD().trim().equals("N")) { %>
              <input type="text" name="E01ACMBNK" size="2" maxlength="2" value="<%= svBasic.getE01ACMBNK().trim()%>" readonly>
              <input type="text" name="E01ACMBRN" size="2" maxlength="3" value="<%= svBasic.getE01ACMBRN().trim()%>">
              <a href="javascript:GetBranch('E01ACMBRN','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"  ></a>
             <% } else {%>
              <input type="text" name="E01ACMBNK" size="2" maxlength="2" value="<%= svBasic.getE01ACMBNK().trim()%>" readonly>
              <input type="text" name="E01ACMBRN" size="2" maxlength="3" value="<%= svBasic.getE01ACMBRN().trim()%>" readonly>
             <% }%>
            </td>
            <td nowrap width="26%" height="19">
              <div align="right"></div>
            </td>
            <td nowrap width="26%" height="19">

            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<H4></H4>
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="30%">
              <div align="right">Ownership of Account :</div>
            </td>
            <td nowrap width="18%">
              <input type="text" size="2" maxlength="1" value="<%= svBasic.getE01ACMCT1().trim()%>" name="E01ACMCT1">
              <a href="javascript:GetCode('E01ACMCT1','STATIC_acc_ownership.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  >
			</td>
            <td nowrap width="28%">
              <div align="right">Beneficiary Designation :</div>
            </td>
            <td nowrap width="24%">
               <input type="text" size="2" maxlength="1" value="<%= svBasic.getE01ACMCT2().trim()%>" name="E01ACMCT2">
              <a href="javascript:GetCode('E01ACMCT2','STATIC_acc_benef_designation.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  >
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="30%">
              <div align="right">Purpose of Account :</div>

            </td>
            <td nowrap width="18%" colspan="3">
            	<input type="text" size="41" maxlength="40" value="<%= svBasic.getE01ACMPA1().trim()%>" name="E01ACMPA1">
            	<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  >
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="30%">
              <div align="right"></div>
            </td>
            <td nowrap width="70%" colspan="3">
            	<input type="text" size="41" maxlength="40" value="<%= svBasic.getE01ACMPA2().trim()%>" name="E01ACMPA2">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>


  <H4>Service Charges Information</H4>
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="30%">
              <div align="right">Service Charges:</div>
            </td>
            <td nowrap width="18%"> 
              <input type="radio" name="E01ACMSCF" value="Y" onClick="document.forms[0].E01ACMSCF.value='Y'" <%if(svBasic.getE01ACMSCF().equals("Y")) out.print("checked");%>>Yes
              <input type="radio" name="E01ACMSCF" value="N" onClick="document.forms[0].E01ACMSCF.value='N'" <%if(svBasic.getE01ACMSCF().equals("N")) out.print("checked");%>>No 
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" border="0" >
            </td>
            <td nowrap width="28%">
              <div align="right">Service Charges Structure:</div>
            </td>
            <td nowrap width="24%">
              <input type="text" name="E01ACMACL" size="2" maxlength="1" value="<%= svBasic.getE01ACMACL().trim()%>">
              <a href="javascript:GetRetCod('E01ACMACL',document.forms[0].E01ACMATY.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <H4>Account Statement Information</H4>
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="30%">
              <div align="right">Account Statement Frequency:</div>
            </td>
            <td nowrap width="18%">
              <select name="E01ACMSTF">
                <option value=" " <% if (!(svBasic.getE01ACMSTF().equals("D") ||svBasic.getE01ACMSTF().equals("W")
				||svBasic.getE01ACMSTF().equals("B")||svBasic.getE01ACMSTF().equals("M")||svBasic.getE01ACMSTF().equals("Q")))
				out.print("selected"); %>></option>
                <option value="D" <%if (svBasic.getE01ACMSTF().equals("D")) out.print("selected"); %>>Daily</option>
                <option value="W" <%if (svBasic.getE01ACMSTF().equals("W")) out.print("selected"); %>>Weekly</option>
                <option value="B" <%if (svBasic.getE01ACMSTF().equals("B")) out.print("selected"); %>>Bi-Weekly</option>
                <option value="M" <%if (svBasic.getE01ACMSTF().equals("M")) out.print("selected"); %>>Monthly</option>
                <option value="Q" <%if (svBasic.getE01ACMSTF().equals("Q")) out.print("selected"); %>>Quarterly</option>
              </select>
            </td>
            <td nowrap width="28%">
              <div align="right">Hold Mail :</div>
            </td>
            <td nowrap width="24%">
              <input type="hidden" name="E01ACMHSF" value="<%= svBasic.getE01ACMHSF()%>">
              <input type="radio" name="CE01ACMHSF" value="H" onClick="document.forms[0].E01ACMHSF.value='H'"
			  <%if(svBasic.getE01ACMHSF().equals("H")) out.print("checked");%>>
              Yes
              <input type="radio" name="CE01ACMHSF" value="" onClick="document.forms[0].E01ACMHSF.value=''"
			  <%if(svBasic.getE01ACMHSF().equals("")) out.print("checked");%>>
              No              </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="30%">
              <div align="right">Account Statement Day:</div>
            </td>
            <td nowrap width="18%">
              <input type="text" name="E01ACMSDY" size="3" maxlength="2" value="<%= svBasic.getE01ACMSDY().trim()%>">
              <a href="javascript:GetCode('E01ACMSDY','STATIC_rt_ciclo.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
            <td nowrap width="28%">
              <div align="right">Consolidated Account Statement:</div>
            </td>
            <td nowrap width="24%">
              <input type="hidden" name="E01ACMCSF" value="<%= svBasic.getE01ACMCSF()%>">
              <input type="radio" name="CE01ACMCSF" value="Y" onClick="document.forms[0].E01ACMCSF.value='Y'"
			  <%if(svBasic.getE01ACMCSF().equals("Y")) out.print("checked");%>>
              Yes
              <input type="radio" name="CE01ACMCSF" value="N" onClick="document.forms[0].E01ACMCSF.value='N'"
			  <%if(svBasic.getE01ACMCSF().equals("N")) out.print("checked");%>>
              No </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="30%" height="23">
              <div align="right">Account Statement Type:</div>
            </td>
            <td nowrap width="18%" height="23">
              <select name="E01ACMSTY">
                <option value=" " <% if (!(svBasic.getE01ACMSTY().equals("P") ||svBasic.getE01ACMSTY().equals("C")||svBasic.getE01ACMSTY().equals("N"))) out.print("selected"); %>></option>
                <option value="P" <% if (svBasic.getE01ACMSTY().equals("P")) out.print("selected"); %>>Personal</option>
                <option value="C" <% if (svBasic.getE01ACMSTY().equals("C")) out.print("selected"); %>>Corporate</option>
                <option value="N" <% if (svBasic.getE01ACMSTY().equals("N")) out.print("selected"); %>>None</option>
              </select>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  >
            </td>
            <td nowrap width="28%" height="23">
              <div align="right">Daily Statement Via:</div>
            </td>
            <td nowrap width="24%" height="23">
              <select name="E01ACMSTE">
                <option value=" " <% if (!(svBasic.getE01ACMSTE().equals("T") ||svBasic.getE01ACMSTE().equals("P")
				||svBasic.getE01ACMSTE().equals("F")||svBasic.getE01ACMSTE().equals("E")||svBasic.getE01ACMSTE().equals("N")))
				out.print("selected"); %>></option>
                <option value="T" <%if (svBasic.getE01ACMSTE().equals("T")) out.print("selected"); %>>Telex</option>
                <option value="P" <%if (svBasic.getE01ACMSTE().equals("P")) out.print("selected"); %>>Printer</option>
                <option value="F" <%if (svBasic.getE01ACMSTE().equals("F")) out.print("selected"); %>>Fax</option>
                <option value="E" <%if (svBasic.getE01ACMSTE().equals("E")) out.print("selected"); %>>E-Mail</option>
                <option value="N" <%if (svBasic.getE01ACMSTE().equals("N")) out.print("selected"); %>>None</option>
              </select>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <H4>Passbook Asignation</H4>
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="30%">
              <div align="right">Passbook Number:</div>
            </td>
            <td nowrap width="70%">
              <input type="text" size="12" maxlength="12"  onkeypress="enterInteger()">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <% if (svBasic.getH01SCRCOD().trim().equals("N")) { %>
  <H4>Initial Deposit</H4>
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="30%">
              <div align="right">Account :</div>
            </td>
            <td nowrap width="28%">
              <input type="text" name="E01AFIDAC" size="12" maxlength="9"  value="<%= svBasic.getE01AFIDAC().trim()%>" >
             <a href="javascript:GetAccount('E01AFIDAC','','RT','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
             <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  >
             </td>
            <td nowrap width="24%">
           <div align="right">Amount :</div>
            <td nowrap width="28%">
             <input type="text" name="E01AFIIDA" size="15" maxlength="13"  value="<%= svBasic.getE01AFIIDA().trim()%>" onKeypress="enterDecimal()">
             <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  >
            </td>

          </tr>
          <tr id="trclear">
            <td nowrap width="30%">
              <div align="right">Description :</div>
            </td>
            <td nowrap width="18%">
    			<input type="text" name="E01AFIIDD" size="35" maxlength="30" value="<%= svBasic.getE01AFIIDD().trim()%>">
            	<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  >
            </td>
            <td nowrap width="28%">
              <div align="right">Source :</div>
            </td>
            <td nowrap width="24%">
              <select name="E01AFIIDS">
                <option value="" <% if (svBasic.getE01AFIIDS().equals("") || 
                	(!svBasic.getE01AFIIDS().equals("N") 
                	&& !svBasic.getE01AFIIDS().equals("1") 
                	&& !svBasic.getE01AFIIDS().equals("2") 
                	&& !svBasic.getE01AFIIDS().equals("3") 
                	&& !svBasic.getE01AFIIDS().equals("4") 
                	&& !svBasic.getE01AFIIDS().equals("5") 
                	&& !svBasic.getE01AFIIDS().equals("6") 
                	&& !svBasic.getE01AFIIDS().equals("7")
                	&& !svBasic.getE01AFIIDS().equals("8")
                	&& !svBasic.getE01AFIIDS().equals("9"))) out.print("selected"); %>></option>
                <option value="N" <%if (svBasic.getE01AFIIDS().equals("N")) out.print("selected"); %>>No Initial Deposit</option>
                <option value="1" <%if (svBasic.getE01AFIIDS().equals("1")) out.print("selected"); %>>Cash Deposit</option>
                <option value="2" <%if (svBasic.getE01AFIIDS().equals("2")) out.print("selected"); %>>Wire</option>
                <option value="2" <%if (svBasic.getE01AFIIDS().equals("2")) out.print("selected"); %>>Wire</option>
                <option value="3" <%if (svBasic.getE01AFIIDS().equals("3")) out.print("selected"); %>>Check</option>
                <option value="4" <%if (svBasic.getE01AFIIDS().equals("4")) out.print("selected"); %>>Internal</option>
                <option value="5" <%if (svBasic.getE01AFIIDS().equals("5")) out.print("selected"); %>>External Transfer</option>
                <option value="6" <%if (svBasic.getE01AFIIDS().equals("6")) out.print("selected"); %>>Traveler Checks</option>
                <option value="7" <%if (svBasic.getE01AFIIDS().equals("7")) out.print("selected"); %>>Other</option>
                <option value="8" <%if (svBasic.getE01AFIIDS().equals("8")) out.print("selected"); %>>Loan Proceeds</option>
                <option value="9" <%if (svBasic.getE01AFIIDS().equals("9")) out.print("selected"); %>>Mixed Deposit</option>
              </select>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <% } %>

  <H4>Offset Accounts</H4>
<TABLE class="tableinfo"  align="center">
  <TR><TD>

   <table id="headTable">
    <tr id="trdark">
      <td nowrap align="center" >Concept</td>
      <td nowrap align="center" >Bank </td>
      <td nowrap align="center" >Branch</td>
      <td nowrap align="center" >Currency</td>
      <td nowrap align="center" >Reference</td>
      <td nowrap align="center" >Amount</td>
    </tr>
    </table>

    <div id="dataDiv" class="scbarcolor" style="height:60; overflow-y :scroll; z-index:0" >
     <table id="dataTable">
          <%
  				   int amount = 9;
 				   String name;
  					for ( int i=1; i<=amount; i++ ) {
   					  name = i + "";
   			%>
          <tr id="trclear")>
            <td nowrap >
              <div align="center">
                <input type="text" name="E01OFFOP<%= name %>" size="2" maxlength="2" value="<%= svBasic.getField("E01OFFOP"+name).getString().trim()%>">
                <input type="hidden" name="E01OFFGL<%= name %>" value="<%= svBasic.getField("E01OFFGL"+name).getString().trim()%>">
                <input type="text" name="E01OFFCO<%= name %>" size="25" maxlength="25" readonly value="<%= svBasic.getField("E01OFFCO"+name).getString().trim()%>"
                  oncontextmenu="showPopUp(conceptHelp,this.name,document.forms[0].SCRACMBNK.value,'','E01OFFGL<%= name %>','E01OFFOP<%= name %>',document.forms[0].E01ACMACD.value); return false;">
              </div>
            </td>
            <td nowrap >
              <div align="center">
                <input type="text" name="E01OFFBK<%= name %>" size="2" maxlength="2" value="<%= svBasic.getField("E01OFFBK"+name).getString().trim()%>">
              </div>
            </td>
            <td nowrap >
              <div align="center">
                <input type="text" name="E01OFFBR<%= name %>" size="3" maxlength="3" value="<%= svBasic.getField("E01OFFBR"+name).getString().trim()%>"
                oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].SCRACMBNK.value,'','','',''); return false;">
              </div>
            </td>
            <td nowrap >
              <div align="center">
                <input type="text" name="E01OFFCY<%= name %>" size="3" maxlength="3" value="<%= svBasic.getField("E01OFFCY"+name).getString().trim()%>"
                oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].SCRACMBNK.value,'','','',''); return false;">
              </div>
            </td>
            <td nowrap >
              <div align="center">
                  <input type="text" name="E01OFFAC<%= name %>" size="12" maxlength="9"  value="<%= svBasic.getField("E01OFFAC"+name).getString().trim()%>"
                oncontextmenu="showPopUp(accountHelp,this.name,document.forms[0].SCRACMBNK.value,'','','','RT'); return false;">
              </div>
            </td>
            <td nowrap >
              <div align="center">
                  <input type="text" name="E01OFFAM<%= name %>" size="15" maxlength="13"  value="<%= svBasic.getField("E01OFFAM"+name).getString().trim()%>" onKeypress="enterDecimal()">
              </div>
            </td>
          </tr>
          <%
    		}
    		%>
    		</table>
        </div>
      <table id="footTable">
          <tr id="trdark">
            <td nowrap  align="right"><b>Account Equivalent Currency:</b>
            </td>
            <td nowrap  align="center">
                <input type="text" name="E01OFFEQV" size="15" maxlength="15" readonly value="<%= svBasic.getE01OFFEQV().trim()%>">
            </td>
          </tr>
        </table>

</TD>
</TR>
</TABLE>
 <SCRIPT language="javascript">
    function tableresize() {
     adjustEquTables(headTable,dataTable,dataDiv,0,true);
   }
  tableresize();
  window.onresize=tableresize;
  </SCRIPT>
<%
		if (error.getERWRNG().equals("Y")) {
				error.setERWRNG(" ");
	%>
			<h4 style="text-align:center"><input type="checkbox" name="H01FLGWK2" value="A">
      		Accept with Warnings</h4>

  <%
		}
	%> <br>
  <div align="center">
    <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>
</form>
</body>
</html>
