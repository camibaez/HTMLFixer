<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Negociaciones de Cartas de Creditos</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<meta http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import = "datapro.eibs.master.Util" %>

<jsp:useBean id="msg01" class="datapro.eibs.beans.ELC056001Message" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </script>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </script>

<script language="javascript">
	builtNewMenu(lc_nego_apr);
	initMenu();
</script>

<%
 String title = "Sight Payment";
 if (msg01.getH01OPECOD().equals("6")) title = "Cancellation";
%>

</head>

<body>

<H3 ALIGN="center">Letter of Credit Negotiation/Payment [<%= title %>]
	<IMG SRC="<%=request.getContextPath()%>/images/e_ibs.gif" ALIGN="left" NAME="EIBS_GIF" ALT="lc_nego_sp_readonly.jsp, ELC0560"></H3>
<HR SIZE="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0560" >
<input name="SCREEN" type="HIDDEN" value="3" readonly="readonly">

<TABLE class="tableinfo">
	<TR bgcolor="#ffffff">
        <TD nowrap height="79" width="100%">
        	<TABLE cellspacing="0" cellpadding="2" width="100%" border="0">
	            <TR ID="trdark">
	              <TD ALIGN="left" VALIGN="top" HEIGHT="29"><B>Type of Negotiation: </B></TD>
	              <TD NOWRAP VALIGN="top" HEIGHT="29">
	                <INPUT TYPE="text" NAME="E01OPCODE" SIZE="4" MAXLENGTH="1" VALUE="<%= msg01.getE01OPCODE()%>" READONLY>
	                <INPUT TYPE="text" NAME="E01OPCDSC" SIZE="31" MAXLENGTH="30" VALUE="<%= msg01.getE01OPCDSC()%>" READONLY></TD>
	              <TD NOWRAP ALIGN="left" VALIGN="top" HEIGHT="29" width="133"><B>Product: </B></TD>
	              <TD NOWRAP ALIGN="left" VALIGN="top" HEIGHT="29">
	                <INPUT type="text" name="E01LCMPRO" size="8" maxlength="8" value="<%= msg01.getE01LCMPRO()%>" readonly></TD>
	            </TR>
	            <TR ID="trclear">
	              <TD ALIGN="left" VALIGN="top" HEIGHT="24" WIDTH="128"><B>Letter of Credit Number: </B></TD>
	              <TD NOWRAP VALIGN="top" HEIGHT="24" WIDTH="284">
	                <INPUT TYPE="text" NAME="E01LCRNUM" SIZE="23" MAXLENGTH="12" VALUE="<%= msg01.getE01LCRNUM()%>" READONLY></TD>
	              <TD NOWRAP ALIGN="left" VALIGN="top" HEIGHT="24" WIDTH="56"><B>Currency: </B></TD>
	              <TD NOWRAP ALIGN="left" VALIGN="top" HEIGHT="24" WIDTH="291">
	                <INPUT TYPE="text" NAME="E01LCMCCY" SIZE="8" MAXLENGTH="3" VALUE="<%= msg01.getE01LCMCCY()%>" READONLY>
	                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>Amount: </B>
	                <INPUT type="text" name="E01DRWAMN" size="18" maxlength="15" value="<%= msg01.getE01DRWAMN()%>" readonly>
	              </TD>
	            </TR>
	            <TR id="trdark">
	              <TD align="left" valign="top" height="24"><B>Customer: </B></TD>
	              <TD nowrap valign="top" height="24" align="left">
	                <INPUT type="text" name="E01LCMCUN" size="20" maxlength="9" value="<%= msg01.getE01LCMCUN()%>" readonly></TD>
	              <TD nowrap align="left" valign="top" height="24"><B>Name: </B></TD>
	              <TD nowrap align="left" valign="top" height="24">
	                <INPUT type="text" name="E01CUSNA1" size="46" maxlength="45" value="<%= msg01.getE01CUSNA1()%>" readonly></TD>
	            </TR>
	            <TR id="trclear">
                <TD nowrap align="left" valign="top" height="24"><B>Swift Message: </B></TD>
                <TD nowrap align="left" valign="top" height="24">
                    <INPUT type="hidden" name="E01SWFMTP" size="3" maxlength="3" value="<%= msg01.getE01SWFMTP()%>" readonly>
                        <SELECT name="msgtyp" disabled>
			            	<OPTION value="" selected></OPTION>
			            	<OPTION value="732" <%=msg01.getE01SWFMTP().equals("732")?"selected":"" %>>MT732</OPTION>
			            	<OPTION value="742" <%=msg01.getE01SWFMTP().equals("742")?"selected":"" %>>MT742</OPTION>
			             	<OPTION value="752" <%=msg01.getE01SWFMTP().equals("752")?"selected":"" %>>MT752</OPTION>
			             	<OPTION value="754" <%=msg01.getE01SWFMTP().equals("754")?"selected":"" %>>MT754</OPTION>
			             	<OPTION value="756" <%=msg01.getE01SWFMTP().equals("756")?"selected":"" %>>MT756</OPTION>
		                </SELECT>
                </TD>
                <TD nowrap align="left" valign="top" height="24" width="135"><B>Receiver Bank ID: </B></TD>
                <TD nowrap align="left" valign="top" height="24" width="372" colspan=3>
                    <INPUT type="text" name="E01SWFRCV" size="14" maxlength="12" value="<%= msg01.getE01SWFRCV()%>" readonly>
                </TD>
            </TR>
			</TABLE>
		</TD>
    </TR>
</TABLE>

