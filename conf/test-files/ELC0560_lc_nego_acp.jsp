<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Letter of Credit Negotiation</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META NAME="GENERATOR" CONTENT="IBM WebSphere Page Designer V4.0 for Windows">
<META HTTP-EQUIV="Content-Style-Type" CONTENT="text/css">
<LINK HREF="<%=request.getContextPath()%>/pages/style.css" REL="stylesheet">
<%@ page import = "datapro.eibs.master.Util" %>

<jsp:useBean id="msg01" class="datapro.eibs.beans.ELC056001Message" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />

<SCRIPT language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>


<SCRIPT LANGUAGE="Javascript">
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

 String title = "Acceptance";
 if (msg01.getH01OPECOD().equals("4")) title = "Deferred Payment";

 userPO.setPrevPage("ELC0560_lc_nego_acp.jsp");
 userPO.setNextPage("ELC0560_lc_nego_conf.jsp");
 msg01.setH01OPECOD("0005");

%>

</HEAD>

<BODY>

<H3 ALIGN="center">Letter of Credit Negotiation/Payment [<%= title %>]
	<IMG SRC="<%=request.getContextPath()%>/images/e_ibs.gif" ALIGN="left" NAME="EIBS_GIF" ALT="lc_nego_acp.jsp, ELC0560"></H3>
<HR SIZE="4">

<FORM method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0560" >
<INPUT TYPE="HIDDEN" name="SCREEN" value="3">


<TABLE class="tableinfo">
	<TR bgcolor="#ffffff">
        <TD nowrap height="79" width="100%">
        	<TABLE cellspacing="0" cellpadding="2" width="100%" border="0">
	            <TR ID="trdark">
	              <TD ALIGN="left" VALIGN="top" HEIGHT="29">Type of Negotiation:</TD>
	              <TD NOWRAP VALIGN="top" HEIGHT="29"><INPUT TYPE="text" NAME="E01OPCODE" SIZE="4" MAXLENGTH="1" VALUE="<%= msg01.getE01OPCODE()%>" READONLY>
	                  <INPUT TYPE="text" NAME="E01OPCDSC" SIZE="31" MAXLENGTH="30" VALUE="<%= msg01.getE01OPCDSC()%>" READONLY>
	              </TD>
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



<P><B>Principal Debit Account</B></P>
<TABLE CLASS="tableinfo" CELLSPACING="0" CELLPADDING="2" WIDTH="100%" BORDER="0">
  <TR ID="trdark">
			<TD ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="230">Concept</TD>
			<TD NOWRAP VALIGN="top" HEIGHT="24" ALIGN="center" WIDTH="51">Bank</TD>
			<TD NOWRAP VALIGN="top" HEIGHT="24" ALIGN="center" WIDTH="61">Branch</TD>
			<TD NOWRAP ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="47">MDA</TD>
			<TD NOWRAP ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="128">G/L Account</TD>
			<TD NOWRAP ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="132">DDA Account</TD>
			<TD NOWRAP ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="114">Cost Center</TD>
  </TR>
  <TR id="trclear">
    <TD width="230" height="24" align="left" valign="top" nowrap><INPUT type="text" name="E01CONCDR" size="4" maxlength="2" value="<%= msg01.getE01CONCDR()%>">
        <INPUT type="text" name="E01CONCDD" size="25" maxlength="25" value="<%=msg01.getE01CONCDD()%>"
				oncontextmenu="showPopUp(conceptHelp,'E01CONCDD','','','E01CUSGLN','E01CONCDR','40'); return false;"></TD>
    <TD width="51" height="24" align="center" valign="top" nowrap><INPUT type="text" name="E01CUSBNK" size="4" maxlength="2" value="<%= msg01.getE01CUSBNK()%>"></TD>
    <TD width="61" height="24" align="center" valign="top" nowrap><INPUT type="text" name="E01CUSBRN" size="6" maxlength="3" value="<%= msg01.getE01CUSBRN()%>" ONCONTEXTMENU="showPopUp(branchHelp,this.name,document.forms[0].E01CUSBNK.value,'','','','')" onKeyPress="enterInteger()"></TD>
    <TD width="47" height="24" align="center" valign="top" nowrap><INPUT type="text" name="E01CUSCCY" size="6" maxlength="3" value="<%= msg01.getE01CUSCCY()%>" ONCONTEXTMENU="showPopUp(currencyHelp,this.name,document.forms[0].E01CUSBNK.value,'','','','')"></TD>
    <TD width="128" height="24" align="center" valign="top" nowrap><INPUT type="text" name="E01CUSGLN" size="20" maxlength="16" value="<%= msg01.getE01CUSGLN()%>" onKeyPress="enterInteger()"
			oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01CUSBNK.value,document.forms[0].E01CUSCCY.value,'','','')"></TD>
    <TD width="132" height="24" align="center" valign="top" nowrap><INPUT type="text" name="E01CUSACC" size="18" maxlength="12" value="<%= msg01.getE01CUSACC()%>" ONCONTEXTMENU="showPopUp(accountHelp,this.name,document.forms[0].E01CUSBNK.value,'','','','RT')"></TD>
    <TD width="114" height="24" align="center" valign="top" nowrap><INPUT type="text" name="E01CUSCCN" size="13" maxlength="8" value="<%= msg01.getE01CUSCCN()%>"oncontextmenu="showPopUp(costcenterHelp,this.name,document.forms[0].E01CUSBNK.value,'','','','')"></TD>
  </TR>
