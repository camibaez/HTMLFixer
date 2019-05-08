<html>
<head>
<title>Loans Paid-Thru Dates Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "lnBasic" class= "datapro.eibs.beans.EDL015901Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import = "java.math.*" %>
<SCRIPT Language="Javascript">

	builtHPopUp();

  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }

</SCRIPT>


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

<h3 align="center">Maintenance Loan Dates<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="ln_ship_dates.jsp, EDL0150"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0158ACC" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="168">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left">
                <input type="text" name="E01DEACUN" size="9" maxlength="9" readonly value="<%= lnBasic.getE01DEACUN().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap  > 
              <div align="left">
                <input type="text" name="E01CUSNA1" size="45" maxlength="45" readonly value="<%= lnBasic.getE01CUSNA1().trim()%>">
               </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
                <input type="text" name="E01DEAACC" size="12" maxlength="12" value="<%= lnBasic.getE01DEAACC().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <input type="text" name="E01DEAPRO" size="4" maxlength="4" readonly value="<%= lnBasic.getE01DEAPRO().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Dates</h4>
  <table class="tableinfo">
    <tr > 
      <td> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Note Date :</div>
            </td>
            <td nowrap width="23%"> 
              <input type="text" readonly name="E01DEAOD1" size="2" maxlength="2" value="<%= lnBasic.getE01DEAOD1().trim()%>" onkeypress="enterInteger()">
              <input type="text" readonly name="E01DEAOD2" size="2" maxlength="2" value="<%= lnBasic.getE01DEAOD2().trim()%>" onkeypress="enterInteger()">
              <input type="text" readonly name="E01DEAOD3" size="2" maxlength="2" value="<%= lnBasic.getE01DEAOD3().trim()%>" onkeypress="enterInteger()">
            </td>
            <td nowrap width="25%"> 
              <div align="right">Maturity Date :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" name="E01DEAMD1" size="2" maxlength="2" value="<%= lnBasic.getE01DEAMD1().trim()%>"  onkeypress="enterInteger()">
              <input type="text" name="E01DEAMD2" size="2" maxlength="2" value="<%= lnBasic.getE01DEAMD2().trim()%>"  onkeypress="enterInteger()">
              <input type="text" name="E01DEAMD3" size="2" maxlength="2" value="<%= lnBasic.getE01DEAMD3().trim()%>"  onkeypress="enterInteger()">
            </td>
          </tr>

          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Estimated Shipment Date :</div>
            </td>
            <td nowrap width="23%"> 
              <input type="text" name="E01DEAXR1" size="2" maxlength="2" value="<%= lnBasic.getE01DEAXR1().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DEAXR2" size="2" maxlength="2" value="<%= lnBasic.getE01DEAXR2().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DEAXR3" size="2" maxlength="2" value="<%= lnBasic.getE01DEAXR3().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01DEAXR1,document.forms[0].E01DEAXR2,document.forms[0].E01DEAXR3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></a> 
            </td>
            <td nowrap width="25%"> 
              <div align="right">Documents Registry Date :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" name="E01DEABA1" size="2" maxlength="2" value="<%= lnBasic.getE01DEABA1().trim()%>" <%if (!lnBasic.getH01SCRCOD().equals("N")){out.print("readonly");}%> onkeypress="enterInteger()">
              <input type="text" name="E01DEABA2" size="2" maxlength="2" value="<%= lnBasic.getE01DEABA2().trim()%>" <%if (!lnBasic.getH01SCRCOD().equals("N")){out.print("readonly");}%> onkeypress="enterInteger()">
              <input type="text" name="E01DEABA3" size="2" maxlength="2" value="<%= lnBasic.getE01DEABA3().trim()%>" <%if (!lnBasic.getH01SCRCOD().equals("N")){out.print("readonly");}%> onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01DEABA1,document.forms[0].E01DEABA2,document.forms[0].E01DEABA3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></a> 
            </td>
          </tr>


          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Shipment Date :</div>
            </td>
            <td nowrap width="23%"> 
              <input type="text" name="E01DEAPC1" size="2" maxlength="2" value="<%= lnBasic.getE01DEAPC1().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DEAPC2" size="2" maxlength="2" value="<%= lnBasic.getE01DEAPC2().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DEAPC3" size="2" maxlength="2" value="<%= lnBasic.getE01DEAPC3().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01DEAPC1,document.forms[0].E01DEAPC2,document.forms[0].E01DEAPC3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></a> 
            </td>
            <td nowrap width="25%"> 
              <div align="right">Shipment Invoice Maturity Date :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" name="E01DEALS1" size="2" maxlength="2" value="<%= lnBasic.getE01DEALS1().trim()%>" <%if (!lnBasic.getH01SCRCOD().equals("N")){out.print("readonly");}%> onkeypress="enterInteger()">
              <input type="text" name="E01DEALS2" size="2" maxlength="2" value="<%= lnBasic.getE01DEALS2().trim()%>" <%if (!lnBasic.getH01SCRCOD().equals("N")){out.print("readonly");}%> onkeypress="enterInteger()">
              <input type="text" name="E01DEALS3" size="2" maxlength="2" value="<%= lnBasic.getE01DEALS3().trim()%>" <%if (!lnBasic.getH01SCRCOD().equals("N")){out.print("readonly");}%> onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01DEALS1,document.forms[0].E01DEALS2,document.forms[0].E01DEALS3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></a> 
            </td>
          </tr>



          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Payment Invoice Date :</div>
            </td>
            <td nowrap width="23%"> 
              <input type="text" name="E01DEAPS1" size="2" maxlength="2" value="<%= lnBasic.getE01DEAPS1().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DEAPS2" size="2" maxlength="2" value="<%= lnBasic.getE01DEAPS2().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DEAPS3" size="2" maxlength="2" value="<%= lnBasic.getE01DEAPS3().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01DEAPS1,document.forms[0].E01DEAPS2,document.forms[0].E01DEAPS3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></a> 
            </td>
            <td nowrap width="25%"> 
              <div align="right">Exporter Payment Date :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" name="E01DEARD1" size="2" maxlength="2" value="<%= lnBasic.getE01DEARD1().trim()%>"  onkeypress="enterInteger()">
              <input type="text" name="E01DEARD2" size="2" maxlength="2" value="<%= lnBasic.getE01DEARD2().trim()%>"  onkeypress="enterInteger()">
              <input type="text" name="E01DEARD3" size="2" maxlength="2" value="<%= lnBasic.getE01DEARD3().trim()%>"  onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01DEARD1,document.forms[0].E01DEARD2,document.forms[0].E01DEARD3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></a> 
            </td>
          </tr>

          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">New Rate :</div>
            </td>
            <td nowrap width="23%"> 
              <input type="text" name="E01DEARTE" size="10" maxlength="9" value="<%= lnBasic.getE01DEARTE().trim()%>" onKeypress="enterSignDecimal()">
            </td>
            <td nowrap width="25%"> 
              <div align="right">Foreign Exchange :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" name="E01DEAEXR" size="10" maxlength="9" value="<%= lnBasic.getE01DEAEXR().trim()%>"  onKeypress="enterSignDecimal()">
            </td>
          </tr>

        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td align="center"> <b>Payment Via</b></td>
          </tr>
        </table>
        <table class="tableinfo" style="filter:''">
          <tr id="trclear"> 
            <td width="31%"> 
              <div align="center">Concept</div>
            </td>
            <td width="5%" > 
              <div align="center">Bank</div>
            </td>
            <td width="13%"> 
              <div align="center">Branch</div>
            </td>
            <td width="12%" > 
              <div align="center">Currency</div>
            </td>
            <td width="21%"> 
              <div align="center">Reference</div>
            </td>
            <td width="21%"> 
              <div align="center">Amount</div>
            </td>

          </tr>
          <tr id="trdark"> 
            <td width="31%" > 
              <div align="center" nowrap> 
                <input type=text name="E01PAGOPE" value="<%= lnBasic.getE01PAGOPE().trim()%>" size="2" maxlength="2">
                <input type=HIDDEN name="E01PAGGLN" value="<%= lnBasic.getE01PAGGLN().trim()%>">
                <input type="text" name="E01PAGCON" size="25" maxlength="25" readonly value="<%= lnBasic.getE01PAGCON().trim()%>"
                                   oncontextmenu="showPopUp(conceptHelp,this.name,document.forms[0].E01PAGBNK.value,'','E01PAGGLN','E01PAGOPE','10')">
              </div>
            </td>
            <td width="5%"> 
              <div align="center"> 
                <input type="text" name="E01PAGBNK" size="2" maxlength="2" value="<%= lnBasic.getE01PAGBNK().trim()%>" onkeypress="enterInteger()">
              </div>
            </td>
            <td width="13%" > 
              <div align="center"> 
                <input type="text" name="E01PAGBRN" size="3" maxlength="3" value="<%= lnBasic.getE01PAGBRN().trim()%>" 
                 oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E01PAGBNK.value,'','','','')" onkeypress="enterInteger()">
              </div>
            </td>
            <td width="12%" > 
              <div align="center">
                <input type="text" name="E01PAGCCY" size="3" maxlength="3" value="<%= lnBasic.getE01PAGCCY().trim()%>"
                oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E01PAGBNK.value,'','','','')">
              </div>
            </td>
            <td width="21%" > 
              	<div align="center"> 
                 <input type="text" name="E01PAGACC" size="16" maxlength="9" value="<%= lnBasic.getE01PAGACC().trim()%>" onkeypress="enterInteger()"
                         oncontextmenu="showPopUp(accountHelp,this.name,document.forms[0].E01PAGBNK.value,'','','','RT')">
				</div>
            </td>
            <td width="21%" > 
              	<div align="center"> 
                 <input type="text" name="E01PAGAMT" size="17" maxlength="15" value="<%= lnBasic.getE01PAGAMT().trim()%>" onkeypress="enterInteger()"">
				</div>
            </td>

          </tr>
        </table>
        </table>
      </td>
    </tr>
  </table>
 <br>
  <div align="center"> 
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>

</form>
</body>
</html>