<% if (msg01.getE01OPCODE().equals("1")) { %>
<P><B>Principal Debit Account</B></P>
<TABLE CLASS="tableinfo" CELLSPACING="0" CELLPADDING="2" WIDTH="100%" BORDER="0">
	<TR ID="trdark">
		<TD ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="230">Concept</TD>
		<TD NOWRAP VALIGN="top" HEIGHT="24" ALIGN="center" WIDTH="51">Bank</TD>
		<TD NOWRAP VALIGN="top" HEIGHT="24" ALIGN="center" WIDTH="61">Branch</TD>
		<TD NOWRAP ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="47">Ccy</TD>
		<TD NOWRAP ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="128">G/L Account</TD>
		<TD NOWRAP ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="132">DDA Account</TD>
		<TD NOWRAP ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="114">Cost Center</TD>
	</TR>
	<tr id="trclear">
		<td width="230" height="24" align="left" valign="top" nowrap>
			<input name="E01CONCDR" type="text" value="<%= msg01.getE01CONCDR()%>" size="4" maxlength="2" readonly="readonly">
	  		<input name="E01CONCDD" type="text" value="<%=msg01.getE01CONCDD()%>" size="25" maxlength="25" readonly="readonly">
	  	</td>
		<td width="51" height="24" align="center" valign="top" nowrap>
			<input name="E01CUSBNK" type="text" value="<%= msg01.getE01CUSBNK()%>" size="4" maxlength="2" readonly="readonly"></td>
		<td width="61" height="24" align="center" valign="top" nowrap>
	 		<input name="E01CUSBRN" type="text" onKeyPress="enterInteger()" value="<%= msg01.getE01CUSBRN()%>" size="6" maxlength="3" readonly="readonly" ></td>
		<td width="47" height="24" align="center" valign="top" nowrap>
	  		<input name="E01CUSCCY" type="text" value="<%= msg01.getE01CUSCCY()%>" size="6" maxlength="3" readonly="readonly" ></td>
		<td width="128" height="24" align="center" valign="top" nowrap>
	  		<input name="E01CUSGLN" type="text" onKeyPress="enterInteger()" value="<%= msg01.getE01CUSGLN()%>" size="20" maxlength="16" readonly="readonly"></td>
		<td width="132" height="24" align="center" valign="top" nowrap>
	  		<input name="E01CUSACC" type="text" value="<%= msg01.getE01CUSACC()%>" size="18" maxlength="12" readonly="readonly" ></td>
		<td width="114" height="24" align="center" valign="top" nowrap>
	  		<input name="E01CUSCCN" type="text" value="<%= msg01.getE01CUSCCN()%>" size="13" maxlength="8" readonly="readonly"></td>
    </tr>
</table>

<% } %>

<P><B>Commissions Debit Account</B></P>
<TABLE class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
     <TR id="trdark">
		<TD ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="230">Concept</TD>
		<TD NOWRAP VALIGN="top" HEIGHT="24" ALIGN="center" WIDTH="51">Bank</TD>
		<TD NOWRAP VALIGN="top" HEIGHT="24" ALIGN="center" WIDTH="61">Branch</TD>
		<TD NOWRAP ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="47">Ccy</TD>
		<TD NOWRAP ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="128">G/L Account</TD>
		<TD NOWRAP ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="132">DDA Account</TD>
		<TD NOWRAP ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="114">Cost Center</TD>
	</TR>
    <tr id="trclear">
       <td width="230" height="24" align="left" valign="top" nowrap>
			<input name="E01CONDCO" type="text" value="<%=msg01.getE01CONDCO()%>" size="4" maxlength="2" readonly="readonly">
       		<input name="E01CONDCB" type="text" value="<%=msg01.getE01CONDCB()%>" size="25" maxlength="25" readonly="readonly"></td>
       <td nowrap valign="top" height="24" align="center" width="51">
			<input name="E01DEBBK2" type="text" value="<%=msg01.getE01DEBBK2()%>" size="4" maxlength="2" readonly="readonly"></td>
       <td nowrap valign="top" height="24" align="center" width="61">
			<input name="E01DEBBR2" type="text" onKeyPress="enterInteger()" value="<%=msg01.getE01DEBBR2()%>" size="6" maxlength="3" readonly="readonly" ></td>
       <td nowrap align="center" valign="top" height="24" width="47">
			<input name="E01DEBCY2" type="text" value="<%=msg01.getE01DEBCY2()%>" size="6" maxlength="3" readonly="readonly" ></td>
       <td nowrap align="center" valign="top" height="24" width="128">
			<input name="E01DEBGL2" type="text" onKeyPress="enterInteger()" value="<%=msg01.getE01DEBGL2()%>" size="20" maxlength="16" readonly="readonly"></td>
       <td nowrap align="center" valign="top" height="24" width="132">
			<input name="E01DEBAC2" type="text" value="<%=msg01.getE01DEBAC2()%>" size="18" maxlength="12" readonly="readonly" ></td>
       <td nowrap align="center" valign="top" height="24" width="114">
			<input name="E01DEBCC2" type="text" value="<%=msg01.getE01DEBCC2()%>" size="13" maxlength="8" readonly="readonly"></td>
	</tr>
</table>

