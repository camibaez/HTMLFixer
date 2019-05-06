<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Letters of Credit Opening/Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR"
	content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id="msgLC" class="datapro.eibs.beans.ELC050001Message"	scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos"	scope="session" />

<SCRIPT LANGUAGE="javascript">

<%if (!userPO.getPurpose().equals("NEW")) {%>

	builtNewMenu(letter_of_credit);

<%}%>

   builtHPopUp();

  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }

</SCRIPT>

<%if (!error.getERRNUM().equals("0")) {
	error.setERRNUM("0");
	out.println("<SCRIPT Language=\"Javascript\">");
	out.println("       showErrors()");
	out.println("</SCRIPT>");
}

if (!userPO.getPurpose().equals("NEW")) {
	out.println("<SCRIPT> initMenu();  </SCRIPT>");
}
%>

</head>
<body>
<h3 align="center"><%if (userPO.getPurpose().equals("NEW"))
	out.print("Letter of Credit Opening");
else if (userPO.getPurpose().equals("MAINTENANCE"))
	out.print("Letter of Credit Maintenance");
else
	out.print("");%><img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" alt="lc_opening.jsp,ELC0500"></h3>
<hr size="4">
<form method="post"
	action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0500">
<INPUT TYPE=HIDDEN NAME="SCREEN"
	VALUE="<%if (userPO.getPurpose().equals("NEW"))
	out.print("2");
else
	out.print("4");%>"> <INPUT TYPE=HIDDEN NAME="E01LCMATY"
	VALUE="<%=msgLC.getE01LCMATY().trim()%>">

<table class="tableinfo">
	<tr>
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0"
			class="tbhead">
			<tr id="trdark">
				<td nowrap width="16%">
				<div align="right"><b>Bank :</b></div>
				</td>
				<td nowrap width="20%">
				<div align="left"><input type="text" NAME="E01LCMBNK" readonly
					size="4" maxlength="2" VALUE="<%=msgLC.getE01LCMBNK().trim()%>"></div>
				</td>
				<td nowrap width="16%">
				<div align="right"><b>Product : </b></div>
				</td>
				<td nowrap width="16%">
				<div align="left"><b> <input type="text" name="E01LCMPRO" size="4"
					maxlength="4" value="<%=msgLC.getE01LCMPRO().trim()%>" readonly> </b>
				</div>
				</td>
				<td nowrap width="16%">
				<div align="right"><b>Letter of Credit Number : </b></div>
				</td>
				<td nowrap width="16%">
				<div align="left"><b> <input type="text" name="E01LCMACC" size="10"
					maxlength="9" value="<%=msgLC.getE01LCMACC().trim()%>" readonly> </b>
				</div>
				</td>
			</tr>
			<tr id="trclear">
				<td nowrap width="16%">
				<div align="right"><b>Our Reference : </b></div>
				</td>
				<td nowrap width="20%" colspan=3>
				<div align="left"><input type="text" NAME="E01LCMORF" size="20"
					maxlength="16" VALUE="<%=msgLC.getE01LCMORF().trim()%>"></div>
				</td>
				<td nowrap width="16%">
				<div align="right"><b>Their Reference : </b></div>
				</td>
				<td nowrap width="16%">
				<div align="left"><b> <input type="text" name="E01LCMTRF" size="20"
					maxlength="16" value="<%=msgLC.getE01LCMTRF().trim()%>"> </b></div>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<br>

