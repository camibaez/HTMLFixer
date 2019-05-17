<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Interest Calculator</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="calcLoans" class= "datapro.eibs.beans.EDL029001Message"  scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>


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
<div align="center"></div>
<h3 align="center"> Loans Interest Calculator<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="ln_cal.jsp, EDL0880"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0880" >
  <input type=HIDDEN name="SCREEN" value="6">
  <h4>Basic Information</h4>
  <table class="tableinfo">
    <tr >
      <td nowrap >
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark">
            <td nowrap >
              <div align="right"> Principal :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01DEAPRI" size="15" maxlength="13" value="<%= calcLoans.getE01DEAPRI().trim()%>"  onkeypress="enterPrincipal()">
            </td>
            <td nowrap >
              <div align="right"></div>
            </td>
            <td nowrap >&nbsp; </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right"> Initial Date :</div>
            </td>
            <td nowrap   >
              <input type="text" name="E01DEAOD1" size="2" maxlength="2" value="<%= calcLoans.getE01DEAOD1().trim()%>"  onkeypress="enterInteger()">
              <input type="text" name="E01DEAOD2" size="2" maxlength="2" value="<%= calcLoans.getE01DEAOD2().trim()%>"  onkeypress="enterInteger()">
              <input type="text" name="E01DEAOD3" size="2" maxlength="2" value="<%= calcLoans.getE01DEAOD3().trim()%>"  onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01DEAOD1,document.forms[0].E01DEAOD2,document.forms[0].E01DEAOD3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
            </td>
            <td nowrap   >
              <div align="right">Final Date :</div>
            </td>
            <td nowrap   >
              <input type="text" name="E01DEAMD1" size="2" maxlength="2" value="<%= calcLoans.getE01DEAMD1().trim()%>"  onkeypress="enterInteger()">
              <input type="text" name="E01DEAMD2" size="2" maxlength="2" value="<%= calcLoans.getE01DEAMD2().trim()%>"  onkeypress="enterInteger()">
              <input type="text" name="E01DEAMD3" size="2" maxlength="2" value="<%= calcLoans.getE01DEAMD3().trim()%>"  onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01DEAMD1,document.forms[0].E01DEAMD2,document.forms[0].E01DEAMD3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap >
              <div align="right"> Terms :</div>
            </td>
            <td nowrap   >
              <input type="text" name="E01DEATRM" size="4" maxlength="4" value="<%= calcLoans.getE01DEATRM().trim()%>" onkeypress="enterInteger()">
              <select name="E01DEATRC">
                <option value=" " <% if (!(calcLoans.getE01DEATRC().equals("D") ||calcLoans.getE01DEATRC().equals("M")||calcLoans.getE01DEATRC().equals("Y"))) out.print("selected"); %>></option>
                <option value="D" <% if(calcLoans.getE01DEATRC().equals("D")) out.print("selected");%>>Day(s)</option>
                <option value="M" <% if(calcLoans.getE01DEATRC().equals("M")) out.print("selected");%>>Month(s)</option>
                <option value="Y" <% if(calcLoans.getE01DEATRC().equals("Y")) out.print("selected");%>>Year(s)</option>
              </select>
            </td>
            <td nowrap   >
              <div align="right">Interest Rate :</div>
            </td>
            <td nowrap   >
              <input type="text" name="E01DEARTE" size="10" maxlength="9" value="<%= calcLoans.getE01DEARTE().trim()%>"  onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap  >
              <div align="right">Accrual Base :</div>
            </td>
            <td nowrap   >
              <input type="text" name="E01DEABAS" size="3" maxlength="3" value="<%= calcLoans.getE01DEABAS().trim()%>"  onkeypress="enterInteger()">
            </td>
            <td nowrap   >
              <div align="right">Interest Type :</div>
            </td>
            <td nowrap   >
              <input type="text" name="E01DEAICT" size="2" maxlength="1" value="<%= calcLoans.getE01DEAICT().trim()%>" >
              <a href="javascript:GetCode('E01DEAICT','STATIC_cd_formula.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap >
              <div align="right"></div>
            </td>
            <td nowrap  >&nbsp; </td>
            <td nowrap  >
              <div align="right"></div>
            </td>
            <td nowrap  >&nbsp; </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right">Discounted Rate :</div>
            </td>
            <td nowrap  >
              <input type="text" name="E01DSCRTE" readonly size="10" maxlength="9" value="<%= calcLoans.getE01DSCRTE().trim()%>"  onkeypress="enterDecimal()">
            </td>
            <td nowrap  >
              <div align="right">Maturity :</div>
            </td>
            <td nowrap  >
              <input type="text" name="E01DYSNME" readonly size="15" maxlength="9" value="<%= calcLoans.getE01DYSNME().trim()%>"  onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap >
              <div align="right">Principal :</div>
            </td>
            <td nowrap  >
              <input type="text" name="E01DEAPRI" readonly size="15" maxlength="13" value="<%= calcLoans.getE01DEAPRI().trim()%>"  onkeypress="enterDecimal()">
            </td>
            <td nowrap  >
              <div align="right">Maturity Date :</div>
            </td>
            <td nowrap  >
              <input type="text" name="E01VENCI1" readonly size="2" maxlength="2" value="<%= calcLoans.getE01VENCI1().trim()%>"  onkeypress="enterInteger()">
              <input type="text" name="E01VENCI2" readonly size="2" maxlength="2" value="<%= calcLoans.getE01VENCI2().trim()%>"  onkeypress="enterInteger()">
              <input type="text" name="E01VENCI3" readonly size="2" maxlength="2" value="<%= calcLoans.getE01VENCI3().trim()%>"  onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01VENCI1,document.forms[0].E01VENCI2,document.forms[0].E01VENCI3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right">Interest :</div>
            </td>
            <td nowrap  >
              <input type="text" name="E01DEAINT" readonly size="15" maxlength="13" value="<%= calcLoans.getE01DEAINT().trim()%>"  onkeypress="enterDecimal()">
            </td>
            <td nowrap  >&nbsp;</td>
            <td nowrap  >&nbsp;</td>
          </tr>
          <tr id="trdark">
            <td nowrap >
              <div align="right">Total :</div>
            </td>
            <td nowrap  >
              <input type="text" name="E01TOTDUE" readonly size="15" maxlength="13" value="<%= calcLoans.getE01TOTDUE().trim()%>"  onkeypress="enterDecimal()">
            </td>
            <td nowrap  >&nbsp;</td>
            <td nowrap  >&nbsp;</td>
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
