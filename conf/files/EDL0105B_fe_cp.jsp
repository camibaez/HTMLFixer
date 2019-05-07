<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import = "java.math.BigDecimal" %>

<html>
<head>
<title>Back Office</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">



<jsp:useBean id="deal" class="datapro.eibs.beans.EDL010502Message"  scope="session" />
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

<% if( request.getParameter("PURPOSE") != null &&
		request.getParameter("PURPOSE").equals("MAINT")  ) { %>
	builtNewMenu( cp_m_opt ) ;
	initMenu() ;
<% }  %>

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
<h3 align="center">Commercial Papers - Back Office<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="fe_cp.jsp,EDL0105B">
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0105B" >
<input type="hidden" name="SCREEN"  value="4" >
<INPUT TYPE=HIDDEN NAME="SCRACMBNK" VALUE="<%= deal.getE02DEABNK().trim()%>">
<INPUT TYPE=HIDDEN NAME="E02DLSSBT" VALUE="<%= deal.getE02DLSSBT().trim()%>">
<INPUT TYPE=HIDDEN NAME="E02DLSHEM" VALUE="<%= deal.getE02DLSHEM().trim()%>">

<%!
	double difer(String oam, String net)
	{
		oam = oam.replaceAll(",", "");
		net = net.replaceAll(",", "");
    	double premium = Double.parseDouble(net) - Double.parseDouble(oam);
    	return premium;
    }