<% if (msg01.getE01OPCODE().equals("1")) { %>
<P><B>Credit Account</B></P>
<TABLE class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
		<TR id="trdark">
			<TD ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="230">Concept</TD>
			<TD NOWRAP VALIGN="top" HEIGHT="24" ALIGN="center" WIDTH="51">Bank</TD>
			<TD NOWRAP VALIGN="top" HEIGHT="24" ALIGN="center" WIDTH="61">Branch</TD>
			<TD NOWRAP ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="47">MDA</TD>
			<TD NOWRAP ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="128">G/L Account</TD>
			<TD NOWRAP ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="132">DDA Account</TD>
			<TD NOWRAP ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="114">Cost Center</TD>
		</TR>
		<tr id="trclear">
			<td width="230" height="24" align="left" valign="top" nowrap>
				<input name="E01CONCCR" type="text" value="<%= msg01.getE01CONCCR()%>" size="4" maxlength="2" readonly="readonly">
		  		<input name="E01CONCCD" type="text" value="<%= msg01.getE01CONCCD()%>" size="25" maxlength="25" readonly="readonly"
				></td>
			<td nowrap valign="top" height="24" align="center" width="51">
				<input name="E01PMTBNK" type="text" value="<%= msg01.getE01PMTBNK()%>" size="4" maxlength="2" readonly="readonly"></td>
			<td nowrap valign="top" height="24" align="center" width="61">
				<input name="E01PMTBRN" type="text" onKeyPress="enterInteger()" value="<%= msg01.getE01PMTBRN()%>" size="6" maxlength="3" readonly="readonly" ></td>
			<td nowrap align="center" valign="top" height="24" width="47">
				<input name="E01PMTCCY" type="text" value="<%= msg01.getE01PMTCCY()%>" size="6" maxlength="3" readonly="readonly" ></td>
			<td nowrap align="center" valign="top" height="24" width="128">
				<input name="E01PMTGLN" type="text" onKeyPress="enterInteger()" value="<%= msg01.getE01PMTGLN()%>" size="20" maxlength="16" readonly="readonly"
			></td>
			<td nowrap align="center" valign="top" height="24" width="132">
				<input name="E01PMTACC" type="text" value="<%= msg01.getE01PMTACC()%>" size="18" maxlength="12" readonly="readonly" ></td>
			<td nowrap align="center" valign="top" height="24" width="114">
				<input name="E01PMTCCN" type="text" value="<%= msg01.getE01PMTCCN()%>" size="13" maxlength="8" readonly="readonly"></td>
		</tr>
  </table>



<% } 
   if (msg01.getH01FLGWK3().equals("Y") && 
		(msg01.getE01OPCODE().equals("1") || msg01.getE01OPCODE().equals("6"))) { %>
  
<P><B>Correspondent Bank Credit Account</B></P>
<TABLE class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
  	<TR id="trdark">
		<TD ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="230">Concept</TD>
		<TD NOWRAP VALIGN="top" HEIGHT="24" ALIGN="center" WIDTH="51">Bank</TD>
		<TD NOWRAP VALIGN="top" HEIGHT="24" ALIGN="center" WIDTH="61">Branch</TD>
		<TD NOWRAP ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="47">MDA</TD>
		<TD NOWRAP ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="128">G/L Account</TD>
		<TD NOWRAP ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="132">DDA Account</TD>
		<TD NOWRAP ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="114">Cost Center</TD>
	</TR>
  <tr id="trclear">
    <td width="230" height="24" align="left" valign="top" nowrap>
		<input name="E01CONCBC" type="text" value="<%=msg01.getE01CONCBC()%>" size="4" maxlength="2" readonly="readonly">
		<input name="E01CONCBD" type="text"  value="<%=msg01.getE01CONCBD()%>" size="25" maxlength="25" readonly="readonly"
				></td>
    <td nowrap valign="top" height="24" align="center" width="51">
		<input name="E01CRPBNK" type="text" value="<%=msg01.getE01CRPBNK()%>" size="4" maxlength="2" readonly="readonly"></td>
    <td nowrap valign="top" height="24" align="center" width="61">
		<input name="E01CRPBRN" type="text" onKeyPress="enterInteger()" value="<%=msg01.getE01CRPBRN()%>" size="6" maxlength="3" readonly="readonly" ></td>
    <td nowrap align="center" valign="top" height="24" width="47">
		<input name="E01CRPCCY" type="text" value="<%=msg01.getE01CRPCCY()%>" size="6" maxlength="3" readonly="readonly" ></td>
    <td nowrap align="center" valign="top" height="24" width="128">
		<input name="E01CRPGLN" type="text" onKeyPress="enterInteger()" value="<%=msg01.getE01CRPGLN()%>" size="20" maxlength="16" readonly="readonly"
			></td>
    <td nowrap align="center" valign="top" height="24" width="132">
		<input name="E01CRPACC" type="text" value="<%=msg01.getE01CRPACC()%>" size="18" maxlength="12" readonly="readonly" ></td>
    <td nowrap align="center" valign="top" height="24" width="114">
			<input name="E01CRPCCN" type="text" value="<%=msg01.getE01CRPCCN()%>" size="13" maxlength="8" readonly="readonly"></td>
	</tr>
</table>
<%}%>
<p></p>