<h4>Applicant</h4>
<table class="tableinfo">
	<tr>
		<td>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trdark">
				<td align="right">
				<table border="0" cellspacing="0">
					<tr id="trdark">
						<td align="right">Customer or Account Number :</td>
						<td nowrap width="25%"><select name="E01LCMAF2">
							<option value=" "
								<%if (!(msgLC.getE01LCMAF2().equals("C") || msgLC.getE01LCMAF2().equals("A")))
	out.print("selected");%>
								selected></option>
							<option value="C"
								<%if (msgLC.getE01LCMAF2().equals("C"))
	out.print("selected");%>>Customer</option>
							<option value="A"
								<%if (msgLC.getE01LCMAF2().equals("A"))
	out.print("selected");%>>Account</option>
						</select></td>
					</tr>
				</table>
				</td>
				<td>
				<table border="0" cellspacing="0">
					<tr id="trdark">
						<td align="left"><input type="text" name="E01LCMAPA" size="10"
							maxlength="9" value="<%=msgLC.getE01LCMAPA()%>"> <img
							src="<%=request.getContextPath()%>/images/Check.gif"
							alt="mandatory field" align="bottom" border="0"></td>
						<td><a
							href="javascript: GetCustomerDetails('E01LCMAPA','E01LCMAP1','','','E01LCMAP7','E01LCMAP2','E01LCMAP3','E01LCMAP4','','E01LCMAP5','','','E01LCMAP6','','','','','')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"
							onclick="javascript: document.forms[0].E01LCMAF2.selectedIndex = 1"
							align="bottom" border="0"></a> Customer or <a
							href="javascript: GetAccountCustomer('E01LCMAPA','','','','E01LCMAP1')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"
							onclick="javascript: document.forms[0].E01LCMAF2.selectedIndex = 2" align="bottom" border="0"></a> Account</td>
					</tr>
				</table>
				</td>
			</tr>
			<tr id="trclear">
				<td>
				<div align="right">Name :</div>
				</td>
				<td>
				<div align="left"><input type="text" name="E01LCMAP1" size="45"
					maxlength="35" value="<%=msgLC.getE01LCMAP1()%>"></div>
				</td>
			</tr>
			<tr id="trdark">
				<td>
				<div align="right">Address :</div>
				</td>
				<td>
				<div align="left"><input type="text" name="E01LCMAP2" size="45"
					maxlength="35" value="<%=msgLC.getE01LCMAP2()%>"></div>
				</td>
			</tr>
			<tr id="trclear">
				<td>
				<div align="right"></div>
				</td>
				<td>
				<div align="left"><input type="text" name="E01LCMAP3" size="45"
					maxlength="35" value="<%=msgLC.getE01LCMAP3()%>"></div>
				</td>
			</tr>
			<tr id="trdark">
				<td>
				<div align="right"></div>
				</td>
				<td>
				<div align="left"><input type="text" name="E01LCMAP4" size="45"
					maxlength="35" value="<%=msgLC.getE01LCMAP4()%>"></div>
				</td>
			</tr>
			<tr id="trclear">
				<td>
				<div align="right">State :</div>
				</td>
				<td align="left">
				<table>
					<tr>
						<td><input type="text" name="E01LCMAP5" size="4" maxlength="4"
							value="<%=msgLC.getE01LCMAP5()%>"> Zip Code <input type="text"
							name="E01LCMAP6" size="11" maxlength="10"
							value="<%=msgLC.getE01LCMAP6()%>"> Country <input type="text"
							name="E01LCMAP7" size="3" maxlength="7"
							value="<%=msgLC.getE01LCMAP7()%>"></td>
					</tr>
				</table>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<h4>Beneficiary</h4>
