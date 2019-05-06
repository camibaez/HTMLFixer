<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Escrow</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">



<jsp:useBean id="escrow" class="datapro.eibs.beans.EDL205001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT> 
 <script src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"></script>
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
  <h3>Escrow Payment</h3>
</div>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL2050" >
  <h4>
    <input type="hidden" name="SCREEN"  value="4" >
    <input type="hidden" name="E01DLICIA"  value="<%= escrow.getE01DLICIA()%>" >
  </h4>
  <h4>Basic Information </h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="50%" > 
              <div align="right">Deal Number :</div>
            </td>
            <td nowrap width="50%" > 
              <input type="text" size="3" maxlength="2" value="<%= escrow.getE01DEABNK()%>" readonly name="E01DEABNK">
              <input type="text" size="4" maxlength="3" value="<%= escrow.getE01DEABRN()%>" readonly name="E01DEABRN">
              <input type="text" size="4" maxlength="3" value="<%= escrow.getE01DEACCY()%>" readonly name="E01DEACCY">
              <input type="text" size="17" maxlength="16" value="<%= escrow.getE01DEAGLN()%>" readonly name="E01DEAGLN">
              <input type="text" size="12" maxlength="9" value="<%= escrow.getE01DEAACC()%>" readonly name="E01DEAACC">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="50%" > 
              <div align="right">Customer Number :</div>
            </td>
            <td nowrap width="50%" > 
              <input type="text" name="E01DEACUN" size="12" maxlength="9" value="<%= escrow.getE01DEACUN()%>" readonly>
              <input type="text" name="E01CUSNA1" size="40" maxlength="35" value="<%= escrow.getE01CUSNA1()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="50%" > 
              <div align="right">Deduction :</div>
            </td>
            <td nowrap width="50%" > 
              <input type="text" name="E01DLICDE" size="4" maxlength="3" value="<%= escrow.getE01DLICDE()%>" readonly>
              <input type="text" name="E01DSCCDE" size="60" maxlength="35" value="<%= escrow.getE01DSCCDE()%>" readonly>
            </td>
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
            <td nowrap colspan="2" > 
              <div align="center"><b>Loan Customer</b></div>
            </td>
            <td nowrap colspan="2" > 
              <div align="center"><b>To Provider (Insurer, Tax Authority, etc)</b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" > 
              <div align="right">Original Amount :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" name="E01DEAOAM" size="17" maxlength="15" value="<%= escrow.getE01DEAOAM()%>" readonly>
            </td>
            <td nowrap width="20%" > 
              <div align="right">LTD Disbursements :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" name="E01DLITPD" size="17" maxlength="15" value="<%= escrow.getE01DLITPD()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" > 
              <div align="right">Contract Balance :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" name="E01BLNLNS" size="17" maxlength="15" value="<%= escrow.getE01BLNLNS()%>" readonly>
            </td>
            <td nowrap width="20%" > 
              <div align="right">YTD Disbursements :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" name="E01DLITPY" size="17" maxlength="15" value="<%= escrow.getE01DLITPY()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" > 
              <div align="right">Monthly Contribution :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" name="E01DLIDPM" size="17" maxlength="15" value="<%= escrow.getE01DLIDPM()%>" readonly>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Last Payment Date :</div>
            </td>
            <td nowrap width="30%" > 
                <input type="text" name="E01DLILP1" size="3" maxlength="2" value="<%= escrow.getE01DLILP1()%>" readonly>
                <input type="text" name="E01DLILP2" size="3" maxlength="2" value="<%= escrow.getE01DLILP2()%>" readonly>
                <input type="text" name="E01DLILP3" size="3" maxlength="2" value="<%= escrow.getE01DLILP3()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" > 
              <div align="right">LTD Contribution :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" name="E01DLILTD" size="17" maxlength="15" value="<%= escrow.getE01DLILTD()%>" readonly>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Expected Payment Amount :</div>
            </td>
            <td nowrap width="30%" > 
 				<input type="text" name="E01DLICPA" size="17" maxlength="15" value="<%= escrow.getE01DLICPA()%>" readonly>
             </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" > 
              <div align="right">YTD Contribution :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" name="E01DLIYTD" size="17" maxlength="15" value="<%= escrow.getE01DLIYTD()%>" readonly>
            </td>
            <td nowrap width="20%" >&nbsp;</td>
            <td nowrap width="30%" >&nbsp;</td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" > 
              <div align="right">Escrow Balance :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" name="E01DLIBAL" size="17" maxlength="15" value="<%= escrow.getE01DLIBAL()%>" readonly>
            </td>
            <td nowrap width="20%" >&nbsp;</td>
            <td nowrap width="30%" >&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Payment Information</h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="50%" > 
              <div align="right">Payment Amount :</div>
            </td>
            <td nowrap width="50%" >
              <input type="text" name="E01PYMAMT" size="17" maxlength="15" value="<%= escrow.getE01PYMAMT()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="50%" > 
              <div align="right">Value Date :</div>
            </td>
            <td nowrap width="50%" > 
              <input type="text" name="E01PYMVD1" size="3" maxlength="2" value="<%= escrow.getE01PYMVD1()%>" >
              <input type="text" name="E01PYMVD2" size="3" maxlength="2" value="<%= escrow.getE01PYMVD2()%>" >
              <input type="text" name="E01PYMVD3" size="3" maxlength="2" value="<%= escrow.getE01PYMVD3()%>" >
              <a href="javascript:DatePicker(document.forms[0].E01PYMVD1,document.forms[0].E01PYMVD2,document.forms[0].E01PYMVD3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="50%" > 
              <div align="right">Description :</div>
            </td>
            <td nowrap width="50%" > 
              <input type="text" name="E01PYMDSC" size="60" maxlength="35" value="<%= escrow.getE01PYMDSC()%>" >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Repayment</h4>
  <table class="tableinfo" >
    <tr id="trdark"> 
      <td nowrap width="32%"> 
        <div align="center">Concept</div>
      </td>
      <td nowrap width="14%"> 
        <div align="center">Bank</div>
      </td>
      <td nowrap width="17%"> 
        <div align="center">Branch</div>
      </td>
      <td nowrap width="22%"> 
        <div align="center">Currency</div>
      </td>
      <td nowrap width="15%"> 
        <div align="center">Reference</div>
      </td>
      
    </tr>
    <tr id="trclear"> 
      <td nowrap width="32%" > 
        <div align="center"> 
          <input type="text" name="E01PYMOPE" value="<%= escrow.getE01PYMOPE().trim()%>" size="2" maxlength="2">
          <input type="hidden" name="E01PYMGLN" value="<%= escrow.getE01PYMGLN().trim()%>">
          <input type="hidden" name="TYPECONC" value="">
          <input type="text" name="E01PYMCON" size="25" maxlength="25" readonly value="<%= escrow.getE01PYMCON().trim()%>"
					oncontextmenu="showPopUp(conceptHelp,this.name,document.forms[0].E01PYMBNK.value,'TYPECONC','E01PYMGLN','E01PYMOPE','10'); return false;">
        </div>
      </td>
      <td nowrap width="14%" > 
        <div align="center"> 
          <input type="text" name="E01PYMBNK" size="2" maxlength="2" value="<%= escrow.getE01PYMBNK().trim()%>" onKeyPress="enterInteger()">
        </div>
      </td>
      <td nowrap width="17%" > 
        <div align="center"> 
          <input type="text" name="E01PYMBRN" size="3" maxlength="3" value="<%= escrow.getE01PYMBRN().trim()%>" onKeyPress="enterInteger()"
                oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E01PYMBNK.value,'','','','')">
        </div>
      </td>
      <td nowrap width="22%" > 
        <div align="center"> 
          <input type="text" name="E01PYMCCY" size="3" maxlength="3" value="<%= escrow.getE01PYMCCY().trim()%>"
                oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E01PYMBNK.value,'','','','')">
        </div>
      </td>
      <td nowrap width="15%" > 
        <div align="center"> 
          <input type="text" name="E01PYMACC" size="12" maxlength="12"  value="<%= escrow.getE01PYMACC().trim()%>" onKeyPress="enterInteger()"
                oncontextmenu="showPopUp(accountHelp,this.name,document.forms[0].E01PYMBNK.value,'','','','RT'); return false;">
        </div>
      </td>
      
    </tr>
  </table>
  <p><br>
  </p>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="33%"> 
  <div align="center"> 
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td> 
        <div align="center"> </div>
      </td>
    </tr>
  </table>
 
  </form>
</body>
</html>
