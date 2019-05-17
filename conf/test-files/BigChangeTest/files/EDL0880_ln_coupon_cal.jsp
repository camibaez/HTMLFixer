<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Interest Calculator</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="calcLoans" class= "datapro.eibs.beans.EDL088001Message"  scope="session"/>
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
<h3 align="center"> Coupon Payment Calculator<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="ln_counpon_cal.jsp, EDL0880"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0880" >
  <input type=HIDDEN name="SCREEN" value="2">
  <h4>Basic Information</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right"> Amount :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01SCRAMT" size="15" maxlength="13" value="<%= calcLoans.getE01SCRAMT().trim()%>"  onkeypress="enterPrincipal()">
            </td>
            <td nowrap   > 
              <div align="right">Interest Rate :</div>
            </td>
            <td nowrap   > 
              <input type="text" name="E01SCRRTE" size="10" maxlength="9" value="<%= calcLoans.getE01SCRRTE().trim()%>"  onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right"> Previous Payment Date :</div>
            </td>
            <td nowrap   > 
              <input type="text" name="E01SCRVD1" size="2" maxlength="2" value="<%= calcLoans.getE01SCRVD1().trim()%>"  onkeypress="enterInteger()">
              <input type="text" name="E01SCRVD2" size="2" maxlength="2" value="<%= calcLoans.getE01SCRVD2().trim()%>"  onkeypress="enterInteger()">
              <input type="text" name="E01SCRVD3" size="2" maxlength="2" value="<%= calcLoans.getE01SCRVD3().trim()%>"  onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01SCRVD1,document.forms[0].E01SCRVD2,document.forms[0].E01SCRVD3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
            </td>
            <td nowrap   > 
              <div align="right">Next Coupon Payment :</div>
            </td>
            <td nowrap   > 
              <input type="text" name="E01SCRMD1" size="2" maxlength="2" value="<%= calcLoans.getE01SCRMD1().trim()%>"  onkeypress="enterInteger()">
              <input type="text" name="E01SCRMD2" size="2" maxlength="2" value="<%= calcLoans.getE01SCRMD2().trim()%>"  onkeypress="enterInteger()">
              <input type="text" name="E01SCRMD3" size="2" maxlength="2" value="<%= calcLoans.getE01SCRMD3().trim()%>"  onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01SCRMD1,document.forms[0].E01SCRMD2,document.forms[0].E01SCRMD3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
   <br>
  <table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="50%"> 
              <div align="left">Days Count Conventions</div>
            </td>
            <td nowrap width="20%"> 
            	<div align="center">Days</div>
            </td>
            <td nowrap width="30%"> 
              <div align="center"> Coupon Amount</div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="left">(1) Actual/Actual (In Period)</div>
            </td>
            <td nowrap align="center" >
              <input type="text" name="E01SCRDY1" readonly size="10" maxlength="9" value="<%= calcLoans.getE01SCRDY1().trim()%>" >
            </td>
            <td nowrap align="center" >
              <input type="text" name="E01SCRAM1" readonly size="10" maxlength="9" value="<%= calcLoans.getE01SCRAM1().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="left">(2) Actual/365</div>
            </td>
            <td nowrap align="center" >
              <input type="text" name="E01SCRDY2" readonly size="10" maxlength="9" value="<%= calcLoans.getE01SCRDY2().trim()%>" >
            </td>
            <td nowrap align="center" >
              <input type="text" name="E01SCRAM2" readonly size="10" maxlength="9" value="<%= calcLoans.getE01SCRAM2().trim()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <table align="right" cellpadding=0 cellspacing=0 width="100%" border="0">
              <tr><td align="right">
              	<div align="left">(3) Actual/365 (366 in Leap Year) 
              </td>
              <td align="right">
              	<input type="text" name="E01SCRLPS" readonly size="8" maxlength="9" align="middle"  value="<%= calcLoans.getE01SCRLPS().trim()%>" ></div>
              </td></tr>
              </table>
            </td>
            <td nowrap align="center" >
              <input type="text" name="E01SCRDY3" readonly size="10" maxlength="9" value="<%= calcLoans.getE01SCRDY3().trim()%>" >
            </td>
            <td nowrap align="center" >
              <input type="text" name="E01SCRAM3" readonly size="10" maxlength="9" value="<%= calcLoans.getE01SCRAM3().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="left">(4) Actual/360</div>
            </td>
            <td nowrap align="center" >
              <input type="text" name="E01SCRDY4" readonly size="10" maxlength="9" value="<%= calcLoans.getE01SCRDY4().trim()%>" >
            </td>
            <td nowrap align="center" >
              <input type="text" name="E01SCRAM4" readonly size="10" maxlength="9" value="<%= calcLoans.getE01SCRAM4().trim()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="left">(5) 30/360 (366 in Leap Year)</div>
            </td>
            <td nowrap align="center" >
              <input type="text" name="E01SCRDY5" readonly size="10" maxlength="9" value="<%= calcLoans.getE01SCRDY5().trim()%>" >
            </td>
            <td nowrap align="center" >
              <input type="text" name="E01SCRAM5" readonly size="10" maxlength="9" value="<%= calcLoans.getE01SCRAM5().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="left">(6) 30E/360</div>
            </td>
            <td nowrap align="center" >
              <input type="text" name="E01SCRDY6" readonly size="10" maxlength="9" value="<%= calcLoans.getE01SCRDY6().trim()%>" >
            </td>
            <td nowrap align="center" >
              <input type="text" name="E01SCRAM6" readonly size="10" maxlength="9" value="<%= calcLoans.getE01SCRAM6().trim()%>" >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <div align="center"> 
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>

  </form>
</body>
</html>
