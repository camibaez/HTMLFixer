<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Loans Parameters</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id="bankOld" class="datapro.eibs.beans.ESD000507Message" 	scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" 	scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" 	scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage"	scope="session" />

</head>

<body bgcolor="#FFFFFF">

<%if (!error.getERRNUM().equals("0")) {
	error.setERRNUM("0");
	out.println("<SCRIPT Language=\"Javascript\">");
	out.println("       showErrors()");
	out.println("</SCRIPT>");
	}

%>

<h3 align="center">Loans Parameters Maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="bank_param_maint, ESD0005"></h3>
<hr size="4">
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0005A">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="700">

<h4>Cyclic Notification After Late Charge Notification (Level 1)</h4>
<div align="left">
<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%"border="0">
	<tr id="trdark">
		<td nowrap width="75%">
			<div align="right">No. of Days to Print 1st Cyclic Not. (Level 2) After Level 1 :</div>
		</td>
		<td nowrap width="25%">
			<input type="text" name="E07CNTML2" size="3" maxlength="2" value="<%=bankOld.getE07CNTML2().trim()%>" onKeyPress="enterInteger()">
	  	</td>
	</tr>
	<tr id="trclear">
		<td nowrap width="50%">
			<div align="right">No. of Days to Print 2st Cyclic Not. (Level 3) After Level 1 :</div>
		</td>
		<td nowrap width="50%">
			<input type="text" name="E07CNTML3" size="3" maxlength="2" value="<%=bankOld.getE07CNTML3().trim()%>" onKeyPress="enterInteger()">
	  	</td>
	</tr>
	<tr id="trdark">
		<td nowrap width="50%">
			<div align="right">No. of Days to Print 3st Cyclic Not. (Level 4) After Level 1 :</div>
		</td>
		<td nowrap width="50%">
			<input type="text" name="E07CNTML4" size="3" maxlength="2" value="<%=bankOld.getE07CNTML4().trim()%>" onKeyPress="enterInteger()">
	  	</td>
	</tr>
	<tr id="trclear">
		<td nowrap width="50%">
			<div align="right">No. of Days to Print 4th Cyclic Not. (Level 5) After Level 1 :</div>
		</td>
		<td nowrap width="50%">
			<input type="text" name="E07CNTML5" size="3" maxlength="2" value="<%=bankOld.getE07CNTML5().trim()%>" onKeyPress="enterInteger()">
	  	</td>
	</tr>
	<tr id="trdark">
		<td nowrap width="50%">
			<div align="right">No. of Days to Print 5th Cyclic Not. (Level 6) After Level 1 :</div>
		</td>
		<td nowrap width="50%">
			<input type="text" name="E07CNTML6" size="3" maxlength="2" value="<%=bankOld.getE07CNTML6().trim()%>" onKeyPress="enterInteger()">
	  	</td>
	</tr>
	<tr id="trclear">
		<td nowrap width="50%">
			<div align="right">No. of Days Before Payment Due Date to Send Payment Advice :</div>
		</td>
		<td nowrap width="50%">
			<input type="text" name="E07CNTNPA" size="3" maxlength="2" value="<%=bankOld.getE07CNTNPA().trim()%>" >
	  	</td>
	</tr>
	<tr id="trdark">
		<td nowrap width="50%">
			<div align="right">Update Delinquency Statistics (On Due Date or End of Grace Per) :</div>
		</td>
		<td nowrap width="50%">
			<select name="E07CNTUDS">
				<option value=" " <%if (!(bankOld.getE07CNTUDS().equals("D") || bankOld.getE07CNTUDS().equals("G"))) out.print("selected");%>> </option>
				<option value="D" <%if (bankOld.getE07CNTUDS().equals("D")) out.print("selected");%>>When Payment Due</option>
				<option value="G" <%if (bankOld.getE07CNTUDS().equals("G")) out.print("selected");%>>When Grace Period</option>
			</select>
	  	</td>
	</tr>
	<tr id="trclear">
		<td nowrap width="50%">
			<div align="right">Grace Period of Days :</div>
		</td>
		<td nowrap width="50%">
			<input type="text" name="E07CNTGPD" size="3" maxlength="2" value="<%=bankOld.getE07CNTGPD().trim()%>" onKeyPress="enterInteger()">
	  	</td>
	</tr>
