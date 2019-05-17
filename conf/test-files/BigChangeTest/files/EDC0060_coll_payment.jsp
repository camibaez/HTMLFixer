<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Opening Documentary Collection</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id="dcPag"  class="datapro.eibs.beans.EDC006001Message" scope="session" />
<jsp:useBean id="error"  class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />
<SCRIPT Language="Javascript">
  function helpAcc(tipo,fldst,fld1,fld2){
    if(tipo=='A'){
        GetAccByClient(fldst,'','RT','','E01DCMCL1')
    }
    if(tipo=='G'){
       if(fld2==''){
          alert("Seleccione Moneda de Cuenta Contable");
          return;
       } 
        GetLedger(fldst,fld1,fld2,'')
    }    
  }
</SCRIPT>
<%if (!error.getERRNUM().equals("0")) {
	error.setERRNUM("0");
	out.println("<SCRIPT Language=\"Javascript\">");
	out.println("       showErrors()");
	out.println("</SCRIPT>");
}
%>

</head>
<body>
<h3 align="center">Settlement Collection  <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="coll_payment.jsp, EDC0060"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDC0060">
<!-- INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="<%if (userPO.getPurpose().equals("NEW"))out.print("2"); else out.print("4");%>" --> 
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="003"> 
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
						<INPUT type="text" name="E01DCMBNK" readonly size="4" maxlength="2" value="<%=dcPag.getE01DCMBNK().trim()%>">
					</DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="right"><B>Collection Number   :</B></DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="left"><B> 
					<INPUT type="text" name="E01DCMACC" size="12" maxlength="12" value="<%=dcPag.getE01DCMACC().trim()%>" readonly>				
					</B></DIV>
				</TD>
			</TR>
			<TR id="trclear">
				<TD nowrap width="16%">
					<DIV align="right"><B>Client :</B></DIV>
				</TD>
				<TD nowrap width="20%">
					<DIV align="left">
						<INPUT type="text" name="E01CUSNA1" size="37" maxlength="35" value="<%=dcPag.getE01CUSNA1().trim()%>" readonly> 	</DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="right"><B>Product :</B></DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="left"><B>
						<INPUT type="text" name="E01DCMPRO" size="4" maxlength="4" value="<%=dcPag.getE01DCMPRO().trim()%>" readonly>
					</B></DIV>
				</TD>
			</TR>
			<TR id="trdark">
				<TD nowrap width="16%">
					<DIV align="right"><B>Collection Type :</B></DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="left"><B>
						<INPUT type="text" name="E01DCMTYP" size="20" maxlength="16" value="<%=dcPag.getE01DCMTYP().trim()%>" readonly>
					</B></DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="right"><B>Product Description :</B></DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="left"><B>
						<INPUT type="text" name="E01DSCPRO" size="30" maxlength="30" value="<%=dcPag.getE01DSCPRO().trim()%>" readonly>
					</B></DIV>
				</TD>
			</TR>
			<TR id="trclear">
				<TD nowrap width="16%">
					<DIV align="right"><B>Currency :</B></DIV>
				</TD>
				<TD nowrap width="20%">
					<DIV align="left">
						<INPUT type="text" name="E01CUSNA1" size="5" maxlength="5" value="<%=dcPag.getE01DCMCCY().trim()%>" readonly> 	</DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="right"><B></B></DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="left"> 
						</DIV>
				</TD>
			</TR>
			
			</TBODY></TABLE>
		</td>
	</tr>
