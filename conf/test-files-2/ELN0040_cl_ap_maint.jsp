<html>
<head>
<title>Line of Credit Basic Information</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="clMant" class="datapro.eibs.beans.ELN000001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   builtNewMenu(cl_a_opt);


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
  out.println("<SCRIPT> initMenu(); </SCRIPT>");
%> 
<h3 align="center">Credit Lines - Basic Information</h3>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cl_ap_maint,ELN0040">
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.credit.JSELN0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
  <INPUT TYPE=HIDDEN NAME="E01WLNBNK"  value="<%= clMant.getE01WLNBNK().trim()%>">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="13%" > 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" readonly name="E01WLNCUN" size="9" maxlength="9" value="<%= clMant.getE01WLNCUN().trim()%>">
              </div>
            </td>
            <td nowrap width="17%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" readonly name="E01CUSNA1" size="45" maxlength="45" value="<%= clMant.getE01CUSNA1().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="13%"> 
              <div align="right"><b>Line : </b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" readonly name="E01WLNNUM" size="5" maxlength="4" value="<%= clMant.getE01WLNNUM().trim()%>" >
              </div>
            </td>
            <td nowrap width="17%"> 
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"><b> 
                <input type="text" readonly <% if (clMant.getF01LNECCY().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNCCY1" size="3" maxlength="3" value="<%= clMant.getE01WLNCCY().trim()%>" >
                </b> </div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><b>Credit Amount :</b></div>
            </td>
            <td nowrap width="21%"> 
              <div align="left"><b> 
                <input type="text" readonly <% if (clMant.getF01LNECCU().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNCCU1" size="9" maxlength="9" value="<%= clMant.getE01WLNCCU().trim()%>" >
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Basic Information</h4>
      <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Bank / Branch :</div>
            </td>
            <td nowrap width="25%" > 
              <input type="text" readonly  <% if (clMant.getF01LNEBNK().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNBNK" size="2" maxlength="2" value="<%= clMant.getE01WLNBNK().trim()%>" >
              <input type="text" readonly <% if (clMant.getF01LNEBRN().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNBRN" size="4" maxlength="3" value="<%= clMant.getE01WLNBRN().trim()%>" >
            </td>
            <td nowrap width="27%" > 
              <div align="right">Committed :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" readonly <% if (clMant.getF01LNECOU().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNCOU" size="6" 
				value="<% if (clMant.getE01WLNCOU().equals("C")) out.print("Yes"); else if (clMant.getE01WLNCOU().equals("U")) out.print("No"); %>" maxlength="6" >
			</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Currency / G/L Number :</div>
            </td>
            <td nowrap width="25%" > 
              <input type="text" readonly <% if (clMant.getF01LNECCY().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNCCY" size="4" maxlength="3" value="<%= clMant.getE01WLNCCY().trim()%>" >
              <input type="text" readonly <% if (clMant.getF01LNEGLN().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNGLN" size="16" maxlength="16" value="<%= clMant.getE01WLNGLN().trim()%>" >
            </td>
            <td nowrap width="27%" > 
              <div align="right">Maturity Date :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" readonly <% if (clMant.getF01LNEMT1().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNMT1" size="2" maxlength="2" value="<%= clMant.getE01WLNMT1().trim()%>" >
              <input type="text" readonly <% if (clMant.getF01LNEMT2().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNMT2" size="2" maxlength="2" value="<%= clMant.getE01WLNMT2().trim()%>" >
              <input type="text" readonly <% if (clMant.getF01LNEMT3().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNMT3" size="2" maxlength="2" value="<%= clMant.getE01WLNMT3().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Opening Date :</div>
            </td>
            <td nowrap width="25%" > 
              <input type="text" readonly <% if (clMant.getF01LNEOP1().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNOP1" size="2" maxlength="2" value="<%= clMant.getE01WLNOP1().trim()%>" >
              <input type="text" readonly <% if (clMant.getF01LNEOP2().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNOP2" size="2" maxlength="2" value="<%= clMant.getE01WLNOP2().trim()%>" >
              <input type="text" readonly <% if (clMant.getF01LNEOP3().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNOP3" size="2" maxlength="2" value="<%= clMant.getE01WLNOP3().trim()%>" >
            </td>
            <td nowrap width="27%" > 
              <div align="right">Cost Center :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" readonly <% if (clMant.getF01LNECCS().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNCCS" size="8" maxlength="8" value="<%= clMant.getE01WLNCCS().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Terms :</div>
            </td>
            <td nowrap width="25%" > 
              <input type="text" readonly <% if (clMant.getF01LNETER().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNTER" size="4" maxlength="3" value="<%= clMant.getE01WLNTER().trim()%>">
              <input type="text" readonly <% if (clMant.getF01LNETRC().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNTRC" size="10" 
                value="<% if(clMant.getE01WLNTRC().equals("D")) out.print("Day(s)");
                	 	  else if(clMant.getE01WLNTRC().equals("M")) out.print("Month(s)");
                		  else if(clMant.getE01WLNTRC().equals("Y")) out.print("Year(s)"); %>">
            </td>
            <td nowrap width="27%" > 
              <div align="right">Authorization Date :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" readonly <% if (clMant.getF01LNEAU1().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNAU1" size="2" maxlength="2" value="<%= clMant.getE01WLNAU1().trim()%>" >
              <input type="text" readonly <% if (clMant.getF01LNEAU2().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNAU2" size="2" maxlength="2" value="<%= clMant.getE01WLNAU2().trim()%>" >
              <input type="text" readonly <% if (clMant.getF01LNEAU3().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNAU3" size="2" maxlength="2" value="<%= clMant.getE01WLNAU3().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Authorization Type :</div>
            </td>
            <td nowrap width="25%" > 
              <input type="text" readonly <% if (clMant.getF01LNEATY().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNATY" size="3" maxlength="2" value="<%= clMant.getE01WLNATY().trim()%>" >
            </td>
            <td nowrap width="27%" > 
              <div align="right">Type of Line :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" readonly <% if (clMant.getF01LNETYL().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNTYL" size="3" maxlength="3" value="<%= clMant.getE01WLNTYL().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Category of Line :</div>
            </td>
            <td nowrap width="25%" > 
              <input type="text" name="E01WLNCAT" readonly  size="35" maxlength="35" 
				<% if (clMant.getF01LNECAT().equals("Y")) out.print("id=\"txtchanged\""); %>
				  value="<% if (clMant.getE01WLNCAT().equals("A")) out.print("Authorized / Active");
							else if (clMant.getE01WLNCAT().equals("G")) out.print("Collateral Required");
							else if (clMant.getE01WLNCAT().equals("I")) out.print("Non Processed / Inactive");
							else if (clMant.getE01WLNCAT().equals("S")) out.print("Supervised");
							else if (clMant.getE01WLNCAT().equals("N")) out.print("Non Revolving Line");
							else if (clMant.getE01WLNCAT().equals("R")) out.print("Renewal Line");
							else if (clMant.getE01WLNCAT().equals("C")) out.print("Line Control");
							else out.print("");%>">
            </td>
            <td nowrap width="27%" > 
              <div align="right">Revision Date :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" readonly <% if (clMant.getF01LNERV1().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNRV1" size="2" maxlength="2" value="<%= clMant.getE01WLNRV1().trim()%>" >
              <input type="text" readonly <% if (clMant.getF01LNERV2().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNRV2" size="2" maxlength="2" value="<%= clMant.getE01WLNRV2().trim()%>" >
              <input type="text" readonly <% if (clMant.getF01LNERV3().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNRV3" size="2" maxlength="2" value="<%= clMant.getE01WLNRV3().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" height="22" > 
              <div align="right">Amount Approved :</div>
            </td>
            <td nowrap width="25%" height="22" > 
              <input type="text" readonly <% if (clMant.getF01LNEAMN().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNAMN" size="15" maxlength="15" value="<%= clMant.getE01WLNAMN().trim()%>" >
            </td>
            <td nowrap width="27%" height="22" > 
              <div align="right">Reallocation Date :</div>
            </td>
            <td nowrap width="23%" height="22" > 
              <input type="text" readonly <% if (clMant.getF01LNERE1().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNRE1" size="2" maxlength="2" value="<%= clMant.getE01WLNRE1().trim()%>" >
              <input type="text" readonly <% if (clMant.getF01LNERE2().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNRE2" size="2" maxlength="2" value="<%= clMant.getE01WLNRE2().trim()%>" >
              <input type="text" readonly <% if (clMant.getF01LNERE3().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNRE3" size="2" maxlength="2" value="<%= clMant.getE01WLNRE3().trim()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Reallocation Amount :</div>
            </td>
            <td nowrap width="25%" > 
              <input type="text" readonly <% if (clMant.getF01LNEREA().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNREA" size="15" maxlength="15" value="<%= clMant.getE01WLNREA().trim()%>" >
            </td>
            <td nowrap width="27%" > 
              <div align="right">Term Indicator :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" readonly <% if (clMant.getF01LNETRM().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNTRM" size="24" 
                value="<% if (clMant.getE01WLNTRM().equals("L")) out.print("Long Term");
                		  else if (clMant.getE01WLNTRM().equals("S")) out.print("Short Term");
                		  else if(clMant.getE01WLNTRM().equals("T")) out.print("Correspondant"); %>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Authorized by :</div>
            </td>
            <td nowrap width="25%" > 
              <input type="text" readonly <% if (clMant.getF01LNEABY().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNABY" size="26" maxlength="25" value="<%= clMant.getE01WLNABY().trim()%>" >
            </td>
            <td nowrap width="27%" > 
              <div align="right">Line Control :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" readonly <% if (clMant.getF01LNECCU().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNCCU" size="10" maxlength="9" value="<%= clMant.getE01WLNCCU().trim()%>" >
              <input type="text" readonly <% if (clMant.getF01LNECLN().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNCLN" size="5" maxlength="4" value="<%= clMant.getE01WLNCLN().trim()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Customer / Related Line :</div>
            </td>
            <td nowrap width="25%" > 
              <input type="text" readonly <% if (clMant.getF01LNECGM().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNCGM" size="10" maxlength="9" value="<%= clMant.getE01WLNCGM().trim()%>" >
              <input type="text" readonly <% if (clMant.getF01LNELGM().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNLGM" size="5" maxlength="4" value="<%= clMant.getE01WLNLGM().trim()%>" >
            </td>
            <td nowrap width="27%" > 
              <div align="right">Credit Card Number :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" readonly name="E01WLNTJT" size="17" maxlength="16" value="<%= clMant.getE01WLNTJT().trim()%>" >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Tariff</h4>
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="28%" > 
              <div align="right">Loans Tariff Table :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" readonly <% if (clMant.getF01LNETLN().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNTLN" size="2" maxlength="1" value="<%= clMant.getE01WLNTLN().trim()%>" >
            </td>
            <td nowrap width="20%" > 
              <div align="right">Grace Period - Rate :</div>
            </td>
            <td nowrap width="22%" > 
              <input type="text" readonly <% if (clMant.getF01LNEMRT().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNMRT" size="10" maxlength="9" value="<%= clMant.getE01WLNMRT().trim()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="28%" > 
              <div align="right">L/C Tariff Table :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" readonly <% if (clMant.getF01LNETLC().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNTLC" size="2" maxlength="1" value="<%= clMant.getE01WLNTLC().trim()%>" >
            </td>
            <td nowrap width="20%" > 
              <div align="right">Floating Rate Type Code :</div>
            </td>
            <td nowrap width="22%" > 
              <input type="text" readonly <% if (clMant.getF01LNEFTB().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNFTB" size="2" maxlength="2" value="<%= clMant.getE01WLNFTB().trim()%>">
              <input type="text" readonly <% if (clMant.getF01LNEFTY().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNFTY" size="10"
                value="<% if (clMant.getE01WLNFTY().equals("FP")) out.print("Primaria");
                		  else if (clMant.getE01WLNFTY().equals("FS")) out.print("Secundaria");
						  else out.println(""); %>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="28%" > 
              <div align="right">DDA Tariff Table :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" readonly <% if (clMant.getF01LNETRT().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNTRT" size="2" maxlength="1" value="<%= clMant.getE01WLNTRT().trim()%>" >
            </td>
            <td nowrap width="20%" > 
              <div align="right">Customer Credit Level :</div>
            </td>
            <td nowrap width="22%" > 
              <input type="text" readonly <% if (clMant.getF01LNECRR().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNCRR" size="2" maxlength="1" value="<%= clMant.getE01WLNCRR().trim()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="28%" > 
              <div align="right">Line Purpose :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" readonly <% if (clMant.getF01LNEPUR().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNPUR" size="36" maxlength="35" value="<%= clMant.getE01WLNPUR().trim()%>">
            </td>
            <td nowrap width="20%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="22%" >&nbsp; </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Charges</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="21%" > 
              <div align="right">Fee Type :</div>
            </td>
            <td nowrap width="21%" > 
              <input type="text" name="E01WLNFET" readonly  size="30" maxlength="30" 
				  value="<% if (clMant.getE01WLNFET().equals("00")) out.print("No Fees");
							else if (clMant.getE01WLNFET().equals("01")) out.print("Fees for Unused Balances");
							else if (clMant.getE01WLNFET().equals("02")) out.print("Fees for Used Balances");
							else if (clMant.getE01WLNFET().equals("03")) out.print("Fees for Unused Averages Balances");
							else if (clMant.getE01WLNFET().equals("04")) out.print("Fees for Used Averages Balances");
							else if (clMant.getE01WLNFET().equals("05")) out.print("Fees for Total Amount of the Line");
							else out.print("");%>">
            </td>
            <td nowrap width="20%" > 
              <div align="right">Next Charge Date :</div>
            </td>
            <td nowrap width="38%" > 
              <input type="text" readonly <% if (clMant.getF01LNECH1().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNCH1" size="2" maxlength="2" value="<%= clMant.getE01WLNCH1().trim()%>" >
              <input type="text" readonly <% if (clMant.getF01LNECH2().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNCH2" size="2" maxlength="2" value="<%= clMant.getE01WLNCH2().trim()%>" >
              <input type="text" readonly <% if (clMant.getF01LNECH3().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNCH3" size="2" maxlength="2" value="<%= clMant.getE01WLNCH3().trim()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" > 
              <div align="right">Rate for Fees :</div>
            </td>
            <td nowrap width="21%" > 
              <input type="text" readonly <% if (clMant.getF01LNEPRD().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNBSR" size="10" maxlength="9" value="<%= clMant.getE01WLNBSR().trim()%>" >
            </td>
            <td nowrap width="20%" > 
              <div align="right">Period Base Days :</div>
            </td>
            <td nowrap width="38%" > 
              <input type="text" readonly <% if (clMant.getF01LNEYBS().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNYBS" size="4" maxlength="3" value="<%= clMant.getE01WLNYBS().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="21%" > 
              <div align="right">Frequency :</div>
            </td>
            <td nowrap width="21%" > 
              <input type="text" name="E01WLNPRD" readonly  size="20" maxlength="20" 
				  value="<% if (clMant.getE01WLNPRD().equals("M")) out.print("Monthly");
							else if (clMant.getE01WLNPRD().equals("Q")) out.print("Quaterly");
							else if (clMant.getE01WLNPRD().equals("S")) out.print("Semi - Annually");
							else if (clMant.getE01WLNPRD().equals("R")) out.print("Rollover");
							else out.print("");%>">
            </td>
            <td nowrap width="20%" > 
              <div align="right">Debit Account :</div>
            </td>
            <td nowrap width="38%" > 
              <input type="text" readonly <% if (clMant.getF01LNEBDA().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNBDA" size="2" maxlength="2" value="<%= clMant.getE01WLNBDA().trim()%>" >
              <input type="text" readonly <% if (clMant.getF01LNEDAB().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNDAB" size="4" maxlength="3" value="<%= clMant.getE01WLNDAB().trim()%>" >
              <input type="text" readonly <% if (clMant.getF01LNECDA().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNCDA" size="4" maxlength="3" value="<%= clMant.getE01WLNCDA().trim()%>" >
              <input type="text" readonly <% if (clMant.getF01LNEADN().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01WLNADN" size="16" maxlength="16" value="<%= clMant.getE01WLNADN().trim()%>" >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  </form>
</body>
</html>
