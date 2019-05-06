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
<h3 align="center">Commercial Paper - Confirmation Ticket </h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0120" >
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
              <%= deal.getD01DLSCP3()%></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <table  class="tableinfo" width="736">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trclear"> 
            <td nowrap align="right">Date :</td>
            <td nowrap ><%= Util.formatDate(deal.getE01DLSDD1(),deal.getE01DLSDD2(),deal.getE01DLSDD3())%></td>
            <td nowrap >
              <div align="right">Time :</div>
            </td>
            <td nowrap ><%= userPO.getHeader1() %></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" align="right">Broker :</td>
            <td nowrap width="23%" > <%= deal.getE01DLSBRK()%> - <%= deal.getD01FEBNM1()%> 
            </td>
            <td nowrap width="18%" align="right"> Action Taken :</td>
            <td nowrap width="20%" ><% if(deal.getE01DLSSBT().equals("PU")) out.print("New Purchase");
					   else if(deal.getE01DLSSBT().equals("PA")) out.print("Additional Purchase");
					    else if(deal.getE01DLSSBT().equals("SL")) out.print("Sale outright");
					     else if(deal.getE01DLSSBT().equals("S1")) out.print("Re-Sale");
					      else if(deal.getE01DLSSBT().equals("PR")) out.print("Re-Purchase");
					      else if(deal.getE01DLSSBT().equals("RL")) out.print("Release");
						else out.print("");%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" align="right">Reference Number :</td>
            <td nowrap width="23%" ><%= deal.getE01DLSREF().trim()%> </td>
            <td nowrap width="18%" align="right">Deal Number :</td>
            <td nowrap width="20%"> 
              <div align="left"><%= deal.getE01DLSHEM() %> </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" align="right">Currency :</td>
            <td nowrap width="23%" > <%= deal.getE01DLSCCY().trim()%> </td>
            <td nowrap align="right" width="18%">Face Value :</td>
            <td nowrap width="20%"><%= Util.fcolorCCY(deal.getE01DLSAMN())%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" align="right">Price : </td>
            <td nowrap width="23%" > <%= Util.fcolorCCY(deal.getE01DLSRA3())%>
            </td>
            <TD nowrap align="right" width="18%"> 
              <DIV align="right">Premium/Discount :</DIV> </TD>
              <%
              // As400 sends the fields with commas in them, this code removes the commas, converts to double and takes the difference of 2 fields
              String doubleString = deal.getE01DLSAMN();
             	String d1 = "";
              	for (int i = 0; i < doubleString.length(); i++)
              	{
              		if (doubleString.charAt(i) != ',') d1 += doubleString.charAt(i);
              	}
              	doubleString = deal.getE01DLSEQV();
              	String d2 = "";
              	for (int i = 0; i < doubleString.length(); i++)
              	{
              		if (doubleString.charAt(i) != ',') d2 += doubleString.charAt(i);
              	}
              	
              String difference = Double.toString( java.lang.Math.abs(Double.parseDouble(d1) - Double.parseDouble(d2)) );
              %>
              <TD nowrap width="20%"><%= Util.fcolorCCY(difference)%></TD>
            
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" align="right">Coupon Rate :</td>
            <td nowrap width="23%" ><%= Util.fcolorCCY(deal.getE01DLSRA1())%></td>
            <TD nowrap align="right" width="18%">Net Proceeds :</TD><TD nowrap width="20%">  
            <%= Util.fcolorCCY(deal.getE01DLSAM1())%></TD>
            
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" align="right">Last Coupon Date :</td>
            <td nowrap width="23%" ><%= Util.formatDate(deal.getE01DLSLI1(),deal.getE01DLSLI2(),deal.getE01DLSLI3())%> 
            </td>
            <TD nowrap align="right" width="18%">Settlement Date :</TD><TD nowrap width="20%"> <%= Util.formatDate(deal.getE01DLSVD1(),deal.getE01DLSVD2(),deal.getE01DLSVD3())%> 
            </TD>
            
          </tr>          
          <tr id="trclear"> 
            <td nowrap width="21%" align="right">Trade Date :</td>
            <td nowrap width="23%" ><%= Util.formatDate(deal.getE01DLSDD1(),deal.getE01DLSDD2(),deal.getE01DLSDD3())%> 
            </td>
            <td nowrap align="right" width="18%">Negociated By :</td>
            <td nowrap width="20%"><%= deal.getE01DL1OFI().trim()%></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" align="right">Notes :</td>
            <td nowrap colspan="3" ><%= deal.getE01DLSOT1().trim()%></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" > 
              
            </td>
            <td nowrap colspan="3" ><%= deal.getE01DLSOT2().trim()%></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" align="right">Dealer :</td>
            <td nowrap ><%= deal.getE01DLSDID().trim()%> - <%= deal.getD01USRDSC().trim()%></td>
            <td nowrap width="21%" > 
              <input type="hidden" name="E01DLSHEF" value="<%= deal.getE01DLSHEF()%>">
            </td>
            <td nowrap  >
              <input type="radio" disabled name="CE01DLSHEF" value="Y" onClick="document.forms[0].E01DLSHEF.value='Y'"
			  <%if(deal.getE01DLSHEF().equals("Y")) out.print("checked");%>>
              IBF 
              <input type="radio" disabled name="CE01DLSHEF" value="N" onClick="document.forms[0].E01DLSHEF.value='N'"
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
					<TR id="trdark">
						<TD nowrap width="25%">
						<DIV align="right">Redemption Date :</DIV>						</TD>
						<TD nowrap width="35%"> <%= Util.formatDate(deal.getE01DLSMA1(),deal.getE01DLSMA2(),deal.getE01DLSMA3())%>						</TD>
						<TD nowrap width="25%">
						<DIV align="right">Accrued Interest :</DIV>						</TD>
						<TD nowrap width="35%"><%= deal.getE01DLSAM5().trim()%></TD>
					</TR>
					<TR id="trclear">
						<TD nowrap width="25%">
						<DIV align="right">Coupon Payment Period :</DIV>						</TD>
						<TD nowrap width="35%"><%= deal.getE01DLSROY().trim()%> <%= deal.getE01DLSODA().trim()%></TD>
						<TD nowrap width="25%">
						<DIV align="right">Book :</DIV>
						<td nowrap width="35%"><%= deal.getE01DLSLNC().trim()%></td>
					</TR>
					<TR id="trdark">
						<TD nowrap width="25%">
						<DIV align="right">Accrual Type Basis :</DIV>						</TD>
						<TD nowrap width="35%"><% if(deal.getE01DLSICT().equals("1")) out.print("Actual/actual");
						else if(deal.getE01DLSICT().equals("2")) out.print("Actual/365");
						 else if(deal.getE01DLSICT().equals("3")) out.print("Actual/365 (366 in leap year)");
                           else if(deal.getE01DLSICT().equals("4")) out.print("Actual/360");
                            else if(deal.getE01DLSICT().equals("5")) out.print("30/360");
                             else if(deal.getE01DLSICT().equals("6")) out.print("30E/360");				      
					%></TD>
						<TD nowrap align="right">Branch :</TD>
						<TD nowrap><%= deal.getE01DLSBRN().trim()%></TD>
					</TR>
					<TR id="trclear">
						<TD nowrap width="25%">
						<DIV align="right">Cusip/Isin Code Number :</DIV>						</TD>
						<TD nowrap width="35%"><%= deal.getE01DLSTHR().trim()%></TD>
						<TD nowrap width="25%"></TD>
						<TD nowrap width="35%"></TD>
					</TR>
				</TBODY>
			</TABLE>
			</TD>
		</TR>
	</TBODY>
</TABLE>
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
</form>
<TABLE>
	<TBODY>
		<TR>
			<TD></TD>
		</TR>
		<TR></TR>
	</TBODY>

</TABLE>
<P><BR>
</P>
</body>
</html>