</TABLE>
<P><B>Commission Debit Account</B></P>
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
  <TR id="trclear">
    <TD width="230" height="24" align="left" valign="top" nowrap><INPUT type="text" name="E01CONDCO" value="<%=msg01.getE01CONDCO()%>" size="4" maxlength="2">
        <INPUT type="text" name="E01CONDCB" size="25" maxlength="25" value="<%=msg01.getE01CONDCB()%>"
				oncontextmenu="showPopUp(conceptHelp,'E01CONDCB','','','E01DEBGL2','E01CONDCO','40'); return false;"></TD>
    <TD nowrap valign="top" height="24" align="center" width="51"><INPUT type="text" name="E01DEBBK2" size="4" maxlength="2" value="<%=msg01.getE01DEBBK2()%>"></TD>
    <TD nowrap valign="top" height="24" align="center" width="61"><INPUT type="text" name="E01DEBBR2" size="6" maxlength="3" value="<%=msg01.getE01DEBBR2()%>" ONCONTEXTMENU="showPopUp(branchHelp,this.name,document.forms[0].E01DEBBK2.value,'','','','')" onKeyPress="enterInteger()"></TD>
    <TD nowrap align="center" valign="top" height="24" width="47"><INPUT type="text" name="E01DEBCY2" size="6" maxlength="3" value="<%=msg01.getE01DEBCY2()%>" ONCONTEXTMENU="showPopUp(currencyHelp,this.name,document.forms[0].E01DEBBK2.value,'','','','')"></TD>
    <TD nowrap align="center" valign="top" height="24" width="128"><INPUT type="text" name="E01DEBGL2" size="20" maxlength="16" value="<%=msg01.getE01DEBGL2()%>" onKeyPress="enterInteger()"
			oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01DEBBK2.value,document.forms[0].E01DEBCY2.value,'','','')"></TD>
    <TD nowrap align="center" valign="top" height="24" width="132"><INPUT type="text" name="E01DEBAC2" size="18" maxlength="12" value="<%=msg01.getE01DEBAC2()%>" ONCONTEXTMENU="showPopUp(accountHelp,this.name,document.forms[0].E01DEBBK2.value,'','','','RT')"></TD>
    <TD nowrap align="center" valign="top" height="24" width="114"><INPUT type="text" name="E01DEBCC2" size="13" maxlength="8" value="<%=msg01.getE01DEBCC2()%>"oncontextmenu="showPopUp(costcenterHelp,this.name,document.forms[0].E01DEBBK2.value,'','','','')"></TD>
  </TR>
</TABLE>
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
  <TR id="trclear">
    <TD width="230" height="24" align="left" valign="top" nowrap><INPUT type="text" name="E01CONCCR" size="4" maxlength="2" value="<%= msg01.getE01CONCCR()%>">
        <INPUT type="text" name="E01CONCCD" size="25" maxlength="25" value="<%= msg01.getE01CONCCD()%>" 
				oncontextmenu="showPopUp(conceptHelp,'E01CONCCD','','','E01PMTGLN','E01CONCCR','40'); return false;"></TD>
    <TD nowrap valign="top" height="24" align="center" width="51"><INPUT type="text" name="E01PMTBNK" size="4" maxlength="2" value="<%= msg01.getE01PMTBNK()%>"></TD>
    <TD nowrap valign="top" height="24" align="center" width="61"><INPUT type="text" name="E01PMTBRN" size="6" maxlength="3" value="<%= msg01.getE01PMTBRN()%>" ONCONTEXTMENU="showPopUp(branchHelp,this.name,document.forms[0].E01PMTBNK.value,'','','','')" onKeyPress="enterInteger()"></TD>
    <TD nowrap align="center" valign="top" height="24" width="47"><INPUT type="text" name="E01PMTCCY" size="6" maxlength="3" value="<%= msg01.getE01PMTCCY()%>" ONCONTEXTMENU="showPopUp(currencyHelp,this.name,document.forms[0].E01PMTBNK.value,'','','','')"></TD>
    <TD nowrap align="center" valign="top" height="24" width="128"><INPUT type="text" name="E01PMTGLN" size="20" maxlength="16" value="<%= msg01.getE01PMTGLN()%>" onKeyPress="enterInteger()"
			oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01PMTBNK.value,document.forms[0].E01PMTCCY.value,'','','')"></TD>
    <TD nowrap align="center" valign="top" height="24" width="132"><INPUT type="text" name="E01PMTACC" size="18" maxlength="12" value="<%= msg01.getE01PMTACC()%>" ONCONTEXTMENU="showPopUp(accountHelp,this.name,document.forms[0].E01PMTBNK.value,'','','','RT')"></TD>
    <TD nowrap align="center" valign="top" height="24" width="114"><INPUT type="text" name="E01PMTCCN" size="13" maxlength="8" value="<%= msg01.getE01PMTCCN()%>"oncontextmenu="showPopUp(costcenterHelp,this.name,document.forms[0].E01PMTBNK.value,'','','','')"></TD>
  </TR>
