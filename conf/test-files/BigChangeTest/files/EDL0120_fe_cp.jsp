<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Treasury Module</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">



<jsp:useBean id="deal" class="datapro.eibs.beans.EDL0120DSMessage"  scope="session" />

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
<h3 align="center">Commercial Paper<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="fe_cp, EDL0120"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0120" >
  <table class="tableinfo" width="100%" >
    <tr id="trclear"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trclear"> 
            <td nowrap width="15%"  align="right"><b>Counterparty :</b></td>
            <td nowrap colspan="3" width="85%" align="left"> 
                <input type="hidden" name="D01DLSCP1"  value="<%= deal.getD01DLSCP1()%>" >
                <%= deal.getD01DLSCP1()%>  </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="15%" align="right"><b>Location :</b></td>
            <td nowrap colspan="3" width="85%" >
              <input type="hidden" name="D01DLSCP2"  value="<%= deal.getD01DLSCP2()%>" >
              <%= deal.getD01DLSCP2()%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" > 
              <div align="right">
                <input type=HIDDEN name="SCREEN" value="6">
              </div>
            </td>
            <td nowrap colspan="3" width="85%" >
              <input type="hidden" name="D01DLSCP3"  value="<%= deal.getD01DLSCP3()%>" >
              <%= deal.getD01DLSCP3()%> </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <table  class="tableinfo" width="736">
    <tr> 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap colspan="5" > 
              <div align="right">Date :<%= Util.formatDate(deal.getE01DLSDD1(),deal.getE01DLSDD2(),deal.getE01DLSDD3())%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" align="right">Broker :</td>
            <td nowrap width="25%" > 
              <input type="text" name="E01DLSBRK" size="4" maxlength="3" value="<%= deal.getE01DLSBRK()%>">
              <input type="text" name="D01FEBNM1" size="15" maxlength="15" value="<%= deal.getD01FEBNM1()%>">
              <a href="javascript:GetBrokerT('E01DLSBRK','D01FEBNM1')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0"></a> 
            <IMG src="<%=request.getContextPath()%>/images/Check.gif"
					alt="mandatory field" align="bottom" border="0"></td>
            <td nowrap width="25%" align="right">Action :</td>
            <td nowrap width="25%" > 
              <select name="E01DLSSBT">
                <option value="PU" <% if (deal.getE01DLSSBT().equals("PU")) out.print("selected"); %>>New Purchase</option>
                <option value="PA" <% if (deal.getE01DLSSBT().equals("PA")) out.print("selected"); %>>Additional Purchase</option>
                <option value="SL" <% if (deal.getE01DLSSBT().equals("SL")) out.print("selected"); %>>Sale outright</option>
                <option value="S1" <% if (deal.getE01DLSSBT().equals("S1")) out.print("selected"); %>>Re-Sale</option>
                <option value="PR" <% if (deal.getE01DLSSBT().equals("PR")) out.print("selected"); %>>Re-purchase</option>
                <option value="RL" <% if (deal.getE01DLSSBT().equals("RL")) out.print("selected"); %>>Release</option>
                <option value="SS" <% if (deal.getE01DLSSBT().equals("SS")) out.print("selected"); %>>Short Sale</option>
              </select>
 			<IMG src="<%=request.getContextPath()%>/images/Check.gif"
					alt="mandatory field" align="bottom" border="0"></td>
            <td nowrap width="25%" > 
              <div align="center"> 
                <h5>Deal Number<br>
                  <input type="text" name="E01DLSHEM" size="12" maxlength="9" onKeyPress="enterInteger()" value="<%= deal.getE01DLSHEM() %>">
                  <a href="javascript:GetAccount('E01DLSHEM','','PL','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0" ></a></h5>
              </div>			
			</td>
 			
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" align="right">Currency :</td>
            <td nowrap width="25%" > 
              <input type="text" name="E01DLSCCY" size="4" maxlength="3" value="<%= deal.getE01DLSCCY().trim()%>" >
              <a href="javascript:GetCurrency('E01DLSCCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0"></a> 
              <IMG src="<%=request.getContextPath()%>/images/Check.gif"
					alt="mandatory field" align="bottom" border="0"><input type="hidden" name="E01DLSCMM"  value="<%= deal.getE01DLSCMM()%>" >
            </td>
            <td nowrap align="right" width="25%">
            	<div align="right">Price :</div>
            </td>
            <td nowrap width="25%" colspan="2">
            	<input type="text" name="E01DLSRA3" size="18" maxlength="17" value="<%= deal.getE01DLSRA3().trim()%>" onKeypress="enterSignDecimal()">
            	<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0" > 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" align="right">Face Value : </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DLSAMN" size="15" maxlength="13" value="<%= deal.getE01DLSAMN()%>" onKeyPress="enterDecimal()">
            <IMG src="<%=request.getContextPath()%>/images/Check.gif"
					alt="mandatory field" align="bottom" border="0"></td>
            <TD nowrap align="right" width="25%"> 
              <DIV align="right">Net Proceeds :</DIV>
            </TD><TD nowrap width="25%" colspan="2"> 
              <INPUT type="text" name="E01DLSAM1" size="15" maxlength="13" value="<%= deal.getE01DLSAM1()%>" readonly>
            </TD>
            
          </tr>
          <tr id="trdark"> 
            <td nowrap width="21%" align="right">Coupon Rate :</td>
            <td nowrap width="25%" > 
               <input type="text" name="E01DLSRA1" size="11" maxlength="11" value="<%= deal.getE01DLSRA1().trim()%>" onKeypress="enterSignDecimal()">
            </td>
            <TD nowrap align="right" width="25%">
            	<DIV align="right">Premium/Discount :</DIV>
            </TD><TD nowrap width="25%" colspan="2"> 
            	<INPUT type="text" name="E01DLSEQV" size="15" maxlength="13" value="<%= deal.getE01DLSEQV()%>" readonly>
            </TD>
            
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" align="right">Last Coupon Date :</td>
            <td nowrap width="25%" > 
              <input type="text" name="E01DLSLI1" size="3" maxlength="2" value="<%= deal.getE01DLSLI1().trim()%>">
              <input type="text" name="E01DLSLI2" size="3" maxlength="2" value="<%= deal.getE01DLSLI2().trim()%>">
              <input type="text" name="E01DLSLI3" size="3" maxlength="2" value="<%= deal.getE01DLSLI3().trim()%>">
              <a href="javascript:DatePicker(document.forms[0].E01DLSLI1,document.forms[0].E01DLSLI2,document.forms[0].E01DLSLI3)">
              <img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></a> 
            </td>
            <TD nowrap align="right" width="25%">
            	<DIV align="right">Settlement Date :</DIV>
            </TD><TD nowrap width="25%" colspan="2"> 
              <INPUT type="text" name="E01DLSVD1" size="3" maxlength="2" value="<%= deal.getE01DLSVD1().trim()%>">
              <INPUT type="text" name="E01DLSVD2" size="3" maxlength="2" value="<%= deal.getE01DLSVD2().trim()%>">
              <INPUT type="text" name="E01DLSVD3" size="3" maxlength="2" value="<%= deal.getE01DLSVD3().trim()%>">
              <A href="javascript:DatePicker(document.forms[0].E01DLSVD1,document.forms[0].E01DLSVD2,document.forms[0].E01DLSVD3)">
              <IMG src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></A> 
            <IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"></TD>
            
          </tr>
          
          <tr id="trdark"> 
            <td nowrap width="25%" align="right">Trade Date :</td>
            <td nowrap width="25%" > 
              <input type="text" name="E01DLSDD1" size="3" maxlength="2" value="<%= deal.getE01DLSDD1().trim()%>">
              <input type="text" name="E01DLSDD2" size="3" maxlength="2" value="<%= deal.getE01DLSDD2().trim()%>">
              <input type="text" name="E01DLSDD3" size="3" maxlength="2" value="<%= deal.getE01DLSDD3().trim()%>">
              <a href="javascript:DatePicker(document.forms[0].E01DLSDD1,document.forms[0].E01DLSDD2,document.forms[0].E01DLSDD3)">
              <img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></a> 
            </td>
            <td nowrap align="right" width="25%">Negociated By :</td>
            <td nowrap width="25%"  colspan="2"><INPUT type="text"
					name="E01DL1OFI" size="3" maxlength="3"
					value="<%= deal.getE01DL1OFI().trim()%>"
					onkeypress="enterDecimal()"> 
            		<INPUT type="text" name="D01DL1OFI" size="35"
					maxlength="35" value="<%= deal.getD01DL1OFI().trim()%>" readonly>
            		<A
					href="javascript:GetCodeDescCNOFC('E01DL1OFI','D01DL1OFI','15')"><IMG
					src="<%=request.getContextPath()%>/images/1b.gif" alt="help"
					align="bottom" border="0"></A> 
              		<IMG
					src="<%=request.getContextPath()%>/images/Check.gif"
					alt="mandatory field" align="bottom" border="0"></td>
          </tr>
		  <TR id="trdark">
			<TD nowrap width="25%" align="right">Line of Credit : </TD>
			<td nowrap width="25%">
					<INPUT type="text" name="E01DLSLCU" size="9" maxlength="9" value="<%= deal.getE01DLSLCU().trim()%>" onKeyPress="enterInteger()">
					<INPUT type="text" name="E01DLSCMM" size="4" maxlength="4" value="<%= deal.getE01DLSCMM().trim()%>" onKeyPress="enterInteger()">
					<A href="javascript:GetCreditLine('E01DLSCMM',document.forms[0].E01DLSLCU.value)">
	   			<img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0"></a> 
	   		</TD>
	   		<td nowrap width="25%"></td>
	   		<td nowrap width="25%"></td>				 
		  </TR>                    
          <tr id="trclear"> 
            <td nowrap width="25%" align="right">Notes :</td>
            <td nowrap colspan="4" > 
              <input type="text" name="E01DLSOT1" size="70" maxlength="60" value="<%= deal.getE01DLSOT1().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              
            </td>
            <td nowrap colspan="4" > 
              <input type="text" name="E01DLSOT2" size="70" maxlength="60" value="<%= deal.getE01DLSOT2().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" align="right">Dealer :</td>
            <td nowrap ><%= deal.getE01DLSDID().trim()%> - <%= deal.getD01USRDSC().trim()%></td>
            <td nowrap width="21%" > 
              <input type="hidden" name="E01DLSHEF" value="<%= deal.getE01DLSHEF()%>">
            </td>
            <td nowrap colspan="2" >
              <input type="radio" name="CE01DLSHEF" value="Y" onClick="document.forms[0].E01DLSHEF.value='Y'"
			  <%if(deal.getE01DLSHEF().equals("Y")) out.print("checked");%>>
              IBF 
              <input type="radio" name="CE01DLSHEF" value="N" onClick="document.forms[0].E01DLSHEF.value='N'"
			  <%if(!deal.getE01DLSHEF().equals("Y")) out.print("checked");%>>
              NON IBF
             </td>
            
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
	<% if (deal.getH01FLGWK3().equals("E")) { %>
	  <table  class="tableinfo" width="736">
	  <tr>
	  <td nowrap> 
		<TABLE cellpadding="2" cellspacing="0" border="0" width="100%">
		<TBODY>
		<TR id="trdark">
			<TD nowrap width="15%">
			<DIV align="right">Redemption Date :</DIV>
			</TD>
			<TD nowrap width="35%">
			  <INPUT
				type="text" name="E01DLSMA1" size="2" maxlength="2"
				value="<%= deal.getE01DLSMA1().trim()%>" onKeyPress="enterInteger()">
              <INPUT type="text" name="E01DLSMA2" size="2" maxlength="2"
				value="<%= deal.getE01DLSMA2().trim()%>" onKeyPress="enterInteger()">
              <INPUT type="text" name="E01DLSMA3" size="2" maxlength="2"
				value="<%= deal.getE01DLSMA3().trim()%>" onKeyPress="enterInteger()">
              <A
				href="javascript:DatePicker(document.forms[0].E01DLSMA1,document.forms[0].E01DLSMA2,document.forms[0].E01DLSMA3)"><IMG
				src="<%=request.getContextPath()%>/images/calendar.gif" alt="help"
				align="middle" border="0">
			  </A> 
			</TD>
			<TD nowrap width="15%">
			<DIV align="right">Accrued Interest :</DIV>
			</TD>
			<TD nowrap width="35%"><%= deal.getE01DLSAM5().trim()%></TD>
		</TR>
		<TR id="trclear">
			<TD nowrap width="15%">
			<DIV align="right">Coupon Payment Period :</DIV>
			</TD>
			<TD nowrap width="35%"><INPUT type="text"
				name="E01DLSROY" size="5" maxlength="4"
				value="<%= deal.getE01DLSROY().trim()%>">
				<SELECT name="E01DLSODA">
						<OPTION value=""
							<%if (deal.getE01DLSODA().equals("")) { out.print("selected"); }%>></OPTION>
						<OPTION value="P"
							<%if (deal.getE01DLSODA().equals("P")) { out.print("selected"); }%>>Monthly
						Period (Do Not Include Last Day)</OPTION>
						<OPTION value="I"
							<%if (deal.getE01DLSODA().equals("I")) { out.print("selected"); }%>>Monthly
						Period (Include Last Day)</OPTION>
						<OPTION value="Y"
							<%if (deal.getE01DLSODA().equals("Y")) { out.print("selected"); }%>>Yearly</OPTION>
						<OPTION value="M"
							<%if (deal.getE01DLSODA().equals("M")) { out.print("selected"); }%>>Day
						of the Month</OPTION>
						<OPTION value="D"
							<%if (deal.getE01DLSODA().equals("D")) { out.print("selected"); }%>>Days
						(31 End of Month)</OPTION>
						<OPTION value="Q"
							<%if (deal.getE01DLSODA().equals("Q")) { out.print("selected"); }%>>Quarterly</OPTION>
					</SELECT>
			</TD>
			<TD nowrap width="15%">
			<DIV align="right">Book :</DIV>
			</TD>
			<TD nowrap width="15%">
			<SELECT name="E01DLSLNC">
						<OPTION value=""
							<%if (deal.getE01DLSLNC().equals("")) { out.print("selected"); }%>></OPTION>
						<OPTION value="1"
							<%if (deal.getE01DLSLNC().equals("1")) { out.print("selected"); }%>>Held to Maturity</OPTION>
						<OPTION value="2"
							<%if (deal.getE01DLSLNC().equals("2")) { out.print("selected"); }%>>Available for Sale</OPTION>
						<OPTION value="3"
							<%if (deal.getE01DLSLNC().equals("3")) { out.print("selected"); }%>>Trading</OPTION>
			</SELECT></TD>
		</TR>
		<TR id="trdark">
			<TD nowrap width="15%">
			<DIV align="right">Accrual Type Basis :</DIV>
			</TD>
			<TD nowrap width="35%"><SELECT name="E01DLSICT">
				<OPTION value=""
					<%if (deal.getE01DLSICT().equals("")) { out.print("selected"); }%>></OPTION>
				<OPTION value="1"
					<%if (deal.getE01DLSICT().equals("1")) { out.print("selected"); }%>>Actual/actual
				(in period)</OPTION>
				<OPTION value="2"
					<%if (deal.getE01DLSICT().equals("2")) { out.print("selected"); }%>>Actual/365</OPTION>
				<OPTION value="3"
					<%if (deal.getE01DLSICT().equals("3")) { out.print("selected"); }%>>Actual/365
				(366 in leap year)</OPTION>
				<OPTION value="4"
					<%if (deal.getE01DLSICT().equals("4")) { out.print("selected"); }%>>Actual/360</OPTION>
				<OPTION value="5"
					<%if (deal.getE01DLSICT().equals("5")) { out.print("selected"); }%>>30/360</OPTION>
				<OPTION value="6"
					<%if (deal.getE01DLSICT().equals("6")) { out.print("selected"); }%>>30E/360</OPTION>
			</SELECT>
             
            <TD nowrap width="35%"></TD>
		</TR>
		<TR id="trclear">
			<TD nowrap width="15%">
			<DIV align="right">Cusip/Isin Code Number :</DIV>
			</TD>
			<TD nowrap width="35%"><INPUT type="text" name="E01DLSTHR" size="13"
				maxlength="12" value="<%= deal.getE01DLSTHR().trim()%>"></TD>
			<TD nowrap width="15%">
			
			</TD>
			<TD nowrap width="35%"></TD>
		</TR>
		<TR id="trdark">
			<TD nowrap width="15%">
			<DIV align="right">Branch :</DIV>
			</TD>
			<TD nowrap width="35%"><INPUT type="text" name="E01DLSBRN" size="4"
				maxlength="3" value="<%= deal.getE01DLSBRN().trim()%>"></TD>
			<TD nowrap width="15%">
			
			</TD>
			<TD nowrap width="35%"></TD>
		</TR>
		</TBODY>
	</TABLE>
   </table>
  
  <br>
<%}%>
  <table  class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table width="100%">
          <tr id="trdark"> 
            <td nowrap>&nbsp;</td>
            <td nowrap  colspan="2"><b>Limit Amount </b></td>
            <td nowrap align="center"><b>Available Limit</b></td>
            <td nowrap align="center"><b>Ending Limit Amount </b></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap>Credit Lines</td>
            <td nowrap  colspan="2"> 
              <div align="right"><%= Util.fcolorCCY(deal.getD01LIMAMT())%>:</div>
            </td>
            <td nowrap > 
              <div align="right"><%= Util.fcolorCCY(deal.getD01LIMAVL())%></div>
            </td>
            <td nowrap > 
              <div align="right"><b><%= Util.fcolorCCY(deal.getD01LIMEND())%></b></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="33%"> 
        <div align="center"> 
          <input type="checkbox" name="H01FLGWK1" value="1" >
          Accept with Warnings </div>
      </td>
    </tr>
  </table>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="33%"> 
       <div align="center"> 
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>
      </td>
    </tr>
  </table>
  
  </form>
</body>
</html>
