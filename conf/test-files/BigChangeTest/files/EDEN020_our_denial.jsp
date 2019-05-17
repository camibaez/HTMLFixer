<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import="datapro.eibs.master.Util"%>

<html>
<head>
<title>Lista de Control</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">

</head>

<jsp:useBean id="EDEN020Record"
	class="datapro.eibs.beans.EDEN02001Message" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"
	scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos"
	scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage"
	scope="session" />

<body onload="autofocus();">

<script language="Javascript"
	src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="JavaScript">

function chgTipo(p) {
 	if (p == 'N' ) {
		JURIDICO.style.display='none' ;
		NATURAL.style.display='block' ;
	} else {
		NATURAL.style.display='none' ;
		JURIDICO.style.display='block' ;
	}
 }

function chgNme(type) {
 	switch (type){
	// Natural
	case 'N':  
		document.getElementById('NAME').value = document.getElementById('E01ONOM').value + ' ' +
												document.getElementById('E01OAPE').value; 
		break;
	// Juridica o Asociacion	
	case 'J':  
		document.getElementById('NAME').value = document.getElementById('E01ONAME').value; 
	}		
 }	
 
function goAction(op) {
	document.forms[0].SCREEN.value = op;
	if (op == 4) {
		if (!confirm("Do you want to delete this register?")) {
			return;
		}
		document.forms[0].Delete.disabled = true;
	}
	if (op == 5) {
		document.forms[0].Submit.disabled = true;
	}
	document.forms[0].submit();
}

function autofocus(){
	var form = document.forms[0];
	<%if (!userPO.getPurpose().equals("NEW")) {%>
	form.E01ONAME.focus();
	<%} else {%>
	form.E01ONOM.focus();
	<%}%>
}

</SCRIPT>


<%
	if (!error.getERRNUM().equals("0")) {
		out.println("<SCRIPT Language=\"Javascript\">");
		error.setERRNUM("0");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
	String read = "";
	String disabled = "";
	boolean readOnly = false;
	String mandatory = "<img src=\""
			+ request.getContextPath()
			+ "/images/Check.gif\" title=\"campo obligatorio\" align=\"bottom\" border=\"0\" >";
	String tf = "false";

	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose()
			.equals("MAINTENANCE"))) {
		read = " readonly ";
		disabled = " disabled";
		readOnly = true;
		mandatory = "";
	}
%>


<H3 align="center">Maintenance Own List<img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" title="our_denial.jsp, EDEN020"></H3>
<hr size="4">
<form method="post"
	action="<%=request.getContextPath()%>/servlet/datapro.eibs.ofac.JSEDEN020">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5"> <%
 	int row = 0;
 %>
<table class="tableinfo" width="100%">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0"
			class="tbhead">
			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width="15%" align="right">Code (UID) :</td>
				<td nowrap width="35%" align="left"><INPUT type="text"
					name="E01OCOUN" size="11" maxlength="11"
					value="<%=EDEN020Record.getE01OCOUN().trim()%>" <%=read%>
					onkeypress="enterInteger(event)"> <%=mandatory%></td>
				<td nowrap width="15%" align="right">Type :</td>
				<td nowrap width="35%" align="left"><SELECT name="E01OLGT"
					onChange="chgTipo(this.value)" onBlur="chgTipo(this.value)"
					<%=disabled%>>
					<OPTION
						<%=EDEN020Record.getE01OLGT().trim().equals("N") ? "Selected"
							: ""%>
						value="N">Natural</OPTION>
					<OPTION
						<%=EDEN020Record.getE01OLGT().trim().equals("J") ? "Selected"
							: ""%>
						value="J">Corporation</OPTION>
					<OPTION
						<%=EDEN020Record.getE01OLGT().trim().equals("A") ? "Selected"
							: ""%>
						value="A">Group</OPTION>
					<OPTION
						<%=EDEN020Record.getE01OLGT().trim().equals(" ") ? "Selected"
							: ""%>
						value=" ">Unknown</OPTION>
				</SELECT> <%=mandatory%></td>
			</tr>
			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width="15%" align="right">Complete  Name:</td>
				<td nowrap width="35%" align="left"><INPUT type="text"
					name="NAME" id="NAME" size="60"
					value="<%=EDEN020Record.getE01ONAME().trim()%>" readonly>
				</td>
				<td nowrap width="15%" align="right"></td>
				<td nowrap width="35%" align="left"></td>
			</tr>
		</table>
		</td>
	</tr>
</table>


