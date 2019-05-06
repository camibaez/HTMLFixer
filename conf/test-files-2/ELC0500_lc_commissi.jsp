<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Letters of Credit Opening/Maintenance</title>
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<meta http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </script>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </script>

<jsp:useBean id="msgLC" class="datapro.eibs.beans.ELC050004Message" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />

<script LANGUAGE="javascript">

<%if (!userPO.getPurpose().equals("NEW")){%>
	builtNewMenu(lc_opening);
<%}%>

   builtHPopUp();

  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }
   
</script>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 } 
    out.println("<SCRIPT> initMenu();  </SCRIPT>");
%>

</head>

<body>
<h3 align="center">Letters Of Credit [Commissions]<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="lc_commissi.jsp, ELC0500"></h3>
<hr size="4">


<form METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0500" >
<input TYPE=HIDDEN NAME="SCREEN" VALUE="8">
<table class="tableinfo">
	<tr>
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0" 	class="tbhead">
			<tr id="trdark">
				<td nowrap width="16%">
				   <div align="right"><b>Bank :</b></div>
				</td>
				<td nowrap width="20%">
				   <div align="left"><input type="text" name="E04LCMBNK" readonly size="4" maxlength="2" value="<%=msgLC.getE04LCMBNK().trim()%>"></div>
				</td>
				<td nowrap width="16%">
				  <div align="right"><b>Product : </b></div>
				</td>
				<td nowrap width="16%">
				  <div align="left"><b> <input type="text" name="E01LCMPRO" size="4"maxlength="4" value="<%=msgLC.getE04LCMPRO().trim()%>" readonly> </b></div>
				</td>
				<td nowrap width="16%">
				   <div align="right"><b>Letter of Credit  Number:</b></div>
				</td>
				<td nowrap width="16%">
				   <div align="left"><b><input type="text" name="E04LCMACC" size="12"maxlength="12" value="<%=msgLC.getE04LCMACC().trim()%>" readonly> </b>
				</div>
				</td>
			</tr>
		<tr id="trclear">
				<td nowrap width="16%">
				   <div align="right"><B>Issuing Date :</B></div>
				</td>
				<td nowrap width="20%">
				   <div align="left"><INPUT type="text" name="E04LCMBNK0" readonly
					size="10" maxlength="10"
					value='<%=msgLC.getE04LCMID1() + "/" + msgLC.getE04LCMID2() +
					"/"+(msgLC.getE04LCMID3().length() == 1 ? "0"+msgLC.getE04LCMID3() : msgLC.getE04LCMID3())%>'></div>
				</td>
				<td nowrap width="16%">
				  <div align="right"><B>Tariff and Currency :</B></div>
				</td>
				<td nowrap width="16%">
				  <div align="left"><b> </b><INPUT type="text" name="E04LCMTAR"
					size="2" maxlength="2" value="<%=msgLC.getE04LCMTAR()%>" readonly><INPUT
					type="text" name="E04LCMTCY" size="3" maxlength="3"
					value="<%=msgLC.getE04LCMTCY()%>" readonly></div>
				</td>
				<td nowrap width="16%">
				   <div align="right"><b>Amount (Base Currency) :</b></div>
				</td>
				<td nowrap width="16%">
				   <div align="left"><B><INPUT type="text" name="E04TCYAMN" size="12" maxlength="12" value="<%=msgLC.getE04TCYAMN()%>" readonly></B></div>
				</td>
			</tr>
			
  		<tr id="trdark">
				<td nowrap width="16%">
				<div align="right"><b>Expiration Date :</b></div>
				</td>
				<td nowrap width="20%" colspan=3>
				<div align="left"><input type="text" name="E04LCMBNK0" readonly
					size="10" maxlength="10" value=	"<%=msgLC.getE04LCMEX1()+"/"+msgLC.getE04LCMEX2()+"/"
					+(msgLC.getE04LCMEX3().length() == 1 ? "0"+msgLC.getE04LCMEX3() : msgLC.getE04LCMEX3())%>"></div></td>
				<td nowrap width="16%">
				<div align="right"><b>Amount (L/C Currency) :</b></div>
				</td>
				<td nowrap width="16%">
				<div align="left"><b><input type="text" name="E04LCMOAM" size="12"
					maxlength="12" value="<%=msgLC.getE04LCMOAM()%>" readonly> </b></div>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<br>

