<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Consulta de Cobranza Simple</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id="dcNew"  class="datapro.eibs.beans.EDC001001Message" scope="session" />
<jsp:useBean id="error"  class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />

<SCRIPT LANGUAGE="javascript">
   builtNewMenu(dc_s_inquiry);
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
	out.println("<SCRIPT> initMenu();  </SCRIPT>");
%>
</head>
<body>
<h3 align="center"> Clean Collections Approval [Basic Information]
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="sing_approval_inq.jsp, EDC0040"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDC0040">

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
					<INPUT type="text" size="12" maxlength="12" value="New" readonly>
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
					</B></DIV>
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
					<DIV align="right"><B>Product Description :</B></DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="left"><B>
						<INPUT type="text" name="E01DSCPRO" size="30" maxlength="30" value="<%=dcNew.getE01DSCPRO().trim()%>" readonly>
					</B></DIV>
				</TD>
			</TR>
			</TBODY></TABLE>
		</td>
	</tr>
</table>
<h4>Drawee Bank</h4>
<table class="tableinfo">
	<tr>
		<td>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trdark">
				<td align="right">
				<table border="0" cellspacing="0">
					<tr id="trdark">
						<td align="right">Customer or Account Number :</td>
						<td nowrap width="25%">
							<select disabled="disabled" name="E01DCMAF4">
								<option value=" " <%if (!(dcNew.getE01DCMAF4().equals("C") || dcNew.getE01DCMAF4().equals("A"))) out.print("selected");%> selected></option>
								<option value="C" <%if (dcNew.getE01DCMAF4().equals("C")) out.print("selected");%>>Customer</option>
								<option value="A" <%if (dcNew.getE01DCMAF4().equals("A")) out.print("selected");%>>Account</option>
							</select>
						</td>
					</tr>
				</table>
				</td>
				<td>
				<table border="0" cellspacing="0">
					<tr id="trdark">
						<td align="left">
							<input type="text" name="E01DCMCLA" size="12" maxlength="12" value="<%=dcNew.getE01DCMCLA()%>">
							<img src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" border="0">
						</td>
						<td>
							
							
						</td>
					</tr>
				</table>
				</td>
			</tr>
			<tr id="trclear">
				<td>
					<div align="right">Name :</div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMCL1" size="45" maxlength="35" value="<%=dcNew.getE01DCMCL1()%>">
					</div>
				</td>
			</tr>
			<tr id="trdark">
				<td>
					<div align="right">Address :</div>
				</td>
				<td>
					<div align="left"><input type="text" name="E01DCMCL2" size="45" maxlength="35" value="<%=dcNew.getE01DCMCL2()%>">
				</div>
				</td>
			</tr>
			<tr id="trclear">
				<td>
					<div align="right"></div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMCL3" size="45" maxlength="35" value="<%=dcNew.getE01DCMCL3()%>">
					</div>
				</td>
			</tr>
			<tr id="trdark">
				<td>
					<div align="right"></div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMCL4" size="45" maxlength="35" value="<%=dcNew.getE01DCMCL4()%>">
					</div>
				</td>
			</tr>
			<tr id="trclear">
				<td>
					<div align="right">Reference :</div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMCRF" size="20" maxlength="16" value="<%=dcNew.getE01DCMCRF()%>">
					</div>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<h4>Drawer</h4>
