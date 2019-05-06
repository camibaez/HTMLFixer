<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Operational by Customer</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="cifTotal" class="datapro.eibs.beans.ECIF01003Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"   scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

function showGraph()
{
	var pg = "<%=request.getContextPath()%>/pages/e/ECIF010_cif_total_graph.jsp";
	CenterNamedWindow(pg,'graph',700,560,2);
}

   builtNewMenu(ecif10_i_opt);
   
function get_Gen_Summary (){
	var cus = document.forms[0].E03CUSCUN.value;
	var cusname = document.forms[0].E03CUSNA1.value;
	window.location.href = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEIRA020?SCREEN=1&CUS=" + cus + "&CUSNAM=" + cusname;
	//page = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEIRA020?SCREEN=1&OPT="+opt;
 	//CenterWindow(page,420,300,2);
}  

</SCRIPT>


</head>

<body>

<%@ page import = "datapro.eibs.master.Util" %>

 <% 
 if ( !error.getERRNUM().equals("0")  ) {
	  error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 out.println("<SCRIPT> initMenu();  </SCRIPT>");
%>

<h3 align="center">Operational Summary by Customer<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cif_totals.jsp,ECIF010"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECIF010" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="6">
  <h4>Customer Information</h4>
 <table class="tableinfo">
    <tr > 
      <td nowrap>
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="22%" height="31"> 
              <div align="right">Customer :</div>
            </td>
            <td nowrap width="18%" height="31"> 
              <input type="text" readonly name="E03CUSCUN"  size="11" maxlength="9" value="<%= cifTotal.getE03CUSCUN().trim()%>">
            </td>
            <td nowrap width="21%" height="31"> 
              <div align="right">Name :</div>
            </td>
            <td nowrap width="39%" height="31"> 
              <input type="text" readonly name="E03CUSNA1"  size="35" maxlength="45" value="<%= cifTotal.getE03CUSNA1().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="22%"> 
              <div align="right">Residence Phone # :</div>
            </td>
            <td nowrap width="18%"> 
              <input type="text" readonly name="E03CUSPH1" size="13" maxlength="11" value="<%= cifTotal.getE03CUSPH1().trim()%>">
            </td>
            <td nowrap width="21%"> 
              <div align="right">Work Phone # :</div>
            </td>
            <td nowrap width="39%"> 
              <input type="text" readonly name="E03CUSPHN" size="13" maxlength="11" value="<%= cifTotal.getE03CUSPHN().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="22%"> 
              <div align="right">Facsimil # :</div>
            </td>
            <td nowrap width="18%"> 
              <input type="text" readonly name="E03CUSFAX" size="13" maxlength="11" value="<%= cifTotal.getE03CUSFAX().trim()%>">
            </td>
            <td nowrap width="21%"> 
              <div align="right">E-mail Address :</div>
            </td>
            <td nowrap width="39%"><a href="mailto:<%= cifTotal.getE03CUSIAD().trim()%>" target="body"><%= cifTotal.getE03CUSIAD().trim()%></a> 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Summary</h4>
  <table width="100%" border="0" cellspacing="2" cellpadding="0" id="tbhelp">
    <tr> 
      <td width="12%" nowrap>View Graphics</td>
      <td width="88%"><a href="javascript:showGraph()"><img src="<%=request.getContextPath()%>/images/graphic.gif" border="0" width="32" height="32"></a></td>
    </tr>
  </table>
  <table class="tableinfo">
    <tr > 
      <td nowrap height="36"> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap height="31" colspan=2> 
              <div align="center"><b>Customer's Use of Funds / Assets</b></div>
            </td>
            <td nowrap height="31"  colspan=2> 
              <div align="center"><b>Funds Provided by Customer / Liabilities</b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="28%"> 
              <div align="right"><a href="javascript:showAcc('OV','')">Overdrawn 
                Accounts : </a> </div>
            </td>
            <td nowrap width="21%" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03OVDRFT" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03OVDRFT())%>" onDblClick="showAcc('OV','')">
              </div>
            </td>
            <td nowrap width="25%" > 
              <div align="right"><a href="javascript:showAcc('01','')">DDA's :</a> 
              </div>
            </td>
            <td nowrap width="26%" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03CTACTE" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03CTACTE())%>" onDblClick="showAcc('01','')">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="28%" > 
              <div align="right"><a href="javascript:showAcc('10','H')">Mortgage 
                Loans :</a> </div>
            </td>
            <td nowrap width="21%" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03LNSMOR" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03LNSMOR())%>" onDblClick="showAcc('10','H')">
              </div>
            </td>
            <td nowrap width="25%" > 
              <div align="right"><a href="javascript:showAcc('MK','')">MMK, Now 
                &amp; Call Acts. : </a></div>
            </td>
            <td nowrap width="26%" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03CTAMMK" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03CTAMMK())%>" onDblClick="showAcc('MK','')">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="28%"> 
              <div align="right"><a href="javascript:showAcc('10','A')">Leasing 
                :</a> </div>
            </td>
            <td nowrap width="21%"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03LNSLSG" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03LNSLSG())%>" onDblClick="showAcc('10','A')">
              </div>
            </td>
            <td nowrap width="25%" > 
              <div align="right"><a href="javascript:showAcc('04','')">Savings 
                :</a> </div>
            </td>
            <td nowrap width="26%" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03CTAAHO" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03CTAAHO())%>" onDblClick="showAcc('04','')">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="28%" > 
              <div align="right"><a href="javascript:showAcc('10','C')">Installment 
                Loans :</a></div>
            </td>
            <td nowrap width="21%" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03LNSCON" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03LNSCON())%>" onDblClick="showAcc('10','C')">
              </div>
            </td>
            <td nowrap width="25%" > 
              <div align="right"><a href="javascript:showAcc('CD','')">Certificates 
                :</a> </div>
            </td>
            <td nowrap width="26%" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03CDTDPO" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03CDTDPO())%>" onDblClick="showAcc('CD','')">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="28%" > 
              <div align="right"><a href="javascript:showAcc('10','X')">Loans 
                :</a></div>
            </td>
            <td nowrap width="21%"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03LNSGRL" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03LNSGRL())%>" onDblClick="showAcc('10','X')">
              </div>
            </td>
            <td nowrap width="25%" > 
              <div align="right"><a href="javascript:showAcc('10','P')">Participations 
                :</a> </div>
            </td>
            <td nowrap width="26%" > 
              <div align="center">
                <input type="text" id="txtright" readonly name="E03PARTIC" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03PARTIC())%>" onDblClick="showAcc('10','P')">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="28%" > 
              <div align="right"><a href="javascript:showAcc('13','A')">Investments </a> </div>
            </td>
            <td nowrap width="21%" > 
              <div align="center">
                <input type="text" id="txtright" readonly name="E03INVERP" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03INVERP())%>" onDblClick="showAcc('13','L')">
              </div>
            </td>
            <td nowrap width="25%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="26%" > 
              <div align="center"> </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="28%" > 
              <div align="right"><a href="javascript:showAcc('13','A')">TDS / 
                CDS Purchased :</a> </div>
            </td>
            <td nowrap width="21%"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03INVERA" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03INVERA())%>" onDblClick="showAcc('13','A')">
              </div>
            </td>
            <td nowrap width="25%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="26%"> 
              <div align="center"> </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="28%" > 
              <div align="right"><a href="javascript:showAcc('14','A')">Acceptances 
                :</a></div>
            </td>
            <td nowrap width="21%" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03ACEPTA" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03ACEPTA())%>" onDblClick="showAcc('14','A')">
              </div>
            </td>
            <td nowrap width="25%" > 
              <div align="right"><a href="javascript:showAcc('14','L')">Acceptances 
                :</a> </div>
            </td>
            <td nowrap width="26%" > 
              <div align="center">
                <input type="text" id="txtright" readonly name="E03ACEPTP" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03ACEPTP())%>"  onDblClick="showAcc('14','L')">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="28%"> 
              <div align="right"><a href="javascript:showAcc('LC','C')">LC's Confirmed 
                :</a></div>
            </td>
            <td nowrap width="21%" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03LCCONF" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03LCCONF())%>" onDblClick="showAcc('LC','C')">
              </div>
            </td>
            <td nowrap width="25%" > 
              <div align="right"><a href="javascript:showAcc('LC','P')">LC's in 
                Process :</a> </div>
            </td>
            <td nowrap width="26%" > 
              <div align="center">
                <input type="text" id="txtright" readonly name="E03LCPROC" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03LCPROC())%>"  onDblClick="showAcc('LC','P')">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="28%" > 
              <div align="right"><a href="javascript:showAcc('51','P')">Spot Purchased 
                :</a> </div>
            </td>
            <td nowrap width="21%" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03SPTPUR" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03SPTPUR())%>" onDblClick="showAcc('30','')">
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="right"><a href="javascript:showAcc('51','S')">Spot Sold 
                :</a></div>
            </td>
            <td nowrap width="26%"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03SPTSAL" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03SPTSAL())%>" onDblClick="showAcc('31','')">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="28%" > 
              <div align="right"><a href="javascript:showAcc('53','P')">Forward 
                Purchased :</a></div>
            </td>
            <td nowrap width="21%" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03FRWPUR" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03FRWPUR())%>" onDblClick="showAcc('32','')">
              </div>
            </td>
            <td nowrap width="25%" > 
              <div align="right"><a href="javascript:showAcc('53','S')">Forward 
                Sold :</a> </div>
            </td>
            <td nowrap width="26%" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03FRWSAL" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03FRWSAL())%>"  onDblClick="showAcc('33','')">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="28%" > 
              <div align="right"><a href="javascript:showAcc('57','P')">Options 
                Purchased :</a></div>
            </td>
            <td nowrap width="21%" > 
              <div align="center">
                <input type="text" id="txtright" readonly name="E03OPTPUR" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03OPTPUR())%>" onDblClick="showAcc('32','')">
              </div>
            </td>
            <td nowrap width="25%" > 
              <div align="right"><a href="javascript:showAcc('57','S')">Options 
                Sold :</a> </div>
            </td>
            <td nowrap width="26%" > 
              <div align="center">
                <input type="text" id="txtright" readonly name="E03OPTSAL" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03OPTSAL())%>"  onDblClick="showAcc('33','')">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="28%" > 
              <div align="right"><a href="javascript:showAcc('B1','P')">FRAs Purchased 
                :</a></div>
            </td>
            <td nowrap width="21%" > 
              <div align="center">
                <input type="text" id="txtright" readonly name="E03FRAPUR" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03FRAPUR())%>" onDblClick="showAcc('32','')">
              </div>
            </td>
            <td nowrap width="25%" > 
              <div align="right"><a href="javascript:showAcc('B1','S')">FRAs Sold 
                :</a> </div>
            </td>
            <td nowrap width="26%" > 
              <div align="center">
                <input type="text" id="txtright" readonly name="E03FRASAL" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03FRASAL())%>"  onDblClick="showAcc('33','')">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="28%" >
              <div align="right">Financial Blocks :</div>
            </td>
            <td nowrap width="21%" > 
              <div align="center">
                <input type="text" id="txtright" readonly name="E03MMPPUR" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03MMPPUR())%>" onDblClick="showAcc('32','')">
              </div>
            </td>
            <td nowrap width="25%" >&nbsp;</td>
            <td nowrap width="26%" > 
              <div align="center"></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="28%" >
              <div align="right">Credit cards :</div>
            </td>
            <td nowrap width="21%" > 
              <div align="center">
                <input type="text" id="txtright" readonly name="E03LINCRA" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03LINCRA())%>" >
              </div>
            </td>
            <td nowrap width="25%" >&nbsp;</td>
            <td nowrap width="26%" > 
              <div align="center"></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="28%" > 
              <div align="right"><b>Total Assets :</b></div>
            </td>
            <td nowrap width="21%" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03TOTASS" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03TOTASS())%>">
              </div>
            </td>
            <td nowrap width="25%" > 
              <div align="right"><b>Total Liabilities :</b></div>
            </td>
            <td nowrap width="26%" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03TOTLIA" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03TOTLIA())%>">
              </div>
            </td>
          </tr>
        </table>
        
      </td>
    </tr>
  </table>
  <h4>Line of Credit</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap height="36"> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="21%" > 
              <div align="center">Amount Approved</div>
      </td>
      <td width="23%"> 
              <div align="center"> Amount Used</div>
      </td>
      <td width="20%"> 
              <div align="center">Available Amount</div>
      </td>
      <td width="20%"> 
              <div align="center">Participations</div>
      </td>
      <td width="20%"> 
              <div align="center">Today's Offerings</div>
      </td>
    </tr>
    <tr>
      <td width="17%"> 
        <div align="center">
          <input type="text" id="txtright" readonly name="E03LNEAMT"  size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03LNEAMT())%>" >
        </div>
      </td>
      <td width="23%"> 
        <div align="center">
          <input type="text" id="txtright" readonly name="E03LNEUSE"  size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03LNEUSE())%>">
        </div>
      </td>
      <td width="20%"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03LNEAVA"  size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03LNEAVA())%>">
              </div>
      </td>
      <td width="20%"> 
              <div align="center">
                <input type="text" id="txtright" readonly name="E03PARVEN"  size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03PARVEN())%>">
              </div>
      </td>
      <td width="20%"> 
        <div align="center">
          <input type="text" id="txtright" readonly name="E03LNETDY"  size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03LNETDY())%>">
        </div>
      </td>
    </tr>
  </table>
        
      </td>
    </tr>
  </table>
  <h4>Contingencies</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap height="36"> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap height="31"  colspan=2> 
              <div align="center"><b>Debits</b></div>
            </td>
            <td nowrap height="31" colspan=2> 
              <div align="center"><b>Credits</b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="28%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="22%"> 
              <div align="center"></div>
            </td>
            <td nowrap width="26%" > 
              <div align="right"><a href="javascript:showAcc('LC','B')">Cash Collateral 
                : </a></div>
            </td>
            <td nowrap width="24%" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03GAREFE" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03GAREFE())%>" onDblClick="showAcc('LC','B')">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="28%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="22%" > 
              <div align="center"> </div>
            </td>
            <td nowrap width="26%" > 
              <div align="right"><a href="javascript:showAcc('50','I')">International 
                Collections : </a></div>
            </td>
            <td nowrap width="24%" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03CBZINT" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03CBZINT())%>" onDblClick="showAcc('50','I')">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="28%" > 
              <div align="right"><a href="javascript:showAcc('41','')">Bank 
                Acceptances : </a></div>
            </td>
            <td nowrap width="22%" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03ACPDES" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03ACPDES())%>" onDblClick="showAcc('41','')">
              </div>
            </td>
            <td nowrap width="26%" > 
              <div align="right"><a href="javascript:showAcc('51','')">Domestic 
                Collections : </a></div>
            </td>
            <td nowrap width="24%" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03CBZLOC" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03CBZLOC())%>" onDblClick="showAcc('51',' ')">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="28%" > 
              <div align="right"><a href="javascript:showAcc('LC','N')">Un-Confirm 
                LC's : </a></div>
            </td>
            <td nowrap width="22%" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03LCNCON" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03LCNCON())%>" onDblClick="showAcc('LC','N')">
              </div>
            </td>
            <td nowrap width="26%" > 
              <div align="right"><a href="javascript:showAcc('91','')">Documents 
                in Custody : </a></div>
            </td>
            <td nowrap width="24%" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03COLATE" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03COLATE())%>" onDblClick="showAcc('91','')">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="28%" > 
              <div align="right"><a href="javascript:showAcc('50','R')">Received 
                Collections : </a></div>
            </td>
            <td nowrap width="22%"  > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03COLREC" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03COLREC())%>" onDblClick="showAcc('50','R')">
              </div>
            </td>
            <td nowrap width="26%"  > 
              <div align="right"><a href="javascript:showAcc('CD','P')">Pledge 
                Certificates : </a></div>
            </td>
            <td nowrap width="24%" height="22"   > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03CDTPIG" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03CDTPIG())%>" onDblClick="showAcc('CD','P')">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="28%"  >&nbsp;</td>
            <td nowrap width="22%"  >&nbsp;</td>
            <td nowrap width="26%"  > 
              <div align="right"></div>
            </td>
            <td nowrap width="24%" height="22"   > 
              <div align="center"> </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="28%"  > 
              <div align="right"><b>Total Debits :</b></div>
            </td>
            <td nowrap width="22%"  > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03TOTCDB" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03TOTCDB())%>">
              </div>
            </td>
            <td nowrap width="26%"  > 
              <div align="right"><b>Total Credits :</b></div>
            </td>
            <td nowrap width="24%" height="22"   > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03TOTCCR" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03TOTCCR())%>">
              </div>
            </td>
          </tr>
        </table>
        
      </td>
    </tr>
  </table>
  <h4>Assets Under Management</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap height="36"> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="21%" > 
              <div align="right"><a href="javascript:showOpenCustPos(document.forms[0].E03CUSCUN.value)">Open 
                Position :</a></div>
            </td>
            <td width="23%"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03IEOPOS"  size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03IEOPOS())%>" >
              </div>
            </td>
            <td width="20%"> 
              <div align="center"></div>
            </td>
            <td width="20%"> 
              <div align="center"></div>
            </td>
          </tr>
          <tr> 
            <td width="17%"> 
              <div align="right">Collateral Amount :</div>
            </td>
            <td width="23%"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03IECOAM"  size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03IECOAM())%>">
              </div>
            </td>
            <td width="20%"> 
              <div align="right">Available :</div>
            </td>
            <td width="20%"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03IEAVAM"  size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03IEAVAM())%>">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  </form>
</body>
</html>