%>
  <table class="tableinfo" width="100%" >
    <tr id="trclear">
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trclear">
            <td nowrap width="15%" >
              <div align="right"><b>Counterparty :</b></div>
            </td>
            <td nowrap colspan="3" width="85%" >
              <div align="left">
                <input type="hidden" name="E02CUSNA1"  value="<%= deal.getE02CUSNA1()%>" >
                <%= deal.getE02CUSNA1()%> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Basic Information
  </h4>
  <table  class="tableinfo" width="736">
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trclear">
            <td nowrap >
              <div align="right">Date :</div>
            </td>
            <td nowrap ><%= Util.formatDate(deal.getE02DEAOD1(),deal.getE02DEAOD2(),deal.getE02DEAOD3())%></td>
            <td nowrap >
              <div align="right">Time :</div>
            </td>
            <td nowrap >
            	<% if (deal.getE02DEAREF().length() > 6) out.print(deal.getE02DEAREF().substring(deal.getE02DEAREF().length() - 6)); %>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="21%" >
              <div align="right">Broker :</div>
            </td>
            <td nowrap width="23%" > <%= deal.getE02DLSBRK()%> - <%= deal.getE02DLSBDS()%>
            </td>
            <td nowrap width="18%" >
              <div align="right"> Action Taken :</div>
            </td>
            <td nowrap width="20%" ><% if(deal.getE02DLSSBT().equals("PU")) out.print("New Purchase");
					   else if(deal.getE02DLSSBT().equals("PA")) out.print("Additional Purchase");
					    else if(deal.getE02DLSSBT().equals("SL")) out.print("Sale outright");
					     else if(deal.getE02DLSSBT().equals("S1")) out.print("Re-Sale");
					      else if(deal.getE02DLSSBT().equals("PR")) out.print("Re-Purchase");
					      else if(deal.getE02DLSSBT().equals("RL")) out.print("Release");
					       else if(deal.getE02DLSSBT().equals("SS")) out.print("Short Sale");
						    else out.print(""); if (deal.getE02DLSSBT().equals("PR")) out.print(" Deal : "+deal.getE02DLSHEM()); %>
			</td>
          </tr>
          <tr id="trclear">
            <td nowrap width="21%" >
              <div align="right">Reference Number :</div>
            </td>
            <td nowrap width="23%" ><%= deal.getE02DEAREF().trim()%> </td>
            <td nowrap width="18%" >
              <div align="right">Line of Credit :</div>
            </td>
            <td nowrap width="20%" >
			  <%= deal.getE02DEACMC().trim()%>
			  &nbsp;/&nbsp;
              <%= deal.getE02DEACMN().trim()%>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="21%" >
              <div align="right">Currency :</div>
            </td>
            <td nowrap width="23%" ><%= deal.getE02DEACCY().trim()%>  </td>
            <td nowrap align="right" width="18%">Face Value :</td>
            <td nowrap width="20%"><%= Util.fcolorCCY(deal.getE02DEAOAM())%> </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="21%" >
              <div align="right">Price : </div>
            </td>
            <td nowrap width="23%" > <%= Util.fcolorCCY(deal.getE02BIDPRC())%>
            </td>
           <td nowrap align="right" width="18%">
              <div align="right">Accrued Interest :</div>
            </td>
            <td nowrap width="20%"><%= deal.getE02DEAINT().trim()%> </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="21%" >
              <div align="right">Coupon Rate :</div>
            </td>
            <td nowrap width="23%" >
            	<%= Util.fcolorCCY(deal.getE02DEARTE())%>
            </td>
            <td nowrap align="right" width="18%">
              <div align="right">Premium/Discount :</div>
            </td>
            <td nowrap width="20%">
            	<%= Util.fcolorCCY(new BigDecimal(
            	difer(deal.getE02DEAOAM() , deal.getE02NETPRC())
            	).setScale(2,BigDecimal.ROUND_HALF_UP).toString())%>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="21%" >
              <div align="right">Last Coupon Date :</div>
            </td>
            <td nowrap width="23%" >
            	<%= Util.formatDate(deal.getE02DEALI1(),deal.getE02DEALI2(),deal.getE02DEALI3())%>
            </td>
            <td nowrap align="right" width="18%">
              <div align="right">Net Proceeds :</div>
            </td>
            <td nowrap width="20%">
            	<%= Util.fcolorCCY(deal.getE02NETPRC())%>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="21%" >
              <div align="right">Trade Date :</div>
            </td>
            <td nowrap width="23%" ><%= Util.formatDate(deal.getE02DEAOD1(),deal.getE02DEAOD2(),deal.getE02DEAOD3())%>
            </td>
            <td nowrap align="right" width="18%">Settlement Date :</td>
            <td nowrap width="20%"> <%= Util.formatDate(deal.getE02DEAST1(),deal.getE02DEAST2(),deal.getE02DEAST3())%>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="21%" ></td>
            <td nowrap width="23%" ></td>
            <td nowrap align="right" width="18%"></td>
            <td nowrap width="20%">
            </td>
          </tr>
			<tr id="trclear">
            <td nowrap width="21%" >
              <div align="right">Notes :</div>
            </td>
            <td nowrap colspan="3" ><%= deal.getE02DLSOT1().trim()%></td>
          </tr>
          <tr id="trclear">
            <td nowrap width="21%" >
              <div align="right"></div>
            </td>
            <td nowrap colspan="3" ><%= deal.getE02DLSOT2().trim()%></td>
          </tr>
          <tr id="trclear">
            <td nowrap width="21%" ><div align="right">Dealer :</div>
            </td>
            <td nowrap width="25%"> <%= deal.getE02DLSUSR().trim()%></td>
            <td nowrap width="25%" align="right">Negociated By :</td>
            <td nowrap width="25%"><%= deal.getE02DL1OFI().trim()%></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Additional Information</h4>
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="25%">
              <div align="right">Product :</div>
            </td>
            <td nowrap width="23%">
              <input type="text" name="E02DEAPRO" size="5" maxlength="4" value="<%= deal.getE02DEAPRO().trim()%>" >
              <input type="hidden" name="EDSCPRO"  value="" >
               <a href="javascript:GetProduct('E02DEAPRO','EDSCPRO','13','')""><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
                <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0" >
            </td>
            <td nowrap width="25%">
              <div align="right">Redemption Date :</div>
            </td>
            <td nowrap width="27%">
              <input type="text" name="E02DEAMD1" size="2" maxlength="2" value="<%= deal.getE02DEAMD1().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E02DEAMD2" size="2" maxlength="2" value="<%= deal.getE02DEAMD2().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E02DEAMD3" size="2" maxlength="2" value="<%= deal.getE02DEAMD3().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E02DEAMD1,document.forms[0].E02DEAMD2,document.forms[0].E02DEAMD3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0" >
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="25%" height="37">
              <div align="right">Terms :</div>
            </td>
            <td nowrap width="23%" height="37">
             <input type="text" name="E02DEATRM" size="4" maxlength="3" value="<%= deal.getE02DEATRM().trim()%>" >
              <select  name="E02DEATRC">
                <option value=" " <% if (!(deal.getE02DEATRC().equals("D") ||deal.getE02DEATRC().equals("M")||deal.getE02DEATRC().equals("Y"))) out.print("selected"); %>></option>
                <option value="D" <% if(deal.getE02DEATRC().equals("D")) out.print("selected");%>>Day(s)</option>
                <option value="M" <% if(deal.getE02DEATRC().equals("M")) out.print("selected");%>>Month(s)</option>
                <option value="Y" <% if(deal.getE02DEATRC().equals("Y")) out.print("selected");%>>Year(s)</option>
              </select>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0" >
            </td>
            <td nowrap width="25%" height="37">
              <div align="right">Yield :</div>
            </td>
            <td nowrap width="27%" height="37">
				<input type="text" name="E02DEAMXR" size="13" maxlength="12" value="<%= deal.getE02DEAMXR().trim()%>" >
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="25%" height="37">
              <div align="right">Accrual Type Basis :</div>
            </td>
            <td nowrap width="23%" height="37">
               <select name="E02DEAICT">
                <option value="" <%if (deal.getE02DEAICT().equals("")) { out.print("selected"); }%>></option>
                <option value="1" <%if (deal.getE02DEAICT().equals("1")) { out.print("selected"); }%>>Actual/actual (in period)</option>
                <option value="2" <%if (deal.getE02DEAICT().equals("2")) { out.print("selected"); }%>>Actual/365</option>
                <option value="3" <%if (deal.getE02DEAICT().equals("3")) { out.print("selected"); }%>>Actual/365 (366 in leap year)</option>
                <option value="4" <%if (deal.getE02DEAICT().equals("4")) { out.print("selected"); }%>>Actual/360</option>
                <option value="5" <%if (deal.getE02DEAICT().equals("5")) { out.print("selected"); }%>>30/360</option>
                <option value="6" <%if (deal.getE02DEAICT().equals("6")) { out.print("selected"); }%>>30E/360</option>
              </select>
            </td>
            <td nowrap width="25%" height="37">
              <div align="right">Payment Via :</div>
            </td>
            <td nowrap width="27%" height="37">
                <select name="E02DEAPVI" >
                  <option value="" <% if(deal.getE02DEAPVI().equals("")) out.print("selected");%>></option>
                  <option value="F" <% if(deal.getE02DEAPVI().equals("F")) out.print("selected");%>>Fed</option>
                  <option value="1" <% if(deal.getE02DEAPVI().equals("1")) out.print("selected");%>>Swift MT-103</option>
                  <option value="2" <% if(deal.getE02DEAPVI().equals("2")) out.print("selected");%>>Swift MT-200</option>
				  <option value="3" <% if(deal.getE02DEAPVI().equals("3")) out.print("selected");%>>Swift MT-202</option>
				  <option value="G" <% if(deal.getE02DEAPVI().equals("G")) out.print("selected");%>>General Ledger</option>
				  <option value="R" <% if(deal.getE02DEAPVI().equals("R")) out.print("selected");%>>Retail Account</option>
                  <option value="C" <% if(deal.getE02DEAPVI().equals("C")) out.print("selected");%>>Official Check</option>
                  <option value="A" <% if(deal.getE02DEAPVI().equals("A")) out.print("selected");%>>ACH</option>
                </select>
            </td>
          </tr>

          <tr id="trclear">
            <td nowrap width="25%" >
              <div align="right">Coupon Payment Period :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" name="E02DEAROY" size="5" maxlength="4" value="<%= deal.getE02DEAROY().trim()%>" >
              <SELECT name="E02DEAODA">
					<OPTION value=""
						<%if (deal.getE02DEAODA().equals("")) { out.print("selected"); }%>></OPTION>
					<OPTION value="P"
						<%if (deal.getE02DEAODA().equals("P")) { out.print("selected"); }%>>Monthly
					Period (Do Not Include Last Day)</OPTION>
					<OPTION value="I"
						<%if (deal.getE02DEAODA().equals("I")) { out.print("selected"); }%>>Monthly
					Period (Include Last Day)</OPTION>
					<OPTION value="Y"
						<%if (deal.getE02DEAODA().equals("Y")) { out.print("selected"); }%>>Yearly</OPTION>
					<OPTION value="M"
						<%if (deal.getE02DEAODA().equals("M")) { out.print("selected"); }%>>Day
					of the Month</OPTION>
					<OPTION value="D"
						<%if (deal.getE02DEAODA().equals("D")) { out.print("selected"); }%>>Days
					(31 End of Month)</OPTION>
					<OPTION value="Q"
						<%if (deal.getE02DEAODA().equals("Q")) { out.print("selected"); }%>>Quarterly</OPTION>
				</SELECT>
              <IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0">

            </td>
            <td nowrap width="25%" >
              <div align="right">Confirmation Type :</div>
            </td>
            <td nowrap width="27%" >
              <select name="E02DEAF03">
                <option value=" " <% if (!(deal.getE02DEAF03().equals("P") ||deal.getE02DEAF03().equals("S")||deal.getE02DEAF03().equals("N"))) out.print("selected"); %>></option>
                <option value="P" <% if (deal.getE02DEAF03().equals("P")) out.print("selected"); %>>Print</option>
                <option value="S" <% if (deal.getE02DEAF03().equals("S")) out.print("selected"); %>>Swift</option>
                <option value="N" <% if (deal.getE02DEAF03().equals("N")) out.print("selected"); %>>None</option>
              </select>

             </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="25%" >
              <div align="right">Investment Type :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" name="E02DEAUC6" size="5" maxlength="4" value="<%= deal.getE02DEAUC6().trim()%>" readonly>
            </td>
            <td nowrap width="25%" >
              <div align="right">Revaluation Type :</div>
            </td>
            <td nowrap width="27%" >
                 <select  name="E02DEARRT">
                <option value=" " <% if (!(deal.getE02DEARRT().equals("1") ||deal.getE02DEARRT().equals("2")||deal.getE02DEARRT().equals("3")||deal.getE02DEARRT().equals("4")||deal.getE02DEARRT().equals("N"))) out.print("selected"); %>></option>
                <option value="1" <% if (deal.getE02DEARRT().equals("1")) out.print("selected"); %>>Reval Gain & Losses Daily</option>
                <option value="2" <% if (deal.getE02DEARRT().equals("2")) out.print("selected"); %>>Reval Only Losses Daily</option>
                <option value="3" <% if (deal.getE02DEARRT().equals("3")) out.print("selected"); %>>Reval Gain & Losses Monthly</option>
                <option value="4" <% if (deal.getE02DEARRT().equals("4")) out.print("selected"); %>>Reval Only Losses Monthly</option>
                <option value="N" <% if (deal.getE02DEARRT().equals("N")) out.print("selected"); %>>No Revaluation</option>
              </select>

             </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="25%" >
              <div align="right">Safekeeper Number :</div>
            </td>
            <td nowrap width="23%" >
				<input type="text" name="E02SFENUM" size="11" maxlength="10" value="<%= deal.getE02SFENUM().trim()%>" onkeypress="enterInteger()">
				<a href="javascript:GetCustomerDescId('E02SFENUM','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0" ></a>
			</td>
            <td nowrap width="25%" >
              <div align="right">Cusip/Isin Code Number :</div>
            </td>
            <td nowrap width="27%" >
             	<INPUT type="text" name="E02DEACUI" size="13"	maxlength="12" value="<%= deal.getE02DEACUI().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="25%" >
              <div align="right">Documents Location :</div>
            </td>
            <td nowrap width="25%">
            	<input type="text" name="E02DEALOC" size="40" maxlength="35" value="<%= deal.getE02DEALOC().trim()%>" >
            </td>
            <TD nowrap width="25%">
              <DIV align="right">Country of Risk :</DIV>
            </TD><TD nowrap width="27%">
              <INPUT type="text" name="E02DEAGRC" size="13" maxlength="12" value="<%= deal.getE02DEAGRC().trim()%>">
              <A href="javascript:GetCodeCNOFC('E02DEAGRC','03')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></A>
             </TD>
            </tr>
           <tr id="trclear">
            <td nowrap width="25%" >
              <div align="right">Country of Residence :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" name="E02DEAGCD" size="5" maxlength="4" value="<%= deal.getE02DEAGCD().trim()%>" >
              <a href="javascript:GetCodeCNOFC('E02DEAGCD','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a>
            </td>
            <TD nowrap width="25%">
              <DIV align="right">Floating Rate :</DIV>
            </TD><TD nowrap width="27%">
              <INPUT type="text" name="E02RATE" size="9" maxlength="9" value="<%= deal.getE02RATE().trim()%>" readonly>
            </TD>

          </tr>
          <tr id="trdark">
            <td nowrap width="25%" >
              <div align="right">Floating Rate Type :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" name="E02DEAFTB" size="2" maxlength="2" value="<%= deal.getE02DEAFTB().trim()%>">
              <a href="javascript:GetFloating('E02DEAFTB')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
              <select name="E02DEAFTY">
                <option value=" " <% if (!(deal.getE02DEAFTY().equals("FP") ||deal.getE02DEAFTY().equals("FS"))) out.print("selected"); %>></option>
                <option value="FP" <% if (deal.getE02DEAFTY().equals("FP")) out.print("selected"); %>>Primary</option>
                <option value="FS" <% if (deal.getE02DEAFTY().equals("FS")) out.print("selected"); %>>Secondary</option>
              </select>
            </td>
            <TD nowrap width="25%">
              <DIV align="right">Cost Center :</DIV>
            </TD><TD nowrap width="27%">
              <INPUT type="text" name="E02DEACCN" size="8" maxlength="6" value="<%= deal.getE02DEACCN().trim()%>" readonly>
            </TD>

          </tr>
          <tr id="trclear">
            <td nowrap width="25%" >
              <div align="right">Rate Revision Date/Period :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" name="E02DEARD1" size="2" maxlength="2" value="<%= deal.getE02DEARD1().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E02DEARD2" size="2" maxlength="2" value="<%= deal.getE02DEARD2().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E02DEARD3" size="2" maxlength="2" value="<%= deal.getE02DEARD3().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E02DEARD1,document.forms[0].E02DEARD2,document.forms[0].E02DEARD3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></a>
              /
              <input type="text" name="E02DEARRP" size="3" maxlength="3" value="<%= deal.getE02DEARRP().trim()%>" onkeypress="enterCharNumber()" onblur="rightAlignCharNumber()">
            </td>
            <TD nowrap width="25%">
              <DIV align="right">Foreign Exchange Rate :</DIV>
            </TD><TD nowrap width="27%">
              <INPUT type="text" name="E02DEAEXR" size="15" maxlength="13" value="<%= deal.getE02DEAEXR().trim()%>" onkeypress="enterSignDecimal()">
            </TD>

          </tr>
          <tr id="trdark">
            <TD nowrap width="25%">
              <DIV align="right">First Coupon Payment Date :</DIV>
            </TD><TD nowrap width="23%">
              <INPUT type="text" name="E02DEABA1" size="2" maxlength="2" value="<%= deal.getE02DEABA1().trim()%>" onkeypress="enterInteger()">
              <INPUT type="text" name="E02DEABA2" size="2" maxlength="2" value="<%= deal.getE02DEABA2().trim()%>" onkeypress="enterInteger()">
              <INPUT type="text" name="E02DEABA3" size="2" maxlength="2" value="<%= deal.getE02DEABA3().trim()%>" onkeypress="enterInteger()">
              <A href="javascript:DatePicker(document.forms[0].E02DEABA1,document.forms[0].E02DEABA2,document.forms[0].E02DEABA3)"><IMG src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></A>

              </TD>

            <TD nowrap width="25%">
              <DIV align="right">Rollover Code :</DIV>
            </TD><TD nowrap width="23%">
              <INPUT type="text" name="E02DEAF02" size="2" maxlength="1" value="<%= deal.getE02DEAF02().trim()%>" readonly>
             </TD>

          </tr>

        </table>
      </td>
    </tr>
  </table>

