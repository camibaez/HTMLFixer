<html>
<head>
<title>Debit Card Approval</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "rtCC" class= "datapro.eibs.beans.ECC004001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

<%
if ( userPO.getOption().equals("RT") ) {
%>
	builtNewMenu(rt_a_opt);
<%   
}
else if ( userPO.getOption().equals("SV") ) {
%>
	builtNewMenu(sv_a_opt);
<%   
}
%>

</SCRIPT>

</head>
<body bgcolor="#FFFFFF">

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
	 error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
    out.println("<SCRIPT> initMenu();  </SCRIPT>");

%>

 <h3 align="center">Debit Cards Inquiry Approval<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cc_basic_ap,ECC0040" ></h3> 
<hr size="4">
 <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESW0000" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  </p>
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
                <input type="text" readonly  name="E01CCMCUN" size="9" maxlength="9"  value="<%= rtCC.getE01CCMCUN().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" readonly  name="E02NA1" size="45" maxlength="45"  value="<%= rtCC.getE01CCMNA1().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account : </b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" readonly  name="E01CCMACC" size="12" maxlength="12" value="<%= rtCC.getE01CCMACC().trim()%>" >
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency :</b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" readonly  name="E01CCMCCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" >
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" readonly  name="E02PRO" size="4" maxlength="4"  value="<%= userPO.getHeader1().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Basic Information</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0" >
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Card Number :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" readonly  name="E01CCMPCN" size="17" maxlength="16" value="<%= rtCC.getE01CCMPCN().trim()%>">
            </td>
            <td nowrap width="25%" > 
              <div align="right">Status :</div>
            </td>
            <td nowrap width="25%" > 
				
              <select name="E01CCMAST" disabled>
                <option value=" " <% if (!(rtCC.getE01CCMAST().equals("0") ||rtCC.getE01CCMAST().equals("1")
                					|| rtCC.getE01CCMAST().equals("2") ||rtCC.getE01CCMAST().equals("3")
                					|| rtCC.getE01CCMAST().equals("4") ||rtCC.getE01CCMAST().equals("5")
                					|| rtCC.getE01CCMAST().equals("6") ||rtCC.getE01CCMAST().equals("7")
                					|| rtCC.getE01CCMAST().equals("8") ||rtCC.getE01CCMAST().equals("9"))) out.print("selected"); %>></option>
                <option value="0" <% if (rtCC.getE01CCMAST().equals("0")) out.print("selected"); %>>Inactive/Does not Exist</option>
                <option value="1" <% if (rtCC.getE01CCMAST().equals("1")) out.print("selected"); %>>Active</option>
                <option value="2" <% if (rtCC.getE01CCMAST().equals("2")) out.print("selected"); %>>Lost</option>
                <option value="3" <% if (rtCC.getE01CCMAST().equals("3")) out.print("selected"); %>>Stolen</option>
                <option value="4" <% if (rtCC.getE01CCMAST().equals("4")) out.print("selected"); %>>Restricted</option>
                <option value="5" <% if (rtCC.getE01CCMAST().equals("5")) out.print("selected"); %>>Insufficient Funds</option>
                <option value="6" <% if (rtCC.getE01CCMAST().equals("6")) out.print("selected"); %>>Pre-Activated</option>
                <option value="7" <% if (rtCC.getE01CCMAST().equals("7")) out.print("selected"); %>>Reserved</option>
                <option value="8" <% if (rtCC.getE01CCMAST().equals("8")) out.print("selected"); %>>Expired</option>
                <option value="9" <% if (rtCC.getE01CCMAST().equals("9")) out.print("selected"); %>>Closed</option>
              </select>
            </td>
          </tr>
          
           <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Customer First Name :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" readonly  name="E01CCMFNA" size="21" maxlength="20" value="<%= rtCC.getE01CCMFNA().trim()%>">
            </td>
            <td nowrap width="25%" > 
              <div align="right">Customer Last Name :</div>
            </td>
            <td nowrap width="25%" > 
				<input type="text" readonly  name="E01CCMLN1" size="21" maxlength="20" value="<%= rtCC.getE01CCMLN1().trim()%>">
            </td>
          </tr>


		<tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Opening Date :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E01CCMOPM" size="3" maxlength="2" value="<%= rtCC.getE01CCMOPM().trim()%>" readonly>
			  <input type="text" name="E01CCMOPD" size="3" maxlength="2" value="<%= rtCC.getE01CCMOPD().trim()%>" readonly>
			  <input type="text" name="E01CCMOPY" size="3" maxlength="2" value="<%= rtCC.getE01CCMOPY().trim()%>" readonly>
            </td>
            <td nowrap width="25%" > 
              <div align="right">Expiration Date :</div>
            </td>
            <td nowrap width="25%" > 
				<input type="text" name="E01CCMEXM" size="3" maxlength="2" value="<%= rtCC.getE01CCMEXM().trim()%>" readonly>
				<input type="text" name="E01CCMEXD" size="3" maxlength="2" value="<%= rtCC.getE01CCMEXD().trim()%>" readonly>
				<input type="text" name="E01CCMEXY" size="3" maxlength="2" value="<%= rtCC.getE01CCMEXY().trim()%>" readonly>
            </td>
          </tr>          



           <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Home Telephone Number :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" readonly  name="E01CCMHPN" size="12" maxlength="11" value="<%= rtCC.getE01CCMHPN().trim()%>">
            </td>
            <td nowrap width="25%" > 
              <div align="right">Business Telephone Number :</div>
            </td>
            <td nowrap width="25%" > 
				<input type="text" readonly  name="E01CCMPHN" size="12" maxlength="11" value="<%= rtCC.getE01CCMPHN().trim()%>">
            </td>
          </tr>
          
          
          
        </table>
      </td>
    </tr>
  </table>
  <h4>Limits</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap height="43"> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0" >
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">ATM Daily Withdrawal Limit :</div>
            </td>
            <td nowrap width="25%"> 
				<input type="text" readonly  name="E01CCMLBC" size="8" maxlength="7" value="<%= rtCC.getE01CCMLBC().trim()%>" onkeypress="enterInteger()">
            </td>
            <td nowrap width="25%"> 
              <div align="right">ATM Daily Withdrawal Limit Offline :</div>
            </td>
            <td nowrap width="25%"> 
				<input type="text" readonly  name="E01CCMLFC" size="8" maxlength="7" value="<%= rtCC.getE01CCMLFC().trim()%>" onkeypress="enterInteger()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Uncollected Funds Daily Withdrawal Limit :</div>
            </td>
            <td nowrap width="25%"> 
				<input type="text" readonly  name="E01CCMLNL" size="8" maxlength="7" value="<%= rtCC.getE01CCMLNL().trim()%>" onkeypress="enterInteger()">
            </td>
            <td nowrap width="25%" align="right"> 
            Table Fees :</td>
            <td nowrap width="25%"><INPUT type="text" readonly
					name="E01CCMTBL" size="8" maxlength="7"
					value="<%= rtCC.getE01CCMTBL().trim()%>"
					onkeypress="enterInteger()"> 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">POS Daily Purchase Limit :</div>
            </td>
            <td nowrap width="25%"> 
				<input type="text" readonly  name="E01CCMLAD" size="8" maxlength="7" value="<%= rtCC.getE01CCMLAD().trim()%>" onkeypress="enterInteger()">
            </td>
            <td nowrap width="25%"> 
              <div align="right">POS Daily Purchase Limit Offline :</div>
            </td>
            <td nowrap width="25%"> 
				<input type="text" readonly  name="E01CCMLQT" size="8" maxlength="7" value="<%= rtCC.getE01CCMLQT().trim()%>" onkeypress="enterInteger()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Aggregate Daily Withdrawal and Purchase Limit :</div>
            </td>
            <td nowrap width="25%"> 
				<input type="text" readonly  name="E01CCMABS" size="8" maxlength="7" value="<%= rtCC.getE01CCMABS().trim()%>" onkeypress="enterInteger()">
            </td>
            <td nowrap width="25%"> 
              <div align="right">Aggregate Daily Withdrawal and Purchase Limit Offline :</div>
            </td>
            <td nowrap width="25%"> 
				<input type="text" readonly  name="E01CCMAFC" size="8" maxlength="7" value="<%= rtCC.getE01CCMAFC().trim()%>" onkeypress="enterInteger()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Cash Equivalent Daily Withdrawal Limit :</div>
            </td>
            <td nowrap width="25%"> 
				<input type="text" readonly  name="E01CCMATO" size="8" maxlength="7" value="<%= rtCC.getE01CCMATO().trim()%>" onkeypress="enterInteger()">
            </td>
            <td nowrap width="25%"> 
              <div align="right">Cash Equivalent Daily Withdrawal Limit Offline :</div>
            </td>
            <td nowrap width="25%"> 
				<input type="text" readonly  name="E01CCMAAD" size="8" maxlength="7" value="<%= rtCC.getE01CCMAAD().trim()%>" onkeypress="enterInteger()">
            </td>
          </tr>
          
        </table>
      </td>
    </tr>
  </table>
  <h4>Addresses</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap height="43"> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0" >
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Primary Address :</div>
            </td>
            <td nowrap width="75%" colspan="3"> 
				<input type="text" readonly  name="E01CCMNA1" size="40" maxlength="35" value="<%= rtCC.getE01CCMNA1().trim()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="75%" colspan="3"> 
				<input type="text" readonly  name="E01CCMNA2" size="40" maxlength="35" value="<%= rtCC.getE01CCMNA2().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">City :</div>
            </td>
            <td nowrap width="75%" colspan="3"> 
				<input type="text" readonly  name="E01CCMCTY" size="40" maxlength="30" value="<%= rtCC.getE01CCMCTY().trim()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">State :</div>
            </td>
            <td nowrap width="25%" > 
				<input type="text" readonly  name="E01CCMSTE" size="3" maxlength="2" value="<%= rtCC.getE01CCMSTE().trim()%>" >
            </td>
            <td nowrap width="25%"> 
              <div align="left">Zip Code :</div>
            </td>
            <td nowrap width="25%" > 
				<input type="text" readonly  name="E01CCMZPC" size="11" maxlength="10" value="<%= rtCC.getE01CCMZPC().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Country :</div>
            </td>
            <td nowrap width="75%" colspan="3"> 
				<input type="text" readonly  name="E01CCMGEC" size="4" maxlength="3" value="<%= rtCC.getE01CCMGEC().trim()%>" >
            </td>
          </tr>         
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Alternate Address :</div>
            </td>
            <td nowrap width="75%" colspan="3"> 
				<input type="text" readonly  name="E01CCMAA1" size="40" maxlength="35" value="<%= rtCC.getE01CCMAA1().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="75%" colspan="3"> 
				<input type="text" readonly  name="E01CCMAA2" size="40" maxlength="35" value="<%= rtCC.getE01CCMAA2().trim()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">City :</div>
            </td>
            <td nowrap width="75%" colspan="3"> 
				<input type="text" readonly  name="E01CCMACT" size="40" maxlength="30" value="<%= rtCC.getE01CCMACT().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Zip Code :</div>
            </td>
            <td nowrap width="25%" ><INPUT
					type="text" readonly name="E01CCMAPC" size="11" maxlength="10"
					value="<%= rtCC.getE01CCMAPC().trim()%>">
            </td>
            <td nowrap width="25%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="25%" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Country :</div>
            </td>
            <td nowrap width="75%" colspan="3"> 
				<input type="text" readonly  name="E01CCMGER" size="4" maxlength="3" value="<%= rtCC.getE01CCMGER().trim()%>" >
            </td>
          </tr>         
          
        </table>
      </td>
    </tr>
  </table>
 <H4>Additional Information</H4>
