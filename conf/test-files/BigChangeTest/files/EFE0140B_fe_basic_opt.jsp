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

   builtNewMenu(opm_bo_opt);

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
<h3 align="center"> Foreign Exchange Currency Options </h3>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="fe_basic_opt.jsp, EFE0140B"> 
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
  <h4>Basic Information <b>
    <input type=HIDDEN name="SCREEN" value="12">
    </b></h4>
  <table  class="tableinfo" width="100%">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trclear"> 
            <td nowrap width="23%" > 
              <div align="right">Reference Number :</div>
            </td>
            <td nowrap > 
              <div align="left"><%= fex.getE01WKFREF()%></div>
            </td>
            <td nowrap >&nbsp;</td>
            <td nowrap >Date :<%= Util.formatDate(fex.getE01WKFDD1(),fex.getE01WKFDD2(),fex.getE01WKFDD3())%></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="23%" > 
              <div align="right">Broker :</div>
            </td>
            <td nowrap colspan="3" ><%= fex.getE01WKFBRK()%> - <%= fex.getD01FEBNM1()%></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="23%" > 
              <div align="right">Action Taken :</div>
            </td>
            <td nowrap colspan="3" > <% if(fex.getE01WKFSBT().equals("BC")) out.print("Buy Call Option");
										else if(fex.getE01WKFSBT().equals("WC")) out.print("Write Call Option");
										else if(fex.getE01WKFSBT().equals("BP")) out.print("Buy a Put");
										else if(fex.getE01WKFSBT().equals("WP")) out.print("Write a Put");
						                else out.print("No Action Taken");%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="23%" > 
              <div align="right">Primary Currency :</div>
            </td>
            <td nowrap width="38%" > <%= fex.getE01WKFCCY().trim()%> : <%= Util.fcolorCCY(fex.getE01WKFSOA())%></td>
            <td nowrap width="16%" > 
              <div align="right">Option Type :</div>
            </td>
            <td nowrap width="23%" > 
              <div align="left"><% if(fex.getE01WKFOPT().equals("1")) out.print("American");
						                else out.print("European");%> </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="23%" > 
              <div align="right">Counter Currency :</div>
            </td>
            <td nowrap width="38%" ><%= fex.getE01WKFDCY().trim()%> : <%= Util.fcolorCCY(fex.getE01WKFDOA())%> 
            </td>
            <td nowrap width="16%" > 
              <div align="right">Deal Date :</div>
            </td>
            <td nowrap width="23%" > 
              <div align="left"><%= Util.formatDate(fex.getE01WKFVD1(),fex.getE01WKFVD2(),fex.getE01WKFVD3())%> 
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="23%" > 
              <div align="right">Term :</div>
            </td>
            <td nowrap width="38%" ><%= fex.getE01WKFTRM().trim()%> - <% if(fex.getE01WKFTRC().equals("M")) out.print("Month(s)");
																		  else if(fex.getE01WKFTRC().equals("D")) out.print("Day(s)");
						                								  else out.print("Year(s)");%> 
            </td>
            <td nowrap width="16%" > 
              <div align="right">Maturity Date :</div>
            </td>
            <td nowrap width="23%"> 
              <div align="left"> <%= Util.formatDate(fex.getE01WKFMA1(),fex.getE01WKFMA2(),fex.getE01WKFMA3())%> 
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="23%" > 
              <div align="right">Reference Spot :</div>
            </td>
            <td nowrap width="38%" ><%= fex.getE01WKFSPR()%> </td>
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
            <td nowrap > 
              <div align="left"><%= Util.fcolorCCY(fex.getE01WKFEXR())%> </div>
            </td>
            <td nowrap > 
              <div align="right">Option Price :</div>
            </td>
            <td nowrap > 
              <div align="left"> <%= Util.fcolorCCY(fex.getE01WKFBRF())%> </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="23%" > 
              <div align="right">Dealer :</div>
            </td>
            <td nowrap colspan="3" ><%= fex.getE01WKFDID()%> - <%= fex.getD01FEGDSC().trim()%> 
              <input type="hidden" name="E01WKFCCY"  value="<%= fex.getE01WKFCCY()%>" >
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="23%" >
              <div align="right">Payment Type :</div>
            </td>
            <td nowrap >
              <div align="left"><% if(fex.getE01FESTIN().equals("C")) out.print("CLS");
						else out.print("Standard");%></div>
            </td>
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
              <div align="right">Classification :</div>
            </td>
            <td nowrap colspan="2" > 
              <input type="text" name="E01WKFCLS" size="5" maxlength="4" value="<%= fex.getE01WKFCLS()%>" 
			  >
              <a href="javascript:GetClassFex('E01WKFCLS','OPT','<%= fex.getE01WKFCCY()%>')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a> 
            </td>
            <td nowrap colspan="2" > 
              <div align="right">Revaluation Type :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01WKFRVF" size="3" maxlength="1" value="<%= fex.getE01WKFRVF()%>" 
			  >
              <a href="javascript:GetCode('E01WKFRVF','STATIC_fe_bo_rev.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a> 
            </td>
            <td nowrap >&nbsp;</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Confirmation Type :</div>
            </td>
            <td nowrap colspan="2" > 
              <input type="text" name="E01WKFNTF" size="3" maxlength="1" value="<%= fex.getE01WKFNTF()%>" 
			  >
              <a href="javascript:GetCode('E01WKFNTF','STATIC_fe_bo_not.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a> 
            </td>
            <td nowrap colspan="2" > 
              <div align="right">Payment Via :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01WKFBPV" size="3" maxlength="1" value="<%= fex.getE01WKFBPV()%>" 
			  >
              <a href="javascript:GetCode('E01WKFBPV','STATIC_fe_bo_pay.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a> 
            </td>
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
              <div align="center"> 
                <input type="text" name="E01WKFOBK" size="2" maxlength="2" value="<%= fex.getE01WKFOBK()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01WKFOBR" size="3" maxlength="3"
                oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E01WKFOBK.value,'','','','')" value="<%= fex.getE01WKFOBR()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01WKFOCY" size="3" maxlength="3" value="<%= fex.getE01WKFOCY()%>"
                oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E01WKFOBK.value,'','','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01WKFOGL" size="15" maxlength="13" value="<%= fex.getE01WKFOGL()%>" 
				oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01WKFOBK.value,document.forms[0].E01WKFOCY.value,'','','')" >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01WKFOAC" size="12" maxlength="9" value="<%= fex.getE01WKFOAC()%>"
                oncontextmenu="showPopUp(accountHelp,this.name,document.forms[0].E01WKFOBK.value,'','','','RT')" >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01WKFOCC" size="12" maxlength="9" value="<%= fex.getE01WKFOCC()%>"
                oncontextmenu="showPopUp(costcenterHelp,this.name,document.forms[0].E01WKFOBK.value,'','','','')" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Vostro Account :</div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01WKFCBK" size="2" maxlength="2" value="<%= fex.getE01WKFCBK()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01WKFCBR" size="3" maxlength="3" value="<%= fex.getE01WKFCBR()%>"
                oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E01WKFCBK.value,'','','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01WKFCCU" size="3" maxlength="3" value="<%= fex.getE01WKFCCU()%>"
                oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E01WKFCBK.value,'','','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01WKFCGL" size="15" maxlength="13" value="<%= fex.getE01WKFCGL()%>"
				oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01WKFCBK.value,document.forms[0].E01WKFCCU.value,'','','')"  >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01WKFCAC" size="12" maxlength="9" value="<%= fex.getE01WKFCAC()%>"
                oncontextmenu="showPopUp(accountHelp,this.name,document.forms[0].E01WKFCBK.value,'','','','RT')" >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01WKFCCC" size="12" maxlength="9" value="<%= fex.getE01WKFCCC()%>"
                oncontextmenu="showPopUp(costcenterHelp,this.name,document.forms[0].E01WKFCBK.value,'','','','')" >
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
            <td nowrap  align="right">Fees (1) :</td>
            <td nowrap align="center"> 
                <input type="text" name="E01FESFTP" size="3" maxlength="2" value="<%= fex.getE01FESFTP()%>">
                <A href="javascript:GetForExcFee('E01FESFTP')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0">
				</A>
            </td>
            <td nowrap align="center"> 
            </td>
            <td nowrap align="center"> 
                <input type="text" name="E01FESC1Y" size="4" maxlength="3" value="<%= fex.getE01FESC1Y()%>" readonly>
            </td>
            <td nowrap align="center"> 
                <input type="text" name="E01FESC1G" size="13" maxlength="12" value="<%= fex.getE01FESC1G()%>" readonly>
            </td>
            <td nowrap align="center"> 
                <input type="text" name="E01FESC1A" size="16" maxlength="15" value="<%= fex.getE01FESC1A()%>" readonly>
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
                <input type="text" name="E01FESC2Y" size="4" maxlength="3" value="<%= fex.getE01FESC2Y()%>" readonly>
            </td>
            <td nowrap align="center"> 
                <input type="text" name="E02FESC1G" size="13" maxlength="12" value="<%= fex.getE01FESC2G()%>" readonly>
            </td>
            <td nowrap align="center"> 
                <input type="text" name="E01FESC2A" size="16" maxlength="15" value="<%= fex.getE01FESC2A()%>" readonly>
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
  <br><table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
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
  <BR>
  </form>
</body>
</html>
