<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Management Portfolio System</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">



<jsp:useBean id="msgList" class="datapro.eibs.beans.EIE006501Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

</head>
<body>

<SCRIPT Language="Javascript">
function CheckAcc(){
	if(confirm("Please Confirm New Custody Fee Rate : " + document.forms[0].E01MSTNRT.value )){
	document.forms[0].submit();
	}
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

<div align="center">
  <h3>Custody Fee Rate Maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="custodyFee_rate_maint.jsp,EIE0065">
  </h3>
</div>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0065" >
  <h4>Basic Information
    <input type="hidden" name="SCREEN"  value="300" >
  </h4>
  <table  class="tableinfo" width="715">
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="17%" >
              <div align="right">Instrument :</div>
            </td>
            <td nowrap width="36%" >
              <input type="text" name="E01MSTIIC" size="10" maxlength="9" value="<%= msgList.getE01MSTIIC()%>" readonly>
            <INPUT type="text" name="E01IICDSC" size="40" maxlength="40" value="<%= msgList.getE01IICDSC()%>" readonly></td>
          </tr>
          <tr id="trdark">
            <td nowrap width="17%" >
              <div align="right">Portfolio :</div>
            </td>
            <td nowrap width="36%" >
              <input type="text" name="E01MSTPRF" size="10" maxlength="9" value="<%= msgList.getE01MSTPRF()%>" readonly>
            <INPUT type="text" name="E01PRFDSC" size="40" maxlength="40" value="<%= msgList.getE01PRFDSC()%>" readonly></td>
          </tr>
		 <tr id="trclear">
			<td colspan="2"></td>
		 </tr>
          <tr id="trdark">
            <td nowrap width="17%" >
              <div align="right">Current Rate :</div>
            </td>
            <td nowrap width="36%" >
              <input type="text" name="E01MSTCFR" size="20" maxlength="20" value="<%= msgList.getE01MSTCFR()%>" readonly onKeyPress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="17%" >
              <div align="right"> New Rate :</div>
            </td>
            <td nowrap width="36%" >
              <input type="text" name="E01MSTNRT" size="20" maxlength="20" value="<%= msgList.getE01MSTNRT()%>" onKeyPress="enterDecimal()">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table><br>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF">
      <td>
        <div align="center"> <INPUT type="checkbox" name="H01FLGWK2" value="A"
			<% if(msgList.getH01FLGWK2().equals("A")){ out.print("checked");} %>> Accept with Warnings </div>
      </td>
    </tr>
  </table>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF">
      <td width="33%">
  <div align="center">
		<input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="CheckAcc();">
  </div>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td>
        <div align="center"> </div>
      </td>
    </tr>
  </table>
  <font face="Arial"><font face="Arial"><font face="Arial"><font face="Arial"><font size="2">
  </font></font></font></font></font><BR>
  </form>
</body>
</html>