<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
	<TR id="trclear">
		<TD align="right">Payment Via :</TD>
		<TD nowrap align="left">
			<SELECT	name="E01PMTVIA" disabled="disabled">
				<OPTION value="">&nbsp;</OPTION>
				<OPTION value="1" <%if (msg01.getE01PMTVIA().equals("1")) { out.print("selected"); }%>>Official Check</OPTION>
				<OPTION value="2" <%if (msg01.getE01PMTVIA().equals("2")) { out.print("selected"); }%>>Retail Account</OPTION>
				<OPTION value="3" <%if (msg01.getE01PMTVIA().equals("3")) { out.print("selected"); }%>>G/L Account</OPTION>
				<OPTION value="5" <%if (msg01.getE01PMTVIA().equals("5")) { out.print("selected"); }%>>Swift</OPTION>
				<OPTION value="6" <%if (msg01.getE01PMTVIA().equals("6")) { out.print("selected"); }%>>FED</OPTION>
			</SELECT>
		</TD>
		<TD nowrap align="right">Swift Format: </TD>
		<TD nowrap align="left">
			<SELECT name="E01SWFFMT" disabled="disabled">
				<OPTION value="">&nbsp;</OPTION>
				<OPTION value="103" <%if (msg01.getE01SWFFMT().equals("103")) { out.print("selected"); }%>>MT103</OPTION>
				<OPTION value="202" <%if (msg01.getE01SWFFMT().equals("202")) { out.print("selected"); }%>>MT202</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id="trdark">
		<TD nowrap align="right"></TD>
		<TD nowrap align="right"></TD>
		<TD nowrap align="right">Beneficiary Bank: </TD>
		<td nowrap align="left">
		  <input type="text" name="E01CRPBID" size="16" maxlength="12" value=<%=msg01.getE01CRPBID()%> readonly></td>
	</TR>
	<tr id="trclear">
		<TD align="right">Debit Commissions to Beneficiary Account: </TD>
		<td nowrap align="left">
			<input type="radio" name="E01DEBFLG" value="Y" <%if (msg01.getE01DEBFLG().equals("Y")) out.print("checked"); %> readonly disabled> Yes
			<input type="radio" name="E01DEBFLG" value="N" <%if (msg01.getE01DEBFLG().equals("N")) out.print("checked"); %> readonly disabled> No				
		</td>
		<TD nowrap align="right">Beneficiary Retail Account :</TD>
		<TD nowrap align="left">
			<INPUT type="text" name="E01LCMBAC" size="20" maxlength="12" value="<%= msg01.getE01LCMBAC() %>" readonly></TD>
	</tr>
	<tr id="trdark">
	  	<TD nowrap align="right">Cancel Remaining Balance: </TD>
	  	<td nowrap align="left">
	  	  <input type="radio" name="E01CANBAL" value="Y" <%if (msg01.getE01CANBAL().equals("Y")) out.print("checked"); %> readonly disabled> Yes
	      <input type="radio" name="E01CANBAL" value="N" <%if (msg01.getE01CANBAL().equals("N")) out.print("checked"); %> readonly disabled> No 
	    </td>
		<td nowrap align="right">Cash Collateral Amount: </td>
		<td nowrap align="left">
		  <input type="text" name="E01CSHAMN" size="18" maxlength="15" readonly></td>
	</tr>
	<tr id="trclear">
		<TD align="right">Correspondent Bank Charges: </TD>
		<td nowrap align="left">
			<input type="text" name="E01DEBCRP" size="18" maxlength="17" value="<%=msg01.getE01DEBCRP()%>" readonly>
		<TD nowrap align="right">Correspondent Charges By: </TD>
		<TD nowrap align="left">
			<SELECT	name="E01CRPPBY" disabled="disabled">
				<OPTION value="">&nbsp;</OPTION>
				<OPTION value="A" <%if (msg01.getE01CRPPBY().equals("A")) { out.print("selected"); }%>>Applicant</OPTION>
				<OPTION value="B" <%if (msg01.getE01CRPPBY().equals("B")) { out.print("selected"); }%>>Beneficiary</OPTION>
			</SELECT>
		</TD>
	</tr>
  </table>

<P><B>Foreign Exchange Rates</B></P>
<TABLE class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
  <TR id="trdark">
			<TD>Currency</TD>
			<TD>Purchase F/X Rate</TD>
			<TD>Sale F/X Rate</TD>
			<TD>Currency</TD>
			<TD>Purchase F/X Rate</TD>
			<TD>Sale F/X Rate</TD>
	</TR>
	<tr>
	    <td><input name="E01FXCCY1" type="text" value="<%=msg01.getE01FXCCY1()%>" size="9" maxlength="3" readonly="readonly"></td>
	    <td><input name="E01FXRPU1" type="text" value="<%=msg01.getE01FXRPU1()%>" size="20" maxlength="11" readonly="readonly"></td>
	    <td><input name="E01FXRSA1" type="text" value="<%=msg01.getE01FXRSA1()%>" size="20" maxlength="11" readonly="readonly"></td>
	    <td><input name="E01FXCCY2" type="text" value="<%=msg01.getE01FXCCY2()%>" size="9" maxlength="3" readonly="readonly"></td>
	    <td><input name="E01FXRPU2" type="text" value="<%=msg01.getE01FXRPU2()%>" size="20" maxlength="11" readonly="readonly"></td>
	    <td><input name="E01FXRSA2" type="text" value="<%=msg01.getE01FXRSA2()%>" size="20" maxlength="11" readonly="readonly"></td>
	</tr>
	<tr>
	    <td><input name="E01FXCCY3" type="text" value="<%=msg01.getE01FXCCY3()%>" size="9" maxlength="3" readonly="readonly"></td>
	    <td><input name="E01FXRPU3" type="text" value="<%=msg01.getE01FXRPU3()%>" size="20" maxlength="11" readonly="readonly"></td>
	    <td><input name="E01FXRSA3" type="text" value="<%=msg01.getE01FXRSA3()%>" size="20" maxlength="11" readonly="readonly"></td>
	    <td><input name="E01FXCCY4" type="text" value="<%=msg01.getE01FXCCY4()%>" size="9" maxlength="3" readonly="readonly"></td>
	    <td><input name="E01FXRPU4" type="text" value="<%=msg01.getE01FXRPU4()%>" size="20" maxlength="11" readonly="readonly"></td>
	    <td><input name="E01FXRSA4" type="text" value="<%=msg01.getE01FXRSA4()%>" size="20" maxlength="11" readonly="readonly"></td>
	</tr>
