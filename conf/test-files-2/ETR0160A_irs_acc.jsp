<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Interest Rate Swap</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">



<jsp:useBean id="fra" class="datapro.eibs.beans.ETR0130DSMessage"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">
    builtNewMenu(irs_app_opt);
 </SCRIPT>


</head>
<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }
out.println("<SCRIPT> initMenu();  </SCRIPT>");
%> 
<h3 align="center"> Interest Rate Swap - Approval</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSETR0130" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="6">
  <table class="tableinfo" width="315">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right"><b>Counterparty :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="hidden" name="D01WFRCP1"  value="<%= fra.getD01WFRCP1()%>" readonly>
                <%= fra.getD01WFRCP1()%> </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right"><b>Location :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="hidden" name="D01WFRCP2"  value="<%= fra.getD01WFRCP2()%>" readonly>
                <%= fra.getD01WFRCP2()%> </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap >&nbsp;</td>
            <td nowrap colspan="3" > 
              <input type="hidden" name="D01WFRCP3"  value="<%= fra.getD01WFRCP3()%>" readonly>
              <%= fra.getD01WFRCP3()%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right"><b>Account Number :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <input type="hidden" name="E01WFRACC"  value="<%= fra.getE01WFRACC()%>" readonly>
              <%= fra.getE01WFRACC()%></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

 <H4>Basic Information</H4>
		<TABLE cellpadding="2" cellspacing="0" width="100%" border="0">

			<TBODY>
				<TR id="trclear">
					<TD nowrap></TD>
					<TD nowrap></TD>
					<TD nowrap>
					<DIV align="right">Contract Type :</DIV>
					</TD>
					<TD nowrap colspan="2"><% if(fra.getE01WFRSBT().equals("SH")) out.print("Shortcut");
						else if(fra.getE01WFRSBT().equals("FV")) out.print("Fair Value");%>
					</TD>
				</TR>
				<TR id="trclear">
					<TD nowrap>
					<DIV align="right">Currency :</DIV>
					</TD>
					<TD nowrap><%= fra.getE01WFRCCY().trim()%></TD>
					<TD nowrap>
					<DIV align="right">Reference Number :</DIV>
					</TD>
					<TD nowrap colspan="2">&nbsp;<%= fra.getE01WFRREF().trim()%></TD>
				</TR>
				<TR id="trclear">
					<TD nowrap>
					<DIV align="right">Notional Amount :</DIV>
					</TD>
					<TD nowrap><%= Util.fcolorCCY(fra.getE01WFROAM())%></TD>
					<TD nowrap>
					<DIV align="right">
					<DIV align="right">Trade Date :</DIV>
					</DIV>
					</TD>
					<TD nowrap colspan="2"><%= Util.formatDate(fra.getE01WFRDD1(),fra.getE01WFRDD2(),fra.getE01WFRDD3())%></TD>
				</TR>
				<TR id="trclear">
					<TD nowrap>
					<DIV align="right">Line of Credit :</DIV>
					</TD>
					<TD nowrap><%= fra.getE01WFRLCU().trim()%> / <%= fra.getE01WFRCMM()%></TD>
					<TD nowrap align="right">Value Date :</TD>
					<TD nowrap colspan="2"><%= Util.formatDate(fra.getE01WFRVD1(),fra.getE01WFRVD2(),fra.getE01WFRVD3())%>
					</TD>
				</TR>
				<TR id="trclear">
					<TD nowrap>
					<DIV align="right">Hedge :</DIV>
					</TD>
					<TD nowrap><%= fra.getE01WFRHEM().trim()%></TD>
					<TD nowrap>
					<DIV align="right">Maturity Date :</DIV>
					</TD>
					<TD nowrap colspan="2"><%= Util.formatDate(fra.getE01WFRMA1(),fra.getE01WFRMA2(),fra.getE01WFRMA3())%>
					</TD>
				</TR>
				<TR>
					<TD nowrap></TD>
					<TD nowrap></TD>
					<TD nowrap></TD>
					<TD nowrap colspan="2"></TD>
				</TR>
				<TR>
					<TD nowrap colspan="2" align="center"><B>ASSET SIDE</B></TD>
					<TD nowrap colspan="3" align="center"><B>LIABILITY SIDE</B></TD>
				</TR>
				<TR>
					<TD nowrap>
					<DIV align="right">Asset Side :</DIV>
					</TD>
					<TD nowrap><%= fra.getE01WFRITP().trim()%></TD>
					<TD nowrap>
					<DIV align="right">Asset Side :</DIV>
					</TD>
					<TD nowrap colspan="2"><%= fra.getE01WFRITP1().trim()%></TD>
				</TR>
				<TR>
					<TD nowrap>
					<DIV align="right">Interest Rate :</DIV>
					</TD>
					<TD nowrap><%= fra.getE01WFRRTE().trim()%></TD>
					<TD nowrap>
					<DIV align="right">Interest Rate :</DIV>
					</TD>
					<TD nowrap colspan="2"><%= fra.getE01WFRRTE1().trim()%></TD>
				</TR>
				<TR>
					<TD nowrap align="right">Floating Rate :</TD>
					<TD nowrap><%= fra.getE01WFRFTB().trim()%> . <% if (fra.getE01WFRFTY().equals("FP")) out.print("Primary"); 
                else if (fra.getE01WFRFTY().equals("FS")) out.print("Secondary"); %></TD>
					<TD nowrap align="right">Floating Rate :</TD>
					<TD nowrap colspan="2"><%= fra.getE01WFRFTB1().trim()%> .<% if (fra.getE01WFRFTY1().equals("FP")) out.print("Primary"); 
                else if (fra.getE01WFRFTY1().equals("FS")) out.print("Secondary"); %></TD>
				</TR>
				<TR>
					<TD nowrap align="right">Coupon Period :</TD>
					<TD nowrap><%= fra.getE01WFRROY().trim()%><%= fra.getE01WFRODA().trim()%></TD>
					<TD nowrap align="right">Coupon Period :</TD>
					<TD nowrap colspan="2"><%= fra.getE01WFRROY1().trim()%><%= fra.getE01WFRODA1().trim()%></TD>
				</TR>
				<TR>
					<TD nowrap align="right">Accrual Type Basis :</TD>
					<TD nowrap><% if(fra.getE01WFRICT().equals("1")) out.print("Actual/actual");
						else if(fra.getE01WFRICT().equals("2")) out.print("Actual/365");
						 else if(fra.getE01WFRICT().equals("3")) out.print("Actual/365 (366 in leap year)");
                           else if(fra.getE01WFRICT().equals("4")) out.print("Actual/360");
                            else if(fra.getE01WFRICT().equals("5")) out.print("30/360");
                             else if(fra.getE01WFRICT().equals("6")) out.print("30E/360");				      
					%></TD>
					<TD nowrap align="right">Accrual Type Basis :</TD>
					<TD nowrap colspan="2"><% if(fra.getE01WFRICT1().equals("1")) out.print("Actual/actual");
						else if(fra.getE01WFRICT1().equals("2")) out.print("Actual/365");
						 else if(fra.getE01WFRICT1().equals("3")) out.print("Actual/365(366 in leap year)");
                           else if(fra.getE01WFRICT1().equals("4")) out.print("Actual/360");
                            else if(fra.getE01WFRICT1().equals("5")) out.print("30/360");
                             else if(fra.getE01WFRICT1().equals("6")) out.print("30E/360");				      
					%></TD>
				</TR>
				<TR>
					<TD nowrap></TD>
					<TD nowrap></TD>
					<TD nowrap></TD>
					<TD nowrap colspan="2"></TD>
				</TR>
				<TR id="trclear">
					<TD nowrap>
					<DIV align="right">Notes :</DIV>
					</TD>
					<TD nowrap colspan="4"><%= fra.getE01WFROT1().trim()%></TD>
				</TR>
				<TR id="trclear">
					<TD nowrap>
					<DIV align="right"></DIV>
					</TD>
					<TD nowrap colspan="4"><%= fra.getE01WFROT2().trim()%></TD>
				</TR>
				<TR id="trclear">
					<TD nowrap>
					<DIV align="right">By :</DIV>
					</TD>
					<TD nowrap colspan="3"><%= fra.getH01USERID().trim()%> - <%= fra.getD01USRDSC()%></TD>
					<TD nowrap><INPUT type="radio" disabled name="CE01WFRIBF" value="Y"
						onclick="document.forms[0].E01WFRIBF.value='Y'"
						<%if(fra.getE01WFRIBF().equals("Y")) out.print("checked");%>> IBF
					<INPUT type="radio" disabled name="CE01WFRIBF" value="N"
						onclick="document.forms[0].E01WFRIBF.value='N'"
						<%if(!fra.getE01WFRIBF().equals("Y")) out.print("checked");%>> NON
					IBF</TD>
				</TR>
			</TBODY>
		</TABLE>

		<H4>Additional Information</H4>
		<TABLE class="tableinfo">
			<TBODY>
				<TR>
					<TD nowrap>
					<TABLE cellpadding="2" cellspacing="0" width="100%" border="0">
						<TBODY>
							<TR id="trclear">
								<TD nowrap>
								<DIV align="right">Product Asset Side :</DIV>
								</TD>
								<TD nowrap><%= fra.getE01WFRPRO()%> - <%= fra.getD01APCDSC()%></TD>
								<TD nowrap align="right">&nbsp;Product Liability Side :</TD>
								<TD nowrap colspan="2">&nbsp;<%= fra.getE01WFRPRO1()%> - <%= fra.getD01APCDSC1()%></TD>
							</TR>
							<TR id="trclear">
								<TD nowrap>
								<DIV align="right">Payment Via :</DIV>
								</TD>
								<TD nowrap><% if(fra.getE01WFRPVI().equals("F")) out.print("Payment Via Fed");
				 else if(fra.getE01WFRPVI().equals("1")) out.print("Payment Via Swift MT-103");
				 else if(fra.getE01WFRPVI().equals("2")) out.print("Payment Via Swift MT - 200");
				 else if(fra.getE01WFRPVI().equals("3")) out.print("Payment Via Swift MT- 202");
				 else if(fra.getE01WFRPVI().equals("T")) out.print("Payment Via Telex");
				 else out.print("None");%></TD>
								<TD nowrap>
								<DIV align="right">Confirmation Type :</DIV>
								</TD>
								<TD nowrap colspan="2"><% if(fra.getE01WFRCFT().equals("P")) out.print("Print Notification");
				 else if(fra.getE01WFRCFT().equals("S")) out.print("Send Notification Via Swift");
				 else if(fra.getE01WFRCFT().equals("H")) out.print("Send Notification Via Chip");
				 else if(fra.getE01WFRCFT().equals("T")) out.print("Send Notification Via Telex");
				 else if(fra.getE01WFRCFT().equals("F")) out.print("Send Notification Via Fax");
				 else out.print("No Notification");%></TD>
							</TR>
						</TBODY>
					</TABLE>
					</TD>
				</TR>
			</TBODY>
		</TABLE>

		<H4>Offset Account Asset Side</H4>
		<TABLE class="tableinfo">
			<TBODY>
				<TR id="trdark">
					<TD nowrap width="32%">
					<DIV align="center">Concept</DIV>
					</TD>
					<TD nowrap width="14%">
					<DIV align="center">Bank</DIV>
					</TD>
					<TD nowrap width="17%">
					<DIV align="center">Branch</DIV>
					</TD>
					<TD nowrap width="22%">
					<DIV align="center">Currency</DIV>
					</TD>
					<TD nowrap width="15%">
					<DIV align="center">Reference</DIV>
					</TD>
				</TR>
				<TR id="trclear">
					<TD nowrap width="32%">
					<DIV align="center"><%= fra.getE01OFFOP1().trim()%> <%= fra.getE01OFFCO1().trim()%></DIV>
					</TD>
					<TD nowrap width="14%">
					<DIV align="center"><%= fra.getE01OFFBK1().trim()%></DIV>
					</TD>
					<TD nowrap width="17%">
					<DIV align="center"><%= fra.getE01OFFBR1().trim()%></DIV>
					</TD>
					<TD nowrap width="22%">
					<DIV align="center"><%= fra.getE01OFFCY1().trim()%></DIV>
					</TD>
					<TD nowrap width="15%">
					<DIV align="center"><%= fra.getE01OFFAC1().trim()%></DIV>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