<% if (!deal.getE02DLSSBT().equals("PR")) { %>

    <h4>Offset Accounts</h4>
  <TABLE class="tableinfo" align="center">
  <TR><TD>

   <table id="headTable">
    <tr id="trdark">
      <td nowrap align="center" >Concept</td>
      <td nowrap align="center" >Bank </td>
      <td nowrap align="center" >Branch</td>
      <td nowrap align="center" >Currency</td>
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
          <tr id="trclear")>
            <td nowrap>
                <div align="center">
                  <input type="text" name="E02OFFOP<%= name %>" size="2" maxlength="2" value="<%= deal.getField("E02OFFOP"+name).getString().trim()%>" onKeypress="enterInteger()">
                  <input type="hidden" name="E02OFFGL<%= name %>" value="<%= deal.getField("E02OFFGL"+name).getString().trim()%>">
                <input type="text" name="E02OFFCO<%= name %>" size="25" maxlength="25" readonly value="<%= deal.getField("E02OFFCO"+name).getString().trim()%>"
                  oncontextmenu="showPopUp(conceptHelp,this.name,document.forms[0].SCRACMBNK.value,'','E02OFFGL<%= name %>','E02OFFOP<%= name %>','13'); return false;">
              </div>
            </td>
            <td nowrap width="5%" >
              <div align="center">
                <input type="text" name="E02OFFBK<%= name %>" size="2" maxlength="2" value="<%= deal.getField("E02OFFBK"+name).getString().trim()%>" onKeypress="enterInteger()">
              </div>
            </td>
            <td nowrap  >
              <div align="center">
                <input type="text" name="E02OFFBR<%= name %>" size="3" maxlength="3" value="<%= deal.getField("E02OFFBR"+name).getString().trim()%>"
                oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].SCRACMBNK.value,'','','',''); return false;">
              </div>
            </td>
            <td nowrap >
              <div align="center">
                <input type="text" name="E02OFFCY<%= name %>" size="3" maxlength="3" value="<%= deal.getField("E02OFFCY"+name).getString().trim()%>"
                oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].SCRACMBNK.value,'','','',''); return false;">
              </div>
            </td>
            <td nowrap  >
              <div align="center">
                  <input type="text" name="E02OFFAC<%= name %>" size="12" maxlength="9"  value="<%= deal.getField("E02OFFAC"+name).getString().trim()%>"
                oncontextmenu="showPopUp(accountHelp,this.name,document.forms[0].SCRACMBNK.value,'','','','RT'); return false;" onKeypress="enterInteger()">
              </div>
            </td>
            <td nowrap  >
              <div align="center">
                  <input type="text" name="E02OFFAM<%= name %>" size="15" maxlength="13"  value="<%= deal.getField("E02OFFAM"+name).getString().trim()%>" onKeypress="enterDecimal()">
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
          <input type="text" name="E02OFFEQV" size="15" maxlength="13" readonly value="<%= deal.getE02OFFEQV().trim()%>">
          </strong></i></b>
      </td>
    </tr>
  </table>
  </TD>
