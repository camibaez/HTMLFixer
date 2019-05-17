<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Relationship Client Basic Information</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR"
	content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">


<jsp:useBean id="client" class="datapro.eibs.beans.ESD008002Message"
	scope="session" />

<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos"
	scope="session" />

<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage"
	scope="session" />

<script language="Javascript1.1"
	src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1"
	src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   builtNewMenu(client_inq_rela_opt);

</SCRIPT>

</head>

<body bgcolor="#FFFFFF">

<SCRIPT> initMenu();  </SCRIPT>


<h3 align="center">Relationship Customer Basic Information<img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" ALT="client_inq_rela_basic, ESD0080"></h3>
<hr size="4">
<form method="post"
	action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="72">
<h4>Articles of Incorporation</h4>
<table class="tableinfo" width="100%">
	<tr>
		<td nowrap>

		<table cellspacing="0" cellpadding="2" width="100%" border="0"
			align="left">
			<tr id="trdark">
				<td nowrap width="23%">
				<div align="right">Customer Number :</div>
				</td>
				<td nowrap colspan=3><input type="text" readonly name="E02CUN"
					size="10" maxlength="9" value="<%= client.getE02CUN()%>"></td>
			</tr>
			<tr id="trclear">
				<td nowrap width="44%">
				<div align="right">Legal Name :</div>
				</td>
				<td nowrap width="56%"><input type="text" readonly name="E02NA1"
					size="50" maxlength="45" value="<%= client.getE02NA1().trim()%>"></td>
			</tr>
			<tr id="trdark">
				<td nowrap width="44%">
				<p align="right">Short Name :</p>
				</td>
				<td nowrap width="56%"><input type="text" readonly name="E02SHN"
					size="16" maxlength="15" value="<%= client.getE02SHN().trim()%>"></td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<h4>Classification Codes</h4>
<table class="tableinfo" width="100%">
	<tr>
		<td nowrap>

		<table cellspacing="0" cellpadding="2" width="100%" border="0"
			align="left" bordercolor="#FFFFFF" bgcolor="#FFFFFF">
			<tr id="trdark">
				<td nowrap width="42%">
				<div align="right">Main Officer :</div>
				</td>
				<td nowrap width="58%"><input type="text" readonly name="D02OFC"
					size="35" maxlength="35" value="<%= client.getD02OFC().trim()%>"></td>
			</tr>
			<tr id="trclear">
				<td nowrap width="42%">
				<div align="right">Secondary Officer :</div>
				</td>
				<td nowrap width="58%"><input type="text" readonly name="D02OF2"
					size="35" maxlength="35" value="<%= client.getD02OF2().trim()%>"></td>
			</tr>
			<tr id="trdark">
				<td nowrap width="42%">
				<div align="right">Industry Code :</div>
				</td>
				<td nowrap width="58%"><input type="text" readonly name="D02INC"
					size="35" maxlength="35" value="<%= client.getD02INC().trim()%>"></td>
			</tr>
			<tr id="trclear">
				<td nowrap width="42%">
				<div align="right">Business Line :</div>
				</td>
				<td nowrap width="58%"><input type="text" readonly name="D02BUC"
					size="35" maxlength="35" value="<%= client.getD02BUC().trim()%>"></td>
			</tr>
			<tr id="trdark">
				<td nowrap width="42%">
				<div align="right">Country of Residence :</div>
				</td>
				<td nowrap width="58%"><input type="text" readonly name="D02GEC"
					size="35" maxlength="35" value="<%= client.getD02GEC().trim()%>"></td>
			</tr>
			<tr id="trdark">
				<td nowrap width="42%">
				<div align="right">Legal Entity :</div>
				</td>
				<td nowrap width="58%"><input type="text" readonly name="D02UC2"
					size="35" maxlength="35" value="<%= client.getD02UC2().trim()%>"></td>
			</tr>
			<tr id="trclear">
				<td nowrap width="42%">
				<div align="right">User Code 3 :</div>
				</td>
				<td nowrap width="58%"><input type="text" readonly name="D02UC3"
					size="35" maxlength="35" value="<%= client.getD02UC3().trim()%>"></td>
			</tr>
			<tr id="trdark">
				<td nowrap width="42%">
				<div align="right">Risk Level :</div>
				</td>
				<td nowrap width="58%"><input type="text" name="E02RSL" size="5"
					maxlength="4" value="<%= client.getE02RSL().trim()%>" readonly></td>
			</tr>
		</table>
		</td>
	</tr>
</table>


<H4>Additional Information</H4>
<TABLE class="tableinfo" width="100%">
	<TBODY>
		<TR>
			<TD nowrap width="100%">

			<TABLE cellspacing="0" cellpadding="2" width="100%" border="0"
				align="left">
				<TBODY>
					<tr id="trdark">
						<td nowrap width="28%">
						<div align="right">Withholding Table :</div>
						</td>
						<td nowrap><input type="text" readonly name="E02TAX" size="2"
							maxlength="1" value="<%= client.getE02TAX().trim()%>"></td>
					</tr>
					<TR id="trclear">

						<td nowrap width="23%">
						<div align="right">Subject to Taxes in U.S. :</div>
						</td>

						<td nowrap width="36%"><input type="text" readonly name="E02FG2"
							size="2" maxlength="1"
							<% if (client.getF02FG2().equals("Y")) out.print("id=\"txtchanged\""); %>
							value="<% if (client.getE02FG2().equals("Y")) { out.print("Yes"); }
						else if (client.getE02FG2().equals("N")) { out.print("No"); }%>">
						</td>
					</TR>
					<tr id="trdark">
						<td nowrap width="18%">
						<div align="right">Treasury Customer :</div>
						</td>
						<td nowrap width="39%"><input type="text" readonly name="E02FL5"
							size="4" maxlength="3"
							value="<% if (client.getE02FL5().trim().equals("Y")) { out.print("Yes"); } 
                		   else if (client.getE02FL5().trim().equals("N")) { out.print("No"); }
				   else { out.print("No"); } %>">
						</td>
					</tr>
					<TR id="trclear">

						<td nowrap width="23%">
						<div align="right">Potencial Amount :</div>
						</td>

						<td nowrap width="36%"><input type="text" readonly name="E02CAI"
							size="17" value="<%= client.getE02CAI()%>">
						</td>
					</TR>
				</TBODY>
			</TABLE>
			</TD>
		</TR>
	</TBODY>
</TABLE>
</form>
</body>
</html>
