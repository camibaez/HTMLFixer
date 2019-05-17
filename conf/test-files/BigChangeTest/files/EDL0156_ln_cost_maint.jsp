<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Loan Rates</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "lnList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<%
int row = 0;
try { row = Integer.parseInt(request.getParameter("ROW"));} catch (Exception e) {}
lnList.setCurrentRow(row);
datapro.eibs.beans.EDL015601Message lnCost = (datapro.eibs.beans.EDL015601Message) lnList.getRecord();

userPO.setPurpose("MAINTENANCE");
%>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">
	builtHPopUp();

	function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
		init(opth,field,bank,ccy,field1,field2,opcod);
		showPopupHelp();
	}

	function checkValues() {
       return true;
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

</head>
<body>
<h3 align="center">Loan Cost FASB 91<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="ln_cost_maint.jsp, EDL0156"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0156" >
  <input type=hidden name="SCREEN" value="200">
  <input type=hidden name="OPT" value="<%= request.getParameter("OPT") %>">
  <input type=hidden name="SELTYP" value="<%= request.getParameter("SELTYP") %>">

  <table class="tableinfo">
    <tr>
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="20%" align=right>
              <b>Bank :</b>
            </td>
            <td nowrap >
              <input type="text" name="E01DLEBNK" size="4" maxlength="2" value="<%= lnCost.getE01DLEBNK() %>" readonly>
            </td>
            <td nowrap width="20%" align=right>
              <b>Product :</b>
            </td>
            <td nowrap >
               <input type="text" name="E01DLEPRO" size="5" maxlength="4" value="<%= lnCost.getE01DLEPRO()%>" <%if (userPO.getPurpose().equals("MAINTENANCE")){%>readonly<%}%>>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="20%" align=right>
              <b>Debit G/L :</b>
            </td>
            <td nowrap colspan=3>
              <div align="left">
                <input type="text" name="E01DLEGLD" size="17" maxlength="16" value="<%= lnCost.getE01DLEGLD().trim()%>">
                <a href="javascript:GetLedgerByType('E01DLEGLD',document.forms[0].E01DLEBNK.value,'','','AMO')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
                <input type="text" name="E01GLDDSC" size="30" maxlength="35" value="<%= lnCost.getE01GLDDSC().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="20%" align=right>
              <b>Credit G/L :</b>
            </td>
            <td nowrap colspan=3>
              <div align="left">
                <input type="text" name="E01DLEGLC" size="17" maxlength="16" value="<%= lnCost.getE01DLEGLC().trim()%>">
                <a href="javascript:GetLedger('E01DLEGLC',document.forms[0].E01DLEBNK.value,'','')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
                <input type="text" name="E01GLCDSC" size="30" maxlength="35" value="<%= lnCost.getE01GLCDSC().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="20%" align=right>
              <b>Cost :</b>
            </td>
            <td nowrap colspan=3>
              <div align="left">
                <input type="text" name="E01DLECAM" size="17" maxlength="16" value="<%= lnCost.getE01DLECAM().trim()%>">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <p align="center">
        <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </p>

  </form>
</body>
</html>