<h4>Commissions</h4>
<table class="tableinfo">
	<tbody>
		<tr>
			<td>
			<table border="0" cellspacing="0" width="100%">
				<tbody>
					<tr id="trdark">
						<td align="right"><b>Concept</b></td>
						<td nowrap align="center" width="17%"><b>Amount</b></td>
						<td nowrap align="center" width="15%"><b>Charges By</b></td>
						<td nowrap align="center" width="26%"></td>
						<td nowrap align="center" width="12%"></td>
					</tr>
					<tr id="trclear">
							<td align="right">Issuance</td>
							<td nowrap width="17%" align="center">
								<input type="text" name="E04LCMC01" size="15" maxlength="15" value="<%=msgLC.getE04LCMC01()%>">
							</td>
							<td nowrap width="15%">
								<select name="E04LCMP01"  >
									<option value="A">Applicant</option>
									<option value="B" <%if(msgLC.getE04LCMP01().equals("B")) out.print("selected");%>>Beneficiary</option>
									<option value="W" <%if(msgLC.getE04LCMP01().equals("W")) out.print("selected");%>>Waive</option>
								</select></td>
							<td nowrap width="26%"></td>
							<td nowrap width="12%"></td>
						</tr>
					<tr id="trdark">
						<td align="right">Advising</td>
						<td nowrap width="17%" align="center">
							<input type="text" name="E04LCMC02" size="15" maxlength="15" value="<%=msgLC.getE04LCMC02()%>">
						</td>
						<td nowrap width="15%">
							<select name="E04LCMP02">
								<option value="A">Applicant</option>
								<option value="B" <%if(msgLC.getE04LCMP02().equals("B")) out.print("selected");%>>Beneficiary</option>
								<option value="W" <%if(msgLC.getE04LCMP02().equals("W")) out.print("selected");%>>Waive</option>
							</select></td>
						<td nowrap width="26%"></td>
						<td nowrap width="12%"></td>
					</tr>
					<tr id="trclear">
						<td align="right">Confirmation</td>
						<td nowrap width="17%" align="center">
							<input type="text" name="E04LCMC03" size="15" maxlength="15" value="<%=msgLC.getE04LCMC03()%>">
						</td>
						<td nowrap width="15%">
							<select name="E04LCMP03">
								<option value="A">Applicant</option>
								<option value="B" <%if(msgLC.getE04LCMP03().equals("B")) out.print("selected");%>>Beneficiary</option>
								<option value="W" <%if(msgLC.getE04LCMP03().equals("W")) out.print("selected");%>>Waive</option>
							</select></td>
						<td nowrap width="26%"></td>
						<td nowrap width="12%"></td>
					</tr>
					<tr id="trdark">
						<td align="right">Stamp Duty</td>
						<td nowrap width="17%" align="center">
							<input type="text" name="E04LCMC08" size="15" maxlength="15" value="<%=msgLC.getE04LCMC08()%>">
						</td>
						<td nowrap width="15%">
							<select name="E04LCMP08"  >
								<option value="A">Applicant</option>
								<option value="B" <%if(msgLC.getE04LCMP08().equals("B")) out.print("selected");%>>Beneficiary</option>
								<option value="W" <%if(msgLC.getE04LCMP08().equals("W")) out.print("selected");%>>Waive</option>
							</select></td>
						<td nowrap width="26%"></td>
						<td nowrap width="12%"></td>
					</tr>
					<tr id="trclear">
						<td align="right">Postage</td>
						<td nowrap width="17%" align="center">
							<input type="text" name="E04LCMC09" size="15" maxlength="15" value="<%=msgLC.getE04LCMC09()%>">
						</td>
						<td nowrap width="15%">
							<select name="E04LCMP09"  >
								<option value="A">Applicant</option>
								<option value="B" <%if(msgLC.getE04LCMP09().equals("B")) out.print("selected");%>>Beneficiary</option>
								<option value="W" <%if(msgLC.getE04LCMP09().equals("W")) out.print("selected");%>>Waive</option>
							</select></td>
						<td nowrap width="26%"></td>
						<td nowrap width="12%"></td>
					</tr>
					<tr id="trdark">
						<td align="right">Courier</td>
						<td nowrap width="17%" align="center">
							<input type="text" name="E04LCMC10" size="15" maxlength="15" value="<%=msgLC.getE04LCMC10()%>">
						</td>
						<td nowrap width="15%">
							<select name="E04LCMP10"  >
								<option value="A">Applicant</option>
								<option value="B" <%if(msgLC.getE04LCMP10().equals("B")) out.print("selected");%>>Beneficiary</option>
								<option value="W" <%if(msgLC.getE04LCMP10().equals("W")) out.print("selected");%>>Waive</option>
							</select></td>
						<td nowrap width="26%"></td>
						<td nowrap width="12%"></td>
					</tr>
					<tr id="trclear">
						<td align="right">Issuance Swift</td>
						<td nowrap width="17%" align="center">
							<input type="text" name="E04LCMC11" size="15" maxlength="15" value="<%=msgLC.getE04LCMC11()%>">
						</td>
						<td nowrap width="15%">
							<select name="E04LCMP11"  >
								<option value="A">Applicant</option>
								<option value="B" <%if(msgLC.getE04LCMP11().equals("B")) out.print("selected");%>>Beneficiary</option>
								<option value="W" <%if(msgLC.getE04LCMP11().equals("W")) out.print("selected");%>>Waive</option>
							</select></td>
						<td nowrap width="26%"></td>
						<td nowrap width="12%"></td>
					</tr>
					<tr id="trdark">
						<td align="right">Additional Swift</td>
						<td nowrap width="17%" align="center">
							<input type="text" name="E04LCMC12" size="15" maxlength="15" value="<%=msgLC.getE04LCMC12()%>">
						</td>
						<td nowrap width="15%">
							<select name="E04LCMP12"  >
								<option value="A">Applicant</option>
								<option value="B" <%if(msgLC.getE04LCMP12().equals("B")) out.print("selected");%>>Beneficiary</option>
								<option value="W" <%if(msgLC.getE04LCMP12().equals("W")) out.print("selected");%>>Waive</option>
							</select></td>
						<td nowrap width="26%"></td>
						<td nowrap width="12%"></td>
					</tr>
				</tbody>
			</table>
			</td>
		</tr>
	</tbody>
</table>


<h4 style="text-align:center"><input type="checkbox" name="H04FLGWK2" value="A" <% if(msgLC.getH04FLGWK2().equals("A")){ out.print("checked");} %>>
      Accept with Warnings</h4>
<div align="center"><input id="EIBSBTN" type=submit name="Submit" value="Submit"></div>

</form>
</body>
</html>
