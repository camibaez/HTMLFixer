
<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Loans Prepayment</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

	builtHPopUp();

  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }

</SCRIPT>
</head>

<jsp:useBean id= "lnCancelDet" class= "datapro.eibs.beans.EDL095002Message"  scope="session"/>
<jsp:useBean id= "lnCancel" class= "datapro.eibs.beans.EDL095001Message"  scope="session"/>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>


<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>



<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%> 
<H3 align="center">Loans Payment<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="ln_payment_det.jsp , EDL0950"> 
</H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0950">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="22">
  <INPUT TYPE=HIDDEN NAME="E02DEABNK" VALUE="<%= lnCancelDet.getE02DEABNK().trim()%>">
  <input type="HIDDEN" name="E02PAGOPC" value="">
  <input type="HIDDEN" name="E02PAGCON" value="">
  <input type="HIDDEN" name="E02PAGOBK" value="">
  <input type="HIDDEN" name="E02PAGOBR"  value="">
  <input type="HIDDEN" name="E02PAGOCY" value=""> 
  <input type="HIDDEN" name="E02PAGOGL"  value=""> 
  <input type="HIDDEN" name="E02PAGOAC"  value="">
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
                <input type="text" size="9" maxlength="9" name="E02DEACUN" value="<%= lnCancelDet.getE02DEACUN().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" size="45" maxlength="45" name="E02CUSNA1" value="<%= lnCancelDet.getE02CUSNA1().trim()%>" readonly>
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
                <input type="text" size="12" maxlength="12" name="E02DEAACC" value="<%= lnCancelDet.getE02DEAACC().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E02DEACCY" size="3" maxlength="3" value="<%= lnCancelDet.getE02DEACCY().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <input type="text" size="4" maxlength="4" name="E02DEAPRO" value="<%= lnCancelDet.getE02DEAPRO().trim()%>" readonly>
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Balances</h4>
 <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="15%"> 
              <div align="right"><b>Past Due Pymt</b></div>
            </td>
            <td nowrap width="15%"> 
              <div align="right"><b>Next Payment</b></div>
            </td>
            <td nowrap width="25%"> 
              <div align="right"><b>Concept</b></div>
            </td>
            <td nowrap width="15%"> 
              <div align="right"><b>Previous Balance</b></div>
            </td>
            <td nowrap width="15%"> 
              <div align="right"><b>Transaction</b></div>
            </td>
            <td nowrap width="15%"> 
              <div align="right"><b>New Balance</b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" height="23"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01VENPRI().trim())%></div>
            </td>
            <td nowrap width="15%" height="23"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01PRXPRI().trim())%></div>
            </td>          
            <td nowrap width="25%" height="23"> 
              <div align="right">Principal :</div>
            </td>
            <td nowrap width="15%" height="23"> 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02BEFPRI().trim())%></div>
            </td>
            <td nowrap width="15%" height="23"> 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02TRNPRI().trim())%></div>
            </td>
            <td nowrap width="15%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02AFTPRI().trim())%></div>
            </td>
          </tr>
		 <%if(lnCancelDet.getH02FLGWK3().equals("R")){%>
          <tr id="trclear"> 
            <td nowrap width="15%" height="19"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01VENREA().trim())%></div>
            </td>
            <td nowrap width="15%" height="19"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01PRXREA().trim())%></div>
            </td>          
            <td nowrap width="25%" height="19"> 
              <div align="right">Adjustment :</div>
            </td>
            <td nowrap width="15%" height="19"> 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02BEFREA().trim())%></div>
            </td>
            <td nowrap width="15%" height="19"> 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02TRNREA().trim())%></div>
            </td>
            <td nowrap width="15%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02AFTREA().trim())%></div>
            </td>
          </tr>
          <%}%>
          <tr id="trdark"> 
            <td nowrap width="15%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01VENINT().trim())%></div>
            </td>
            <td nowrap width="15%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01PRXINT().trim())%></div>
            </td>          
            <td nowrap width="25%"> 
              <div align="right">Interest :</div>
            </td>
            <td nowrap width="15%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02BEFINT().trim())%></div>
            </td>
            <td nowrap width="15%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02TRNINT().trim())%></div>
            </td>
            <td nowrap width="15%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02AFTINT().trim())%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01VENMOR().trim())%></div>
            </td>
            <td nowrap width="15%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01PRXMOR().trim())%></div>
            </td>          
            <td nowrap width="25%"> 
              <div align="right">Late Charges:</div>
            </td>
            <td nowrap width="15%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02BEFMOR().trim())%></div>
            </td>
            <td nowrap width="15%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02TRNMOR().trim())%></div>
            </td>
            <td nowrap width="15%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02AFTMOR().trim())%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01VENIMP().trim())%></div>
            </td>
            <td nowrap width="15%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01PRXIMP().trim())%></div>
            </td>          
            <td nowrap width="25%"> 
              <div align="right">Taxes :</div>
            </td>
            <td nowrap width="15%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02BEFIMP().trim())%></div>
            </td>
            <td nowrap width="15%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02TRNIMP().trim())%></div>
            </td>
            <td nowrap width="15%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02AFTIMP().trim())%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01VENCOM().trim())%></div>
            </td>
            <td nowrap width="15%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01PRXCOM().trim())%></div>
            </td>          
            <td nowrap width="25%"> 
              <div align="right">Commissions :</div>
            </td>
            <td nowrap width="15%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02BEFCOM().trim())%></div>
            </td>
            <td nowrap width="15%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02TRNCOM().trim())%></div>
            </td>
            <td nowrap width="15%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02AFTCOM().trim())%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01VENDED().trim())%></div>
            </td>
            <td nowrap width="15%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01PRXDED().trim())%></div>
            </td>          
            <td nowrap width="25%"> 
              <div align="right">Deductions :</div>
            </td>
            <td nowrap width="15%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02BEFDED().trim())%></div>
            </td>
            <td nowrap width="15%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02TRNDED().trim())%></div>
            </td>
            <td nowrap width="15%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02AFTDED().trim())%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01VENTOT().trim())%></div>
            </td>
            <td nowrap width="15%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01PRXTOT().trim())%></div>
            </td>          
            <td nowrap width="25%"> 
              <div align="right">Total :</div>
            </td>
            <td nowrap width="15%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02BEFTOT().trim())%></div>
            </td>
            <td nowrap width="15%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02TRNTOT().trim())%></div>
            </td>
            <td nowrap width="15%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02AFTTOT().trim())%></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4> Payment Distribution</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap colspan="2"> 
              <div align="right">PRINCIPAL :</div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" size="15" maxlength="15" name="E02PAGPRI" value="<%= lnCancelDet.getE02PAGPRI().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
		 <%if(lnCancelDet.getH02FLGWK3().equals("R")){%>
          <tr id="trdark"> 
            <td nowrap colspan="2"> 
              <div align="right">ADJUSTMENT :</div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" size="15" maxlength="15" name="E02PAGREA" value="<%= lnCancelDet.getE02PAGREA().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <%}%>  
          <tr id="trclear"> 
            <td nowrap colspan="2"> 
              <div align="right">INTEREST :</div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" size="15" maxlength="15" name="E02PAGINT" value="<%= lnCancelDet.getE02PAGINT().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap colspan="2"> 
              <div align="right">LATE CHARGES:</div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" size="15" maxlength="15" name="E02PAGMOR" value="<%= lnCancelDet.getE02PAGMOR().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
   		  <tr id="trclear">
		   <td nowrap colspan="2"> 
              <div align="right">EXTRAORDINARY :</div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" size="15" maxlength="15" name="E02PAGABO" value="<%= lnCancelDet.getE02PAGABO().trim()%>" onKeypress="enterDecimal()">
            </td>
           </tr>
   		  <tr id="trdark">
		   <td nowrap colspan="2"> 
              <div align="right">PARTIAL/EARLY :</div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" size="15" maxlength="15" name="E02PAGERL" value="<%= lnCancelDet.getE02PAGERL().trim()%>" onKeypress="enterDecimal()">
            </td>
           </tr>
           <%
		   if(lnCancelDet.getE02PAGFLG().trim().equals("ES")){
		   %> 
		  <tr id="trclear">
		   <td nowrap colspan="2"> 
              <div align="right">EXTRAORDINARY ESCROW CONTRIBUTION :</div>
           </td>
           <td nowrap colspan="3"> 
              <input type="text" size="15" maxlength="15" name="E02PAGOTH" value="<%= lnCancelDet.getE02PAGOTH().trim()%>" onKeypress="enterDecimal()">
           </td>
           </tr>
          <%
		   }
		  %>
		  
          <%
		   if(!lnCancelDet.getE02PDSC01().trim().equals("")){
		  %> 
          <tr id="trdark"> 
            <td nowrap colspan="2"> 
              <div align="right"><%= lnCancelDet.getE02PDSC01().trim()%> : </div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" size="15" maxlength="15" name="E02PAMT01" value="<%= lnCancelDet.getE02PAMT01().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <%
		   }
		  %> <%
		   if(!lnCancelDet.getE02PDSC02().trim().equals("")){
		 %> 
          <tr id="trclear"> 
            <td nowrap colspan="2"> 
              <div align="right"><%= lnCancelDet.getE02PDSC02().trim()%> :</div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" size="15" maxlength="15" name="E02PAMT02" value="<%= lnCancelDet.getE02PAMT02().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <%
          }
          %> <%
		   if(!lnCancelDet.getE02PDSC03().trim().equals("")){
		 %> 
          <tr id="trdark"> 
            <td nowrap colspan="2"> 
              <div align="right"><%= lnCancelDet.getE02PDSC03().trim()%> :</div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" size="15" maxlength="15" name="E02PAMT03" value="<%= lnCancelDet.getE02PAMT03().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <%
          }
          %> <%
		    if(!lnCancelDet.getE02PDSC04().trim().equals("")){
	      %> 
          <tr id="trclear"> 
            <td nowrap colspan="2"> 
              <div align="right"><%= lnCancelDet.getE02PDSC04().trim()%> :</div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" size="15" maxlength="15" name="E02PAMT04" value="<%= lnCancelDet.getE02PAMT04().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <%
          }
          %> <%
		     if(!lnCancelDet.getE02PDSC05().trim().equals("")){
		    %> 
          <tr id="trclear"> 
            <td nowrap colspan="2"> 
              <div align="right"><%= lnCancelDet.getE02PDSC05().trim()%> :</div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" size="15" maxlength="15" name="E02PAMT05" value="<%= lnCancelDet.getE02PAMT05().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <%
          }
          %> <%
		     if(!lnCancelDet.getE02PDSC06().trim().equals("")){
		    %> 
          <tr id="trdark"> 
            <td nowrap colspan="2"> 
              <div align="right"><%= lnCancelDet.getE02PDSC06().trim()%> :</div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" size="15" maxlength="15" name="E02PAMT06" value="<%= lnCancelDet.getE02PAMT06().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <%
          }
          %> <%
		     if(!lnCancelDet.getE02PDSC07().trim().equals("")){
	   	 %> 
          <tr id="trclear"> 
            <td nowrap colspan="2"> 
              <div align="right"><%= lnCancelDet.getE02PDSC07().trim()%> :</div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" size="15" maxlength="15" name="E02PAMT07" value="<%= lnCancelDet.getE02PAMT07().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <%
          }
          %> <%
		      if(!lnCancelDet.getE02PDSC08().trim().equals("")){
		    %> 
          <tr id="trdark"> 
            <td nowrap colspan="2"> 
              <div align="right"><%= lnCancelDet.getE02PDSC08().trim()%> :</div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" size="15" maxlength="15" name="E02PAMT08" value="<%= lnCancelDet.getE02PAMT08().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <%
          }
          %> <%
		     if(!lnCancelDet.getE02PDSC09().trim().equals("")){
		    %> 
          <tr id="trclear"> 
            <td nowrap colspan="2"> 
              <div align="right"><%= lnCancelDet.getE02PDSC09().trim()%> :</div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" size="15" maxlength="15" name="E02PAMT09" value="<%= lnCancelDet.getE02PAMT09().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <%
          }
          %> <%
		      if(!lnCancelDet.getE02PDSC10().trim().equals("")){
		    %> 
          <tr id="trdark"> 
            <td nowrap colspan="2"> 
              <div align="right"><%= lnCancelDet.getE02PDSC10().trim()%> :</div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" size="15" maxlength="15" name="E02PAMT10" value="<%= lnCancelDet.getE02PAMT10().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <%
          }
          %> <%
		     if(!lnCancelDet.getE02PDSC11().trim().equals("")){
		   %> 
          <tr id="trclear"> 
            <td nowrap colspan="2"> 
              <div align="right"><%= lnCancelDet.getE02PDSC11().trim()%> :</div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" size="15" maxlength="15" name="E02PAMT11" value="<%= lnCancelDet.getE02PAMT11().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <%
          }
          %> <%
		     if(!lnCancelDet.getE02PDSC12().trim().equals("")){
	   	 %> 
          <tr id="trdark"> 
            <td nowrap colspan="2"> 
              <div align="right"><%= lnCancelDet.getE02PDSC12().trim()%> :</div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" size="15" maxlength="15" name="E02PAMT12" value="<%= lnCancelDet.getE02PAMT12().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <%
           }
          %> <%
		     if(!lnCancelDet.getE02PDSC13().trim().equals("")){
		   %> 
          <tr id="trclear"> 
            <td nowrap colspan="2"> 
              <div align="right"><%= lnCancelDet.getE02PDSC13().trim()%> :</div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" size="15" maxlength="15" name="E02PAMT13" value="<%= lnCancelDet.getE02PAMT13().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <%
          }
          %> <%
		    if(!lnCancelDet.getE02PDSC14().trim().equals("")){
	      %> 
          <tr id="trdark"> 
            <td nowrap colspan="2"> 
              <div align="right"><%= lnCancelDet.getE02PDSC14().trim()%> :</div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" size="15" maxlength="15" name="E02PAMT14" value="<%= lnCancelDet.getE02PAMT14().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <%
          }
          %> <%
		     if(!lnCancelDet.getE02PDSC15().trim().equals("")){
		   %> 
          <tr id="trclear"> 
            <td nowrap colspan="2"> 
              <div align="right"><%= lnCancelDet.getE02PDSC15().trim()%> :</div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" size="15" maxlength="15" name="E02PAMT15" value="<%= lnCancelDet.getE02PAMT15().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap colspan="2">&nbsp;</td>
            <td nowrap colspan="3">&nbsp;</td>
          </tr>
          <%
		     }
		    %> 
          <tr id="trdark"> 
            <td nowrap colspan="2"> 
              <div align="right">TOTAL :</div>
            </td>
            <td nowrap colspan="3"> 
              <input readonly type="text" size="15" maxlength="15" name="E02PAGTOT" value="<%= lnCancelDet.getE02PAGTOT().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap colspan="2">&nbsp;</td>
            <td nowrap colspan="3">&nbsp;</td>
          </tr>
   		  <tr id="trdark">
		   <td nowrap colspan="2"> 
              <div align="right">WAIVE LATE CHARGES :</div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" size="15" maxlength="15" name="E02NPYLCH" value="<%= lnCancelDet.getE02NPYLCH().trim()%>" onKeypress="enterDecimal()">
            </td>
           </tr>          
          <tr id="trclear"> 
            <td nowrap colspan="2"> 
              <div align="right">Description :</div>
            </td>
            <td nowrap width="21%"> 
              <input type="text" size="30" maxlength="30" name="E02DEANR1" value="<%= lnCancelDet.getE02DEANR1().trim()%>">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbotton" border="0"  > 
            </td>
            <td nowrap width="18%"> 
              <div align="right">Value Date :</div>
            </td>
            <td nowrap width="20%"> 
              <input type="text" size="2" maxlength="2" name="E02PAGVD1" value="<%= lnCancelDet.getE02PAGVD1().trim()%>" onkeypress="enterInteger()">
              <input type="text" size="2" maxlength="2" name="E02PAGVD2" value="<%= lnCancelDet.getE02PAGVD2().trim()%>" onkeypress="enterInteger()">
              <input type="text" size="2" maxlength="2" name="E02PAGVD3" value="<%= lnCancelDet.getE02PAGVD3().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E02PAGVD1,document.forms[0].E02PAGVD2,document.forms[0].E02PAGVD3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap colspan="2">&nbsp;</td>
            <td nowrap width="21%"> 
              <input type="text" size="30" maxlength="30" name="E02DEANR2" value="<%= lnCancelDet.getE02DEANR2().trim()%>">
            </td>
            <td nowrap width="18%">&nbsp;</td>
            <td nowrap width="20%">&nbsp;</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap colspan="5" align="center"><b>Offset Account</b></td>
          </tr>
  <TABLE class="tableinfo" align="center">
  <TR><TD>
  
   <table id="headTable">
    <tr id="trdark"> 
      <td nowrap align="center" >Concept</td>
      <td nowrap align="center" >Bank </td>
      <td nowrap align="center" >Branch</td>
      <td nowrap align="center" >Currency</td>
      <td nowrap align="center" >G/L</td>
      <td nowrap align="center" >Reference</td>
      <td nowrap align="center" >Amount</td>
    </tr>
    </table> 
      
    <div id="dataDiv" class="scbarcolor" style="height:60; overflow-y :scroll; z-index:0" >
     <table id="dataTable" >
    <%
  				   int amount = 9;
 				   String name;
  					for ( int i=1; i<=amount; i++ ) {
   					  name = i + "";
   			%> 
    <tr id="trclear"> 
      <td nowrap > 
        <div align="center"> 
          <input type="text" name="E02OFFOP<%= name %>" value="<%= lnCancelDet.getField("E02OFFOP"+name).getString().trim()%>" size="2" maxlength="2">          
          <input type="text" name="E02OFFCO<%= name %>" size="25" maxlength="25" readonly value="<%= lnCancelDet.getField("E02OFFCO"+name).getString().trim()%>" 
          oncontextmenu="showPopUp(conceptHelp,this.name,document.forms[0].E02DEABNK.value,'','E02OFFGL<%= name %>','E02OFFOP<%= name %>','10')">
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <input type="text" name="E02OFFBK<%= name %>" size="2" maxlength="2" value="<%= lnCancelDet.getField("E02OFFBK"+name).getString().trim()%>" onkeypress="enterInteger()">
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <input type="text" name="E02OFFBR<%= name %>" size="3" maxlength="3" value="<%= lnCancelDet.getField("E02OFFBR"+name).getString().trim()%>"
                oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E02DEABNK.value,'','','','')" onkeypress="enterInteger()">
        </div>
      </td>
      <td nowrap  > 
        <div align="center"> 
          <input type="text" name="E02OFFCY<%= name %>" size="3" maxlength="3" value="<%= lnCancelDet.getField("E02OFFCY"+name).getString().trim()%>"
                oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E02DEABNK.value,'','','','')">
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
        <input type="text" name="E02OFFGL<%= name %>" size="15" maxlength="12" value="<%= lnCancelDet.getField("E02OFFGL"+name).getString().trim()%>"
        oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E02DEABNK.value,document.forms[0]['E01OFFCY<%= name %>'].value,'','','')">
        
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
           <input type="text" name="E02OFFAC<%= name %>" size="12" maxlength="9"  value="<%= lnCancelDet.getField("E02OFFAC"+name).getString().trim()%>"
                oncontextmenu="showPopUp(openingWireHelp,this.name,document.forms[0].E02DEABNK.value,'','','','RC')"  onkeypress="enterInteger()">
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
            <input type="text" name="E02OFFAM<%= name %>" size="15" maxlength="13"  value="<%= lnCancelDet.getField("E02OFFAM"+name).getString().trim()%>" onkeypress="enterDecimal()">
        </div>
      </td>      
    </tr>
    <%
    		}
    		%> 
     </table>
        </div>
    <table id="footTable" > 				
    <tr id="trdark"> 
            <td nowrap align="right"><b>Deal Currency Equivalent :</b> </td>
      <td nowrap align="center"><b><i><strong> 
          <input type="text" name="E02OFFEQV" size="15" maxlength="13" readonly value="<%= lnCancelDet.getE02OFFEQV().trim()%>">
          </strong></i></b>
      </td>
    </tr>
  </table>
  </TD>  
</TR>	
</TABLE>             
      </td>
    </tr>
  </table>
 <SCRIPT language="javascript">
    function tableresize() {
     adjustEquTables(headTable,dataTable,dataDiv,0,true);
   }
  tableresize();
  window.onresize=tableresize;  
  </SCRIPT>  
  <br>
  <div align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>
</form>
</body>
</html>