<table class="tableinfo">
	<tr>
		<td>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trdark">
				<td align="right">
				<table border="0" cellspacing="0">
					<tr id="trdark">
						<td align="right">Customer or Account Number :</td>
						<td nowrap width="25%">
							<select disabled="disabled" name="E01DCMAF1">
								<option value=" " <%if (!(dcNew.getE01DCMAF1().equals("C") || dcNew.getE01DCMAF1().equals("A"))) out.print("selected");%> selected></option>
								<option value="C" <%if (dcNew.getE01DCMAF1().equals("C")) out.print("selected");%>>Customer</option>
								<option value="A" <%if (dcNew.getE01DCMAF1().equals("A")) out.print("selected");%>>Account</option>
							</select>
						</td>
					</tr>
				</table>
				</td>
				<td>
				<table border="0" cellspacing="0">
					<tr id="trdark">
						<td align="left">
							<input type="text" name="E01DCMDRA" size="12" maxlength="12" value="<%=dcNew.getE01DCMDRA()%>">
						</td>
						<td>
							
							
						</td>
					</tr>
				</table>
				</td>
			</tr>
			<tr id="trclear">
				<td>
					<div align="right">Name :</div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMDR1" size="45" maxlength="35" value="<%=dcNew.getE01DCMDR1()%>">
						<IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" align="bottom" border="0">
					</div>
				</td>
			</tr>
			<tr id="trdark">
				<td>
					<div align="right">Address :</div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMDR2" size="45" maxlength="35" value="<%=dcNew.getE01DCMDR2()%>">
					</div>
				</td>
			</tr>
			<tr id="trclear">
				<td>
					<div align="right"></div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMDR3" size="45" maxlength="35" value="<%=dcNew.getE01DCMDR3()%>">
					</div>
				</td>
			</tr>
			<tr id="trdark">
				<td>
					<div align="right"></div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMDR4" size="45" maxlength="35" value="<%=dcNew.getE01DCMDR4()%>">
					</div>
				</td>
			</tr>
			<tr id="trclear">
				<td>
					<div align="right">Reference :</div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMDRF" size="20" maxlength="16" value="<%=dcNew.getE01DCMDRF()%>">
					</div>
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
		<TABLE cellspacing="0" cellpadding="2" width="100%" border="0">
			<TBODY><TR id="trdark">
				<TD align="right">
				<TABLE border="0" cellspacing="0">
					<TBODY><TR id="trdark">
						<TD align="right">Customer or Account Number :</TD>
						<TD nowrap width="25%"><select disabled="disabled" name="E01DCMAF3">
							<OPTION value=" "></OPTION>
							<OPTION value="C" <%if (dcNew.getE01DCMAF3().equals("C")) out.print("selected");%>>Customer</OPTION>
							<OPTION value="A" <%if (dcNew.getE01DCMAF3().equals("A")) out.print("selected");%>>Account</OPTION>
						</SELECT></TD>
					</TR>
				</TBODY></TABLE>
				</TD>
				<TD>
				<TABLE border="0" cellspacing="0">
					<TBODY>
						<TR id="trdark">
							<TD align="left">
								<INPUT type="text" name="E01DCMRBA" size="12" maxlength="12" value="<%=dcNew.getE01DCMRBA()%>">
							</TD>
							<TD>
								
								
							</TD>
						</TR>
					</TBODY>
				</TABLE>
				</TD>
			</TR>
			<TR id="trclear">
				<TD>
					<DIV align="right">Name :</DIV>
				</TD>
				<TD>
					<DIV align="left">
						<INPUT type="text" name="E01DCMRB1" size="45" maxlength="35" value="<%=dcNew.getE01DCMRB1()%>">
					</DIV>
				</TD>
			</TR>
			<TR id="trdark">
				<TD>
					<DIV align="right">Address :</DIV>
				</TD>
				<TD>
					<DIV align="left">
						<INPUT type="text" name="E01DCMRB2" size="45" maxlength="35" value="<%=dcNew.getE01DCMRB2()%>">
					</DIV>
				</TD>
			</TR>
			<TR id="trclear">
				<TD>
					<DIV align="right"></DIV>
				</TD>
				<TD>
					<DIV align="left">
						<INPUT type="text" name="E01DCMRB3" size="45" maxlength="35" value="<%=dcNew.getE01DCMRB3()%>">
					</DIV>
				</TD>
			</TR>
			<TR id="trdark">
				<TD>
					<DIV align="right"></DIV>
				</TD>
				<TD>
					<DIV align="left">
						<INPUT type="text" name="E01DCMRB4" size="45" maxlength="35" value="<%=dcNew.getE01DCMRB4()%>">
					</DIV>
				</TD>
			</TR>
			<TR id="trclear">
				<TD>
					<DIV align="right">Reference :</DIV>
				</TD>
				<TD>
					<DIV align="left">
						<INPUT type="text" name="E01DCMRRF" size="20" maxlength="16" value="<%=dcNew.getE01DCMRRF()%>">
					</DIV>
				</TD>
			</TR>
		</TBODY></TABLE>
		</td>
	</tr>
