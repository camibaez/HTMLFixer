<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Certificates</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="deal" class="datapro.eibs.beans.EDL013011Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

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

<h3 align="center"><%=currUser.getH01WK3().equals("4")?"Interbank ":"Time Deposits "%>- Back Office - Confirmation</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0120B" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
  <INPUT TYPE=HIDDEN NAME="E11DEABNK"  value="<%= deal.getE11DEABNK().trim()%>">
  <input type=HIDDEN name="E11DEAACD"  value="<%= deal.getE11DEAACD().trim()%>">
  <input type=HIDDEN name="E11DEACCY"  value="<%= deal.getE11DEACCY().trim()%>">
  <table class="tableinfo" width="100%" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trclear"> 
            <td nowrap width="15%" > 
              <div align="right"><b>Counterparty :</b></div>
            </td>
            <td nowrap colspan="3" width="85%" > 
              <div align="left"> 
                <input type="hidden" name="E11CUSNA1"  value="<%= deal.getE11CUSNA1()%>" >
                <input type="hidden" name="E11DEACUN"  value="<%= deal.getE11DEACUN()%>" >
                <%= deal.getE11DEACUN()%> - <%= deal.getE11CUSNA1()%> </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" > 
              <div align="right"><b>Location :</b></div>
            </td>
            <td nowrap colspan="3" width="85%" > 
              <input type="hidden" name="E11CUSNA2"  value="<%= deal.getE11CUSNA2()%>" >
              <%= deal.getE11CUSNA2()%></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" > 
              <div align="right"></div>
            </td>
            <td nowrap colspan="3" width="85%" > 
              <input type="hidden" name="E11CUSNA3"  value="<%= deal.getE11CUSNA3()%>">
              <%= deal.getE11CUSNA3()%></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" > 
              <div align="right"><b>Account Number :</b></div>
            </td>
            <td nowrap colspan="3" width="85%" > 
              <input type="hidden" name="E11DEAACC"  value="<%= deal.getE11DEAACC()%>">
              <%= deal.getE11DEAACC()%></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Basic Information</h4>
  <table  class="tableinfo" width="597">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">Date :</div>
            </td>
            <td nowrap width="25%" > <%= Util.formatDate(deal.getE11DEAOD1(),deal.getE11DEAOD2(),deal.getE11DEAOD3())%></td>
            <td nowrap width="20%" > 
              <div align="right">Time :</div>
            </td>
            <td nowrap width="21%" ><%= userPO.getHeader8()%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">Broker :</div>
            </td>
            <td nowrap width="25%" > <%= deal.getE11DLSBRK()%> - <%= deal.getE11DLSBDS()%> 
            </td>
            <td nowrap width="20%" > 
              <div align="right"> Currency :</div>
            </td>
            <td nowrap width="21%" > <%= deal.getE11DEACCY().trim()%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">Amount :</div>
            </td>
            <td nowrap width="25%" ><%= Util.fcolorCCY(deal.getE11DEAOAM())%> 
            </td>
            <td nowrap width="20%" > 
              <div align="right">Rate :</div>
            </td>
            <td nowrap width="21%"> <%= deal.getE11DEARTE()%></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">Value Date :</div>
            </td>
            <td nowrap width="25%" > <%= Util.formatDate(deal.getE11DEASD1(),deal.getE11DEASD2(),deal.getE11DEASD3())%> 
            </td>
            <td nowrap align="right" width="20%">Maturity Date :</td>
            <td nowrap width="21%"> <%= Util.formatDate(deal.getE11DEAMD1(),deal.getE11DEAMD2(),deal.getE11DEAMD3())%> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">Reference Number :</div>
            </td>
            <td nowrap width="25%" ><%= deal.getE11DEAREF()%></td>
            <td nowrap align="right" width="20%">Action Taken :</td>
            <td nowrap width="21%">
            <% if(currUser.getH01WK3().equals("4")) { %>
            	<% if(deal.getE11DLSSBT().equals("PU")) out.print("Placement");else out.print("Taking");%> 
            <% } else { %>
            	<% if(deal.getE11DLSSBT().equals("PU")) out.print("Purchase");else out.print("Sale");%> 
            <% } %>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">Notes :</div>
            </td>
            <td nowrap colspan="3" ><%= deal.getE11DLSOT1().trim()%></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right"></div>
            </td>
            <td nowrap colspan="3" ><%= deal.getE11DLSOT2().trim()%></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">Dealer :</div>
            </td>
            <td nowrap colspan="3" ><%= deal.getE11DLSUSR().trim()%> - <%= deal.getE11DLSDSC().trim()%></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" >Line of Credit :</td>
            <td nowrap colspan="3" >
              <%= deal.getE11DLSLCU().trim()%>
			  &nbsp;/&nbsp;
              <%= deal.getE11DLSCMM().trim()%>
              </td>
          </tr>          
          
        </table>
      </td>
    </tr>
  </table>
  <h4> General Information</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="20%" colspan="2" > 
              <div align="right">Product :</div>
            </td>
            <td nowrap colspan="2" ><%= deal.getE11DEAPRO()%> - <%= deal.getE11DLSPDS()%> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" colspan="2" > 
              <div align="right">Foreign Exchange Rate :</div>
            </td>
            <td nowrap width="10%" ><%= deal.getE11DEAEXR().trim()%> </td>
            <td nowrap width="36%" > 
              <div align="left">Confirmation Type : <% if(deal.getE11DEAF03().equals("P")) out.print("Print Notification");
				 else if(deal.getE11DEAF03().equals("S")) out.print("Send Notification Via Swift");
				 else if(deal.getE11DEAF03().equals("H")) out.print("Send Notification Via Chip");
				 else if(deal.getE11DEAF03().equals("T")) out.print("Send Notification Via Telex");
				 else if(deal.getE11DEAF03().equals("F")) out.print("Send Notification Via Fax");
				 else out.print("No Notification");%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" colspan="2" > 
              <div align="right">Payment Via : </div>
            </td>
            <td nowrap width="10%" ><% if(deal.getE11DEAPVI().equals("F")) out.print("Fed");
				 else if(deal.getE11DEAPVI().equals("1")) out.print("Swift MT - 100");
				 else if(deal.getE11DEAPVI().equals("2")) out.print("Swift MT - 200");
				 else if(deal.getE11DEAPVI().equals("3")) out.print("Swift MT - 202");
				 else if(deal.getE11DEAPVI().equals("T")) out.print("Telex");
				 else out.print("None");%></td>
            <td nowrap width="36%" >&nbsp;</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap colspan="4" ><b>Redemption</b></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="10%" > 
              <div align="right"> 
                <input type="radio" name="CE11DEAF02" value="E" 
			  <%if(deal.getE11DEAF02().equals("E")) out.print("checked");%> disabled>
              </div>
            </td>
            <td nowrap colspan="2" > 
              <div align="left"> 
                <input type="hidden" name="E11DEAF022"  value="<%= deal.getE11DEAF02()%>" >
                Account number :<%= deal.getE11EEEACC().trim()%> or </div>
            </td>
            <td nowrap width="36%" >&nbsp;</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" > 
              <div align="right"> 
                <input type="radio" name="CE11DEAF02" value="D" 
			  <%if(deal.getE11DEAF02().equals("D")) out.print("checked");%> disabled>
              </div>
            </td>
            <td nowrap colspan="2" > 
              <div align="left">General Ledger number :<%= deal.getE11DDDGLN().trim()%></div>
            </td>
            <td nowrap width="36%" >&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Offset Accounts</h4>
  <table class="tableinfo" >
    <tr id="trdark"> 
      <td nowrap width="32%"> 
        <div align="center">Concept</div>
      </td>
      <td nowrap width="14%"> 
        <div align="center">Bank</div>
      </td>
      <td nowrap width="17%"> 
        <div align="center">Branch</div>
      </td>
      <td nowrap width="22%"> 
        <div align="center">Currency</div>
      </td>
      <td nowrap width="15%"> 
        <div align="center">Reference</div>
      </td>
    </tr>
    <tr id="trclear"> 
      <td nowrap width="32%" > 
        <div align="center"> <%= deal.getE11OFFOP1().trim()%> 
          <input type="hidden" name="E11OFFGL1" value="<%= deal.getE11OFFGL1().trim()%>">
          <%= deal.getE11OFFCO1().trim()%> </div>
      </td>
      <td nowrap width="14%" > 
        <div align="center"> <%= deal.getE11OFFBK1().trim()%> </div>
      </td>
      <td nowrap width="17%" > 
        <div align="center"> <%= deal.getE11OFFBR1().trim()%> </div>
      </td>
      <td nowrap width="22%" > 
        <div align="center"> <%= deal.getE11OFFCY1().trim()%> </div>
      </td>
      <td nowrap width="15%" > 
        <div align="center"> <%= deal.getE11OFFAC1().trim()%> </div>
      </td>
    </tr>
  </table>
  <h4>Limits</h4>
  <table  class="tableinfo" width="445" >
    <tr > 
      <td nowrap> 
        <table width="100%">
          <tr id="trdark"> 
            <td nowrap>&nbsp;</td>
            <td nowrap  colspan="2"> 
              <div align="center"><b>Limit Amount </b></div>
            </td>
            <td nowrap > 
              <div align="center"><b>Utilized Limit Amount</b></div>
            </td>
            <td nowrap > 
              <div align="center"><b>Available Limit Amount </b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap>Credit Lines</td>
            <td nowrap  colspan="2"> 
              <div align="right"><%= Util.fcolorCCY(deal.getE11DLSAMT1())%></div>
            </td>
            <td nowrap > 
              <div align="right"><%= Util.fcolorCCY(deal.getE11DLSAMT3())%></div>
            </td>
            <td nowrap > 
              <div align="right"><%= Util.fcolorCCY(deal.getE11DLSAMT2())%></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p> 
 
  </p>
  </form>
</body>
</html>
