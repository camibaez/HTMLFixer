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
  <h3>Company Payment File Maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="inv_orders_input.jsp,EIE110"> 
  </h3>
</div>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL2050" >
  <h4>
    <input type="hidden" name="SCREEN"  value="4" >
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
              <input type="text" readonly  size="3" maxlength="2" value="<%= escrow.getE01DEABNK()%>"  name="E01DEABNK">
              <input type="text" readonly  size="4" maxlength="3" value="<%= escrow.getE01DEABRN()%>"  name="E01DEABRN">
              <input type="text" readonly  size="4" maxlength="3" value="<%= escrow.getE01DEACCY()%>"  name="E01DEACCY">
              <input type="text" readonly  size="17" maxlength="16" value="<%= escrow.getE01DEAGLN()%>"  name="E01DEAGLN">
              <input type="text" readonly  size="12" maxlength="9" value="<%= escrow.getE01DEAACC()%>"  name="E01DEAACC">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="50%" > 
              <div align="right">Customer Number :</div>
            </td>
            <td nowrap width="50%" > 
              <input type="text" readonly  name="E01DEACUN" size="12" maxlength="9" value="<%= escrow.getE01DEACUN()%>" >
              <input type="text" readonly  name="E01CUSNA1" size="40" maxlength="35" value="<%= escrow.getE01CUSNA1()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="50%" > 
              <div align="right">Deduction :</div>
            </td>
            <td nowrap width="50%" > 
              <input type="text" readonly  name="E01DLICDE" size="4" maxlength="3" value="<%= escrow.getE01DLICDE()%>" >
              <input type="text" readonly  name="E01DSCCDE" size="60" maxlength="35" value="<%= escrow.getE01DSCCDE()%>" >
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
              <div align="center"><b>To Provider</b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" > 
              <div align="right">Original Amount :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" readonly  name="E01DEAOAM" size="17" maxlength="15" value="<%= escrow.getE01DEAOAM()%>" >
            </td>
            <td nowrap width="20%" > 
              <div align="right">Payment Balance :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" readonly  name="E01DLIBAL" size="17" maxlength="15" value="<%= escrow.getE01DLIBAL()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" > 
              <div align="right">Contract Balance :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" readonly  name="E01BLNLNS" size="17" maxlength="15" value="<%= escrow.getE01BLNLNS()%>" >
            </td>
            <td nowrap width="20%" > 
              <div align="right">Total Paid Company :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" readonly  name="E01DLIPCL" size="17" maxlength="15" value="<%= escrow.getE01DLIPCL()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" > 
              <div align="right">Payment Deduction :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" readonly  name="E01DLIDPM" size="17" maxlength="15" value="<%= escrow.getE01DLIDPM()%>" >
            </td>
            <td nowrap width="20%" > 
              <div align="right">Total Paid YTD :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" readonly  name="E01DLIPCY" size="17" maxlength="15" value="<%= escrow.getE01DLIPCY()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" > 
              <div align="right">Total Paid Deduction :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" readonly  name="E01DLITPD" size="17" maxlength="15" value="<%= escrow.getE01DLITPD()%>" >
            </td>
            <td nowrap width="20%" > 
              <div align="right">Last Payment Date :</div>
            </td>
            <td nowrap width="30%" > 
              <div align="left"> 
                <input type="text" readonly  name="E01DLILP1" size="3" maxlength="2" value="<%= escrow.getE01DLILP1()%>" >
                <input type="text" readonly  name="E01DLILP2" size="3" maxlength="2" value="<%= escrow.getE01DLILP2()%>" >
                <input type="text" readonly  name="E01DLILP3" size="3" maxlength="2" value="<%= escrow.getE01DLILP3()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" > 
              <div align="right">Total Paid YTD :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" readonly  name="E01DLITPY" size="17" maxlength="15" value="<%= escrow.getE01DLITPY()%>" >
            </td>
            <td nowrap width="20%" >&nbsp;</td>
            <td nowrap width="30%" >&nbsp;</td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" > 
              <div align="right">Expiration Date :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" readonly  name="E01DLIEX1" size="3" maxlength="2" value="<%= escrow.getE01DLIEX1()%>" >
              <input type="text" readonly  name="E01DLIEX2" size="3" maxlength="2" value="<%= escrow.getE01DLIEX2()%>" >
              <input type="text" readonly  name="E01DLIEX3" size="3" maxlength="2" value="<%= escrow.getE01DLIEX3()%>" >
            </td>
            <td nowrap width="20%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="30%" >&nbsp; </td>
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
              <div align="right">Amount :</div>
            </td>
            <td nowrap width="50%" > 
              <input type="text" readonly  name="E01PYMAMT" size="17" maxlength="15" value="<%= escrow.getE01PYMAMT()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="50%" > 
              <div align="right">Value Date :</div>
            </td>
            <td nowrap width="50%" > 
              <input type="text" readonly  name="E01PYMVD1" size="3" maxlength="2" value="<%= escrow.getE01PYMVD1()%>" >
              <input type="text" readonly  name="E01PYMVD2" size="3" maxlength="2" value="<%= escrow.getE01PYMVD2()%>" >
              <input type="text" readonly  name="E01PYMVD3" size="3" maxlength="2" value="<%= escrow.getE01PYMVD3()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="50%" > 
              <div align="right">Description :</div>
            </td>
            <td nowrap width="50%" > 
              <input type="text" readonly  name="E01PYMDSC" size="60" maxlength="35" value="<%= escrow.getE01PYMDSC()%>" >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Payment Via</h4>
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
          <input type="text" readonly  name="E01PYMOPE" value="<%= escrow.getE01PYMOPE().trim()%>" size="2" maxlength="2">
          <input type="hidden" name="E01PYMGLN" value="<%= escrow.getE01PYMGLN().trim()%>">
          <input type="hidden" name="TYPECONC" value="">
          <input type="text" readonly  name="E01PYMCON" size="25" maxlength="25"  value="<%= escrow.getE01PYMCON().trim()%>"
					oncontextmenu="showPopUp(conceptHelp,this.name,document.forms[0].E01PYMBNK.value,'TYPECONC','E01PYMGLN','E01PYMOPE','10'); return false;">
        </div>
      </td>
      <td nowrap width="14%" > 
        <div align="center"> 
          <input type="text" readonly  name="E01PYMBNK" size="2" maxlength="2" value="<%= escrow.getE01PYMBNK().trim()%>" onKeyPress="enterInteger()">
        </div>
      </td>
      <td nowrap width="17%" > 
        <div align="center"> 
          <input type="text" readonly  name="E01PYMBRN" size="3" maxlength="3" value="<%= escrow.getE01PYMBRN().trim()%>" onKeyPress="enterInteger()"
                oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E01PYMBNK.value,'','','','')">
        </div>
      </td>
      <td nowrap width="22%" > 
        <div align="center"> 
          <input type="text" readonly  name="E01PYMCCY" size="3" maxlength="3" value="<%= escrow.getE01PYMCCY().trim()%>"
                oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E01PYMBNK.value,'','','','')">
        </div>
      </td>
      <td nowrap width="15%" > 
        <div align="center"> 
          <input type="text" readonly  name="E01PYMACC" size="12" maxlength="12"  value="<%= escrow.getE01PYMACC().trim()%>" onKeyPress="enterInteger()"
                oncontextmenu="showPopUp(lnreferHelp,this.name,document.forms[0].E01PYMBNK.value,'',document.forms[0].E01DEACUN.value,'','RT'); return false;">
        </div>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
</form>
</body>
</html>
