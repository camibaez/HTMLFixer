<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<META name="GENERATOR"
	content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<title>RelationShip Customer Basic Information</title>
<link href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">


<jsp:useBean id="client" class="datapro.eibs.beans.ESD008002Message"
	scope="session" />

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"
	scope="session" />

<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos"
	scope="session" />

<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage"
	scope="session" />

<script language="Javascript1.1"
	src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1"
	src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>
<script language="javascript">
function showInqOFAC(fieldValue){
	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0092?shrAcc=" + fieldValue + "&shrCategory=ALL" + "&FromRecord=0&shrAction=INQ";
	CenterWindow(page,600,500,2);
 }
</script>

<%
	if (!userPO.getPurpose().equals("NEW")) {
%>

<SCRIPT Language="Javascript">

       builtNewMenu(client_rela_opt);

	   function checkDel(obj){
	     if (obj.checked) obj.value="X"; else obj.value="";
	   }

 		function checkYearFormat(s,lng){
			if (!isYearFormat(s,lng)) {
				alert("Year must be 4 digits long");
				event.srcElement.focus();
			}
		}

   </SCRIPT>

<%
	}
%>

</head>

<body bgcolor="#FFFFFF">

<%
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
	if (!userPO.getPurpose().equals("NEW")) {
		out.println("<SCRIPT> initMenu();  </SCRIPT>");
	}
%>


<h3 align="center">Relationship Customer Basic Information<img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" ALT="client_rela_basic, ESD0080"></h3>
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
				<td nowrap width="39%">
				<div align="right">Customer Number :</div>
				</td>
				<td nowrap width="23%"><input type="hidden" name="E02CUN"
					size="10" maxlength="9" value="<%=client.getE02CUN()%>"> <%=client.getE02CUN()%>
				<%
					if (client.getH02MAS().equals("Y")) {
				%> <a
					href="javascript:showInqOFAC('<%=client.getE02CUN().trim()%>')"><img
					src="<%=request.getContextPath()%>/images/warning_16.jpg"
					alt="OFAC Match List" align="middle" border="0"></a> <%
 	}
 %>
				</td>
				<td width="38%">&nbsp;</td>
			</tr>
			<tr id="teclear">
				<td nowrap width="39%">
				<div align="right">Legal Name :</div>
				</td>
				<td nowrap colspan="2"><input type="text" name="E02NA1"
					size="35" maxlength="45" value="<%=client.getE02NA1().trim()%>">
				<img src="<%=request.getContextPath()%>/images/Check.gif"
					alt="mandatory field" align="bottom"></td>
			</tr>
			<tr id="trdark">
				<td nowrap width="39%">
				<p align="right">Short Name :</p>
				</td>
				<td nowrap colspan="2"><input type="text" name="E02SHN"
					size="16" maxlength="15" value="<%=client.getE02SHN().trim()%>">
				<img src="<%=request.getContextPath()%>/images/Check.gif"
					alt="mandatory field" align="bottom"></td>
			</tr>

		</table>
		</td>
	</tr>
</table>

<h4>Classification Codes</h4>
<table class="tableinfo" width="100%">
	<tr>
		<td nowrap width="100%">

		<table cellspacing="0" cellpadding="2" width="100%" border="0"
			align="left" bordercolor="#FFFFFF" bgcolor="#FFFFFF">
			<tr id="trdark">
				<td nowrap width="22%">
				<div align="right">Main Officer :</div>
				</td>
				<td nowrap width="18%"><input type="text" name="E02OFC"
					size="5" maxlength="3" value="<%=client.getE02OFC().trim()%>">
				<a href="javascript:GetCodeCNOFC('E02OFC','15')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"
					align="bottom" border="0"></a></td>
				<td nowrap width="29%">
				<div align="right">Substitute Officer :</div>
				</td>
				<td nowrap width="31%"><input type="text" name="E02OF2"
					size="5" maxlength="3" value="<%=client.getE02OF2().trim()%>">
				<a href="javascript:GetCodeCNOFC('E02OF2','15')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"
					align="bottom" border="0"></a></td>
			</tr>
			<tr id="teclear">
				<td nowrap width="22%">
				<div align="right">Industry Code :</div>
				</td>
				<td nowrap width="18%"><input type="text" name="E02INC"
					size="5" maxlength="3" value="<%=client.getE02INC().trim()%>">
				<a href="javascript:GetCodeCNOFC('E02INC','09')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"
					align="bottom" border="0"></a></td>
				<td nowrap width="29%">
				<div align="right">Business Line :</div>
				</td>
				<td nowrap width="31%"><input type="text" name="E02BUC"
					size="5" maxlength="3" value="<%=client.getE02BUC().trim()%>">
				<a href="javascript:GetCodeCNOFC('E02BUC','12')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"
					align="bottom" border="0"></a></td>
			</tr>
			<tr id="trdark">
				<td nowrap width="22%">
				<div align="right">Country of Residence :</div>
				</td>
				<td nowrap width="18%"><input type="text" name="E02GEC"
					size="5" maxlength="3" value="<%=client.getE02GEC().trim()%>">
				<a href="javascript:GetCodeCNOFC('E02GEC','03')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"
					align="bottom" border="0"></a> <img
					src="<%=request.getContextPath()%>/images/Check.gif"
					alt="mandatory field" align="bottom"></td>
				<td nowrap width="29%"><%--  <div align="right">User Code 1 :</div>--%>
				</td>
				<td nowrap width="31%"><%--
              <input type="text" name="E02UC1" size="5" maxlength="3" value="<%= client.getE02UC1().trim()%>">
              <a href="javascript:GetCodeCNOFC('E02UC1','2A')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"  ></a>
              --%></td>
			</tr>
			<tr id="teclear">
				<td nowrap width="22%">
				<div align="right">Legal Entity :</div>
				</td>
				<td nowrap width="18%"><input type="text" name="E02UC2"
					size="5" maxlength="3" value="<%=client.getE02UC2().trim()%>">
				<a href="javascript:GetCodeCNOFC('E02UC2','2B')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"
					align="bottom" border="0"></a><img
					src="<%=request.getContextPath()%>/images/Check.gif"
					alt="mandatory field" align="absbottom" border="0"></td>
				<td nowrap width="29%">
				<div align="right">User Code 3 :</div>
				</td>
				<td nowrap width="31%"><input type="text" name="E02UC3"
					size="5" maxlength="3" value="<%=client.getE02UC3().trim()%>">
				<a href="javascript:GetCodeCNOFC('E02UC3','2C')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"
					align="bottom" border="0"></a> Only for Reg. "O"</td>
			</tr>
			<tr id="trdark">
				<td nowrap width="22%">
				<div align="right">Risk Level :</div>
				</td>
				<td nowrap width="18%"><input type="text" name="E02RSL"
					size="5" maxlength="4" value="<%=client.getE02RSL().trim()%>">
				<a href="javascript:GetCodeCNOFC('E02RSL','31')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"
					align="bottom" border="0"></a></td>
				<td nowrap width="29%">&nbsp;</td>
				<td nowrap width="31%">&nbsp;</td>
			</tr>
		</table>
		</td>
	</tr>