</TR>
</TABLE>

    <h4>Repayment</h4>
  <TABLE class="tableinfo" align="center">
  <TR><TD>

   <table id="headTable1">
    <tr id="trdark">
      <td nowrap align="center" >Concept</td>
      <td nowrap align="center" >Bank </td>
      <td nowrap align="center" >Branch</td>
      <td nowrap align="center" >Currency</td>
      <td nowrap align="center" >Reference</td>
      <td nowrap align="center" >Amount</td>
    </tr>
    </table>

    <div id="dataDiv1" class="scbarcolor" style="height:60; overflow-y :scroll; z-index:0" >
     <table id="dataTable1" >
     <tr id="trclear">
      <td nowrap >
        <div align="center">
          <input type="text" name="E02REPOPE"  value="<%= deal.getE02REPOPE().trim()%>" size="2" maxlength="2">
          <input type="hidden" name="E02REPGLN" value="<%= deal.getE02REPGLN().trim()%>">
          <input type="text" name="E02REPCON" size="25" maxlength="25"  value="<%= deal.getE02REPCON().trim()%>"
          oncontextmenu="showPopUp(conceptHelp,this.name,document.forms[0].SCRACMBNK.value,'','E02REPGLN','E02REPOPE','13'); return false;">

        </div>
      </td>
      <td nowrap >
        <div align="center">
          <input type="text" name="E02REPBNK" size="2" maxlength="2" value="<%= deal.getE02REPBNK().trim()%>" onKeypress="enterInteger()">
        </div>
      </td>
      <td nowrap >
        <div align="center">
          <input type="text" name="E02REPBRN" size="3" maxlength="3" value="<%= deal.getE02REPBRN().trim()%>"
			oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].SCRACMBNK.value,'','','',''); return false;">
        </div>
      </td>
      <td nowrap  >
        <div align="center">
          <input type="text" name="E02REPCCY" size="3" maxlength="3" value="<%= deal.getE02REPCCY().trim()%>"
          oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].SCRACMBNK.value,'','','',''); return false;">
        </div>
      </td>
      <td nowrap >
        <div align="center">
          <input type="text" name="E02REPACC" size="12" maxlength="9"  value="<%= deal.getE02REPACC().trim()%>"
          oncontextmenu="showPopUp(accountHelp,this.name,document.forms[0].SCRACMBNK.value,'','','','RT'); return false;" onKeypress="enterInteger()">
        </div>
      </td>
    </tr>
     </table>
        </div>
  </TD>
