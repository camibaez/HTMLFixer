<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Cross References</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id= "crossRef" class= "datapro.eibs.beans.EGL034002Message"  scope="session" /> 
<jsp:useBean id= "gLedger" class= "datapro.eibs.beans.EGL034001Message"  scope="session" /> 
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" /> 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

</head>
<body > 

<SCRIPT LANGUAGE="JavaScript">
 builtNewMenu(gl_inquiry_opt);
 builtHPopUp();

 function showPopUp(optHelp,fieldname,bank,ccy,aux1,aux2,opcode) {
   init(optHelp,fieldname,bank,ccy,aux1,aux2,opcode);
   showPopupHelp();
   }   
</SCRIPT>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT Language="Javascript">
            showErrors();
     </SCRIPT>
 <%
 }
 
   out.println("<SCRIPT> initMenu();  </SCRIPT>");
%>


<h3 align="center">Cross References Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="crossRef_basic_inquiry,EGL0340"></h3>
<hr size="4">      
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEGL0340">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="8">    
  <INPUT TYPE=HIDDEN NAME="E02GLMACD" value="<%= crossRef.getE02GLMACD().trim()%>">
  <table class="tableinfo" id="trdark">
    <tr id="trdark"> 
      <td align="right"  nowrap width="30%" > General Ledger : </td>
      <td align="right"  nowrap > 
        <div align="left">         
           <input type="text" name="E02GLMBNK" size="3" maxlength="3" readonly value = "<%= crossRef.getE02GLMBNK() %>">         
           <input type="text" name="E02GLMCCY" size="3" maxlength="3" readonly value = "<%= crossRef.getE02GLMCCY() %>">          
           <input type="text" name="E02GLMGLN" size="17" maxlength="16" readonly value = "<%= crossRef.getE02GLMGLN() %>">          
        </div>
      </td>
    </tr>
    <tr id="trdark"> 
      <td align="right" nowrap width="30%"  > Description : </td>
      <td align="right" nowrap > 
        <div align="left"> 
          <input type="text" name="E02GLMDSC" size="35" maxlength="35" readonly value="<%= crossRef.getE02GLMDSC() %>">
        </div>
      </td>
    </tr>   
  </table>
  <% if (crossRef.getE02GLMACD().equals("10")) { %>
  <H4>Loans Module</H4>
  <table class="tableinfo">
    <tr  id="trdark">
      <TH align="left" colspan=2>Interest And Late Charges</TH>
    </tr> 
    <tr  id="trclear">
      <td align="right" width="30%"> Debit Interest Account : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXDR" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXDR() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXDR" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXDR() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Credit Interest Account : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXCR" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXCR() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXCR" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXCR() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Past Due Interest Debit : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXLR" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXLR() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXLR" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXLR() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Past Due Interest Credit : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXLC" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXLC() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXLC" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXLC() %>">
      </td>
    </tr>
    <tr  id="trdark">
      <TH align="left" colspan=2>Renewal </TH>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Contingency Debit Account : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXO2" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXO2() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXO2" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXO2() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Contingency Credit Account : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMX16" size="17" maxlength="17" value = "<%= crossRef.getE02GLMX16() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMX16" size="35" maxlength="35" value = "<%= crossRef.getD02GLMX16() %>">
      </td>
    </tr>
    <tr  id="trdark">
      <TH align="left" colspan=2>Charged-Off References</TH>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Charge-Offs : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXIE" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXIE() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXIE" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXIE() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Recoveries : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMDFP" size="17" maxlength="17" value = "<%= crossRef.getE02GLMDFP() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMDFP" size="35" maxlength="35" value = "<%= crossRef.getD02GLMDFP() %>">
      </td>
    </tr>
    <tr  id="trdark">
      <TH align="left" colspan=2>Additional References</TH>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Unrecorded Interest Income: </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXSO" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXSO() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXSO" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXSO() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Unrecorded Penalty Int. Inc. : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXSD" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXSD() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXSD" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXSD() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Penalty Fees : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXCC" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXCC() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXCC" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXCC() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Past Due Loans Account : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXSM" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXSM() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXSM" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXSM() %>">
      </td>
    </tr>    
    <tr  id="trclear">
      <td align="right" width="30%"> Outstanding Loans Account : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXSR" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXSR() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXSR" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXSR() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Int/Received on Non-Accrual : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMX32" size="17" maxlength="17" value = "<%= crossRef.getE02GLMX32() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXO32" size="35" maxlength="35" value = "<%= crossRef.getD02GLMX32() %>">
      </td>
    </tr>    
  </table>
  <% } %>
  <% if (crossRef.getE02GLMACD().equals("50") || crossRef.getE02GLMACD().equals("51")) { %>
  <H4>Collection Module</H4>
  <table class="tableinfo"> 
    <tr  id="trclear">
      <td align="right" width="30%"> Commissions Receivable : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXDR" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXDR() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXDR" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXDR() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Offset Account : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXCR" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXCR() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXCR" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXCR() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Tax Hold Account: </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMX16" size="17" maxlength="17" value = "<%= crossRef.getE02GLMX16() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMX16" size="35" maxlength="35" value = "<%= crossRef.getD02GLMX16() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Additional Holdings : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMX17" size="17" maxlength="17" value = "<%= crossRef.getE02GLMX17() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMX17" size="35" maxlength="35" value = "<%= crossRef.getD02GLMX17() %>">
      </td>
    </tr>
  </table>
  <% } %>
  <% if (crossRef.getE02GLMACD().equals("40") || crossRef.getE02GLMACD().equals("41") || crossRef.getE02GLMACD().equals("42")) { %>
  <H4>Letter of Credit </H4>
  <table class="tableinfo"> 
    <tr  id="trclear">
      <td align="right" width="30%"> Commissions Receivable : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXDR" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXDR() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXDR" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXDR() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Offset Account : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXCR" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXCR() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXCR" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXCR() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Acceptances Debit Account : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXSD" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXSD() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXSD" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXSD() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Acceptances Credit Account : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXST" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXST() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXST" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXST() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Collateral Cash Account : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXSR" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXSR() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXSR" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXSR() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Discount Acceptances : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXSO" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXSO() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXSO" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXSO() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Refinances (Loans) : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXSS" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXSS() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXSS" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXSS() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Deferred Payments Debit Account : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXIE" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXIE() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXIE" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXIE() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Deferred Payments Credit Account : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMDFP" size="17" maxlength="17" value = "<%= crossRef.getE02GLMDFP() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMDFP" size="35" maxlength="35" value = "<%= crossRef.getD02GLMDFP() %>">
      </td>
    </tr>
  </table>
  <% } %>
  <% if (crossRef.getE02GLMACD().equals("01") || crossRef.getE02GLMACD().equals("02") || crossRef.getE02GLMACD().equals("03") || crossRef.getE02GLMACD().equals("04")) { %>
  <H4>Retail Accounts </H4>
  <table class="tableinfo">
    <tr  id="trdark">
      <TH align="left" colspan=2>Credits</TH>
    </tr> 
    <tr  id="trclear">
      <td align="right" width="30%">Interest Credit Account : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXCR" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXCR() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXCR" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXCR() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%">Service Charges for Minimum Balance : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXSM" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXSM() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXSM" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXSM() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%">Service Charges for Overdraft : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXSR" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXSR() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXSR" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXSR() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%">Service Charges for Stop Payments : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXSS" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXSS() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXSS" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXSS() %>">
      </td>
    </tr>
        <tr  id="trclear">
      <td align="right" width="30%">Service Charges for Inactive Accounts : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXSD" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXSD() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXSD" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXSD() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%">Miscellaneus Service Charges : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXST" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXST() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXST" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXST() %>">
      </td>
    </tr>
        <tr  id="trclear">
      <td align="right" width="30%">Overdraft Interest : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXSO" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXSO() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXSO" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXSO() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%">Collaterals (Contingency) : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXDR" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXDR() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXDR" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXDR() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%">Commissions x Cancellations : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXCC" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXCC() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXCC" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXCC() %>">
      </td>
    </tr>
    <tr  id="trdark">
      <TH align="left" colspan=2>Debits </TH>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Collaterized Counter-Overdraft : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXLR" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXLR() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXLR" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXLR() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Non Collaterized Counter- Overdraft : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXOD" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXOD() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXOD" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXOD() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Counter-Overdraft More than 66 Days : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXO2" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXO2() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXO2" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXO2() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Interest Expenses (MMK,SAV,NOW) : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXIE" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXIE() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXIE" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXIE() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Collaterals (Contingency) : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMDFP" size="17" maxlength="17" value = "<%= crossRef.getE02GLMDFP() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMDFP" size="35" maxlength="35" value = "<%= crossRef.getD02GLMDFP() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Receivable Overdraft Interests : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMX16" size="17" maxlength="17" value = "<%= crossRef.getE02GLMX16() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMX16" size="35" maxlength="35" value = "<%= crossRef.getD02GLMX16() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Inactive Counter Accounts : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMX17" size="17" maxlength="17" value = "<%= crossRef.getE02GLMX17() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMX17" size="35" maxlength="35" value = "<%= crossRef.getD02GLMX17() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Inactive Dormand Accounts : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMX18" size="17" maxlength="17" value = "<%= crossRef.getE02GLMX18() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMX18" size="35" maxlength="35" value = "<%= crossRef.getD02GLMX18() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Offset Uncollected Funds : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXLC" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXLC() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXLC" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXLC() %>">
      </td>
    </tr>
  </table>
  <H4>Overdraft Reserve</H4>
  <table class="tableinfo">
    <tr  id="trclear">
      <td align="right" width="30%"> Debit Account : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMX19" size="17" maxlength="17" value = "<%= crossRef.getE02GLMX19() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMX19" size="35" maxlength="35" value = "<%= crossRef.getD02GLMX19() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Credit Account : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMX20" size="17" maxlength="17" value = "<%= crossRef.getE02GLMX20() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMX20" size="35" maxlength="35" value = "<%= crossRef.getD02GLMX20() %>">
      </td>
    </tr>
  </table>
  <% } %>
  <% if (crossRef.getE02GLMACD().equals("90") || crossRef.getE02GLMACD().equals("91") || crossRef.getE02GLMACD().equals("92")) { %>
  <H4>Amortization / Collaterals / Lines of Credit / Other Products</H4>
   <table class="tableinfo"> 
    <tr  id="trclear">
      <td align="right" width="2%">(*)</td>
      <td align="right" width="28%"> Offset Accounts : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXDR" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXDR() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXDR" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXDR() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="2%">(**)</td>
      <td align="right" width="28%"> Amortization Account : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXCR" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXCR() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXCR" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXCR() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="2%"></td>
      <td align="right" width="28%"> Utilized Amount Debit Account : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMX21" size="17" maxlength="17" value = "<%= crossRef.getE02GLMX21() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMX21" size="35" maxlength="35" value = "<%= crossRef.getD02GLMX21() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="2%"></td>
      <td align="right" width="28%"> Utilized Amount Credit Account : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMX22" size="17" maxlength="17" value = "<%= crossRef.getE02GLMX22() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMX22" size="35" maxlength="35" value = "<%= crossRef.getD02GLMX22() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="2%"></td>
      <td align="right" colspan="2">         
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" valign="top" width="2%">(*)</td>
      <td align="left" colspan="2"> The Offset Account will be used in COLLATERALS, 
        LINES OF CREDIT , etc. </td>
    </tr>
    <tr  id="trclear">
      <td align="right" valign="top" width="2%">(**)</td>
      <td align="left" colspan="2"> Income Commission Account and Prepaid Expenses 
        will be used for daily amortization; Debit and Credits will be affected 
        according to the account classification. (General Ledger shown below) 
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" valign="top" width="2%">(**)</td>
      <td align="left" colspan="2"> Lines of Credit will use the Amortization 
        Account to include the Income Commission Account. </td>
    </tr>
  </table>
  <% } %>
  <% if (crossRef.getE02GLMACD().equals("11") || crossRef.getE02GLMACD().equals("12") || crossRef.getE02GLMACD().equals("14") || crossRef.getE02GLMACD().equals("15")) { %>
  <H4>Deals</H4>
  <table class="tableinfo">
    <tr  id="trdark">
      <TH align="left" colspan=2>Interests</TH>
    </tr> 
    <tr  id="trclear">
      <td align="right" width="30%"> Interests Debit Account : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXDR" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXDR() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXDR" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXDR() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Interests Credit Account : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXCR" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXCR() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXCR" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXCR() %>">
      </td>
    </tr>
    <tr  id="trdark">
      <TH align="left" colspan=2>Collateral Entries </TH>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Contingency Debit Account : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXIE" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXIE() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXIE" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXIE() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Contingency Credit Account : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMDFP" size="17" maxlength="17" value = "<%= crossRef.getE02GLMDFP() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMDFP" size="35" maxlength="35" value = "<%= crossRef.getD02GLMDFP() %>">
      </td>
    </tr>        
    <tr  id="trdark">
      <TH align="left" colspan=2>Additional References</TH>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%">Penalty Fees : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXCC" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXCC() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXCC" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXCC() %>">
      </td>
    </tr>    
  </table>
  <% } %>
  <% if (crossRef.getE02GLMACD().equals("13")) { %>
  <H4>Investments (Commercial Paper)</H4>
  <table class="tableinfo">
    <tr  id="trdark">
      <TH align="left" colspan=2>Interests</TH>
    </tr> 
    <tr  id="trclear">
      <td align="right" width="30%"> Debit Interests Account : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXDR" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXDR() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXDR" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXDR() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Credits Interest Account : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXCR" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXCR() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXCR" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXCR() %>">
      </td>
    </tr>
    <tr  id="trdark">
      <TH align="left" colspan=2>Safe Keeping Contingencies </TH>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Debit Account : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXIE" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXIE() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXIE" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXIE() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Credit Account : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMDFP" size="17" maxlength="17" value = "<%= crossRef.getE02GLMDFP() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMDFP" size="35" maxlength="35" value = "<%= crossRef.getD02GLMDFP() %>">
      </td>
    </tr>
    <tr  id="trdark">
      <TH align="left" colspan=2>Other Entries</TH>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Amortization Premium : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXSD" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXSD() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXSD" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXSD() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Accretion Discount : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXSO" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXSO() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXSO" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXSO() %>">
      </td>
    </tr>    
    <tr  id="trclear">
      <td align="right" width="30%"> Mark To Market Adjustment : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXSM" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXSM() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXSM" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXSM() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Offset Mark/Market Adj. Profit : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXSR" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXSR() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXSR" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXSR() %>">
      </td>
    <tr  id="trclear">
      <td align="right" width="30%"> Offset Mark/Market Adj. Loss : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXCC" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXCC() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXCC" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXCC() %>">
      </td>      
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Profit On Sales : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXSS" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXSS() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXSS" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXSS() %>">
      </td>
    </tr>  
    <tr  id="trclear">
      <td align="right" width="30%"> Loss On Sales : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXLC" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXLC() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXLC" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXLC() %>">
      </td>
    </tr>        
    <tr  id="trclear">
      <td align="right" width="30%"> Realized Gain : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXO2" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXO2() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXO2" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXO2() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Realized Losses : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXLR" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXLR() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXLR" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXLR() %>">
      </td>
    </tr>
  </table>
  <% } %> <% if (crossRef.getE02GLMACD().equals("10") || crossRef.getE02GLMACD().equals("11") || crossRef.getE02GLMACD().equals("12") || crossRef.getE02GLMACD().equals("13") || crossRef.getE02GLMACD().equals("14") || crossRef.getE02GLMACD().equals("15")) { %> 
  <H4>Deals Cross References</H4>
  <table class="tableinfo">
    <tr  id="trdark">
      <TH align="left" colspan=2>Future Contracts</TH>
    </tr> 
    <tr  id="trclear">
      <td align="right" width="30%"> Contingency Debits : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXST" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXST() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXST" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXST() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Contingency Credits : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMXOD" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXOD() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMXOD" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXOD() %>">
      </td>
    </tr>
  </table>
  <% } %>
  <% if (crossRef.getE02GLMACD().equals("10")) { %>
  <H4>Reserve for Loan Losses</H4>
  <table class="tableinfo">
    <tr  id="trclear">
      <td align="right" width="30%"> Principal Debit Account : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMX17" size="17" maxlength="17" value = "<%= crossRef.getE02GLMX17() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMX17" size="35" maxlength="35" value = "<%= crossRef.getD02GLMX17() %>">
        <b>(1)</b>
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Principal Credit Account : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMX18" size="17" maxlength="17" value = "<%= crossRef.getE02GLMX18() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMX18" size="35" maxlength="35" value = "<%= crossRef.getD02GLMX18() %>">
        <b>(1)</b>
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Interests Debit Account : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMX19" size="17" maxlength="17" value = "<%= crossRef.getE02GLMX19() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMX19" size="35" maxlength="35" value = "<%= crossRef.getD02GLMX19() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Interests Credit Account : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMX20" size="17" maxlength="17" value = "<%= crossRef.getE02GLMX20() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMX20" size="35" maxlength="35" value = "<%= crossRef.getD02GLMX20() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="left" width="100%" colspan="2"> 
      	(1) In the Event of a Full Charge-Off this Account will Offset Entries Generated On the Balance Sheet and Off the Balance Sheet.
      </td>
    </tr>    
  </table>
  <% } %>
  <% if (gLedger.getE01GLMRVF().equals("Y")) { %>
  <H4>Foreign Exchange Revaluation Accounts </H4>
  <table class="tableinfo"> 
    <tr  id="trclear">
      <td align="right" width="30%"> Credit Account : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMRIN" size="17" maxlength="17" value = "<%= crossRef.getE02GLMRIN() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMRIN" size="35" maxlength="35" value = "<%= crossRef.getD02GLMRIN() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Debit Account : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMREX" size="17" maxlength="17" value = "<%= crossRef.getE02GLMREX() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMREX" size="35" maxlength="35" value = "<%= crossRef.getD02GLMREX() %>">
      </td>
    </tr>
   </table>
  <% } %>
  <% if (crossRef.getE02GLMATY().equals("BND") ||
				 crossRef.getE02GLMATY().equals("EQT") ||
				 crossRef.getE02GLMATY().equals("MUT") ||
				 crossRef.getE02GLMATY().equals("ACD") ||
				 crossRef.getE02GLMATY().equals("PFS")) { %> 
  <h4>Investments Accounts </h4>
  <table class="tableinfo">
    <tr  id="trdark"> 
      <td align="right" width="30%"> 
        <div align="right">Offset Account :</div>
      </td>
      <td align="left" width="60%" nowrap> 
        <div align="left"> 
          <input type="text" readonly name="E02GLMX32" size="17" maxlength="17" value = "<%= crossRef.getE02GLMX32() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
          <input type="text" readonly name="D02GLMX32" size="35" maxlength="35" value = "<%= crossRef.getD02GLMX32() %>">
        </div>
      </td>
    </tr>
    <tr  id="trclear"> 
      <td align="right" width="30%"> 
        <div align="right">Gain/Loss    Income : </div>
      </td>
      <td align="left" width="60%" nowrap> 
        <div align="left"> 
          <input type="text" readonly name="E02GLMXCR" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXCR() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
          <input type="text" readonly name="D02GLMXCR" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXCR() %>">
        </div>
      </td>
    </tr>
    <tr  id="trdark"> 
      <td align="right" width="30%"> 
        <div align="right">Gain/Loss    Expenses : </div>
      </td>
      <td align="left" width="60%" nowrap> 
        <div align="left"> 
          <input type="text" readonly name="E02GLMXSM" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXSM() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
          <input type="text" readonly name="D02GLMXSM" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXSM() %>">
        </div>
      </td>
    </tr>
    <tr  id="trclear"> 
      <td align="right" width="30%"> 
        <div align="right">Interests Accrual Debit :</div>
      </td>
      <td align="left" width="60%" nowrap> 
        <div align="left"> 
          <input type="text" readonly name="E02GLMXSS" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXSS() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
          <input type="text" readonly name="D02GLMXSS" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXSS() %>">
        </div>
      </td>
    </tr>
    <tr  id="trdark"> 
      <td align="right" width="30%"> 
        <div align="right">Interests Accrual Credit :</div>
      </td>
      <td align="left" width="60%" nowrap> 
        <div align="left"> 
          <input type="text" readonly name="E02GLMXSD" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXSD() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
          <input type="text" readonly name="D02GLMXSD" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXSD() %>">
        </div>
      </td>
    </tr>
    <tr  id="trclear"> 
      <td align="right" width="30%"> 
        <div align="right">Pending Debit Sale Order :</div>
      </td>
      <td align="left" width="60%" nowrap> 
        <div align="left"> 
          <input type="text" readonly name="E02GLMXST" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXST() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
          <input type="text" readonly name="D02GLMXST" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXST() %>">
        </div>
      </td>
    </tr>
    <tr  id="trdark"> 
      <td align="right" width="30%"> 
        <div align="right">Pending Credit Sale Order :</div>
      </td>
      <td align="left" width="60%" nowrap> 
        <div align="left"> 
          <input type="text" readonly name="E02GLMXSO" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXSO() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
          <input type="text" readonly name="D02GLMXSO" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXSO() %>">
        </div>
      </td>
    </tr>
    <tr  id="trclear"> 
      <td align="right" width="30%"> 
        <div align="right">Pending Debit Purchase Order :</div>
      </td>
      <td align="left" width="60%" nowrap> 
        <div align="left"> 
          <input type="text" readonly name="E02GLMXLR" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXLR() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
          <input type="text" readonly name="D02GLMXLR" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXLR() %>">
        </div>
      </td>
    </tr>
    <tr  id="trdark"> 
      <td align="right" width="30%"> 
        <div align="right">Pending Credit Purchase Order :</div>
      </td>
      <td align="left" width="60%" nowrap> 
        <div align="left"> 
          <input type="text" readonly name="E02GLMXO2" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXO2() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
          <input type="text" readonly name="D02GLMXO2" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXO2() %>">
        </div>
      </td>
    </tr>
    
    <tr  id="trclear"> 
      <td align="right" width="30%"> 
        <div align="right">Custody Fee Accrual Debit :</div>
      </td>
      <td align="left" width="60%" nowrap> 
        <div align="left"> 
          <input type="text" readonly name="E02GLMX17" size="17" maxlength="17" value = "<%= crossRef.getE02GLMX17() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
          <input type="text" readonly name="D02GLMX17" size="35" maxlength="35" value = "<%= crossRef.getD02GLMX17() %>">
        </div>
      </td>
    </tr>
    <tr  id="trdark"> 
      <td align="right" width="30%"> 
        <div align="right">Custody Fee Accrual Credit :</div>
      </td>
      <td align="left" width="60%" nowrap> 
        <div align="left"> 
          <input type="text" readonly name="E02GLMX18" size="17" maxlength="17" value = "<%= crossRef.getE02GLMX18() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
          <input type="text" readonly name="D02GLMX18" size="35" maxlength="35" value = "<%= crossRef.getD02GLMX18() %>">
        </div>
      </td>
    </tr>
    <tr  id="trclear"> 
      <td align="right" width="30%"> 
        <div align="right">Income Brokerage :</div>
      </td>
      <td align="left" width="60%" nowrap> 
        <div align="left"> 
          <input type="text" readonly name="E02GLMXSR" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXSR() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
          <input type="text" readonly name="D02GLMXSR" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXSR() %>">
        </div>
      </td>
    </tr>
    <tr  id="trclear"> 
      <td align="right" width="30%"> 
        <div align="right">Expenses Brokerage :</div>
      </td>
      <td align="left" width="60%" nowrap> 
        <div align="left"> 
          <input type="text" readonly name="E02GLMXCC" size="17" maxlength="17" value = "<%= crossRef.getE02GLMXCC() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
          <input type="text" readonly name="D02GLMXCC" size="35" maxlength="35" value = "<%= crossRef.getD02GLMXCC() %>">
        </div>
      </td>
    </tr>
    
    
  </table>
<H4>Bank Position</H4>
<TABLE class="tableinfo">
	<TBODY>
		<TR id="trdark">
			<TD align="right" width="30%">
			<DIV align="right">Face value Account</DIV>
			</TD>
			<TD align="left" width="60%" nowrap>
			<DIV align="left"><INPUT type="text" readonly name="E02GLMDFP" size="17"
				maxlength="17" value="<%= crossRef.getE02GLMDFP() %>"
				oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
			<INPUT type="text" readonly name="D02GLMDFP0" size="35" maxlength="35"
				value="<%= crossRef.getD02GLMDFP() %>"></DIV>
			</TD>
		</TR>
		<TR id="trclear">
			<TD align="right" width="30%">
			<DIV align="right">Premium/Discount Account</DIV>
			</TD>
			<TD align="left" width="60%" nowrap>
			<DIV align="left"><INPUT type="text" readonly name="E02GLMX16" size="17"
				maxlength="17" value="<%= crossRef.getE02GLMX16() %>"
				oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
			<INPUT type="text" readonly name="D02GLMX160" size="35" maxlength="35"
				value="<%= crossRef.getD02GLMX16() %>"></DIV>
			</TD>
		</TR>
		<TR id="trdark">
			<TD align="right" width="30%">
			<DIV align="right">Accrued Int.time of purchase</DIV>
			</TD>
			<TD align="left" width="60%" nowrap>
			<DIV align="left"><INPUT type="text" readonly name="E02GLMXIE" size="17"
				maxlength="17" value="<%= crossRef.getE02GLMXIE() %>"
				oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
			<INPUT type="text" readonly name="D02GLMXIE" size="35" maxlength="35"
				value="<%= crossRef.getD02GLMXIE() %>"></DIV>
			</TD>
		</TR>
		<TR id="trclear">
			<TD align="right" width="30%">
			<DIV align="right">Sec. Held by the Bank Debit</DIV>
			</TD>
			<TD align="left" width="60%" nowrap>
			<DIV align="left"><INPUT type="text" readonly name="E02GLMX19" size="17"
				maxlength="17" value="<%= crossRef.getE02GLMX19() %>"
				oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
			<INPUT type="text" readonly name="D02GLMX19" size="35" maxlength="35"
				value="<%= crossRef.getD02GLMX19() %>"></DIV>
			</TD>			
		</TR>
		<TR id="trclear">
			<TD align="right" width="30%">
			<DIV align="right">Sec. Held by the Bank Credit</DIV>
			</TD>
			<TD align="left" width="60%" nowrap>
			<DIV align="left"><INPUT type="text" readonly name="E02GLMX20" size="17"
				maxlength="17" value="<%= crossRef.getE02GLMX20() %>"
				oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
			<INPUT type="text" readonly name="D02GLMX20" size="35" maxlength="35"
				value="<%= crossRef.getD02GLMX20() %>"></DIV>
			</TD>		
		</TR>				
	</TBODY>
</TABLE>
<% } %>
  <% if (!gLedger.getE01GLMREV().equals("N")) { %>
  <H4>Currency Adjustment Accounts </H4>
  <table class="tableinfo"> 
    <tr  id="trclear">
      <td align="right" width="30%"> Debit Adjustement : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMRIN" size="17" maxlength="17" value = "<%= crossRef.getE02GLMRIN() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMRIN" size="35" maxlength="35" value = "<%= crossRef.getD02GLMRIN() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Credit Adjustment : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMREX" size="17" maxlength="17" value = "<%= crossRef.getE02GLMREX() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMREX" size="35" maxlength="35" value = "<%= crossRef.getD02GLMREX() %>">
      </td>
    </tr>
    <tr  id="trclear">
      <td align="right" width="30%"> Contingency : </td>
      <td align="left" width="60%" nowrap> 
        <input type="text" readonly name="E02GLMX25" size="17" maxlength="17" value = "<%= crossRef.getE02GLMX25() %>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02GLMBNK.value,document.forms[0].E02GLMCCY.value,'','','')">
        <input type="text" readonly name="D02GLMX25" size="35" maxlength="35" value = "<%= crossRef.getD02GLMX25() %>">
      </td>
    </tr>
   </table>
  <% } %>   
  <p>
</form>
</body>
</html>
