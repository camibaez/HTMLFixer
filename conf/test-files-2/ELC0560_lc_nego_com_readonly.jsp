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
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }

%>

</head>

<body>

<H3 ALIGN="center">Letter of Credit Negotiation/Payment [Commission Only]
	<IMG SRC="<%=request.getContextPath()%>/images/e_ibs.gif" ALIGN="left" NAME="EIBS_GIF" ALT="lc_nego_com_readonly.jsp, ELC0560"></H3>
<HR SIZE="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0560" >
<input name="SCREEN" type="HIDDEN" value="3" readonly="readonly">

<TABLE class="tableinfo">
	<TR bgcolor="#ffffff">
        <TD nowrap height="79" width="100%">
        	<TABLE cellspacing="0" cellpadding="2" width="100%" border="0">
	            <TR ID="trdark">
	              <TD ALIGN="left" VALIGN="top" HEIGHT="29">Type of Negotiation:</TD>
	              <TD NOWRAP VALIGN="top" HEIGHT="29"><INPUT TYPE="text" NAME="E01OPCODE" SIZE="4" MAXLENGTH="1" VALUE="<%= msg01.getE01OPCODE()%>" READONLY>
	                  <INPUT TYPE="text" NAME="E01OPCDSC" SIZE="31" MAXLENGTH="30" VALUE="<%= msg01.getE01OPCDSC()%>" READONLY></TD>
	              <TD NOWRAP ALIGN="left" VALIGN="top" HEIGHT="29">Product:</TD>
	              <TD NOWRAP ALIGN="left" VALIGN="top" HEIGHT="29"><INPUT type="text" name="E01LCMPRO" size="8" maxlength="8" value="<%= msg01.getE01LCMPRO()%>" readonly></TD>
	            </TR>
	            <TR ID="trclear">
	              <TD ALIGN="left" VALIGN="top" HEIGHT="24" WIDTH="128">Letter of Credit ID:</TD>
	              <TD NOWRAP VALIGN="top" HEIGHT="24" WIDTH="284"><INPUT TYPE="text" NAME="E01LCRNUM" SIZE="23" MAXLENGTH="12" VALUE="<%= msg01.getE01LCRNUM()%>" READONLY></TD>
	              <TD NOWRAP ALIGN="left" VALIGN="top" HEIGHT="24" WIDTH="56">Currency:</TD>
	              <TD NOWRAP ALIGN="left" VALIGN="top" HEIGHT="24" WIDTH="291"><INPUT TYPE="text" NAME="E01LCMCCY" SIZE="8" MAXLENGTH="3" VALUE="<%= msg01.getE01LCMCCY()%>" READONLY>
	                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Amount:
	                <INPUT type="text" name="E01DRWAMN" size="18" maxlength="15" value="<%= msg01.getE01DRWAMN()%>" readonly>
	              </TD>
	            </TR>
	            <TR id="trdark">
	              <TD align="left" valign="top" height="24">Customer:</TD>
	              <TD nowrap valign="top" height="24" align="left"><INPUT type="text" name="E01LCMCUN" size="20" maxlength="9" value="<%= msg01.getE01LCMCUN()%>" readonly></TD>
	              <TD nowrap align="left" valign="top" height="24">Name:</TD>
	              <TD nowrap align="left" valign="top" height="24"><INPUT type="text" name="E01CUSNA1" size="46" maxlength="45" value="<%= msg01.getE01CUSNA1()%>" readonly></TD>
	            </TR>
			</TABLE>
		</TD>
    </TR>
</TABLE>

