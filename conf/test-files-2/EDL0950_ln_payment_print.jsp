<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Loan Payments</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "lnCancelDet" class= "datapro.eibs.beans.EDL095002Message"  scope="session"/>

 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>


<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>



<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

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
<h3 align="center">Loan Payments</h3>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="ln_payment_print.jsp , EDL0950"> 
<hr size="4">
 <FORM>
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="38">
  </p>
  <table width="100%">
    <tr> 
      <td colspan="2"> 
        <div align="center">Not valid as a Payment Receipt</div>
      </td>
    </tr>
  </table>
 <BR>
  <table class="tableinfo">
    <tr> 
      <td width="19%"> 
        <div align="right">Customer :</div>
      </td>
      <td width="33%"><%= lnCancelDet.getE02CUSNA1().trim()%></td>
      <td width="3%">&nbsp;</td>
      <td width="17%"> 
        <div align="right">Account Number :</div>
      </td>
      <td colspan="2" width="28%"> 
        <div align="left"></div>
        <%= lnCancelDet.getE02DEAACC().trim()%></td>
    </tr>
  </table>
  <BR>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="23%" > 
              <div align="right">Original Amount :</div>
            </td>
            <td nowrap width="27%" > 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02DEAOAM().trim())%></div>
            </td>
            <td nowrap width="25%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="25%" > 
              <div align="right"></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="23%" > 
              <div align="right">Opening Date :</div>
            </td>
            <td nowrap width="27%" > 
              <div align="right"><%= Util.formatDate(lnCancelDet.getE02DEAOD1(),lnCancelDet.getE02DEAOD2(),lnCancelDet.getE02DEAOD3())%></div>
            </td>
            <td nowrap width="25%" > 
              <div align="right">Maturity Date :</div>
            </td>
            <td nowrap width="25%" > 
              <div align="right"><%= Util.formatDate(lnCancelDet.getE02DEAMD1(),lnCancelDet.getE02DEAMD2(),lnCancelDet.getE02DEAMD3())%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="23%" > 
              <div align="right">Interest Rate :</div>
            </td>
            <td nowrap width="27%" > 
              <div align="right"><%= lnCancelDet.getE02DEARTE().trim()%></div>
            </td>
            <td nowrap width="25%" > 
              <div align="right">Term :</div>
            </td>
            <td nowrap width="25%" > 
              <div align="right"><%= lnCancelDet.getE02DEATRM().trim()%> 
                - <% if(lnCancelDet.getE02DEATRC().equals("Y")) out.print("Year(s)");
              				else if(lnCancelDet.getE02DEATRC().equals("M")) out.print("Month(s)");
							else out.print("Day(s)");%></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <BR>
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right"><b>Description</b></div>
            </td>
            <td nowrap > 
              <div align="right"><b>Previous Balance</b></div>
            </td>
            <td nowrap > 
              <div align="right"><b>Transaction</b></div>
            </td>
            <td nowrap > 
              <div align="right"><b>New Balance</b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Principal :</div>
            </td>
            <td nowrap > 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02BEFPRI().trim())%></div>
            </td>
            <td nowrap > 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02TRNPRI().trim())%></div>
            </td>
            <td nowrap > 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02AFTPRI().trim())%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Adjustment :</div>
            </td>
            <td nowrap > 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02BEFREA().trim())%></div>
            </td>
            <td nowrap > 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02TRNREA().trim())%></div>
            </td>
            <td nowrap > 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02AFTREA().trim())%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Interest :</div>
            </td>
            <td nowrap > 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02BEFINT().trim())%></div>
            </td>
            <td nowrap > 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02TRNINT().trim())%></div>
            </td>
            <td nowrap > 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02AFTINT().trim())%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Late Charges:</div>
            </td>
            <td nowrap > 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02BEFMOR().trim())%></div>
            </td>
            <td nowrap > 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02TRNMOR().trim())%></div>
            </td>
            <td nowrap > 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02AFTMOR().trim())%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Taxes :</div>
            </td>
            <td nowrap> 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02BEFIMP().trim())%></div>
            </td>
            <td nowrap > 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02TRNIMP().trim())%></div>
            </td>
            <td nowrap > 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02AFTIMP().trim())%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Commissions :</div>
            </td>
            <td nowrap > 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02BEFCOM().trim())%></div>
            </td>
            <td nowrap > 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02TRNCOM().trim())%></div>
            </td>
            <td nowrap > 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02AFTCOM().trim())%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Deductions :</div>
            </td>
            <td nowrap > 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02BEFDED().trim())%></div>
            </td>
            <td nowrap > 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02TRNDED().trim())%></div>
            </td>
            <td nowrap > 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02AFTDED().trim())%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Total :</div>
            </td>
            <td nowrap > 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02BEFTOT().trim())%></div>
            </td>
            <td nowrap > 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02TRNTOT().trim())%></div>
            </td>
            <td nowrap > 
              <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02AFTTOT().trim())%></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
 <BR>
 <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="24%" > 
              <div align="right">Debit Account :</div>
            </td> 
            <td nowrap width="76%" > 
              <div align="left"></div>
              <%
  				   int amount = 9;
 				   String name = 1 + "";
 			%>
              <%= lnCancelDet.getField("E02OFFBK"+name).getString().trim()%> <%= lnCancelDet.getField("E02OFFBR"+name).getString().trim()%> 
              <%= lnCancelDet.getField("E02OFFCY"+name).getString().trim()%> <%= lnCancelDet.getField("E02OFFGL"+name).getString().trim()%> 
              <%= lnCancelDet.getField("E02OFFAC"+name).getString().trim()%> <%= lnCancelDet.getField("E02OFFAM"+name).getString().trim()%> </td>
          </tr>
			<%
  					for ( int i=2; i<=amount; i++ ) {
   					  name = i + "";
   					  if (!lnCancelDet.getField("E02OFFGL"+name).getString().trim().equals("0") || !lnCancelDet.getField("E02OFFAC"+name).getString().trim().equals("0")) {
   			%>                    
				          <tr id="trclear">
				            <td nowrap width="24%" >&nbsp;</td>
				            <td nowrap width="76%" >
				            	<%= lnCancelDet.getField("E02OFFBK"+name).getString().trim()%> <%= lnCancelDet.getField("E02OFFBR"+name).getString().trim()%> 
              					<%= lnCancelDet.getField("E02OFFCY"+name).getString().trim()%> <%= lnCancelDet.getField("E02OFFGL"+name).getString().trim()%> 
              					<%= lnCancelDet.getField("E02OFFAC"+name).getString().trim()%> <%= lnCancelDet.getField("E02OFFAM"+name).getString().trim()%>
              				</td>
				          </tr>
    		<%
    					}
    				}
    		%> 
		    
          <tr id="trclear"> 
            <td nowrap width="24%" > 
              <div align="right">Description :</div>
            </td>
            <td nowrap width="76%" > 
              <div align="left"></div>
              <%= lnCancelDet.getE02DEANR1().trim()%></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="24%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="76%" > 
              <div align="left"><%= lnCancelDet.getE02DEANR2().trim()%></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <div align="center"> </div>
</form>
</body>
</html>
