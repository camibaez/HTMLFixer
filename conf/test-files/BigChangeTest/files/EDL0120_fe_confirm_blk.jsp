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
<body nowrap>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%> 
<h3 align="center"> Financial Blocks - Confirmation Ticket </h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0120" >
  <input type=HIDDEN name="SCREEN" value="10">
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
            <td nowrap colspan="3" width="85%" >
              <input type="hidden" name="D01DLSCP3"  value="<%= deal.getD01DLSCP3()%>" >
              <%= deal.getD01DLSCP3()%></td>
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
          <tr id="trclear"> 
            <td nowrap width="34%" align="right">Date :</td>
            <td nowrap width="25%" > <%= Util.formatDate(deal.getE01DLSDD1(),deal.getE01DLSDD2(),deal.getE01DLSDD3())%></td>
            <td nowrap width="20%" align="right">Time :</td>
            <td nowrap width="21%" ><%= userPO.getHeader1()%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%" align="right">Broker :</td>
            <td nowrap width="25%" ><%= deal.getE01DLSBRK()%> - <%= deal.getD01FEBNM1()%> 
            </td>
            <td nowrap width="20%" align="right">Reference Number :</td>
            <td nowrap width="21%"><%= deal.getE01DLSREF()%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%" align="right">Amount :</td>
            <td nowrap width="25%" ><%= Util.fcolorCCY(deal.getE01DLSAMN())%> 
            </td>
            <td nowrap align="right" width="20%">Currency :</td>
            <td nowrap width="21%"><%= deal.getE01DLSCCY().trim()%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%" align="right">Value Date :</td>
            <td nowrap width="25%" ><%= Util.formatDate(deal.getE01DLSVD1(),deal.getE01DLSVD2(),deal.getE01DLSVD3())%></td>
            <td nowrap align="right" width="20%">Maturity Date :</td>
            <td nowrap width="21%"><%= Util.formatDate(deal.getE01DLSMA1(),deal.getE01DLSMA2(),deal.getE01DLSMA3())%></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%" align="right">Notes :</td>
            <td nowrap colspan="3" ><%= deal.getE01DLSOT1().trim()%></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%" > 
              
            </td>
            <td nowrap colspan="3" ><%= deal.getE01DLSOT2().trim()%></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%" align="right">Dealer :</td>
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
</body>
</html>