</table>
<h4>Presenting Bank</h4>
<table class="tableinfo">
	<tr>
		<TD align="right">Type of Operation:</TD>
		<TD align="left"><INPUT type="hidden" name="E01TIPOPE" size="30" maxlength="30" value="<%= dcPag.getE01TIPOPE() %>">  						    
							<select name="E01TIPOPEXX" disabled="disabled">
								<option value=" " selected ></option>
								<option value="1" <%= dcPag.getE01TIPOPE().equals("1")?"selected":"" %>>Full Payment</option>
								<option value="2" <%= dcPag.getE01TIPOPE().equals("2")?"selected":"" %>>Partial Payment</option>
								<option value="3" <%= dcPag.getE01TIPOPE().equals("3")?"selected":"" %>>Fee Collection</option>
								<option value="4" <%= dcPag.getE01TIPOPE().equals("4")?"selected":"" %>>Cancelation</option>								
							</select>
							<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" border="0">
		</td>
		<td>
				<div align="right">Amount to Pay :</div>
		</td>
		<td>
			<div align="left">
				<input type="text" name="E01MNTPAG" size="28" maxlength="35"  readonly="readonly"	value="<%=dcPag.getE01MNTPAG()%>">
			</div>
		</td>
		<td>
			<div align="right">Condition of <br>Cancellation :</div>
		</td>					
		<TD align="left"><div align="left">
			  		<INPUT type="hidden" name="E01CONDCA" size="30" maxlength="30" value="<%= dcPag.getE01CONDCA() %>"> 
				     <SELECT name="E01CONDCAXX" disabled="disabled">
					   <OPTION value=" " selected></OPTION>
					   <OPTION value="F" <%= dcPag.getE01CONDCA().equals("F")?"selected":"" %>>Free of Payment</OPTION>
					   <OPTION value="R" <%= dcPag.getE01CONDCA().equals("R")?"selected":"" %>>Returned Unpaid</OPTION>
				     </SELECT>
				   </div>
		</td>
	</tr>
</table>
<BR>
<H4>Settle with Sender</H4>
<TABLE class="tableinfo">
  <TR>
    <TD WIDTH="15%"><DIV align="right">Rebate :</DIV></TD>
    <TD WIDTH="25%">
        <INPUT type="hidden" name="E01REMVIA" size="30" maxlength="30" value="<%= dcPag.getE01REMVIA() %>"> 
        <SELECT name="E01REMVIAXX" disabled="disabled">
			<OPTION value=" " selected></OPTION>
			<OPTION value="1" <%= dcPag.getE01REMVIA().equals("1")?"selected":"" %>>Official Check</OPTION>
			<OPTION value="2" <%= dcPag.getE01REMVIA().equals("2")?"selected":"" %>>Checking Account</OPTION>
			<OPTION value="3" <%= dcPag.getE01REMVIA().equals("3")?"selected":"" %>>Ledger Account</OPTION>
			<OPTION value="4" <%= dcPag.getE01REMVIA().equals("4")?"selected":"" %>>FED ( USA )</OPTION>
			<OPTION value="5" <%= dcPag.getE01REMVIA().equals("5")?"selected":"" %>>SWIFT</OPTION>
			<OPTION value="6" <%= dcPag.getE01REMVIA().equals("6")?"selected":"" %>>Telex</OPTION>
		</SELECT><IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" border="0">    
    </TD>
    <TD WIDTH="15%"><DIV align="right">Currency of Reimbursement : </DIV></TD>
    <TD WIDTH="25%"><DIV align="left"><INPUT type="text" name="E01REMCCY" size="4" maxlength="3" value="<%=dcPag.getE01REMCCY()%>" readonly="readonly"></DIV></TD>
    <TD WIDTH="15%"><DIV align="right">	Account of Reimbursement:</DIV></TD>
    <TD WIDTH="25%"><DIV align="left"><INPUT type="text" name="E01REMACC" size="17" maxlength="16" value="<%=dcPag.getE01REMACC()%>" readonly="readonly"></DIV></TD>
    <TD ><BR></TD>
  </TR>
</TABLE>
<H4>Settle with Payer</H4>
<TABLE class="tableinfo">
  <TR>
    <TD WIDTH="15%"><DIV align="right">Payment Via:</DIV></TD>
    <TD WIDTH="15%"><DIV align="left">
       <INPUT type="hidden" name="E01PAGVIA" size="30" maxlength="30" value="<%= dcPag.getE01PAGVIA() %>"> 
       <SELECT name="E01PAGVIAXX" disabled="disabled" >
			<OPTION value=" " selected></OPTION>
			<OPTION value="2" <%= dcPag.getE01PAGVIA().equals("2")?"selected":"" %>>Checking Account</OPTION>
			<OPTION value="3" <%= dcPag.getE01PAGVIA().equals("3")?"selected":"" %>>Ledger Account</OPTION>
	  </SELECT> <IMG	src="<%=request.getContextPath()%>/images/Check.gif"	alt="mandatory field" border="0"></DIV>
	</TD>
    <TD WIDTH="15%"><DIV align="right">Currency of Payment :</DIV></TD>
    <TD>
		<DIV align="left"><INPUT type="text" name="E01PAGCCY" size="4" maxlength="3" value="<%=dcPag.getE01PAGCCY()%>" readonly="readonly"></DIV>
	</TD>
    <TD WIDTH="15%"><DIV align="right">Principal Payment <br> Account Number :</DIV></TD>
	<TD>
	   <DIV align="left"><INPUT type="text" name="E01PAGACCP"  readonly="readonly"	size="18" maxlength="16" value="<%=dcPag.getE01PAGACCP()%>"> </DIV>
	</TD>	
	<TD WIDTH="15%"><DIV align="right">Payment Account Number <br> Comission/Taxes :</DIV></TD>
	<TD WIDTH="15%">
	   <DIV align="left"><INPUT type="text" name="E01PAGACCC"  readonly="readonly" size="18" maxlength="16" value="<%=dcPag.getE01PAGACCC()%>"> </DIV>
	</TD>		
  </TR>