<div id="NATURAL" style="position: relative; display: none;">
<h4>Basic Information</h4>
<table class="tableinfo" width="100%">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">

			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width="15%" align="right">Name :</td>
				<td nowrap width="35%" align="left"><input type="text"
					name="E01ONOM" id="E01ONOM" size="62" maxlength="60"
					value="<%=EDEN020Record.getE01ONOM().trim()%>" <%=read%>
					onChange="chgNme('N')" onBlur="chgNme('N')" autofocus> <%=mandatory%>
				</td>
				<td nowrap width="15%" align="right">Gender :</td>
				<td nowrap width="35%" align="left">
				<p><input type="radio" name="E01OGEN" value="F"
					<%if (EDEN020Record.getE01OGEN().equals("F"))
				out.print("checked");%>
					<%=disabled%>> Female <input type="radio"
					name="E01OGEN" value="M"
					<%if (EDEN020Record.getE01OGEN().equals("M"))
				out.print("checked");%>
					<%=disabled%>> Male <input type="radio"
					name="E01OGEN" value=" "
					<%if (EDEN020Record.getE01OGEN().equals(" "))
				out.print("checked");%>
					<%=disabled%>> Unknown</p>
				</td>
			</tr>
			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width="15%" align="right">Last Name:</td>
				<td nowrap width="35%" align="left"><input type="text"
					name="E01OAPE" id="E01OAPE" size="62" maxlength="60"
					value="<%=EDEN020Record.getE01OAPE().trim()%>" <%=read%>
					onChange="chgNme('N')" onBlur="chgNme('N')"> <%=mandatory%>
				</td>
				<td nowrap width="15%" align="right"></td>
				<td nowrap width="35%" align="left"></td>
			</tr>
		</table>

		</td>
	</tr>
</table>

</div>

<div id="JURIDICO" style="position: relative; display: none;">
<h4>Basic Information</h4>
<table class="tableinfo" width="100%">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">

			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width="15%" align="right">Name :</td>
				<td nowrap width="35%" align="left"><input type="text"
					name="E01ONAME" id="E01ONAME" size="46" maxlength="45"
					value="<%=EDEN020Record.getE01ONAME().trim()%>" <%=read%>
					onChange="chgNme('J')" onBlur="chgNme('J')"> <%=mandatory%>
				</td>
				<td nowrap width="15%" align="right">Association   Type:</td>
				<td nowrap width="35%" align="left"><input type="text"
					name="E01OTSOC" size="5" maxlength="4"
					value="<%=EDEN020Record.getE01OTSOC().trim()%>" <%=read%>>
				<input type="text" name="D01ASSNME" size="30"
					value="<%=EDEN020Record.getD01ASSNME().trim()%>" readonly>
				<%
					if (!readOnly) {
				%> <a
					href="javascript:Get2FilterCodes('E01OTSOC','D01ASSNME','DA')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"
					align="bottom" border="0"></a> <%
 	}
 %>
				</td>
			</tr>
		</table>

		</td>
	</tr>
</table>
</div>

<h4>Aditional Information</h4>

