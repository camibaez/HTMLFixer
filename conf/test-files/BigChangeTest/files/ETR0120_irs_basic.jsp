<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Interest Rate Swap</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">



<jsp:useBean id="fra" class="datapro.eibs.beans.ETR0120DSMessage"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

</head>
<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%> 
<h3 align="center"> Interest Rate Swap - Dealer Slip<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="irs_basic.jsp,ETR0120"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSETR0120" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <table class="tableinfo" width="313">
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
                <%= fra.getD01WFRCP2()%>  </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap >
              <input type="hidden" name="E01WFRCMM"  value="<%= fra.getE01WFRCMM()%>" readonly>
            </td>
            <td nowrap colspan="3" > 
              
              <input type="hidden" name="D01WFRCP3"  value="<%= fra.getD01WFRCP3()%>" readonly>
              <%= fra.getD01WFRCP3()%> </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <DIV align="left"><TABLE class="tableinfo" width="100%">
    <TBODY><TR> 
      <TD nowrap width="100%" height="215">
		<TABLE cellpadding="2" cellspacing="0" border="0" width="100%">
			<TBODY><TR id="trdark">
				<TD nowrap width="15%">
				<DIV align="right">Broker :</DIV>
				</TD>
				<TD nowrap width="35%">
				    <INPUT type="text" name="E01WRFBRK" size="4" maxlength="3" value="<%= fra.getE01WFRBRK()%>">
				    <INPUT type="text" name="D01FEBNM1" size="15" maxlength="15" value="<%= fra.getD01FEBNM1()%>">
				     <A href="javascript:GetBrokerT('E01WRFBRK','D01FEBNM1')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0"></A></TD>
				<TD nowrap width="15%">
				<DIV align="right"><INPUT type="hidden" name="E01WFRHEF" value="<%= fra.getE01WFRHEF()%>"> <INPUT type="hidden" name="E01WFRSBT" value="<%= fra.getE01WFRSBT()%>"></DIV>
				</TD>
				<TD nowrap width="35%"></TD>
			</TR>
			<TR id="trclear">
				<TD nowrap height="37" width="15%">
				<DIV align="right"></DIV>
				</TD>
				<TD nowrap height="37" width="35%"></TD>
				<TD nowrap height="37" width="15%">
				<DIV align="right">Hedge Deal :</DIV>
				</TD>
				<TD nowrap height="37" width="35%">
				    <INPUT type="text" name="E01WFRHEM" size="12" maxlength="9" onkeypress="enterInteger()" value="<%= fra.getE01WFRHEM() %>">
                    <A href="javascript:GetAccount('E01WFRHEM','','IN','')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0"></A><A href="javascript:GetBrokerT('E01WFRBRK','D01FEBNM1')"></A></TD>
			</TR>
			<TR id="trdark">
				<TD nowrap height="43" width="15%">
				<DIV align="right">Contract Type :</DIV>
				</TD>
				<TD nowrap height="43" width="35%"><INPUT type="radio" name="CE01WFRSBT" value="" onclick="document.forms[0].E01WFRSBT.value='SH'" <%if(fra.getE01WFRSBT().equals("SH")) out.print("checked");%>>Shortcut
				<INPUT type="radio" name="CE01WFRSBT" value="" onclick="document.forms[0].E01WFRSBT.value='FV'" <%if(fra.getE01WFRSBT().equals("FV")) out.print("checked");%>> Fair
				Value</TD>
				<TD nowrap height="43" width="15%">
				<DIV align="right">Trade Date :</DIV>
				</TD>
				<TD nowrap height="43" width="35%"><INPUT type="text" name="E01WFRDD1" size="3" maxlength="2" value="<%= fra.getE01WFRDD1().trim()%>"> <INPUT type="text" name="E01WFRDD2" size="3" maxlength="2" value="<%= fra.getE01WFRDD2().trim()%>"> <INPUT type="text" name="E01WFRDD3" size="3" maxlength="2" value="<%= fra.getE01WFRDD3().trim()%>"> <A href="javascript:DatePicker(document.forms[0].E01WFRDD1,document.forms[0].E01WFRDD2,document.forms[0].E01WFRDD3)"><IMG src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></A><IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"></TD>
			</TR>
			<TR id="trclear">
				<TD nowrap width="15%">
				<DIV align="right">
				<DIV align="right">Currency :</DIV>
				</DIV>
				</TD>
				<TD nowrap width="35%"><INPUT type="text" name="E01WFRCCY" size="4" maxlength="3" value="<%= fra.getE01WFRCCY().trim()%>"> <A href="javascript:GetCurrency('E01WFRCCY','')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0"></A> <IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"></TD>
				<TD nowrap width="15%">
				<DIV align="right">Value Date :</DIV>
				</TD>
				<TD nowrap width="35%"><INPUT type="text" name="E01WFRVD1" size="3" maxlength="2" value="<%= fra.getE01WFRVD1().trim()%>"> <INPUT type="text" name="E01WFRVD2" size="3" maxlength="2" value="<%= fra.getE01WFRVD2().trim()%>"> <INPUT type="text" name="E01WFRVD3" size="3" maxlength="2" value="<%= fra.getE01WFRVD3().trim()%>"> <A href="javascript:DatePicker(document.forms[0].E01WFRVD1,document.forms[0].E01WFRVD2,document.forms[0].E01WFRVD3)"><IMG src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></A><IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"></TD>
			</TR>
			<TR id="trdark">
				<TD nowrap width="15%">
				<DIV align="right">Notional Amount :</DIV>
				</TD>
				<TD nowrap width="35%"><INPUT type="text" name="E01WFROAM" size="15" maxlength="13" value="<%= fra.getE01WFROAM()%>" onkeypress="enterDecimal()"> <IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"></TD>
				<TD nowrap width="15%">
				<DIV align="right">Maturity Date :</DIV>
				</TD>
				<TD nowrap width="35%"><INPUT type="text" name="E01WFRMA1" size="3" maxlength="2" value="<%= fra.getE01WFRMA1().trim()%>"> <INPUT type="text" name="E01WFRMA2" size="3" maxlength="2" value="<%= fra.getE01WFRMA2().trim()%>"> <INPUT type="text" name="E01WFRMA3" size="3" maxlength="2" value="<%= fra.getE01WFRMA3().trim()%>"> <A href="javascript:DatePicker(document.forms[0].E01WFRMA1,document.forms[0].E01WFRMA2,document.forms[0].E01WFRMA3)"><IMG src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></A><IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"></TD>
			</TR>
			<TR></TR>
		</TBODY></TABLE></TD></TR></TBODY></TABLE></DIV>
		<br>
	
	<DIV align="left"><TABLE class="tableinfo" width="100%">
    <TBODY><TR> 
      <TD nowrap width="100%">
	<TABLE width="100%" cellpadding="2">
	<TBODY>
		<TR id="trclear">
			<TD align="right" width="16%"></TD>
			<TD align="center" width="42%">ASSET SIDE</TD>
			<TD align="center" width="42%">LIABILITY SIDE</TD></TR>
		<TR id="trdark">
			<TD align="right" width="16%">Side type :</TD><TD width="42%"><SELECT name="E01WFRITP">
				<OPTION value=" "
					<% if (!(fra.getE01WFRITP().equals("FIXED") ||fra.getE01WFRITP().equals("FLOAT"))) out.print("selected"); %>></OPTION>
				<OPTION value="FIXED"
					<% if (fra.getE01WFRITP().equals("FIXED")) out.print("selected"); %>>Fixed</OPTION>
				<OPTION value="FLOAT"
					<% if (fra.getE01WFRITP().equals("FLOAT")) out.print("selected"); %>>Floating</OPTION>
			</SELECT><IMG src="<%=request.getContextPath()%>/images/Check.gif"
							alt="mandatory field" align="bottom" border="0"></TD>
			<TD width="42%"><SELECT name="E01WFRITP1">
				<OPTION value=" "
					<% if (!(fra.getE01WFRITP1().equals("FIXED") ||fra.getE01WFRITP1().equals("FLOAT"))) out.print("selected"); %>></OPTION>
				<OPTION value="FIXED"
					<% if (fra.getE01WFRITP1().equals("FIXED")) out.print("selected"); %>>Fixed</OPTION>
				<OPTION value="FLOAT"
					<% if (fra.getE01WFRITP1().equals("FLOAT")) out.print("selected"); %>>Floating</OPTION>
			</SELECT><IMG src="<%=request.getContextPath()%>/images/Check.gif"
							alt="mandatory field" align="bottom" border="0"></TD>
		</TR>
		<TR id="trclear">
			<TD align="right" width="16%">Interest Rate :</TD><TD width="42%"><INPUT type="text" name="E01WFRRTE" size="10"
				maxlength="9" value="<%= fra.getE01WFRRTE().trim()%>"></TD>
			<TD width="42%"><INPUT type="text" name="E01WFRRTE1" size="10"
				maxlength="9" value="<%= fra.getE01WFRRTE1().trim()%>"></TD>
		</TR>
		<TR id="trdark">
			<TD align="right" width="16%">Floating Rate :</TD><TD width="42%"><INPUT type="text" name="E01WFRFTB" size="2"
				maxlength="2" value="<%= fra.getE01WFRFTB().trim()%>">
              <A href="javascript:GetFloating('E01WFRFTB')"><IMG
				src="<%=request.getContextPath()%>/images/1b.gif" alt="help"
				align="middle" border="0"></A> 
              <SELECT name="E01WFRFTY">
				<OPTION value=" "
					<% if (!(fra.getE01WFRFTY().equals("FP") ||fra.getE01WFRFTY().equals("FS"))) out.print("selected"); %>></OPTION>
				<OPTION value="FP"
					<% if (fra.getE01WFRFTY().equals("FP")) out.print("selected"); %>>Primary</OPTION>
				<OPTION value="FS"
					<% if (fra.getE01WFRFTY().equals("FS")) out.print("selected"); %>>Secondary</OPTION>
			</SELECT></TD>
			<TD width="42%"><INPUT type="text" name="E01WFRFTB1" size="2"
				maxlength="2" value="<%= fra.getE01WFRFTB1().trim()%>">
              <A href="javascript:GetFloating('E01WFRFTB1')"><IMG
				src="<%=request.getContextPath()%>/images/1b.gif" alt="help"
				align="middle" border="0"></A> 
              <SELECT name="E01WFRFTY1">
				<OPTION value=" "
					<% if (!(fra.getE01WFRFTY1().equals("FP") ||fra.getE01WFRFTY1().equals("FS"))) out.print("selected"); %>></OPTION>
				<OPTION value="FP"
		 			<% if (fra.getE01WFRFTY1().equals("FP")) out.print("selected"); %>>Primary</OPTION>
				<OPTION value="FS"
					<% if (fra.getE01WFRFTY1().equals("FS")) out.print("selected"); %>>Secondary</OPTION>
			</SELECT></TD>
		</TR>
		<TR id="trclear">
		     
			<TD align="right" width="16%">Coupon Payment Period :</td>
			<td align="left" width="42%"><INPUT type="text" name="E01WFRROY" size="5" maxlength="4"
							value="<%= fra.getE01WFRROY().trim()%>">			
			<select name="E01WFRODA">
			    <option value="P" <% if(fra.getE01WFRODA().equals("P")) out.print("selected");%>>Months(Not Include Last Day)</option>
                <option value="I" <% if(fra.getE01WFRODA().equals("I")) out.print("selected");%>>Months(Includes Last Day)</option>
                <option value="D" <% if(fra.getE01WFRODA().equals("D")) out.print("selected");%>>Days(End of Month)</option>
                <option value="M" <% if(fra.getE01WFRODA().equals("M")) out.print("selected");%>>Day of Month</option>
            </select>						
		    </td>
			<TD align="left" width="42%"><INPUT type="text" name="E01WFRROY1" size="5"
							maxlength="4" value="<%= fra.getE01WFRROY1().trim()%>">
			<select name="E01WFRODA1">
                <option value="P" <% if(fra.getE01WFRODA1().equals("P")) out.print("selected");%>>Months(Not Include Last Day)</option>
                <option value="I" <% if(fra.getE01WFRODA1().equals("I")) out.print("selected");%>>Months(Includes Last Day)</option>
                <option value="D" <% if(fra.getE01WFRODA1().equals("D")) out.print("selected");%>>Days(End of Month)</option>
                <option value="M" <% if(fra.getE01WFRODA1().equals("M")) out.print("selected");%>>Day of Month</option>
            </select>					
            </td>
		</TR>
		<TR id="trdark">
			<TD width="16%" align="right">Accrual Type Basis :</TD><TD width="42%"><SELECT
							name="E01WFRICT">
							<OPTION value=""
								<%if (fra.getE01WFRICT().equals("")) { out.print("selected"); }%>></OPTION>
							<OPTION value="1"
			 					<%if (fra.getE01WFRICT().equals("1")) { out.print("selected"); }%>>Actual/actual
							(in period)</OPTION>
							<OPTION value="2"
								<%if (fra.getE01WFRICT().equals("2")) { out.print("selected"); }%>>Actual/365</OPTION>
							<OPTION value="3"
								<%if (fra.getE01WFRICT().equals("3")) { out.print("selected"); }%>>Actual/365
							(366 in leap year)</OPTION>
							<OPTION value="4"
								<%if (fra.getE01WFRICT().equals("4")) { out.print("selected"); }%>>Actual/360</OPTION>
							<OPTION value="5"
								<%if (fra.getE01WFRICT().equals("5")) { out.print("selected"); }%>>30/360</OPTION>
							<OPTION value="6"
								<%if (fra.getE01WFRICT().equals("6")) { out.print("selected"); }%>>30E/360</OPTION>
						</SELECT></TD>
			<TD width="42%"><SELECT name="E01WFRICT1">
							<OPTION value=""
								<%if (fra.getE01WFRICT().equals("")) { out.print("selected"); }%>></OPTION>
							<OPTION value="1"
								<%if (fra.getE01WFRICT().equals("1")) { out.print("selected"); }%>>Actual/actual
							(in period)</OPTION>
							<OPTION value="2"
								<%if (fra.getE01WFRICT().equals("2")) { out.print("selected"); }%>>Actual/365</OPTION>
							<OPTION value="3"
								<%if (fra.getE01WFRICT().equals("3")) { out.print("selected"); }%>>Actual/365
							(366 in leap year)</OPTION>
							<OPTION value="4"
								<%if (fra.getE01WFRICT().equals("4")) { out.print("selected"); }%>>Actual/360</OPTION>
							<OPTION value="5"
								<%if (fra.getE01WFRICT().equals("5")) { out.print("selected"); }%>>30/360</OPTION>
							<OPTION value="6"
								<%if (fra.getE01WFRICT().equals("6")) { out.print("selected"); }%>>30E/360</OPTION>
						</SELECT></TD>
		</TR>
		<TR id="trclear">
			<TD width="16%"></TD><TD width="42%"></TD>
			<TD width="42%"></TD>
		</TR>

	</TBODY>
