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


<H3 align="center">System Reference Codes - Transactions Codes<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cnof_transactions_codes_details.jsp, ESD0030"></H3>
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
                <input type="text" name="E02CNOCFL" size="2" maxlength="1" value="<%= refCodes.getE02CNOCFL().trim()%>">
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
          <tr id="trdark">
            <td nowrap width="30%">
              <div align="right">Transaction Charges :</div>
            </td>
            <td nowrap>
              <div align="left">
                <input type="text" name="E02CNOCHG" size="17" maxlength="15" value="<%= refCodes.getE02CNOCHG().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="30%">
              <div align="right">Service Charges Currency :</div>
            </td>
            <td nowrap>
              <div align="left">
                <input type="text" name="E02CNOSCY" size="4" maxlength="3" value="<%= refCodes.getE02CNOSCY().trim()%>"  >
                <a href="javascript:GetCurrency('E02CNOSCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a></div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="30%">
              <div align="right">Debit or Credit to Customer :</div>
            </td>
            <td nowrap>
              <div align="left">
                <input type="radio" name="E02CNODCC" value="DR" <%if (refCodes.getE02CNODCC().equals("DR")) out.print("checked"); %>>
                Debit
                <input type="radio" name="E02CNODCC" value="CR" <%if (refCodes.getE02CNODCC().equals("CR")) out.print("checked"); %>>
                Credit </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="30%">
              <div align="right">Services Charges General Ledger :</div>
            </td>
            <td nowrap>
              <div align="left">
                <input type="text" name="E02CNOSCG" size="17" maxlength="16" value="<%= refCodes.getE02CNOSCG().trim()%>">
                <a href="javascript:GetLedger('E02CNOSCG',document.forms[0].E02CNOBNK.value,document.forms[0].E02CNOSCY.value,'')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a></div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="30%">
              <div align="right">Transaction Attributes :</div>
            </td>
            <td nowrap>
              <div align="left">
                <input type="text" name="E02CNOADI" size="2" maxlength="1" value="<%= refCodes.getE02CNOADI().trim()%>" >
                <a href="javascript:GetCode('E02CNOADI','STATIC_cnof_trans_attributes.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a>
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="30%">
              <div align="right">Rejection Number :</div>
            </td>
            <td nowrap>
              <div align="left">
                <input type="text" name="E02CNOFRP" size="6" maxlength="5" value="<%= refCodes.getE02CNOFRP().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="30%">
              <div align="right">External Transaction Codes :</div>
            </td>
            <td nowrap>
              <div align="left">
                <input type="text" name="E02CNOCPC" size="5" maxlength="4" value="<%= refCodes.getE02CNOCPC().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="30%">
              <div align="right">Debit, Credit or Both :</div>
            </td>
            <td nowrap>
              <div align="left">
                <input type="radio" name="E02CNODCB" value="D" <%if (refCodes.getE02CNODCB().equals("D")) out.print("checked"); %>>
                Debit
                <input type="radio" name="E02CNODCB" value="C" <%if (refCodes.getE02CNODCB().equals("C")) out.print("checked"); %>>
                Credit
                <input type="radio" name="E02CNODCB" value="B" <%if (refCodes.getE02CNODCB().equals("B")) out.print("checked"); %>>
                Both </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="30%">
              <div align="right">Print Customer Advice :</div>
            </td>
            <td nowrap>
              <div align="left">
                <input type="radio" name="E02CNOPAF" value="Y" <%if (refCodes.getE02CNOPAF().equals("Y")) out.print("checked"); %>>
                Yes
                <input type="radio" name="E02CNOPAF" value="N" <%if (refCodes.getE02CNOPAF().equals("N")) out.print("checked"); %>>
                No </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="30%">
              <div align="right">Source of Funds  :</div>
            </td>
            <td nowrap>
              <div align="left">
                <input type="text" name="E02CNOMID" size="3" maxlength="2" value="<%= refCodes.getE02CNOMID().trim()%>">
                <A href="javascript:GetSpecUsrTab('E02CNOMID','14')"><IMG
					src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"
					align="middle" border="0"></A></div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="30%">
              <div align="right">Disbursement of Funds :</div>
            </td>
            <td nowrap>
              <div align="left">
                <input type="text" name="E02CNOMIC" size="3" maxlength="2" value="<%= refCodes.getE02CNOMIC().trim()%>"><A
					href="javascript:GetSpecUsrTab('E02CNOMIC','14')"><IMG
					src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"
					align="middle" border="0"></A></div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="30%">
              <div align="right">Transaction Application Code :</div>
            </td>
            <td nowrap>
              <div align="left">
                <input type="text" name="E02CNOAPC" size="2" maxlength="1" value="<%= refCodes.getE02CNOAPC().trim()%>" >
                <a href="javascript:GetCode('E02CNOAPC','STATIC_cnof_trans_app_codes.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Only for Account Analisys</h4>
  <table  class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="40%">
              <div align="right">Transaction Cost :</div>
            </td>
            <td nowrap width="60%">
              <div align="left">
                <input type="text" name="E02CNOCST" size="8" maxlength="7" value="<%= refCodes.getE02CNOCST().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="40%" >
              <div align="right">Service Fee Transaction :</div>
            </td>
            <td nowrap  width="60%">
              <div align="left">
                <input type="radio" name="E02CNOCPF" value="Y" <%if (refCodes.getE02CNOCPF().equals("Y")) out.print("checked"); %>>
                Yes
                <input type="radio" name="E02CNOCPF" value="N" <%if (refCodes.getE02CNOCPF().equals("N")) out.print("checked"); %>>
                No </div>
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
