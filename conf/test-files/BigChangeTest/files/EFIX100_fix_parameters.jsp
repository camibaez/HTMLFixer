<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Fixed Assets</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">



<jsp:useBean id="fix" class="datapro.eibs.beans.EFIX10001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

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
<h3 align="center">Fixed Assets Parameters<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="fe_acc.jsp, EDL0120">
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.amort.JSEFIX100" >
  <input type=HIDDEN name="SCREEN" value="400">
  <table class="tableinfo" width="100%" >
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trclear">
            <td nowrap width="15%" >
              <div align="right">Bank :</div>
            </td>
            <td nowrap colspan="3" width="85%" >
              <div align="left">
                <input type="text" name="E01FIXBNK" size="3" maxlength="2" readonly value="<%= fix.getE01FIXBNK()%>">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Basic Information</h4>
  <table class="tableinfo" width="100%" >
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trdark">
            <td nowrap width="28%" >
              <div align="right">Generate Depreciation Entries :</div>
            </td>
            <td nowrap colspan="3" >
              <div align="left">
                <input type="radio" name="E01FIXGIN" value="Y"  <%if (fix.getE01FIXGIN().equals("Y")) out.print("checked"); %>>
                Yes
                <input type="radio" name="E01FIXGIN" value="N"  <%if (fix.getE01FIXGIN().equals("N")) out.print("checked"); %>>
                No</div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="28%" >
              <div align="right">Booked in Another Branch :</div>
            </td>
            <td nowrap width="7%" >
              <input type="radio" name="E01FIXCDO" value="Y"  <%if (fix.getE01FIXCDO().equals("Y")) out.print("checked"); %>>
              Yes
              <input type="radio" name="E01FIXCDO" value="N"  <%if (fix.getE01FIXCDO().equals("N")) out.print("checked"); %>>
              No </td>
            <td nowrap width="21%" >
              <div align="right">Branch Number :</div>
            </td>
            <td nowrap width="44%" >
              <input type="text" name="E01FIXCBR" size="4" maxlength="3" onKeyPress="enterInteger()" value="<%= fix.getE01FIXCBR()%>">
              <a href="javascript:GetBranch('E01FIXCBR',document.forms[0].E01FIXBNK.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="absmiddle" border="0" ></a></td>
          </tr>
          <tr id="trdark">
            <td nowrap width="28%" >
              <div align="right">Inflation Adjustment :</div>
            </td>
            <td nowrap colspan="3" >
              <div align="left">
                <input type="text" name="E01FIXRTI" size="6" maxlength="5" value="<%= fix.getE01FIXRTI()%>" >
                (%)</div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="28%" >
              <div align="right">Generate Entry Month's Day :</div>
            </td>
            <td nowrap colspan="3" >
              <div align="left">
                <input type="text" name="E01FIXDCM" size="3" maxlength="2" value="<%= fix.getE01FIXDCM()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="28%" >
              <div align="right">Entries for new Items on First Month :</div>
            </td>
            <td nowrap colspan="3" >
              <div align="left">
                <input type="radio" name="E01FIXDTM" value="Y"  <%if (fix.getE01FIXDTM().equals("Y")) out.print("checked"); %>>
                Yes
                <input type="radio" name="E01FIXDTM" value="N"  <%if (fix.getE01FIXDTM().equals("N")) out.print("checked"); %>>
                No</div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="28%" >
              <div align="right">Accumulated VAT on Fixed Assets :</div>
            </td>
            <td nowrap colspan="3" >
              <div align="left">
                <input type="radio" name="E01FIXVAT" value="Y"  <%if (fix.getE01FIXVAT().equals("Y")) out.print("checked"); %>>
                Yes
                <input type="radio" name="E01FIXVAT" value="N"  <%if (fix.getE01FIXVAT().equals("N")) out.print("checked"); %>>
                No</div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p><table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF">
      <td width="33%">
 <div align="center">
	      <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>      </td>
    </tr>
  </table>
  </form>
</body>
</html>
