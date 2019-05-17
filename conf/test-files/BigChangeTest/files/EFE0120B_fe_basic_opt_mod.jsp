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

<SCRIPT Language="Javascript">

   builtNewMenu(op_bo_opt);

</SCRIPT>

</head>
<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

 out.println("<SCRIPT> initMenu();  </SCRIPT>");
%> 
<h3 align="center"> Foreign Exchange Currency Options (Back Office) </h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0120B" >
  <table class="tableinfo" width="100%" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trclear"> 
            <td nowrap width="15%" > 
              <div align="right"><b> 
                <input type=HIDDEN name="SCREEN" value="24">
                Counterparty :</b></div>
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
              <input type="hidden" name="D01FESCP2"  value="<%= fex.getD01FESCP2()%>" >
              <%= fex.getD01FESCP2()%></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" > 
              <div align="right"></div>
            </td>
            <td nowrap colspan="3" width="85%" > 
              <input type="hidden" name="D01FESCP3"  value="<%= fex.getD01FESCP3()%>" >
              <%= fex.getD01FESCP3()%> </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="15%" >
              <div align="right"><b>Account Number :</b></div>
            </td>
            <td nowrap colspan="3" width="85%" >
              <input type="hidden" name="E01FESACC"  value="<%= fex.getE01FESACC()%>" >
              <%= fex.getE01FESACC()%></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Basic Information </h4>
  <table  class="tableinfo" width="100%">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trclear"> 
            <td nowrap width="23%" > 
              <div align="right">Reference Number :</div>
            </td>
            <td nowrap > 
              <div align="left"><%= fex.getE01FESREF()%></div>
            </td>
            <td nowrap > 
              <div align="right">Date :</div>
            </td>
            <td nowrap ><%= Util.formatDate(fex.getE01FESDD1(),fex.getE01FESDD2(),fex.getE01FESDD3())%></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="23%" > 
              <div align="right">Action Taken :</div>
            </td>
            <td nowrap colspan="3" ><% if(fex.getE01FESSBT().equals("BC")) out.print("Buy Call Option");
										else if(fex.getE01FESSBT().equals("WC")) out.print("Write Call Option");
										else if(fex.getE01FESSBT().equals("BP")) out.print("Buy a Put");
										else if(fex.getE01FESSBT().equals("WP")) out.print("Write a Put");
						                else out.print("No Action Taken");%></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="23%" > 
              <div align="right">Broker :</div>
            </td>
            <td nowrap colspan="3" ><%= fex.getE01FESBRK()%> - <%= fex.getD01FEBNM1()%> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="23%" > 
              <div align="right">Primary Currency :</div>
            </td>
            <td nowrap width="38%" > <%= fex.getE01FESCCY().trim()%> : <%= Util.fcolorCCY(fex.getE01FESAMN())%></td>
            <td nowrap width="16%" > 
              <div align="right">Option Type :</div>
            </td>
            <td nowrap width="23%" > 
              <div align="left"><% if(fex.getE01FESOPT().equals("1")) out.print("American");
						                else out.print("European");%> </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="23%" > 
              <div align="right">Counter Currency :</div>
            </td>
            <td nowrap width="38%" ><%= fex.getE01FESDCY().trim()%> : <%= Util.fcolorCCY(fex.getE01FESDAM())%></td>
            <td nowrap width="16%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="23%" > 
              <div align="left"> </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="23%" > 
              <div align="right">Strike Price :</div>
            </td>
            <td nowrap width="38%" > <%= Util.fcolorCCY(fex.getE01FESEXR())%> 
            </td>
            <td nowrap width="16%" > 
              <div align="right">Deal Date :</div>
            </td>
            <td nowrap width="23%"> 
              <div align="left"><%= Util.formatDate(fex.getE01FESVD1(),fex.getE01FESVD2(),fex.getE01FESVD3())%> 
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="23%" > 
              <div align="right">Term :</div>
            </td>
            <td nowrap width="38%" ><%= fex.getE01FESTRM().trim()%> - <% if(fex.getE01FESTRC().equals("M")) out.print("Month(s)");
																		  else if(fex.getE01FESTRC().equals("D")) out.print("Day(s)");
						                								  else out.print("Year(s)");%> 
            </td>
            <td nowrap width="16%" > 
              <div align="right">Maturity Date :</div>
            </td>
            <td nowrap width="23%" > 
              <div align="left"><%= Util.formatDate(fex.getE01FESMA1(),fex.getE01FESMA2(),fex.getE01FESMA3())%> 
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="23%" > 
              <div align="right">Settlement Via :</div>
            </td>
            <td nowrap > 
              <div align="left"> <% if(fex.getE01FESCOT().equals("F")) out.print("Fax");
              				else if(fex.getE01FESCOT().equals("S")) out.print("Swift");
							else if(fex.getE01FESCOT().equals("H")) out.print("Chip");
							else if(fex.getE01FESCOT().equals("T")) out.print("Telex");
							else if(fex.getE01FESCOT().equals("P")) out.print("Printer");
							else out.print("None");%> </div>
            </td>
            <td nowrap > 
              <div align="right">Reference Spot :</div>
            </td>
            <td nowrap > 
              <div align="left"> <%= fex.getE01FESSPR()%> </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap height="35" width="23%" > 
              <div align="right">Notes :</div>
            </td>
            <td nowrap height="35" colspan="3" > 
              <div align="left"> <%= fex.getE01FESOT1()%> </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="23%" > 
              <div align="right"></div>
            </td>
            <td nowrap colspan="3" > <%= fex.getE01FESOT2()%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="23%" > 
              <div align="right">Dealer :</div>
            </td>
            <td nowrap colspan="3" ><%= fex.getE01FESDID()%> - <%= fex.getD01FEGDSC().trim()%> 
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="23%" >
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
              <div align="right">Classification :</div>
            </td>
            <td nowrap colspan="2" > <%= fex.getE01FESCLS()%> </td>
            <td nowrap colspan="2" > 
              <div align="right">Revaluation Type :</div>
            </td>
            <td nowrap > <% if(fex.getE01FESRVF().equals("3")) out.print("Accrual Basic");
				 else if(fex.getE01FESRVF().equals("1")) out.print("Use Daily Spot Rate");
				 else if(fex.getE01FESRVF().equals("2")) out.print("Forward Rate");
				 else out.print("No Revaluation");%> </td>
            <td nowrap >&nbsp;</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Confirmation Type :</div>
            </td>
            <td nowrap colspan="2" > <% if(fex.getE01FESCOT().equals("P")) out.print("Print Notification");
				 else if(fex.getE01FESCOT().equals("S")) out.print("Send Notification Via Swift");
				 else if(fex.getE01FESCOT().equals("H")) out.print("Send Notification Via Chip");
				 else if(fex.getE01FESCOT().equals("T")) out.print("Send Notification Via Telex");
				 else if(fex.getE01FESCOT().equals("F")) out.print("Send Notification Via Fax");
				 else out.print("No Notification");%> </td>
            <td nowrap colspan="2" > 
              <div align="right">Payment Via :</div>
            </td>
            <td nowrap > <% if(fex.getE01FESBPV().equals("F")) out.print("Payment Via Fed");
				 else if(fex.getE01FESBPV().equals("1")) out.print("Payment Via Swift MT-103");
				 else if(fex.getE01FESBPV().equals("2")) out.print("Payment Via Swift MT - 200");
				 else if(fex.getE01FESBPV().equals("3")) out.print("Payment Via Swift MT- 202");
				 else if(fex.getE01FESBPV().equals("T")) out.print("Payment Via Telex");
				 else out.print("None");%> </td>
            <td nowrap width="17%" >&nbsp;</td>
          </tr>
          <tr id="trdark"> 
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
          <tr id="trclear"> 
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
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Vostro Account :</div>
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
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td> 
        <div align="center"> </div>
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
    <tr bgcolor="#FFFFFF"> 
      <td> 
        <div align="center"> </div>
      </td>
    </tr>
  </table>

</form>
</body>
</html>