<H4>Offset Account Liability Side</H4>
<TABLE class="tableinfo">
	<TBODY>
		<TR id="trdark">
			<TD nowrap width="32%">
			<DIV align="center">Concept</DIV>
			</TD>
			<TD nowrap width="14%">
			<DIV align="center">Bank</DIV>
			</TD>
			<TD nowrap width="17%">
			<DIV align="center">Branch</DIV>
			</TD>
			<TD nowrap width="22%">
			<DIV align="center">Currency</DIV>
			</TD>
			<TD nowrap width="15%">
			<DIV align="center">Reference</DIV>
			</TD>
		</TR>
		<TR id="trclear">
			<TD nowrap width="32%">
			<DIV align="center"><%= fra.getE01OFFOP2().trim()%> <%= fra.getE01OFFCO2().trim()%></DIV>
			</TD>
			<TD nowrap width="14%">
			<DIV align="center"><%= fra.getE01OFFBK2().trim()%></DIV>
			</TD>
			<TD nowrap width="17%">
			<DIV align="center"><%= fra.getE01OFFBR2().trim()%></DIV>
			</TD>
			<TD nowrap width="22%">
			<DIV align="center"><%= fra.getE01OFFCY2().trim()%></DIV>
			</TD>
			<TD nowrap width="15%">
			<DIV align="center"><%= fra.getE01OFFAC2().trim()%></DIV>
			</TD>
		</TR>
	</TBODY>