</table>
<h4>I/L Cyclic Notifications for Collateral Insurance Request</h4>
<div align="left">
<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%"border="0">
	<tr id="trdark">
		<td nowrap width="50%">
			<div align="right">No. of Days to Print 1st Cyclic Not. Before Coll/Ins Exp Date :</div>
		</td>
		<td nowrap width="50%">
			<input type="text" name="E07CNTIC2" size="3" maxlength="2" value="<%=bankOld.getE07CNTIC2().trim()%>" onKeyPress="enterInteger()">
	  	</td>
	</tr>
	<tr id="trclear">
		<td nowrap width="50%">
			<div align="right">No. of Days to Print 2st Cyclic Not. Before Coll/Ins Exp Date :</div>
		</td>
		<td nowrap width="50%">
			<input type="text" name="E07CNTIC3" size="3" maxlength="2" value="<%=bankOld.getE07CNTIC3().trim()%>" onKeyPress="enterInteger()">
	  	</td>
	</tr>
	<tr id="trdark">
		<td nowrap width="50%">
			<div align="right">Percent of Monthly Payment Accepted as Full Payment (I/L Only) :</div>
		</td>
		<td nowrap width="50%">
			<input type="text" name="E07CNTIPA" size="4" maxlength="3" value="<%=bankOld.getE07CNTIPA().trim()%>" onKeyPress="enterInteger()">
	  	</td>
	</tr>
	<tr id="trclear">
		<td nowrap width="50%">
			<div align="right">Past Due Payment Processing  :</div>
		</td>
		<td nowrap width="50%">
		  <input type="text" name="E07CNTPDP" size="2" maxlength="1" value="<%=bankOld.getE07CNTPDP().trim()%>">
		  <A href="javascript:GetCode('E07CNTPDP','STATIC_par_past_due.jsp')">
          <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"  ></a>

	  	</td>
	</tr>
	<tr id="trdark">
		<td nowrap width="50%">
			<div align="right">Mature  Among  Line Term :</div>
		</td>
		<td nowrap width="50%">
           <p>
           <input type="radio" name="E07CNTMIL" value="Y" <%if (bankOld.getE07CNTMIL().equals("Y")) out.print("checked");%>> Yes
           <input type="radio" name="E07CNTMIL" value="N" <%if (bankOld.getE07CNTMIL().equals("N")) out.print("checked");%>> No</p>
	  	</td>
	</tr>
	<tr id="trclear">
		<td nowrap width="50%">
			<div align="right">Penalty Interest Accounting  :</div>
		</td>
		<td nowrap width="50%">
			<select name="E07CNTAPI">
				<option value=" " <%if (!(bankOld.getE07CNTAPI().equals("1") || bankOld.getE07CNTAPI().equals("2") || bankOld.getE07CNTAPI().equals("N"))) out.print("selected");%>> </option>
				<option value="1" <%if (bankOld.getE07CNTAPI().equals("1")) out.print("selected");%>>Daily Accrual</option>
				<option value="2" <%if (bankOld.getE07CNTAPI().equals("2")) out.print("selected");%>>Generate Income when Payment Received</option>
				<option value="N" <%if (bankOld.getE07CNTAPI().equals("N")) out.print("selected");%>>No Accrual</option>
			</select>
	  	</td>
	</tr>
	<tr id="trdark">
		<td nowrap width="50%">
			<div align="right">When Change G/L Account, Transfer Income Balances :</div>
		</td>
		<td nowrap width="50%">
           <p>
           <input type="radio" name="E07CNTFL1" value="Y" <%if (bankOld.getE07CNTFL1().equals("Y")) out.print("checked");%>> Yes
           <input type="radio" name="E07CNTFL1" value="N" <%if (bankOld.getE07CNTFL1().equals("N")) out.print("checked");%>> No</p>
	  	</td>
	</tr>
	<tr id="trclear">
		<td nowrap width="50%">
			<div align="right">Maximum Penalty Interest Rate :</div>
		</td>
		<td nowrap width="50%">
			<input type="text" name="E07CNTMPI" size="11" maxlength="10" value="<%=bankOld.getE07CNTMPI().trim()%>">
	  	</td>
	</tr>
</table>
<p>
<div align="center"><input id="EIBSBTN" type=submit name="Submit"
	value="Submit"></div>
</p>
</form>
</body>
</html>

