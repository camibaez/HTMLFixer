<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Foreign Exchange Module</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">



<jsp:useBean id="fex" class="datapro.eibs.beans.EFE0120DSMessage"  scope="session" />

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
<h3 align="center"> Foreign Exchange Swap (Back Office) </h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0120B" >
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
                <input type="hidden" name="D01FESCP1"  value="<%= fex.getD01FESCP1()%>" >
                <%= fex.getD01FESCP1()%> </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" > 
              <div align="right"><b>Location :</b></div>
            </td>
            <td nowrap colspan="3" width="85%" > 
              <input type="hidden" name="D01FESCP2"  value="<%= fex.getD01FESCP2()%>" readonly>
              <%= fex.getD01FESCP2()%></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" > 
              <div align="right"></div>
            </td>
            <td nowrap colspan="3" width="85%" > <font face="Arial"><font face="Arial"><font face="Arial"><font face="Arial"><font size="2"> 
              <input type="hidden" name="D01FESCP3"  value="<%= fex.getD01FESCP3()%>" readonly>
              </font></font></font></font></font><%= fex.getD01FESCP3()%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" > 
              <div align="right"><b>Account Number :</b></div>
            </td>
            <td nowrap colspan="3" width="85%" ><font face="Arial"><font face="Arial"><font face="Arial"><font face="Arial"><font size="2"> 
              <input type="hidden" name="E01FESACC"  value="<%= fex.getE01FESACC()%>" readonly>
              </font></font></font></font></font><%= fex.getE01FESACC()%></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Basic Information<b>
    <input type="hidden" name="SCREEN"  value="16" >
    </b></h4>
  <table  class="tableinfo" width="100%">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Date :</div>
            </td>
            <td nowrap > 
              <div align="left"><%= Util.formatDate(fex.getE01FESDD1(),fex.getE01FESDD2(),fex.getE01FESDD3())%></div>
            </td>
            <td nowrap > 
              <div align="right">Time :</div>
            </td>
            <td nowrap > 
              <div align="left"><%= userPO.getHeader8()%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Reference Number :</div>
            </td>
            <td nowrap ><%= fex.getE01FESREF()%></td>
            <td nowrap >&nbsp;</td>
            <td nowrap > 
              <div align="right"></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="18%" > 
              <div align="right">Broker :</div>
            </td>
            <td nowrap width="31%" > <%= fex.getE01FESBRK()%> - <%= fex.getD01FEBNM1()%> 
            </td>
            <td nowrap width="20%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="31%" >&nbsp; </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap colspan="4" >Action Taken :<% if(fex.getE01FESSBT().equals("PU")) out.print("Purchase ");
						else out.print("Sale ");%></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="18%" > 
              <div align="right">Primary Currency :</div>
            </td>
            <td nowrap width="31%" > <%= fex.getE01FESCCY().trim()%> : <%= Util.fcolorCCY(fex.getE01FESAMN())%> 
              <input type="hidden" name="E01FESCCY"  value="<%= fex.getE01FESCCY()%>" >
            </td>
            <td nowrap width="20%" > 
              <div align="right">Spot Rate :</div>
            </td>
            <td nowrap width="31%"> <%= fex.getE01FESEXR()%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="18%" > 
              <div align="right">Counter Currency :</div>
            </td>
            <td nowrap width="31%" ><%= fex.getE01FESDCY().trim()%> : <%= Util.fcolorCCY(fex.getE01FESDAM())%> 
            </td>
            <td nowrap align="right" width="20%">Spot Date :</td>
            <td nowrap width="31%"> <%= Util.formatDate(fex.getE01FESVD1(),fex.getE01FESVD2(),fex.getE01FESVD3())%> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap colspan="4" > 
              <div align="left">Action Taken :<% if(fex.getE01FESSBT().equals("PU")) out.print("Sale");
						else out.print("Purchase");%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="18%" > 
              <div align="right">Forward Primary Amount :</div>
            </td>
            <td nowrap width="31%" ><%= fex.getE01FESCCY().trim()%> : <%= Util.fcolorCCY(fex.getE01FESAM1())%> 
            </td>
            <td nowrap align="right" width="20%"> 
              <div align="right">Forward Rate :</div>
            </td>
            <td nowrap width="31%"><%= fex.getE01FESBRF()%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="18%" > 
              <div align="right">Forward Counter Amount :</div>
            </td>
            <td nowrap ><%= fex.getE01FESDCY().trim()%> : <%= Util.fcolorCCY(fex.getE01FESAM2())%></td>
            <td nowrap > 
              <div align="right">Forward Date :</div>
            </td>
            <td nowrap ><%= Util.formatDate(fex.getE01FESMA1(),fex.getE01FESMA2(),fex.getE01FESMA3())%></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="18%" > 
              <div align="right">Notes :</div>
            </td>
            <td nowrap colspan="3" ><%= fex.getE01FESOT1()%></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="18%" >&nbsp;</td>
            <td nowrap colspan="3" ><%= fex.getE01FESOT2()%></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="18%" > 
              <div align="right">Dealer :</div>
            </td>
            <td nowrap colspan="3" ><%= fex.getE01FESDID()%> - <%= fex.getD01FEGDSC()%></td>
          </tr>
          <tr id="trclear">
            <td nowrap width="18%" >
              <div align="right">Payment Type :</div>
            </td>
            <td nowrap colspan="3" >
              <div align="left"><% if(fex.getE01FESTIN().equals("C")) out.print("CLS");
						else out.print("Standard");%></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Additional Information</h4>
  <table  class="tableinfo" width="100%">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Spot Classification :</div>
            </td>
            <td nowrap colspan="2" > <%= fex.getE01FESCLS()%> </td>
            <td nowrap colspan="2" > 
              <div align="right">Forward Classification :</div>
            </td>
            <td nowrap ><%= fex.getE01FESFLS()%> </td>
            <td nowrap >&nbsp;</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Revaluation Type :</div>
            </td>
            <td nowrap colspan="2" > 
              <div align="left"><% if(fex.getE01FESRVF().equals("3")) out.print("Accrual Basic");
				 else if(fex.getE01FESRVF().equals("1")) out.print("Use Daily Spot Rate");
				 else if(fex.getE01FESRVF().equals("2")) out.print("Forward Rate");
				 else out.print("No Revaluation");%></div>
            </td>
            <td nowrap colspan="2" > 
              <div align="right">Confirmation Type :</div>
            </td>
            <td nowrap ><% if(fex.getE01FESCOT().equals("P")) out.print("Print Notification");
				 else if(fex.getE01FESCOT().equals("S")) out.print("Send Notification Via Swift");
				 else if(fex.getE01FESCOT().equals("H")) out.print("Send Notification Via Chip");
				 else if(fex.getE01FESCOT().equals("T")) out.print("Send Notification Via Telex");
				 else if(fex.getE01FESCOT().equals("F")) out.print("Send Notification Via Fax");
				 else out.print("No Notification");%></td>
            <td nowrap width="17%" >&nbsp;</td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Spot Payment Via :</div>
            </td>
            <td nowrap colspan="2" ><% if(fex.getE01FESBPV().equals("F")) out.print("Payment Via Fed");
				 else if(fex.getE01FESBPV().equals("1")) out.print("Payment Via Swift MT-103");
				 else if(fex.getE01FESBPV().equals("2")) out.print("Payment Via Swift MT - 200");
				 else if(fex.getE01FESBPV().equals("3")) out.print("Payment Via Swift MT- 202");
				 else if(fex.getE01FESBPV().equals("T")) out.print("Payment Via Telex");
				 else out.print("None");%> </td>
            <td nowrap colspan="2" > 
              <div align="right">Forward Payment Via :</div>
            </td>
            <td nowrap > 
              <div align="left"><% if(fex.getE01FESBCT().equals("F")) out.print("Payment Via Fed");
				 else if(fex.getE01FESBCT().equals("1")) out.print("Payment Via Swift MT-103");
				 else if(fex.getE01FESBCT().equals("2")) out.print("Payment Via Swift MT - 200");
				 else if(fex.getE01FESBCT().equals("3")) out.print("Payment Via Swift MT- 202");
				 else if(fex.getE01FESBCT().equals("T")) out.print("Payment Via Telex");
				 else out.print("None");%></div>
            </td>
            <td nowrap width="17%" >&nbsp;</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="center"></div>
            </td>
            <td nowrap > 
              <h5 align="center">Bank</h5>
            </td>
            <td nowrap> 
              <h5 align="center">Branch</h5>
            </td>
            <td nowrap > 
              <h5 align="center">CCY</h5>
            </td>
            <td nowrap > 
              <h5 align="center">G/L</h5>
            </td>
            <td nowrap > 
              <h5 align="center">Reference</h5>
            </td>
            <td nowrap > 
              <h5 align="center">Cost Center</h5>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Nostro Account :</div>
            </td>
            <td nowrap > 
              <div align="center"> <%= fex.getE01FESOBK()%> </div>
            </td>
            <td nowrap > 
              <div align="center"> <%= fex.getE01FESOBR()%> </div>
            </td>
            <td nowrap > 
              <div align="center"> <%= fex.getE01FESOCY()%> </div>
            </td>
            <td nowrap > 
              <div align="center"> <%= fex.getE01FESOGL()%> </div>
            </td>
            <td nowrap > 
              <div align="center"> <%= fex.getE01FESOAC()%> </div>
            </td>
            <td nowrap > 
              <div align="center"> <%= fex.getE01FESOCC()%> </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Vostro Spot Account :</div>
            </td>
            <td nowrap > 
              <div align="center"> <%= fex.getE01FESCBK()%> </div>
            </td>
            <td nowrap > 
              <div align="center"> <%= fex.getE01FESCBR()%> </div>
            </td>
            <td nowrap > 
              <div align="center"> <%= fex.getE01FESCCU()%> </div>
            </td>
            <td nowrap > 
              <div align="center"> <%= fex.getE01FESCGL()%> </div>
            </td>
            <td nowrap > 
              <div align="center"> <%= fex.getE01FESCAC()%> </div>
            </td>
            <td nowrap > 
              <div align="center"> <%= fex.getE01FESCCC()%> </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Vostro Forward Account :</div>
            </td>
            <td nowrap > 
              <div align="center"><%= fex.getE01FESFBK()%></div>
            </td>
            <td nowrap > 
              <div align="center"><%= fex.getE01FESFBR()%></div>
            </td>
            <td nowrap > 
              <div align="center"><%= fex.getE01FESFCU()%></div>
            </td>
            <td nowrap > 
              <div align="center"><%= fex.getE01FESFGL()%></div>
            </td>
            <td nowrap > 
              <div align="center"><%= fex.getE01FESFAC()%></div>
            </td>
            <td nowrap > 
              <div align="center"><%= fex.getE01FESFCC()%></div>
            </td>
          </tr>
          <tr id="trclear" > 
            <td nowrap align="center"></td>
            <td nowrap align="center"><h5>Table</h5></td>
            <td nowrap  align="center"><h5></h5></td>
            <td nowrap  align="center"><h5>CCY</h5></td>
            <td nowrap align="center"><h5>G/L</h5></td>
            <td nowrap align="center"><h5>Amount</h5></td>
            <td nowrap align="center"><h5></h5></td>
          </tr>
		<tr id="trdark"> 
            <td nowrap  align="right">Fees (1) :</td>
            <td nowrap align="center"><%= fex.getE01FESFTP()%></td>
            <td nowrap align="center"> </td>
            <td nowrap align="center"><%= fex.getE01FESC1Y()%></td>
            <td nowrap align="center"><%= fex.getE01FESC1G()%></td>
            <td nowrap align="center"><%= fex.getE01FESC1A()%></td>
            <td nowrap align="center"> </td>
          </tr>
		<tr id="trclear"> 
            <td nowrap align="right">Fees (2) : </td>
            <td nowrap align="center"> </td>
            <td nowrap align="center"></td>
            <td nowrap align="center"><%= fex.getE01FESC2Y()%></td>
            <td nowrap align="center"><%= fex.getE01FESC2G()%></td>
            <td nowrap align="center"><%= fex.getE01FESC2A()%></td>
            <td nowrap align="center"></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p><b>Limits</b></p>
  <table  class="tableinfo" width="100%">
    <tr > 
      <td nowrap> 
        <table width="100%">
          <tr id="trdark"> 
            <td nowrap  colspan="2"> 
              <div align="center"></div>
            </td>
            <td nowrap > 
              <div align="center"><b>Line of Credit</b></div>
            </td>
            <td nowrap > 
              <div align="center"><b>Daily Settlement</b></div>
            </td>
            <td nowrap > 
              <div align="right">Yesterday Position :</div>
            </td>
            <td nowrap ><%= Util.fcolorCCY(fex.getD01YTDBAL())%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap  colspan="2"> 
              <div align="right">Limit Amount :</div>
            </td>
            <td nowrap > 
              <div align="center"><%= Util.fcolorCCY(fex.getD01LIMAMT())%></div>
            </td>
            <td nowrap > 
              <div align="center"><%= Util.fcolorCCY(fex.getD01FEOLIM())%></div>
            </td>
            <td nowrap > 
              <div align="right">(+) Purchases :</div>
            </td>
            <td nowrap ><%= Util.fcolorCCY(fex.getD01TOTPUR())%> </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap colspan="2"> 
              <div align="right">Available Limit :</div>
            </td>
            <td nowrap > 
              <div align="center"> <%= Util.fcolorCCY(fex.getD01LIMAVL())%> </div>
            </td>
            <td nowrap > 
              <div align="center"> <%= Util.fcolorCCY(fex.getD01FEOAVL())%> </div>
            </td>
            <td nowrap > 
              <div align="right">(-) Sales :</div>
            </td>
            <td nowrap ><%= Util.fcolorCCY(fex.getD01TOTSAL())%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap  colspan="2"> 
              <div align="right">Ending Limit Amount :</div>
            </td>
            <td nowrap > 
              <div align="center"> <%= Util.fcolorCCY(fex.getD01LIMEND())%> </div>
            </td>
            <td nowrap > 
              <div align="center"> <%= Util.fcolorCCY(fex.getD01FEOEND())%> </div>
            </td>
            <td nowrap > 
              <div align="right">Available Position :</div>
            </td>
            <td nowrap ><%= Util.fcolorCCY(fex.getD01POSBAL())%> </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <font face="Arial"><font face="Arial"><font face="Arial"><font face="Arial"><font size="2"> 
  </font></font></font></font></font> <BR>
  </form>
</body>
</html>