</TABLE>
<H4>Repayment Account</H4>
		<TABLE class="tableinfo">
			<TBODY>
				<TR id="trdark">
					<TD nowrap width="32%">
					<DIV align="center">Concept</DIV>
					</TD>
					<TD nowrap width="14%">
					<DIV align="center">Bank</DIV>
					</TD>
					<TD nowrap width="17%">
					<DIV align="center">Branch</DIV>
					</TD>
					<TD nowrap width="22%">
					<DIV align="center">Currency</DIV>
					</TD>
					<TD nowrap width="15%">
					<DIV align="center">Reference</DIV>
					</TD>
				</TR>
				<TR id="trclear">
					<TD nowrap width="32%">
					<DIV align="center"><%= fra.getE01REPOPE().trim()%> <%= fra.getE01REPCON().trim()%></DIV>
					</TD>
					<TD nowrap width="14%">
					<DIV align="center"><%= fra.getE01REPBNK().trim()%></DIV>
					</TD>
					<TD nowrap width="17%">
					<DIV align="center"><%= fra.getE01REPBRN().trim()%></DIV>
					</TD>
					<TD nowrap width="22%">
					<DIV align="center"><%= fra.getE01REPCCY().trim()%></DIV>
					</TD>
					<TD nowrap width="15%">
					<DIV align="center"><%= fra.getE01REPACC().trim()%></DIV>
					</TD>
				</TR>
			</TBODY>
		</TABLE>

  <h4 align="left">Limits</h4>
  <table  class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap  colspan="2"> 
              <h5 align="center">&nbsp;</h5>
            </td>
            <td nowrap width="21%"> 
              <h5 align="center">Limit Amount</h5>
            </td>
            <td nowrap width="23%"> 
              <h5 align="center"><b>Available Limit</b> </h5>
            </td>
            <td nowrap width="34%"> 
              <h5 align="center">Ending Limit Amount</h5>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap  colspan="2"> 
              <div align="right">Line of Credit :</div>
            </td>
            <td nowrap width="21%" > 
              <div align="center"><%= fra.getD01LIMAMT()%></div>
            </td>
            <td nowrap width="23%" > 
              <div align="center"><%= fra.getD01LIMAVL()%></div>
            </td>
            <td nowrap width="34%" > 
              <div align="center"><%= fra.getD01LIMEND()%></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
</form>
</body>
</html>
