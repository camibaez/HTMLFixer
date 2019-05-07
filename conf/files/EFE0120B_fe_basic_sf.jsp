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
 <script src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"></script>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   builtHPopUp();

  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }

function GetInfo(reference){
 	pg = prefix +language + "EFE0120B_additional_info.jsp?reference="+ reference;
	CenterNamedWindow(pg,'Information',600,300,1);          
}

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

%> 
<h3 align="center"> Foreign Exchange Spot (Back Office)<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="fe_basic_sf.jsp,EFE0120B"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0120B" >
<input type="hidden" name="SCREEN"  value="2" >

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
              <input type="hidden" name="D01FESCP2"  value="<%= fex.getD01FESCP2()%>" >
              <%= fex.getD01FESCP2()%></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" > 
              <div align="right"></div>
            </td>
            <td nowrap colspan="3" width="85%" ><%= fex.getD01FESCP3()%> 
              </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Basic Information</h4>
  <table  class="tableinfo" width="100%">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Reference Number :</div>
            </td>
            <td nowrap ><%= fex.getE01FESREF()%></td>
            <td nowrap >&nbsp;</td>
            <td nowrap > 
              <div align="right">Date :<%= Util.formatDate(fex.getE01FESDD1(),fex.getE01FESDD2(),fex.getE01FESDD3())%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Broker :</div>
            </td>
            <td nowrap > <%= fex.getE01FESBRK()%> - <%= fex.getD01FEBNM1()%> </td>
            <td nowrap > 
              <div align="right">Action Taken :</div>
            </td>
            <td nowrap > <% if(fex.getE01FESSBT().equals("PU")) out.print("Purchase");
						else out.print("Sale");%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Primary Currency :</div>
            </td>
            <td nowrap > 
              <input type="hidden" name="E01FESCCY"  value="<%= fex.getE01FESCCY()%>" >
              <%= fex.getE01FESCCY().trim()%> : <%= Util.fcolorCCY(fex.getE01FESAMN())%> 
            </td>
            <td nowrap > 
              <div align="right">Spot Rate : </div>
            </td>
            <td nowrap> <%= fex.getE01FESEXR()%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Counter Currency :</div>
            </td>
            <td nowrap > <%= fex.getE01FESDCY().trim()%> : <%= Util.fcolorCCY(fex.getE01FESDAM())%> 
            </td>
            <td nowrap align="right">Value Date :</td>
            <td nowrap> <%= Util.formatDate(fex.getE01FESVD1(),fex.getE01FESVD2(),fex.getE01FESVD3())%> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Notes :</div>
            </td>
            <td nowrap colspan="3" ><%= fex.getE01FESOT1().trim()%></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right"></div>
            </td>
            <td nowrap colspan="3" ><%= fex.getE01FESOT2().trim()%></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Dealer :</div>
            </td>
            <td nowrap colspan="3" ><%= fex.getE01FESDID()%> - <%= fex.getD01FEGDSC().trim()%> 
              <input type="hidden" name="E01FESCCY"  value="<%= fex.getE01FESCCY()%>" >
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right">Payment Type :</div>
            </td>
            <td nowrap colspan="3" ><% if(fex.getE01FESTIN().equals("C")) out.print("CLS");
						else out.print("Standard");%></td>
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
            <td nowrap align="right">Classification :</td>
            <td nowrap colspan="2" > 
              <input type="text" name="E01FESCLS" size="5" maxlength="4" value="<%= fex.getE01FESCLS()%>">
              <a href="javascript:GetClassFex('E01FESCLS','SPT','<%= fex.getE01FESCCY()%>')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a> 
            </td>
            <td nowrap  align="right" colspan="2" >Revaluation Type : </td>
            <td nowrap > 
              <input type="text" name="E01FESRVF" size="3" maxlength="1" value="<%= fex.getE01FESRVF()%>">
              <a href="javascript:GetCode('E01FESRVF','STATIC_fe_bo_rev.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a> 
            </td>
            <td nowrap >
			</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap align="right">Confirmation Type : </td>
            <td nowrap colspan="2" > 
              <input type="text" name="E01FESCOT" size="3" maxlength="1" value="<%= fex.getE01FESCOT()%>">
              <a href="javascript:GetCode('E01FESCOT','STATIC_fe_bo_not.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a> 
            </td>
            <td nowrap align="right" colspan="2" >Payment Via : </td>
            <td nowrap > 
              <input type="text" name="E01FESBPV" size="3" maxlength="1" value="<%= fex.getE01FESBPV()%>">
	           <a href="javascript:GetCode('E01FESBPV','STATIC_fe_bo_pay.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a> 
            </td>
            <td nowrap> </td>
          </tr>
          <tr id="trdark"> 
            <td align="center"> </td>
            <td nowrap  align="center"><h5>Bank</h5></td>
            <td nowrap align="center"><h5>Branch</h5></td>
            <td nowrap align="center"><h5>CCY</h5></td>
            <td nowrap align="center"><h5>G/L</h5></td>
            <td nowrap align="center"><h5>Reference</h5></td>
            <td nowrap align="center"><h5>Cost Center</h5></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap align="right">Nostro Account : </td>
            <td nowrap align="center"> 
                <input type="text" name="E01FESOBK" size="3" maxlength="2" value="<%= fex.getE01FESOBK()%>">
            </td>
            <td nowrap align="center"> 
                <input type="text" name="E01FESOBR" size="4" maxlength="3"
                oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E01FESOBK.value,'','','','')" value="<%= fex.getE01FESOBR()%>">
            </td>
            <td nowrap align="center"> 
                <input type="text" name="E01FESOCY" size="4" maxlength="3" value="<%= fex.getE01FESOCY()%>"
                oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E01FESOBK.value,'','','','')">
            </td>
            <td nowrap align="center"> 
                <input type="text" name="E01FESOGL" size="13" maxlength="12" value="<%= fex.getE01FESOGL()%>" 
				oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01FESOBK.value,document.forms[0].E01FESOCY.value,'','','')" >
            </td>
            <td nowrap align="center"> 
                <input type="text" name="E01FESOAC" size="10" maxlength="9" value="<%= fex.getE01FESOAC()%>"
                oncontextmenu="showPopUp(accountHelp,this.name,document.forms[0].E01FESOBK.value,'','','','RT')" >
            </td>
            <td nowrap align="center"> 
                <input type="text" name="E01FESOCC" size="7" maxlength="6" value="<%= fex.getE01FESOCC()%>"
                oncontextmenu="showPopUp(costcenterHelp,this.name,document.forms[0].E01FESOBK.value,'','','','')" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap align="right">Vostro Account : </td>
            <td nowrap align="center"> 
                <input type="text" name="E01FESCBK" size="3" maxlength="2" value="<%= fex.getE01FESCBK()%>">
            </td>
            <td nowrap align="center"> 
                <input type="text" name="E01FESCBR" size="4" maxlength="3" value="<%= fex.getE01FESCBR()%>"
                oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E01FESCBK.value,'','','','')">
            </td>
            <td nowrap align="center"> 
                <input type="text" name="E01FESCCU" size="4" maxlength="3" value="<%= fex.getE01FESCCU()%>"
                oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E01FESCBK.value,'','','','')">
            </td>
            <td nowrap align="center"> 
                <input type="text" name="E01FESCGL" size="13" maxlength="12" value="<%= fex.getE01FESCGL()%>"
				oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01FESCBK.value,document.forms[0].E01FESCCU.value,'','','')"  >
            </td>
            <td nowrap align="center"> 
                <input type="text" name="E01FESCAC" size="10" maxlength="9" value="<%= fex.getE01FESCAC()%>"
                oncontextmenu="showPopUp(accountHelp,this.name,document.forms[0].E01FESCBK.value,'','','','RT')" >
            </td>
            <td nowrap align="center"> 
                <input type="text" name="E01FESCCC" size="7" maxlength="6" value="<%= fex.getE01FESCCC()%>"
                oncontextmenu="showPopUp(costcenterHelp,this.name,document.forms[0].E01FESCBK.value,'','','','')" >
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
  <font face="Arial"><font face="Arial"><font face="Arial"><font face="Arial"><font size="2">
  <input type="hidden" name="D01FESCP3"  value="<%= fex.getD01FESCP3()%>" readonly>
  </font></font></font></font></font>
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
  </div>      </td>
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
