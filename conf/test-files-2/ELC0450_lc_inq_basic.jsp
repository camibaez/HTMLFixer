<html>
<head>
<title>Consulta de Cartas de Credito</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<jsp:useBean id="lcBasic" class="datapro.eibs.beans.ELC045001Message"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   builtNewMenu(lc_i_opt);

</SCRIPT>

</head>

<body bgcolor="#FFFFFF">

<%@ page import = "datapro.eibs.master.Util" %>
<SCRIPT> initMenu(); </SCRIPT>

<H3 align="center">Letters Of Credit Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="lc_inq_basic.jsp,ELC0450"></h3>
<hr size="4">
<form method="post">
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="">
  <table class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0" >
    <tr id="trdark">
      <td width="20%" align="right"><b>Bank :</b></td>
      <td width="30%"><input name="E01LCMBNK" type="text" id="E01LCMBNK" value="<%= lcBasic.getE01LCMBNK() %>" size="2" maxlength="2" readonly></td>
      <td height="30%" align="right"><b>Letter Of Credit Number    :</b></td>
      <td width="20%"><input type="text" name="E02ACC" size="12" maxlength="12" value="<%= userPO.getIdentifier() %>" readonly></td>
    </tr>

    <tr id="trclear">
      <td align="right"><b>Product :</b></td>
      <td><b>
        <input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getHeader1() %>">
      </b></td>
      <td align="right"><b>Product Description :</b></td>
      <td><b>
        <input type="text" name="E02NA122" size="35" maxlength="30" readonly value="<%= lcBasic.getE01DSCPRO() %>">
      </b></td>
    </tr>
    <tr id="trdark">
      <td align="right"><b>Currency :</b></td>
      <td><b>
        <input name="E01LCMCCY" type="text" id="E01LCMCCY" value="<%= lcBasic.getE01LCMCCY() %>" size="3" maxlength="3" readonly>
      </b></td>
      <td align="right"><b>Officer :</b></td>
      <td><b>
        <input type="text" name="E01DSCOFC" size="40" maxlength="35" readonly value="<%= userPO.getOfficer() %>">
      </b></td>
    </tr>
    <tr id="trclear">
      <td align="right"><b>Customer : </b></td>
      <td><input type="text" name="E02CUN2" size="9" maxlength="9" readonly value="<%= userPO.getHeader2() %>"></td>
      <td align="right"><b> Customer Name :</b></td>
      <td><input type="text" name="E02NA12" size="45" maxlength="45" readonly value="<%= userPO.getHeader3() %>"></td>
    </tr>
  </table>
  
    <H4>Basic Information</H4>
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="29%">
              <div align="right">Original Amount :</div>            </td>
            <td nowrap width="18%">
              <input type="text"  name="E01LCMOAM" readonly size="15" maxlength="13" value="<%= Util.formatCCY(lcBasic.getE01LCMOAM() )%>">            </td>
            <td nowrap width="27%">
              <div align="right">Issuing Date :</div>            </td>
            <td nowrap width="26%">
              <input type="text" name="E01LCMID1" readonly size="4" maxlength="2" value="<%= lcBasic.getE01LCMID1() %>">
              <input type="text" name="E01LCMID2" readonly size="4" maxlength="2" value="<%= lcBasic.getE01LCMID2() %>">
              <input type="text" name="E01LCMID3" readonly size="4" maxlength="2" value="<%= lcBasic.getE01LCMID3() %>">            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="29%">
              <div align="right">Utilised Amount :</div>            </td>
            <td nowrap width="18%">
              <input type="text"  name="E01LCMNGA" readonly size="15" maxlength="13" value="<%= Util.formatCCY(lcBasic.getE01LCMNGA() )%>">            </td>
            <td nowrap width="27%">
              <div align="right">Expiration Date :</div>            </td>
            <td nowrap width="26%">
              <input type="text" name="E01LCMEX1" readonly size="4" maxlength="2" value="<%= lcBasic.getE01LCMEX1() %>">
              <input type="text" name="E01LCMEX2" readonly size="4" maxlength="2" value="<%= lcBasic.getE01LCMEX2() %>">
              <input type="text" name="E01LCMEX3" readonly size="4" maxlength="2" value="<%= lcBasic.getE01LCMEX3() %>">            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="29%" height="23">
              <div align="right">Balance :</div>            </td>
            <td nowrap width="18%" height="23">
              <input type="text"  name="E01LCMAMN" readonly size="15" maxlength="13" value="<%= Util.formatCCY(lcBasic.getE01LCMAMN() )%>">            </td>
            <td nowrap width="27%" height="23">
              <div align="right">Foreign Exchange Rate :</div>            </td>
            <td nowrap width="26%" height="23">
              <input type="text" name="E01LCMOFX" readonly size="13" maxlength="11" value="<%= lcBasic.getE01LCMOFX() %>">            </td>
          </tr>
          <tr id="trclear">
            <td nowrap height="19"><div align="right">Letter of Credit Type :</div></td>
            <td nowrap height="19"><input type="text" name="E01LCMTYP" readonly size="16" maxlength="16" value="