<P><B>Debit Account Commissions </B></P>
<TABLE class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
		<TR ID="trdark">
			<TD ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="230">Concept</TD>
			<TD NOWRAP VALIGN="top" HEIGHT="24" ALIGN="center" WIDTH="51">Bank</TD>
			<TD NOWRAP VALIGN="top" HEIGHT="24" ALIGN="center" WIDTH="61">Branch</TD>
			<TD NOWRAP ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="47">MDA</TD>
			<TD NOWRAP ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="128">G/L Account</TD>
			<TD NOWRAP ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="132">DDA Account</TD>
			<TD NOWRAP ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="114">Cost Center</TD>
		</TR>
        <tr id="trclear">
           	<td width="230" height="24" align="left"  nowrap>
				<input name="E01CONDCO" type="text" value="<%=msg01.getE01CONDCO()%>" size="4" maxlength="2" readonly="readonly">
             	<input name="E01CONDCB" type="text" value="<%=msg01.getE01CONDCB()%>" size="25" maxlength="25" readonly="readonly">
			</td>
           	<td nowrap  height="24" align="center" width="51">
				<input name="E01DEBBK2" type="text" value="<%=msg01.getE01DEBBK2()%>" size="4" maxlength="2" readonly="readonly"></td>
           	<td nowrap  height="24" align="center" width="61">
				<input name="E01DEBBR2" type="text" onKeyPress="enterInteger()" value="<%=msg01.getE01DEBBR2()%>" size="6" maxlength="3" readonly="readonly"></td>
           	<td nowrap align="center"  height="24" width="47">
				<input name="E01DEBCY2" type="text" value="<%=msg01.getE01DEBCY2()%>" size="6" maxlength="3" readonly="readonly"></td>
           	<td nowrap align="center"  height="24" width="128">
				<input name="E01DEBGL2" type="text" value="<%=msg01.getE01DEBGL2()%>" size="20" maxlength="16" readonly="readonly">
			</td>
           	<td nowrap align="center"  height="24" width="132">
				<input name="E01DEBAC2" type="text" value="<%=msg01.getE01DEBAC2()%>" size="18" maxlength="12" readonly="readonly"></td>
           	<td nowrap align="center"  height="24" width="114">
				<input name="E01DEBCC2" type="text" value="<%=msg01.getE01DEBCC2()%>" size="13" maxlength="8" readonly="readonly"></td>
		</tr>
</table>


<% if(msg01.getH01FLGWK3().equals("Y")){ %>
<P><B> Correspondent Bank Credit Account </B></P>
<TABLE class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
		<TR ID="trdark">
			<TD ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="230">Concept</TD>
			<TD NOWRAP VALIGN="top" HEIGHT="24" ALIGN="center" WIDTH="51">Bank</TD>
			<TD NOWRAP VALIGN="top" HEIGHT="24" ALIGN="center" WIDTH="61">Branch</TD>
			<TD NOWRAP ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="47">MDA</TD>
			<TD NOWRAP ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="128">G/L Account</TD>
			<TD NOWRAP ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="132">DDA Account</TD>
			<TD NOWRAP ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="114">Cost Center</TD>
		</TR>
  	<tr id="trclear">
    	<td width="230" height="24" align="left"  nowrap>
			<input name="E01CONCBC" type="text" value="<%=msg01.getE01CONCBC()%>" size="4" maxlength="2" readonly="readonly">
			<input name="E01CONCBD" type="text"  value="<%=msg01.getE01CONCBD()%>" size="25" maxlength="25" readonly="readonly">
		</td>
    	<td nowrap  height="24" align="center" width="51">
			<input name="E01CRPBNK" type="text" value="<%=msg01.getE01CRPBNK()%>" size="4" maxlength="2" readonly="readonly"></td>
    	<td nowrap  height="24" align="center" width="61">
			<input name="E01CRPBRN" type="text" onKeyPress="enterInteger()" value="<%=msg01.getE01CRPBRN()%>" size="6" maxlength="3" readonly="readonly"></td>
    	<td nowrap align="center"  height="24" width="47">
			<input name="E01CRPCCY" type="text" value="<%=msg01.getE01CRPCCY()%>" size="6" maxlength="3" readonly="readonly"></td>
    	<td nowrap align="center"  height="24" width="128">
			<input name="E01CRPGLN" type="text" onKeyPress="enterInteger()" value="<%=msg01.getE01CRPGLN()%>" size="20" maxlength="16" readonly="readonly"></td>
    	<td nowrap align="center"  height="24" width="132">
			<input name="E01CRPACC" type="text" value="<%=msg01.getE01CRPACC()%>" size="18" maxlength="12" readonly="readonly" ></td>
    	<td nowrap align="center"  height="24" width="114">
			<input name="E01CRPCCN" type="text" value="<%=msg01.getE01CRPCCN()%>" size="13" maxlength="8" readonly="readonly"></td>
	</tr>
</table>
<% } %>

<p></p>