</table>

<%	int i = 0;	%>

<P><B>Expenses and Commissions</B></P>
<% if(msg01.getH01FLGWK3().equals("Y")) { %>
<TABLE class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
  <TBODY>
  	<TR id="trdark">
		<TD>&nbsp;</TD>
    	<TD colspan="2" align="center"><B>Our</B></TD>
    	<TD colspan="2" align="center"><B>Correspondent Bank</B></TD>
	</TR>
  	<TR id="trdark">
	    <TD nowrap align="left">Commissions</TD>
	    <TD nowrap align="center">Amount</TD>
	    <TD nowrap align="center">By</TD>
	    <TD nowrap align="center">Amount</TD>
	    <TD nowrap align="center">By</TD>
	</TR>
  	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Issuance</TD>
	    <TD align="center"><INPUT name="E01ISSFEE" type="text" id="E01ISSFEE" value="<%=msg01.getE01ISSFEE()%>" readonly="readonly"></TD>
	    <TD align="center">
	    	<SELECT name="E01ISSPBY" disabled="disabled">
				<OPTION value="A" <%if(msg01.getE01ISSPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01ISSPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01ISSPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center"><INPUT name="E01CRPISS" type="text" id="E01CRPISS" value="<%=msg01.getE01CRPISS()%>" readonly="readonly"></TD>
		<TD align="center">
			<SELECT name="E01ISSCPB" disabled="disabled">
    			<% if (msg01.getE01CRPPBY().equals("A")) { %>
					<OPTION value="A" <%if(msg01.getE01ISSCPB().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<% } %>
	    		<% if (msg01.getE01CRPPBY().equals("B")) { %>
					<OPTION value="B" <%if(msg01.getE01ISSCPB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<% } %>
					<OPTION value="W" <%if(msg01.getE01ISSCPB().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD>
		</TR>
	  	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    	<TD align="left">Advise</TD>
	    	<TD align="center"><INPUT name="E01ADVCOM" type="text" value="<%=msg01.getE01ADVCOM()%>" readonly="readonly"></TD>
		    <TD align="center">
		    	<SELECT name="E01ADVPBY" disabled="disabled">
					<OPTION value="A" <%if(msg01.getE01ADVPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
					<OPTION value="B" <%if(msg01.getE01ADVPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
					<OPTION value="W" <%if(msg01.getE01ADVPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
				</SELECT></TD>
		    <TD align="center"><INPUT type="text" name="E01CRPADV" value="<%=msg01.getE01CRPADV()%>" readonly="readonly"></TD>
		    <TD align="center">
		    	<SELECT name="E01ADVCPB" disabled="disabled">
			    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
						<OPTION value="A" <%if(msg01.getE01ADVCPB().equals("A")) out.print("selected");%>>Applicant</OPTION>
					<% } %>
			    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
						<OPTION value="B" <%if(msg01.getE01ADVCPB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
					<% } %>
						<OPTION value="W" <%if(msg01.getE01ADVCPB().equals("W")) out.print("selected");%>>Wave</OPTION>
				</SELECT>
			</TD>
		</TR>
	  <TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Confirmation</TD>
	    <TD align="center"><INPUT type="text" name="E01CNFCOM" value="<%=msg01.getE01CNFCOM()%>" readonly="readonly"></TD>
	    <TD align="center">
	    	<SELECT name="E01CNFPBY" disabled="disabled">
				<OPTION value="A" <%if(msg01.getE01CNFPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01CNFPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01CNFPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center"><INPUT type="text" name="E01CRPCNF" value="<%=msg01.getE01CRPCNF()%>" readonly="readonly"></TD>
		<TD align="center"><SELECT name="E01CNFCPB" disabled="disabled">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01CNFCPB().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01CNFCPB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01CNFCPB().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD>
	</TR>
	  <TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Amendment</TD>
	    <TD align="center"><INPUT type="text" name="E01AMDFEE" value="<%=msg01.getE01AMDFEE()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01AMDPBY" disabled="disabled">
			<OPTION value="A" <%if(msg01.getE01AMDPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<OPTION value="B" <%if(msg01.getE01AMDPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<OPTION value="W" <%if(msg01.getE01AMDPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD>
		    <TD align="center"><INPUT type="text" name="E01CRPAMD" value="<%=msg01.getE01CRPAMD()%>" readonly="readonly"></TD>
		    <TD align="center"><SELECT name="E01AMDCPB" disabled="disabled">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01AMDCPB().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01AMDCPB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01AMDCPB().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD>
	</TR>
<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Advise of Amendment</TD>
	    <TD align="center"><INPUT type="text" name="E01ADVAMF" value="<%=msg01.getE01ADVAMF()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01AAMPBY" disabled="disabled">
			<OPTION value="A" <%if(msg01.getE01AAMPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<OPTION value="B" <%if(msg01.getE01AAMPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<OPTION value="W" <%if(msg01.getE01AAMPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD>
		    <TD align="center"><INPUT type="text" name="E01CRPAAM" value="<%=msg01.getE01CRPAAM()%>" readonly="readonly"></TD>
		    <TD align="center"><SELECT name="E01AAMCPB" disabled="disabled">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01AAMCPB().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01AAMCPB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01AAMCPB().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD>
	</TR>
	  	  <TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Discrepancy</TD>
	    <TD align="center"><INPUT type="text" name="E01DISCOM" value="<%=msg01.getE01DISCOM()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01DISPBY" disabled="disabled">
			<OPTION value="A" <%if(msg01.getE01DISPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<OPTION value="B" <%if(msg01.getE01DISPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<OPTION value="W" <%if(msg01.getE01DISPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD>
		    <TD align="center"><INPUT type="text" name="E01CRPDIS" value="<%=msg01.getE01CRPDIS()%>" readonly="readonly"></TD>
		    <TD align="center"><SELECT name="E01DISCPB" disabled="disabled">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01DISCPB().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01DISCPB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01DISCPB().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD>
		</TR>
	  <TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Extension of Validity</TD>
	    <TD align="center"><INPUT type="text" name="E01EOVCOM" value="<%=msg01.getE01EOVCOM()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01EOVPBY" disabled="disabled">
			<OPTION value="A" <%if(msg01.getE01EOVPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<OPTION value="B" <%if(msg01.getE01EOVPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<OPTION value="W" <%if(msg01.getE01EOVPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD>
		    <TD align="center"><INPUT type="text" name="E01CRPEOV" value="<%=msg01.getE01CRPEOV()%>" readonly="readonly"></TD>
		    <TD align="center"><SELECT name="E01EOVCPB" disabled="disabled">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01EOVCPB().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01EOVCPB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01EOVCPB().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD>
	</TR>
	  <TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Portes</TD>
	    <TD align="center"><INPUT type="text" name="E01POSTAM" value="<%=msg01.getE01POSTAM()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01POSPBY" disabled="disabled">
			<OPTION value="A" <%if(msg01.getE01POSPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<OPTION value="B" <%if(msg01.getE01POSPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<OPTION value="W" <%if(msg01.getE01POSPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD>
		    <TD align="center"><INPUT type="text" name="E01CRPPOS" value="<%=msg01.getE01CRPPOS()%>" readonly="readonly"></TD>
		    <TD align="center"><SELECT name="E01POSCPB" disabled="disabled">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01POSCPB().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01POSCPB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01POSCPB().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD>
	</TR>
<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Courier</TD>
	    <TD align="center"><INPUT type="text" name="E01COURAM" value="<%=msg01.getE01COURAM()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01COUPBY" disabled="disabled">
			<OPTION value="A" <%if(msg01.getE01COUPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<OPTION value="B" <%if(msg01.getE01COUPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<OPTION value="W" <%if(msg01.getE01COUPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD>
		    <TD align="center"><INPUT type="text" name="E01CRPCOU" value="<%=msg01.getE01CRPCOU()%>" readonly="readonly"></TD>
		    <TD align="center"><SELECT name="E01COUCPB" disabled="disabled">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01COUCPB().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01COUCPB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01COUCPB().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD>
	</TR>
	  	  <TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Swift</TD>
	    <TD align="center"><INPUT type="text" name="E01SWFFEE" value="<%=msg01.getE01SWFFEE()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01SWFPBY" disabled="disabled">
			<OPTION value="A" <%if(msg01.getE01SWFPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<OPTION value="B" <%if(msg01.getE01SWFPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<OPTION value="W" <%if(msg01.getE01SWFPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD>
		    <TD align="center"><INPUT type="text" name="E01CRPSWF" value="<%=msg01.getE01CRPSWF()%>" readonly="readonly"></TD>
		    <TD align="center"><SELECT name="E01SWFCPB" disabled="disabled">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01SWFCPB().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01SWFCPB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01SWFCPB().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD>
		</TR>
	  <TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Additional Swift</TD>
	    <TD align="center"><INPUT type="text" name="E01TLXFEE" value="<%=msg01.getE01TLXFEE()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01TLXPBY" disabled="disabled">
			<OPTION value="A" <%if(msg01.getE01TLXPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<OPTION value="B" <%if(msg01.getE01TLXPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<OPTION value="W" <%if(msg01.getE01TLXPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD>
		    <TD align="center"><INPUT type="text" name="E01CRPTLX" value="<%=msg01.getE01CRPTLX()%>" readonly="readonly"></TD>
		    <TD align="center"><SELECT name="E01TLXCPB" disabled="disabled">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01TLXCPB().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01TLXCPB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01TLXCPB().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD>
	</TR>
	  <TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Cancellation</TD>
	    <TD align="center"><INPUT type="text" name="E01CANFEE" value="<%=msg01.getE01CANFEE()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01CANPBY" disabled="disabled">
			<OPTION value="A" <%if(msg01.getE01CANPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<OPTION value="B" <%if(msg01.getE01CANPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<OPTION value="W" <%if(msg01.getE01CANPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD>
		    <TD align="center"><INPUT type="text" name="E01CRPCAN" value="<%=msg01.getE01CRPCAN()%>" readonly="readonly"></TD>
		    <TD align="center"><SELECT name="E01CANCPB" disabled="disabled">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01CANCPB().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01CANCPB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01CANCPB().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD>
	</TR>
<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Payment</TD>
	    <TD align="center"><INPUT type="text" name="E01PAYCOM" value="<%=msg01.getE01PAYCOM()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01PMCPBY" disabled="disabled">
			<OPTION value="A" <%if(msg01.getE01PMCPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<OPTION value="B" <%if(msg01.getE01PMCPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<OPTION value="W" <%if(msg01.getE01PMCPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD>
		    <TD align="center"><INPUT type="text" name="E01CRPPAY" value="<%=msg01.getE01CRPPAY()%>" readonly="readonly"></TD>
		    <TD align="center"><SELECT name="E01PMCCPB" disabled="disabled">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01PMCCPB().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01PMCCPB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01PMCCPB().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD>
	</TR>
	  	  <TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Funds Transfer</TD>
	    <TD align="center"><INPUT type="text" name="E01WTRCOM" value="<%=msg01.getE01WTRCOM()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01WTRPBY" disabled="disabled">
			<OPTION value="A" <%if(msg01.getE01WTRPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<OPTION value="B" <%if(msg01.getE01WTRPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<OPTION value="W" <%if(msg01.getE01WTRPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD>
		    <TD align="center"><INPUT type="text" name="E01CRPWTR" value="<%=msg01.getE01CRPWTR()%>" readonly="readonly"></TD>
		    <TD align="center"><SELECT name="E01WTRCPB" disabled="disabled">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01WTRCPB().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01WTRCPB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01WTRCPB().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD>
		</TR>
	  <TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Reimbursment</TD>
	    <TD align="center"><INPUT type="text" name="E01RMBCOM" value="<%=msg01.getE01RMBCOM()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01RMBPBY" disabled="disabled">
			<OPTION value="A" <%if(msg01.getE01RMBPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<OPTION value="B" <%if(msg01.getE01RMBPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<OPTION value="W" <%if(msg01.getE01RMBPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD>
		    <TD align="center"><INPUT type="text" name="E01CRPRMB" value="<%=msg01.getE01CRPRMB()%>" readonly="readonly"></TD>
		    <TD align="center"><SELECT name="E01RMBCPB" disabled="disabled">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01RMBCPB().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01RMBCPB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01RMBCPB().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD>
	</TR>
<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">	<% if(msg01.getE01LCCFL1().equals("Y"))  out.print("Convenio ALADI");
	    					else out.print("Stamps");%>
	    </TD>
	    <TD align="center"><INPUT type="text" name="E01ALDCOM" value="<%=msg01.getE01ALDCOM()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01ALDPBY" disabled="disabled">
			<OPTION value="A" <%if(msg01.getE01ALDPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<OPTION value="B" <%if(msg01.getE01ALDPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<OPTION value="W" <%if(msg01.getE01ALDPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD>
		    <TD align="center"><INPUT type="text" name="E01CRPALD" value="<%=msg01.getE01CRPALD()%>" readonly="readonly"></TD>
		    <TD align="center"><SELECT name="E01ALDCPB" disabled="disabled">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01ALDCPB().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01ALDCPB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01ALDCPB().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD>
	</TR>
	  	  <TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Agent</TD>
	    <TD align="center"><INPUT type="text" name="E01BRKCOM" value="<%=msg01.getE01BRKCOM()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01BRKPBY" disabled="disabled">
			<OPTION value="A" <%if(msg01.getE01BRKPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<OPTION value="B" <%if(msg01.getE01BRKPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<OPTION value="W" <%if(msg01.getE01BRKPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD>
		    <TD align="center">&nbsp;</TD><TD align="center">&nbsp;</TD>
		</TR>
<%	if (userPO.getHeader1().equals("18")){%>
	  <TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Interest</TD>
	    <TD align="center"><INPUT type="text" name="E01INTCHG" value="<%=msg01.getE01INTCHG()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01INTPBY" disabled="disabled">
			<OPTION value="A" <%if(msg01.getE01INTPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<OPTION value="B" <%if(msg01.getE01INTPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<OPTION value="W" <%if(msg01.getE01INTPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD>
		    <TD align="center">&nbsp;</TD><TD align="center">&nbsp;</TD>
	</TR>
<%}%>
</TBODY></TABLE>
<% } else { %>
<TABLE class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
  <TBODY><TR id="trdark">
			<TD>&nbsp;</TD>
    <TD colspan="2" align="center"><B>Our</B></TD>
	</TR>
  <TR id="trdark">
    <TD nowrap align="left">Commissions</TD>
    <TD nowrap align="center">Amount</TD>
    <TD nowrap align="center">By</TD></TR>
	  <TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Issuance</TD>
	    <TD align="center"><INPUT name="E01ISSFEE" type="text" id="E01ISSFEE" value="<%=msg01.getE01ISSFEE()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01ISSPBY" disabled="disabled">
			<OPTION value="A" <%if(msg01.getE01ISSPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<OPTION value="B" <%if(msg01.getE01ISSPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<OPTION value="W" <%if(msg01.getE01ISSPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD></TR>
	  	  <TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Advise</TD>
	    <TD align="center"><INPUT name="E01ADVCOM" type="text" value="<%=msg01.getE01ADVCOM()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01ADVPBY" disabled="disabled">
			<OPTION value="A" <%if(msg01.getE01ADVPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<OPTION value="B" <%if(msg01.getE01ADVPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<OPTION value="W" <%if(msg01.getE01ADVPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD></TR>
	  <TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Confirmaation</TD>
	    <TD align="center"><INPUT type="text" name="E01CNFCOM" value="<%=msg01.getE01CNFCOM()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01CNFPBY" disabled="disabled">
			<OPTION value="A" <%if(msg01.getE01CNFPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<OPTION value="B" <%if(msg01.getE01CNFPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<OPTION value="W" <%if(msg01.getE01CNFPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD></TR>
	  <TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Amendment</TD>
	    <TD align="center"><INPUT type="text" name="E01AMDFEE" value="<%=msg01.getE01AMDFEE()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01AMDPBY" disabled="disabled">
			<OPTION value="A" <%if(msg01.getE01AMDPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<OPTION value="B" <%if(msg01.getE01AMDPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<OPTION value="W" <%if(msg01.getE01AMDPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD></TR>
<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Advise of Amendment</TD>
	    <TD align="center"><INPUT type="text" name="E01ADVAMF" value="<%=msg01.getE01ADVAMF()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01AAMPBY" disabled="disabled">
			<OPTION value="A" <%if(msg01.getE01AAMPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<OPTION value="B" <%if(msg01.getE01AAMPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<OPTION value="W" <%if(msg01.getE01AAMPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD></TR>
	  	  <TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Discrepancy</TD>
	    <TD align="center"><INPUT type="text" name="E01DISCOM" value="<%=msg01.getE01DISCOM()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01DISPBY" disabled="disabled">
			<OPTION value="A" <%if(msg01.getE01DISPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<OPTION value="B" <%if(msg01.getE01DISPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<OPTION value="W" <%if(msg01.getE01DISPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD></TR>
	  <TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Extension of Validity</TD>
	    <TD align="center"><INPUT type="text" name="E01EOVCOM" value="<%=msg01.getE01EOVCOM()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01EOVPBY" disabled="disabled">
			<OPTION value="A" <%if(msg01.getE01EOVPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<OPTION value="B" <%if(msg01.getE01EOVPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<OPTION value="W" <%if(msg01.getE01EOVPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD></TR>
	  <TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Portes</TD>
	    <TD align="center"><INPUT type="text" name="E01POSTAM" value="<%=msg01.getE01POSTAM()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01POSPBY" disabled="disabled">
			<OPTION value="A" <%if(msg01.getE01POSPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<OPTION value="B" <%if(msg01.getE01POSPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<OPTION value="W" <%if(msg01.getE01POSPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD></TR>
<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Courier</TD>
	    <TD align="center"><INPUT type="text" name="E01COURAM" value="<%=msg01.getE01COURAM()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01COUPBY" disabled="disabled">
			<OPTION value="A" <%if(msg01.getE01COUPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<OPTION value="B" <%if(msg01.getE01COUPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<OPTION value="W" <%if(msg01.getE01COUPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD></TR>
	  	  <TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Swift</TD>
	    <TD align="center"><INPUT type="text" name="E01SWFFEE" value="<%=msg01.getE01SWFFEE()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01SWFPBY" disabled="disabled">
			<OPTION value="A" <%if(msg01.getE01SWFPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<OPTION value="B" <%if(msg01.getE01SWFPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<OPTION value="W" <%if(msg01.getE01SWFPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD></TR>
	  <TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Additional Swift</TD>
	    <TD align="center"><INPUT type="text" name="E01TLXFEE" value="<%=msg01.getE01TLXFEE()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01TLXPBY" disabled="disabled">
			<OPTION value="A" <%if(msg01.getE01TLXPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<OPTION value="B" <%if(msg01.getE01TLXPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<OPTION value="W" <%if(msg01.getE01TLXPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD></TR>
	  <TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Cancellation</TD>
	    <TD align="center"><INPUT type="text" name="E01CANFEE" value="<%=msg01.getE01CANFEE()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01CANPBY" disabled="disabled">
			<OPTION value="A" <%if(msg01.getE01CANPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<OPTION value="B" <%if(msg01.getE01CANPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<OPTION value="W" <%if(msg01.getE01CANPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD></TR>
<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Payment</TD>
	    <TD align="center"><INPUT type="text" name="E01PAYCOM" value="<%=msg01.getE01PAYCOM()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01PMCPBY" disabled="disabled">
			<OPTION value="A" <%if(msg01.getE01PMCPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<OPTION value="B" <%if(msg01.getE01PMCPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<OPTION value="W" <%if(msg01.getE01PMCPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD></TR>
	  	  <TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Funds Transfer</TD>
	    <TD align="center"><INPUT type="text" name="E01WTRCOM" value="<%=msg01.getE01WTRCOM()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01WTRPBY" disabled="disabled">
			<OPTION value="A" <%if(msg01.getE01WTRPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<OPTION value="B" <%if(msg01.getE01WTRPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<OPTION value="W" <%if(msg01.getE01WTRPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD></TR>
	  <TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Reimbursment</TD>
	    <TD align="center"><INPUT type="text" name="E01RMBCOM" value="<%=msg01.getE01RMBCOM()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01RMBPBY" disabled="disabled">
			<OPTION value="A" <%if(msg01.getE01RMBPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<OPTION value="B" <%if(msg01.getE01RMBPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<OPTION value="W" <%if(msg01.getE01RMBPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD></TR>
<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">	<% if(msg01.getE01LCCFL1().equals("Y"))  out.print("Convenio ALADI");
	    					else out.print("Stamps");%>
	    </TD>
	    <TD align="center"><INPUT type="text" name="E01ALDCOM" value="<%=msg01.getE01ALDCOM()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01ALDPBY" disabled="disabled">
			<OPTION value="A" <%if(msg01.getE01ALDPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<OPTION value="B" <%if(msg01.getE01ALDPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<OPTION value="W" <%if(msg01.getE01ALDPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD></TR>
	  	  <TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Agent</TD>
	    <TD align="center"><INPUT type="text" name="E01BRKCOM" value="<%=msg01.getE01BRKCOM()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01BRKPBY" disabled="disabled">
			<OPTION value="A" <%if(msg01.getE01BRKPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<OPTION value="B" <%if(msg01.getE01BRKPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<OPTION value="W" <%if(msg01.getE01BRKPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD></TR>
<%	if (userPO.getHeader1().equals("18")){%>
	  <TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Interest</TD>
	    <TD align="center"><INPUT type="text" name="E01INTCHG" value="<%=msg01.getE01INTCHG()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01INTPBY" disabled="disabled">
			<OPTION value="A" <%if(msg01.getE01INTPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<OPTION value="B" <%if(msg01.getE01INTPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<OPTION value="W" <%if(msg01.getE01INTPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD></TR>
<%}%>
	</TBODY>
</TABLE>
<% } %>

</form>
</body>
</html>
