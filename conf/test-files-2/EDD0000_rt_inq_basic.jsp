<html>
<head>
<title>Retail Account Inquiry</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="rtBasic" class="datapro.eibs.beans.EDD009002Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<body>

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
<% 
 if ( !error.getERRNUM().equals("0")  ) {
	 error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
   out.println("<SCRIPT> initMenu();  </SCRIPT>");
%> 
<H3 align="center">Basic Information<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="rt_inq_basic, EDD0000"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="29">
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
  <br>
  <% if (!rtBasic.getE02DSCAST().equals("") || rtBasic.getE02ACMF07().equals("1") || rtBasic.getE02ACMF07().equals("2") || rtBasic.getE02ACMF07().equals("3")) { %>
   <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right"><b>Status :</b></div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"> 
                <b><font color="#ff6600"><%= rtBasic.getE02DSCAST().trim()%></font></b>
              </div>
            </td>
            <td nowrap width="25%" > 
              <div align="right"> </div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"> 
 				<b><font color="#ff6600">
		   		<% if (rtBasic.getE02ACMF07().equals("1")) out.print("Hold");
		   		   else if (rtBasic.getE02ACMF07().equals("2")) out.print("Stop Payment"); 
		   		   else if (rtBasic.getE02ACMF07().equals("3")) out.print("Hold/Stop Payment");
		   		%>
		   		</font></b>               
		      </div>
            </td>
        </table>
      </td>
    </tr>
  </table> 
  <%}%>
  <h4>Basic Operation Information</h4> 
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="29%"> 
              <div align="right">Bank/Branch :</div>
            </td>
            <td nowrap width="22%"> 
              <input type="text" name="E02ACMBNK" size="4" maxlength="2" value="<%= rtBasic.getE02ACMBNK().trim()%>" readonly>
              <input type="text" name="E02ACMCBRN" size="5" maxlength="3" value="<%= rtBasic.getE02ACMBRN().trim()%>" readonly>
            </td>
            <td nowrap width="23%"> 
              <div align="right">Currency/Account :</div>
            </td>
            <td nowrap width="26%"> 
              <input type="text" name="E02ACMCCCY" size="5" maxlength="3" value="<%= rtBasic.getE02ACMCCY().trim()%>" readonly>
              <input type="text" name="E02ACMCGLN" size="18" maxlength="12" value="<%= rtBasic.getE02ACMGLN().trim()%>" readonly>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%"> 
              <div align="right">Opening Date :</div>
            </td>
            <td nowrap width="22%"> 
              <input type="text" name="E02OPNDT1" size="2" maxlength="2" value="<%= rtBasic.getE02OPNDT1().trim()%>" readonly>
              <input type="text" name="E02OPNDT2" size="2" maxlength="2" value="<%= rtBasic.getE02OPNDT2().trim()%>" readonly>
              <input type="text" name="E02OPNDT3" size="2" maxlength="2" value="<%= rtBasic.getE02OPNDT3().trim()%>" readonly>
            </td>
            <td nowrap width="23%"> 
              <div align="right">Referral Code :</div>
            </td>
            <td nowrap width="26%"> 
              <input type="text" name="E02ACMRCD" readonly value="<% if(rtBasic.getE02ACMRCD().equals("D")) out.print("Debit Reference");
              				else if(rtBasic.getE02ACMRCD().equals("C")) out.print("Credit Reference");
							else out.print("Both References");%>" size="25">
          </tr>
          <tr id="trdark"> 
            <td nowrap width="29%"> 
              <div align="right">Taxes Withholding :</div>
            </td>
            <td nowrap width="22%"> 
              <input type="text" name="E02ACMWHF" size="2" maxlength="1" value="<%= rtBasic.getE02ACMWHF().trim()%>" readonly>
            </td>
            <td nowrap width="23%"> 
              <div align="right">Payable Through :</div>
            </td>
            <td nowrap width="26%"> 
              <input type="text" name="E02ACMPTF" size="2" value="<% if(rtBasic.getE02ACMPTF().equals("Y")) out.print("Yes");
              				else if(rtBasic.getE02ACMPTF().equals("N")) out.print("No");
							else out.print("");%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%" height="23"> 
              <div align="right">Mailing Address Code :</div>
            </td>
            <td nowrap width="22%" height="23"> 
              <input type="text" name="E02ACMMLA" size="2" maxlength="1" value="<%= rtBasic.getE02ACMMLA().trim()%>" readonly>
            </td>
            <td nowrap width="23%" height="23"> 
              <div align="right">Cost Center :</div>
            </td>
            <td nowrap width="26%" height="23"> 
              <input type="text" name="E02ACMCCN" size="8" maxlength="6" value="<%= rtBasic.getE02ACMCCN().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="29%" height="19"> 
              <div align="right">Special Local Float :</div>
            </td>
            <td nowrap width="22%" height="19"> 
              <input type="text" size="2" maxlength="1" value="<%= rtBasic.getE02ACMWLF().trim()%>" name="E02ACMWLF" readonly>
            </td>
            <td nowrap width="23%" height="19"> 
              <div align="right">Special Unlocal Float :</div>
            </td>
            <td nowrap width="26%" height="19"> 
              <input type="text" size="2" maxlength="1" value="<%= rtBasic.getE02ACMWNF().trim()%>" name="E02ACMWNF" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%" height="19"> 
              <div align="right">Type of Signature :</div>
            </td>
            <td nowrap width="22%" height="19">
              <input type="text" name="E02ACMPEC" readonly value="<% if(rtBasic.getE02ACMPEC().equals("1")) out.print("Individual");
              				else if(rtBasic.getE02ACMPEC().equals("2")) out.print("Joined");
							else out.print("");%>" size="25">
            </td>
            <td nowrap width="23%" height="19"> 
              <div align="right"></div>
            </td>
            <td nowrap width="26%" height="19"> 
              <input type="hidden" name="E02ACMSL1" size="3" maxlength="3" value="<%= rtBasic.getE02ACMSL1().trim()%>" readonly>
              <input type="hidden" name="E02ACMSL2" size="2" maxlength="2" value="<%= rtBasic.getE02ACMSL2().trim()%>" readonly>
              <input type="hidden" name="E02ACMSL3" size="2" maxlength="2" value="<%= rtBasic.getE02ACMSL3().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="29%" height="19">
              <div align="right">ATM Card :</div>
            </td>
            <td nowrap width="22%" height="19">
              <input type="text" name="E02ACMATM" size="8" maxlength="8" value="<%= rtBasic.getE02ACMATM().trim()%>" readonly>
            </td>
            <td nowrap width="23%" height="19">
              <div align="right">Inquiry Level (0-9) :</div>
            </td>
            <td nowrap width="26%" height="19">
				<input type="text" size="2" maxlength="1" readonly value="<%= rtBasic.getE02ACMF043().trim()%>" name="E02ACMF043">
			</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%" height="19"> 
              <div align="right">Direct Deposit :</div>
            </td>
            <td nowrap width="22%" height="19">
              <input type="radio" name="E02ACMF042" disabled value="Y" <%if(rtBasic.getE02ACMF042().equals("Y")) out.print("checked");%>>Yes 
              <input type="radio" name="E02ACMF042" disabled value="N" <%if(rtBasic.getE02ACMF042().equals("N")) out.print("checked");%>>No
            </td>
            <td nowrap width="23%" height="19"> 
              <div align="right"></div>
            </td>
            <td nowrap width="26%" height="19"> 
				
            </td>
          </tr>    
        </table>
      </td>
    </tr>
  </table>
  <H4></H4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="29%" height="19"> 
              <div align="right">Purpose of Account :</div>
            </td>
            <td nowrap height="19" colspan="3"> 
              <input type="text" size="41" maxlength="40" value="<%= rtBasic.getE02ACMPA1().trim()%>" name="E02ACMPA1">
            </td>
          </tr>  
          <tr id="trclear">
            <td nowrap width="29%" height="19"> 
              <div align="right"></div>
            </td>
            <td nowrap width="71%" height="19" colspan="3"> 
              <input type="text" size="41" maxlength="40" value="<%= rtBasic.getE02ACMPA2().trim()%>" name="E02ACMPA2">
            </td>
          </tr>                    
        </table>
      </td>
    </tr>
  </table>    
  <H4>Service Charges Information</H4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Service Charges :</div>
            </td>
            <td nowrap width="21%"> 
              <input type="text" name="E02ACMSCF" size="60" value="
              			<% if(rtBasic.getE02ACMSCF().equals("Y")) out.print("Charge all Service Fees");
              				else if(rtBasic.getE02ACMSCF().equals("N")) out.print("Waive all Service Fees");
              				else if(rtBasic.getE02ACMSCF().equals("1")) out.print("Waive Admin Fees (MMK) Minimum Balance Fees (DDA,SAV,NOW)");
              				else if(rtBasic.getE02ACMSCF().equals("2")) out.print("Waive Excess Check Fees on MMK");
              				else if(rtBasic.getE02ACMSCF().equals("3")) out.print("Waive Inactive/Dormant Fees");
              				else if(rtBasic.getE02ACMSCF().equals("4")) out.print("Waive Annual Service Fees");
              				else if(rtBasic.getE02ACMSCF().equals("5")) out.print("Waive Deposit Check Fees on DDA");
              				else if(rtBasic.getE02ACMSCF().equals("6")) out.print("Waive Fees for Use of Uncollected Funds");
              				else if(rtBasic.getE02ACMSCF().equals("7")) out.print("Apply ONLY Use of Uncollected Funds");
              				else if(rtBasic.getE02ACMSCF().equals("8")) out.print("Waive Stop Payments Fees");
              				else if(rtBasic.getE02ACMSCF().equals("9")) out.print("Waive ATM Fees");
              				else if(rtBasic.getE02ACMSCF().equals("0")) out.print("Waive ATM and Use of Uncollected Fees");
							else out.print("");%>" readonly>
            </td>
            <td nowrap width="25%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="24%"> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">Services Charges Table :</div>
            </td>
            <td nowrap width="21%"> 
              <input type="text" name="E02DSCACL" size="35" maxlength="35" value="<%= rtBasic.getE02DSCACL().trim()%>" readonly>
            </td>
            <td nowrap width="25%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="24%"> 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <H4>Account Statement Information</H4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Account Statement Frequency :</div>
            </td>
            <td nowrap width="18%"> 
              <input type="text" name="E02ACMSTF" readonly value="<% if(rtBasic.getE02ACMSTF().equals("D")) out.print("Daily");
              				else if(rtBasic.getE02ACMSTF().equals("W")) out.print("Weekly");
							else if(rtBasic.getE02ACMSTF().equals("B")) out.print("Bi-Weekly");
							else if(rtBasic.getE02ACMSTF().equals("M")) out.print("Monthly");
							else if(rtBasic.getE02ACMSTF().equals("Q")) out.print("Quarterly");%>" size="15">
            </td>
            <td nowrap width="28%"> 
              <div align="right">Hold Mail :</div>
            </td>
            <td nowrap width="24%"> 
              <input type="text" name="E02ACMHSF" size="2" value="<% if(rtBasic.getE02ACMHSF().equals("H")) out.print("Yes");
              				else if(rtBasic.getE02ACMHSF().equals("")) out.print("No");
							else out.print("");%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">Account Statement Print Day :</div>
            </td>
            <td nowrap width="18%"> 
              <input type="text" name="E02ACMSDY" size="3" maxlength="2" value="<%= rtBasic.getE02ACMSDY().trim()%>" readonly>
            </td>
            <td nowrap width="28%"> 
              <div align="right">Consolidated Account Statement :</div>
            </td>
            <td nowrap width="24%"> 
              <input type="text" name="E02ACMSCF" size="2" value="<% if(rtBasic.getE02ACMSCF().equals("Y")) out.print("Yes");
              				else if(rtBasic.getE02ACMSCF().equals("N")) out.print("No");
							else out.print("");%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%" height="23"> 
              <div align="right">Account Statement Type :</div>
            </td>
            <td nowrap width="18%" height="23"> 
              <input type="text" name="E02ACMSTY" readonly value="<% if(rtBasic.getE02ACMSTY().equals("P")) out.print("Personal");
              				else if(rtBasic.getE02ACMSTY().equals("C")) out.print("Corporate");
							else if(rtBasic.getE02ACMSTY().equals("N")) out.print("None");%>" size="15">
            </td>
            <td nowrap width="28%" height="23"> 
              <div align="right">Daily Statement Via :</div>
            </td>
            <td nowrap width="24%" height="23"> 
              <input type="text" name="E02ACMSTE" readonly value="<% if(rtBasic.getE02ACMSTE().equals("T")) out.print("Telex");
              				else if(rtBasic.getE02ACMSTE().equals("P")) out.print("Printer");
							else if(rtBasic.getE02ACMSTE().equals("F")) out.print("Fax");
							else if(rtBasic.getE02ACMSTE().equals("E")) out.print("Email");
							else if(rtBasic.getE02ACMSTE().equals("1")) out.print("Swift 940");
							else if(rtBasic.getE02ACMSTE().equals("2")) out.print("Swift 950");
							else if(rtBasic.getE02ACMSTE().equals("N")) out.print("None");%>" size="15">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%" height="23"> 
              <div align="right">Include Images with Statement :</div>
            </td>
            <td nowrap width="18%" height="23"> 
              <input type="text" name="E02ACMF04" readonly value="<% if(rtBasic.getE02ACMF04().equals("1")) out.print("Send copies and charge");
              				else if(rtBasic.getE02ACMF04().equals("2")) out.print("Send copies and waive charges");
							else if(rtBasic.getE02ACMF04().equals("3")) out.print("Do not send copies");%>" size="30">
            </td>
            <td nowrap width="28%" height="23"> 
              <div align="right"></div>
            </td>
            <td nowrap width="24%" height="23"> 
            </td>
          </tr>          
        </table>
      </td>
    </tr>
  </table>
  <H4>Change Account Status</H4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="23%"> 
              <div align="right">Account Status :</div>
            </td>
            <td nowrap width="23%"> 
              <input type="text" name="E02ACMAST" readonly value="<% if(rtBasic.getE02ACMAST().equals("A")) out.print("Active Account");
              				else if(rtBasic.getE02ACMAST().equals("C")) out.print("Cancelled");
							else if(rtBasic.getE02ACMAST().equals("I")) out.print("Inactive 1");
							else if(rtBasic.getE02ACMAST().equals("D")) out.print("Inactive 2");
							else if(rtBasic.getE02ACMAST().equals("O")) out.print("Controlled");
							else if(rtBasic.getE02ACMAST().equals("E")) out.print("Consigned");
							else if(rtBasic.getE02ACMAST().equals("T")) out.print("Deposit Only");
							else out.print("");%>" size="25">
            </td>
            <td nowrap width="22%"> 
              <div align="right">Change by (Officer) :</div>
            </td>
            <td nowrap width="32%"> 
              <input type="text" name="E02ACMUIN" size="5" maxlength="4" value="<%= rtBasic.getE02ACMUIN().trim()%>" readonly>
              <input type="text" name="E02DSCUIN" size="25" value="<%= rtBasic.getE02DSCUIN().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="23%"> 
              <div align="right">Date Change :</div>
            </td>
            <td nowrap width="23%">
              <input type="text" name="E02LSCST1" size="2" maxlength="2" value="<%= rtBasic.getE02LSCST1().trim()%>" readonly>
              <input type="text" name="E02LSCST2" size="2" maxlength="2" value="<%= rtBasic.getE02LSCST2().trim()%>" readonly>
              <input type="text" name="E02LSCST3" size="2" maxlength="2" value="<%= rtBasic.getE02LSCST3().trim()%>" readonly>
            </td>
            <td nowrap width="22%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="32%">&nbsp; </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Line and Credit Limit</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="29%"> 
              <div align="right">Customer of the line :</div>
            </td>
            <td nowrap width="16%"> 
              <input type="text" name="E02ACMCMC" maxlength="9" size="9" value="<%= rtBasic.getE02ACMCMC().trim()%>" readonly>
            </td>
            <td nowrap width="27%"> 
              <div align="right">Line of Credit :</div>
            </td>
            <td nowrap width="28%">
              <input type="text" name="E02ACMCMN" maxlength="4" size="4" value="<%= rtBasic.getE02ACMCMN().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%"> 
              <div align="right">Credit Limit Amount :</div>
            </td>
            <td nowrap width="16%"> 
              <input type="text" name="E02ACMCLI" size="11" maxlength="11" value="<%= rtBasic.getE02ACMCLI().trim()%>" readonly>
            </td>
            <td nowrap width="27%"> 
              <div align="right">Credit Limit Revision Date :</div>
            </td>
            <td nowrap width="28%"> 
              <input type="text" maxlength="2" size="2" name="E02ODLRD1" value="<%= rtBasic.getE02ODLRD1().trim()%>" readonly>
              <input type="text" maxlength="2" size="2" name="E02ODLRD2" value="<%= rtBasic.getE02ODLRD2().trim()%>" readonly>
              <input type="text" maxlength="2" size="2" name="E02ODLRD3" value="<%= rtBasic.getE02ODLRD3().trim()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Overdraft Limits</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="29%" height="33"> 
              <div align="right">Overdraft Charges :</div>
            </td>
            <td nowrap width="16%" height="33"> 
              <input type="text" name="E02ACMODF" readonly value="<% if(rtBasic.getE02ACMODF().equals("N")) out.print("No Charges");
              				else if(rtBasic.getE02ACMODF().equals("Y")) out.print("Charges");
							else if(rtBasic.getE02ACMODF().equals("A")) out.print("Daily Charges");
							else out.print("");%>" size="25">
            </td>
            <td nowrap width="27%" height="33"> 
              <div align="right">Balance Used Overdraft :</div>
            </td>
            <td nowrap width="28%" height="33"> 
              <input type="text" name="E02ACMONG" readonly value="<% if(rtBasic.getE02ACMONG().equals("G")) out.print("Book Balance");
              				else if(rtBasic.getE02ACMONG().equals("N")) out.print("Net Balance");
							else if(rtBasic.getE02ACMONG().equals("C")) out.print("Controlled");
							else out.print("");%>" size="25">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%"> 
              <div align="right">Overdraft Balance Limit 1 :</div>
            </td>
            <td nowrap width="16%"> 
              <input type="text" name="E02ACMOL1" maxlength="11" size="11" value="<%= rtBasic.getE02ACMOL1().trim()%>" readonly>
            </td>
            <td nowrap width="27%"> 
              <div align="right">Overdraft Interest Rate 1 :</div>
            </td>
            <td nowrap width="28%"> 
              <input type="text" name="E02ACMOI1" size="5" maxlength="5" value="<%= rtBasic.getE02ACMOI1().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="29%"> 
              <div align="right">Overdraft Balance Limit 2 :</div>
            </td>
            <td nowrap width="16%"> 
              <input type="text" name="E02ACMOL2" maxlength="11" size="11" value="<%= rtBasic.getE02ACMOL2().trim()%>" readonly>
            </td>
            <td nowrap width="27%"> 
              <div align="right">Overdraft Interest Rate 2 :</div>
            </td>
            <td nowrap width="28%"> 
              <input type="text" name="E02ACMOI2" size="5" maxlength="5" value="<%= rtBasic.getE02ACMOI2().trim()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  </form>
</body>
</html>
