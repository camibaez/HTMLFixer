<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Back Office</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">



<jsp:useBean id="deal" class="datapro.eibs.beans.EDL010802Message"  scope="session" />

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
<h3 align="center">Commercial Papers - Back Office<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="fe_cp.jsp,EDL0108B">
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0108B" >
<input type="hidden" name="SCREEN"  value="4" >
<INPUT TYPE=HIDDEN NAME="SCRACMBNK" VALUE="<%= deal.getE02DEABNK().trim()%>">

   <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="20%" >
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="80%" >
              <div align="left">
                <%= deal.getE02DEAACC().trim()%>
               </div>
            </td>
		  </tr>
          <tr id="trdark">
            <td nowrap width="20%" >
              <div align="right"><b>Counterparty :</b> </div>
            </td>
            <td nowrap width="80%">
              <div align="left">
                <%= deal.getE02DLICUS().trim()%>&nbsp;&nbsp;
                <%= deal.getE02DLINAM().trim()%>
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="20%">
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="20%">
              <div align="left">
                <%= deal.getE02DEACUN().trim()%>&nbsp;&nbsp;
                <%= deal.getE02CUSNA1().trim()%>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

   <h4> Basic Information</h4>
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trclear">
            <td nowrap width="25%">
              <div align="right">Trade Date :</div>
            </td>
            <td nowrap width="23%">
              <%= Util.formatDate(deal.getE02DLITD1().trim(),deal.getE02DLITD2().trim(),deal.getE02DLITD3().trim())%>
            </td>
            <td nowrap width="25%">
              <div align="right">Settlement Date :</div>
            </td>
            <td nowrap width="27%">
            	<%= Util.formatDate(deal.getE02DLISD1().trim(),deal.getE02DLISD2().trim(),deal.getE02DLISD3().trim())%>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="25%">
              <div align="right">Face Amount :</div>
            </td>
            <td nowrap width="23%">
				<%= deal.getE02DLIFCV().trim()%>
            </td>
            <td nowrap width="25%">
              <div align="right">Sale/Purchase Price :</div>
            </td>
            <td nowrap width="27%">
 				<%= deal.getE02DLIPRC().trim()%>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="25%" height="37">
              <div align="right">Interest Accrued :</div>
            </td>
            <td nowrap width="23%" height="37">
				<%= deal.getE02DLIINT().trim()%>
            </td>
            <td nowrap width="25%" height="37">
              <div align="right">Total Proceed :</div>
            </td>
            <td nowrap width="27%" height="37">
              <%= deal.getE02DLINET().trim()%>

            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4> Repayment Account</h4>
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trclear">
            <td nowrap width="25%">
              <div align="right">Bank :</div>
            </td>
            <td nowrap width="23%">
				<input type="text" name="E02DLIOBN" size="2" maxlength="2" value="<%= deal.getE02DLIOBN().trim()%>" onkeypress="enterInteger()">
				<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" >
            </td>
            <td nowrap width="25%">
              <div align="right">Branch :</div>
            </td>
            <td nowrap width="27%">
				<input type="text" name="E02DLIOBR" size="3" maxlength="3"value="<%= deal.getE02DLIOBR().trim()%>" >
				<a href="javascript:GetBranch('E02DLIOBR','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"  ></a>
				<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" >
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="25%">
              <div align="right">Currency :</div>
            </td>
            <td nowrap width="23%">
				<input type="text" name="E02DLIOCY" size="3" maxlength="3" value="<%= deal.getE02DLIOCY().trim()%>" >
				<a href="javascript:GetCurrency('E02DLIOCY', '')"> <img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0"  ></a>
				<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" >
            </td>
            <td nowrap width="25%">
              <div align="right">Account :</div>
            </td>
            <td nowrap width="27%">
				<input type="text" name="E02DLIOAC" size="15" maxlength="13" value="<%= deal.getE02DLIOAC().trim()%>" onkeypress="enterInteger()">
              	<a href="javascript:GetLedger('E02DLIOAC',document.forms[0].E02DLIOBN.value,document.forms[0].E02DLIOCY.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              	<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <h4>Limits</h4>
  <table  class="tableinfo" >
    <tr >
      <td nowrap>
        <table width="100%">
          <tr id="trdark">
            <td nowrap>&nbsp;</td>
            <td nowrap  colspan="2">
              <div align="center"><b>Limit Amount </b></div>
            </td>
            <td nowrap >
              <div align="center"><b>Utilized Limit Amount</b></div>
            </td>
            <td nowrap >
              <div align="center"><b>Available Limit Amount </b></div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap>Credit Lines</td>
            <td nowrap  colspan="2">
              <div align="right"><%= Util.fcolorCCY(deal.getE02DLSAMT1())%></div>
            </td>
            <td nowrap >
              <div align="right"><%= Util.fcolorCCY(deal.getE02DLSAMT3())%></div>
            </td>
            <td nowrap >
              <div align="right"><b><%= Util.fcolorCCY(deal.getE02DLSAMT2())%></b></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <br>
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
  <BR>
  </form>
</body>
</html>