<%
if (lcBasic.getE01LCMTYP().equals("I")) out.print("EXPORT");
else if (lcBasic.getE01LCMTYP().equals("O")) out.print("IMPORT");
else if (lcBasic.getE01LCMTYP().equals("S")) out.print("OUTGOING STANDBY");
else if (lcBasic.getE01LCMTYP().equals("R")) out.print("INCOMING STANDBY");
else out.print("");%>">            </td>
            <TD align="right" nowrap> About Clause :</TD>
            <TD align="left" nowrap><INPUT type="radio" name="E01LCMABC" value="Y" <% if(lcBasic.getE01LCMABC().equals("Y")) out.print("checked");%> disabled readonly>
              Yes
              <INPUT type="radio" name="E01LCMABC" value="N" <% if(lcBasic.getE01LCMABC().equals("N")) out.print("checked");%> disabled readonly>
              No
              &nbsp; &nbsp; Percentage:
              <INPUT type="text" name="E01LCMABP" size="2" maxlength="2"
				value="<%if(lcBasic.getE01LCMABP().trim().length() == 1 && !lcBasic.getE01LCMABP().trim().equals("0")) out.print("0");%><%= lcBasic.getE01LCMABP().trim()%>" onKeyPress="enterInteger()">
                  <INPUT type="text" name="E01LCMAPM" size="2" maxlength="2"
				value="<%if(lcBasic.getE01LCMAPM().trim().length() == 1 && !lcBasic.getE01LCMAPM().trim().equals("0")) out.print("0");%><%= lcBasic.getE01LCMAPM().trim()%>" onKeyPress="enterInteger()"></TD>
          </tr>
          <tr id="trdark">
            <td nowrap width="29%" height="19">
              <div align="right">Cash Collateral Amount :</div>            </td>
            <td nowrap width="18%" height="19">
              <input type="text"  name="E01LCMCAM" readonly size="15" maxlength="13" value="<%= Util.formatCCY(lcBasic.getE01LCMCAM() )%>">            </td>
            <td nowrap width="27%" height="19">
              <div align="right">Cash Collateral Account :</div>            </td>
            <td nowrap width="26%" height="19">
              <input type="text"  name="E01LCMCCA" readonly size="18" maxlength="16" value="<%= lcBasic.getE01LCMCCA() %>">            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="29%" height="19">
              <div align="right">Other Collaterals :</div>            </td>
            <td nowrap width="18%" height="19">
              <input type="text"  name="E01LCMOCA" readonly size="15" maxlength="13" value="<%= Util.formatCCY(lcBasic.getE01LCMOCA() )%>">            </td>
            <td nowrap width="27%" height="19">
              <div align="right">Tenor :</div></td>
            <td nowrap width="26%" height="19">
              <input type="text" name="E01LCMTNR" readonly size="15" maxlength="15" value="<%= lcBasic.getE01DSCTNR() %>">            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="29%" height="19">
              <div align="right">Incoterms :</div>            </td>
            <td nowrap width="18%" height="19">
              <input type="text" name="E01LCMITR" readonly size="6" maxlength="4" value="<%= lcBasic.getE01LCMITR() %>">            </td>
            <td nowrap width="27%" height="19">
              <div align="right">Confirmed :</div>            </td>
            <td nowrap width="26%" height="19">
              <input type="text" name="E01LCMCNF" readonly size="5" maxlength="3" value="