</TABLE>

<BR>  

<H4>Exchange</H4>
<TABLE class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
  <TR id="trdark">
			<TD>Currency</TD>
			<TD>T/C Purchase</TD>
			<TD>T/C Sale</TD>
			<TD>Currency</TD>
			<TD>T/C Purchase</TD>
			<TD>T/C Sale</TD>
		</TR>
		<TR>
    <TD><INPUT type="text" name="E01OCCY01" value="<%=dcPag.getE01OCCY01()%>" size="9" maxlength="3" readonly></TD>
    <TD><INPUT type="text" name="E01OXRP01" value="<%=dcPag.getE01OXRP01() %>" size="20" maxlength="11"></TD>
    <TD><INPUT type="text" name="E01OXRS01" value="<%=dcPag.getE01OXRS01()%>" size="20" maxlength="11"></TD>
    <TD><INPUT type="text" name="E01OCCY02" value="<%=dcPag.getE01OCCY02()%>" size="9" maxlength="3" readonly></TD>
    <TD><INPUT type="text" name="E01OXRP02" value="<%=dcPag.getE01OXRP02()%>" size="20" maxlength="11"></TD>
    <TD><INPUT type="text" name="E01OXRS02" value="<%=dcPag.getE01OXRS02()%>" size="20" maxlength="11"></TD>
		</TR>
		<TR>
    <TD><INPUT type="text" name="E01OCCY03" value="<%=dcPag.getE01OCCY03()%>" size="9" maxlength="3" readonly></TD>
    <TD><INPUT type="text" name="E01OXRP03" value="<%=dcPag.getE01OXRP03()%>" size="20" maxlength="11"></TD>
    <TD><INPUT type="text" name="E01OXRS03" value="<%=dcPag.getE01OXRS03()%>" size="20" maxlength="11"></TD>
    <TD><INPUT type="text" name="E01OCCY04" value="<%=dcPag.getE01OCCY04()%>" size="9" maxlength="3" readonly></TD>
    <TD><INPUT type="text" name="E01OXRP04" value="<%=dcPag.getE01OXRP04()%>" size="20" maxlength="11"></TD>
    <TD><INPUT type="text" name="E01OXRS04" value="<%=dcPag.getE01OXRS04()%>" size="20" maxlength="11"></TD>
		</TR>
</TABLE>

<H4>Retentions</H4>
<TABLE class="tableinfo">
	<TBODY>
		<TR>
			<TD>
			<TABLE cellspacing="0" cellpadding="2" width="100%" border="0">
				<TBODY>
					<TR id="trclear">
						<TD>
						<DIV align="right">Taxes :</DIV>
						</TD>
						<TD>
						<DIV align="left"><INPUT type="text" name="E01RETIMP" size="45"
							maxlength="35" value="<%=dcPag.getE01RETIMP()%>"></DIV>
						</TD>
					</TR>
					<TR id="trdark">
						<TD>
						<DIV align="right">Others :</DIV>
						</TD>
						<TD>
						<DIV align="left"><INPUT type="text" name="E01RETOTR" size="45"
							maxlength="35" value="<%=dcPag.getE01RETOTR()%>"></DIV>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
			</TD>
		</TR>
	</TBODY>
</TABLE>


