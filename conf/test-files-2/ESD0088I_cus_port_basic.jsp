<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Customer Portfolio</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR"
	content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">

<jsp:useBean id="cusPort" class="datapro.eibs.beans.ESD008801Message"
	scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"
	scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos"
	scope="session" />

<script language="Javascript1.1"
	src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1"
	src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">
  
  builtHPopUp();

  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
  }

<%if (userPO.getPurpose().equals("INQUIRY")) {
%>
  builtNewMenu(cus_i_port_opt);
  initMenu();
<%}%>  
  
<%if (userPO.getPurpose().equals("APPROVAL")) {
%>

  builtNewMenu(cus_a_port_opt);
  initMenu();
<%}%>

</SCRIPT>


</head>
<body>
<%if (!error.getERRNUM().equals("0")) {
	error.setERRNUM("0");
	out.println("<SCRIPT Language=\"Javascript\">");
	out.println("       showErrors()");
	out.println("</SCRIPT>");
}
%>
<div align="center">
<h3>Customer Portfolio<img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" alt="cus_port_basic.jsp,ESD0088I"></h3>
</div>
<hr size="4">
<form method="post"
	action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0088">
<h4>Basic Information <input type="hidden" name="SCREEN" value="2"></h4>
<table border="0" width="100%">
	<tr id="trclear">
		<td width="82%">
		<div align="right">Status :</div>
		</td>
		<td width="18%" <% if (cusPort.getF01PRFSTS().equals("Y")) out.print("id=\"txtchanged\""); %>>
		<%if (cusPort.getE01PRFSTS().equals("P")) out.print("Pending");
			else if (cusPort.getE01PRFSTS().equals("A")) out.print("Active");
			else if (cusPort.getE01PRFSTS().equals("I")) out.print("Inactive");
			else out.print("");%>
		</td>
	</tr>