</TABLE>
</TD></TR></TBODY></TABLE></DIV>
<br>

<DIV align="left">
<TABLE class="tableinfo" width="100%">
	<TBODY>
		<TR>
			<TD nowrap width="100%">
			<DIV align="left">
			<TABLE width="100%">
				<TBODY>
					<TR id="trdark">
						<TD nowrap width="15%">
						<DIV align="right">Notes :</DIV>
						</TD>
						<TD nowrap colspan="3" width="65%"><INPUT type="text" name="E01WFROT1" size="70" maxlength="60" value="<%= fra.getE01WFROT1().trim()%>"></TD>
						<TD nowrap width="20%"></TD>
					</TR>
					<TR id="trclear">
						<TD nowrap width="15%">
						<DIV align="right"></DIV>
						</TD>
						<TD nowrap colspan="3" width="65%"><INPUT type="text" name="E01WFROT2" size="70" maxlength="60" value="<%= fra.getE01WFROT2().trim()%>"></TD>
						<TD nowrap width="20%"></TD>
					</TR>
					<TR id="trdark">
						<TD nowrap width="15%">
						<DIV align="right">By :</DIV>
						</TD>
						<TD nowrap colspan="3" width="65%"><%= fra.getH01USERID().trim()%>
						- <%= fra.getD01USRDSC()%></TD>
						<TD nowrap width="20%"><INPUT type="radio" name="CE01WFRIBF" value="Y" onclick="document.forms[0].E01WFRIBF.value='Y'" <%if(fra.getE01WFRIBF().equals("Y")) out.print("checked");%>> IBF
						<INPUT type="radio" name="CE01WFRIBF" value="N" onclick="document.forms[0].E01WFRIBF.value='N'" <%if(!fra.getE01WFRIBF().equals("Y")) out.print("checked");%> checked> NON IBF</TD>
					</TR>
				</TBODY>
			</TABLE>
			</DIV>
			</TD>
		</TR>
	</TBODY>