<table class="tableinfo" width="100%">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width="15%" align="right">Identification No. :</td>
				<td nowrap width="35%"><input type="text" name="E01OIDN"
					size="28" maxlength="25"
					value="<%=EDEN020Record.getE01OIDN().trim()%>" <%=read%>>
				</td>
				<td nowrap width="15%" align="right">Identification  Type:</td>
				<td nowrap width="35%"><input type="text" name="E01OTID"
					size="6" maxlength="4"
					value="<%=EDEN020Record.getE01OTID().trim()%>" <%=read%>>
				<%
					if (!readOnly) {
				%> <a
					href="javascript:GetCodeAuxCNOFC('E01OTID','34','')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"
					align="bottom" border="0"></a> <%
 	}
 %>
				</td>
			</tr>
			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width="15%" align="right">Country :</td>
				<td nowrap width="35%" align="left"><input type="text"
					name="E01OACCD" size="6" maxlength="4"
					value="<%=EDEN020Record.getE01OACCD().trim()%>"> <input
					type="text" name="D01CTRNME" size="30"
					value="<%=EDEN020Record.getD01CTRNME().trim()%>" readonly>
				<%
					if (!readOnly) {
				%> <a
					href="javascript:GetCountryCodeOfacISO('E01OACCD','D01CTRNME','03')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"
					align="bottom" border="0"></a> <%
 	}
 %>
				</td>
				<td nowrap width="15%" align="right">Department/State   :</td>
				<td nowrap width="35%" align="left"><input type="text"
					name="E01OASTA" size="4" maxlength="2"
					value="<%=EDEN020Record.getE01OASTA().trim()%>" <%=read%>>
				<input type="text" name="D01STANME" size="30"
					value="<%=EDEN020Record.getD01STANME().trim()%>" readonly>
				<%
					if (!readOnly) {
				%> <a
					href="javascript:GetStatesCodeOfacIso(document.forms[0].E01OACCD.value,'E01OASTA','D01STANME','27')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"
					align="bottom" border="0"></a> <%
 	}
 %>
				</td>
			</tr>
			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width="15%" align="right">Address 1 :</td>
				<td nowrap width="35%" align="left"><input type="text"
					name="E01OADD1" size="62" maxlength="60"
					value="<%=EDEN020Record.getE01OADD1().trim()%>" <%=read%>>
				</td>
				<td nowrap width="15%" align="right">Address 2 :</td>
				<td nowrap width="35%" align="left"><input type="text"
					name="E01OADD2" size="62" maxlength="60"
					value="<%=EDEN020Record.getE01OADD2().trim()%>" <%=read%>>
				</td>
			</tr>
			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width="15%" align="right">Address 3 :</td>
				<td nowrap width="35%" align="left"><input type="text"
					name="E01OADD3" size="62" maxlength="60"
					value="<%=EDEN020Record.getE01OADD3().trim()%>" <%=read%>>
				</td>
				<td nowrap width="15%" align="right"></td>
				<td nowrap width="35%" align="left"></td>
			</tr>
			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width="15%" align="right">Date  Of Birth/
				Constitución :</td>
				<td nowrap width="35%" align="left">
				<%
					if (!readOnly) {
				%> <input type="text" name="E01ODTED1" size="3"
					maxlength="2" value="<%=EDEN020Record.getE01ODTED1().trim()%>"
					<%=read%>> <input type="text" name="E01ODTEM1" size="3"
					maxlength="2" value="<%=EDEN020Record.getE01ODTEM1().trim()%>"
					<%=read%>> <input type="text" name="E01ODTEY1" size="5"
					maxlength="4" value="<%=EDEN020Record.getE01ODTEY1().trim()%>"
					<%=read%>> (DD/MM/YYYY) <%
 	} else {
 %> <%=datapro.eibs.master.Util.formatDate(EDEN020Record
						.getE01ODTEM1(), EDEN020Record.getE01ODTED1(),
						EDEN020Record.getE01ODTEY1())%>
				<%
					}
				%>
				</td>
				<td nowrap width="15%" align="right"></td>
				<td nowrap width="35%" align="left"></td>
			</tr>

		</table>
		</td>
	</tr>
</table>

<h4>Grounds</h4>