</table>
<br>
<table class="tableinfo">
	<tr>
		<td nowrap>
		<table cellpadding=2 cellspacing=0 width="100%" border="0">
			<tr id="trclear">
				<td nowrap width="34%">
				<div align="right">Portfolio / Description :</div>
				</td>
				<td nowrap>
					<input type="text" readonly name="E01PRFNUM" size="12"
					maxlength="9" value="<%=cusPort.getE01PRFNUM().trim()%>"> / <input
					type="text" readonly name="E01PRFDSC" size="35" maxlength="35"
					value="<%=cusPort.getE01PRFDSC()%>"></td>
			</tr>
			<TR id="trdark">
				<TD nowrap width="34%">
				<DIV align="right">Main Customer :</DIV>
				</TD>
				<TD nowrap>
					<INPUT type="text" readonly name="E01PRFCUN" size="12"
					maxlength="9" value="<%=cusPort.getE01PRFCUN().trim()%>"> <INPUT
					type="text" readonly name="D01CUSNA1" size="35" maxlength="35"
					value="<%=cusPort.getD01CUSNA1().trim()%>"></TD>

			</TR>
			<tr id="trclear">
				<td nowrap width="34%">
				<div align="right">Account Officer :</div>
				</td>
				<td nowrap>
					<input type="text" readonly <% if (cusPort.getF01PRFOFC().equals("Y")) out.print("id=\"txtchanged\""); %>
					name="E01PRFOFC" size="6"
					maxlength="4" value="<%=cusPort.getE01PRFOFC().trim()%>"> <input
					type="text" readonly name="D01OFCNME" size="35" maxlength="35"
					value="<%=cusPort.getD01OFCNME()%>"></td>
			</tr>
			<%if (!userPO.getPurpose().equals("NEW")) {%>
			<tr id="trdark">
				<td nowrap width="34%">
				<div align="right">Default Cash Account :</div>
				</td>
				<td nowrap>
					<input type="text" readonly <% if (cusPort.getF01PRFHAC().equals("Y")) out.print("id=\"txtchanged\""); %>
					name="E01PRFHAC" size="12" maxlength="9" value="<%=cusPort.getE01PRFHAC()%>"></td>
			</tr>
			<tr id="trclear">
				<%} else {%>
			<tr id="trdark">
				<%}%>
				<td nowrap width="34%">
				<div align="right">Opening Date :</div>
				</td>
				<td nowrap>
					<input type="text" readonly <% if (cusPort.getF01PRFOP1().equals("Y")) out.print("id=\"txtchanged\""); %>
					name="E01PRFOP1" size="3" maxlength="2" value="<%=cusPort.getE01PRFOP1().trim()%>" onkeypress="enterInteger()"> 
					<input type="text" readonly <% if (cusPort.getF01PRFOP2().equals("Y")) out.print("id=\"txtchanged\""); %>
					name="E01PRFOP2" size="3" maxlength="2" value="<%=cusPort.getE01PRFOP2().trim()%>" onkeypress="enterInteger()"> 
					<input type="text" readonly <% if (cusPort.getF01PRFOP3().equals("Y")) out.print("id=\"txtchanged\""); %>
					name="E01PRFOP3" size="3" maxlength="2" value="<%=cusPort.getE01PRFOP3().trim()%>" onkeypress="enterInteger()">
				</td>
			</tr>
			<tr id="trdark">
				<td nowrap width="34%">
				<div align="right">Portfolio Currency :</div>
				</td>
				<td nowrap>
					<input type="text" readonly <% if (cusPort.getF01PRFVCY().equals("Y")) out.print("id=\"txtchanged\""); %>
					name="E01PRFVCY" size="4" maxlength="3" value="<%=cusPort.getE01PRFVCY().trim()%>"></td>
			</tr>
			<TR id="trclear">
				<TD nowrap width="34%" align="right">Statement Via :</TD>
				<TD nowrap>
				<SELECT disabled name="E01PRFSTM" <% if (cusPort.getF01PRFSTM().equals("Y")) out.print("id=\"txtchanged\""); %>>
					<OPTION value="N" <%if (cusPort.getE01PRFSTM().equals("N")) {out.print("selected"); }%>>None</OPTION>
					<OPTION value="E" <%if (cusPort.getE01PRFSTM().equals("E")) {out.print("selected"); }%>>e-Mail</OPTION>
					<OPTION value="F" <%if (cusPort.getE01PRFSTM().equals("F")) {out.print("selected"); }%>>Fax</OPTION>
					<OPTION value="P" <%if (cusPort.getE01PRFSTM().equals("P")) {out.print("selected"); }%>>Printer</OPTION>
					<OPTION value="B" <%if (cusPort.getE01PRFSTM().equals("B")) {out.print("selected"); }%>>Printer/e-Mail</OPTION>
				</SELECT></TD>
			</TR>
			<tr id="trdark">
				<td nowrap width="34%">
				<div align="right">Confirmation Via :</div>
				</td>
				<td nowrap>
				<div align="left">
				<select disabled name="E01PRFCNF" <% if (cusPort.getF01PRFCNF().equals("Y")) out.print("id=\"txtchanged\""); %>>
					<option value="N" <%if (cusPort.getE01PRFCNF().equals("N")) {out.print("selected"); }%>>None</option>
					<option value="E" <%if (cusPort.getE01PRFCNF().equals("E")) {out.print("selected"); }%>>e-Mail</option>
					<option value="F" <%if (cusPort.getE01PRFCNF().equals("F")) {out.print("selected"); }%>>Fax</option>
					<option value="P" <%if (cusPort.getE01PRFCNF().equals("P")) {out.print("selected"); }%>>Printer</option>
					<option value="B" <%if (cusPort.getE01PRFCNF().equals("B")) {out.print("selected"); }%>>Printer/e-Mail</OPTION>
				</select></div>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<h4>Additional Information</h4>
