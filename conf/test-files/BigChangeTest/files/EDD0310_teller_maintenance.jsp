<html>
<head>
<title>Teller New / Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="brnDetails" class="datapro.eibs.beans.EDD031001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />


<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<%
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }

    String sTitle = "";
    int sValue = 600;

   	if (request.getParameter("SCREEN") != null) {
      sValue = Integer.parseInt(request.getParameter("SCREEN"));
      if (sValue == 600 || sValue == 200) {
        sTitle = "Teller Maintenance";
        sValue = 600;
      } else {
       	sTitle = "Teller New";
      }
   }
%>

<script language="JavaScript">

function update(value) {
	if (value == 'T' || value == 'I') {
		document.getElementById("LABEL1").innerHTML = "Teller Maximum Cash Allowed :";
		document.getElementById("LABEL2").innerHTML = "Teller Cash Withdrawal Limit :";
		document.getElementById("LABEL3").innerHTML = "Teller Cash Deposit Limit :";
		document.getElementById("ADDITIONAL").style.display = "";
	} else {
		document.getElementById("LABEL1").innerHTML = "OverDraft Amount :";
		document.getElementById("LABEL2").innerHTML = "Withdrawals Amount :";
		document.getElementById("LABEL3").innerHTML = "Deposit Amount :";
		document.getElementById("ADDITIONAL").style.display = "none";
	}
}

