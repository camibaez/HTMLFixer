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
<h3 align="center">Commercial Paper<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="fe_cp, EDL0120">- 
  Dealer Slip</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0120" >
  <table class="tableinfo" width="100%" >
    <tr id="trclear"> 
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
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap colspan="4" > 
              <div align="right">Date :<%= Util.formatDate(deal.getE01DLSDD1(),deal.getE01DLSDD2(),deal.getE01DLSDD3())%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" > 
              <div align="right">Broker :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DLSBRK" size="4" maxlength="3" value="<%= deal.getE01DLSBRK()%>">
              <input type="text" name="D01FEBNM1" size="15" maxlength="15" value="<%= deal.getD01FEBNM1()%>">
              <a href="javascript:GetBrokerT('E01DLSBRK','D01FEBNM1')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0"></a> 
            </td>
            <td nowrap width="18%" > 
              <div align="right"> 
                <input type="hidden" name="E01DLSSBT" value="<%= deal.getE01DLSSBT()%>">
                Action Taken :</div>
            </td>
            <td nowrap width="20%" > Purchase</td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="21%" > 
              <div align="right">Currency :</div>
            </td>
            <td nowrap width="23%" > 
              <div align="left"> 
                <input type="text" name="E01DLSCCY" size="4" maxlength="3" value="<%= deal.getE01DLSCCY().trim()%>" >
                <a href="javascript:GetCurrency('E01DLSCCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0"></a> 
              </div>
            </td>
            <td nowrap align="right" width="18%">Trade Date :</td>
            <td nowrap width="20%"> 
              <input type="text" name="E01DLSDD1" size="3" maxlength="2" value="<%= deal.getE01DLSDD1().trim()%>" 
			  >
              <input type="text" name="E01DLSDD2" size="3" maxlength="2" value="<%= deal.getE01DLSDD2().trim()%>" 
			  >
              <input type="text" name="E01DLSDD3" size="3" maxlength="2" value="<%= deal.getE01DLSDD3().trim()%>" 
			  >
              <a href="javascript:DatePicker(document.forms[0].E01DLSDD1,document.forms[0].E01DLSDD2,document.forms[0].E01DLSDD3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="21%" > 
              <div align="right">Par Value / Face Value : </div>
            </td>
            <td nowrap width="23%" > 
              <div align="left"> 
                <input type="text" name="E01DLSAMN" size="15" maxlength="13" value="<%= deal.getE01DLSAMN()%>" 
			  onKeyPress="enterDecimal()">
              </div>
            </td>
            <td nowrap align="right" width="18%">Settlement/Value Date :</td>
            <td nowrap width="20%"> 
              <input type="text" name="E01DLSVD1" size="3" maxlength="2" value="<%= deal.getE01DLSVD1().trim()%>" 
			  >
              <input type="text" name="E01DLSVD2" size="3" maxlength="2" value="<%= deal.getE01DLSVD2().trim()%>" 
			  >
              <input type="text" name="E01DLSVD3" size="3" maxlength="2" value="<%= deal.getE01DLSVD3().trim()%>" 
			  >
              <a href="javascript:DatePicker(document.forms[0].E01DLSVD1,document.forms[0].E01DLSVD2,document.forms[0].E01DLSVD3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="21%" > 
              <div align="right">Principal / Total Amount :</div>
            </td>
            <td nowrap width="23%" > 
              <div align="left"> 
                <input type="text" name="E01DLSAMN2" size="15" maxlength="13" value="<%= deal.getE01DLSAMN()%>" 
			  onKeyPress="enterDecimal()">
              </div>
            </td>
            <td nowrap align="right" width="18%">Terms :</td>
            <td nowrap width="20%"> 
              <input type="text" name="E01DLSAMN4" size="3" maxlength="13" value="<%= deal.getE01DLSAMN()%>" 
			  onKeyPress="enterDecimal()">
              <input type="text" name="E01DLSVD32" size="3" maxlength="2" value="<%= deal.getE01DLSVD3().trim()%>" 
			  >
              <a href="javascript:DatePicker(document.forms[0].E01DLSVD1,document.forms[0].E01DLSVD2,document.forms[0].E01DLSVD3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="21%" > 
              <div align="right">Accrued Interest :</div>
            </td>
            <td nowrap width="23%" > 
              <div align="left"> 
                <input type="text" name="E01DLSAMN3" size="15" maxlength="13" value="<%= deal.getE01DLSAMN()%>" 
			  onKeyPress="enterDecimal()">
              </div>
            </td>
            <td nowrap align="right" width="18%">Yield :</td>
            <td nowrap width="20%"> 
              <input type="text" name="E01DLSRA2" size="11" maxlength="11" value="<%= deal.getE01DLSRA2().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="21%" > 
              <div align="right">Net Proceeds :</div>
            </td>
            <td nowrap width="23%" > 
              <div align="left"> 
                <input type="text" name="E01DLSAM1" size="15" maxlength="13" value="<%= deal.getE01DLSAM1()%>" 
			  onKeyPress="enterDecimal()">
              </div>
            </td>
            <td nowrap align="right" width="18%">Bid / Offer Price :</td>
            <td nowrap width="20%"> 
              <input type="text" name="E01DLSRA12" size="11" maxlength="11" value="<%= deal.getE01DLSRA1().trim()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" > 
              <div align="right">Accrual Type &amp; Basis :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DLSAM12" size="5" maxlength="13" value="<%= deal.getE01DLSAM1()%>" 
			  onKeyPress="enterDecimal()">
              / 
              <input type="text" name="E01DLSAM122" size="5" maxlength="13" value="<%= deal.getE01DLSAM1()%>" 
			  onKeyPress="enterDecimal()">
            </td>
            <td nowrap align="right" width="18%"> 
              <div align="right">Coupon Payment Period :</div>
            </td>
            <td nowrap width="20%"> 
              <input type="text" name="E01DLSAMN42" size="3" maxlength="13" value="<%= deal.getE01DLSAMN()%>" 
			  onKeyPress="enterDecimal()">
              <input type="text" name="E01DLSVD322" size="3" maxlength="2" value="<%= deal.getE01DLSVD3().trim()%>" 
			  >
              <a href="javascript:DatePicker(document.forms[0].E01DLSVD1,document.forms[0].E01DLSVD2,document.forms[0].E01DLSVD3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="21%" > 
              <div align="right">Investment Type :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DLSAM123" size="5" maxlength="13" value="<%= deal.getE01DLSAM1()%>" 
			  onKeyPress="enterDecimal()">
            </td>
            <td nowrap align="right" width="18%"> 
              <div align="right">Coupon Rate :</div>
            </td>
            <td nowrap width="20%"> 
              <input type="text" name="E01DLSRA122" size="11" maxlength="11" value="<%= deal.getE01DLSRA1().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="21%" > 
              <div align="right">CUSIP/ ISIN Code :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DLSTHR" size="15" maxlength="15" value="<%= deal.getE01DLSTHR()%>" >
            </td>
            <td nowrap align="right" width="18%"> 
              <div align="right">Cost Center :</div>
            </td>
            <td nowrap width="20%"> 
              <input type="text" name="E01DLSVD3222" size="3" maxlength="2" value="<%= deal.getE01DLSVD3().trim()%>" 
			  >
              <a href="javascript:DatePicker(document.forms[0].E01DLSVD1,document.forms[0].E01DLSVD2,document.forms[0].E01DLSVD3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" > 
              <div align="right">Common Code Number :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DLSTHR2" size="15" maxlength="15" value="<%= deal.getE01DLSTHR()%>" >
            </td>
            <td nowrap align="right" width="18%"> 
              <div align="right">Payment Via :</div>
            </td>
            <td nowrap width="20%"> 
              <input type="text" name="E01DLSVD3223" size="3" maxlength="2" value="<%= deal.getE01DLSVD3().trim()%>" 
			  >
              <a href="javascript:DatePicker(document.forms[0].E01DLSVD1,document.forms[0].E01DLSVD2,document.forms[0].E01DLSVD3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" > 
              <div align="right">Notes :</div>
            </td>
            <td nowrap colspan="3" > 
              <input type="text" name="E01DLSOT1" size="70" maxlength="60" value="<%= deal.getE01DLSOT1().trim()%>" 
			  >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="21%" > 
              <div align="right"></div>
            </td>
            <td nowrap colspan="3" > 
              <input type="text" name="E01DLSOT2" size="70" maxlength="60" value="<%= deal.getE01DLSOT2().trim()%>" 
			  >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" > 
              <div align="right">Dealer :</div>
            </td>
            <td nowrap colspan="3" ><%= deal.getE01DLSDID().trim()%> - <%= deal.getD01USRDSC().trim()%></td>
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