<table class="tableinfo">
	<tr>
		<td nowrap>
		<table cellpadding=2 cellspacing=0 width="100%" border="0">
			<tr id="trdark">
				<td nowrap colspan="2">Legal Name :</td>
			</tr>
			<tr id="trdark">
				<td nowrap colspan="2">
				<div align="center"><textarea name="E01LEGNME" cols="40" rows="9"
					readonly> <%=cusPort.getE01LEGNME()%> </textarea></div>
				</td>
			</tr>
			<tr id="trclear">
				<td nowrap colspan="2">
				<div align="left">Comments :</div>
				</td>
			</tr>
			<tr id="trclear">
				<td nowrap colspan=2 align=center>
				<input type="text" readonly <% if (cusPort.getF01PRFCM1().equals("Y")) out.print("id=\"txtchanged\""); %>
					name="E01PRFCM1" size="80" maxlength="80" value="<%=cusPort.getE01PRFCM1()%>"> <br>
				<input type="text" readonly <% if (cusPort.getF01PRFCM2().equals("Y")) out.print("id=\"txtchanged\""); %>
					name="E01PRFCM2" size="80" maxlength="80" value="<%=cusPort.getE01PRFCM2()%>"> <br>
				<input type="text" readonly <% if (cusPort.getF01PRFCM3().equals("Y")) out.print("id=\"txtchanged\""); %>
					name="E01PRFCM3" size="80" maxlength="80" value="<%=cusPort.getE01PRFCM3()%>"> <br>
				<input type="text" readonly <% if (cusPort.getF01PRFCM4().equals("Y")) out.print("id=\"txtchanged\""); %>
					name="E01PRFCM4" size="80" maxlength="80" value="<%=cusPort.getE01PRFCM4()%>"></td>
			</tr>
		</table>
		<H4>Classification Codes</H4>
		<TABLE class="tableinfo" width="100%">
			<TBODY>
				<TR>
					<TD nowrap width="100%">

					<TABLE cellspacing="0" cellpadding="2" width="100%" border="0"
						align="left" bordercolor="#FFFFFF" bgcolor="#FFFFFF">
						<TBODY>
							<TR id="trdark">
								<TD nowrap width="22%" align="right">
								<DIV align="right"></DIV>
								Substitute Officer :</TD>
								<TD nowrap width="18%">
								<INPUT type="text" readonly <% if (cusPort.getF01OF2().equals("Y")) out.print("id=\"txtchanged\""); %>
									name="E01OF2" size="5" maxlength="3" value="<%=cusPort.getE01OF2().trim()%>">
								</TD>
								<TD nowrap width="29%">
								<DIV align="right"></DIV>
								</TD>
								<TD nowrap width="31%"></TD>
							</TR>
							<TR id="teclear">
								<TD nowrap width="22%">
								<DIV align="right">Industry Code :</DIV>
								</TD>
								<TD nowrap width="18%">
								<INPUT type="text" readonly <% if (cusPort.getF01INC().equals("Y")) out.print("id=\"txtchanged\""); %>
									name="E01INC" size="5" maxlength="3" value="<%=cusPort.getE01INC().trim()%>">
								</TD>
								<TD nowrap width="29%">
								<DIV align="right">Business Line :</DIV>
								</TD>
								<TD nowrap width="31%">
								<INPUT type="text" readonly <% if (cusPort.getF01BUC().equals("Y")) out.print("id=\"txtchanged\""); %>
									name="E01BUC" size="5" maxlength="3" value="<%=cusPort.getE01BUC().trim()%>">
								</TD>
							</TR>
							<TR id="trdark">
								<TD nowrap width="22%">
								<DIV align="right">Country of Residence :</DIV>
								</TD>
								<TD nowrap width="18%">
								<INPUT type="text" readonly <% if (cusPort.getF01GEC().equals("Y")) out.print("id=\"txtchanged\""); %>
									name="E01GEC" size="5" maxlength="3" value="<%=cusPort.getE01GEC().trim()%>"> 
								</TD>
								<TD nowrap width="29%">
								</TD>
								<TD nowrap width="31%">
              					</TD>
							</TR>
							<TR id="teclear">
								<TD nowrap width="22%">
								<DIV align="right">Legal Entity :</DIV>
								</TD>
								<TD nowrap width="18%">
								<INPUT type="text" readonly <% if (cusPort.getF01UC2().equals("Y")) out.print("id=\"txtchanged\""); %>
									name="E01UC2" size="5" maxlength="3" value="<%=cusPort.getE01UC2().trim()%>"> 
								</TD>
								<TD nowrap width="29%">
								<DIV align="right">User Code 3 :</DIV>
								</TD>
								<TD nowrap width="31%">
								<INPUT type="text" readonly <% if (cusPort.getF01UC3().equals("Y")) out.print("id=\"txtchanged\""); %>
									name="E01UC3" size="5" maxlength="3" value="<%=cusPort.getE01UC3().trim()%>"> Only for Reg. "O"</TD>
							</TR>
							<TR id="trdark">
								<TD nowrap width="22%">
								<DIV align="right">Risk Level :</DIV>
								</TD>
								<TD nowrap width="18%">
								<INPUT type="text" readonly <% if (cusPort.getF01RSL().equals("Y")) out.print("id=\"txtchanged\""); %>
									name="E01RSL" size="5" maxlength="4" value="<%=cusPort.getE01RSL().trim()%>"> 
								</TD>
								<TD nowrap width="29%">&nbsp;</TD>
								<TD nowrap width="31%">&nbsp;</TD>
							</TR>
						</TBODY>
					</TABLE>
					</TD>
				</TR>
			</TBODY>
		</TABLE>


		<H4>Additional Information</H4>
		<TABLE class="tableinfo" width="100%">
			<TBODY>
				<TR>
					<TD nowrap width="100%">

					<TABLE cellspacing="0" cellpadding="2" width="100%" border="0"
						align="left" bordercolor="#FFFFFF" bgcolor="#FFFFFF">
						<TBODY>
							<TR id="trdark">
								<TD nowrap width="22%">
								<DIV align="right">Withholding Table :</DIV>
								</TD>
								<TD nowrap width="41%" bordercolor="#FFFFFF">
								<INPUT type="text" readonly <% if (cusPort.getF01TAX().equals("Y")) out.print("id=\"txtchanged\""); %>
									name="E01TAX" size="2" maxlength="1" value="<%=cusPort.getE01TAX().trim()%>">
								</TD>
							</TR>
							<TR id="teclear">

								<TD nowrap width="23%">
								<DIV align="right">Subject to Taxes in U.S. :</DIV>
								</TD>

								<TD nowrap width="36%">
								<INPUT type="radio" readonly <% if (cusPort.getF01FG2().equals("Y")) out.print("id=\"txtchanged\""); %>
									name="E01FG2" value="Y" <%if (cusPort.getE01FG2().equals("Y")) out.print("checked");%>> Yes 
								<INPUT type="radio" readonly <% if (cusPort.getF01FG2().equals("Y")) out.print("id=\"txtchanged\""); %> 
									name="E01FG2" value="N" <%if (cusPort.getE01FG2().equals("N")) out.print("checked");%>> No </TD>
							</TR>
							<TR id="trdark">
								<TD nowrap width="23%">
								<DIV align="right">Treasury Portfolio :</DIV>
								</TD>

								<TD nowrap width="39%">
									<INPUT type="radio" readonly <% if (cusPort.getF01FL5().equals("Y")) out.print("id=\"txtchanged\""); %>
										name="E01FL5" value="Y" <%if (cusPort.getE01FL5().equals("Y")) out.print("checked");%>> Yes 
									<INPUT type="radio"  <% if (cusPort.getF01FL5().equals("Y")) out.print("id=\"txtchanged\""); %>
										name="E01FL5" value="N" <%if (cusPort.getE01FL5().equals("N"))out.print("checked");%>> No </TD>
							</TR>
							<TR id="teclear">
								<TD nowrap width="22%" align="right">Potencial Amount :</TD>
								<TD nowrap width="41%" bordercolor="#FFFFFF">
								<INPUT type="text" <% if (cusPort.getF01CAI().equals("Y")) out.print("id=\"txtchanged\""); %>
									name="E01CAI" size="16" maxlength="15" value="<%=cusPort.getE01CAI().trim()%>"></TD>
							</TR>
						</TBODY>
					</TABLE>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
		</td>
	</tr>
</table>

</form>
</body>
</html>