</SCRIPT>

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
            <td nowrap width="16%" ><div align="right"><b>Teller ID :</b></div></td>
            <td nowrap width="14%">
              <div align="left">
                <input type="text" name="E01TLMTID" size="3" maxlength="3" value="<%= brnDetails.getE01TLMTID().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="20%"><div align="right"><b>Teller Currency :</b></div></td>
            <td nowrap colspan="3" >
              <div align="left">
                <input type="text" name="E01TLMCCY" size="3" maxlength="3" value="<%= brnDetails.getE01TLMCCY().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%" ><div align="right"><b>Teller Type :</b></div></td>
            <td nowrap width="40%"> 
              <div align="left"> 
              <select id="TYPE" name="E01TLMTYP" size="1" onchange="update(this.value)">
					<option value="T" <% if (brnDetails.getE01TLMTYP().equals("T")) out.print("selected"); %>>Regular Teller</option>
					<option value="H" <% if (brnDetails.getE01TLMTYP().equals("H")) out.print("selected"); %>>Head Teller</option>
					<option value="O" <% if (brnDetails.getE01TLMTYP().equals("O")) out.print("selected"); %>>O/D Official</option>
					<option value="S" <% if (brnDetails.getE01TLMTYP().equals("S")) out.print("selected"); %>>Operations Supervisor</option>
					<option value="I" <% if (brnDetails.getE01TLMTYP().equals("I")) out.print("selected"); %>>Teller Interface</option>
				</select>
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
            <td nowrap width="16%" height="23"><div align="right">Teller Bank :</div></td>
            <td nowrap height="23" colspan="3">
              <input type="text" name="E01TLMBNK" size="3" maxlength="2" value="<%= brnDetails.getE01TLMBNK().trim()%>" >
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%" height="23"><div align="right">Teller Branch :</div></td>
            <td nowrap height="23" colspan="3">
              <input type="text" name="E01TLMBRN" size="4" maxlength="3" value="<%= brnDetails.getE01TLMBRN().trim()%>">
              <a href="javascript:GetBranch('E01TLMBRN',document.forms[0].E01TLMBNK.value)">
              <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"  ></a>

            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="16%" height="23"><div align="right" id="LABEL1">Teller Maximum Cash Allowed :</div></td>
            <td nowrap height="23" colspan="3">
              <input type="text" name="E01TLMMXC" size="16" maxlength="15" value="<%= brnDetails.getE01TLMMXC().trim()%>" style="text-align: right;">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%" height="23"><div align="right">Cash Amount to Open Teller with :</div></td>
            <td nowrap height="23" colspan="3">
              <input type="text" name="E01TLMTOP" size="16" maxlength="15" value="<%= brnDetails.getE01TLMTOP().trim()%>" style="text-align: right;">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="16%" height="23"><div align="right" id="LABEL2">Teller Cash Withdrawal Limit :</div></td>
            <td nowrap height="23" colspan="3">
              <input type="text" name="E01TLMFLW" size="16" maxlength="15" value="<%= brnDetails.getE01TLMFLW().trim()%>" style="text-align: right;">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%" height="23"><div align="right" id="LABEL3">Teller Cash Deposit Limit :</div></td>
            <td nowrap height="23" colspan="3">
              <input type="text" name="E01TLMFLD" size="16" maxlength="15" value="<%= brnDetails.getE01TLMFLD().trim()%>" style="text-align: right;">
            </td>
          </tr>
        </table>
        <div id="ADDITIONAL" style="visibility:visible">
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
	          <tr id="trclear">
	            <td nowrap width="16%" height="23"><div align="right">Teller General Ledger :</div></td>
	            <td nowrap height="23" colspan="3">
	              <input type="text" name="E01TLMGLN" size="16" maxlength="15" value="<%= brnDetails.getE01TLMGLN().trim()%>">
	              <a href="javascript:GetLedger('E01TLMGLN',document.forms[0].E01TLMBNK.value,document.forms[0].E01TLMCCY.value,'')">
	              <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a>
	            </td>
	          </tr>
	          <tr id="trdark">
	            <td nowrap width="16%" height="23"><div align="right">Check ON-US G/L Num (No Holds) :</div></td>
	            <td nowrap height="23" width="10%">
	              <input type="text" name="E01TLMONG" size="16" maxlength="15" value="<%= brnDetails.getE01TLMONG().trim()%>">
	              <a href="javascript:GetLedger('E01TLMONG',document.forms[0].E01TLMBNK.value,document.forms[0].E01TLMCCY.value,'')">
	              <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a>
	            </td>
	            <td nowrap width="40%" height="23"><div align="left">Days</div></td>
	          </tr>
	          <tr id="trclear">
	            <td nowrap width="16%" height="23"><div align="right">Check ON-US G/L Num (With Holds) :</div></td>
	            <td nowrap height="23" width="10%">
	              <input type="text" name="E01TLMOHG" size="16" maxlength="15" value="<%= brnDetails.getE01TLMOHG().trim()%>">
	              <a href="javascript:GetLedger('E01TLMOHG',document.forms[0].E01TLMBNK.value,document.forms[0].E01TLMCCY.value,'')">
	              <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a>
	            </td>
	            <td nowrap align="left" width="40%"><input type="text" name="E01TLMOHD" size="3" maxlength="2" value="<%= brnDetails.getE01TLMOHD().trim()%>"></td>
	          </tr>
	          <tr id="trdark">
	            <td nowrap width="16%" height="23"><div align="right">Local Checks General Ledger :</div></td>
	            <td nowrap height="23" width="10%">
	              <input type="text" name="E01TLMLOG" size="16"	maxlength="15" value="<%= brnDetails.getE01TLMLOG().trim()%>">
	              <a href="javascript:GetLedger('E01TLMLOG',document.forms[0].E01TLMBNK.value,document.forms[0].E01TLMCCY.value,'')">
	              <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a>
	            </td>
	            <td nowrap align="left" width="40%"><input type="text" name="E01TLMLOD" size="3" maxlength="2" value="<%= brnDetails.getE01TLMLOD().trim()%>"></td>
	          </tr>
	          <tr id="trclear">
	            <td nowrap width="16%" height="23"><div align="right">Non Local Checks General Ledger :</div></td>
	            <td nowrap height="23" width="10%">
	              <input type="text" name="E01TLMNLG" size="16"	maxlength="15" value="<%= brnDetails.getE01TLMNLG().trim()%>">
	              <a href="javascript:GetLedger('E01TLMNLG',document.forms[0].E01TLMBNK.value,document.forms[0].E01TLMCCY.value,'')">
	              <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a>
	            </td>
	            <td nowrap align="left" width="40%"><input type="text" name="E01TLMNLD" size="3" maxlength="2" value="<%= brnDetails.getE01TLMNLD().trim()%>"></td>
	          </tr>
	          <tr id="trdark">
	            <td nowrap width="16%" height="23"><div align="right">Teller Batch Number :</div></td>
	            <td nowrap height="23" colspan="3">
	              <input type="text" name="E01TLMBTH" size="5" maxlength="4" value="<%= brnDetails.getE01TLMBTH().trim()%>">
	            </td>
	          </tr>
	          <tr id="trclear">
	            <td nowrap width="16%" height="23"><div align="right">Teller Cost Center Number :</div></td>
	            <td nowrap height="23" colspan="3">
	              <input type="text" name="E01TLMCST" size="7" maxlength="6" value="<%= brnDetails.getE01TLMCST().trim()%>">
	              <a href="javascript:GetCostCenter('E01TLMCST',document.forms[0].E01TLMBNK.value)">
	              <img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
	            </td>
	          </tr>
        </table>
        </div>
      </td>
    </tr>
  </table>
  </div>

  <br>
  <div align="center"><input id="EIBSBTN" type=submit name="Submit" value="Submit"></div>

</form>
<script language="JavaScript">
	update(document.getElementById("TYPE").value); 
</SCRIPT>
</body>
</html>
