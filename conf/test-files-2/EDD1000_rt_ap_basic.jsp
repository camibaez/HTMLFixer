<html>
<head>
<title>Retail Account Approval </title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="rtBasic" class ="datapro.eibs.beans.EDD000001Message" scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"   scope="session" />

<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   builtNewMenu(rt_a_opt);


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
<H3 align="center"> Approve Retail Account<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="rt_ap_basic EDD1000"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="29">
  <INPUT TYPE=HIDDEN NAME="SCRACMBNK" VALUE="<%= rtBasic.getE01ACMBNK().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01ACMATY" VALUE="<%= rtBasic.getE01ACMATY().trim()%>">
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
                <input type="text" readonly <% if (rtBasic.getF01ACMCUN().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01ACMCUN" size="9" maxlength="9" value="<%= rtBasic.getE01ACMCUN().trim()%>" >
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E01CUSNA1" size="45" maxlength="45" readonly value="<%= userPO.getHeader3().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E01ACMACC" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
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
                <input type="text" name="E01ACMPRO" size="4" maxlength="4" readonly value="<%= userPO.getHeader1().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <H4>Basic Information</H4>
<table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="29%"> 
              <div align="right">Opening Date :</div>
            </td>
            <td nowrap width="19%"> 
              <input type="text" readonly <% if (rtBasic.getF01ACMOP1().equals("Y")) out.print("id=\"txtchanged\""); %>  name="E01ACMOP1" size="2" maxlength="2" value="<%= rtBasic.getE01ACMOP1().trim()%>">
              <input type="text" readonly <% if (rtBasic.getF01ACMOP2().equals("Y")) out.print("id=\"txtchanged\""); %>  name="E01ACMOP2" size="2" maxlength="2" value="<%= rtBasic.getE01ACMOP2().trim()%>">
              <input type="text" readonly <% if (rtBasic.getF01ACMOP3().equals("Y")) out.print("id=\"txtchanged\""); %>  name="E01ACMOP3" size="2" maxlength="2" value="<%= rtBasic.getE01ACMOP3().trim()%>">
            </td>
            <td nowrap width="26%"> 
              <div align="right">Referral Codes :</div>
            </td>
            <td nowrap width="26%"> 
              <input type="text" readonly
					<% if (rtBasic.getF01ACMRCD().equals("Y")) out.print("id=\"txtchanged\""); %>
					name="E01ACMRCD" size="25" maxlength="30"
					value="<% if (rtBasic.getE01ACMRCD().equals("D")) out.print("Debits Reference");
							else if (rtBasic.getE01ACMRCD().equals("C")) out.print("Credits Reference");
							else if (rtBasic.getE01ACMRCD().equals("A")) out.print("Both Reference");
						    else out.print("");%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%"> 
              <div align="right">Withholding Deductions:</div>
            </td>
            <td nowrap width="19%"> 
              <input type="text" readonly <% if (rtBasic.getF01ACMWHF().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01ACMWHF" size="2" maxlength="1" value="<%= rtBasic.getE01ACMWHF().trim()%>">
            </td>
            <td nowrap width="26%"> 
              <div align="right">Type of Signature :</div>
            </td>
            <td nowrap width="26%"> 
              <input type="text" readonly <% if (rtBasic.getF01ACMPEC().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01ACMPEC" size="20" maxlength="20" 
				  value="<% if (rtBasic.getE01ACMPEC().equals("1")) out.print("Individual");
							else if (rtBasic.getE01ACMPEC().equals("2")) out.print("Joined");
							else out.print("");%>" 
				>
            </td>
          </tr>
          <tr id="trdark"> 
          
             <td nowrap width="29%" height="19"> 
              <div align="right">Mailing Address :</div>
            </td>
            <td nowrap width="19%" height="19"> 
              <input type="text" readonly <% if (rtBasic.getF01ACMMLA().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01ACMMLA" size="2" maxlength="1" value="<%= rtBasic.getE01ACMMLA().trim()%>">
            </td>
            
            <td nowrap width="26%" height="23"> 
              <div align="right">Overdraft Allowed :</div>
            </td>
            <td nowrap width="26%" height="23"> 
              <input type="text" readonly <% if (rtBasic.getF01ACMF03().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01ACMF03" size="3" maxlength="2" 
				  value="<% if (rtBasic.getE01ACMF03().equals("1")) out.print("Yes");
							else if (rtBasic.getE01ACMF03().equals("N")) out.print("No");
							else out.print("");%>" 
				>
            </td>
          </tr>
          <tr id="trclear"> 
           <td nowrap width="29%" height="19">
              <div align="right">Required Documents Table :</div>
            </td>
            <td nowrap width="19%" height="19">
              <input type="text" size="2" maxlength="1" readonly value="<%= rtBasic.getE01ACMMLA().trim()%>">
            </td>
            <td nowrap width="26%" height="19"> 
              <div align="right">Payable Through :</div>
            </td>
            <td nowrap width="26%" height="19"> 
              <input type="text" readonly <% if (rtBasic.getF01ACMPTF().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01ACMPTF" size="3" maxlength="2" 
				  value="<% if (rtBasic.getE01ACMPTF().equals("Y")) out.print("Yes");
							else if (rtBasic.getE01ACMPTF().equals("N")) out.print("No");
							else out.print("");%>" 
				>
            </td>
          </tr>
          <tr id="trdark">
             <td nowrap width="29%" height="19"> 
              <div align="right">Special Local Float :</div>
            </td>
            <td nowrap width="19%" height="19">
              <input type="text" readonly <% if (rtBasic.getF01ACMWLF().equals("Y")) out.print("id=\"txtchanged\""); %> size="2" maxlength="1" value="<%= rtBasic.getE01ACMWLF().trim()%>" name="E01ACMWLF">
            </td>
            <td nowrap width="26%" height="19">
              <div align="right">Cost Center :</div>
            </td>
            <td nowrap width="26%" height="19">
              <input type="text" readonly <% if (rtBasic.getF01ACMCCN().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01ACMCCN" size="8" maxlength="8" value="<%= rtBasic.getE01ACMCCN().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
          <td nowrap width="29%" height="19">
              <div align="right">Bank/Branch :</div>
            </td>
            <td nowrap >            
              <input type="text" name="E01ACMBNK" size="2" maxlength="2" value="<%= rtBasic.getE01ACMBNK().trim()%>" readonly>
              <input type="text" name="E01ACMBRN" size="2" maxlength="3" value="<%= rtBasic.getE01ACMBRN().trim()%>" readonly>
            </td>
            <td nowrap width="26%" height="19"> 
              <div align="right"> Special UnLocal Float :</div>
            </td>
            <td nowrap width="26%" height="19">
              <input type="text" size="2" readonly <% if (rtBasic.getF01ACMWNF().equals("Y")) out.print("id=\"txtchanged\""); %> maxlength="1" value="<%= rtBasic.getE01ACMWNF().trim()%>" name="E01ACMWNF">
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
            	<input type="text" size="2" maxlength="1" readonly value="<%= rtBasic.getE01ACMCT1().trim()%>" name="E01ACMCT1">
            </td>
            <td nowrap width="28%"> 
              <div align="right">Beneficiary Designation :</div>
            </td>
            <td nowrap width="24%"> 
            	<input type="text" size="2" readonly maxlength="1" value="<%= rtBasic.getE01ACMCT2().trim()%>" name="E01ACMCT2">
             </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">Purpose of Account :</div>
            </td>
            <td nowrap width="70%" colspan="3"> 
				<input type="text" size="41" maxlength="40" readonly value="<%= rtBasic.getE01ACMPA1().trim()%>" name="E01ACMPA1">
            </td>
            </tr>
           <tr id="trclear">
           <td nowrap width="30%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="70%" colspan="3"> 
				<input type="text" size="41" maxlength="40" readonly value="<%= rtBasic.getE01ACMPA2().trim()%>" name="E01ACMPA2">
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
              <input type="text" readonly <% if (rtBasic.getF01ACMSCF().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01ACMSCF" size="60" maxlength="60" 
				  value="<% if(rtBasic.getE01ACMSCF().equals("Y")) out.print("Charge all Service Fees");
              				else if(rtBasic.getE01ACMSCF().equals("N")) out.print("Waive all Service Fees");
              				else if(rtBasic.getE01ACMSCF().equals("1")) out.print("Waive Admin Fees (MMK) Minimum Balance Fees (DDA,SAV,NOW)");
              				else if(rtBasic.getE01ACMSCF().equals("2")) out.print("Waive Excess Check Fees on MMK");
              				else if(rtBasic.getE01ACMSCF().equals("3")) out.print("Waive Inactive/Dormant Fees");
              				else if(rtBasic.getE01ACMSCF().equals("4")) out.print("Waive Annual Service Fees");
              				else if(rtBasic.getE01ACMSCF().equals("5")) out.print("Waive Deposit Check Fees on DDA");
              				else if(rtBasic.getE01ACMSCF().equals("6")) out.print("Waive Fees for Use of Uncollected Funds");
              				else if(rtBasic.getE01ACMSCF().equals("7")) out.print("Apply ONLY Use of Uncollected Funds");
              				else if(rtBasic.getE01ACMSCF().equals("8")) out.print("Waive Stop Payments Fees");
              				else if(rtBasic.getE01ACMSCF().equals("9")) out.print("Waive ATM Fees");
              				else if(rtBasic.getE01ACMSCF().equals("0")) out.print("Waive ATM and Use of Uncollected Fees");
							else out.print("");%>" 
				>
            </td>
            <td nowrap width="28%"> 
              <div align="right">Service Charges Structure :</div>
            </td>
            <td nowrap width="24%"> 
            	<input type="text" readonly <% if (rtBasic.getF01ACMACL().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01ACMACL" size="2" maxlength="2" value="<%= rtBasic.getE01ACMACL().trim()%>">
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
              <input type="text" readonly <% if (rtBasic.getF01ACMSTF().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01ACMSTF" size="25" maxlength="30" 
				  value="<% if (rtBasic.getE01ACMSTF().equals("D")) out.print("Daily");
							else if (rtBasic.getE01ACMSTF().equals("W")) out.print("Weekly");
							else if (rtBasic.getE01ACMSTF().equals("B")) out.print("Biweekly");
							else if (rtBasic.getE01ACMSTF().equals("M")) out.print("Monthly");
							else if (rtBasic.getE01ACMSTF().equals("Q")) out.print("Quaterly");
						    else out.print("");%>" 
				>
            </td>
            <td nowrap width="28%"> 
              <div align="right">Hold Mail :</div>
            </td>
            <td nowrap width="24%"> 
              <input type="text" readonly <% if (rtBasic.getF01ACMHSF().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01ACMHSF" size="3" maxlength="2" 
				  value="<% if (rtBasic.getE01ACMHSF().equals("H")) out.print("Yes");
							else if (rtBasic.getE01ACMHSF().equals("")) out.print("No");
							else out.print("");%>" 
				>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">Account Statement Day :</div>
            </td>
            <td nowrap width="18%"> 
              <input type="text" readonly <% if (rtBasic.getF01ACMSDY().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01ACMSDY" size="3" maxlength="2" value="<%= rtBasic.getE01ACMSDY().trim()%>">
            </td>
            <td nowrap width="28%"> 
              <div align="right">Consolidated Account Statement :</div>
            </td>
            <td nowrap width="24%"> 
              <input type="text" readonly <% if (rtBasic.getF01ACMCSF().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01ACMCSF" size="3" maxlength="2" 
				  value="<% if (rtBasic.getE01ACMCSF().equals("Y")) out.print("Yes");
							else if (rtBasic.getE01ACMCSF().equals("N")) out.print("No");
							else out.print("");%>" 
				>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%" height="23"> 
              <div align="right">Account Statement Type :</div>
            </td>
            <td nowrap width="18%" height="23"> 
              <input type="text" readonly <% if (rtBasic.getF01ACMSTY().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01ACMSTY" size="25" maxlength="25" 
				  value="<% if (rtBasic.getE01ACMSTY().equals("P")) out.print("Personal");
							else if (rtBasic.getE01ACMSTY().equals("C")) out.print("Corporate");
							else if (rtBasic.getE01ACMSTY().equals("N")) out.print("None");
						    else out.print("");%>" 
				>
            </td>
            <td nowrap width="28%" height="23"> 
              <div align="right">Daily Statement Via :</div>
            </td>
            <td nowrap width="24%" height="23"> 
              <input type="text" readonly <% if (rtBasic.getF01ACMSTE().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01ACMSTE" size="25" maxlength="25" 
				  value="<% if (rtBasic.getE01ACMSTE().equals("T")) out.print("Telex");
							else if (rtBasic.getE01ACMSTE().equals("P")) out.print("Printer");
							else if (rtBasic.getE01ACMSTE().equals("F")) out.print("Fax");
							else if (rtBasic.getE01ACMSTE().equals("E")) out.print("e-Mail");
							else if (rtBasic.getE01ACMSTE().equals("N")) out.print("None");
							else if (rtBasic.getE01ACMSTE().equals("1")) out.print("Swift 940");
							else if (rtBasic.getE01ACMSTE().equals("2")) out.print("Swift 950");
						    else out.print("");%>" 
				>
            </td>
          </tr>
          <tr id="clear"> 
            <td nowrap width="30%" height="23"> 
              <div align="right">Include Images with Statement :</div>
            </td>
            <td nowrap width="18%" height="23"> 
              <input type="text" readonly <% if (rtBasic.getF01ACMF04().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01ACMF04" size="25" maxlength="25" 
				  value="<% if (rtBasic.getE01ACMF04().equals("1")) out.print("Send copies and charg");
							else if (rtBasic.getE01ACMF04().equals("2")) out.print("Send copies and waive charge");
							else if (rtBasic.getE01ACMF04().equals("3")) out.print("Do not send copies");
						    else out.print("");%>">
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
  <H4>Checkbook Information</H4>
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
 
 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Checkbook Type :</div>
            </td>
            <td nowrap width="21%"> 
              <input type="text" readonly <% if (rtBasic.getF01ACMTCB().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01ACMTCB" size="2" maxlength="1" value="<%= rtBasic.getE01ACMTCB().trim()%>">
                     
            </td>            
            <td nowrap width="26%"> 
              <div align="right">Checkbook Book Code :</div>
            </td>
            <td nowrap width="23%">
              <input type="text" readonly <% if (rtBasic.getF01ACMP11().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01ACMP11" size="3" maxlength="2" value="<%= rtBasic.getE01ACMP11().trim()%>">                           
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">Minimum  Stock :</div>
            </td>
            <td nowrap width="21%">            
               <input type="text" readonly <% if (rtBasic.getF01ACMMSK().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01ACMMSK" size="3" maxlength="2" value="<%= rtBasic.getE01ACMMSK().trim()%>"> 
            </td>
            <td nowrap width="26%"> 
              <div align="right">Current Stock :</div>
            </td>
            <td nowrap width="23%">
               <input type="text" readonly <% if (rtBasic.getF01ACMASK().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01ACMASK" size="3" maxlength="2" value="<%= rtBasic.getE01ACMASK().trim()%>">                   
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Checkbook Service Charges :</div>
            </td>
            <td nowrap width="21%"> 
               <input type="text" readonly <% if (rtBasic.getF01ACMCBC().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01ACMCBC" size="3" maxlength="2" 
				  value="<% if (rtBasic.getE01ACMCBC().equals("Y")) out.print("Yes");
							else if (rtBasic.getE01ACMCBC().equals("N")) out.print("No");
							else out.print("");%>" 
				>                           
            </td>
            <td nowrap width="26%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="23%">&nbsp;</td>
          </tr> 
          <tr>
           <td colspan=4>
           	<p><b>Information that will should appear on Customers' Checks ...</b></p>
           	</td>
          </tr>
	   		<tr id=trdark>
	   		    <td align="center"></td>
	   			<td align="center">First /Company Name </td>
	   			<td align="center">Middle Initial</td>
	   			<td align="center">Last Name</td>
	   		</tr>
	   		<tr id=trclear>
	   		    <td align="right">Primary Account Holder :</td>
	   			<td > 
	       			<input type="text" name="E01CHPFN1" size="42" maxlength="40" value="<%= rtBasic.getE01CHPFN1().trim()%>" readonly>
	    		</td>
	    		<td align="center"> 
	       			<input type="text" name="E01CHPMN1" size="2" maxlength="1" value="<%= rtBasic.getE01CHPMN1().trim()%>" readonly>
	    		</td>
	    		<td align="center"> 
	       			<input type="text" name="E01CHPLN1" size="18" maxlength="15" value="<%= rtBasic.getE01CHPLN1().trim()%>" readonly>
	    		</td>
	   			
	   		</tr>
	   		<tr id=trdark>
	   		 <td></td>
	   		 <td colspan=3>
	   				<SELECT name="E01CHPRE1" disabled>
                            <OPTION value="Y" <%if (!rtBasic.getE01CHPRE1().equals("O")) out.print("selected"); %>="">AND</OPTION>
                            <OPTION value="O" <%if (rtBasic.getE01CHPRE1().equals("O")) out.print("selected"); %>="">AND/OR</OPTION>
              		</SELECT>
              	</td>
	   		</tr>
           	<tr id=trclear>
           	 	<td align="right">
              		Secondary Account Holder :
              	</td>
	   			<td > 
	       			<input type="text" name="E01CHPFN2" size="18" maxlength="15" value="<%= rtBasic.getE01CHPFN2().trim()%>" readonly>
	    		</td>
	   			<td align="center"> 
	       			<input type="text" name="E01CHPMN2" size="2" maxlength="1" value="<%= rtBasic.getE01CHPMN2().trim()%>" readonly>
	    		</td>
	    		<td align="center"> 
	       			<input type="text" name="E01CHPLN2" size="18" maxlength="15" value="<%= rtBasic.getE01CHPLN2().trim()%>" readonly>
	    		</td>
	   		</tr>
	   		
	   		<tr id=trdark>
	   			<td align="right">Address :</td>
	   			<td colspan=3> 
	       			<input type="text" name="E01CHPAD1" size="35" maxlength="30" value="<%= rtBasic.getE01CHPAD1().trim()%>" readonly>
	    		</td>	   			
	   		</tr>
	   		<tr id=trclear>
	   			<td align="right">City /State:</td>
	   			<td> 
	       			<input type="text" name="E01CHPCTY" size="18" maxlength="15" value="<%= rtBasic.getE01CHPCTY().trim()%>" readonly>
	    		    <input type="text" name="E01CHPSTE" size="3" maxlength="2" value="<%= rtBasic.getE01CHPSTE().trim()%>" readonly>
	    		</td>
	    		<td align="right">Zip Code :</td>
	   			<td > 
	       			<input type="text" name="E01CHPZPC" size="12" maxlength="10" value="<%= rtBasic.getE01CHPZPC().trim()%>" readonly>
	    		</td>	   			
	   		</tr>
        </table> 
 
 
      </td>
    </tr>
  </table>
  
  <% if (rtBasic.getH01SCRCOD().trim().equals("N")) { %>
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
              <input type="text" name="E01AFIDAC" size="12" maxlength="9"  value="<%= rtBasic.getE01AFIDAC().trim()%>" readonly >
             </td>
            <td nowrap width="24%">
           <div align="right">Amount :</div>
            <td nowrap width="28%"> 
             <input type="text" name="E01AFIIDA" size="15" maxlength="13"  value="<%= rtBasic.getE01AFIIDA().trim()%>" readonly >
            </td>
             
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">Description :</div>
            </td>
            <td nowrap width="18%"> 
    			<input type="text" name="E01AFIIDD" size="35" maxlength="30" value="<%= rtBasic.getE01AFIIDD().trim()%>" readonly >
            
            </td>
            <td nowrap width="28%"> 
              <div align="right">Source :</div>
            </td>
            <td nowrap width="24%"> 
              <input type="text" name="E01AFIIDS" size="15" maxlength="15" readonly 
				  value="<% if (rtBasic.getE01AFIIDS().equals("N")) out.print("No Initial Deposit");
							else if (rtBasic.getE01AFIIDS().equals("1")) out.print("Cash Deposit");
							else if (rtBasic.getE01AFIIDS().equals("2")) out.print("Wire");
							else if (rtBasic.getE01AFIIDS().equals("3")) out.print("Check");
							else if (rtBasic.getE01AFIIDS().equals("4")) out.print("Internal Transfer");
							else if (rtBasic.getE01AFIIDS().equals("5")) out.print("External Transfer");
							else if (rtBasic.getE01AFIIDS().equals("6")) out.print("Traveler Checks");
							else if (rtBasic.getE01AFIIDS().equals("7")) out.print("Other");
							else if (rtBasic.getE01AFIIDS().equals("8")) out.print("Loan Proceeds");
							else if (rtBasic.getE01AFIIDS().equals("9")) out.print("Mixed Deposit");
						    else out.print("");%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <% } %>
  
  <H4>Offset Accounts</H4>
  <TABLE class="tableinfo" align="center" >
  <TR><TD>
  
   <table id="headTable">
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
     <table id="dataTable">
          <%
  				   int amount = 9;
 				   String name;
  					for ( int i=1; i<=amount; i++ ) {
   					  name = i + "";
   			%> 
          <tr id="trclear")> 
            <td nowrap> 
              <div align="center"> 
                <input type="hidden" name="E01OFFOP<%= name %>" value="<%= rtBasic.getField("E01OFFOP"+name).getString().trim()%>">
                <input type="hidden" name="E01OFFGL<%= name %>" value="<%= rtBasic.getField("E01OFFGL"+name).getString().trim()%>">
                <input type="text" name="E01OFFCO<%= name %>" size="25" maxlength="25" readonly value="<%= rtBasic.getField("E01OFFCO"+name).getString().trim()%>" >
              </div>
            </td>
            <td nowrap width="5%" > 
              <div align="center"> 
                <input type="text" name="E01OFFBK<%= name %>" size="2" maxlength="2" value="<%= rtBasic.getField("E01OFFBK"+name).getString().trim()%>" readonly >
              </div>
            </td>
            <td nowrap  > 
              <div align="center"> 
                <input type="text" name="E01OFFBR<%= name %>" size="3" maxlength="3" value="<%= rtBasic.getField("E01OFFBR"+name).getString().trim()%>" readonly >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01OFFCY<%= name %>" size="3" maxlength="3" value="<%= rtBasic.getField("E01OFFCY"+name).getString().trim()%>" readonly >
              </div>
            </td>
            <td nowrap  > 
              <div align="center"> 
                <input type="text" name="E01OFFAC<%= name %>" size="12" maxlength="12"  value="<%= rtBasic.getField("E01OFFAC"+name).getString().trim()%>" readonly >
              </div>
            </td>
            <td nowrap  > 
              <div align="center"> 
                <input type="text" name="E01OFFAM<%= name %>" size="15" maxlength="15"  value="<%= rtBasic.getField("E01OFFAM"+name).getString().trim()%>" readonly >
              </div>
            </td>
          </tr>
          <%
    		}
    		%> 
    		</table>
        </div>
    <table id="footTable"> 	
          <tr id="trdark"> 
            <td nowrap  align="right"><b>Account Equivalent Currency:</b>
            </td>
            <td nowrap  align="center"> 
                <input type="text" name="E01OFFEQV" size="15" maxlength="15" readonly value="<%= rtBasic.getE01OFFEQV().trim()%>">
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
