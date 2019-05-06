<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import="datapro.eibs.master.Util"%>
<html>
<head>
<title>Treasury Module</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR"
	content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">



<jsp:useBean id="deal" class="datapro.eibs.beans.EDL0120DSMessage"
	scope="session" />

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"
	scope="session" />

<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos"
	scope="session" />

<script language="Javascript1.1"
	src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1"
	src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

</head>
<body>
<%
		if (!error.getERRNUM().equals("0")) {
			error.setERRNUM("0");
		%>
<SCRIPT Language="Javascript">
            showErrors()
     </SCRIPT>
<%}
		String sTitle = "Time Deposits";
		if (userPO.getHeader23().equals("1")) {
			sTitle = "Interbank";
		}
%>
<h3 align="center"><%= sTitle%> - Confirmation Ticket</h3>
<hr size="4">
<form method="post"
	action="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0120">
<input type=HIDDEN name="SCREEN" value="2">
<table class="tableinfo" width="100%">
	<tr id="trclear">
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trclear">
				<td nowrap width="15%">
				<div align="right"><b>Counterparty :</b></div>
				</td>
				<td nowrap colspan="3" width="85%">
				<div align="left"><input type="hidden" name="D01DLSCP1"
					value="<%= deal.getD01DLSCP1()%>"> <%= deal.getD01DLSCP1()%></div>
				</td>
			</tr>
			<tr id="trclear">
				<td nowrap width="15%">
				<div align="right"><b>Location :</b></div>
				</td>
				<td nowrap colspan="3" width="85%"><input type="hidden"
					name="D01DLSCP2" value="<%= deal.getD01DLSCP2()%>"> <%= deal.getD01DLSCP2()%></td>
			</tr>
			<tr id="trclear">
				<td nowrap width="15%">
				<div align="right"></div>
				</td>
				<td nowrap colspan="3" width="85%"><input type="hidden"
					name="D01DLSCP3" value="<%= deal.getD01DLSCP3()%>"> <%= deal.getD01DLSCP3()%>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<br>
<table class="tableinfo" width="597">
	<tr>
		<td nowrap>
		<table cellpadding=2 cellspacing=0 width="100%" border="0">
			<tr id="trclear">
				<td nowrap>
				<div align="right"></div>
				<div align="right">Date :</div>
				</td>
				<td nowrap><%= Util.formatDate(deal.getE01DLSDD1(), deal.getE01DLSDD2(),
						deal.getE01DLSDD3())%></td>
				<td nowrap>
				<div align="right">Time :</div>
				</td>
				<td nowrap colspan="2" width="8%"><%= userPO.getHeader1()%></td>
			</tr>
			<tr id="trclear">
				<td nowrap width="35%">
				<div align="right">Broker :</div>
				</td>
				<td nowrap width="25%"><%= deal.getE01DLSBRK()%> - <%= deal.getD01FEBNM1()%>
				</td>
				<td nowrap width="32%">
				<div align="right">Reference Number :</div>
				</td>
				<td nowrap colspan="2" width="8%"><%= deal.getE01DLSREF()%></td>
			</tr>
			<tr id="trclear">
				<td nowrap width="35%">
				<div align="right">Currency :</div>
				</td>
				<td nowrap width="25%"><%= deal.getE01DLSCCY().trim()%></td>
				<td nowrap width="32%">
				<div align="right">Action Taken :</div>
				</td>
				<td nowrap colspan="2" width="8%"><%if (deal.getE01DLSSBT().equals("PU")) {	%> Placement <%} else {	%> Taking <%}%></td>
			</tr>
			<tr id="trclear">
				<td nowrap width="35%">
				<div align="right">Amount :</div>
				</td>
				<td nowrap width="25%"><%= Util.fcolorCCY(deal.getE01DLSAMN())%></td>
				<td nowrap align="right" width="32%">Rate :</td>
				<td nowrap colspan="2" width="8%"><%= deal.getE01DLSRA1()%></td>
			</tr>
			<tr id="trclear">
				<td nowrap width="35%">
				<div align="right">Value Date :</div>
				</td>
				<td nowrap><%= Util.formatDate(deal.getE01DLSVD1(), deal.getE01DLSVD2(),
						deal.getE01DLSVD3())%></td>
				<td nowrap>
				<div align="right">Maturity Date :</div>
				</td>
				<td nowrap colspan="2"><%= Util.formatDate(deal.getE01DLSMA1(), deal.getE01DLSMA2(),
						deal.getE01DLSMA3())%></td>
			</tr>
			<tr id="trclear">
				<td nowrap width="35%">
				<div align="right">Notes :</div>
				</td>
				<td nowrap colspan="4"><%= deal.getE01DLSOT1().trim()%></td>
			</tr>
			<tr id="trclear">
				<td nowrap width="35%">
				<%-- <div align="right"></div> --%>
				</td>
				<td nowrap colspan="4"><%= deal.getE01DLSOT2().trim()%></td>
			</tr>
			<tr id="trclear">
				<td nowrap width="35%">
				<div align="right">By :</div>
				</td>
				<td nowrap><%= deal.getE01DLSDID().trim()%> - <%= deal.getD01USRDSC().trim()%></td>
				<td nowrap width="21%"><input type="hidden" name="E01DLSHEF"
					value="<%= deal.getE01DLSHEF()%>"></td>
				<td nowrap><%if (deal.getE01DLSHEF().equals("Y")) {	%> X <%} %>	IBF <%if (!deal.getE01DLSHEF().equals("Y")) {%> X <%}%> NON IBF</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<br>