<%
if (lcBasic.getE01LCMCNF().equals("Y")) out.print("SI");
else if (lcBasic.getE01LCMCNF().equals("N")) out.print("NO");
else out.print("");%>">            </td>

          </tr>
          <tr id="trclear">
            <td nowrap width="29%" height="19">
              <div align="right">Partial Shipments :</div>            </td>
            <td nowrap width="18%" height="19">
              <input type="text" name="E01LCMPSH" readonly size="5" maxlength="3" value ="
<%
if (lcBasic.getE01LCMPSH().equals("Y")) out.print("SI");
else if (lcBasic.getE01LCMPSH().equals("N")) out.print("NO");
else out.print("");%>">            </td>
            <td nowrap width="27%" height="19">
              <div align="right">Transshipment :</div>            </td>
            <td nowrap width="26%" height="19">
              <input type="text" name="E01LCMTSH" readonly size="3" maxlength="1" value="
<%
if (lcBasic.getE01LCMTSH().equals("Y")) out.print("SI");
else if (lcBasic.getE01LCMTSH().equals("N")) out.print("NO");
else out.print("");%>">            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="29%" height="19">
              <div align="right">Transferable :</div>            </td>
            <td nowrap width="18%" height="19">
              <input type="text" name="E01LCMTRN" readonly size="3" maxlength="1" value="
<%
if (lcBasic.getE01LCMTRN().equals("Y")) out.print("SI");
else if (lcBasic.getE01LCMTRN().equals("N")) out.print("NO");
else out.print("");%>">            </td>
            <td nowrap width="27%" height="19">
              <div align="right">Line of Credit : </div>            </td>
            <td nowrap width="26%" height="19">
              <input type="text"  name="E01LCMLNR" readonly size="11" maxlength="9" value="<%= lcBasic.getE01LCMLNR() %>">
              <input type="text" name="E01LCMCMN" readonly size="6" maxlength="4" value="<%= lcBasic.getE01LCMCMN() %>">            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="29%" height="19">
              <div align="right">Charges for Account of :</div>            </td>
            <td nowrap width="18%" height="19">
              <input type="text" name="E01LCMAOB" readonly size="15" maxlength="13" value="
<%
if (lcBasic.getE01LCMAOB().equals("A")) out.print("APPLICANT");
else if (lcBasic.getE01LCMAOB().equals("B")) out.print("BENEFICIARY");
else out.print("");%>">            </td>
            <td nowrap width="27%" height="19">
              <div align="right">Commissions Table :</div>            </td>
            <td nowrap width="26%" height="19">
              <input type="text" name="E01LCMTAR" readonly size="4" maxlength="2" value="<%= lcBasic.getE01LCMTAR() %>">            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="29%" height="19">
              <div align="right">Commissions :</div>            </td>
            <td nowrap width="18%" height="19">
              <input type="text"  name="E01LCMCOM" readonly size="13" maxlength="11" value="<%= Util.formatCCY(lcBasic.getE01LCMCOM() )%>">            </td>
            <td nowrap width="27%" height="19">
              <p align="right">Hold Payment :</p>            </td>
            <td nowrap width="26%" height="19">
              <input type="text" name="E01LCMHPF" readonly size="3" maxlength="1" value="<%
