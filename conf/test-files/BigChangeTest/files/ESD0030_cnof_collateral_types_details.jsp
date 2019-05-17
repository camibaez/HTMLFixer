<html>
<head>
<title>Reference Code</title>
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


<H3 align="center">System References Codes<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cnof_collateral_types_details.jsp, ESD0030"></H3>
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
            <td nowrap width="30%" >
              <div align="right">Code :</div>
            </td>
            <td nowrap >
              <div align="left">
                <input type="text" name="E02CNORCD" size="4" maxlength="3" value="<%= refCodes.getE02CNORCD().trim()%>">
                <input type="text" name="E02CNODSC" size="36" maxlength="35" value="<%= refCodes.getE02CNODSC().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="30%">
              <div align="right">General Ledger Account :</div>
            </td>
            <td nowrap>
              <div align="left">
                <input type="text" name="E02CNOSCG" size="17" maxlength="16" value="<%= refCodes.getE02CNOSCG().trim()%>">
                <a href="javascript:GetLedger('E02CNOSCG',document.forms[0].E02CNOBNK.value,'','')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a></div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="30%">
              <div align="right">Currency Code :</div>
            </td>
            <td nowrap>
              <div align="left">
                <input type="text" name="E02CNOF02" size="4" maxlength="3" value="<%= refCodes.getE02CNOF02().trim()%>"  >
                <a href="javascript:GetCurrency('E02CNOF02','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a></div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="30%">
              <div align="right">Collateral Class :</div>
            </td>
            <td nowrap>
              <div align="left">
                <input type="text" name="E02CNODCC" size="3" maxlength="2" value="<%= refCodes.getE02CNODCC().trim()%>"  >
                <a href="javascript:GetCode('E02CNODCC','STATIC_cnof_coll_class_codes.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a></div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="30%">
              <div align="right">Reevaluation Month :</div>
            </td>
            <td nowrap>
              <div align="left">
                <input type="text" name="E02CNOFRP" size="3" maxlength="2" value="<%= refCodes.getE02CNOFRP().trim()%>"  >
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="30%">
              <div align="right">Provision :</div>
            </td>
            <td nowrap>
              <div align="left">
                <input type="text" name="E02CNOCST" size="8" maxlength="7" value="<%= refCodes.getE02CNOCST().trim()%>"  >
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