</TABLE>
<% if(msg01.getH01FLGWK3().equals("Y")){ %>
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
  <TR id="trclear">
    <TD width="230" height="24" align="left" valign="top" nowrap><INPUT type="text" name="E01CONCBC" size="4" maxlength="2" value="<%=msg01.getE01CONCBC()%>">
        <INPUT type="text" name="E01CONCBD" size="25" maxlength="25"  value="<%=msg01.getE01CONCBD()%>"
				oncontextmenu="showPopUp(conceptHelp,'E01CONCBD','','','E01CRPGLN','E01CONCBC','40'); return false;"></TD>
    <TD nowrap valign="top" height="24" align="center" width="51"><INPUT type="text" name="E01CRPBNK" size="4" maxlength="2" value="<%=msg01.getE01CRPBNK()%>"></TD>
    <TD nowrap valign="top" height="24" align="center" width="61">
	<INPUT type="text" name="E01CRPBRN" size="6" maxlength="3" value="<%=msg01.getE01CRPBRN()%>" ONCONTEXTMENU="showPopUp(branchHelp,this.name,document.forms[0].E01CRPBNK.value,'','','','')" onKeyPress="enterInteger()"></TD>
    <TD nowrap align="center" valign="top" height="24" width="47">
	<INPUT type="text" name="E01CRPCCY" size="6" maxlength="3" value="<%=msg01.getE01CRPCCY()%>" ONCONTEXTMENU="showPopUp(currencyHelp,this.name,document.forms[0].E01CRPBNK.value,'','','','')"></TD>
    <TD nowrap align="center" valign="top" height="24" width="128">
	<INPUT type="text" name="E01CRPGLN" size="20" maxlength="16" value="<%=msg01.getE01CRPGLN()%>" onKeyPress="enterInteger()"oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01CRPBNK.value,document.forms[0].E01CRPCCY.value,'','','')"></TD>
    <TD nowrap align="center" valign="top" height="24" width="132"><INPUT type="text" name="E01CRPACC" size="18" maxlength="12" value="<%=msg01.getE01CRPACC()%>" ONCONTEXTMENU="showPopUp(accountHelp,this.name,document.forms[0].E01CRPBNK.value,'','','','RT')"></TD>
    <TD nowrap align="center" valign="top" height="24" width="114">
	<INPUT type="text" name="E01CRPCCN" size="13" maxlength="8" value="<%=msg01.getE01CRPCCN()%>" 
	oncontextmenu="showPopUp(costcenterHelp,this.name,document.forms[0].E01CRPBNK.value,'','','','')"></TD>
  </TR>