<TABLE class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
	
	<TR id="trclear">
		<TD align="right" height="24" width="233">Commission Debit to Beneficiary Account :</TD>
		<TD nowrap  align="left" width="115">
			<INPUT type="radio" name="E01DEBFLG" value="Y" <%if (msg01.getE01DEBFLG().equals("Y")) out.print("checked"); %> disabled="disabled"> Yes
			<INPUT type="radio" name="E01DEBFLG" value="N" <%if (msg01.getE01DEBFLG().equals("N")) out.print("checked"); %> disabled="disabled"> No				
		</TD>
		<TD nowrap align="right" height="24" width="170">Beneficiary Retail Account :</TD>
		<TD nowrap align="left"  height="24" width="160">
			<INPUT type="text" name="E01LCMBAC" size="16" maxlength="12" value="<%= msg01.getE01LCMBAC() %>" readonly="readonly"></TD>
	</TR>
	<TR id="trclear">
		<TD align="right">Correspondent Bank Debit Amount :</TD>
		<TD nowrap align="left"><INPUT type="text" name="E01DEBCRP" size="18" maxlength="17" value="<%=msg01.getE01DEBCRP()%>" readonly="readonly">	</TD>
		<TD nowrap align="right">Charges By :</TD>
		<TD nowrap align="left">
			<SELECT name="E01CRPPBY" disabled="disabled">
				<OPTION value="">&nbsp;</OPTION>
				<OPTION value="A"
					<%if (msg01.getE01CRPPBY().equals("A")) { out.print("selected"); }%>>Applicant</OPTION>
				<OPTION value="B"
					<%if (msg01.getE01CRPPBY().equals("B")) { out.print("selected"); }%>>Beneficiary</OPTION>
			</SELECT>
		</TD>
	</TR>
</TABLE>

<P><B>Foreing Exchange Types</B></P>
<TABLE class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
  	<TR id="trdark">
			<TD>Currency</TD>
			<TD>T/C Purchases</TD>
			<TD>T/C Sales</TD>
			<TD>Currency</TD>
			<TD>T/C Purchases</TD>
			<TD>T/C Sales</TD>
	</TR>
	<tr id="trclear">
	    <td><input name="E01FXCCY1" type="text" value="<%=msg01.getE01FXCCY1()%>" size="9" maxlength="3" readonly="readonly"></td>
	    <td><input name="E01FXRPU1" type="text" value="<%=msg01.getE01FXRPU1()%>" size="20" maxlength="11" readonly="readonly"></td>
	    <td><input name="E01FXRSA1" type="text" value="<%=msg01.getE01FXRSA1()%>" size="20" maxlength="11" readonly="readonly"></td>
	    <td><input name="E01FXCCY2" type="text" value="<%=msg01.getE01FXCCY2()%>" size="9" maxlength="3" readonly="readonly"></td>
	    <td><input name="E01FXRPU2" type="text" value="<%=msg01.getE01FXRPU2()%>" size="20" maxlength="11" readonly="readonly"></td>
	    <td><input name="E01FXRSA2" type="text" value="<%=msg01.getE01FXRSA2()%>" size="20" maxlength="11" readonly="readonly"></td>
	</tr>
	<tr id="trclear">
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