if (lcBasic.getE01LCMHPF().equals("Y")) out.print("SI");
else if (lcBasic.getE01LCMHPF().equals("N")) out.print("NO");
else out.print("");%>">
			</td>
          </tr>
          <tr id="trclear">
            <td nowrap width="29%" height="19">
              <div align="right">Our Reference :</div>            </td>
            <td nowrap width="18%" height="19">
              <input type="text" name="E01LCMORF" readonly size="18" maxlength="16" value="<%= lcBasic.getE01LCMORF() %>">            </td>
            <td nowrap width="27%" height="19">
              <div align="right">Their Reference :</div>            </td>
            <td nowrap width="26%" height="19">
              <input type="text" name="E01LCMTRF" readonly size="18" maxlength="16" value="<%= lcBasic.getE01LCMTRF() %>">            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="29%" height="19">
              <div align="right">Bank / Branch :</div>            </td>
            <td nowrap width="18%" height="19">
              <input type="text" name="E01LCMBNK" readonly size="2" maxlength="2" value="<%= lcBasic.getE01LCMBNK() %>">
              <input type="text" name="E01LCMBRN" readonly size="2" maxlength="2" value="<%= lcBasic.getE01LCMBRN() %>">            </td>
            <td nowrap width="27%" height="19">
              <div align="right">General Ledger Account :</div>            </td>
            <td nowrap width="26%" height="19">
              <input type="text" name="E01LCMGLN" readonly size="16" maxlength="16" value="<%= lcBasic.getE01LCMGLN() %>">            </td>              
          </tr>
          <tr id="trclear">
            <td nowrap width="29%" height="19">
              <div align="right">Account Type :</div>            </td>
            <td nowrap width="18%" height="19">
              <input type="text" name="E01LCMATY" readonly size="4" maxlength="4" value="<%= lcBasic.getE01LCMATY() %>">            </td>
            <td nowrap width="27%" height="19">
              <div align="right">Add Confirmation :</div></td>
            <td nowrap width="25%" height="19">
                  <% 
                	String test = lcBasic.getE01LCMCNO().trim();
                	String confirm = null;
                	if(test.equalsIgnoreCase("Y")){
                		confirm =  "CONFIRM";
                	}
                	else if(test.equalsIgnoreCase("N")){
                		confirm = "WITHOUT";
                	}
                	else if(test.equalsIgnoreCase("M")){
                		confirm = "MAY ADD";
                	}
                	else
                		confirm = ""; 
                %>
              <input type="text" name="E01LCMCNO" readonly size="28" value="<%= confirm %>"> 
            </td> 
          </tr>
          
          <tr id="trdark">
            <td nowrap width="29%" height="19">
              <div align="right">Amendments:</div>            
            </td>
            <td nowrap width="18%" height="19">
              <input type="text" name="E01LCMLAN" readonly size="2" maxlength="2" value="<%= lcBasic.getE01LCMLAN() %>">
            </td>
            <td nowrap width="27%" height="19">
              <div align="right">Last Amendment Date:</div>            
            </td>
            <td nowrap width="26%" height="19">
              <input type="text" name="E01LCMLA1" readonly size="4" maxlength="2" value="<%= lcBasic.getE01LCMLA1() %>">
              <input type="text" name="E01LCMLA2" readonly size="4" maxlength="2" value="<%= lcBasic.getE01LCMLA2() %>">
              <input type="text" name="E01LCMLA3" readonly size="4" maxlength="2" value="<%= lcBasic.getE01LCMLA3() %>">
            </td>
          </tr>

          <tr id="trclear">
            <td nowrap width="29%" height="19">
              <div align="right">Agent :</div>            
            </td>
            <td nowrap width="18%" height="19">
              <input type="text" name="E01LCMBRK" readonly size="3" maxlength="3"   value="<%= lcBasic.getE01LCMBRK() %>">
              <input type="text" name="E01DSCBRK" readonly size="35" maxlength="35" value="<%= lcBasic.getE01DSCBRK() %>">
            </td>
            <td nowrap width="27%" height="19">
              <div align="right">Cash Collateral Percent :</div>            
            </td>
            <td nowrap width="26%" height="19">
              <input type="text" name="E01LCMCPE" readonly size="7" maxlength="7" value="<%= lcBasic.getE01LCMCPE() %>">
            </td>
          </tr>

          <tr id="trdark">
            <td nowrap width="29%" height="19">
              <div align="right">Place of Expiry :</div>            
            </td>
            <td nowrap width="18%" height="19">
              <input type="text" name="E01LCMPLE" readonly size="29" maxlength="29" value="<%= lcBasic.getE01LCMPLE() %>">
            </td>
            <td nowrap width="27%" height="19">
              <div align="right">Commissions Debit Account :</div>            
            </td>
            <td nowrap width="26%" height="19">
              <input type="text" name="E01LCMSCA" readonly size="12" maxlength="12" value="<%= lcBasic.getE01LCMSCA() %>">
            </td>
          </tr>
          
        </table>
      </td>
    </tr>
  </table>
  
  
  <H4>Parties</H4>
  <table class="tableinfo">
    <tr>
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap colspan="2">
              <div align="left"><b>Applicant</b></div>
            </td>
            <td nowrap width="8%">&nbsp; </td>
            <td nowrap colspan="2"><b>Beneficiary</b></td>
          </tr>
          <tr id="trclear">
            <td nowrap colspan="2">
              <div align="left">
                <input type="text" name="E01LCMAP1" readonly size="37" maxlength="35" value="<%= userPO.getHeader10() %>">
              </div>
            </td>
            <td nowrap width="8%">&nbsp; </td>
            <td nowrap colspan="2">
              <input type="text" name="E01LCMBN1" readonly size="37" maxlength="35" value="<%= lcBasic.getE01LCMBN1() %>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap colspan="2">
              <input type="text" name="E01LCMAP2" readonly size="37" maxlength="35" value="<%= userPO.getHeader11() %>">
            </td>
            <td nowrap width="8%">&nbsp;</td>
            <td nowrap colspan="2">
              <input type="text" name="E01LCMBN2" readonly size="37" maxlength="35" value="<%= lcBasic.getE01LCMBN2() %>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap colspan="2">
              <input type="text" name="E01LCMAP3" readonly size="37" maxlength="35" value="<%= userPO.getHeader12() %>">
            </td>
            <td nowrap width="8%">&nbsp;</td>
            <td nowrap colspan="2">
              <input type="text" name="E01LCMBN3" readonly size="37" maxlength="35" value="<%= lcBasic.getE01LCMBN3() %>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap colspan="2">
              <input type="text" name="E01LCMAP4" readonly size="27" maxlength="25" value="<%= userPO.getHeader13() %>">
            </td>
            <td nowrap width="8%">&nbsp;</td>
            <td nowrap colspan="2">
              <input type="text" name="E01LCMBN4" readonly size="27" maxlength="25" value="<%= lcBasic.getE01LCMBN4() %>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="26%" colspan="2">
              <div align="left">Customer / Account No. :
              <input type="text" name="E01LCMAPA" readonly size="14" maxlength="12" value="<%= userPO.getHeader14() %>">
			  </div>              
            </td>
            <td nowrap width="8%">
              <div align="left"> </div>
            </td>
            <td nowrap width="36%" colspan="2">
              <div align="left">Customer / Account No. :
              <input type="text" name="E01LCMBAC" readonly size="14" maxlength="12" value="<%= lcBasic.getE01LCMBAC() %>">
			</div>              
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap colspan="2"><b>Confirming Bank</b></td>
            <td nowrap width="8%">&nbsp;</td>
            <td nowrap colspan="2"><b>Correspondent Bank</b></td>
          </tr>
          <tr id="trclear">
            <td nowrap colspan="2">
              <input type="text" name="E01LCMAB1" readonly size="37" maxlength="35" value="<%= lcBasic.getE01LCMAB1() %>">
            </td>
            <td nowrap width="8%">&nbsp;</td>
            <td nowrap colspan="2">
              <input type="text" name="E01LCMCB1" readonly size="37" maxlength="35" value="<%= lcBasic.getE01LCMCB1() %>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap colspan="2">
              <input type="text" name="E01LCMAB2" readonly size="37" maxlength="35" value="<%= lcBasic.getE01LCMAB2() %>">
            </td>
            <td nowrap width="8%">&nbsp;</td>
            <td nowrap colspan="2">
              <input type="text" name="E01LCMCB2" readonly size="37" maxlength="35" value="<%= lcBasic.getE01LCMCB2() %>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap colspan="2">
              <input type="text" name="E01LCMAB3" readonly size="37" maxlength="35" value="<%= lcBasic.getE01LCMAB3() %>">
            </td>
            <td nowrap width="8%">&nbsp;</td>
            <td nowrap colspan="2">
              <input type="text" name="E01LCMCB3" readonly size="37" maxlength="35" value="<%= lcBasic.getE01LCMCB3() %>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap colspan="2">
              <input type="text" name="E01LCMAB4" readonly size="27" maxlength="25" value="<%= lcBasic.getE01LCMAB4() %>">
            </td>
            <td nowrap width="8%">&nbsp;</td>
            <td nowrap colspan="2">
              <input type="text" name="E01LCMCB4" readonly size="27" maxlength="25" value="<%= lcBasic.getE01LCMCB4() %>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="26%" colspan="2">
              <div align="left">Account No. :
              <input type="text" name="E01LCMABA" readonly size="14" maxlength="12" value="<%= lcBasic.getE01LCMABA() %>">
			  </div>              
            </td>
            <td nowrap width="8%">&nbsp;</td>            
            <td nowrap width="36%" colspan="2" >Cliente / Linea de Credito :
              <input type="text" name="E01LCMCOR" readonly size="11" maxlength="9" value="<%= lcBasic.getE01LCMCOR() %>">
              <input type="text" name="E01LCMCMG" readonly size="4"  maxlength="4" value="<%= lcBasic.getE01LCMCMG() %>">              
            </td>
          </tr>

          <tr id="trdark">
            <td nowrap colspan="2"><b>Reimbursement Bank</b></td>
            <td nowrap width="8%">&nbsp;</td>
            <td nowrap colspan="2"><b>Advise Through Bank</b></td>
          </tr>
          <tr id="trclear">
            <td nowrap colspan="2">
              <input type="text" name="E01LCMRB1" readonly size="37" maxlength="35" value="<%= lcBasic.getE01LCMRB1() %>">
            </td>
            <td nowrap width="8%">&nbsp;</td>
            <td nowrap colspan="2">
              <input type="text" name="E01LCMCA1" readonly size="37" maxlength="35" value="<%= lcBasic.getE01LCMCA1() %>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap colspan="2">
              <input type="text" name="E01LCMRB2" readonly size="37" maxlength="35" value="<%= lcBasic.getE01LCMRB2() %>">
            </td>
            <td nowrap width="8%">&nbsp;</td>
            <td nowrap colspan="2">
              <input type="text" name="E01LCMCA2" readonly size="37" maxlength="35" value="<%= lcBasic.getE01LCMCA2() %>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap colspan="2">
              <input type="text" name="E01LCMRB3" readonly size="37" maxlength="35" value="<%= lcBasic.getE01LCMRB3() %>">
            </td>
            <td nowrap width="8%">&nbsp;</td>
            <td nowrap colspan="2">
              <input type="text" name="E01LCMCA3" readonly size="37" maxlength="35" value="<%= lcBasic.getE01LCMCA3() %>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap colspan="2">
              <input type="text" name="E01LCMRB4" readonly size="27" maxlength="25" value="<%= lcBasic.getE01LCMRB4() %>">
            </td>
            <td nowrap width="8%">&nbsp;</td>
            <td nowrap colspan="2">
              <input type="text" name="E01LCMCA4" readonly size="27" maxlength="25" value="<%= lcBasic.getE01LCMCA4() %>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="26%" colspan="2">
              <div align="left">Customer / Account No. :
              <input type="text" name="E01LCMRBA" readonly size="14" maxlength="12" value="<%= lcBasic.getE01LCMRBA() %>">
			  </div>              
            </td>
            <td nowrap width="8%" colspan="3">&nbsp;</td>            
          </tr>
        </table>
      </td>
    </tr>
  </table>

			  
  <H4>Additional Information</H4>
  <table class="tableinfo">
    <tr>
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

        
            <TR id="trdark">
              <TD nowrap align="right" width="25%">Applicable Rules :</TD>
              <td nowrap >&nbsp;</td>
              <TD nowrap >
	              <input type="text" readonly size="35" value="<%= lcBasic.getE01DSCAPR() %>">
                  <input type="text" readonly size="35" value="<%= lcBasic.getE01LCMST3() %>">
			  </TD>
            </TR>

            <TR id="trclear">
              <TD nowrap align="right" >Place of Receipt :</TD>
              <td nowrap >&nbsp;</td>              
              <TD nowrap >
	              <input type="text" readonly size="65" value="<%= lcBasic.getE01LCMPLR() %>">
			  </TD>
            </TR>

            <TR id="trdark">
              <TD nowrap align="right" >Port / Airport of Departure :</TD>
              <td nowrap >&nbsp;</td>              
              <TD nowrap >
	              <input type="text" readonly size="65" value="<%= lcBasic.getE01LCMPOL() %>">
			  </TD>
            </TR>


            <TR id="trclear">
              <TD nowrap align="right" >Port / Airport of Destination :</TD>
              <td nowrap >&nbsp;</td>              
              <TD nowrap >
	              <input type="text" readonly size="65" value="<%= lcBasic.getE01LCMPOD() %>">
			  </TD>
            </TR>

            <TR id="trdark">
              <TD nowrap align="right" >Place of Delivery :</TD>
              <td nowrap >&nbsp;</td>              
              <TD nowrap >
	              <input type="text" readonly size="65" value="<%= lcBasic.getE01LCMPLD() %>">
			  </TD>
            </TR>

          <tr id="trclear">
            <td nowrap colspan="3">
              <div align="center"><b>Description of Goods</b> </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap colspan="3">
              <div align="center">
                <textarea readonly name="E01LCMME" rows=5 cols=40><%=lcBasic.getE01LCMME1()  + lcBasic.getE01LCMME2()  + lcBasic.getE01LCMME3()  %></textarea>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <H4>Documents Required</H4>
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="1" bordercolor="#000000">
          <tr bordercolor="#FFFFFF">
            <td nowrap>
              <table cellspacing="0" cellpadding="2" width="100%" border="0">
                <tr id="trdark">
                  <td nowrap width="8%">
                    <div align="center">Code</div>
                  </td>
                  <td nowrap width="81%">
                    <div align="center">Description </div>
                  </td>
                  <td nowrap width="5%">
                    <div align="center">Originals</div>
                  </td>
                  <td nowrap width="6%">
                    <div align="center">Copies </div>
                  </td>
                </tr>
                <% if(!lcBasic.getE01LCMDD1() .equals("")){%>
                <tr id="trclear">
                  <td nowrap width="8%">
                    <div align="left"></div>
                    <%= lcBasic.getE01LCMDD1() %></td>
                  <td nowrap width="81%">
                    <div align="left"></div>
                    <%= lcBasic.getE01LCMDS1() %></td>
                  <td nowrap width="5%">
                    <div align="center"></div>
                    <%= lcBasic.getE01LCMD01().charAt(0)%></td>
                  <td nowrap width="6%">
                    <div align="center"></div>
                    <% try { out.print(lcBasic.getE01LCMD01().charAt(1)); } catch (Exception e) { out.print("0"); }%></td>
                </tr>
                <%}%> <% if(!lcBasic.getE01LCMDD2() .equals("")){%>
                <tr id="trdark">
                  <td nowrap width="8%">
                    <div align="left"></div>
                    <%= lcBasic.getE01LCMDD2() %></td>
                  <td nowrap width="81%">
                    <div align="left"></div>
                    <%= lcBasic.getE01LCMDS2() %></td>
                  <td nowrap width="5%">
                    <div align="center"></div>
                    <%= lcBasic.getE01LCMD02().charAt(0)%></td>
                  <td nowrap width="6%">
                    <div align="center"></div>
                    <% try { out.print(lcBasic.getE01LCMD02().charAt(1)); } catch (Exception e) { out.print("0"); }%></td>
                </tr>
                <%}%> <% if(!lcBasic.getE01LCMDD3() .equals("")){%>
                <tr id="trclear">
                  <td nowrap width="8%">
                    <div align="left"></div>
                    <%= lcBasic.getE01LCMDD3() %></td>
                  <td nowrap width="81%">
                    <div align="left"></div>
                    <%= lcBasic.getE01LCMDS3() %></td>
                  <td nowrap width="5%">
                    <div align="center"></div>
                    <%= lcBasic.getE01LCMD03().charAt(0)%></td>
                  <td nowrap width="6%">
                    <div align="center"></div>
                    <% try { out.print(lcBasic.getE01LCMD03().charAt(1)); } catch (Exception e) { out.print("0"); }%></td>
                </tr>
                <%}%> <% if(!lcBasic.getE01LCMDD4() .equals("")){%>
                <tr id="trdark">
                  <td nowrap width="8%">
                    <div align="left"></div>
                    <%= lcBasic.getE01LCMDD4() %></td>
                  <td nowrap width="81%">
                    <div align="left"></div>
                    <%= lcBasic.getE01LCMDS4() %></td>
                  <td nowrap width="5%">
                    <div align="center"></div>
                    <%= lcBasic.getE01LCMD04().charAt(0)%></td>
                  <td nowrap width="6%">
                    <div align="center"></div>
                    <% try { out.print(lcBasic.getE01LCMD04().charAt(1)); } catch (Exception e) { out.print("0"); }%></td>
                </tr>
                <%}%> <% if(!lcBasic.getE01LCMDD5() .equals("")){%>
                <tr id="trclear">
                  <td nowrap width="8%">
                    <div align="left"></div>
                    <%= lcBasic.getE01LCMDD5() %></td>
                  <td nowrap width="81%">
                    <div align="left"></div>
                    <%= lcBasic.getE01LCMDS5() %></td>
                  <td nowrap width="5%">
                    <div align="center"></div>
                    <%= lcBasic.getE01LCMD05().charAt(0)%></td>
                  <td nowrap width="6%">
                    <div align="center"></div>
                    <% try { out.print(lcBasic.getE01LCMD05().charAt(1)); } catch (Exception e) { out.print("0"); }%></td>
                </tr>
                <%}%> <% if(!lcBasic.getE01LCMDD6() .equals("")){%>
                <tr id="trdark">
                  <td nowrap width="8%">
                    <div align="left"></div>
                    <%= lcBasic.getE01LCMDD6() %></td>
                  <td nowrap width="81%">
                    <div align="left"></div>
                    <%= lcBasic.getE01LCMDS6() %></td>
                  <td nowrap width="5%">
                    <div align="center"></div>
                    <%= lcBasic.getE01LCMD06().charAt(0)%></td>
                  <td nowrap width="6%">
                    <div align="center"></div>
                    <% try { out.print(lcBasic.getE01LCMD06().charAt(1)); } catch (Exception e) { out.print("0"); }%></td>
                </tr>
                <%}%> <% if(!lcBasic.getE01LCMDD7() .equals("")){%>
                <tr id="trclear">
                  <td nowrap width="8%">
                    <div align="left"></div>
                    <%= lcBasic.getE01LCMDD7() %></td>
                  <td nowrap width="81%">
                    <div align="left"></div>
                    <%= lcBasic.getE01LCMDS7() %></td>
                  <td nowrap width="5%">
                    <div align="center"></div>
                    <%= lcBasic.getE01LCMD07().charAt(0)%></td>
                  <td nowrap width="6%">
                    <div align="center"></div>
                    <% try { out.print(lcBasic.getE01LCMD07().charAt(1)); } catch (Exception e) { out.print("0"); }%></td>
                </tr>
                <%}%> <% if(!lcBasic.getE01LCMDD8() .equals("")){%>
                <tr id="trdark">
                  <td nowrap width="8%">
                    <div align="left"></div>
                    <%= lcBasic.getE01LCMDD8() %></td>
                  <td nowrap width="81%">
                    <div align="left"></div>
                    <%= lcBasic.getE01LCMDS8() %></td>
                  <td nowrap width="5%">
                    <div align="center"></div>
                    <%= lcBasic.getE01LCMD08().charAt(0)%></td>
                  <td nowrap width="6%">
                    <div align="center"></div>
                    <% try { out.print(lcBasic.getE01LCMD08().charAt(1)); } catch (Exception e) { out.print("0"); }%></td>
                </tr>
                <%}%> <% if(!lcBasic.getE01LCMDD9() .equals("")){%>
                <tr id="trclear">
                  <td nowrap width="8%">
                    <div align="left"></div>
                    <%= lcBasic.getE01LCMDD9() %></td>
                  <td nowrap width="81%">
                    <div align="left"></div>
                    <%= lcBasic.getE01LCMDS9() %></td>
                  <td nowrap width="5%">
                    <div align="center"></div>
                    <%= lcBasic.getE01LCMD09().charAt(0)%></td>
                  <td nowrap width="6%">
                    <div align="center"></div>
                    <% try { out.print(lcBasic.getE01LCMD09().charAt(1)); } catch (Exception e) { out.print("0"); }%></td>
                </tr>
                <%}%>
              </table>
            </td>
          </tr>
        </table>

      </td>
    </tr>
  </table>
</form>
</body>
</html>