</TABLE>
</DIV>
<BR>


<TABLE class="tableinfo" width="100%">
	<TBODY>
		<TR>
			<TD nowrap>
			<TABLE width="100%">
				<TBODY>
					<TR id="trdark">
						<TD nowrap colspan="2" width="25%">
						<DIV align="center"><B></B></DIV>
						</TD>
						<TD nowrap width="25%">
						<DIV align="center"><B>Limit Amount </B></DIV>
						</TD>
						<TD nowrap width="25%">
						<DIV align="center"><B>Available Limit </B></DIV>
						</TD>
						<TD nowrap width="25%">
						<DIV align="center"><B>Ending Limit Amount </B></DIV>
						</TD>
					</TR>
					<TR id="trclear">
						<TD nowrap colspan="2" width="25%">
						<DIV align="right"><B>Line of Credit</B></DIV>
						</TD>
						<TD nowrap width="25%">
						<DIV align="center"><%= Util.fcolorCCY(fra.getD01LIMAMT())%></DIV>
						</TD>
						<TD nowrap width="25%">
						<DIV align="center"><%= Util.fcolorCCY(fra.getD01LIMAVL())%></DIV>
						</TD>
						<TD nowrap width="25%">
						<DIV align="center"><%= Util.fcolorCCY(fra.getD01LIMEND())%></DIV>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
			</TD>
		</TR>
	</TBODY>
</TABLE>
<BR>

<TABLE width="100%" border="0" cellspacing="0" cellpadding="0"
	bgcolor="#FFFFFF" bordercolor="#FFFFFF">
	<TBODY>
		<TR bgcolor="#FFFFFF">
			<TD width="33%">
			<DIV align="center"><INPUT type="checkbox" name="H01FLGWK1" value="1"
				<% if(fra.getH01FLGWK1().equals("1")){ out.print("checked");} %>>
			Accept with Warnings</DIV>
			</TD>
		</TR>
	</TBODY>
</TABLE>
<TABLE width="100%" border="0" cellspacing="0" cellpadding="0"
	bgcolor="#FFFFFF" bordercolor="#FFFFFF">
	<TBODY>
		<TR bgcolor="#FFFFFF">
			<TD width="33%">
			<DIV align="center"><INPUT id="EIBSBTN" type="submit" name="Submit"
				value="Submit"></DIV>
			</TD>
		</TR>
	</TBODY>
</TABLE>
<BR>
</form>
</body>
</html>
