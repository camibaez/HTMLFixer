<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Confirmation </title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">

<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id="fra" class="datapro.eibs.beans.ETR0120DSMessage"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />


</head>

<body>
<h3 align="center">Interest Rate SWAP - Confirmation Ticket</h3>
<hr size="4">
<form>
<table class="tableinfo" width="314">
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
      </table>
    </td>
  </tr>
</table>
<br><table  class="tableinfo">
  <tr > 
    <td nowrap> 
        <TABLE cellpadding="2" cellspacing="0" width="100%" border="0">
          <TBODY><TR id="trclear">
            <TD nowrap>
              <DIV align="right">Date :</DIV>
            </TD>
            <TD nowrap>
              <DIV align="left"><%= Util.formatDate(fra.getE01WFRVD1(),fra.getE01WFRVD2(),fra.getE01WFRVD3())%></DIV>
            </TD>
            <TD nowrap>
              <DIV align="right">Time :</DIV>
            </TD>
            <TD nowrap colspan="2">
              <DIV align="left"><%= userPO.getHeader8()%></DIV>
            </TD>
          </TR>
          <TR id="trclear"> 
            <TD nowrap><DIV align="right"></DIV>
            </TD>
            <TD nowrap></TD>
            <TD nowrap> 
              <DIV align="right">Contract Type :</DIV>
            </TD>
            <TD nowrap colspan="2">
              <% if(fra.getE01WFRSBT().equals("SH")) out.print("Shortcut");
						else if(fra.getE01WFRSBT().equals("FV")) out.print("Fair Value");%>
            </TD>
          </TR>
          <TR id="trclear"> 
            <TD nowrap> 
              <DIV align="right">Currency :</DIV>
            </TD>
            <TD nowrap><%= fra.getE01WFRCCY().trim()%></TD>
            <TD nowrap><DIV align="right">Reference Number :</DIV>
            </TD>
            <TD nowrap colspan="2">&nbsp;<%= fra.getE01WFRREF().trim()%></TD>
          </TR>
          <TR id="trclear"> 
            <TD nowrap> 
              <DIV align="right">Notional Amount :</DIV>
            </TD>
            <TD nowrap><%= Util.fcolorCCY(fra.getE01WFROAM())%> </TD>
            <TD nowrap><DIV align="right">
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
            <TD nowrap colspan="2"> <%= Util.formatDate(fra.getE01WFRMA1(),fra.getE01WFRMA2(),fra.getE01WFRMA3())%> 
            </TD>
          </TR>
			<TR>
				<TD nowrap></TD>
				<TD nowrap></TD>
				<TD nowrap></TD>
				<TD nowrap colspan="2"></TD>
			</TR>
			<TR>
				<TD nowrap colspan="2" align="center"><b>ASSET SIDE</b></TD><TD nowrap colspan="3" align="center"><b>LIABILITY SIDE</b></TD>
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
				<TD nowrap><%= fra.getE01WFRFTB().trim()%><% if (fra.getE01WFRFTY().equals("FP")) out.print("Primary"); 
                else if (fra.getE01WFRFTY().equals("FS")) out.print("Secondary"); %></TD>
				<TD nowrap align="right">Floating Rate :</TD>
				<TD nowrap colspan="2"><%= fra.getE01WFRFTB1().trim()%><% if (fra.getE01WFRFTY1().equals("FP")) out.print("Primary"); 
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
				<TD nowrap>
				    <% if(fra.getE01WFRICT().equals("1")) out.print("Actual/actual");
						else if(fra.getE01WFRICT().equals("2")) out.print("Actual/365");
						 else if(fra.getE01WFRICT().equals("3")) out.print("Actual/365 (366 in leap year)");
                           else if(fra.getE01WFRICT().equals("4")) out.print("Actual/360");
                            else if(fra.getE01WFRICT().equals("5")) out.print("30/360");
                             else if(fra.getE01WFRICT().equals("6")) out.print("30E/360");				      
					%>
				</TD>
				<TD nowrap align="right">Accrual Type Basis :</TD>
				<TD nowrap colspan="2">
				    <% if(fra.getE01WFRICT1().equals("1")) out.print("Actual/actual");
						else if(fra.getE01WFRICT1().equals("2")) out.print("Actual/365");
						 else if(fra.getE01WFRICT1().equals("3")) out.print("Actual/365(366 in leap year)");
                           else if(fra.getE01WFRICT1().equals("4")) out.print("Actual/360");
                            else if(fra.getE01WFRICT1().equals("5")) out.print("30/360");
                             else if(fra.getE01WFRICT1().equals("6")) out.print("30E/360");				      
					%>
				</TD>
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
						<%if(fra.getE01WFRIBF().equals("Y")) out.print("checked");%>>
              IBF 
              <INPUT type="radio" disabled name="CE01WFRIBF" value="N"
						onclick="document.forms[0].E01WFRIBF.value='N'"
						<%if(!fra.getE01WFRIBF().equals("Y")) out.print("checked");%>>
              NON IBF</TD>
				</TR>
        </TBODY></TABLE>
    </td>
  </tr>
</table>
  <br>
  <table  class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table width="100%">
          <tr id="trdark"> 
            <td nowrap  colspan="2"> 
              <div align="center"><b></b></div>
            </td>
            <td nowrap > 
              <div align="center"><b>Limit Amount </b></div>
            </td>
            <td nowrap > 
              <div align="center"><b>Available Limit </b></div>
            </td>
            <td nowrap > 
              <div align="center"><b>Ending Limit Amount </b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap  colspan="2"> 
              <div align="right"><b>Line of Credit</b></div>
            </td>
            <td nowrap > 
              <div align="center"><%= Util.fcolorCCY(fra.getD01LIMAMT())%></div>
            </td>
            <td nowrap > 
              <div align="center"><%= Util.fcolorCCY(fra.getD01LIMAVL())%></div>
            </td>
            <td nowrap > 
              <div align="center"><%= Util.fcolorCCY(fra.getD01LIMEND())%></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
<SCRIPT Language="javascript">
  eIBSPrint();
</SCRIPT>
</body>
</html>
