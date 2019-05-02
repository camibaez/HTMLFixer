<html>
<head>
<title>Overdraft Information</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="rtOverdraft" class="datapro.eibs.beans.EDD000003Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos" scope="session" />

<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

<%
if ( userPO.getOption().equals("RT") ) {
%>
	builtNewMenu(rt_m_opt);
<%   
}
else if ( userPO.getOption().equals("SV") ) {
%>
	builtNewMenu(sv_m_opt);
<%   
}
%>

 builtHPopUp();

  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }

</SCRIPT>

<% 
    if ( !error.getERRNUM().equals("0")  ) {
  		error.setERRNUM("0");
      out.println("<SCRIPT Language=\"Javascript\">");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    out.println("<SCRIPT> initMenu();  </SCRIPT>");
%>


<H3 align="center">Overdraft Information<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="rt_overdraft, EDD0000"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="6">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E03ACMCUN" size="9" maxlength="9" readonly value="<%= rtOverdraft.getE03ACMCUN().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E03CUSNA1" size="45" readonly maxlength="45" value="<%= rtOverdraft.getE03CUSNA1().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account : </b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E03ACMACC" readonly size="12" maxlength="9" value="<%= rtOverdraft.getE03ACMACC().trim()%>">
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency :</b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E03ACMPRO" size="4" readonly maxlength="4" value="<%= rtOverdraft.getE03ACMPRO().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Overdraft Information</h4>  
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="17%"> 
              <div align="right">Overdraft Charges :</div>
            </td>
            <td nowrap width="30%"> 
              <select name="E03ACMODF">
                <option value=" " <% if (!(rtOverdraft.getE03ACMODF().equals("N") ||rtOverdraft.getE03ACMODF().equals("Y")
				||rtOverdraft.getE03ACMODF().equals("1") ||rtOverdraft.getE03ACMODF().equals("2"))) out.print("selected"); %>></option>               
                <option value="Y" <% if (rtOverdraft.getE03ACMODF().equals("Y")) out.print("selected"); %>>Charges</option>
                <option value="N" <% if (rtOverdraft.getE03ACMODF().equals("N")) out.print("selected"); %>>No Charges</option>
                <option value="A" <% if (rtOverdraft.getE03ACMODF().equals("A")) out.print("selected"); %>>Daily Charges</option>
                <option value="D" <% if (rtOverdraft.getE03ACMODF().equals("D")) out.print("selected"); %>>Deferred Charges to Another Account</option>               
              </select>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%"> 
              <div align="right">Balance Used Overdraft :</div>
            </td>
            <td nowrap width="30%"> 
              <select name="E03ACMONG">
                <option value=" " <% if (!(rtOverdraft.getE03ACMONG().equals("G") ||rtOverdraft.getE03ACMONG().equals("N")
				||rtOverdraft.getE03ACMONG().equals("C"))) out.print("selected"); %>></option>
                <option value="G" <% if (rtOverdraft.getE03ACMONG().equals("G")) out.print("selected"); %>>Book 
                Balance</option>
                <option value="N" <% if (rtOverdraft.getE03ACMONG().equals("N")) out.print("selected"); %>>Net 
                Balance</option>
                <option value="C" <% if (rtOverdraft.getE03ACMONG().equals("C")) out.print("selected"); %>>Controlled</option>
              </select>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%"> 
              <div align="right">Overdraft Balance Limit 1 :</div>
            </td>
            <td nowrap width="30%"> 
              <input type="text" name="E03ACMOL1" maxlength="11" size="11" value="<%= rtOverdraft.getE03ACMOL1().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" height="23"> 
              <div align="right">Overdraft Interest Rate 1 :</div>
            </td>
            <td nowrap width="30%" height="23"> 
              <input type="text" name="E03ACMOI1" size="5" maxlength="5" value="<%= rtOverdraft.getE03ACMOI1().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" height="19"> 
              <div align="right">Overdraft Balance Limit 2 :</div>
            </td>
            <td nowrap width="30%" height="19"> 
              <input type="text" name="E03ACMOL2" maxlength="11" size="11" value="<%= rtOverdraft.getE03ACMOL2().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" height="19"> 
              <div align="right">Overdraft Interest Rate 2 :</div>
            </td>
            <td nowrap width="30%" height="19"> 
              <input type="text" name="E03ACMOI2" size="5" maxlength="5" value="<%= rtOverdraft.getE03ACMOI2().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" height="19"> 
              <div align="right">Related General Ledger Account :</div>
            </td>
            <td nowrap width="30%" height="19">
              <input type="text" name="E03ACMRBK" size="2" maxlength="2" value="<%= rtOverdraft.getE03ACMRBK().trim()%>" >
              <input type="text" name="E03ACMRBR" size="3" maxlength="3" value="<%= rtOverdraft.getE03ACMRBR().trim()%>" 
			   oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E03ACMRBK.value,'','','','')">
              <input type="text" name="E03ACMRCY" size="3" maxlength="3" value="<%= rtOverdraft.getE03ACMRCY().trim()%>" 
			  oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E03ACMRBK.value,'','','','')">
              <input type="text" name="E03ACMRGL" size="16" maxlength="16" value="<%= rtOverdraft.getE03ACMRGL().trim()%>" 
			  oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E03ACMRBK.value,document.forms[0].E01ORDHCY.value,'','','')" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" height="19"> 
              <div align="right">Related Retail Account :</div>
            </td>
            <td nowrap width="30%" height="19">
              <input type="text" name="E03ACMRAC" size="12" maxlength="12" value="<%= rtOverdraft.getE03ACMRAC().trim()%>" 
			   oncontextmenu="showPopUp(accountHelp,this.name,'','','','','RT')">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" height="19"> 
              <div align="right">Related Loan Product Code :</div>
            </td>
            <td nowrap width="30%" height="19">
              <input type="text" name="E03LNSPRD" size="2" maxlength="1" value="<%= rtOverdraft.getE03LNSPRD().trim()%>" >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<br>
 <div align="center"> 
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>  </form>
</body>
</html>