<H4>Commission in : <INPUT type="text" name="E01COMCCY" size="4" maxlength="4" value="<%=dcPag.getE01COMCCY()%>" readonly> 	</H4>
<TABLE class="tableinfo">
	<TBODY>
		<TR>
			<TD>
<TABLE cellspacing="0" cellpadding="2" width="100%" border="0">
	<TBODY>
		<TR id="trclear">
			<TH nowrap width="30%">
			<DIV>Concept</DIV>
			</TH>
			<TH nowrap width="20%">
			<DIV>Amount/On account of</DIV>
			</TH>
			<TH nowrap width="30%">
			<DIV>Concept</DIV>
			</TH>
			<TH nowrap width="20%">
			<DIV>Amount/On account of</DIV>
			</TH>
		</TR>
		<TR id="trdark">
			<TD nowrap width="30%">
			<DIV align="right">Our Commission :</DIV>
			</TD>
			<TD nowrap width="20%"><INPUT type="text" name="E01DCMC01" maxlength="13" size="14" value="<%= dcPag.getE01DCMC01().trim()%>"> 
			<SELECT name="E01PYBY01">
				<OPTION value=" " <% if (!dcPag.getE01PYBY01().equals("P") || !dcPag.getE01PYBY01().equals("D")) out.println("selected"); %>></OPTION>
				<OPTION value="P" <% if (dcPag.getE01PYBY01().equals("P")) out.println("selected"); %>>Principal</OPTION>
				<OPTION value="D" <% if (dcPag.getE01PYBY01().equals("D")) out.println("selected"); %>>Payable to</OPTION>
			</SELECT></TD>
			<TD nowrap width="30%">
			<DIV align="right">Courier Service :</DIV>
			</TD>
			<TD nowrap width="20%"><INPUT type="text" name="E01DCMC03" 	maxlength="13" size="14" value="<%= dcPag.getE01DCMC03().trim()%>">
			<SELECT name="E01PYBY03">
				<OPTION value=" " <% if (!dcPag.getE01PYBY03().equals("P") || !dcPag.getE01PYBY03().equals("D")) out.println("selected"); %>></OPTION>
				<OPTION value="P" <% if (dcPag.getE01PYBY03().equals("P")) out.println("selected"); %>>Principal</OPTION>
				<OPTION value="D" <% if (dcPag.getE01PYBY03().equals("D")) out.println("selected"); %>>Payable to</OPTION>
			</SELECT></TD>
		</TR>
		<TR id="trclear">
			<TD nowrap width="30%">
			<DIV align="right">Acknowledgement Swift :</DIV>
			</TD>
			<TD nowrap width="20%"><INPUT type="text" name="E01DCMC04" 	maxlength="13" size="14" value="<%= dcPag.getE01DCMC04().trim()%>">
			<SELECT name="E01PYBY04">	
				<OPTION value=" " <% if (!dcPag.getE01PYBY04().equals("P") || !dcPag.getE01PYBY04().equals("D")) out.println("selected"); %>></OPTION>
				<OPTION value="P" <% if (dcPag.getE01PYBY04().equals("P")) out.println("selected"); %>>Principal</OPTION>
				<OPTION value="D" <% if (dcPag.getE01PYBY04().equals("D")) out.println("selected"); %>>Payable to</OPTION>
			</SELECT></TD>
			<TD nowrap width="30%">
			<DIV align="right">Bank Charges Remitent :</DIV>
			</TD>
			<TD nowrap width="20%"><INPUT type="text" name="E01DCMC05" 	maxlength="13" size="14" value="<%= dcPag.getE01DCMC05().trim()%>">
			<SELECT name="E01PYBY05">
				<OPTION value=" " <% if (!dcPag.getE01PYBY05().equals("P") || !dcPag.getE01PYBY05().equals("D")) out.println("selected"); %>></OPTION>
				<OPTION value="P" <% if (dcPag.getE01PYBY05().equals("P")) out.println("selected"); %>>Principal</OPTION>
				<OPTION value="D" <% if (dcPag.getE01PYBY05().equals("D")) out.println("selected"); %>>Payable to</OPTION>
			</SELECT></TD>
		</TR>
		<TR id="trdark">
			<TD nowrap width="30%">
			<DIV align="right">Swift Messages :</DIV>
			</TD>
			<TD nowrap width="20%"><INPUT type="text" name="E01DCMC06" 	maxlength="13" size="14" value="<%= dcPag.getE01DCMC06().trim()%>">
			<SELECT name="E01PYBY06">
				<OPTION value=" " <% if (!dcPag.getE01PYBY06().equals("P") || !dcPag.getE01PYBY06().equals("D")) out.println("selected"); %>></OPTION>
				<OPTION value="P" <% if (dcPag.getE01PYBY06().equals("P")) out.println("selected"); %>>Principal</OPTION>
				<OPTION value="D" <% if (dcPag.getE01PYBY06().equals("D")) out.println("selected"); %>>Payable to</OPTION>
			</SELECT></TD>
			<TD nowrap width="30%">
			<DIV align="right">Fax/Phone Services :</DIV>
			</TD>
			<TD nowrap width="20%"><INPUT type="text" name="E01DCMC07" maxlength="13" size="14" value="<%= dcPag.getE01DCMC07().trim()%>">
			<SELECT name="E01PYBY07">
				<OPTION value=" " <% if (!dcPag.getE01PYBY07().equals("P") || !dcPag.getE01PYBY07().equals("D")) out.println("selected"); %>></OPTION>
				<OPTION value="P" <% if (dcPag.getE01PYBY07().equals("P")) out.println("selected"); %>>Principal</OPTION>
				<OPTION value="D" <% if (dcPag.getE01PYBY07().equals("D")) out.println("selected"); %>>Payable to</OPTION>
			</SELECT></TD>
		</TR>
		<TR id="trclear">
			<TD nowrap width="30%">
			<DIV align="right">Swift Remittance :</DIV>
			</TD>
			<TD nowrap width="20%"><INPUT type="text" name="E01DCMC08" maxlength="13" size="14" value="<%= dcPag.getE01DCMC08().trim()%>">
			<SELECT name="E01PYBY08">
				<OPTION value=" " <% if (!dcPag.getE01PYBY08().equals("P") || !dcPag.getE01PYBY08().equals("D")) out.println("selected"); %>></OPTION>
				<OPTION value="P" <% if (dcPag.getE01PYBY08().equals("P")) out.println("selected"); %>>Principal</OPTION>
				<OPTION value="D" <% if (dcPag.getE01PYBY08().equals("D")) out.println("selected"); %>>Payable to</OPTION>
			</SELECT></TD>
			<TD nowrap width="30%">
			<DIV align="right">Correspondent Bank Charges :</DIV>
			</TD>
			<TD nowrap width="20%"><INPUT type="text" name="E01DCMC12" 	maxlength="13" size="14" value="<%= dcPag.getE01DCMC12().trim()%>">
			<SELECT name="E01PYBY12">
				<OPTION value=" " <% if (!dcPag.getE01PYBY12().equals("P") || !dcPag.getE01PYBY12().equals("D")) out.println("selected"); %>></OPTION>
				<OPTION value="P" <% if (dcPag.getE01PYBY12().equals("P")) out.println("selected"); %>>Principal</OPTION>
				<OPTION value="D" <% if (dcPag.getE01PYBY12().equals("D")) out.println("selected"); %>>Payable to</OPTION>
			</SELECT></TD>
		</TR>
		<TR id="trdark">
			<TD nowrap width="30%">
			<DIV align="right">Swift Acceptance Notice :</DIV>
			</TD>
			<TD nowrap width="20%"><INPUT type="text" name="E01DCMC13" maxlength="13" size="14" value="<%= dcPag.getE01DCMC13().trim()%>">
			<SELECT name="E01PYBY13">
				<OPTION value=" " <% if (!dcPag.getE01PYBY13().equals("P") || !dcPag.getE01PYBY13().equals("D")) out.println("selected"); %>></OPTION>
				<OPTION value="P" <% if (dcPag.getE01PYBY13().equals("P")) out.println("selected"); %>>Principal</OPTION>
				<OPTION value="D" <% if (dcPag.getE01PYBY13().equals("D")) out.println("selected"); %>>Payable to</OPTION>
			</SELECT></TD>
			<TD nowrap width="30%">
			<DIV align="right">Tracers :</DIV>
			</TD>
			<TD nowrap width="20%"><INPUT type="text" name="E01DCMC14"	maxlength="13" size="14" value="<%= dcPag.getE01DCMC14().trim()%>">
			<SELECT name="E01PYBY14">
				<OPTION value=" " <% if (!dcPag.getE01PYBY14().equals("P") || !dcPag.getE01PYBY14().equals("D")) out.println("selected"); %>></OPTION>
				<OPTION value="P" <% if (dcPag.getE01PYBY14().equals("P")) out.println("selected"); %>>Principal</OPTION>
				<OPTION value="D" <% if (dcPag.getE01PYBY14().equals("D")) out.println("selected"); %>>Payable to </OPTION>
			</SELECT></TD>
		</TR>
		<TR id="trclear">
			<TD nowrap width="30%"><DIV align="right">Gateway :</DIV>
			</TD>
			<TD nowrap width="20%"><INPUT type="text" name="E01DCMC02"	maxlength="13" size="14" value="<%= dcPag.getE01DCMC02().trim()%>">
			<SELECT name="E01PYBY02">
				<OPTION value=" " <% if (!dcPag.getE01PYBY02().equals("P") || !dcPag.getE01PYBY02().equals("D")) out.println("selected"); %>></OPTION>
				<OPTION value="P" <% if (dcPag.getE01PYBY02().equals("P")) out.println("selected"); %>>Principal</OPTION>
				<OPTION value="D" <% if (dcPag.getE01PYBY02().equals("D")) out.println("selected"); %>>Payable to</OPTION>
			</SELECT></TD>
			<TD nowrap width="30%">
			<DIV align="right">Interest :</DIV>
			</TD>
			<TD nowrap width="20%"><INPUT type="text" name="E01DCMC11" maxlength="13" size="14" value="<%= dcPag.getE01DCMC11().trim()%>">
			<SELECT name="E01PYBY11">
				<OPTION value=" " <% if (!dcPag.getE01PYBY11().equals("P") || !dcPag.getE01PYBY11().equals("D")) out.println("selected"); %>></OPTION>
				<OPTION value="P" <% if (dcPag.getE01PYBY11().equals("P")) out.println("selected"); %>>Principal</OPTION>
				<OPTION value="D" <% if (dcPag.getE01PYBY11().equals("D")) out.println("selected"); %>>Payable to</OPTION>
			</SELECT></TD>
		</TR>
		<TR id="trdark">
			<TD nowrap width="30%">
			<DIV align="right">Swift Remittance Advice:</DIV>
			</TD>
			<TD nowrap width="20%"><INPUT type="text" name="E01DCMC09" maxlength="13" size="14" value="<%= dcPag.getE01DCMC09().trim()%>">
			<SELECT name="E01PYBY09">
				<OPTION value=" " <% if (!dcPag.getE01PYBY09().equals("P") || !dcPag.getE01PYBY09().equals("D")) out.println("selected"); %>></OPTION>
				<OPTION value="P" <% if (dcPag.getE01PYBY09().equals("P")) out.println("selected"); %>>Principal</OPTION>
				<OPTION value="D" <% if (dcPag.getE01PYBY09().equals("D")) out.println("selected"); %>>Payable to</OPTION>
			</SELECT></TD>
			<TD nowrap width="30%">
			<DIV align="right">Amendment :</DIV>
			</TD>
			<TD nowrap width="20%"><INPUT type="text" name="E01DCMC10" maxlength="13" size="14" value="<%= dcPag.getE01DCMC10().trim()%>">
			<SELECT name="E01PYBY10">
				<OPTION value=" " <% if (!dcPag.getE01PYBY10().equals("P") || !dcPag.getE01PYBY10().equals("D")) out.println("selected"); %>></OPTION>
				<OPTION value="P" <% if (dcPag.getE01PYBY10().equals("P")) out.println("selected"); %>>Principal</OPTION>
				<OPTION value="D" <% if (dcPag.getE01PYBY10().equals("D")) out.println("selected"); %>>Payable to</OPTION>
			</SELECT></TD>
		</TR>
	</TBODY>
</TABLE>
			</TD>
		</TR>
	</TBODY>
</TABLE>

<DIV align="center">
	<H4 style="text-align:center">
		<INPUT type="checkbox" name="H01FLGWK2" value="A" <% if(dcPag.getH01FLGWK2().equals("A")){ out.print("checked");} %>>Accept with Warnings
	</H4>
	<INPUT id="EIBSBTN" type=submit name="Submit" value="Submit">
</DIV>

</form>
</body>
</html>