</TABLE>
<% } %>
<P></P>
<%int i = 0;%>
<TABLE class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
	<TR id="<%out.print((i++%2==0 ? "trdark" : "trclear"));%>">
		<TD align="right" valign="top" height="24" width="233">Commission Debit to Beneficiary Account :</TD>
		<TD nowrap valign="top" align="left" width="115">
			<INPUT type="radio" name="E01DEBFLG" value="Y" <%if (msg01.getE01DEBFLG().equals("Y")) out.print("checked"); %>> Yes 
			<INPUT type="radio" name="E01DEBFLG" value="N" <%if (msg01.getE01DEBFLG().equals("N")) out.print("checked"); %>> No				</TD>
		<TD nowrap align="right" valign="top" height="24" width="170">Beneficiary Retail Account :</TD>
		<TD nowrap align="left" valign="top" height="24" width="160">
			<INPUT type="text" name="E01LCMBAC" size="16" maxlength="12" value="<%= msg01.getE01LCMBAC() %>" ></TD>
	</TR>
	<TR id="<%out.print((i++%2==0 ? "trdark" : "trclear"));%>">
	  <TD nowrap align="right" valign="top" height="24">Cancel Unused Balance :</TD>
	  <TD nowrap align="left" valign="top" height="24"><INPUT type="radio" name="E01CANBAL" value="Y" <%if (msg01.getE01CANBAL().equals("Y")) out.print("checked"); %>>
	    Yes
	    <INPUT type="radio" name="E01CANBAL" value="N" <%if (msg01.getE01CANBAL().equals("N")) out.print("checked"); %>>
	    No </TD>
		<TD nowrap align="right" valign="top" height="24" width="170">&nbsp;Garantía en Efectivo :</TD>
		<TD nowrap align="left" valign="top" height="24" width="160">&nbsp;
			<INPUT type="text" name="E01CSHAMN" size="18" maxlength="15" value="<%= msg01.getE01CSHAMN() %>"></TD>
	</TR>
	<TR id="<%out.print((i++ %2==0 ? "trdark" : "trclear"));%>">
		<TD nowrap align="right" valign="top" height="24">Acceptance Date :</TD>
		<TD nowrap align="left" valign="top" height="24">
		<INPUT name="E01DRFDTM" value="<%=msg01.getE01DRFDTM()%>" size="2" maxlength="2" >
		<INPUT name="E01DRFDTD" value="<%=msg01.getE01DRFDTD()%>" size="2" maxlength="2" >
		<INPUT name="E01DRFDTY" value="<%=msg01.getE01DRFDTY()%>" size="2" maxlength="2" >
		<A href="javascript:DatePicker(document.forms[0].E01DRFDTM,document.forms[0].E01DRFDTD,document.forms[0].E01DRFDTY)"><IMG src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></A> </TD>
		<TD nowrap align="right" valign="top" height="24" width="170">Value Date :</TD>
		<TD nowrap align="left" valign="top" height="24" width="160">
		<INPUT name="E01VALDTM" value="<%=msg01.getE01VALDTM()%>" size="2" maxlength="2" >
		<INPUT name="E01VALDTD" value="<%=msg01.getE01VALDTD()%>" size="2" maxlength="2" >
		<INPUT name="E01VALDTY" value="<%=msg01.getE01VALDTY()%>" size="2" maxlength="2" >
		<A href="javascript:DatePicker(document.forms[0].E01VALDTM,document.forms[0].E01VALDTD,document.forms[0].E01VALDTY)">
		<IMG src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></A></TD>
	</TR>
	<TR id="<%out.print((i++ %2==0 ? "trdark" : "trclear"));%>">
		<TD nowrap align="right" valign="top" height="24">Terms (Number of Days) :</TD>
		<TD nowrap align="left" valign="top" height="24">
		<INPUT name="E01NUMDYS" value="<%=msg01.getE01NUMDYS()%>" size="4" maxlength="4" ></TD>
		<TD nowrap align="right" valign="top" height="24" width="170">Maturity Date :</TD>
		<TD nowrap align="left" valign="top" height="24" width="160">
		<INPUT name="E01MATDTM" value="<%=msg01.getE01MATDTM()%>" size="2" maxlength="2" >
		<INPUT name="E01MATDTD" value="<%=msg01.getE01MATDTD()%>" size="2" maxlength="2" >
		<INPUT name="E01MATDTY" value="<%=msg01.getE01MATDTY()%>" size="2" maxlength="2" >
		<A href="javascript:DatePicker(document.forms[0].E01MATDTM,document.forms[0].E01MATDTD,document.forms[0].E01MATDTY)">
		<IMG src="<%=request.getContextPath()%>/images/calendar.gif" alt="help"  border="0"></A></TD>
	</TR>
	<TR id="<%out.print((i++ %2==0 ? "trdark" : "trclear"));%>">
		<TD nowrap align="right" valign="top" height="24">Product :</TD>
		<TD nowrap align="left" valign="top" height="24">
		<INPUT name="E01NEWPRO" value="<%=msg01.getE01NEWPRO()%>" size="4" maxlength="4" >
		<INPUT name="E01DSCPRO" size="25" maxlength="25" readonly>
		<A href="javascript: GetProduct('E01NEWPRO','<%=(msg01.getE01OPCODE().equals("2") ? "41" : "42")%>','<%= msg01.getE01CUSBNK()%>','E01DSCPRO', ' ')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="bottom" border="0"></A>		</TD>
		<TD nowrap align="right" valign="top" height="24" width="170">Base Anual :</TD>
		<TD nowrap align="left" valign="top" height="24" width="160">
		<INPUT name="E01PERBAS" value="<%=msg01.getE01PERBAS()%>" size="4" maxlength="4" ></TD>
	</TR>
	<TR id="trclear">
		<TD align="right">Correspondent Bank Debit Amount :</TD>
		<TD nowrap align="left">
			<INPUT type="text" name="E01DEBCRP" size="18" maxlength="17" value="<%=msg01.getE01DEBCRP()%>">
		</TD>
		<TD nowrap align="right">Charges By :</TD>
		<TD nowrap align="left"><SELECT name="E01CRPPBY">
			<OPTION value="">&nbsp;</OPTION>
			<OPTION value="A"
				<%if (msg01.getE01CRPPBY().equals("A")) { out.print("selected"); }%>>Applicant</OPTION>
			<OPTION value="B"
				<%if (msg01.getE01CRPPBY().equals("B")) { out.print("selected"); }%>>Beneficiary</OPTION>
		</SELECT></TD>
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
	<TR>
	    <TD><INPUT type="text" name="E01FXCCY1" value="<%=msg01.getE01FXCCY1()%>" size="9" maxlength="3"></TD>
	    <TD><INPUT type="text" name="E01FXRPU1" value="<%=msg01.getE01FXRPU1()%>" size="20" maxlength="11"></TD>
	    <TD><INPUT type="text" name="E01FXRSA1" value="<%=msg01.getE01FXRSA1()%>" size="20" maxlength="11"></TD>
	    <TD><INPUT type="text" name="E01FXCCY2" value="<%=msg01.getE01FXCCY2()%>" size="9" maxlength="3"></TD>
	    <TD><INPUT type="text" name="E01FXRPU2" value="<%=msg01.getE01FXRPU2()%>" size="20" maxlength="11"></TD>
	    <TD><INPUT type="text" name="E01FXRSA2" value="<%=msg01.getE01FXRSA2()%>" size="20" maxlength="11"></TD>
	</TR>
	<TR>
	    <TD><INPUT type="text" name="E01FXCCY3" value="<%=msg01.getE01FXCCY3()%>" size="9" maxlength="3"></TD>
	    <TD><INPUT type="text" name="E01FXRPU3" value="<%=msg01.getE01FXRPU3()%>" size="20" maxlength="11"></TD>
	    <TD><INPUT type="text" name="E01FXRSA3" value="<%=msg01.getE01FXRSA3()%>" size="20" maxlength="11"></TD>
	    <TD><INPUT type="text" name="E01FXCCY4" value="<%=msg01.getE01FXCCY4()%>" size="9" maxlength="3"></TD>
	    <TD><INPUT type="text" name="E01FXRPU4" value="<%=msg01.getE01FXRPU4()%>" size="20" maxlength="11"></TD>
	    <TD><INPUT type="text" name="E01FXRSA4" value="<%=msg01.getE01FXRSA4()%>" size="20" maxlength="11"></TD>
	</TR>
