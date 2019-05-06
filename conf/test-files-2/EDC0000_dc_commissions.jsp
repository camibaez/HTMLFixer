<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Mantenimiento de Cobranza Documentaria</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id="dcNew"  class="datapro.eibs.beans.EDC000001Message" scope="session" />
<jsp:useBean id="dcNew2"  class="datapro.eibs.beans.EDC000002Message" scope="session" />
<jsp:useBean id="error"  class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />

<SCRIPT LANGUAGE="javascript">

<%if (!userPO.getPurpose().equals("NEW")) {%>

	builtNewMenu(dc_d_maint);

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
<h3 align="center">Documentary Collections Maintenance [Commissions]
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="dc_commissions.jsp, EDC0000"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDC0000">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="6">
<input type="hidden" name="E01DCMBNK" value="<%= dcNew.getE01DCMBNK().trim() %>">

<table class="tableinfo">
	<tr>
		<td nowrap>
		<TABLE cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
			<TBODY><TR id="trdark">
				<TD nowrap width="16%">
					<DIV align="right"><B>Bank :</B></DIV>
				</TD>
				<TD nowrap width="20%">
					<DIV align="left">
						<INPUT type="text" name="E01DCMBNK" readonly size="4" maxlength="2" value="<%=dcNew.getE01DCMBNK().trim()%>">
					</DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="right"><B>Collection Number :</B></DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="left"><B> 
				<%if (dcNew.getE01DCMACC().trim().equals("999999999999"))
				{%>
					<INPUT type="text" size="12" maxlength="12" value="Nuevo" readonly>
					<INPUT type="hidden" name="E01DCMACC" value="<%=dcNew.getE01DCMACC().trim()%>">
				<%}
				else
				{%>
					<INPUT type="text" name="E01DCMACC" size="12" maxlength="12" value="<%=dcNew.getE01DCMACC().trim()%>" readonly>
				<%}%>
					</B></DIV>
				</TD>
			</TR>
			<TR id="trclear">
				<TD nowrap width="16%">
					<DIV align="right"><B>Our Reference :</B></DIV>
				</TD>
				<TD nowrap width="20%">
					<DIV align="left">
						<INPUT type="text" name="E01DCMORF" size="20" maxlength="16" value="<%=dcNew.getE01DCMORF().trim()%>">
					</DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="right"><B>Product :</B></DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="left"><B>
						<INPUT type="text" name="E01DCMPRO" size="4" maxlength="4" value="<%=dcNew.getE01DCMPRO().trim()%>" readonly>
					</B><INPUT type="text" name="E01DSCPRO" size="30" maxlength="30"
						value="<%=dcNew.getE01DSCPRO().trim()%>" readonly></DIV>
				</TD>
			</TR>
			<TR id="trdark">
				<TD nowrap width="16%">
					<DIV align="right"><B>Collection Type :</B></DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="left"><B>
						<INPUT type="text" name="E01DCMTYP" size="20" maxlength="16" value="<%=dcNew.getE01DCMTYP().trim()%>">
					</B></DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="right"><B>Tariff :</B></DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="left"><B>
						<INPUT type="text" name="E02DCMTAR" size="4" maxlength="4" value="<%=dcNew2.getE02DCMTAR().trim()%>" readonly></B>
					</DIV>
				</TD>
			</TR>
			<TR id="trclear">
				<TD nowrap width="16%">
					<DIV align="right"><B>Tariff Currency :</B></DIV>
				</TD>
				<TD nowrap width="20%">
					<DIV align="left">
						<INPUT type="text" name="E02DCMTCY" size="20" maxlength="16" value="<%=dcNew2.getE02DCMTCY().trim()%>">
					</DIV>
				</TD>
				<TD nowrap width="16%">
				</TD>
				<TD nowrap width="16%">

				</TD>
			</TR>	
			</TBODY></TABLE>
		</td>
	</tr>
</table>

  <br>  
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr> 
            <th nowrap width="30%"> 
             	<div>Concept</div>
            </th>
            <th nowrap width="20%">  
             	<div>Amount    Paid By</div>
			</th>
			<th nowrap width="30%">
             	<div>Concept</div>
			</th>
            <th nowrap width="20%">
             	<div>Amount    Paid By</div>
            </th>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%"> 
             	<div align="right">Our Commission :</div>
            </td>
            <td nowrap width="20%">  
            	<INPUT type="text" name="E02DCMC01" maxlength="13" size="14" value="<%= dcNew2.getE02DCMC01().trim()%>">
				<SELECT name="E02DCMF01">
					<OPTION value=" " <% if (!dcNew2.getE02DCMF01().equals("P") || !dcNew2.getE02DCMF01().equals("D")) out.println("selected"); %>></OPTION>
					<OPTION value="P" <% if (dcNew2.getE02DCMF01().equals("P")) out.println("selected"); %>>Drawer</OPTION>
					<OPTION value="D" <% if (dcNew2.getE02DCMF01().equals("D")) out.println("selected"); %>>Drawee</OPTION>
				</SELECT>
			</td>
			<td nowrap width="30%">
             	<div align="right">Courier :</div>
			</td>
            <td nowrap width="20%">
            	<INPUT type="text" name="E02DCMC03" maxlength="13" size="14" value="<%= dcNew2.getE02DCMC03().trim()%>">
				<SELECT name="E02DCMF03">
					<OPTION value=" " <% if (!dcNew2.getE02DCMF03().equals("P") || !dcNew2.getE02DCMF03().equals("D")) out.println("selected"); %>></OPTION>
					<OPTION value="P" <% if (dcNew2.getE02DCMF03().equals("P")) out.println("selected"); %>>Drawer</OPTION>
					<OPTION value="D" <% if (dcNew2.getE02DCMF03().equals("D")) out.println("selected"); %>>Drawee</OPTION>
				</SELECT>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%"> 
             	<div align="right">Protest :</div>
            </td>
            <td nowrap width="20%">  
            	<INPUT type="text" name="E02DCMC04" maxlength="13" size="14" value="<%= dcNew2.getE02DCMC04().trim()%>">
				<SELECT name="E02DCMF04">
					<OPTION value=" " <% if (!dcNew2.getE02DCMF04().equals("P") || !dcNew2.getE02DCMF04().equals("D")) out.println("selected"); %>></OPTION>
					<OPTION value="P" <% if (dcNew2.getE02DCMF04().equals("P")) out.println("selected"); %>>Drawer</OPTION>
					<OPTION value="D" <% if (dcNew2.getE02DCMF04().equals("D")) out.println("selected"); %>>Drawee</OPTION>
				</SELECT>
			</td>
			<td nowrap width="30%">
             	<div align="right">Stamp Duty :</div>
			</td>
            <td nowrap width="20%">
            	<INPUT type="text" name="E02DCMC05" maxlength="13" size="14" value="<%= dcNew2.getE02DCMC05().trim()%>">
				<SELECT name="E02DCMF05">
					<OPTION value=" " <% if (!dcNew2.getE02DCMF05().equals("P") || !dcNew2.getE02DCMF05().equals("D")) out.println("selected"); %>></OPTION>
					<OPTION value="P" <% if (dcNew2.getE02DCMF05().equals("P")) out.println("selected"); %>>Drawer</OPTION>
					<OPTION value="D" <% if (dcNew2.getE02DCMF05().equals("D")) out.println("selected"); %>>Drawee</OPTION>
				</SELECT>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%"> 
             	<div align="right">Issuance Swift :</div>
            </td>
            <td nowrap width="20%">  
            	<INPUT type="text" name="E02DCMC06" maxlength="13" size="14" value="<%= dcNew2.getE02DCMC06().trim()%>">
				<SELECT name="E02DCMF06">
					<OPTION value=" " <% if (!dcNew2.getE02DCMF06().equals("P") || !dcNew2.getE02DCMF06().equals("D")) out.println("selected"); %>></OPTION>
					<OPTION value="P" <% if (dcNew2.getE02DCMF06().equals("P")) out.println("selected"); %>>Drawer</OPTION>
					<OPTION value="D" <% if (dcNew2.getE02DCMF06().equals("D")) out.println("selected"); %>>Drawee</OPTION>
				</SELECT>
			</td>
			<td nowrap width="30%">
             	<div align="right">Phone/Fax :</div>
			</td>
            <td nowrap width="20%">
            	<INPUT type="text" name="E02DCMC07" maxlength="13" size="14" value="<%= dcNew2.getE02DCMC07().trim()%>">
				<SELECT name="E02DCMF07">
					<OPTION value=" " <% if (!dcNew2.getE02DCMF07().equals("P") || !dcNew2.getE02DCMF07().equals("D")) out.println("selected"); %>></OPTION>
					<OPTION value="P" <% if (dcNew2.getE02DCMF07().equals("P")) out.println("selected"); %>>Drawer</OPTION>
					<OPTION value="D" <% if (dcNew2.getE02DCMF07().equals("D")) out.println("selected"); %>>Drawee</OPTION>
				</SELECT>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%"> 
             	<div align="right">Funds Transfer :</div>
            </td>
            <td nowrap width="20%">  
            	<INPUT type="text" name="E02DCMC08" maxlength="13" size="14" value="<%= dcNew2.getE02DCMC08().trim()%>">
				<SELECT name="E02DCMF08">
					<OPTION value=" " <% if (!dcNew2.getE02DCMF08().equals("P") || !dcNew2.getE02DCMF08().equals("D")) out.println("selected"); %>></OPTION>
					<OPTION value="P" <% if (dcNew2.getE02DCMF08().equals("P")) out.println("selected"); %>>Drawer</OPTION>
					<OPTION value="D" <% if (dcNew2.getE02DCMF08().equals("D")) out.println("selected"); %>>Drawee</OPTION>
				</SELECT>
			</td>
			<td nowrap width="30%"><div align="right">Correspondent Bank Charges :</div>
			</td>
            <td nowrap width="20%">
            	<INPUT type="text" name="E02DCMC12" maxlength="13" size="14" value="<%= dcNew2.getE02DCMC12().trim()%>">
				<SELECT name="E02DCMF12">
					<OPTION value=" " <% if (!dcNew2.getE02DCMF12().equals("P") || !dcNew2.getE02DCMF12().equals("D")) out.println("selected"); %>></OPTION>
					<OPTION value="P" <% if (dcNew2.getE02DCMF12().equals("P")) out.println("selected"); %>>Drawer</OPTION>
					<OPTION value="D" <% if (dcNew2.getE02DCMF12().equals("D")) out.println("selected"); %>>Drawee</OPTION>
				</SELECT>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%"> 
             	<div align="right">Advice of Acceptance :</div>
            </td>
            <td nowrap width="20%">  
            	<INPUT type="text" name="E02DCMC13" maxlength="13" size="14" value="<%= dcNew2.getE02DCMC13().trim()%>">
				<SELECT name="E02DCMF13">
					<OPTION value=" " <% if (!dcNew2.getE02DCMF13().equals("P") || !dcNew2.getE02DCMF13().equals("D")) out.println("selected"); %>></OPTION>
					<OPTION value="P" <% if (dcNew2.getE02DCMF13().equals("P")) out.println("selected"); %>>Drawer</OPTION>
					<OPTION value="D" <% if (dcNew2.getE02DCMF13().equals("D")) out.println("selected"); %>>Drawee</OPTION>
				</SELECT>
			</td>
			<td nowrap width="30%">
             	<div align="right">Tracers :</div>
			</td>
            <td nowrap width="20%">
            	<INPUT type="text" name="E02DCMC14" maxlength="13" size="14" value="<%= dcNew2.getE02DCMC14().trim()%>">
				<SELECT name="E02DCMF14">
					<OPTION value=" " <% if (!dcNew2.getE02DCMF14().equals("P") || !dcNew2.getE02DCMF14().equals("D")) out.println("selected"); %>></OPTION>
					<OPTION value="P" <% if (dcNew2.getE02DCMF14().equals("P")) out.println("selected"); %>>Drawer</OPTION>
					<OPTION value="D" <% if (dcNew2.getE02DCMF14().equals("D")) out.println("selected"); %>>Drawee</OPTION>
				</SELECT>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%"> 
             	<div align="right">Postage :</div>
            </td>
            <td nowrap width="20%">  
            	<INPUT type="text" name="E02DCMC02" maxlength="13" size="14" value="<%= dcNew2.getE02DCMC02().trim()%>">
				<SELECT name="E02DCMF02">
					<OPTION value=" " <% if (!dcNew2.getE02DCMF02().equals("P") || !dcNew2.getE02DCMF02().equals("D")) out.println("selected"); %>></OPTION>
					<OPTION value="P" <% if (dcNew2.getE02DCMF02().equals("P")) out.println("selected"); %>>Drawer</OPTION>
					<OPTION value="D" <% if (dcNew2.getE02DCMF02().equals("D")) out.println("selected"); %>>Drawee</OPTION>
				</SELECT>
			</td>
			<td nowrap width="30%">
             	<div align="right">Interest :</div>
			</td>
            <td nowrap width="20%">
            	<INPUT type="text" name="E02DCMC11" maxlength="13" size="14" value="<%= dcNew2.getE02DCMC11().trim()%>">
				<SELECT name="E02DCMF11">
					<OPTION value=" " <% if (!dcNew2.getE02DCMF11().equals("P") || !dcNew2.getE02DCMF11().equals("D")) out.println("selected"); %>></OPTION>
					<OPTION value="P" <% if (dcNew2.getE02DCMF11().equals("P")) out.println("selected"); %>>Drawer</OPTION>
					<OPTION value="D" <% if (dcNew2.getE02DCMF11().equals("D")) out.println("selected"); %>>Drawee</OPTION>
				</SELECT>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%"> 
             	<div align="right">Advice of Payment :</div>
            </td>
            <td nowrap width="20%">  
            	<INPUT type="text" name="E02DCMC09" maxlength="13" size="14" value="<%= dcNew2.getE02DCMC09().trim()%>">
				<SELECT name="E02DCMF09">
					<OPTION value=" " <% if (!dcNew2.getE02DCMF09().equals("P") || !dcNew2.getE02DCMF09().equals("D")) out.println("selected"); %>></OPTION>
					<OPTION value="P" <% if (dcNew2.getE02DCMF09().equals("P")) out.println("selected"); %>>Drawer</OPTION>
					<OPTION value="D" <% if (dcNew2.getE02DCMF09().equals("D")) out.println("selected"); %>>Drawee</OPTION>
				</SELECT>
			</td>
			<td nowrap width="30%">
             	<div align="right">Amendment :</div>
			</td>
            <td nowrap width="20%">
            	<INPUT type="text" name="E02DCMC10" maxlength="13" size="14" value="<%= dcNew2.getE02DCMC10().trim()%>">
				<SELECT name="E02DCMF10">
					<OPTION value=" " <% if (!dcNew2.getE02DCMF10().equals("P") || !dcNew2.getE02DCMF10().equals("D")) out.println("selected"); %>></OPTION>
					<OPTION value="P" <% if (dcNew2.getE02DCMF10().equals("P")) out.println("selected"); %>>Drawer</OPTION>
					<OPTION value="D" <% if (dcNew2.getE02DCMF10().equals("D")) out.println("selected"); %>>Drawee</OPTION>
				</SELECT>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<BR>  

<DIV align="center">
	<INPUT id="EIBSBTN" type=submit name="Submit" value="Submit">
</DIV>

</form>
</body>
</html>