<table class="tableinfo">
	<tr>
		<td>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trdark">
				<td align="right">
				<table border="0" cellspacing="0">
					<tr id="trdark">
						<td align="right">Customer or Account Number:</td>
						<td nowrap width="25%"><select name="E01LCMAF3">
							<option value=" "
								<%if (!(msgLC.getE01LCMAF3().equals("C") || msgLC.getE01LCMAF3().equals("A")))
	out.print("selected");%>
								selected></option>
							<option value="C"
								<%if (msgLC.getE01LCMAF3().equals("C"))
	out.print("selected");%>>Customer</option>
							<option value="A"
								<%if (msgLC.getE01LCMAF3().equals("A"))
	out.print("selected");%>>Account</option>
						</select></td>
					</tr>
				</table>
				</td>
				<td>
				<table border="0" cellspacing="0">
					<tr id="trdark">
						<td align="left"><input type="text" name="E01LCMBCU" size="10"
							maxlength="9" value="<%=msgLC.getE01LCMBCU()%>"></td>
						<td><a
							href="javascript: GetCustomerDetails('E01LCMBCU','E01LCMBN1','','','E01LCMBN7','E01LCMBN2','E01LCMBN3','E01LCMBN4','','E01LCMBN5','','','E01LCMBN6','','','','','')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"
							onclick="javascript: document.forms[0].E01LCMAF3.selectedIndex = 1"
							align="bottom" border="0"></a> Customer or <a
							href="javascript: GetAccountCustomer('E01LCMBCU','','','','E01LCMBN1')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"
							onclick="javascript: document.forms[0].E01LCMAF3.selectedIndex = 2"
							align="bottom" border="0"></a> Account</td>
					</tr>
				</table>
				</td>
			</tr>
			<tr id="trclear">
				<td>
				<div align="right">Name :</div>
				</td>
				<td>
				<div align="left"><input type="text" name="E01LCMBN1" size="45"
					maxlength="35" value="<%=msgLC.getE01LCMBN1()%>"></div>
				</td>
			</tr>
			<tr id="trdark">
				<td>
				<div align="right">Address :</div>
				</td>
				<td>
				<div align="left"><input type="text" name="E01LCMBN2" size="45"
					maxlength="35" value="<%=msgLC.getE01LCMBN2()%>"></div>
				</td>
			</tr>
			<tr id="trclear">
				<td>
				<div align="right"></div>
				</td>
				<td>
				<div align="left"><input type="text" name="E01LCMBN3" size="45"
					maxlength="35" value="<%=msgLC.getE01LCMBN3()%>"></div>
				</td>
			</tr>
			<tr id="trdark">
				<td>
				<div align="right"></div>
				</td>
				<td>
				<div align="left"><input type="text" name="E01LCMBN4" size="45"
					maxlength="35" value="<%=msgLC.getE01LCMBN4()%>"></div>
				</td>
			</tr>
			<tr id="trclear">
				<td>
				<div align="right">State :</div>
				</td>
				<td align="left">
				<table>
					<tr>
						<td><input type="text" name="E01LCMBN5" size="2" maxlength="2"
							value="<%=msgLC.getE01LCMBN5()%>"> Zip Code <input type="text"
							name="E01LCMBN6" size="11" maxlength="10"
							value="<%=msgLC.getE01LCMBN6()%>"> Country <input type="text"
							name="E01LCMBN7" size="3" maxlength="7"
							value="<%=msgLC.getE01LCMBN7()%>"></td>
					</tr>
				</table>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<h4>Confirming/Advising Bank</h4>
<table class="tableinfo">
	<tr>
		<td>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trdark">
				<td align="right">
				<table border="0" cellspacing="0">
					<tr id="trdark">
						<td align="right">Customer or Account Number:</td>
						<td nowrap width="25%"><select name="E01LCMAF1">
							<option value=" "
								<%if (!(msgLC.getE01LCMAF1().equals("C") || msgLC.getE01LCMAF1().equals("A")))
	out.print("selected");%>
								selected></option>
							<option value="C"
								<%if (msgLC.getE01LCMAF1().equals("C"))
	out.print("selected");%>>Customer</option>
							<option value="A"
								<%if (msgLC.getE01LCMAF1().equals("A"))
	out.print("selected");%>>Account</option>
						</select></td>
					</tr>
				</table>
				</td>
				<td>
				<table border="0" cellspacing="0">
					<tr id="trdark">
						<td align="left"><input type="text" name="E01LCMIBA" size="10"
							maxlength="9" value="<%=msgLC.getE01LCMIBA()%>"></td>
						<td><a
							href="javascript: GetCustomerDetails('E01LCMIBA','E01LCMIB1','','','E01LCMIB7','E01LCMIB2','E01LCMIB3','E01LCMIB4','','E01LCMIB5','','','E01LCMIB6','','','','','')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"
							onclick="javascript: document.forms[0].E01LCMAF1.selectedIndex = 1"
							align="bottom" border="0"></a> Customer or <a
							href="javascript: GetAccountCustomer('E01LCMIBA','','','','E01LCMIB1')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"
							onclick="javascript: document.forms[0].E01LCMAF1.selectedIndex = 2"
							align="bottom" border="0"></a> Account</td>
					</tr>
				</table>
				</td>
			</tr>
			<tr id="trclear">
				<td>
				<div align="right">Name :</div>
				</td>
				<td>
				<div align="left"><input type="text" name="E01LCMIB1" size="45"
					maxlength="35" value="<%=msgLC.getE01LCMIB1()%>"></div>
				</td>
			</tr>
			<tr id="trdark">
				<td>
				<div align="right">Address :</div>
				</td>
				<td>
				<div align="left"><input type="text" name="E01LCMIB2" size="45"
					maxlength="35" value="<%=msgLC.getE01LCMIB2()%>"></div>
				</td>
			</tr>
			<tr id="trclear">
				<td>
				<div align="right"></div>
				</td>
				<td>
				<div align="left"><input type="text" name="E01LCMIB3" size="45"
					maxlength="35" value="<%=msgLC.getE01LCMIB3()%>"></div>
				</td>
			</tr>
			<tr id="trdark">
				<td>
				<div align="right"></div>
				</td>
				<td>
				<div align="left"><input type="text" name="E01LCMIB4" size="45"
					maxlength="35" value="<%=msgLC.getE01LCMIB4()%>"></div>
				</td>
			</tr>
			<tr id="trclear">
				<td>
				<div align="right">State :</div>
				</td>
				<td align="left">
				<table>
					<tr>
						<td><input type="text" name="E01LCMIB5" size="2" maxlength="2"
							value="<%=msgLC.getE01LCMIB5()%>"> Zip Code <input type="text"
							name="E01LCMIB6" size="11" maxlength="10"
							value="<%=msgLC.getE01LCMIB6()%>"> Country <input type="text"
							name="E01LCMIB7" size="3" maxlength="7"
							value="<%=msgLC.getE01LCMIB7()%>"></td>
					</tr>
				</table>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<h4>Advise Through Bank</h4>
