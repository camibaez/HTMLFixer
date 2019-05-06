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
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

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
<h3 align="center"> Inquiry of <%= !currUser.getH01WK3().equals("1") ?" Overnight Funds":" Federal Funds"%><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="fe_ffs.jsp, EDL0120I"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0120" >
  <input type=HIDDEN name="SCREEN" value="16">
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
                <input type="hidden" name="D01DLSCP1"  value="<%= deal.getD01DLSCP1()%>" >
                <%= deal.getD01DLSCP1()%> </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="15%" >
              <div align="right"><b>Location :</b></div>
            </td>
            <td nowrap colspan="3" width="85%" >
              <input type="hidden" name="D01DLSCP2"  value="<%= deal.getD01DLSCP2()%>" >
              <%= deal.getD01DLSCP2()%></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" > 
              <div align="right"></div>
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
            <td nowrap > 
              <div align="right">Date :</div>
            </td>
            <td nowrap > <%= Util.formatDate(deal.getE01DLSDD1(),deal.getE01DLSDD2(),deal.getE01DLSDD3())%></td>
            <td nowrap > 
              <div align="right"> 
                <input type="hidden" name="E01DLSSBT" value="<%= deal.getE01DLSSBT()%>">
              </div>
            </td>
            <td nowrap > 
              <input type="radio" name="CE01DLSSBT" value="PU" onClick="document.forms[0].E01DLSSBT.value='PU'"
			  <%if(deal.getE01DLSSBT().equals("PU")) out.print("checked");%> disabled >
              Purchase 
              <input type="radio" name="CE01DLSSBT" value="SL" onClick="document.forms[0].E01DLSSBT.value='SL'"
			  <%if(deal.getE01DLSSBT().equals("SL")) out.print("checked");%> disabled>
              Sale</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Broker :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly  name="E01DLSBRK" size="4" maxlength="3" value="<%= deal.getE01DLSBRK()%>">
              <input type="text" readonly  name="D01FEBNM1" size="15" maxlength="15" value="<%= deal.getD01FEBNM1()%>">
            </td>
            <td nowrap > 
              <div align="right"> Currency :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly  name="E01DLSCCY" size="4" maxlength="3" value="<%= deal.getE01DLSCCY().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Amount :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly  name="E01DLSAMN" size="15" maxlength="13" value="<%= deal.getE01DLSAMN()%>" 
			  onKeyPress="enterDecimal()">
            </td>
            <td nowrap > 
              <div align="right">Rate :</div>
            </td>
            <td nowrap> 
              <input type="text" readonly  name="E01DLSRA1" size="11" maxlength="11" value="<%= deal.getE01DLSRA1()%>" 
			  >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Value Date :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly  name="E01DLSVD1" size="3" maxlength="2" value="<%= deal.getE01DLSVD1().trim()%>" 
			  >
              <input type="text" readonly  name="E01DLSVD2" size="3" maxlength="2" value="<%= deal.getE01DLSVD2().trim()%>" 
			  >
              <input type="text" readonly  name="E01DLSVD3" size="3" maxlength="2" value="<%= deal.getE01DLSVD3().trim()%>" 
			  >
            </td>
            <td nowrap align="right">Maturity Date :</td>
            <td nowrap> 
              <input type="text" readonly  name="E01DLSMA1" size="3" maxlength="2" value="<%= deal.getE01DLSMA1().trim()%>" 
			  >
              <input type="text" readonly  name="E01DLSMA2" size="3" maxlength="2" value="<%= deal.getE01DLSMA2().trim()%>" 
			  >
              <input type="text" readonly  name="E01DLSMA3" size="3" maxlength="2" value="<%= deal.getE01DLSMA3().trim()%>" 
			  >
              <input type="hidden" name="E01DLSCMM"  value="<%= deal.getE01DLSCMM()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Notes :</div>
            </td>
            <td nowrap colspan="3" >
              <input type="text" readonly  name="E01DLSOT1" size="70" maxlength="60" value="<%= deal.getE01DLSOT1().trim()%>" 
			  >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right"></div>
            </td>
            <td nowrap colspan="3" >
              <input type="text" readonly  name="E01DLSOT2" size="70" maxlength="60" value="<%= deal.getE01DLSOT2().trim()%>" 
			  >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Dealer :</div>
            </td>
            <td nowrap  ><%= deal.getE01DLSDID().trim()%> - <%= deal.getD01PRDDSC().trim()%></td>
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
  <table  class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table width="100%">
          <tr id="trdark">
            <td nowrap>&nbsp;</td>
            <td nowrap  colspan="2"> 
              <div align="center"><b>Limit Amount </b></div>
            </td>
            <td nowrap > 
              <div align="center"><b>Available Limit</b></div>
            </td>
            <td nowrap > 
              <div align="center"><b>Ending Limit Amount </b></div>
            </td>
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
<font size="2">
<input type="hidden" name="D01DLSCP3"  value="<%= deal.getD01DLSCP3()%>">
</font>
</body>
</html>
