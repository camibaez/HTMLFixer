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
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

</head>
<body nowrap>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }
String sTitle = "Federal Funds";     
if (!currUser.getH01WK3().equals("1")) {
	sTitle = "Overnight Funds";
}
if (userPO.getHeader23().equals("1")) {
	sTitle = "Interbank";
}
%> 
<h3 align="center"> <%= sTitle %><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="fe_ffs.jsp, EDL0120"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0120" >
  <input type=HIDDEN name="SCREEN" value="16">
  <table class="tableinfo" width="100%" >
    <tr > 
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
              <%= deal.getD01DLSCP2()%></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" > 
              
            </td>
            <td nowrap colspan="3" width="85%" > <%= deal.getD01DLSCP3()%> 
              </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <table  class="tableinfo" width="597">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap align="right">Date :</td>
            <td nowrap > <%= Util.formatDate(deal.getE01DLSDD1(),deal.getE01DLSDD2(),deal.getE01DLSDD3())%></td>
            <td nowrap  align="right"> 
                <input type="hidden" name="E01DLSSBT" value="<%= deal.getE01DLSSBT()%>"></td>
            <td nowrap > 
              <input type="radio" name="CE01DLSSBT" value="PU" onClick="document.forms[0].E01DLSSBT.value='PU'"
			  <%if(deal.getE01DLSSBT().equals("PU")) out.print("checked");%>>
              <%if(userPO.getHeader23().equals("1")) out.print("Taking"); else out.print("Purchase");%>  
              <input type="radio" name="CE01DLSSBT" value="SL" onClick="document.forms[0].E01DLSSBT.value='SL'"
			  <%if(deal.getE01DLSSBT().equals("SL")) out.print("checked");%>>
              <%if(userPO.getHeader23().equals("1")) out.print("Placement"); else out.print("Sale");%>	  
			</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap align="right">Broker :</td>
            <td nowrap > 
              <input type="text" name="E01DLSBRK" size="4" maxlength="3" value="<%= deal.getE01DLSBRK()%>">
              <input type="text" name="D01FEBNM1" size="15" maxlength="15" value="<%= deal.getD01FEBNM1()%>">
              <a href="javascript:GetBrokerT('E01DLSBRK','D01FEBNM1')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0"></a> 
            </td>
            <td nowrap align="right"> Currency :</td>
            <td nowrap > 
              <input type="text" name="E01DLSCCY" size="4" maxlength="3" value="<%= deal.getE01DLSCCY().trim()%>" >
              <a href="javascript:GetCurrency('E01DLSCCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a> 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap align="right">Amount :</td>
            <td nowrap > 
              <input type="text" name="E01DLSAMN" size="15" maxlength="13" value="<%= deal.getE01DLSAMN()%>" 
			  onKeyPress="enterDecimal()">
            </td>
            <td nowrap align="right">Rate :</td>
            <td nowrap> 
              <input type="text" name="E01DLSRA1" size="11" maxlength="11" value="<%= deal.getE01DLSRA1()%>" 
			  >
              <input type="hidden" name="E01DLSCMM"  value="<%= deal.getE01DLSCMM()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap align="right">Value Date :</td>
            <td nowrap > 
              <input type="text" name="E01DLSVD1" size="3" maxlength="2" value="<%= deal.getE01DLSVD1().trim()%>" 
			  >
              <input type="text" name="E01DLSVD2" size="3" maxlength="2" value="<%= deal.getE01DLSVD2().trim()%>" 
			  >
              <input type="text" name="E01DLSVD3" size="3" maxlength="2" value="<%= deal.getE01DLSVD3().trim()%>" 
			  >
              <a href="javascript:DatePicker(document.forms[0].E01DLSVD1,document.forms[0].E01DLSVD2,document.forms[0].E01DLSVD3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
            </td>
            <td nowrap align="right">Maturity Date :</td>
            <td nowrap> 
              <input type="text" name="E01DLSMA1" size="3" maxlength="2" value="<%= deal.getE01DLSMA1().trim()%>" 
			  >
              <input type="text" name="E01DLSMA2" size="3" maxlength="2" value="<%= deal.getE01DLSMA2().trim()%>" 
			  >
              <input type="text" name="E01DLSMA3" size="3" maxlength="2" value="<%= deal.getE01DLSMA3().trim()%>" 
			  >
              <a href="javascript:DatePicker(document.forms[0].E01DLSMA1,document.forms[0].E01DLSMA2,document.forms[0].E01DLSMA3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
            </td>
          </tr>
            
          <TR id="trdark">
			<TD 
				nowrap width="21%" align="right">Line of Credit :
			</TD>
			<td nowrap width="23%" >
					<INPUT type="text" name="E01DLSLCU" size="9" maxlength="9" value="0" onKeyPress="enterInteger()">
					<INPUT type="text" name="E01DLSCMM" size="4" maxlength="4" value="0" onKeyPress="enterInteger()">
					<A href="javascript:GetCreditLine('E01DLSCMM',document.forms[0].E01DLSLCU.value)">
	   			<img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0"></a> 
	   		</TD>				 
		  </TR>
                    
          <tr id="trdark"> 
            <td nowrap align="right">Notes :</td>
            <td nowrap colspan="3" >
              <input type="text" name="E01DLSOT1" size="70" maxlength="60" value="<%= deal.getE01DLSOT1().trim()%>" 
			  >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              
            </td>
            <td nowrap colspan="3" >
              <input type="text" name="E01DLSOT2" size="70" maxlength="60" value="<%= deal.getE01DLSOT2().trim()%>" 
			  >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap align="right">Dealer :</td>
            <td nowrap ><%= deal.getE01DLSDID().trim()%> - <%= deal.getD01PRDDSC().trim()%></td>
            <td nowrap width="21%" > 
              <input type="hidden" name="E01DLSHEF" value="<%= deal.getE01DLSHEF()%>">
            </td>
            <td nowrap  >
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
<TABLE class="tableinfo" width="736">
	<TBODY>
		<TR>
			<TD nowrap>
			<TABLE cellpadding="2" cellspacing="0" border="0" width="100%">
				<TBODY>
					<TR id="trdark0">
						<TD nowrap width="21%" align="right">Trade Date :</TD>
						<TD nowrap width="35%"><INPUT type="text" name="E01DLSDD1"
							size="3" maxlength="2" value="<%= deal.getE01DLSDD1().trim()%>">
						<INPUT type="text" name="E01DLSDD2" size="3" maxlength="2"
							value="<%= deal.getE01DLSDD2().trim()%>"> <INPUT type="text"
							name="E01DLSDD3" size="3" maxlength="2"
							value="<%= deal.getE01DLSDD3().trim()%>"> <A
							href="javascript:DatePicker(document.forms[0].E01DLSDD1,document.forms[0].E01DLSDD2,document.forms[0].E01DLSDD3)"><IMG
							src="<%=request.getContextPath()%>/images/calendar.gif"
							alt="help" align="middle" border="0"></A></TD>

						<TD nowrap width="35%" align="right">Interest Amount :</TD>
						<TD nowrap width="35%"><%= deal.getE01DLSAM5().trim()%></TD>
					</TR>
					<TR id="trclear0">
						<TD nowrap width="21%" align="right">Terms :</TD>
						<TD nowrap width="35%"><INPUT type="text" name="E01DLSTRM"
							size="6" maxlength="5" value="<%= deal.getE01DLSTRM().trim()%>"
							readonly> <% if(deal.getE01DLSTRC().equals("D")) out.print("Day(s)");
                 			else if(deal.getE01DLSTRC().equals("M")) out.print("Month(s)");
                			else if(deal.getE01DLSTRC().equals("Y")) out.print("Year(s)");%>						</TD>

						<TD nowrap width="35%" align="right">Amount at
						Maturity :</TD>
						<TD nowrap width="35%"><%= deal.getE01DLSAM1().trim()%></TD>
					</TR>
					<TR id="trdark0">
					  <TD nowrap align="right">Accrual Type Basis :</TD>
					  <TD nowrap><SELECT name="E01DLSICT">
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
                      </SELECT></TD>
					  <TD nowrap align="right">Branch :</TD>
						<TD nowrap><INPUT type="text" name="E01DLSTBRN"
							size="4" maxlength="3" value="<%= deal.getE01DLSBRN().trim()%>"></TD>
					</TR>
				</TBODY>
			</TABLE>
			</TD>
		</TR>
	</TBODY>
</TABLE>

<BR>
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
  <br><table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
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
  </div>      </td>
    </tr>
  </table>
  
  </form>
<font size="2">
<input type="hidden" name="D01DLSCP3"  value="<%= deal.getD01DLSCP3()%>">
</font>
</body>
</html>
