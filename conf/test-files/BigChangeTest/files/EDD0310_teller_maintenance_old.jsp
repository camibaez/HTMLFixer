<html>
<head>
<title>Maestro de Agencias</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="brnDetails" class="datapro.eibs.beans.EDD031001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "EDD031001Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />


<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<script language="JavaScript">

function goAction(op) {
	document.forms[0].opt.value = op;
	document.forms[0].SCREEN.value = 800;
	document.forms[0].submit();
}

</SCRIPT>

<%
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }

    int row;
    String sTitle = "";
    int sValue = 600;
    int sOption = 0;
    String sLabel = "";
    String sCostCenter = "";

   if (request.getParameter("SCREEN") != null){
      sValue = Integer.parseInt(request.getParameter("SCREEN"));
      if (sValue == 600 || sValue == 200) {
        sTitle = "Teller Maintenance";
        sValue = 600;
      } else {
       	sTitle = "Teller New";
      }
   }
%>

<H3 align="center"><%=sTitle%> <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="teller_maintenance.jsp, EDD0310"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.teller.JSEDD0310" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="<%=sValue%>">
  <input type=HIDDEN name="opt">

  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF">
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="16%" >
              <div align="right"><b>Teller ID :</b></div>
            </td>
            <td nowrap width="14%">
              <div align="left">
                <input type="text" name="E01TLMTID" size="3" maxlength="3" value="<%= brnDetails.getE01TLMTID().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="20%">
              <div align="right"><b>Teller Currency :</b></div>
            </td>
            <td nowrap colspan="3" >
              <div align="left"><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" name="E01TLMCCY" size="3" maxlength="3" value="<%= brnDetails.getE01TLMCCY().trim()%>" readonly>
                </font></font></font></div>
            </td>
            <td nowrap width="16%" >
              <div align="right"><b>Teller Type :</b></div>
            </td>
            <td nowrap width="40%">
              <div align="left">
				<%String sType = "";
				  if (brnDetails.getE01TLMTYP().equals("T")) {sType = "Regular Teller"; sOption = 1;
				  } else if (brnDetails.getE01TLMTYP().equals("H")) {sType = "Head Teller"; sOption = 2;
				  } else if (brnDetails.getE01TLMTYP().equals("O")) {sType = "O/D Official"; sOption = 3;
				  } else if (brnDetails.getE01TLMTYP().equals("S")) {sType = "Operations Supervisor"; sOption = 4;
				  } else if (brnDetails.getE01TLMTYP().equals("I")) {sType = "Teller Interface"; sOption = 5;
				  }%>
                <input type="text" name="TMPTLMTYP" size="25" maxlength="22" value = "<%=sType%>"  readonly>
                <input type=HIDDEN name="E01TLMTYP" size="1" maxlength="3" value="<%= brnDetails.getE01TLMTYP().trim()%>" readonly>
                <a href="javascript:goAction(4)"><img src="<%=request.getContextPath()%>/images/buttdown_1.gif" alt="Change Teller Type" align="bottom" border="0"></a>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <div id="maintenace" style="visibility:visible">
  <h4>Teller Information</h4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF">
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trclear">
            <td nowrap width="16%" height="23">
              <div align="right">Teller Bank :</div>
            </td>
            <td nowrap height="23" colspan="3">
              <input type="text" name="E01TLMBNK" size="3" maxlength="2" value="<%= brnDetails.getE01TLMBNK().trim()%>" >
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%" height="23">
              <div align="right">Teller Branch :</div>
            </td>
            <td nowrap height="23" colspan="3">
              <input type="text" name="E01TLMBRN" size="4" maxlength="3" value="<%= brnDetails.getE01TLMBRN().trim()%>">
              <a href="javascript:GetBranch('E01TLMBRN',document.forms[0].E01TLMBNK.value)">
              <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"  ></a>

            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="16%" height="23">
              <% switch (sOption){
                   case 5:
                   case 1: sLabel = "Teller Maximum Cash Allowed :";
                           break;
                   default: sLabel = "OverDraft Amount :";
                            break;
              }
              %>
              <div align="right"><%=sLabel%></div>
            </td>
            <td nowrap height="23" colspan="3">
              <input type="text" name="E01TLMMXC" size="16" maxlength="15" value="<%= brnDetails.getE01TLMMXC().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%" height="23">
              <div align="right">Cash Amount to Open Teller with :</div>
            </td>
            <td nowrap height="23" colspan="3">
              <input type="text" name="E01TLMTOP" size="16" maxlength="15" value="<%= brnDetails.getE01TLMTOP().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="16%" height="23">
              <% switch (sOption){
                   case 5:
                   case 1: sLabel = "Teller Cash Withdrawal Limit :";
                           break;
                   default: sLabel = "Withdrawals Amount :";
                            break;
              }
              %>
              <div align="right"><%=sLabel%></div>
            </td>
            <td nowrap height="23" colspan="3">
              <input type="text" name="E01TLMFLW" size="16" maxlength="15" value="<%= brnDetails.getE01TLMFLW().trim()%>" >
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%" height="23">
              <% switch (sOption){
                   case 5:
                   case 1: sLabel = "Teller Cash Deposit Limit :";
                           break;
                   default: sLabel = "Deposit Amount :";
                            break;
              }
              %>
              <div align="right"><%=sLabel%></div>
            </td>
            <td nowrap height="23" colspan="3">
              <input type="text" name="E01TLMFLD" size="16" maxlength="15" value="<%= brnDetails.getE01TLMFLD().trim()%>" >
            </td>
          </tr>
          <% if (sOption == 1 || sOption == 5) {%>
          <tr id="trclear">
            <td nowrap width="16%" height="23">
              <div align="right">Teller General Ledger :</div>
            </td>
            <td nowrap height="23" colspan="3">
              <input type="text" name="E01TLMGLN" size="16" maxlength="15" value="<%= brnDetails.getE01TLMGLN().trim()%>">
              <a href="javascript:GetLedger('E01TLMGLN',document.forms[0].E01TLMBNK.value,document.forms[0].E01TLMCCY.value,'')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%" height="23">
              <div align="right">Check ON-US G/L Num (No Holds) :</div>
            </td>
            <td nowrap height="23" width="10%">
              <input type="text" name="E01TLMONG" size="16" maxlength="15" value="<%= brnDetails.getE01TLMONG().trim()%>">
              <a href="javascript:GetLedger('E01TLMONG',document.forms[0].E01TLMBNK.value,document.forms[0].E01TLMCCY.value,'')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a>
            </td>
            <td nowrap width="40%" height="23">
              <div align="left">Days</div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="16%" height="23">
              <div align="right">Check ON-US G/L Num (With Holds) :</div>
            </td>
            <td nowrap height="23" width="10%">
              <input type="text" name="E01TLMOHG" size="16" maxlength="15" value="<%= brnDetails.getE01TLMOHG().trim()%>">
              <a href="javascript:GetLedger('E01TLMOHG',document.forms[0].E01TLMBNK.value,document.forms[0].E01TLMCCY.value,'')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a>
            </td>
            <td nowrap align="left" width="40%"><input type="text" name="E01TLMOHD" size="3" maxlength="2" value="<%= brnDetails.getE01TLMOHD().trim()%>"></td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%" height="23">
              <div align="right">Local Checks General Ledger :</div>
            </td>
            <td nowrap height="23" width="10%">
              <input type="text" name="E01TLMLOG" size="16"	maxlength="15" value="<%= brnDetails.getE01TLMLOG().trim()%>">
              <a href="javascript:GetLedger('E01TLMLOG',document.forms[0].E01TLMBNK.value,document.forms[0].E01TLMCCY.value,'')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a>
            </td>
            <td nowrap align="left" width="40%"><input type="text" name="E01TLMLOD" size="3" maxlength="2" value="<%= brnDetails.getE01TLMLOD().trim()%>"></td>
          </tr>
          <tr id="trclear">
            <td nowrap width="16%" height="23">
              <div align="right">Non Local Checks General Ledger :</div>
            </td>
            <td nowrap height="23" width="10%">
              <input type="text" name="E01TLMNLG" size="16"	maxlength="15" value="<%= brnDetails.getE01TLMNLG().trim()%>">
              <a href="javascript:GetLedger('E01TLMNLG',document.forms[0].E01TLMBNK.value,document.forms[0].E01TLMCCY.value,'')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a>
            </td>
            <td nowrap align="left" width="40%"><input type="text" name="E01TLMNLD" size="3" maxlength="2" value="<%= brnDetails.getE01TLMNLD().trim()%>"></td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%" height="23">
              <div align="right">Teller Batch Number :</div>
            </td>
            <td nowrap height="23" colspan="3">
              <input type="text" name="E01TLMBTH" size="5" maxlength="4" value="<%= brnDetails.getE01TLMBTH().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="16%" height="23">
              <div align="right">Teller Cost Center Number :</div>
            </td>
            <td nowrap height="23" colspan="3">
              <input type="text" name="E01TLMCST" size="7" maxlength="6" value="<%= brnDetails.getE01TLMCST().trim()%>">
              <a href="javascript:GetCostCenter('E01TLMCST',document.forms[0].E01TLMBNK.value)">
              <img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
            </td>
          </tr>
          <%}%>
        </table>
      </td>
    </tr>
  </table>
  </div>

  <br>
  <div align="center">
    <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>

  </form>
</body>
</html>