<table class="tableinfo">
	<tr>
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0"
			align="center">
			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width="15%" align="right">Source :</td>
				<td nowrap width="35%" align="left"><input type="text"
					name="E01OCSRC" size="5" maxlength="4"
					value="<%=EDEN020Record.getE01OCSRC().trim()%>" <%=read%>>
				<input type="text" name="D01SRCNME" size="30"
					value="<%=EDEN020Record.getD01SRCNME().trim()%>" readonly>
				<%
					if (!readOnly) {
				%> <a
					href="javascript:GetSourceCode('E01OCSRC','D01SRCNME')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"
					align="bottom" border="0"></a> <%
 	}
 %>
				</td>
				<td nowrap width="15%" align="right">Negation   Code:</td>
				<td nowrap width="35%" align="left"><input type="text"
					name="E01OCTYP" size="6" maxlength="5"
					value="<%=EDEN020Record.getE01OCTYP().trim()%>" <%=read%>>
				<input type="text" name="D01TYPNME" size="75" maxlength="60"
					value="<%=EDEN020Record.getD01TYPNME().trim()%>" readonly>
				<%
					if (!readOnly) {
				%> <a
					href="javascript:GetDenialCodeOfac('E01OCTYP','D01TYPNME')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"
					align="bottom" border="0"></a> <%
 	}
 %>
				</td>
			</tr>
			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width="15%" align="right">Fact :</td>
				<td nowrap width="35%" align="left"><input type="text"
					name="E01EREM1" size="62" maxlength="60"
					value="<%=EDEN020Record.getE01EREM1().trim()%>" <%=read%>>
				</td>
				<td nowrap width="15%" align="right">Fact   Date:</td>
				<td nowrap width="35%" align="left">
				<%
					if (!readOnly) {
				%> <input type="text" name="E01ODTED2" size="3"
					maxlength="2" value="<%=EDEN020Record.getE01ODTED2().trim()%>"
					<%=read%>> <input type="text" name="E01ODTEM2" size="3"
					maxlength="2" value="<%=EDEN020Record.getE01ODTEM2().trim()%>"
					<%=read%>> <input type="text" name="E01ODTEY2" size="5"
					maxlength="4" value="<%=EDEN020Record.getE01ODTEY2().trim()%>"
					<%=read%>>(DD/MM/YYYY) <%
 	} else {
 %> <%=datapro.eibs.master.Util.formatDate(EDEN020Record
						.getE01ODTEM2(), EDEN020Record.getE01ODTED2(),
						EDEN020Record.getE01ODTEY2())%>
				<%
					}
				%>
				</td>
			</tr>
			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width="15%" align="right">Date    Inclusion on List:</td>
				<td nowrap width="35%" align="left">
				<%
					if (!readOnly) {
				%> <input type="text" name="E01ODTED3" size="3"
					maxlength="2" value="<%=EDEN020Record.getE01ODTED3().trim()%>"
					<%=read%>> <input type="text" name="E01ODTEM3" size="3"
					maxlength="2" value="<%=EDEN020Record.getE01ODTEM3().trim()%>"
					<%=read%>> <input type="text" name="E01ODTEY3" size="5"
					maxlength="4" value="<%=EDEN020Record.getE01ODTEY3().trim()%>"
					<%=read%>>(DD/MM/YYYY) <%
 	} else {
 %> <%=datapro.eibs.master.Util.formatDate(EDEN020Record
						.getE01ODTEM3(), EDEN020Record.getE01ODTED3(),
						EDEN020Record.getE01ODTEY3())%>
				<%
					}
				%>
				</td>
				<td nowrap width="15%" align="right">Volume/Page :</td>
				<td nowrap width="35%" align="left"><input type="text"
					name="E01OVOLN" size="3" maxlength="2"
					value="<%=EDEN020Record.getE01OVOLN().trim()%>" <%=read%>>
				/ <input type="text" name="E01OPAGE" size="7" maxlength="6"
					value="<%=EDEN020Record.getE01OPAGE().trim()%>" <%=read%>>
				</td>
			</tr>
			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width="15%" align="right">Comments :</td>
				<td nowrap width="35%" align="left"><input type="text"
					name="E01EREM2" size="62" maxlength="60"
					value="<%=EDEN020Record.getE01EREM2().trim()%>" <%=read%>>
				</td>
				<td nowrap width="15%" align="right"></td>
				<td nowrap width="35%" align="left"></td>
			</tr>
			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width="15%" align="right"></td>
				<td nowrap width="35%" align="left"><input type="text"
					name="E01EREM3" size="62" maxlength="60"
					value="<%=EDEN020Record.getE01EREM3().trim()%>" <%=read%>>
				</td>
				<td nowrap width="15%" align="right"></td>
				<td nowrap width="35%" align="left"></td>
			</tr>

		</table>
		</td>
	</tr>
</table>
<br>
<table width="100%" border="0" cellspacing="0" cellpadding="0"
	bgcolor="#FFFFFF" bordercolor="#FFFFFF">
	<tr bgcolor="#FFFFFF">
		<td width="33%" align="center"><input type="checkbox"
			name="H01FLGWK2" value="1">Accept with warnings</td>
	</tr>
</table>

<table width="100%">
	<tr>
		<td width="33%">
		<div align="center"><input id="EIBSBTN" type=button
			name="Submit" value="Submit" onClick="goAction(5);" <%=disabled%>>
		</div>
		</td>
		<td width="33%">
		<div align="center"><input id="EIBSBTN" type=button
			name="Delete" value="Delete" onClick="goAction(4);" <%=disabled%>>
		</div>
		</td>
		<td width="34%">
		<div align="center"><input id="EIBSBTN" type=submit name="Exit"
			value="Exit"
			<%if (userPO.getPurpose().equals("NEW")
					|| userPO.getPurpose().equals("MAINTENANCE")) {%>
			onClick="goAction(1);" <%} else {%> onClick="goAction(6);" <%}%>>
		</div>
		</td>

	</tr>
</table>

</form>
</body>

<SCRIPT Language="Javascript">

<%if (EDEN020Record.getE01OLGT().trim().equals("N")) {%>
		JURIDICO.style.display='none' ;
		NATURAL.style.display='block' ;
<%} else {%>
		NATURAL.style.display='none' ;
		JURIDICO.style.display='block' ;
<%}%>
</SCRIPT>
</html>