</table>


<H4>Additional Information</H4>
<table class="tableinfo" width="100%">
	<tr>
		<td nowrap width="100%">

		<table cellspacing="0" cellpadding="2" width="100%" border="0"
			align="left" bordercolor="#FFFFFF" bgcolor="#FFFFFF">
			<TR id="trdark">
				<TD nowrap width="22%">
				<DIV align="right">Withholding Table :</DIV>
				</TD>
				<TD nowrap width="41%" bordercolor="#FFFFFF"><INPUT type="text"
					name="E02TAX" size="2" maxlength="1"
					value="<%=client.getE02TAX().trim()%>"> <A
					href="javascript:GetCode('E02TAX','STATIC_client_help_tax_instructions.jsp')"><IMG
					src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"
					align="bottom" border="0"></A><IMG
					src="<%=request.getContextPath()%>/images/Check.gif"
					alt="mandatory field" align="bottom"></TD>
			</TR>
			<TR id="teclear">

				<TD nowrap width="23%">
				<DIV align="right">Subject to Taxes in U.S. :</DIV>
				</TD>

				<TD nowrap width="36%"><INPUT type="radio" name="E02FG2"
					value="Y"
					<%if (client.getE02FG2().equals("Y"))
				out.print("checked");%>>
				Yes <INPUT type="radio" name="E02FG2" value="N"
					<%if (client.getE02FG2().equals("N"))
				out.print("checked");%>
					checked> No <IMG
					src="<%=request.getContextPath()%>/images/Check.gif"
					alt="mandatory field" align="bottom" border="0"></TD>
			</TR>
			<TR id="trdark">
				<TD nowrap width="23%">
				<DIV align="right">Treasury Customer</DIV>
				</TD>

				<TD nowrap width="39%"><INPUT type="radio" name="E02FL5"
					value="Y"
					<%if (client.getE02FL5().equals("Y"))
				out.print("checked");%>>
				Yes <INPUT type="radio" name="E02FL5" value="N"
					<%if (client.getE02FL5().equals("N"))
				out.print("checked");%>
					checked> No <IMG
					src="<%=request.getContextPath()%>/images/Check.gif"
					alt="mandatory field" align="bottom"></TD>
			</TR>
			<TR id="teclear">
				<TD nowrap width="22%" align="right">Potencial Amount :</TD>
				<TD nowrap width="41%" bordercolor="#FFFFFF"><input type="text"
					name="E02CAI" size="16" maxlength="15"
					value="<%=client.getE02CAI().trim()%>"></TD>
			</TR>
		</table>
		</td>
	</tr>
</table>

<br>
<%
	if (client.getH02MAS().equals("Y")) {
%>
<table width="100%" border="0" cellspacing="0" cellpadding="0"
	bgcolor="#FFFFFF" bordercolor="#FFFFFF">
	<tr bgcolor="#FFFFFF">
		<td width="33%">
		<div align="center"><input type="checkbox" name="H02WK2"
			value="Y"> Accept with Warnings</div>
		</td>
	</tr>
</table>
<%
	}
%>
<p align="center"><input id="EIBSBTN" type=submit name="Submit"
	value="Submit"></p>
</form>
</body>
</html>