<%if (deal.getH01FLGWK3().equals("E")) {
			%>
<TABLE class="tableinfo" width="736">
	<TBODY>
		<TR>
			<TD nowrap>
			<TABLE cellpadding="2" cellspacing="0" border="0" width="100%">
				<TBODY>
					<TR id="trdark0">
						<TD nowrap width="15%">
						<DIV align="right">Trade Date :</DIV>
						</TD>
						<TD nowrap width="35%"><%= Util.formatDate(deal.getE01DLSDD1(), deal.getE01DLSDD2(),
							deal.getE01DLSDD3())%>
						</TD>
						<TD nowrap width="15%">
						<DIV align="right">Accrued Interest :</DIV>
						</TD>
						<TD nowrap width="35%"><%= deal.getE01DLSAM5().trim()%></TD>
					</TR>
					<TR id="trclear0">
						<TD nowrap height="37" width="25%">
						<DIV align="right">Terms :</DIV>
						</TD>
						<TD nowrap height="37" width="25%"><%= deal.getE01DLSTRM().trim()%><%
			if (deal.getE01DLSTRC().equals("D"))
				out.print("Day(s)");
			else if (deal.getE01DLSTRC().equals("M"))
				out.print("Month(s)");
			else if (deal.getE01DLSTRC().equals("Y"))
				out.print("Year(s)");%></TD>
						<TD nowrap height="37" width="25%">
						<DIV align="right">Amount at Maturity :</DIV>
						</TD>
						<TD nowrap width="25%"><%= deal.getE01DLSAM1().trim()%></TD>
					</TR>
					<TR id="trdark0">
						<TD nowrap height="43" width="15%">
						<DIV align="right">Accrual Type Basis :</DIV>
						</TD>
						<TD nowrap height="43" width="35%"><%
			if (deal.getE01DLSICT().equals("1"))
				out.print("Actual/actual");
			else if (deal.getE01DLSICT().equals("2"))
				out.print("Actual/365");
			else if (deal.getE01DLSICT().equals("3"))
				out.print("Actual/365 (366 in leap year)");
			else if (deal.getE01DLSICT().equals("4"))
				out.print("Actual/360");
			else if (deal.getE01DLSICT().equals("5"))
				out.print("30/360");
			else if (deal.getE01DLSICT().equals("6"))
				out.print("30E/360");
			%></TD>
						<TD nowrap height="43" width="35%"></TD>
					</TR>
					<TR id="trclear0">
						<TD nowrap width="15%">
						<DIV align="right"></DIV>
						</TD>
						<TD nowrap width="35%"></TD>
						<TD nowrap width="15%"></TD>
						<TD nowrap width="35%"></TD>
					</TR>
					<TR id="trdark0">
						<TD nowrap width="15%">
						<DIV align="right">Branch :</DIV>
						</TD>
						<TD nowrap width="35%"><%= deal.getE01DLSBRN().trim()%></TD>
						<TD nowrap width="15%">
						<DIV align="right"></DIV>
						</TD>
						<TD nowrap width="35%"></TD>
					</TR>
				</TBODY>
			</TABLE>
			</TD>
		</TR>
	</TBODY>
</TABLE>
<%}%>
<table class="tableinfo">
	<tr>
		<td nowrap>
		<table width="100%">
			<tr id="trdark">
				<td nowrap>&nbsp;</td>
				<td nowrap colspan="2">
				<div align="center"><b>Limit Amount </b></div>
				</td>
				<td nowrap>
				<div align="center"><b>Available Limit</b></div>
				</td>
				<td nowrap>
				<div align="center"><b>Ending Limit Amount </b></div>
				</td>
			</tr>
			<tr id="trclear">
				<td nowrap>Credit Lines</td>
				<td nowrap colspan="2">
				<div align="right"><%= Util.fcolorCCY(deal.getD01LIMAMT())%>:</div>
				</td>
				<td nowrap>
				<div align="right"><%= Util.fcolorCCY(deal.getD01LIMAVL())%></div>
				</td>
				<td nowrap>
				<div align="right"><b><%= Util.fcolorCCY(deal.getD01LIMEND())%></b></div>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</form>
</body>
</html>