<table class="tableinfo">
	<tr>
		<td align="center" width="100%">
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trdark">
				<td width="30%">
				<div align="right">Customer Number :</div>
				</td>
				<td width="70%">
				<div align="left"><input type="text" name="E01LCMCOR" size="10"
					maxlength="9" value="<%=msgLC.getE01LCMCOR()%>"> <a
					href="javascript: GetCustomerDetails('E01LCMCOR','E01LCMCB1','','','E01LCMCB7','E01LCMCB2','E01LCMCB3','E01LCMCB4','','E01LCMCB5','','','E01LCMCB6','','','','','')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"
					align="bottom" border="0"></a></div>
				</td>
			</tr>
			<tr id="trclear">
				<td>
				<div align="right">Name :</div>
				</td>
				<td>
				<div align="left"><input type="text" name="E01LCMCB1" size="45"
					maxlength="35" value="<%=msgLC.getE01LCMCB1()%>"></div>
				</td>
			</tr>
			<tr id="trdark">
				<td>
				<div align="right">Address :</div>
				</td>
				<td>
				<div align="left"><input type="text" name="E01LCMCB2" size="45"
					maxlength="35" value="<%=msgLC.getE01LCMCB2()%>"></div>
				</td>
			</tr>
			<tr id="trclear">
				<td>
				<div align="right"></div>
				</td>
				<td>
				<div align="left"><input type="text" name="E01LCMCB3" size="45"
					maxlength="35" value="<%=msgLC.getE01LCMCB3()%>"></div>
				</td>
			</tr>
			<tr id="trdark">
				<td>
				<div align="right"></div>
				</td>
				<td>
				<div align="left"><input type="text" name="E01LCMCB4" size="45"
					maxlength="35" value="<%=msgLC.getE01LCMCB4()%>"></div>
				</td>
			</tr>
			<tr id="trclear">
				<td>
				<div align="right">State :</div>
				</td>
				<td align="left">
				<table>
					<tr>
						<td><input type="text" name="E01LCMCB5" size="2" maxlength="2"
							value="<%=msgLC.getE01LCMCB5()%>"> Zip Code <input type="text"
							name="E01LCMCB6" size="11" maxlength="10"
							value="<%=msgLC.getE01LCMCB6()%>"> Country <input type="text"
							name="E01LCMCB7" size="3" maxlength="7"
							value="<%=msgLC.getE01LCMCB7()%>"></td>
					</tr>
				</table>
				</td>
			</tr></table>
		</td>
	</tr>
</table>
<BR>

<div align="center"><input id="EIBSBTN" type=submit name="Submit"
	value="Submit"></div>

</form>
</body>
</html>
