<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Foreign Exchange Module</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id="fex" class="datapro.eibs.beans.EFE0140DSMessage"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   

   builtHPopUp();

  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }


</SCRIPT>

<SCRIPT Language="Javascript">

   builtNewMenu(swa_bo_opt);

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
<h3 align="center"> Foreign Exchange Swap <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="ln_basic.jsp,EDL0150"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0140" >
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
                <input type="hidden" name="D01WKFCP1"  value="<%= fex.getD01WKFCP1()%>" >
                <%= fex.getD01WKFCP1()%> </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" > 
              <div align="right"><b>Location :</b></div>
            </td>
            <td nowrap colspan="3" width="85%" > 
              <input type="hidden" name="D01WKFCP2"  value="<%= fex.getD01WKFCP2()%>" readonly>
              <%= fex.getD01WKFCP2()%></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" > 
              <div align="right"></div>
            </td>
            <td nowrap colspan="3" width="85%" > <font face="Arial"><font face="Arial"><font face="Arial"><font face="Arial"><font size="2"> 
              <input type="hidden" name="D01WKFCP3"  value="<%= fex.getD01WKFCP3()%>" readonly>
              </font></font></font></font></font><%= fex.getD01WKFCP3()%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" > 
              <div align="right"><b>Account Number :</b></div>
            </td>
            <td nowrap colspan="3" width="85%" ><font face="Arial"><font face="Arial"><font face="Arial"><font face="Arial"><font size="2"> 
              <input type="hidden" name="E01WKFACC"  value="<%= fex.getD01WKFCP3()%>" readonly>
              </font></font></font></font></font><%= fex.getE01WKFACC()%></td>
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
              <div align="right">Reference Number :</div>
            </td>
            <td nowrap ><%= fex.getE01WKFREF()%></td>
            <td nowrap >&nbsp;</td>
            <td nowrap > 
              <div align="right">Date :<%= Util.formatDate(fex.getE01WKFDD1(),fex.getE01WKFDD2(),fex.getE01WKFDD3())%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="18%" > 
              <div align="right">Broker :</div>
            </td>
            <td nowrap width="31%" > <%= fex.getE01WKFBRK()%> - <%= fex.getD01FEBNM1()%> 
            </td>
            <td nowrap width="20%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="31%" >&nbsp; </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap colspan="4" >Action Taken :<% if(fex.getE01WKFSBT().equals("PU")) out.print("Purchase");
						else out.print("Sale");%></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="18%" > 
              <div align="right">Primary Currency :</div>
            </td>
            <td nowrap width="31%" > <%= fex.getE01WKFCCY().trim()%> : <%= Util.fcolorCCY(fex.getE01WKFSOA())%> 
              <input type="hidden" name="E01WKFCCY"  value="<%= fex.getE01WKFCCY()%>" >
            </td>
            <td nowrap width="20%" > 
              <div align="right">Spot Rate :</div>
            </td>
            <td nowrap width="31%"> <%= fex.getE01WKFEXR()%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="18%" > 
              <div align="right">Derivated Currency :</div>
            </td>
            <td nowrap width="31%" ><%= fex.getE01WKFDCY().trim()%> : <%= Util.fcolorCCY(fex.getE01WKFDOA())%> 
            </td>
            <td nowrap align="right" width="20%">Spot Date :</td>
            <td nowrap width="31%"> <%= Util.formatDate(fex.getE01WKFVD1(),fex.getE01WKFVD2(),fex.getE01WKFVD3())%> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap colspan="4" > 
              <div align="left">Action Taken :<% if(fex.getE01WKFSBT().equals("PU")) out.print("Sale");
						else out.print("Purchase");%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="18%" > 
              <div align="right">Forward Primary Amount :</div>
            </td>
            <td nowrap width="31%" > <%= fex.getE01WKFCCY().trim()%> : <%= Util.fcolorCCY(fex.getE01WKFSOA())%> 
            </td>
            <td nowrap align="right" width="20%"> 
              <div align="right">Forward Rate :</div>
            </td>
            <td nowrap width="31%"><%= fex.getE01WKFBRF()%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="18%" > 
              <div align="right">Forward Counter Amount :</div>
            </td>
            <td nowrap ><%= fex.getE01WKFDCY().trim()%> : <%= Util.fcolorCCY(fex.getE01WKFAM2())%></td>
            <td nowrap > 
              <div align="right">Forward Date :</div>
            </td>
            <td nowrap ><%= Util.formatDate(fex.getE01WKFMA1(),fex.getE01WKFMA2(),fex.getE01WKFMA3())%></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="18%" > 
              <div align="right">Dealer :</div>
            </td>
            <td nowrap colspan="3" ><%= fex.getE01WKFDID()%> - <%= fex.getD01FEGDSC()%></td>
          </tr>
          <tr id="trclear">
            <td nowrap width="18%" >
              <div align="right">Payment Type :</div>
            </td>
            <td nowrap  ><% if(fex.getE01FESTIN().equals("C")) out.print("CLS");
						else out.print("Standard");%></td>
            <td nowrap > 
              <div align="right">Line of Credit :</div>
            </td>
            <td nowrap >
			  <%= fex.getE01WKFLCU().trim()%>
			  &nbsp;/&nbsp;
              <%= fex.getE01WKFCMM().trim()%>			
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
            <td nowrap colspan="2" > 
              <input type="text" readonly  name="E01WKFCLS" size="5" maxlength="4" value="<%= fex.getE01WKFCLS()%>" 
			  >
            </td>
            <td nowrap colspan="2" > 
              <div align="right">Forward Classification :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" readonly  name="E01WKFFLS" size="5" maxlength="4" value="<%= fex.getE01WKFFLS()%>" 
			  >
              </div>
            </td>
            <td nowrap >&nbsp;</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Revaluation Type :</div>
            </td>
            <td nowrap colspan="2" > 
              <div align="left"> 
                <input type="text" readonly  name="E01WKFRVF" size="3" maxlength="1" value="<%= fex.getE01WKFRVF()%>" 
			  >
              </div>
            </td>
            <td nowrap colspan="2" > 
              <div align="right">Confirmation Type :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" readonly  name="E01WKFNTF" size="3" maxlength="1" value="<%= fex.getE01WKFNTF()%>" 
			  >
              </div>
            </td>
            <td nowrap width="17%" >&nbsp;</td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Spot Payment Via :</div>
            </td>
            <td nowrap colspan="2" > 
              <div align="left"> 
                <input type="text" readonly  name="E01WKFBPV" size="3" maxlength="1" value="<%= fex.getE01WKFBPV()%>" 
			  >
              </div>
            </td>
            <td nowrap colspan="2" >
              <div align="right">Forward Payment Via :</div>
            </td>
            <td nowrap >
              <input type="text" readonly  name="E01WKFBCT" size="3" maxlength="1" value="<%= fex.getE01WKFBCT()%>" 
			  >
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
              <div align="center"> 
                <input type="text" readonly  name="E01WKFOBK" size="2" maxlength="2" value="<%= fex.getE01WKFOBK()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E01WKFOBR" size="3" maxlength="3">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E01WKFOCY" size="3" maxlength="3" value="<%= fex.getE01WKFOCY()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E01WKFOGL" size="15" maxlength="13" value="<%= fex.getE01WKFOGL()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E01WKFOAC" size="12" maxlength="9" value="<%= fex.getE01WKFOAC()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E01WKFOCC" size="12" maxlength="9" value="<%= fex.getE01WKFOCC()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Vostro Spot Account :</div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E01WKFCBK" size="2" maxlength="2" value="<%= fex.getE01WKFCBK()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E01WKFCBR" size="3" maxlength="3" value="<%= fex.getE01WKFCBR()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E01WKFCCU" size="3" maxlength="3" value="<%= fex.getE01WKFCCU()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E01WKFCGL" size="15" maxlength="13" value="<%= fex.getE01WKFCGL()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E01WKFCAC" size="12" maxlength="9" value="<%= fex.getE01WKFCAC()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E01WKFCCC" size="12" maxlength="9" value="<%= fex.getE01WKFCCC()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Vostro Forward Account :</div>
            </td>
            <td nowrap > 
              <div align="center">
                <input type="text" readonly  name="E01WKFFBK" size="2" maxlength="2" value="<%= fex.getE01WKFFBK()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center">
                <input type="text" readonly  name="E01WKFFBR" size="3" maxlength="3" value="<%= fex.getE01WKFFBR()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center">
                <input type="text" readonly  name="E01WKFFCU" size="3" maxlength="3" value="<%= fex.getE01WKFFCU()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center">
                <input type="text" readonly  name="E01WKFFGL" size="15" maxlength="13" value="<%= fex.getE01WKFFGL()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center">
                <input type="text" readonly  name="E01WKFFAC" size="12" maxlength="9" value="<%= fex.getE01WKFFAC()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center">
                <input type="text" readonly  name="E01WKFFCC" size="12" maxlength="9" value="<%= fex.getE01WKFFCC()%>">
              </div>
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
            <td nowrap  align="right">Fees (1) : </td>
            <td nowrap align="center"> 
                <input type="text" readonly name="E01WKFFTP" size="3" maxlength="2" value="<%= fex.getE01WKFFTP()%>">
            </td>
            <td nowrap align="center"> 
            </td>
            <td nowrap align="center"> 
                <input type="text" name="E01WKFC1Y" size="4" maxlength="3" value="<%= fex.getE01WKFC1Y()%>" readonly>
            </td>
            <td nowrap align="center"> 
                <input type="text" name="E01WKFC1G" size="13" maxlength="12" value="<%= fex.getE01WKFC1G()%>" readonly>
            </td>
            <td nowrap align="center"> 
                <input type="text" name="E01WKFC1A" size="16" maxlength="15" value="<%= fex.getE01WKFC1A()%>" readonly>
            </td>
            <td nowrap align="center"> 
            </td>
          </tr>
		<tr id="trclear"> 
            <td nowrap align="right">Fees (2) : </td>
            <td nowrap align="center"> 
            </td>
            <td nowrap align="center"> 
            </td>
            <td nowrap align="center"> 
                <input type="text" name="E01WKFC2Y" size="4" maxlength="3" value="<%= fex.getE01WKFC2Y()%>" readonly>
            </td>
            <td nowrap align="center"> 
                <input type="text" name="E02FESC1G" size="13" maxlength="12" value="<%= fex.getE01WKFC2G()%>" readonly>
            </td>
            <td nowrap align="center"> 
                <input type="text" name="E01WKFC2A" size="16" maxlength="15" value="<%= fex.getE01WKFC2A()%>" readonly>
            </td>
            <td nowrap align="center"> 
            </td>
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
  
  </form>
</body>
</html>