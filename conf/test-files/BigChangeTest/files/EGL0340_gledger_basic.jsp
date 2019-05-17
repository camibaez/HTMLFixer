<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Cuentas Corrientes</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="gLedger" class="datapro.eibs.beans.EGL034001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

  builtHPopUp();

  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
  }
</SCRIPT>

<%
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>
<H3 align="center">General Ledger Account Master File Maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="gledger_basic.jsp, EGL0340"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEGL0340" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="3">
  <INPUT TYPE=HIDDEN NAME="E01GLMACD" value="<%= gLedger.getE01GLMACD().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01GLMF45" value="0">
  <H4>Basic Information</H4>
  <table  class="tableinfo">
    <tr>
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="29%">
              <div align="right">General Ledger :</div>
            </td>
            <td nowrap colspan="3">
                <input type="text" name="E01GLMBNK" size="2" maxlength="2" value="<%= gLedger.getE01GLMBNK().trim()%>" readonly>
                <input type="text" name="E01GLMCCY" size="3" maxlength="3" value="<%= gLedger.getE01GLMCCY().trim()%>" readonly>
                <input type="text" name="E01GLMGLN" size="17" maxlength="16"  value="<%= gLedger.getE01GLMGLN().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="29%">
              <div align="right">Description :</div>
            </td>
            <td nowrap colspan="3">
              <input type="text" name="E01GLMDSC" size="36" maxlength="35" value="<%= gLedger.getE01GLMDSC().trim()%>">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" align="absbottom" border="0" >
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="29%">
              <div align="right">Account Type :</div>
            </td>
            <td nowrap width="19%">
              <INPUT type="text" name="E01GLMATY" size="5" maxlength="4" value="<%= gLedger.getE01GLMATY().trim()%>">
              <a href="javascript:GetCodeCNOFC('E01GLMATY','04')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
        	</td>
            <td nowrap width="26%">
              <div align="right">Account Class :</div>
            </td>
            <td nowrap width="26%">
             <input type="text" name="E01GLMCLS" size="3" maxlength="2" value="<%= gLedger.getE01GLMCLS()%>">
             <a href="javascript:GetCodeCNOFC('E01GLMCLS','01')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="29%">
              <div align="right">Cost Center Required :</div>
            </td>
            <td nowrap width="19%">
              <INPUT type="radio" name="E01GLMCCN" value="Y" <%if(gLedger.getE01GLMCCN().equals("Y")) out.print("checked");%>>
              Yes
              <INPUT type="radio" name="E01GLMCCN" value="N" <%if(!gLedger.getE01GLMCCN().equals("Y")) out.print("checked");%>> No
            </td>
            <td nowrap width="26%">
              <div align="right"> CIF Classification Code :</div>
            </td>
            <td nowrap width="26%">
             <input type="text" name="E01GLMCIC" size="3" maxlength="2" value="<%= gLedger.getE01GLMCIC()%>">
             <a href="javascript:GetCodeCNOFC('E01GLMCIC','06')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
		  </tr>
		  <tr id="trdark">
            <td nowrap width="29%">
              <div align="right"> Reconcilable Account :</div>
            </td>
            <td nowrap width="19%">
              <INPUT type="radio" name="E01GLMRCL" value="Y" <%if(gLedger.getE01GLMRCL().equals("Y")) out.print("checked");%>>
              Yes
              <INPUT type="radio" name="E01GLMRCL" value="N" <%if(!gLedger.getE01GLMRCL().equals("Y")) out.print("checked");%>> No
            </td>
            <td nowrap width="26%">
              <div align="right">Daily Account Statement :</div>
            </td>
            <td nowrap width="26%">
              <INPUT type="radio" name="E01GLMDST" value="Y" <%if(gLedger.getE01GLMDST().equals("Y")) out.print("checked");%>>
              Yes
              <INPUT type="radio" name="E01GLMDST" value="N" <%if(!gLedger.getE01GLMDST().equals("Y")) out.print("checked");%>> No
            </td>
         </tr>
          <tr id="trclear">
            <td nowrap width="29%">
              <div align="right">I.B.F Account :</div>
            </td>
            <td nowrap width="19%" height="19">
              <INPUT type="radio" name="E01GLMIBF" value="IB" <%if(gLedger.getE01GLMIBF().equals("IB")) out.print("checked");%>>
              Yes
              <INPUT type="radio" name="E01GLMIBF" value="" <%if(!gLedger.getE01GLMIBF().equals("IB")) out.print("checked");%>> No
            </td>
            <td nowrap width="26%">
              <div align="right">Accounting Level :</div>
            </td>
            <td nowrap width="26%">
              <input type="text" name="E01GLMACL" size="2" maxlength="1" value="<%= gLedger.getE01GLMACL().trim()%>" onkeypress="enterInteger()">
            </td>
          <tr id="trdark">
            <td nowrap width="29%">
              <div align="right">Lending Limit Account :</div>
            </td>
            <td nowrap width="19%">
              <INPUT type="radio" name="E01GLMPRV" value="Y" <%if(gLedger.getE01GLMPRV().equals("Y")) out.print("checked");%>>
              Yes
              <INPUT type="radio" name="E01GLMPRV" value="N" <%if(!gLedger.getE01GLMPRV().equals("Y")) out.print("checked");%>> No
            </td>
            <td nowrap width="26%">
              <div align="right">Budget Number :</div>
            </td>
            <td nowrap width="26%">
              <input type="text" name="E01GLMBUN" size="13" maxlength="12" value="<%= gLedger.getE01GLMBUN()%>" onKeyPress="enterInteger()">
              <a href="javascript:GetBudget('E01GLMBUN',document.forms[0].E01GLMBNK.value,document.forms[0].E01GLMCCY.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="29%">
              <div align="right">Treasury Account :</div>
            </td>
            <td nowrap width="19%">
              <INPUT type="radio" name="E01GLMMEF" value="Y" <%if(gLedger.getE01GLMMEF().equals("Y")) out.print("checked");%>>
              Yes
              <INPUT type="radio" name="E01GLMMEF" value="N" <%if(!gLedger.getE01GLMMEF().equals("Y")) out.print("checked");%>> No
            </td>
            <td nowrap width="26%">
              <div align="right">REPO Account :</div>
            </td>
            <td nowrap width="26%">
              <INPUT type="radio" name="E01GLMF51" value="Y" <%if(gLedger.getE01GLMF51().equals("Y")) out.print("checked");%>>
              Yes
              <INPUT type="radio" name="E01GLMF51" value="N" <%if(!gLedger.getE01GLMF51().equals("Y")) out.print("checked");%>> No
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap>
              <div align="right">Home Office Account :</div>
            </td>
            <td nowrap>
              <input type="text" name="E01GLMHOA" size="21" maxlength="20" value="<%= gLedger.getE01GLMHOA()%>">
            </td>
            <td nowrap width="26%" height="19">
              <div align="right">Rate Sensitivity Analysis :</div>
            </td>
            <td nowrap width="26%" height="19">
              <input type="text" name="E01GLMFR6" size="5" maxlength="5" value="<%= gLedger.getE01GLMFR6().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap>
              <div align="right">Reconciliation / Customers :</div>
            </td>
            <td nowrap>
              <SELECT name="E01GLMCPF">
				<OPTION value=" " <% if (!(gLedger.getE01GLMCPF().equals("1") ||gLedger.getE01GLMCPF().equals("2")
				||gLedger.getE01GLMCPF().equals("3")||gLedger.getE01GLMCPF().equals("N")))
				out.print("selected"); %>></OPTION>
                <OPTION value="1" <%if (gLedger.getE01GLMCPF().equals("1")) out.print("selected"); %>>Bank Reconciliation</OPTION>
                <OPTION value="2" <%if (gLedger.getE01GLMCPF().equals("2")) out.print("selected"); %>>Customer Number Required</OPTION>
                <OPTION value="3" <%if (gLedger.getE01GLMCPF().equals("3")) out.print("selected"); %>>Both</OPTION>
                <OPTION value="N" <%if (gLedger.getE01GLMCPF().equals("N")) out.print("selected"); %>>None</OPTION>
               </SELECT>
            </td>
            <td nowrap width="26%">
              <div align="right">Daily Book Input :</div>
            </td>
            <td nowrap width="26%">
              <INPUT type="radio" name="E01GLMF52" value="D" <%if(gLedger.getE01GLMF52().equals("D")) out.print("checked");%>>
              Detail
              <INPUT type="radio" name="E01GLMF52" value="T" <%if(!gLedger.getE01GLMF52().equals("D")) out.print("checked");%>> Total
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap>
              <div align="right">Branch to Consolidate :</div>
            </td>
            <td nowrap>
              <input type="text" name="E01GLMBRC" size="4" maxlength="3" value="<%= gLedger.getE01GLMBRC() %>">
			  <a href="javascript:GetBranch('E01GLMBRC',document.forms[0].E01GLMBNK.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a>
            </td>
            <td nowrap width="26%">
              <div align="right">Users Flags :</div>
            </td>
            <td nowrap width="26%">
              <input type="text" name="E01GLMF43" size="2" maxlength="1" value="<%= gLedger.getE01GLMF43().trim()%>">
              <input type="text" name="E01GLMF44" size="2" maxlength="1" value="<%= gLedger.getE01GLMF44().trim()%>">
              <input type="text" name="E01GLMF45" size="2" maxlength="1" value="<%= gLedger.getE01GLMF45().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <H4>Federal Reserve Banks Codes</H4>
  <table  class="tableinfo">
    <tr>
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="29%">
              <div align="right">Form 2900 :</div>
            </td>
            <td nowrap width="71%">
              <SELECT name="E01GLMF11">
                <option value=" " <% if (!(gLedger.getE01GLMF11().equals("2389") || gLedger.getE01GLMF11().equals("2514"))) out.print("selected"); %> selected></option>
                <OPTION value="2389" <%if (gLedger.getE01GLMF11().equals("2389")) out.print("selected"); %>>2389</OPTION>
                <OPTION value="2514" <%if (gLedger.getE01GLMF11().equals("2514")) out.print("selected"); %>>2514</OPTION>
                <OPTION value="2698" <%if (gLedger.getE01GLMF11().equals("2698")) out.print("selected"); %>>2698</OPTION>
                <OPTION value="2280" <%if (gLedger.getE01GLMF11().equals("2280")) out.print("selected"); %>>2280</OPTION>
                <OPTION value="2340" <%if (gLedger.getE01GLMF11().equals("2340")) out.print("selected"); %>>2340</OPTION>
                <OPTION value="6917" <%if (gLedger.getE01GLMF11().equals("6917")) out.print("selected"); %>>6917</OPTION>
                <OPTION value="2215" <%if (gLedger.getE01GLMF11().equals("2215")) out.print("selected"); %>>2215</OPTION>
                <OPTION value="0063" <%if (gLedger.getE01GLMF11().equals("0063")) out.print("selected"); %>>0063</OPTION>
                <OPTION value="0020" <%if (gLedger.getE01GLMF11().equals("0020")) out.print("selected"); %>>0020</OPTION>
                <OPTION value="0080" <%if (gLedger.getE01GLMF11().equals("0080")) out.print("selected"); %>>0080</OPTION>
                <OPTION value="2604" <%if (gLedger.getE01GLMF11().equals("2604")) out.print("selected"); %>>2604</OPTION>
                <OPTION value="2245" <%if (gLedger.getE01GLMF11().equals("2245")) out.print("selected"); %>>2245</OPTION>
                <OPTION value="6918" <%if (gLedger.getE01GLMF11().equals("6918")) out.print("selected"); %>>6918</OPTION>
                <OPTION value="6919" <%if (gLedger.getE01GLMF11().equals("6919")) out.print("selected"); %>>6919</OPTION>
                <OPTION value="C434" <%if (gLedger.getE01GLMF11().equals("C434")) out.print("selected"); %>>C434</OPTION>
               </SELECT>
                <input type="text" name="E01GLMF12" size="2" maxlength="1" value="<%= gLedger.getE01GLMF12().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="29%">
              <div align="right">Form 2950/2951 :</div>
            </td>
            <td nowrap width="71%">
                <input type="text" name="E01GLMF21" size="2" maxlength="1" value="<%= gLedger.getE01GLMF21().trim()%>">
                <input type="text" name="E01GLMF22" size="2" maxlength="1" value="<%= gLedger.getE01GLMF22().trim()%>">
                <input type="text" name="E01GLMF23" size="2" maxlength="1" value="<%= gLedger.getE01GLMF23().trim()%>">
                <input type="text" name="E01GLMF24" size="2" maxlength="1" value="<%= gLedger.getE01GLMF24().trim()%>">
                <input type="text" name="E01GLMF25" size="2" maxlength="1" value="<%= gLedger.getE01GLMF25().trim()%>">
                &nbsp;
                (Lines 12345 = + or -)
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="29%">
              <div align="right">Form BL1 :</div>
            </td>
            <td nowrap width="71%">
               <SELECT name="E01GLMF32">
               <option value=" " <% if (!(gLedger.getE01GLMF32().equals("1") || gLedger.getE01GLMF32().equals("2")
				|| gLedger.getE01GLMF32().equals("3") || gLedger.getE01GLMF32().equals("4") || gLedger.getE01GLMF32().equals("5")
				|| gLedger.getE01GLMF32().equals("6") || gLedger.getE01GLMF32().equals("7") || gLedger.getE01GLMF32().equals("8")
				|| gLedger.getE01GLMF32().equals("9") || gLedger.getE01GLMF32().equals("10"))) out.print("selected"); %> selected></option>
                <OPTION value="1" <%if (gLedger.getE01GLMF32().equals("1")) out.print("selected"); %>>1</OPTION>
                <OPTION value="2" <%if (gLedger.getE01GLMF32().equals("2")) out.print("selected"); %>>2</OPTION>
                <OPTION value="3" <%if (gLedger.getE01GLMF32().equals("3")) out.print("selected"); %>>3</OPTION>
                <OPTION value="4" <%if (gLedger.getE01GLMF32().equals("4")) out.print("selected"); %>>4</OPTION>
                <OPTION value="5" <%if (gLedger.getE01GLMF32().equals("5")) out.print("selected"); %>>5</OPTION>
                <OPTION value="6" <%if (gLedger.getE01GLMF32().equals("6")) out.print("selected"); %>>6</OPTION>
                <OPTION value="7" <%if (gLedger.getE01GLMF32().equals("7")) out.print("selected"); %>>7</OPTION>
                <OPTION value="8" <%if (gLedger.getE01GLMF32().equals("8")) out.print("selected"); %>>8</OPTION>
                <OPTION value="9" <%if (gLedger.getE01GLMF32().equals("9")) out.print("selected"); %>>9</OPTION>
                <OPTION value="10" <%if (gLedger.getE01GLMF32().equals("10")) out.print("selected"); %>>10</OPTION>
               </SELECT>
               &nbsp;
               Form BC :
               &nbsp;
               <SELECT name="E01GLMF35">
               <option value=" " <% if (!(gLedger.getE01GLMF35().equals("1") || gLedger.getE01GLMF35().equals("2")
				|| gLedger.getE01GLMF35().equals("3") || gLedger.getE01GLMF35().equals("4") || gLedger.getE01GLMF35().equals("5"))) out.print("selected"); %> selected></option>
                <OPTION value="1" <%if (gLedger.getE01GLMF35().equals("1")) out.print("selected"); %>>1</OPTION>
                <OPTION value="2" <%if (gLedger.getE01GLMF35().equals("2")) out.print("selected"); %>>2</OPTION>
                <OPTION value="3" <%if (gLedger.getE01GLMF35().equals("3")) out.print("selected"); %>>3</OPTION>
                <OPTION value="4" <%if (gLedger.getE01GLMF35().equals("4")) out.print("selected"); %>>4</OPTION>
                <OPTION value="5" <%if (gLedger.getE01GLMF35().equals("5")) out.print("selected"); %>>5</OPTION>
               </SELECT>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="29%">
              <div align="right">Of Which:</div>
            </td>
            <td nowrap width="71%">
               <SELECT name="E01GLMF33">
               <option value=" " <% if (!(gLedger.getE01GLMF33().equals("7") || gLedger.getE01GLMF33().equals("8")
				|| gLedger.getE01GLMF33().equals("9") || gLedger.getE01GLMF33().equals("F") || gLedger.getE01GLMF33().equals("O"))) out.print("selected"); %> selected></option>
                <OPTION value="7" <%if (gLedger.getE01GLMF33().equals("7")) out.print("selected"); %>>7</OPTION>
                <OPTION value="8" <%if (gLedger.getE01GLMF33().equals("8")) out.print("selected"); %>>8</OPTION>
                <OPTION value="9" <%if (gLedger.getE01GLMF33().equals("9")) out.print("selected"); %>>9</OPTION>
                <OPTION value="F" <%if (gLedger.getE01GLMF33().equals("F")) out.print("selected"); %>>F</OPTION>
                <OPTION value="O" <%if (gLedger.getE01GLMF33().equals("O")) out.print("selected"); %>>O</OPTION>
               </SELECT>
               <a href="javascript:GetCode('','STATIC_of_which.jsp')"><img src="<%=request.getContextPath()%>/images/aquire.gif" alt="Help" border="0" >
               Help</a>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="29%">
              <div align="right">Form BQ1 :</div>
            </td>
            <td nowrap width="71%">
               <SELECT name="E01GLMF41">
                <option value=" " <% if (!(gLedger.getE01GLMF41().equals("1") || gLedger.getE01GLMF41().equals("2")
				|| gLedger.getE01GLMF41().equals("3") || gLedger.getE01GLMF41().equals("4") || gLedger.getE01GLMF41().equals("5")
				|| gLedger.getE01GLMF41().equals("6") || gLedger.getE01GLMF41().equals("7") || gLedger.getE01GLMF41().equals("8"))) out.print("selected"); %> selected></option>
                <OPTION value="1" <%if (gLedger.getE01GLMF41().equals("1")) out.print("selected"); %>>1</OPTION>
                <OPTION value="2" <%if (gLedger.getE01GLMF41().equals("2")) out.print("selected"); %>>2</OPTION>
                <OPTION value="3" <%if (gLedger.getE01GLMF41().equals("3")) out.print("selected"); %>>3</OPTION>
                <OPTION value="4" <%if (gLedger.getE01GLMF41().equals("4")) out.print("selected"); %>>4</OPTION>
                <OPTION value="5" <%if (gLedger.getE01GLMF41().equals("5")) out.print("selected"); %>>5</OPTION>
                <OPTION value="6" <%if (gLedger.getE01GLMF41().equals("6")) out.print("selected"); %>>6</OPTION>
                <OPTION value="7" <%if (gLedger.getE01GLMF41().equals("7")) out.print("selected"); %>>7</OPTION>
                <OPTION value="8" <%if (gLedger.getE01GLMF41().equals("8")) out.print("selected"); %>>8</OPTION>
               </SELECT>
                &nbsp;
				Form BQ2 :
                &nbsp;
               <SELECT name="E01GLMF42">
                <option value=" " <% if (!(gLedger.getE01GLMF42().equals("1") || gLedger.getE01GLMF42().equals("2")
				|| gLedger.getE01GLMF42().equals("3"))) out.print("selected"); %> selected></option>
                <OPTION value="1" <%if (gLedger.getE01GLMF42().equals("1")) out.print("selected"); %>>1</OPTION>
                <OPTION value="2" <%if (gLedger.getE01GLMF42().equals("2")) out.print("selected"); %>>2</OPTION>
                <OPTION value="3" <%if (gLedger.getE01GLMF42().equals("3")) out.print("selected"); %>>3</OPTION>
               </SELECT>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="29%">
              <div align="right">Form BQ3 :</div>
            </td>
            <td nowrap width="71%">
               <SELECT name="E01GLMF43">
                <option value=" " <% if (!(gLedger.getE01GLMF43().equals("1") || gLedger.getE01GLMF43().equals("2")
				|| gLedger.getE01GLMF43().equals("3"))) out.print("selected"); %> selected></option>
                <OPTION value="1" <%if (gLedger.getE01GLMF43().equals("1")) out.print("selected"); %>>1</OPTION>
                <OPTION value="2" <%if (gLedger.getE01GLMF43().equals("2")) out.print("selected"); %>>2</OPTION>
                <OPTION value="3" <%if (gLedger.getE01GLMF43().equals("3")) out.print("selected"); %>>3</OPTION>
               </SELECT>
                &nbsp;
				Row :
                &nbsp;
               <SELECT name="E01GLMF44">
               <option value=" " <% if (!(gLedger.getE01GLMF44().equals("1") || gLedger.getE01GLMF44().equals("2")
				|| gLedger.getE01GLMF44().equals("3") || gLedger.getE01GLMF44().equals("4") || gLedger.getE01GLMF44().equals("5"))) out.print("selected"); %> selected></option>
                <OPTION value="1" <%if (gLedger.getE01GLMF44().equals("1")) out.print("selected"); %>>8010</OPTION>
                <OPTION value="2" <%if (gLedger.getE01GLMF44().equals("2")) out.print("selected"); %>>8020</OPTION>
                <OPTION value="3" <%if (gLedger.getE01GLMF44().equals("3")) out.print("selected"); %>>8030</OPTION>
                <OPTION value="4" <%if (gLedger.getE01GLMF44().equals("4")) out.print("selected"); %>>8040</OPTION>
                <OPTION value="5" <%if (gLedger.getE01GLMF44().equals("5")) out.print("selected"); %>>8050</OPTION>
               </SELECT>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <p>
  <div align="center">
    <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>
</form>
 </body>
</html>