</TR>
</TABLE>

<% } %>

   <SCRIPT language="javascript">
    function tableresize() {
     adjustEquTables(headTable,dataTable,dataDiv,0,true);
     adjustEquTables(headTable1,dataTable1,dataDiv1,0,true);
   }
  tableresize();
  window.onresize=tableresize;
  </SCRIPT>

  <h4>Limits</h4>
  <table  class="tableinfo" >
    <tr >
      <td nowrap>
        <table width="100%">
          <tr id="trdark">
            <td nowrap>&nbsp;</td>
            <td nowrap  colspan="2">
              <div align="center"><b>Limit Amount </b></div>
            </td>
            <td nowrap >
              <div align="center"><b>Utilized Limit Amount</b></div>
            </td>
            <td nowrap >
              <div align="center"><b>Available Limit Amount </b></div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap>Credit Lines</td>
            <td nowrap  colspan="2">
              <div align="right"><%= Util.fcolorCCY(deal.getE02DLSAMT1())%></div>
            </td>
            <td nowrap >
              <div align="right"><%= Util.fcolorCCY(deal.getE02DLSAMT3())%></div>
            </td>
            <td nowrap >
              <div align="right"><b><%= Util.fcolorCCY(deal.getE02DLSAMT2())%></b></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <br>
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