<% if(msg01.getH01FLGWK3().equals("Y")){ %>
<TABLE class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
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
  	<TR id="<%= (i++ %2 == 0 ? "trclear" : "trdark") %>">
	    <TD align="left">Issuance</TD>
	    <TD align="center"><INPUT name="E01ISSFEE" type="text" id="E01ISSFEE" value="<%=msg01.getE01ISSFEE()%>" readonly="readonly"></TD>
	    <TD align="center">
	    	<SELECT name="E01ISSPBY" disabled="disabled">
				<OPTION value="A" <%if(msg01.getE01ISSPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01ISSPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01ISSPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD>
		    <TD align="center"><INPUT name="E01CRPISS" type="text" id="E01CRPISS" value="<%=msg01.getE01CRPISS()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01ISSCPB" disabled="disabled">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01ISSCPB().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01ISSCPB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01ISSCPB().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id="<%= (i++ %2 == 0 ? "trclear" : "trdark") %>">
	    <TD align="left">Advise</TD>
	    <TD align="center"><INPUT name="E01ADVCOM" type="text" value="<%=msg01.getE01ADVCOM()%>" readonly="readonly"></TD>
	    <TD align="center">
	    	<SELECT name="E01ADVPBY" disabled="disabled">
				<OPTION value="A" <%if(msg01.getE01ADVPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01ADVPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01ADVPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center"><INPUT type="text" name="E01CRPADV" value="<%=msg01.getE01CRPADV()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01ADVCPB" disabled="disabled">
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
	<TR id="<%= (i++ %2 == 0 ? "trclear" : "trdark") %>">
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
			</SELECT>
		</TD>
	</TR>
	<TR id="<%= (i++ %2 == 0 ? "trclear" : "trdark") %>">
	    <TD align="left">Amendment</TD>
	    <TD align="center"><INPUT type="text" name="E01AMDFEE" value="<%=msg01.getE01AMDFEE()%>" readonly="readonly"></TD>
	    <TD align="center">
	    	<SELECT name="E01AMDPBY" disabled="disabled">
				<OPTION value="A" <%if(msg01.getE01AMDPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01AMDPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01AMDPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center"><INPUT type="text" name="E01CRPAMD" value="<%=msg01.getE01CRPAMD()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01AMDCPB" disabled="disabled">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01AMDCPB().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01AMDCPB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01AMDCPB().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id="<%= (i++ %2 == 0 ? "trclear" : "trdark") %>">
	    <TD align="left">Advise of Amendment</TD>
	    <TD align="center"><INPUT type="text" name="E01ADVAMF" value="<%=msg01.getE01ADVAMF()%>" readonly="readonly"></TD>
	    <TD align="center">
	    	<SELECT name="E01AAMPBY" disabled="disabled">
				<OPTION value="A" <%if(msg01.getE01AAMPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01AAMPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01AAMPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center"><INPUT type="text" name="E01CRPAAM" value="<%=msg01.getE01CRPAAM()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01AAMCPB" disabled="disabled">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01AAMCPB().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01AAMCPB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01AAMCPB().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id="<%= (i++ %2 == 0 ? "trclear" : "trdark") %>">
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
	  <TR id="<%= (i++ %2 == 0 ? "trclear" : "trdark") %>">
	    <TD align="left">Extension of Validity</TD>
	    <TD align="center"><INPUT type="text" name="E01EOVCOM" value="<%=msg01.getE01EOVCOM()%>" readonly="readonly"></TD>
	    <TD align="center">
	    	<SELECT name="E01EOVPBY" disabled="disabled">
				<OPTION value="A" <%if(msg01.getE01EOVPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01EOVPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01EOVPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center"><INPUT type="text" name="E01CRPEOV" value="<%=msg01.getE01CRPEOV()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01EOVCPB" disabled="disabled">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01EOVCPB().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01EOVCPB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01EOVCPB().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
	</TR>
	  <TR id="<%= (i++ %2 == 0 ? "trclear" : "trdark") %>">
	    <TD align="left">Portes</TD>
	    <TD align="center"><INPUT type="text" name="E01POSTAM" value="<%=msg01.getE01POSTAM()%>" readonly="readonly"></TD>
	    <TD align="center">
	    	<SELECT name="E01POSPBY" disabled="disabled">
				<OPTION value="A" <%if(msg01.getE01POSPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01POSPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01POSPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center"><INPUT type="text" name="E01CRPPOS" value="<%=msg01.getE01CRPPOS()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01POSCPB" disabled="disabled">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01POSCPB().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01POSCPB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01POSCPB().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id="<%= (i++ %2 == 0 ? "trclear" : "trdark") %>">
	    <TD align="left">Courier</TD>
	    <TD align="center"><INPUT type="text" name="E01COURAM" value="<%=msg01.getE01COURAM()%>" readonly="readonly"></TD>
	    <TD align="center">
	    	<SELECT name="E01COUPBY"  disabled="disabled">
				<OPTION value="A" <%if(msg01.getE01COUPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01COUPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01COUPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center"><INPUT type="text" name="E01CRPCOU" value="<%=msg01.getE01CRPCOU()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01COUCPB" disabled="disabled">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01COUCPB().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01COUCPB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01COUCPB().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id="<%= (i++ %2 == 0 ? "trclear" : "trdark") %>">
	    <TD align="left">Swift</TD>
	    <TD align="center"><INPUT type="text" name="E01SWFFEE" value="<%=msg01.getE01SWFFEE()%>" readonly="readonly"></TD>
	    <TD align="center">
	    	<SELECT name="E01SWFPBY" disabled="disabled">
				<OPTION value="A" <%if(msg01.getE01SWFPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01SWFPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01SWFPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center"><INPUT type="text" name="E01CRPSWF" value="<%=msg01.getE01CRPSWF()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01SWFCPB" disabled="disabled">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01SWFCPB().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01SWFCPB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01SWFCPB().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id="<%= (i++ %2 == 0 ? "trclear" : "trdark") %>">
	    <TD align="left">Additional Swift</TD>
	    <TD align="center"><INPUT type="text" name="E01TLXFEE" value="<%=msg01.getE01TLXFEE()%>" readonly="readonly"></TD>
	    <TD align="center">
	    	<SELECT name="E01TLXPBY" disabled="disabled">
				<OPTION value="A" <%if(msg01.getE01TLXPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01TLXPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01TLXPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center"><INPUT type="text" name="E01CRPTLX" value="<%=msg01.getE01CRPTLX()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01TLXCPB" disabled="disabled">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01TLXCPB().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01TLXCPB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01TLXCPB().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
	</TR>
  	<TR id="<%= (i++ %2 == 0 ? "trclear" : "trdark") %>">
	    <TD align="left">Cancellation</TD>
	    <TD align="center"><INPUT type="text" name="E01CANFEE" value="<%=msg01.getE01CANFEE()%>" readonly="readonly"></TD>
	    <TD align="center">
	    	<SELECT name="E01CANPBY" disabled="disabled">
				<OPTION value="A" <%if(msg01.getE01CANPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01CANPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01CANPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center"><INPUT type="text" name="E01CRPCAN" value="<%=msg01.getE01CRPCAN()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01CANCPB" disabled="disabled">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01CANCPB().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01CANCPB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01CANCPB().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id="<%= (i++ %2 == 0 ? "trclear" : "trdark") %>">
	    <TD align="left">Payment</TD>
	    <TD align="center"><INPUT type="text" name="E01PAYCOM" value="<%=msg01.getE01PAYCOM()%>" readonly="readonly"></TD>
	    <TD align="center">
	    	<SELECT name="E01PMCPBY" disabled="disabled">
				<OPTION value="A" <%if(msg01.getE01PMCPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01PMCPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01PMCPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center"><INPUT type="text" name="E01CRPPAY" value="<%=msg01.getE01CRPPAY()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01PMCCPB" disabled="disabled">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01PMCCPB().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01PMCCPB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01PMCCPB().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
		<TD align="left">Acceptance</TD><TD align="center">
		<INPUT type="text" name="E01ACPCOM" value="<%=msg01.getE01ACPCOM()%>" readonly="readonly"></TD>
		<TD align="center">
			<SELECT name="E01ACCPBY" disabled="disabled">
				<OPTION value="A" <%if(msg01.getE01ACCPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01ACCPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01ACCPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center"><INPUT type="text" name="E01CRPACP" value="<%=msg01.getE01CRPACP()%>" readonly="readonly"></TD>
		<TD align="center"><SELECT name="E01ACCCPB" disabled="disabled">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01ACCCPB().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01ACCCPB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01ACCCPB().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>			
	</TR>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
		<TD align="left">Deferred Payment</TD>
		<TD align="center"><INPUT type="text" name="E01DFPFEE" value="<%=msg01.getE01DFPFEE()%>" readonly="readonly"></TD>
		<TD align="center">
			<SELECT name="E01DFPPBY" disabled="disabled">
				<OPTION value="A" <%if(msg01.getE01DFPPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01DFPPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01DFPPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center"><INPUT type="text" name="E01CRPDFP" value="<%=msg01.getE01CRPDFP()%>" readonly="readonly"></TD>
		<TD align="center"><SELECT name="E01DFPCPB" disabled="disabled">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01DFPCPB().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01DFPCPB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01DFPCPB().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>			
	</TR>
  	<TR id="<%= (i++ %2 == 0 ? "trclear" : "trdark") %>">
	    <TD align="left">Funds Transfer</TD>
	    <TD align="center"><INPUT type="text" name="E01WTRCOM" value="<%=msg01.getE01WTRCOM()%>" readonly="readonly"></TD>
	    <TD align="center">
	    	<SELECT name="E01WTRPBY" disabled="disabled">
				<OPTION value="A" <%if(msg01.getE01WTRPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01WTRPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01WTRPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center"><INPUT type="text" name="E01CRPWTR" value="<%=msg01.getE01CRPWTR()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01WTRCPB" disabled="disabled">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01WTRCPB().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01WTRCPB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01WTRCPB().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id="<%= (i++ %2 == 0 ? "trclear" : "trdark") %>">
	 	<TD align="left">Reimbursment</TD>
	    <TD align="center"><INPUT type="text" name="E01RMBCOM" value="<%=msg01.getE01RMBCOM()%>" readonly="readonly"></TD>
	    <TD align="center">
	    	<SELECT name="E01RMBPBY" disabled="disabled">
				<OPTION value="A" <%if(msg01.getE01RMBPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01RMBPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01RMBPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center"><INPUT type="text" name="E01CRPRMB" value="<%=msg01.getE01CRPRMB()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01RMBCPB" disabled="disabled">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01RMBCPB().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01RMBCPB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01RMBCPB().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id="<%= (i++ %2 == 0 ? "trclear" : "trdark") %>">
	    <TD align="left">Commission Deadlines</TD>
	    <TD align="center"><INPUT type="text" name="E01TRMCOM" value="<%=msg01.getE01TRMCOM()%>" readonly="readonly"></TD>
	    <TD align="center">
	    	<SELECT name="E01TRMPBY" disabled="disabled">
				<OPTION value="A" <%if(msg01.getE01TRMPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01TRMPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01TRMPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center">&nbsp;</TD>
	    <TD align="center">&nbsp;</TD>
	</TR>
</TABLE>
<% } else { %>
<TABLE class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
	<TR id="trdark">
		<TD>&nbsp;</TD>
    	<TD colspan="2" align="center"><B>Ours</B></TD>
	</TR>
  	<TR id="trdark">
    	<TD nowrap align="left">Commission</TD>
    	<TD nowrap align="center">Amount</TD>
    	<TD nowrap align="center">By</TD>
	</TR>
	<TR id="<%= (i++ %2 == 0 ? "trclear" : "trdark") %>">
	    <TD align="left">Issuance</TD>
	    <TD align="center"><INPUT name="E01ISSFEE" type="text" id="E01ISSFEE" value="<%=msg01.getE01ISSFEE()%>" readonly="readonly"></TD>
	    <TD align="center">
	    	<SELECT name="E01ISSPBY" disabled="disabled">
				<OPTION value="A" <%if(msg01.getE01ISSPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01ISSPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01ISSPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD>
	</TR>
	<TR id="<%= (i++ %2 == 0 ? "trclear" : "trdark") %>">
	    <TD align="left">Advise</TD>
	    <TD align="center"><INPUT name="E01ADVCOM" type="text" value="<%=msg01.getE01ADVCOM()%>" readonly="readonly"></TD>
	    <TD align="center">
	    	<SELECT name="E01ADVPBY" disabled="disabled">
				<OPTION value="A" <%if(msg01.getE01ADVPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01ADVPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01ADVPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center"><INPUT type="text" name="E01CRPADV" value="<%=msg01.getE01CRPADV()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01ADVCPB" disabled="disabled">
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
	<TR id="<%= (i++ %2 == 0 ? "trclear" : "trdark") %>">
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
			</SELECT>
		</TD>
	</TR>
	<TR id="<%= (i++ %2 == 0 ? "trclear" : "trdark") %>">
	    <TD align="left">Amendment</TD>
	    <TD align="center"><INPUT type="text" name="E01AMDFEE" value="<%=msg01.getE01AMDFEE()%>" readonly="readonly"></TD>
	    <TD align="center">
	    	<SELECT name="E01AMDPBY" disabled="disabled">
				<OPTION value="A" <%if(msg01.getE01AMDPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01AMDPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01AMDPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center"><INPUT type="text" name="E01CRPAMD" value="<%=msg01.getE01CRPAMD()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01AMDCPB" disabled="disabled">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01AMDCPB().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01AMDCPB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01AMDCPB().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id="<%= (i++ %2 == 0 ? "trclear" : "trdark") %>">
	    <TD align="left">Advise of Amendment</TD>
	    <TD align="center"><INPUT type="text" name="E01ADVAMF" value="<%=msg01.getE01ADVAMF()%>" readonly="readonly"></TD>
	    <TD align="center">
	    	<SELECT name="E01AAMPBY" disabled="disabled">
				<OPTION value="A" <%if(msg01.getE01AAMPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01AAMPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01AAMPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center"><INPUT type="text" name="E01CRPAAM" value="<%=msg01.getE01CRPAAM()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01AAMCPB" disabled="disabled">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01AAMCPB().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01AAMCPB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01AAMCPB().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id="<%= (i++ %2 == 0 ? "trclear" : "trdark") %>">
	    <TD align="left">Discrepancy</TD>
	    <TD align="center"><INPUT type="text" name="E01DISCOM" value="<%=msg01.getE01DISCOM()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01DISPBY" disabled="disabled">
			<OPTION value="A" <%if(msg01.getE01DISPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<OPTION value="B" <%if(msg01.getE01DISPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<OPTION value="W" <%if(msg01.getE01DISPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD>
		    <TD align="center"><INPUT type="text" name="E01CRPDIS" value="<%=msg01.getE01CRPDIS()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01DISCPB"  disabled="disabled">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01DISCPB().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01DISCPB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01DISCPB().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD>
		</TR>
	  <TR id="<%= (i++ %2 == 0 ? "trclear" : "trdark") %>">
	    <TD align="left">Extension of Validity</TD>
	    <TD align="center"><INPUT type="text" name="E01EOVCOM" value="<%=msg01.getE01EOVCOM()%>" readonly="readonly"></TD>
	    <TD align="center">
	    	<SELECT name="E01EOVPBY"  disabled="disabled">
				<OPTION value="A" <%if(msg01.getE01EOVPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01EOVPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01EOVPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center"><INPUT type="text" name="E01CRPEOV" value="<%=msg01.getE01CRPEOV()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01EOVCPB"  disabled="disabled">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01EOVCPB().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01EOVCPB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01EOVCPB().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
	</TR>
	  <TR id="<%= (i++ %2 == 0 ? "trclear" : "trdark") %>">
	    <TD align="left">Portes</TD>
	    <TD align="center"><INPUT type="text" name="E01POSTAM" value="<%=msg01.getE01POSTAM()%>" readonly="readonly"></TD>
	    <TD align="center">
	    	<SELECT name="E01POSPBY"  disabled="disabled">
				<OPTION value="A" <%if(msg01.getE01POSPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01POSPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01POSPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center"><INPUT type="text" name="E01CRPPOS" value="<%=msg01.getE01CRPPOS()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01POSCPB" disabled="disabled">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01POSCPB().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01POSCPB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01POSCPB().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id="<%= (i++ %2 == 0 ? "trclear" : "trdark") %>">
	    <TD align="left">Courier</TD>
	    <TD align="center"><INPUT type="text" name="E01COURAM" value="<%=msg01.getE01COURAM()%>" readonly="readonly"></TD>
	    <TD align="center">
	    	<SELECT name="E01COUPBY" disabled="disabled">
				<OPTION value="A" <%if(msg01.getE01COUPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01COUPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01COUPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center"><INPUT type="text" name="E01CRPCOU" value="<%=msg01.getE01CRPCOU()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01COUCPB" disabled="disabled">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01COUCPB().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01COUCPB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01COUCPB().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id="<%= (i++ %2 == 0 ? "trclear" : "trdark") %>">
	    <TD align="left">Swift</TD>
	    <TD align="center"><INPUT type="text" name="E01SWFFEE" value="<%=msg01.getE01SWFFEE()%>" readonly="readonly"></TD>
	    <TD align="center">
	    	<SELECT name="E01SWFPBY" disabled="disabled">
				<OPTION value="A" <%if(msg01.getE01SWFPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01SWFPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01SWFPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center"><INPUT type="text" name="E01CRPSWF" value="<%=msg01.getE01CRPSWF()%>"></TD>
	    <TD align="center"><SELECT name="E01SWFCPB">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01SWFCPB().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01SWFCPB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01SWFCPB().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id="<%= (i++ %2 == 0 ? "trclear" : "trdark") %>">
	    <TD align="left">Additional Swift</TD>
	    <TD align="center"><INPUT type="text" name="E01TLXFEE" value="<%=msg01.getE01TLXFEE()%>" readonly="readonly"></TD>
	    <TD align="center">
	    	<SELECT name="E01TLXPBY" disabled="disabled">
				<OPTION value="A" <%if(msg01.getE01TLXPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01TLXPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01TLXPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center"><INPUT type="text" name="E01CRPTLX" value="<%=msg01.getE01CRPTLX()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01TLXCPB" disabled="disabled">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01TLXCPB().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01TLXCPB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01TLXCPB().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
	</TR>
  	<TR id="<%= (i++ %2 == 0 ? "trclear" : "trdark") %>">
	    <TD align="left">Cancellation</TD>
	    <TD align="center"><INPUT type="text" name="E01CANFEE" value="<%=msg01.getE01CANFEE()%>" readonly="readonly"></TD>
	    <TD align="center">
	    	<SELECT name="E01CANPBY" disabled="disabled">
				<OPTION value="A" <%if(msg01.getE01CANPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01CANPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01CANPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center"><INPUT type="text" name="E01CRPCAN" value="<%=msg01.getE01CRPCAN()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01CANCPB" disabled="disabled">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01CANCPB().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01CANCPB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01CANCPB().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id="<%= (i++ %2 == 0 ? "trclear" : "trdark") %>">
	    <TD align="left">Payment</TD>
	    <TD align="center"><INPUT type="text" name="E01PAYCOM" value="<%=msg01.getE01PAYCOM()%>" readonly="readonly"></TD>
	    <TD align="center">
	    	<SELECT name="E01PMCPBY" disabled="disabled">
				<OPTION value="A" <%if(msg01.getE01PMCPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01PMCPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01PMCPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center"><INPUT type="text" name="E01CRPPAY" value="<%=msg01.getE01CRPPAY()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01PMCCPB" disabled="disabled">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01PMCCPB().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01PMCCPB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01PMCCPB().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
		<TD align="left">Acceptance</TD><TD align="center">
		<INPUT type="text" name="E01ACPCOM" value="<%=msg01.getE01ACPCOM()%>" readonly="readonly"></TD>
		<TD align="center">
			<SELECT name="E01ACCPBY" disabled="disabled">
				<OPTION value="A" <%if(msg01.getE01ACCPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01ACCPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01ACCPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center"><INPUT type="text" name="E01CRPACP" value="<%=msg01.getE01CRPACP()%>" readonly="readonly"></TD>
		<TD align="center"><SELECT name="E01ACCCPB" disabled="disabled">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01ACCCPB().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01ACCCPB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01ACCCPB().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>			
	</TR>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
		<TD align="left">Deferred Payment</TD>
		<TD align="center"><INPUT type="text" name="E01DFPFEE" value="<%=msg01.getE01DFPFEE()%>" readonly="readonly"></TD>
		<TD align="center">
			<SELECT name="E01DFPPBY" disabled="disabled">
				<OPTION value="A" <%if(msg01.getE01DFPPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01DFPPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01DFPPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center"><INPUT type="text" name="E01CRPDFP" value="<%=msg01.getE01CRPDFP()%>" readonly="readonly"></TD>
		<TD align="center"><SELECT name="E01DFPCPB" disabled="disabled">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01DFPCPB().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01DFPCPB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01DFPCPB().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>			
	</TR>
  	<TR id="<%= (i++ %2 == 0 ? "trclear" : "trdark") %>">
	    <TD align="left">Funds Transfer</TD>
	    <TD align="center"><INPUT type="text" name="E01WTRCOM" value="<%=msg01.getE01WTRCOM()%>" readonly="readonly"></TD>
	    <TD align="center">
	    	<SELECT name="E01WTRPBY" disabled="disabled">
				<OPTION value="A" <%if(msg01.getE01WTRPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01WTRPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01WTRPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center"><INPUT type="text" name="E01CRPWTR" value="<%=msg01.getE01CRPWTR()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01WTRCPB" disabled="disabled">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01WTRCPB().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01WTRCPB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01WTRCPB().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id="<%= (i++ %2 == 0 ? "trclear" : "trdark") %>">
	 	<TD align="left">Reimbursment</TD>
	    <TD align="center"><INPUT type="text" name="E01RMBCOM" value="<%=msg01.getE01RMBCOM()%>" readonly="readonly"></TD>
	    <TD align="center">
	    	<SELECT name="E01RMBPBY" disabled="disabled">
				<OPTION value="A" <%if(msg01.getE01RMBPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01RMBPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01RMBPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center"><INPUT type="text" name="E01CRPRMB" value="<%=msg01.getE01CRPRMB()%>" readonly="readonly"></TD>
	    <TD align="center"><SELECT name="E01RMBCPB" disabled="disabled">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01RMBCPB().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01RMBCPB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01RMBCPB().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id="<%= (i++ %2 == 0 ? "trclear" : "trdark") %>">
	    <TD align="left">Commission Deadlines</TD>
	    <TD align="center"><INPUT type="text" name="E01TRMCOM" value="<%=msg01.getE01TRMCOM()%>" readonly="readonly"></TD>
	    <TD align="center">
	    	<SELECT name="E01TRMPBY" disabled="disabled">
				<OPTION value="A" <%if(msg01.getE01TRMPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01TRMPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01TRMPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center">&nbsp;</TD>
	    <TD align="center">&nbsp;</TD>
	</TR>
</TABLE>
<% } %>
</form>

</body>
</html>