</TABLE>

<%	i = 0;	%>
<P><B>Expenses and Commissions</B></P>
<% if(msg01.getH01FLGWK3().equals("Y")) { %>
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
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Issuance</TD>
	    <TD align="center"><INPUT name="E01ISSFEE" type="text" id="E01ISSFEE" value="<%=msg01.getE01ISSFEE()%>"></TD>
	    <TD align="center">
	    	<SELECT name="E01ISSPBY">
				<OPTION value="A" <%if(msg01.getE01ISSPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01ISSPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01ISSPBY().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT>
		</TD>
		<TD align="center"><INPUT name="E01CRPISS" type="text" id="E01CRPISS" value="<%=msg01.getE01CRPISS()%>"></TD>
	    <TD align="center"><SELECT name="E01ISSCPB">
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
	    <TD align="center"><INPUT name="E01ADVCOM" type="text" value="<%=msg01.getE01ADVCOM()%>"></TD>
	    <TD align="center">
	    	<SELECT name="E01ADVPBY">
				<OPTION value="A" <%if(msg01.getE01ADVPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01ADVPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01ADVPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center"><INPUT type="text" name="E01CRPADV" value="<%=msg01.getE01CRPADV()%>"></TD>
	    <TD align="center"><SELECT name="E01ADVCPB">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01ADVCPB().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01ADVCPB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01ADVCPB().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD>
	</TR>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Confirmation</TD>
	    <TD align="center"><INPUT type="text" name="E01CNFCOM" value="<%=msg01.getE01CNFCOM()%>"></TD>
	    <TD align="center">
	    	<SELECT name="E01CNFPBY">
				<OPTION value="A" <%if(msg01.getE01CNFPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01CNFPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01CNFPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center"><INPUT type="text" name="E01CRPCNF" value="<%=msg01.getE01CRPCNF()%>"></TD>
	    <TD align="center"><SELECT name="E01CNFCPB">
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
	    <TD align="center"><INPUT type="text" name="E01AMDFEE" value="<%=msg01.getE01AMDFEE()%>"></TD>
	    <TD align="center">
	    	<SELECT name="E01AMDPBY">
				<OPTION value="A" <%if(msg01.getE01AMDPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01AMDPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01AMDPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center"><INPUT type="text" name="E01CRPAMD" value="<%=msg01.getE01CRPAMD()%>"></TD>
	    <TD align="center"><SELECT name="E01AMDCPB">
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
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Amendment</TD>
	    <TD align="center"><INPUT type="text" name="E01ADVAMF" value="<%=msg01.getE01ADVAMF()%>"></TD>
	    <TD align="center">
	    	<SELECT name="E01AAMPBY">
				<OPTION value="A" <%if(msg01.getE01AAMPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01AAMPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01AAMPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center"><INPUT type="text" name="E01CRPAAM" value="<%=msg01.getE01CRPAAM()%>"></TD>
	    <TD align="center"><SELECT name="E01AAMCPB">
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
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Discrepancy</TD>
	    <TD align="center"><INPUT type="text" name="E01DISCOM" value="<%=msg01.getE01DISCOM()%>"></TD>
	    <TD align="center">
	    	<SELECT name="E01DISPBY">
				<OPTION value="A" <%if(msg01.getE01DISPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01DISPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01DISPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center"><INPUT type="text" name="E01CRPDIS" value="<%=msg01.getE01CRPDIS()%>"></TD>
	    <TD align="center"><SELECT name="E01DISCPB">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01DISCPB().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01DISCPB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01DISCPB().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Extension of Validity</TD>
	    <TD align="center"><INPUT type="text" name="E01EOVCOM" value="<%=msg01.getE01EOVCOM()%>"></TD>
	    <TD align="center">
	    	<SELECT name="E01EOVPBY">
				<OPTION value="A" <%if(msg01.getE01EOVPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01EOVPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01EOVPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center"><INPUT type="text" name="E01CRPEOV" value="<%=msg01.getE01CRPEOV()%>"></TD>
	    <TD align="center"><SELECT name="E01EOVCPB">
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
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Portes</TD>
	    <TD align="center"><INPUT type="text" name="E01POSTAM" value="<%=msg01.getE01POSTAM()%>"></TD>
	    <TD align="center">
	    	<SELECT name="E01POSPBY">
				<OPTION value="A" <%if(msg01.getE01POSPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01POSPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01POSPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center"><INPUT type="text" name="E01CRPPOS" value="<%=msg01.getE01CRPPOS()%>"></TD>
	    <TD align="center"><SELECT name="E01POSCPB">
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
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Courier</TD>
	    <TD align="center"><INPUT type="text" name="E01COURAM" value="<%=msg01.getE01COURAM()%>"></TD>
	    <TD align="center">
	    	<SELECT name="E01COUPBY">
				<OPTION value="A" <%if(msg01.getE01COUPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01COUPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01COUPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center"><INPUT type="text" name="E01CRPCOU" value="<%=msg01.getE01CRPCOU()%>"></TD>
	    <TD align="center"><SELECT name="E01COUCPB">
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
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Swift</TD>
	    <TD align="center"><INPUT type="text" name="E01SWFFEE" value="<%=msg01.getE01SWFFEE()%>"></TD>
	    <TD align="center">
	    	<SELECT name="E01SWFPBY">
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
	  <TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Additional Swift</TD>
	    <TD align="center"><INPUT type="text" name="E01TLXFEE" value="<%=msg01.getE01TLXFEE()%>"></TD>
	    <TD align="center">
	    	<SELECT name="E01TLXPBY">
				<OPTION value="A" <%if(msg01.getE01TLXPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01TLXPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01TLXPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center"><INPUT type="text" name="E01CRPTLX" value="<%=msg01.getE01CRPTLX()%>"></TD>
	    <TD align="center"><SELECT name="E01TLXCPB">
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
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Cancellation</TD>
	    <TD align="center"><INPUT type="text" name="E01CANFEE" value="<%=msg01.getE01CANFEE()%>"></TD>
	    <TD align="center">
	    	<SELECT name="E01CANPBY">
				<OPTION value="A" <%if(msg01.getE01CANPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01CANPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01CANPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center"><INPUT type="text" name="E01CRPCAN" value="<%=msg01.getE01CRPCAN()%>"></TD>
	    <TD align="center"><SELECT name="E01CANCPB">
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
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Payment</TD>
	    <TD align="center"><INPUT type="text" name="E01PAYCOM" value="<%=msg01.getE01PAYCOM()%>"></TD>
	    <TD align="center">
	    	<SELECT name="E01PMCPBY">
				<OPTION value="A" <%if(msg01.getE01PMCPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01PMCPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01PMCPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center"><INPUT type="text" name="E01CRPPAY" value="<%=msg01.getE01CRPPAY()%>"></TD>
	    <TD align="center"><SELECT name="E01PMCCPB">
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
	    <TD align="left">Funds Tranfer</TD>
	    <TD align="center"><INPUT type="text" name="E01WTRCOM" value="<%=msg01.getE01WTRCOM()%>"></TD>
	    <TD align="center">
	    	<SELECT name="E01WTRPBY">
				<OPTION value="A" <%if(msg01.getE01WTRPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01WTRPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01WTRPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center"><INPUT type="text" name="E01CRPWTR" value="<%=msg01.getE01CRPWTR()%>"></TD>
	    <TD align="center"><SELECT name="E01WTRCPB">
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
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Reimbursment</TD>
	    <TD align="center"><INPUT type="text" name="E01RMBCOM" value="<%=msg01.getE01RMBCOM()%>"></TD>
	    <TD align="center">
	    	<SELECT name="E01RMBPBY">
				<OPTION value="A" <%if(msg01.getE01RMBPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01RMBPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01RMBPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center"><INPUT type="text" name="E01CRPRMB" value="<%=msg01.getE01CRPRMB()%>"></TD>
	    <TD align="center"><SELECT name="E01RMBCPB">
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
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Term Commission</TD>
	    <TD align="center"><INPUT type="text" name="E01TRMCOM" value="<%=msg01.getE01TRMCOM()%>"></TD>
	    <TD align="center">
	    	<SELECT name="E01TRMPBY">
				<OPTION value="A" <%if(msg01.getE01TRMPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01TRMPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01TRMPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center">&nbsp;</TD>
	    <TD align="center">&nbsp;</TD>
	</TR>
    <TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">	<%if(msg01.getE01LCCFL1().equals("Y"))  out.print("Convenio ALADI");
	    					else out.print("Stamps");%>
	    </TD>
	    <TD align="center"><INPUT type="text" name="E01ALDCOM" value="<%=msg01.getE01ALDCOM()%>"></TD>
	    <TD align="center">
	    	<SELECT name="E01ALDPBY">
				<OPTION value="A" <%if(msg01.getE01ALDPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01ALDPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01ALDPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center"><INPUT type="text" name="E01CRPALD" value="<%=msg01.getE01CRPALD()%>"></TD>
	    <TD align="center"><SELECT name="E01ALDCPB">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01ALDCPB().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01ALDCPB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01ALDCPB().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
	</TR>

<%	if (userPO.getHeader1().equals("18")){%>
  	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Interest</TD>
	    <TD align="center"><INPUT type="text" name="E01INTCHG" value="<%=msg01.getE01INTCHG()%>"></TD>
	    <TD align="center"><SELECT name="E01INTPBY">
			<OPTION value="A" <%if(msg01.getE01INTPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
			<OPTION value="B" <%if(msg01.getE01INTPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
			<OPTION value="W" <%if(msg01.getE01INTPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD>
		    <TD align="center">&nbsp;</TD>
	    <TD align="center">&nbsp;</TD>
	</TR>
<%	}
	if (msg01.getE01OPCODE().equals("2")) {%>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
		<TD align="left">Acceptance</TD>
		<TD align="center"><INPUT type="text" name="E01ACPCOM" value="<%=msg01.getE01ACPCOM()%>"></TD>
		<TD align="center">
			<SELECT name="E01ACCPBY">
				<OPTION value="A" <%if(msg01.getE01ACCPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01ACCPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01ACCPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
		<TD align="center"><INPUT type="text" name="E01CRPACP" value="<%=msg01.getE01CRPACP()%>"></TD>
		<TD align="center"><SELECT name="E01ACCCPB">
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
<%	} else {%>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
		<TD align="left">Deferred Payment</TD>
		<TD align="center"><INPUT type="text" name="E01DFPFEE" value="<%=msg01.getE01DFPFEE()%>"></TD>
		<TD align="center">
			<SELECT name="E01DFPPBY">
				<OPTION value="A" <%if(msg01.getE01DFPPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01DFPPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01DFPPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD>
		<TD align="center"><INPUT type="text" name="E01CRPDFP" value="<%=msg01.getE01CRPDFP()%>"></TD>
		<TD align="center"><SELECT name="E01DFPCPB">
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
<% 	} %>
</TABLE>
<% } else { %>
<TABLE class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
  	<TR id="trdark">
		<TD>&nbsp;</TD>
    	<TD colspan="2" align="center"><B>Ours</B></TD>
  	</TR>
  	<TR id="trdark">
	    <TD nowrap align="left">Commissions</TD>
	    <TD nowrap align="center">Amount</TD>
	    <TD nowrap align="center">By</TD>
	</TR>
	  <TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Issuance</TD>
	    <TD align="center"><INPUT name="E01ISSFEE" type="text" id="E01ISSFEE" value="<%=msg01.getE01ISSFEE()%>"></TD>
	    <TD align="center">
	    	<SELECT name="E01ISSPBY">
				<OPTION value="A" <%if(msg01.getE01ISSPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01ISSPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01ISSPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Advise</TD>
	    <TD align="center"><INPUT name="E01ADVCOM" type="text" value="<%=msg01.getE01ADVCOM()%>"></TD>
	    <TD align="center">
	    	<SELECT name="E01ADVPBY">
				<OPTION value="A" <%if(msg01.getE01ADVPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01ADVPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01ADVPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Confirmation</TD>
	    <TD align="center"><INPUT type="text" name="E01CNFCOM" value="<%=msg01.getE01CNFCOM()%>"></TD>
	    <TD align="center">
	    	<SELECT name="E01CNFPBY">
				<OPTION value="A" <%if(msg01.getE01CNFPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01CNFPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01CNFPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Amendment</TD>
	    <TD align="center"><INPUT type="text" name="E01AMDFEE" value="<%=msg01.getE01AMDFEE()%>"></TD>
	    <TD align="center">
	    	<SELECT name="E01AMDPBY">
				<OPTION value="A" <%if(msg01.getE01AMDPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01AMDPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01AMDPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Advise of Amendment</TD>
	    <TD align="center"><INPUT type="text" name="E01ADVAMF" value="<%=msg01.getE01ADVAMF()%>"></TD>
	    <TD align="center">
	    	<SELECT name="E01AAMPBY">
				<OPTION value="A" <%if(msg01.getE01AAMPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01AAMPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01AAMPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
	</TR>
  	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Discrepancy</TD>
	    <TD align="center"><INPUT type="text" name="E01DISCOM" value="<%=msg01.getE01DISCOM()%>"></TD>
	    <TD align="center">
	    	<SELECT name="E01DISPBY">
				<OPTION value="A" <%if(msg01.getE01DISPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01DISPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01DISPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Extension of Validity</TD>
	    <TD align="center"><INPUT type="text" name="E01EOVCOM" value="<%=msg01.getE01EOVCOM()%>"></TD>
	    <TD align="center">
	    	<SELECT name="E01EOVPBY">
				<OPTION value="A" <%if(msg01.getE01EOVPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01EOVPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01EOVPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
	</TR>
	 <TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Portes</TD>
	    <TD align="center"><INPUT type="text" name="E01POSTAM" value="<%=msg01.getE01POSTAM()%>"></TD>
	    <TD align="center">
	    	<SELECT name="E01POSPBY">
				<OPTION value="A" <%if(msg01.getE01POSPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01POSPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01POSPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Courier</TD>
	    <TD align="center"><INPUT type="text" name="E01COURAM" value="<%=msg01.getE01COURAM()%>"></TD>
	    <TD align="center">
	    	<SELECT name="E01COUPBY">
				<OPTION value="A" <%if(msg01.getE01COUPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01COUPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01COUPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Swift</TD>
	    <TD align="center"><INPUT type="text" name="E01SWFFEE" value="<%=msg01.getE01SWFFEE()%>"></TD>
	    <TD align="center">
	    	<SELECT name="E01SWFPBY">
				<OPTION value="A" <%if(msg01.getE01SWFPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01SWFPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01SWFPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Additional Swift</TD>
	    <TD align="center"><INPUT type="text" name="E01TLXFEE" value="<%=msg01.getE01TLXFEE()%>"></TD>
	    <TD align="center">
	    	<SELECT name="E01TLXPBY">
				<OPTION value="A" <%if(msg01.getE01TLXPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01TLXPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01TLXPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Cancellation</TD>
	    <TD align="center"><INPUT type="text" name="E01CANFEE" value="<%=msg01.getE01CANFEE()%>"></TD>
	    <TD align="center">
	    	<SELECT name="E01CANPBY">
				<OPTION value="A" <%if(msg01.getE01CANPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01CANPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01CANPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Payment</TD>
	    <TD align="center"><INPUT type="text" name="E01PAYCOM" value="<%=msg01.getE01PAYCOM()%>"></TD>
	    <TD align="center">
	    	<SELECT name="E01PMCPBY">
				<OPTION value="A" <%if(msg01.getE01PMCPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01PMCPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01PMCPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Funds Transfer</TD>
	    <TD align="center"><INPUT type="text" name="E01WTRCOM" value="<%=msg01.getE01WTRCOM()%>"></TD>
	    <TD align="center">
	    	<SELECT name="E01WTRPBY">
				<OPTION value="A" <%if(msg01.getE01WTRPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01WTRPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01WTRPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Reimbursment</TD>
	    <TD align="center"><INPUT type="text" name="E01RMBCOM" value="<%=msg01.getE01RMBCOM()%>"></TD>
	    <TD align="center">
	    	<SELECT name="E01RMBPBY">
				<OPTION value="A" <%if(msg01.getE01RMBPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01RMBPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01RMBPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Commission Deadlines</TD>
	    <TD align="center"><INPUT type="text" name="E01TRMCOM" value="<%=msg01.getE01TRMCOM()%>"></TD>
	    <TD align="center">
	    	<SELECT name="E01TRMPBY">
				<OPTION value="A" <%if(msg01.getE01TRMPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01TRMPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01TRMPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT></TD>
	</TR>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">	<%if(msg01.getE01LCCFL1().equals("Y"))  out.print("Convenio ALADI");
	    					else out.print("Stamps");%>
	    </TD>
	    <TD align="center"><INPUT type="text" name="E01ALDCOM" value="<%=msg01.getE01ALDCOM()%>"></TD>
	    <TD align="center">
	    	<SELECT name="E01ALDPBY">
				<OPTION value="A" <%if(msg01.getE01ALDPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01ALDPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01ALDPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
	</TR>

<%	if (userPO.getHeader1().equals("18")){%>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Interest</TD>
	    <TD align="center"><INPUT type="text" name="E01INTCHG" value="<%=msg01.getE01INTCHG()%>"></TD>
	    <TD align="center">
	    	<SELECT name="E01INTPBY">
				<OPTION value="A" <%if(msg01.getE01INTPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01INTPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01INTPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
	</TR>
<%	}
	if (msg01.getE01OPCODE().equals("2")) {%>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
		<TD align="left">Acceptance</TD><TD align="center">
		<INPUT type="text" name="E01ACPCOM" value="<%=msg01.getE01ACPCOM()%>"></TD>
		<TD align="center">
			<SELECT name="E01ACCPBY">
				<OPTION value="A" <%if(msg01.getE01ACCPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01ACCPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01ACCPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
	</TR>
	<%} else {%>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
		<TD align="left">Deferred Payment</TD><TD align="center">
		<INPUT type="text" name="E01DFPFEE" value="<%=msg01.getE01DFPFEE()%>"></TD>
		<TD align="center">
			<SELECT name="E01DFPPBY">
				<OPTION value="A" <%if(msg01.getE01DFPPBY().equals("A")) out.print("selected");%>>Applicant</OPTION>
				<OPTION value="B" <%if(msg01.getE01DFPPBY().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
				<OPTION value="W" <%if(msg01.getE01DFPPBY().equals("W")) out.print("selected");%>>Wave</OPTION>
			</SELECT>
		</TD>
	</TR>
	<%}%>
</TABLE>

<% } %>

<DIV align="center">
	<H4 style="text-align:center"><INPUT type="checkbox" name="H01FLGWK2" value="A">Accept with Warnings</H4>
	<INPUT id="EIBSBTN" type="submit" name="Submit" value="Submit">
  </DIV>
	
     
</FORM>
</BODY>
</HTML>