<TABLE class="tableinfo">
	<TBODY>
		<TR>
			<TD nowrap height="43">
			<TABLE cellspacing="0" cellpadding="2" width="100%" border="0">
				<TBODY>
					<TR id="trdark">
						<TD nowrap width="25%"><DIV align="right">Card Not Present Daily Limit :</DIV>
						</TD>
						<TD nowrap width="25%"><input type="text" readonly  name="E01CCMDBS"
							size="7" maxlength="6" value="<%= rtCC.getE01CCMDBS().trim()%>"
							onkeypress="enterInteger()"></TD>
						<TD nowrap width="25%">
						<DIV align="right">Card Not Present Daily Limit Offline :</DIV>
						</TD>
						<TD nowrap width="25%"><input type="text" readonly  name="E01CCMDFC"
							size="7" maxlength="6" value="<%= rtCC.getE01CCMDFC().trim()%>"
							onkeypress="enterInteger()"></TD>
					</TR>
					<TR id="trclear">
						<TD nowrap width="25%">
						<DIV align="right">Retail Authorization Threshold :</DIV>
						</TD>
						<TD nowrap width="25%"><input type="text" readonly  name="E01CCMDTO"
							size="7" maxlength="6" value="<%= rtCC.getE01CCMDTO().trim()%>"
							onkeypress="enterInteger()"></TD>
						<TD nowrap width="25%">
						<DIV align="right">Travel,Enterteinment Aut. Threshold :</DIV>
						</TD>
						<TD nowrap width="25%"><input type="text" readonly  name="E01CCMDQT"
							size="7" maxlength="6" value="<%= rtCC.getE01CCMDQT().trim()%>"
							onkeypress="enterInteger()"></TD>
					</TR>
					<TR id="trdark">
						<TD nowrap width="25%">
						<DIV align="right">Call Me Count Threshold :</DIV>
						</TD>
						<TD nowrap width="25%"><input type="text" readonly  name="E01CCMDCO"
							size="7" maxlength="6" value="<%= rtCC.getE01CCMDCO().trim()%>"
							onkeypress="enterInteger()"></TD>
						<TD nowrap width="25%">
						<DIV align="right">Close Call Count Threshold :</DIV>
						</TD>
						<TD nowrap width="25%"><input type="text" readonly  name="E01CCMLSI"
							size="7" maxlength="6" value="<%= rtCC.getE01CCMLSI().trim()%>"
							onkeypress="enterInteger()"></TD>
					</TR>
					<TR id="trclear">
						<TD nowrap width="25%">
						<DIV align="right">Close Call Amount Threshold :</DIV>
						</TD>
						<TD nowrap width="25%"><input type="text" readonly  name="E01CCMDCQ"
							size="7" maxlength="6" value="<%= rtCC.getE01CCMDCQ().trim()%>"
							onkeypress="enterInteger()"></TD>
						<TD nowrap width="25%">
						<DIV align="right">Card Order Check Guarantee List :</DIV>
						</TD>
						<TD nowrap width="25%"><input type="text" readonly  name="E01CCMDSI"
							size="7" maxlength="6" value="<%= rtCC.getE01CCMDSI().trim()%>"
							onkeypress="enterInteger()"></TD>
					</TR>

				</TBODY>
			</TABLE>
			</TD>
		</TR>
	</TBODY>
</TABLE>
<br> 
 
</form>
</body>
</html>