</table>

<h4>Reimbursing Bank</h4>
<table class="tableinfo">
	<tr>
		<td>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trdark">
				<td align="right">
				<table border="0" cellspacing="0">
					<tr id="trdark">
						<td align="right">Customer or Account Number :</td>
						<td nowrap width="25%">
							<select disabled="disabled" name="E01DCMAF2">
								<option value=" " <%if (!(dcNew.getE01DCMAF2().equals("C") || dcNew.getE01DCMAF2().equals("A"))) out.print("selected");%> selected></option>
								<option value="C" <%if (dcNew.getE01DCMAF2().equals("C")) out.print("selected");%>>Cliente</option>
								<option value="A" <%if (dcNew.getE01DCMAF2().equals("A")) out.print("selected");%>>Cuenta</option>
							</select>
						</td>
					</tr>
				</table>
				</td>
				<td>
				<table border="0" cellspacing="0">
					<tr id="trdark">
						<td align="left">
							<input type="text" name="E01DCMDWA" size="12" maxlength="12" value="<%=dcNew.getE01DCMDWA()%>">
						</td>
						<td>
							
							</td>
					</tr>
				</table>
				</td>
			</tr>
			<tr id="trclear">
				<td>
					<div align="right">Name :</div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMDW1" size="45" maxlength="35" value="<%=dcNew.getE01DCMDW1()%>">
						<IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" align="bottom" border="0">
					</div>
				</td>
			</tr>
			<tr id="trdark">
				<td>
					<div align="right">Address :</div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMDW2" size="45" maxlength="35" value="<%=dcNew.getE01DCMDW2()%>">
					</div>
				</td>
			</tr>
			<tr id="trclear">
				<td>
					<div align="right"></div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMDW3" size="45" maxlength="35" value="<%=dcNew.getE01DCMDW3()%>">
					</div>
				</td>
			</tr>
			<tr id="trdark">
				<td>
					<div align="right"></div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMDW4" size="45" maxlength="35" value="<%=dcNew.getE01DCMDW4()%>">
					</div>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

  <h4>Collection Information</h4>  
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <TABLE cellspacing="0" cellpadding="2" width="100%" border="0">
          <TBODY>
          <tr id="trdark">
			<td nowrap width="30%">
             	<div align="right">Issuing Date :</div>
			</td>
            <td nowrap width="20%">
            	<INPUT type="text" name="E01DCMID1" maxlength="2" size="3" value="<%= dcNew.getE01DCMID1().trim()%>" onKeyPress="enterInteger()">
            	<INPUT type="text" name="E01DCMID2" maxlength="2" size="3" value="<%= dcNew.getE01DCMID2().trim()%>" onKeyPress="enterInteger()">
            	<INPUT type="text" name="E01DCMID3" maxlength="2" size="3" value="<%= dcNew.getE01DCMID3().trim()%>" onKeyPress="enterInteger()">
                <A href="javascript:DatePicker(document.forms[0].E01DCMID1,document.forms[0].E01DCMID2,document.forms[0].E01DCMID3)"></A>
            </td>
			<td nowrap width="30%">
             	<div align="right">Next Tracer Date :</div>
			</td>
            <td nowrap width="20%">
            	<INPUT type="text" name="E01DCMNT1" maxlength="2" size="3" value="<%= dcNew.getE01DCMNT1().trim()%>" onKeyPress="enterInteger()">
            	<INPUT type="text" name="E01DCMNT2" maxlength="2" size="3" value="<%= dcNew.getE01DCMNT2().trim()%>" onKeyPress="enterInteger()">
            	<INPUT type="text" name="E01DCMNT3" maxlength="2" size="3" value="<%= dcNew.getE01DCMNT3().trim()%>" onKeyPress="enterInteger()">
                <A href="javascript:DatePicker(document.forms[0].E01DCMNT1,document.forms[0].E01DCMNT2,document.forms[0].E01DCMNT3)"></A>
            </td>
          </tr>
          <TR id="trclear"> 
            <TD nowrap width="30%">
             	<DIV align="right">Foreign Exchange Rate :</DIV>
			</TD>
			<TD nowrap width="20%">
            	<INPUT type="text" name="E01DCMOFX" maxlength="19" size="20" value="<%= dcNew.getE01DCMOFX().trim()%>" onkeypress="enterDecimal()">
				<IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" align="bottom" border="0">
            </TD>
			<TD nowrap width="30%"> 
             	<DIV align="right">
					<DIV align="right">Commissions Table :</DIV>
					</DIV>
            </TD>
            <TD nowrap width="20%">
            	<A href="javascript:GetCurrency('E01DCMFCY','')"></A><INPUT
						type="text" name="E01DCMTAR" maxlength="3" size="4"
						value="<%= dcNew.getE01DCMTAR().trim()%>"> 
			<IMG src="<%=request.getContextPath()%>/images/Check.gif"
						alt="Mandatory Field" align="bottom" border="0"></TD>
          </TR>
          <TR id="trdark"> 
            <TD nowrap width="30%">
             	<DIV align="right">Check Number :</DIV>
			</TD>
			<TD nowrap width="20%">
            	<INPUT type="text" name="E01DCMCKN" maxlength="10" size="11" value="<%= dcNew.getE01DCMCKN().trim()%>" onkeypress="enterInteger()">
				<IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" align="bottom" border="0">
            </TD>
			<TD nowrap width="30%"> 
             	<DIV align="right">Cost Center :</DIV>
            </TD>
            <TD nowrap width="20%">  
            	<INPUT type="text" name="E01DCMCCN" maxlength="9" size="10" value="<%= dcNew.getE01DCMCCN().trim()%>">
            	<A href="javascript:GetCostCenter('E01DCMCCN',document.forms[0].E01DCMBNK.value)"></A>             
			</TD>
          </TR>
          <TR id="trclear"> 
            <TD nowrap width="30%">
             	<DIV align="right">Balance :</DIV>
			</TD>
			<TD nowrap width="20%">
            	<INPUT type="text" name="E01DCMAMN" maxlength="19" size="20" value="<%= dcNew.getE01DCMAMN().trim()%>" onkeypress="enterDecimal()">
				<IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" align="bottom" border="0">
            </TD>
			<TD nowrap width="30%" align="right">Original Amount :</TD><TD nowrap width="20%">
			<INPUT	type="text" name="E01DCMMEB" maxlength="19" size="20"	value="<%= dcNew.getE01DCMOAM().trim()%>" onkeypress="enterDecimal()"></TD>            
          </TR>
          <TR id="trdark"> 
            <TD nowrap width="30%"> 
             	<DIV align="right">Our Charges for Account of :</DIV>
            </TD>
            <TD nowrap width="20%">  
				<select disabled="disabled" name="E01DCMOCF">
					<OPTION value=" " <% if ((!dcNew.getE01DCMOCF().equals("D")) && (!dcNew.getE01DCMOCF().equals("P")) && (!dcNew.getE01DCMOCF().equals("N"))) out.println("selected"); %>></OPTION>
					<OPTION value="D" <% if (dcNew.getE01DCMOCF().equals("D")) out.println("selected"); %>>Drawee/Payor</OPTION>
					<OPTION value="P" <% if (dcNew.getE01DCMOCF().equals("P")) out.println("selected"); %>>Drawer/Principal</OPTION>
					<OPTION value="N" <% if (dcNew.getE01DCMOCF().equals("N")) out.println("selected"); %>>No Charges</OPTION>
				</SELECT>
				<IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" align="bottom" border="0">
			</TD>
			<TD nowrap width="30%">
             	<DIV align="right">Advise Dishonor Via :</DIV>
			</TD>
			<TD nowrap width="20%">
				<select disabled="disabled" name="E01DCMADF">
					<OPTION value=" " <% if ((!dcNew.getE01DCMADF().equals("T")) && (!dcNew.getE01DCMADF().equals("S")) && (!dcNew.getE01DCMADF().equals("A")) && (!dcNew.getE01DCMADF().equals("C")) && (!dcNew.getE01DCMADF().equals("F"))) out.println("selected"); %>></OPTION>
					<OPTION value="T" <% if (dcNew.getE01DCMADF().equals("T")) out.println("selected"); %>>Telex</OPTION>
					<OPTION value="S" <% if (dcNew.getE01DCMADF().equals("S")) out.println("selected"); %>>Swift</OPTION>
					<OPTION value="A" <% if (dcNew.getE01DCMADF().equals("A")) out.println("selected"); %>>Mail</OPTION>
					<OPTION value="C" <% if (dcNew.getE01DCMADF().equals("C")) out.println("selected"); %>>Courier</OPTION>
					<OPTION value="F" <% if (dcNew.getE01DCMADF().equals("F")) out.println("selected"); %>>Fax</OPTION>
				</SELECT>
				<IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" align="bottom" border="0">
            </TD>
          </TR>
		  <TR id="trclear">
			<TD nowrap width="30%">
             	<DIV align="right">Other Bank Charges for Account of :</DIV>
			</TD>
			<TD nowrap width="20%">
				<select disabled="disabled" name="E01DCMOBF">
					<OPTION value=" " <% if ((!dcNew.getE01DCMOBF().equals("D")) && (!dcNew.getE01DCMOBF().equals("P"))) out.println("selected"); %>></OPTION>
					<OPTION value="D" <% if (dcNew.getE01DCMOBF().equals("D")) out.println("selected"); %>>Drawee/Payor</OPTION>
					<OPTION value="P" <% if (dcNew.getE01DCMOBF().equals("P")) out.println("selected"); %>>Drawer/Principal</OPTION>
				</SELECT>
				<IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" align="bottom" border="0">
            </TD>
			<TD nowrap width="30%">
             	<DIV align="right">Advise Payment Via :</DIV>
			</TD>
			<TD nowrap width="20%">
				<select disabled="disabled" name="E01DCMAPF">
					<OPTION value=" " <% if ((!dcNew.getE01DCMAPF().equals("T")) && (!dcNew.getE01DCMAPF().equals("S")) && (!dcNew.getE01DCMAPF().equals("A")) && (!dcNew.getE01DCMAPF().equals("C")) && (!dcNew.getE01DCMAPF().equals("F"))) out.println("selected"); %>></OPTION>
					<OPTION value="T" <% if (dcNew.getE01DCMAPF().equals("T")) out.println("selected"); %>>Telex</OPTION>
					<OPTION value="S" <% if (dcNew.getE01DCMAPF().equals("S")) out.println("selected"); %>>Swift</OPTION>
					<OPTION value="A" <% if (dcNew.getE01DCMAPF().equals("A")) out.println("selected"); %>>Mail</OPTION>
					<OPTION value="C" <% if (dcNew.getE01DCMAPF().equals("C")) out.println("selected"); %>>Courier</OPTION>
					<OPTION value="F" <% if (dcNew.getE01DCMAPF().equals("F")) out.println("selected"); %>>Fax</OPTION>
				</SELECT>
            </TD>
		  </TR>
		  <TR id="trdark">
            <TD nowrap width="30%"> 
             	<DIV align="right">Customer Line of Credit :</DIV>
            </TD>
            <TD nowrap width="20%">  
            	<INPUT type="text" name="E01DCMCMN" maxlength="5" size="6" value="<%= dcNew.getE01DCMCMN().trim()%>">
				<INPUT type="text" name="E01DCMLNR" maxlength="10" size="11" value="<%= dcNew.getE01DCMLNR().trim()%>">
				<A href="javascript:GetCustomer('E01DCMLNR')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="middle" border="0"></A>
			</TD>
			<TD nowrap width="30%"><DIV align="right"></DIV>
			</TD>
			<TD nowrap width="20%">
            	
				<A href="javascript:GetTariffColl('E01DCMTAR','<%=dcNew.getE01DCMATY()%>')"></A> 
				
            </TD>
          </TR>
          <TR id="trclear"> 
            <TD nowrap width="30%"> 
             	<DIV align="right">Collection Status :</DIV>
            </TD>
            <TD nowrap width="20%">  
				<select disabled="disabled" name="E01DCMCST">
					<OPTION value=" " <% if ((!dcNew.getE01DCMCST().equals("0")) && (!dcNew.getE01DCMCST().equals("1")) && (!dcNew.getE01DCMCST().equals("2")) && (!dcNew.getE01DCMCST().equals("3")) && (!dcNew.getE01DCMCST().equals("4")) && (!dcNew.getE01DCMCST().equals("5")) && (!dcNew.getE01DCMCST().equals("6")) && (!dcNew.getE01DCMCST().equals("7")) && (!dcNew.getE01DCMCST().equals("8")) && (!dcNew.getE01DCMCST().equals("9")) && (!dcNew.getE01DCMCST().equals("P")) && (!dcNew.getE01DCMCST().equals("V")))%>></OPTION>
					<OPTION value="0" <% if (dcNew.getE01DCMCST().equals("0")) out.println("selected"); %>>Awaiting Acknowledge</OPTION>
					<OPTION value="1" <% if (dcNew.getE01DCMCST().equals("1")) out.println("selected"); %>>Awaiting Acceptance</OPTION>
					<OPTION value="2" <% if (dcNew.getE01DCMCST().equals("2")) out.println("selected"); %>>Awaiting Payment</OPTION>
					<OPTION value="3" <% if (dcNew.getE01DCMCST().equals("3")) out.println("selected"); %>>Accepted</OPTION>
					<OPTION value="4" <% if (dcNew.getE01DCMCST().equals("4")) out.println("selected"); %>>Protested Outstanding</OPTION>
					<OPTION value="5" <% if (dcNew.getE01DCMCST().equals("5")) out.println("selected"); %>>Maturity Extended</OPTION>
					<OPTION value="6" <% if (dcNew.getE01DCMCST().equals("6")) out.println("selected"); %>>Cancelled - Free of Charge</OPTION>
					<OPTION value="7" <% if (dcNew.getE01DCMCST().equals("7")) out.println("selected"); %>>Cancelled - Returned Unpaid</OPTION>
					<OPTION value="8" <% if (dcNew.getE01DCMCST().equals("8")) out.println("selected"); %>>Closed Partially Paid</OPTION>
					<OPTION value="9" <% if (dcNew.getE01DCMCST().equals("9")) out.println("selected"); %>>Closed Fully Paid</OPTION>
					<OPTION value="P" <% if (dcNew.getE01DCMCST().equals("P")) out.println("selected"); %>>Past Due - Protested</OPTION>
					<OPTION value="V" <% if (dcNew.getE01DCMCST().equals("V")) out.println("selected"); %>>Past Due - Non Protested</OPTION>
				</SELECT>
			</TD>
			<TD nowrap width="30%"></TD>
            <TD nowrap width="20%"></TD>
          </TR>
        </TBODY></TABLE>
      </td>
    </tr>
  </table>
<BR>

</form>
</body>
</html>
