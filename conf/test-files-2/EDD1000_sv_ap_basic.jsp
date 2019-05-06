<html>
<head>
<title>Approval Saving Account</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="svBasic" class="datapro.eibs.beans.EDD000001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   builtNewMenu(sv_a_opt);

 
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
<H3 align="center"> Approve Saving Account<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="sv_ap_basic, EDD1000"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="30">
  <INPUT TYPE=HIDDEN NAME="SCGACMBNK" VALUE="<%= svBasic.getE01ACMBNK().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01ACMATY" VALUE="<%= svBasic.getE01ACMATY().trim()%>">
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
                <input type="text" name="E01ACMCUN" size="9" maxlength="9" value="<%= svBasic.getE01ACMCUN().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E01CUSNA1" size="45" maxlength="45" value="<%= svBasic.getE01CUSNA1().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E01ACMACC" size="12" maxlength="12" value="<%= svBasic.getE01ACMACC().trim()%>">
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency : </b></div>
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
                <input type="text" name="E01ACMPRO" size="4" maxlength="4" value="<%= svBasic.getE01ACMPRO().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <H4>Basic Information</H4>
<table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="29%"> 
              <div align="right">Opening Date:</div>
            </td>
            <td nowrap width="19%"> 
              <input type="text" readonly <% if (svBasic.getF01ACMOP1().equals("Y")) out.print("id=\"txtchanged\""); %>  name="E01ACMOP1" size="2" maxlength="2" value="<%= svBasic.getE01ACMOP1().trim()%>">
              <input type="text" readonly <% if (svBasic.getF01ACMOP2().equals("Y")) out.print("id=\"txtchanged\""); %>  name="E01ACMOP2" size="2" maxlength="2" value="<%= svBasic.getE01ACMOP2().trim()%>">
              <input type="text" readonly <% if (svBasic.getF01ACMOP3().equals("Y")) out.print("id=\"txtchanged\""); %>  name="E01ACMOP3" size="2" maxlength="2" value="<%= svBasic.getE01ACMOP3().trim()%>">
            </td>
            <td nowrap width="26%"> 
              <div align="right">Referral Codes:</div>
            </td>
            <td nowrap width="26%"> 
              <input type="text" readonly <% if (svBasic.getF01ACMRCD().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01ACMRCD" size="25" maxlength="30" 
				  value="<% if (svBasic.getE01ACMRCD().equals("D")) out.print("Debits Reference");
							else if (svBasic.getE01ACMRCD().equals("C")) out.print("Credits Reference");
							else if (svBasic.getE01ACMRCD().equals("A")) out.print("Both Reference");
						    else out.print("");%>" 
				>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%"> 
              <div align="right">Withholding Deductions:</div>
            </td>
            <td nowrap width="19%"> 
              <input type="text" readonly <% if (svBasic.getF01ACMWHF().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01ACMWHF" size="2" maxlength="1" value="<%= svBasic.getE01ACMWHF().trim()%>">
            </td>
            <td nowrap width="26%"> 
              <div align="right">Type of Signature:</div>
            </td>
            <td nowrap width="26%"> 
              <input type="text" readonly <% if (svBasic.getF01ACMPEC().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01ACMPEC" size="20" maxlength="20" 
				  value="<% if (svBasic.getE01ACMPEC().equals("1")) out.print("Individual");
							else if (svBasic.getE01ACMPEC().equals("2")) out.print("Both");
							else if (svBasic.getE01ACMPEC().equals("3")) out.print("Either");
							else if (svBasic.getE01ACMPEC().equals("4")) out.print("Other");
							else out.print("");%>" 
				>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="29%" height="23"> 
              <div align="right">Customer Messages:</div>
            </td>
            <td nowrap width="19%" height="23"> 
              <input type="text" readonly <% if (svBasic.getF01ACMPMF().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01ACMPMF" size="3" maxlength="2" 
				  value="<% if (svBasic.getE01ACMPMF().equals("Y")) out.print("Yes");
							else if (svBasic.getE01ACMPMF().equals("N")) out.print("No");
							else out.print("");%>" 
				>
            </td>
            <td nowrap width="26%" height="23"> 
              <div align="right">Payable Through:</div>
            </td>
            <td nowrap width="26%" height="23"> 
              <input type="text" readonly <% if (svBasic.getF01ACMPTF().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01ACMPTF" size="3" maxlength="2" 
				  value="<% if (svBasic.getE01ACMPTF().equals("Y")) out.print("Yes");
							else if (svBasic.getE01ACMPTF().equals("N")) out.print("No");
							else out.print("");%>" 
				>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%" height="19"> 
              <div align="right">Mailing Address:</div>
            </td>
            <td nowrap width="19%" height="19"> 
              <input type="text" readonly <% if (svBasic.getF01ACMMLA().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01ACMMLA" size="2" maxlength="1" value="<%= svBasic.getE01ACMMLA().trim()%>">
            </td>
            <td nowrap width="26%" height="19"> 
              <div align="right">Required Documents Table:</div>
            </td>
            <td nowrap width="26%" height="19"> 
              <input type="text" size="2" maxlength="1" readonly value="<%= svBasic.getE01ACMMLA().trim()%>" name="text">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="29%" height="19"> 
              <div align="right">Special Local Float:</div>
            </td>
            <td nowrap width="19%" height="19"> 
              <input type="text" readonly <% if (svBasic.getF01ACMWLF().equals("Y")) out.print("id=\"txtchanged\""); %> size="2" maxlength="1" value="<%= svBasic.getE01ACMWLF().trim()%>" name="E01ACMWLF">
            </td>
            <td nowrap width="26%" height="19"> 
              <div align="right">Special Unlocal Float:</div>
            </td>
            <td nowrap width="26%" height="19"> 
              <input type="text" size="2" readonly <% if (svBasic.getF01ACMWNF().equals("Y")) out.print("id=\"txtchanged\""); %> maxlength="1" value="<%= svBasic.getE01ACMWNF().trim()%>" name="E01ACMWNF">
            </td>
          </tr>  
          <tr id="trdark">
            <td nowrap width="29%" height="19">
              <div align="right">Bank/Branch :</div>
            </td>
            <td nowrap colspan=3>            
              <input type="text" name="E01ACMBNK" size="2" maxlength="2" value="<%= svBasic.getE01ACMBNK().trim()%>" readonly>
              <input type="text" name="E01ACMBRN" size="2" maxlength="3" value="<%= svBasic.getE01ACMBRN().trim()%>" readonly>
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
            <td nowrap width="30%"> 
              <div align="right">Ownership of Account :</div>
            </td>
            <td nowrap width="18%"> 
            	<input type="text" size="2" maxlength="1" readonly value="<%= svBasic.getE01ACMCT1().trim()%>" name="E01ACMCT1">
            </td>
            <td nowrap width="28%"> 
              <div align="right">Beneficiary Designation :</div>
            </td>
            <td nowrap width="24%"> 
            	<input type="text" size="2" readonly maxlength="1" value="<%= svBasic.getE01ACMCT2().trim()%>" name="E01ACMCT2">
            </td>
          </tr>
           <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">Purpose of Account :</div>
            </td>
            <td nowrap width="70%" colspan="3"> 
				<input type="text" size="41" maxlength="40" readonly value="<%= svBasic.getE01ACMPA1().trim()%>" name="E01ACMPA1">
            </td>
            </tr>
           <tr id="trclear">
           <td nowrap width="30%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="70%" colspan="3"> 
				<input type="text" size="41" maxlength="40" readonly value="<%= svBasic.getE01ACMPA2().trim()%>" name="E01ACMPA2">
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
            <td nowrap width="18%"> 
              <input type="text" readonly <% if (svBasic.getF01ACMSCF().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01ACMSCF" size="60" maxlength="60" 
				  value="<% if(svBasic.getE01ACMSCF().equals("Y")) out.print("Charge all Service Fees");
              				else if(svBasic.getE01ACMSCF().equals("N")) out.print("Waive all Service Fees");
              				else if(svBasic.getE01ACMSCF().equals("1")) out.print("Waive Admin Fees (MMK) Minimum Balance Fees (DDA,SAV,NOW)");
              				else if(svBasic.getE01ACMSCF().equals("2")) out.print("Waive Excess Check Fees on MMK");
              				else if(svBasic.getE01ACMSCF().equals("3")) out.print("Waive Inactive/Dormant Fees");
              				else if(svBasic.getE01ACMSCF().equals("4")) out.print("Waive Annual Service Fees");
              				else if(svBasic.getE01ACMSCF().equals("5")) out.print("Waive Deposit Check Fees on DDA");
              				else if(svBasic.getE01ACMSCF().equals("6")) out.print("Waive Fees for Use of Uncollected Funds");
              				else if(svBasic.getE01ACMSCF().equals("7")) out.print("Apply ONLY Use of Uncollected Funds");
              				else if(svBasic.getE01ACMSCF().equals("8")) out.print("Waive Stop Payments Fees");
              				else if(svBasic.getE01ACMSCF().equals("9")) out.print("Waive ATM Fees");
              				else if(svBasic.getE01ACMSCF().equals("0")) out.print("Waive ATM and Use of Uncollected Fees");
							else out.print("");%>%>" 
				>
            </td>
            <td nowrap width="28%"> 
              <div align="right">Service Charges Structure :</div>
            </td>
            <td nowrap width="24%"> 
            	<input type="text" readonly <% if (svBasic.getF01ACMACL().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01ACMACL" size="2" maxlength="2" value="<%= svBasic.getE01ACMACL().trim()%>">
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
              <input type="text" readonly <% if (svBasic.getF01ACMSTF().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01ACMSTF" size="25" maxlength="30" 
				  value="<% if (svBasic.getE01ACMSTF().equals("D")) out.print("Daily");
							else if (svBasic.getE01ACMSTF().equals("W")) out.print("Weekly");
							else if (svBasic.getE01ACMSTF().equals("B")) out.print("Biweekly");
							else if (svBasic.getE01ACMSTF().equals("M")) out.print("Monthly");
							else if (svBasic.getE01ACMSTF().equals("Q")) out.print("Quaterly");
						    else out.print("");%>" 
				>
            </td>
            <td nowrap width="28%"> 
              <div align="right">Hold Mail :</div>
            </td>
            <td nowrap width="24%"> 
              <input type="text" readonly <% if (svBasic.getF01ACMHSF().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01ACMHSF" size="3" maxlength="2" 
				  value="<% if (svBasic.getE01ACMHSF().equals("H")) out.print("Yes");
							else if (svBasic.getE01ACMHSF().equals("")) out.print("No");
							else out.print("");%>" 
				>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">Account Statement Day :</div>
            </td>
            <td nowrap width="18%"> 
              <input type="text" readonly <% if (svBasic.getF01ACMSDY().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01ACMSDY" size="3" maxlength="2" value="<%= svBasic.getE01ACMSDY().trim()%>">
            </td>
            <td nowrap width="28%"> 
              <div align="right">Consolidated Account Statement :</div>
            </td>
            <td nowrap width="24%"> 
              <input type="text" readonly <% if (svBasic.getF01ACMCSF().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01ACMCSF" size="3" maxlength="2" 
				  value="<% if (svBasic.getE01ACMCSF().equals("Y")) out.print("Yes");
							else if (svBasic.getE01ACMCSF().equals("N")) out.print("No");
							else out.print("");%>" 
				>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%" height="23"> 
              <div align="right">Account Statement Type :</div>
            </td>
            <td nowrap width="18%" height="23"> 
              <input type="text" readonly <% if (svBasic.getF01ACMSTY().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01ACMSTY" size="25" maxlength="25" 
				  value="<% if (svBasic.getE01ACMSTY().equals("P")) out.print("Personal");
							else if (svBasic.getE01ACMSTY().equals("C")) out.print("Corporative");
							else if (svBasic.getE01ACMSTY().equals("N")) out.print("None");
						    else out.print("");%>" 
				>
            </td>
            <td nowrap width="28%" height="23"> 
              <div align="right">Daily Statement Via :</div>
            </td>
            <td nowrap width="24%" height="23"> 
              <input type="text" readonly <% if (svBasic.getF01ACMSTE().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01ACMSTE" size="25" maxlength="25" 
				  value="<% if (svBasic.getE01ACMSTE().equals("T")) out.print("Telex");
							else if (svBasic.getE01ACMSTE().equals("P")) out.print("Printer");
							else if (svBasic.getE01ACMSTE().equals("F")) out.print("Fax");
							else if (svBasic.getE01ACMSTE().equals("E")) out.print("e-Mail");
							else if (svBasic.getE01ACMSTE().equals("N")) out.print("None");
						    else out.print("");%>" 
				>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <H4>Passbook Information</H4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Passbook Number:</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" size="12" maxlength="12" readonly name="E01ACMPBN" value="<%= svBasic.getE01ACMPBN().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <% if (svBasic.getH01SCRCOD().trim().equals("N")) { %>
  <H4>Initial Deposit</H4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Account :</div>
            </td>
            <td nowrap width="28%"> 
              <input type="text" name="E01AFIDAC" size="12" maxlength="9"  value="<%= svBasic.getE01AFIDAC().trim()%>" readonly >
             </td>
            <td nowrap width="24%">
           <div align="right">Amount :</div>
            <td nowrap width="28%"> 
             <input type="text" name="E01AFIIDA" size="15" maxlength="13"  value="<%= svBasic.getE01AFIIDA().trim()%>" readonly >
            </td>
             
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">Description :</div>
            </td>
            <td nowrap width="18%"> 
    			<input type="text" name="E01AFIIDD" size="35" maxlength="30" value="<%= svBasic.getE01AFIIDD().trim()%>" readonly >
            
            </td>
            <td nowrap width="28%"> 
              <div align="right">Source :</div>
            </td>
            <td nowrap width="24%"> 
              <input type="text" name="E01AFIIDS" size="15" maxlength="15" readonly 
				  value="<% if (svBasic.getE01AFIIDS().equals("N")) out.print("No Initial Deposit");
							else if (svBasic.getE01AFIIDS().equals("1")) out.print("Cash Deposit");
							else if (svBasic.getE01AFIIDS().equals("2")) out.print("Wire");
							else if (svBasic.getE01AFIIDS().equals("3")) out.print("Check");
							else if (svBasic.getE01AFIIDS().equals("4")) out.print("Internal Transfer");
							else if (svBasic.getE01AFIIDS().equals("5")) out.print("External Transfer");
							else if (svBasic.getE01AFIIDS().equals("6")) out.print("Traveler Checks");
							else if (svBasic.getE01AFIIDS().equals("7")) out.print("Other");
							else if (svBasic.getE01AFIIDS().equals("8")) out.print("Loan Proceeds");
							else if (svBasic.getE01AFIIDS().equals("9")) out.print("Mixed Deposit");
						    else out.print("");%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <% } %>
    
  <H4>Offset Accounts</H4>
  <TABLE class="tableinfo" align="center">
  <TR><TD>
  
   <table id="headTable" >
    <tr id="trdark"> 
      <td nowrap align="center" >Concept</td>
      <td nowrap align="center" >Bank </td>
      <td nowrap align="center" >Branch</td>
      <td nowrap align="center" >Currency</td>
      <td nowrap align="center" >Reference</td>
      <td nowrap align="center" >Amount</td>
    </tr>
    </table> 
      
    <div id="dataDiv" class="scbarcolor" style="height:60; overflow-y :scroll; z-index:0" >
     <table id="dataTable" >
          <%
  				   int amount = 9;
 				   String name;
  					for ( int i=1; i<=amount; i++ ) {
   					  name = i + "";
   			%> 
          <tr id="trclear")> 
            <td nowrap> 
              <div align="center"> 
                <input type="hidden" name="E01OFFOP<%= name %>" value="<%= svBasic.getField("E01OFFOP"+name).getString().trim()%>">
                <input type="hidden" name="E01OFFGL<%= name %>" value="<%= svBasic.getField("E01OFFGL"+name).getString().trim()%>">
                <input type="text" name="E01OFFCO<%= name %>" size="25" maxlength="25" readonly value="<%= svBasic.getField("E01OFFCO"+name).getString().trim()%>" >
              </div>
            </td>
            <td nowrap width="5%" > 
              <div align="center"> 
                <input type="text" name="E01OFFBK<%= name %>" size="2" maxlength="2" value="<%= svBasic.getField("E01OFFBK"+name).getString().trim()%>" readonly >
              </div>
            </td>
            <td nowrap  > 
              <div align="center"> 
                <input type="text" name="E01OFFBR<%= name %>" size="3" maxlength="3" value="<%= svBasic.getField("E01OFFBR"+name).getString().trim()%>" readonly >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01OFFCY<%= name %>" size="3" maxlength="3" value="<%= svBasic.getField("E01OFFCY"+name).getString().trim()%>" readonly >
              </div>
            </td>
            <td nowrap  > 
              <div align="center"> 
                <input type="text" name="E01OFFAC<%= name %>" size="12" maxlength="12"  value="<%= svBasic.getField("E01OFFAC"+name).getString().trim()%>" readonly >
              </div>
            </td>
            <td nowrap  > 
              <div align="center"> 
                <input type="text" name="E01OFFAM<%= name %>" size="15" maxlength="15"  value="<%= svBasic.getField("E01OFFAM"+name).getString().trim()%>" readonly >
              </div>
            </td>
          </tr>
          <%
    		}
    		%> 
    		</table>
        </div>
    <table id="footTable" > 
          <tr id="trdark"> 
            <td nowrap  align="right"><b>Account Equivalent Currency:</b>
            </td>
            <td nowrap  align="center"> 
                <input type="text" name="E01OFFEQV" size="15" maxlength="15" readonly value="<%= svBasic.getE01OFFEQV().trim()%>">
            </td>
          </tr>
        </table>
      </TD>  
</TR>	
</TABLE>    
 <SCRIPT language="javascript">
    function tableresize() {
     adjustEquTables(headTable,dataTable,dataDiv,0,true);
   }
  tableresize();
  window.onresize=tableresize;
  </SCRIPT>    
  </form>
</body>
</html>
