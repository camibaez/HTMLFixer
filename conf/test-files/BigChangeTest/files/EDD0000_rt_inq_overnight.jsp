<html>
<head>
<title>Overnight Concentration</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="rtOvernight" class="datapro.eibs.beans.EDD009002Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

<%
if ( userPO.getOption().equals("RT") ) {
%>
	builtNewMenu(rt_i_opt);
<%   
}
else if ( userPO.getOption().equals("SV") ) {
%>
	builtNewMenu(sv_i_opt);
<%   
}
%>

</SCRIPT>

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
<SCRIPT> initMenu();  </SCRIPT>


<H3 align="center">Overnight Concentration<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="rt_inq_overnight, EDD0000"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="46">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="14%" > 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="9%" > 
              <div align="left"> 
                <input type="text" name="E02CUN2" size="9" maxlength="9" readonly value="<%= userPO.getHeader2().trim()%>">
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E02NA12" size="45" maxlength="45" readonly value="<%= userPO.getHeader3().trim()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap ><b> 
              <input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getHeader1().trim()%>">
              </b></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="14%"> 
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> 
                <input type="text" name="E02ACC" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%"> 
              <div align="right">Officer :</div>
            </td>
            <td nowrap width="33%"> 
              <div align="left"><b> 
                <input type="text" name="E02NA122" size="30" maxlength="30" readonly value="<%= userPO.getOfficer().trim()%>">
                </b> </div>
            </td>
            <td nowrap width="11%"> 
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="21%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Overnight Concentration</h4>  
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="17%"> 
              <div align="right">Operation Type :</div>
            </td>
            <td nowrap width="30%"> 
                  <input type="text" readonly  name="E02ACMITY" size="35" maxlength="35" 
				  value="<% if (rtOvernight.getE02ACMITY().equals("B")) out.print("Transfer &amp; O/D Protection");
							else if (rtOvernight.getE02ACMITY().equals("C")) out.print("Transfer the Excess of Fund");
							else if (rtOvernight.getE02ACMITY().equals("D")) out.print("Overdraft Protection if any");
							else if (rtOvernight.getE02ACMITY().equals("R")) out.print("Regular Overnight Investment");
							else if (rtOvernight.getE02ACMITY().equals("N")) out.print("None");
							else out.print("");%>" 
				>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%"> 
              <div align="right">Minimum Balance Required :</div>
            </td>
            <td nowrap width="30%">
              <input type="text" readonly name="E02ACMIVL" maxlength="11" size="11" value="<%= rtOvernight.getE02ACMIVL().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%"> 
              <div align="right">Investment Multiple :</div>
            </td>
            <td nowrap width="30%"> 
              <input type="text" readonly name="E02ACMIFM" maxlength="11" size="11" value="<%= rtOvernight.getE02ACMIFM().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" height="23"> 
              <div align="right">Investment Rate Table :</div>
            </td>
            <td nowrap width="30%" height="23"> 
              <input type="text" name="E02ACMRTB" size="5" maxlength="5" value="<%= rtOvernight.getE02ACMRTB().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" height="19"> 
              <div align="right">Investment Spread Rate :</div>
            </td>
            <td nowrap width="30%" height="19"> 
              <input type="text"  readonly name="E02ACMOIS" maxlength="11" size="11" value="<%= rtOvernight.getE02ACMOIS().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="17%" height="19">
              <div align="right">Investment Retail Account :</div>
            </td>
            <td nowrap width="30%" height="19"> 
              <input type="text" readonly name="E02ACMRAC" size="12" maxlength="12" value="<%= rtOvernight.getE02ACMRAC().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" height="19"> 
              <div align="right">Investment G/L Account (Branch &amp; G/L) :</div>
            </td>
            <td nowrap width="30%" height="19"> 
              <input type="text" readonly name="E02ACMRBR" size="3" maxlength="3" value="<%= rtOvernight.getE02ACMRBR().trim()%>">
              <input type="text"  readonly name="E02ACMRGL" size="16" maxlength="16" value="<%= rtOvernight.getE02ACMRGL().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<BR>
  </form>
</body>
</html>
