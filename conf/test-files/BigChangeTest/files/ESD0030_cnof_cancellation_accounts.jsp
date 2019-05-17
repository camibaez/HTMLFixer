<html>
<head>
<title>Reference Codes </title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="refCodes" class="datapro.eibs.beans.ESD003002Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT LANGUAGE="JavaScript">
builtHPopUp();

function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }

</SCRIPT>

<%
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }

%>


<H3 align="center">System Reference Codes - Deductions<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cnof_cancelation _accounts.jsp, ESD0030"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0030" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
   <INPUT TYPE=HIDDEN NAME="E02CNOBNK" value="<%= currUser.getE01UBK()%>">
  <h4>Basic Information</h4>
  <table  class="tableinfo">
    <tr>
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="30%">
              <div align="right">Classification :</div>
            </td>
            <td nowrap>
              <div align="left">
                <input type="text" name="E02CNOCFL" size="3" maxlength="2" value="<%= refCodes.getE02CNOCFL().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right">Code :</div>
            </td>
            <td nowrap>
              <div align="left">
                <input type="text" name="E02CNORCD" size="4" maxlength="3" value="<%= refCodes.getE02CNORCD().trim()%>">
                <input type="text" name="E02CNODSC" size="36" maxlength="35" value="<%= refCodes.getE02CNODSC().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap >
              <div align="right">Deduction :</div>
            </td>
            <td nowrap>
              <div align="left">
                <input type="text" name="E02CNOCHG" size="7" maxlength="6" value="<%= refCodes.getE02CNOCHG().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right">Deduction Factor :</div>
            </td>
            <td nowrap>
              <div align="left">
                <select name="E02CNOTCF">
                  <option value="" <%if (refCodes.getE02CNOTCF().equals("")) { out.print("selected"); }%>></option>
                  <option value="F" <%if (refCodes.getE02CNOTCF().equals("F")) { out.print("selected"); }%>>Flat Fee</option>
                  <option value="1" <%if (refCodes.getE02CNOTCF().equals("1")) { out.print("selected"); }%>>% Original Amount</option>
                  <option value="2" <%if (refCodes.getE02CNOTCF().equals("2")) { out.print("selected"); }%>>% Principal Amount</option>
				  <option value="3" <%if (refCodes.getE02CNOTCF().equals("3")) { out.print("selected"); }%>>% Payment</option>
                </select>
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap >
              <div align="right">Deduction Type :</div>
            </td>
            <td nowrap>
              <div align="left">
                <select name="E02CNOF01">
                  <option value="" <%if (refCodes.getE02CNOF01().equals("")) { out.print("selected"); }%>></option>
                  <option value="I" <%if (refCodes.getE02CNOF01().equals("I")) { out.print("selected"); }%>>Insurance</option>
                  <option value="T" <%if (refCodes.getE02CNOF01().equals("T")) { out.print("selected"); }%>>Taxes</option>
                  <option value="E" <%if (refCodes.getE02CNOF01().equals("E")) { out.print("selected"); }%>>Escrow</option>
                </select>
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap >
              <div align="right">Currency :</div>
            </td>
            <td nowrap>
              <div align="left">
                <input type="text" name="E02CNOSCY" size="4" maxlength="3" value="<%= refCodes.getE02CNOSCY().trim()%>"  >
                <a href="javascript:GetCurrency('E02CNOSCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a></div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right">General Ledger :</div>
            </td>
            <td nowrap>
              <div align="left">
                <input type="text" name="E02CNOSCG" size="17" maxlength="16" value="<%= refCodes.getE02CNOSCG().trim()%>">
                <a href="javascript:GetLedger('E02CNOSCG',document.forms[0].E02CNOBNK.value,'','')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a></div>
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
