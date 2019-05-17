<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Loans Inquiry Approval</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="apBasic" class="datapro.eibs.beans.EDL015001Message"  scope="session" />

<jsp:useBean id= "ded" class= "datapro.eibs.beans.JBListRec"  scope="session" />

<jsp:useBean id= "coll" class= "datapro.eibs.beans.JBListRec"  scope="session" />

<jsp:useBean id= "pmnt" class= "datapro.eibs.beans.JBListRec"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<jsp:useBean id = "lnCodes" class= "datapro.eibs.beans.ESD000002Message"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   builtNewMenu(ln_a_opt);


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

 out.println("<SCRIPT> initMenu();  </SCRIPT>");

  String DEAIPD, DEAPPD;
  String E01FLGDED, E01FLGREF,E01FLGPAY,E01FLGCOL,E01DEACLF;
  boolean isDEAIPDNum = true;
  boolean isDEAPPDNum = true;
  DEAIPD = apBasic.getE01DEAIPD().trim();
  DEAPPD = apBasic.getE01DEAPPD().trim();
  E01FLGDED = apBasic.getE01FLGDED().trim();
  E01FLGREF = apBasic.getE01FLGREF().trim();
  E01FLGPAY = apBasic.getE01FLGPAY().trim();
  E01FLGCOL = apBasic.getE01FLGCOL().trim();
  E01DEACLF = apBasic.getE01DEACLF().trim();

  try {
    int i = Integer.parseInt(DEAIPD);
  }
  catch (Exception e) {
    isDEAIPDNum = false;
  }
  try {
    int i = Integer.parseInt(DEAPPD);
  }
  catch (Exception e) {
    isDEAPPDNum = false;
  }

  String colorConcept = "N";

  if (apBasic.getF01PAGACC().equals("Y") || apBasic.getF01PAGBNK().equals("Y") || apBasic.getF01PAGBRN().equals("Y") || apBasic.getF01PAGCCY().equals("Y")) {
  	colorConcept = "Y";
  }
%>
<h3 align="center"> <%= apBasic.getE01DSCPRO().trim()%><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="ln_ap_basic.jsp,EDL0140">
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0150" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="502">
  <INPUT TYPE=HIDDEN NAME="ACTION" VALUE="F">
  <INPUT TYPE=HIDDEN NAME="SCRDEABNK" value="<%= apBasic.getE01DEABNK().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DEARD1" value="<%= apBasic.getE01DEARD1().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DEARD2" value="<%= apBasic.getE01DEARD2().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DEARD3" value="<%= apBasic.getE01DEARD3().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DLCNC1" value="<%= apBasic.getE01DLCNC1().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DLCVA1" value="<%= apBasic.getE01DLCVA1().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DLCFP1" value="<%= apBasic.getE01DLCFP1().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DLCTP1" value="<%= apBasic.getE01DLCTP1().trim()%>">

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
                <input type="text" readonly   name="E01DEACUN" size="9" maxlength="9" value="<%= apBasic.getE01DEACUN().trim()%>" >
              </div>
            </td>
            <td nowrap width="16%" >
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" >
              <div align="left"><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" readonly   name="E01CUSNA1" size="45" maxlength="45" value="<%= apBasic.getE01CUSNA1().trim()%>" >
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%">
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="20%">
              <div align="left">
                <input type="text" readonly   name="E01DEAACC" size="12" maxlength="12" value="<%= apBasic.getE01DEAACC().trim()%>" >
              </div>
            </td>
            <td nowrap width="16%">
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="16%">
              <div align="left"><b>
                <input type="text" readonly   name="E01DEACCY" size="4" maxlength="3" value="<%= apBasic.getE01DEACCY().trim()%>" >
                </b> </div>
            </td>
            <td nowrap width="16%">
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%">
              <div align="left"><b>
                <input type="text" readonly   name="E01DEAPRO" size="4" maxlength="4" value="<%= apBasic.getE01DEAPRO().trim()%>" >
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>
    <%if (apBasic.getE01DEAPAR().equals("P")){%>
  </h4>
  <h4>Participated Loan Information</h4>
  <table class="tableinfo" width="582">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="16%" >
              <div align="right"><b>Participant :</b></div>
            </td>
            <td nowrap width="20%" >
              <div align="left">
                <input type="text" name="E01PARCUN" size="9" maxlength="9" value="<%= apBasic.getE01PARCUN()%>" readonly>
             </div>
            </td>
            <td nowrap width="16%" >
              <div align="right"><b>Name : </b></div>
            </td>
            <td nowrap >
              <div align="left">
                <input type="text" name="E01PARNA1" size="45" maxlength="45" value="<%= apBasic.getE01PARNA1().trim()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="16%">
              <div align="right"><b>Loan # :</b></div>
            </td>
            <td nowrap width="20%">
              <div align="left">
                <input type="text" name="E01PARCUN2" size="13" maxlength="12" value="<%= apBasic.getE01DEAPAC()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%">
              <div align="right"><b>Original Amount: </b></div>
            </td>
            <td nowrap width="16%">
              <div align="left">
                <input type="text" name="E01PAROAM" size="17" maxlength="15" value="<%= apBasic.getE01PAROAM().trim()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%">
              <div align="right"><b>Sold Amount : </b></div>
            </td>
            <td nowrap width="20%">
              <input type="text" name="E01PARASD" size="17" maxlength="15" value="<%= apBasic.getE01PARASD().trim()%>" readonly>
             </td>
            <td nowrap width="16%">
              <div align="right"><b>Available :</b></div>
            </td>
            <td nowrap width="16%">
              <input type="text" name="E01PARAVL" size="17" maxlength="15" value="<%= apBasic.getE01PARAVL().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="16%">
              <div align="right"><b>Maturity Date :</b></div>
            </td>
            <td nowrap width="20%">
              <input type="text" name="E01PARMD1" size="3" maxlength="2" value="<%= apBasic.getE01PARMD1().trim()%>" readonly>
              <input type="text" name="E01PARMD2" size="3" maxlength="2" value="<%= apBasic.getE01PARMD2().trim()%>" readonly>
              <input type="text" name="E01PARMD3" size="3" maxlength="2" value="<%= apBasic.getE01PARMD3().trim()%>" readonly>
            </td>
            <td nowrap width="16%">
              <div align="right"><b>Rate :</b></div>
            </td>
            <td nowrap width="16%">
              <input type="text" name="E01PARRTE" size="12" maxlength="11" value="<%= apBasic.getE01PARRTE().trim()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <%}%>
  <h4>Basic Information</h4>
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trclear">
            <td nowrap width="25%">
              <div align="right">Note Date :</div>
            </td>
            <td nowrap width="23%">
              <input type="text" readonly   <% if (apBasic.getF01DEAOD1().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAOD1" size="2" maxlength="2" value="<%= apBasic.getE01DEAOD1().trim()%>">
              <input type="text" readonly   <% if (apBasic.getF01DEAOD2().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAOD2" size="2" maxlength="2" value="<%= apBasic.getE01DEAOD2().trim()%>">
              <input type="text" readonly   <% if (apBasic.getF01DEAOD3().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAOD3" size="2" maxlength="2" value="<%= apBasic.getE01DEAOD3().trim()%>">
            </td>
            <td nowrap width="25%">
              <div align="right">Funding Date :</div>
            </td>
            <td nowrap width="27%">
              <input type="text" readonly    name="E01DEAFD1" size="2" maxlength="2" value="<%= apBasic.getE01DEAFD1().trim()%>">
              <input type="text" readonly    name="E01DEAFD2" size="2" maxlength="2" value="<%= apBasic.getE01DEAFD2().trim()%>">
              <input type="text" readonly    name="E01DEAFD3" size="2" maxlength="2" value="<%= apBasic.getE01DEAFD3().trim()%>">
            </td>

          </tr>
          <tr id="trdark">
            <td nowrap width="25%">
              <div align="right">Maturity Date :</div>
            </td>
            <td nowrap width="23%">
              <input type="text" readonly   <% if (apBasic.getF01DEAMD1().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAMD1" size="2" maxlength="2" value="<%= apBasic.getE01DEAMD1().trim()%>">
              <input type="text" readonly   <% if (apBasic.getF01DEAMD2().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAMD2" size="2" maxlength="2" value="<%= apBasic.getE01DEAMD2().trim()%>">
              <input type="text" readonly   <% if (apBasic.getF01DEAMD3().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAMD3" size="2" maxlength="2" value="<%= apBasic.getE01DEAMD3().trim()%>">
            </td>
            <td nowrap width="25%">
              <div align="right">Terms :</div>
            </td>
            <td nowrap width="27%">
              <input type="text" readonly   <% if (apBasic.getF01DEATRM().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEATRM" size="4" maxlength="4" value="<%= apBasic.getE01DEATRM().trim()%>">
              <input type="text" readonly   <% if (apBasic.getF01DEATRC().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEATRC" size="15" maxlength="15"
				  value="<% if (apBasic.getE01DEATRC().equals("M")) out.print("Month(s)");
							else if (apBasic.getE01DEATRC().equals("D")) out.print("Day(s)");
							else if (apBasic.getE01DEATRC().equals("Y")) out.print("Year(s)");
							else out.print("");%>"
				>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="25%">
              <div align="right">Original Amount :</div>
            </td>
            <td nowrap width="23%">
              <input type="text" readonly   <% if (apBasic.getF01DEAOAM().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAOAM" size="15" maxlength="15" value="<%= apBasic.getE01DEAOAM().trim()%>">
            </td>
            <td nowrap width="25%">
              <div align="right">Accrual Base :</div>
            </td>
            <td nowrap width="27%">
            	<input type="text" readonly  name="E01DEABAS" size="4" maxlength="3" <% if (apBasic.getF01DEABAS().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= apBasic.getE01DEABAS().trim()%>" >
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="25%">
              <div align="right">Officer Code :</div>
            </td>
            <td nowrap width="23%" colspan="3">
              <input type="text" name="E02OFC" size="5" maxlength="4" <% if (lnCodes.getF02OFC().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= lnCodes.getE02OFC().trim()%>" readonly>
              <input type="text" name="D02OFC" size="40" maxlength="35" <% if (lnCodes.getF02OFC().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= lnCodes.getD02OFC().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="25%">
              <div align="right">Substitute Officer :</div>
            </td>
            <td nowrap width="23%" colspan="3">
              <input type="text" name="E02OF2" size="5" maxlength="4" <% if (lnCodes.getF02OF2().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= lnCodes.getE02OF2().trim()%>" readonly>
              <input type="text" name="D02OF2" size="40" maxlength="35" <% if (lnCodes.getF02OF2().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= lnCodes.getD02OF2().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="25%">
              <div align="right">Country of Residence :</div>
            </td>
            <td nowrap width="23%" colspan="3">
              <input type="text" name="E02GEC" size="5" maxlength="4" <% if (lnCodes.getF02GEC().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= lnCodes.getE02GEC().trim()%>" readonly>
              <input type="text" name="D02GEC" size="40" maxlength="35" <% if (lnCodes.getF02GEC().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= lnCodes.getD02GEC().trim()%>" readonly>
            </td>
          </tr>
           <tr id="trclear">
            <td nowrap width="25%">
              <div align="right">Country of Risk :</div>
            </td>
            <td nowrap width="23%" colspan="3">
              <input type="text" name="E02GRC" size="5" maxlength="4" <% if (lnCodes.getF02GRC().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= lnCodes.getE02GRC().trim()%>" readonly>
              <input type="text" name="D02GRC" size="40" maxlength="35" <% if (lnCodes.getF02GRC().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= lnCodes.getD02GRC().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="25%">
              <div align="right">Industry Code :</div>
            </td>
            <td nowrap width="23%" colspan="3">
              <input type="text" name="E02INC" size="5" maxlength="4" <% if (lnCodes.getF02INC().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= lnCodes.getE02INC().trim()%>" readonly>
              <input type="text" name="D02INC" size="40" maxlength="35" <% if (lnCodes.getF02INC().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= lnCodes.getD02INC().trim()%>" readonly>
            </td>
          </tr>
           <tr id="trclear">
            <td nowrap width="25%">
              <div align="right">Line of Business :</div>
            </td>
            <td nowrap width="23%" colspan="3">
              <input type="text" name="E02BUC" size="5" maxlength="4" <% if (lnCodes.getF02BUC().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= lnCodes.getE02BUC().trim()%>" readonly>
              <input type="text" name="D02BUC" size="40" maxlength="35" <% if (lnCodes.getF02BUC().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= lnCodes.getD02BUC().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="25%">
              <div align="right">Line of Credit :</div>
            </td>
            <td nowrap width="23%">
              <input type="text" readonly   <% if (apBasic.getF01DEACMC().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEACMC" size="9" maxlength="9" value="<%= apBasic.getE01DEACMC().trim()%>" >
              <input type="text" readonly   <% if (apBasic.getF01DEACMN().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEACMN" size="4" maxlength="4" value="<%= apBasic.getE01DEACMN().trim()%>" >
            </td>
            <td nowrap width="25%">
              <div align="right">Cost Center :</div>
            </td>
            <td nowrap width="27%">
				<input type="text" readonly   <% if (apBasic.getF01DEACCN().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEACCN" size="8" maxlength="8" value="<%= apBasic.getE01DEACCN().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="25%">
              <div align="right">Risk Clasification :</div>
            </td>
            <td nowrap width="23%">
				<input type="text" readonly   <% if (apBasic.getF01DEARRC().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEARRC" size="3" maxlength="2" value="<%= apBasic.getE01DEARRC().trim()%>">
            </td>
            <td nowrap width="25%">
              <div align="right">Obligor Code :</div>
            </td>
            <td nowrap width="27%">
				<input type="text" readonly   <% if (apBasic.getF01DEAOBL().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAOBL" size="3" maxlength="2" value="<%= apBasic.getE01DEAOBL().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="25%">
              <div align="right">Collateral Type :</div>
            </td>
            <td nowrap width="23%">
				<input type="text" name="E01DEACOT" size="4" <% if (apBasic.getF01ACDEMA().equals("Y")) out.print("id=\"txtchanged\""); %> maxlength="3" value="<%= apBasic.getE01DEACOT().trim()%>" readonly>
            </td>
            <td nowrap width="25%">
              <div align="right">Grace Period :</div>
            </td>
            <td nowrap width="27%">
            	<input type="text" readonly  <% if (apBasic.getF01DEAGPD().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAGPD" size="3" maxlength="2" value="<%= apBasic.getE01DEAGPD().trim()%>" >
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="25%">
              <div align="right">Bank/Branch :</div>
            </td>
            <td nowrap width="23%">
              <input type="text" name="E01DEABNK" size="2" maxlength="2" value="<%= apBasic.getE01DEABNK().trim()%>" readonly>
              <input type="text" name="E01DEABRN" size="2" maxlength="3" value="<%= apBasic.getE01DEABRN().trim()%>" readonly>
            </td>
            <td nowrap width="25%">
              <div align="right">Escrow Deduction :</div>
            </td>
            <td nowrap width="27%">
            	<input type="text" name="E01DEADED" <% if (apBasic.getF01DEADED().equals("Y")) out.print("id=\"txtchanged\""); %> size="15" maxlength="13" readonly value="<%= apBasic.getE01DEADED().trim()%>" >
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>

  <h4>Loans Pricing</h4>

  <%if (apBasic.getE01DEAFTB().equals("")) {%>

   <table class="tableinfo">
    <tr>
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">

          <tr id="trclear">
            <td nowrap width="25%" >
              <div align="right">Interest Rate/Spread :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" readonly   <% if (apBasic.getF01DEARTE().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEARTE" size="10" maxlength="9" value="<%= apBasic.getE01DEARTE().trim()%>">
            </td>

            <td nowrap width="25%" >
              <div align="right">Penalty Rate / Charges :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" readonly   <% if (apBasic.getF01DEAPEI().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAPEI" size="8" maxlength="7" value="<%= apBasic.getE01DEAPEI().trim()%>" >
              <input type="text" readonly   <% if (apBasic.getF01DEAPIF().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAPIF" size="2" maxlength="1" value="<%= apBasic.getE01DEAPIF().trim()%>" >
            </td>
           </tr>
		  <tr id="trdark">
            <td nowrap width="25%" >
              <div align="right">Rate Revision Cycle :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" name="E01DEARRP" <% if (apBasic.getF01DEARRP().equals("Y")) out.print("id=\"txtchanged\""); %> size="3" maxlength="3" value="<%= apBasic.getE01DEARRP().trim()%>" readonly>
			</td>
            <td nowrap width="25%" >
              <div align="right">Rate Revision Date :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E01DEARR1" <% if (apBasic.getF01DEARR1().equals("Y")) out.print("id=\"txtchanged\""); %> size="2" maxlength="2" value="<%= apBasic.getE01DEARR1().trim()%>" readonly>
              <input type="text" name="E01DEARR2" <% if (apBasic.getF01DEARR2().equals("Y")) out.print("id=\"txtchanged\""); %> size="2" maxlength="2" value="<%= apBasic.getE01DEARR2().trim()%>" readonly>
              <input type="text" name="E01DEARR3" <% if (apBasic.getF01DEARR3().equals("Y")) out.print("id=\"txtchanged\""); %> size="2" maxlength="2" value="<%= apBasic.getE01DEARR3().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="25%" >
              <div align="right">Maximum Rate Allowed :</div>
            </td>
            <td nowrap width="23%" >
			  <input type="text"  readonly   <% if (apBasic.getF01DEAMXR().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAMXR" size="10" maxlength="9" value="<%= apBasic.getE01DEAMXR()%>">
            </td>
            <td nowrap width="25%" >
              <div align="right">Minimum Rate Allowed :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text"  readonly   <% if (apBasic.getF01DEAMIR().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAMIR" size="10" maxlength="9" value="<%= apBasic.getE01DEAMIR()%>">
            </td>
          </tr>

          </table>
      </td>
    </tr>
  </table>
  <%} else { %>
  <table class="tableinfo">
    <tr>
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">

          <tr id="trdark">
            <td nowrap width="25%" >
	              <div align="right">VIR Index Table :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" readonly   <% if (apBasic.getF01DEAFTB().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAFTB" size="2" maxlength="2" value="<%= apBasic.getE01DEAFTB().trim()%>">
              <input type="text" readonly   <% if (apBasic.getF01DEAFTY().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAFTY" size="20" maxlength="15"
				  value="<% if (apBasic.getE01DEAFTY().equals("FP")) out.print("Primary");
							else if (apBasic.getE01DEAFTY().equals("FS")) out.print("Secondary ");
							else if (apBasic.getE01DEAFTY().equals("DS")) out.print("Time Deposits");
							else out.print("");%>">
              <input type="text" readonly   <% if (apBasic.getF01FLTRTE().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01FLTRTE" size="9" maxlength="9" value="<%= apBasic.getE01FLTRTE().trim()%>" >
            </td>
            <td nowrap width="25%" >
              <div align="right">Initial Rate/Spread :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E01DEARTE"  <% if (apBasic.getF01DEARTE().equals("Y")) out.print("id=\"txtchanged\""); %> size="10" maxlength="9" value="<%= apBasic.getE01DEARTE().trim()%>" readonly>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  >
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="25%" >
              <div align="right">First VIR Effective Date :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" name="E01DLCPM2" <% if (apBasic.getF01DLCPM2().equals("Y")) out.print("id=\"txtchanged\""); %> size="2" maxlength="2" value="<%= apBasic.getE01DLCPM2().trim()%>" readonly>
              <input type="text" name="E01DLCPD2" <% if (apBasic.getF01DLCPD2().equals("Y")) out.print("id=\"txtchanged\""); %> size="2" maxlength="2" value="<%= apBasic.getE01DLCPD2().trim()%>" readonly>
              <input type="text" name="E01DLCPY2" <% if (apBasic.getF01DLCPY2().equals("Y")) out.print("id=\"txtchanged\""); %> size="2" maxlength="2" value="<%= apBasic.getE01DLCPY2().trim()%>" readonly>
            </td>
            <td >
              <div align="right">(*) Points Over VIR :</div>
            </td>
            <td >
               <input type="text"  name="E01DLCFVR" <% if (apBasic.getF01DLCFVR().equals("Y")) out.print("id=\"txtchanged\""); %> size="10" maxlength="9" value="<%= apBasic.getE01DLCFVR()%>" readonly>
            </td>
          </tr>
          <tr id="trdark">
           <td >
              <div align="right">First VIR Not Greater Than :</div>
            </td>
            <td >
			  <input type="text"  name="E01DLCFVL" <% if (apBasic.getF01DLCFVL().equals("Y")) out.print("id=\"txtchanged\""); %> size="10" maxlength="9" value="<%= apBasic.getE01DLCFVL()%>" readonly>
            </td>
            <td >
              <div align="right">Days to Obtain VIR :</div>
            </td>
            <td >
			  <input type="text"  name="E01DLCDOV" <% if (apBasic.getF01DLCDOV().equals("Y")) out.print("id=\"txtchanged\""); %> size="3" maxlength="2" value="<%= apBasic.getE01DLCDOV()%>" readonly>
            </td>
          </tr>
          <tr id="trclear">
            <td >
              <div align="right">Rounding Rate :</div>
            </td>
            <td >
              <input type="text" name="E01DLCRDT" <% if (apBasic.getF01DLCRDT().equals("Y")) out.print("id=\"txtchanged\""); %> size="40"
              value="<%if (apBasic.getE01DLCRDT().equals("1")) { out.print("0.001 to the Nearest"); }
			  	else if (apBasic.getE01DLCRDT().equals("2")) { out.print("0.010 to the Neartest"); }
				else if (apBasic.getE01DLCRDT().equals("3")) { out.print("0.100 to the Nearest"); }
				else if (apBasic.getE01DLCRDT().equals("4")) { out.print("0.125 to the Nearest"); }
				else if (apBasic.getE01DLCRDT().equals("5")) { out.print("0.250 to the Nearest"); }
				else if (apBasic.getE01DLCRDT().equals("6")) { out.print("0.500 to the Nearest"); }
				else if (apBasic.getE01DLCRDT().equals("7")) { out.print("1.000 to the Nearest"); }
				else if (apBasic.getE01DLCRDT().equals("N")) { out.print("None Routing"); }%>" readonly>
            </td>
            <td >
              <div align="right">Maximum VIR Change Allowed :</div>
            </td>
            <td >
              <input type="text"  name="E01DLCMRA" <% if (apBasic.getF01DLCMRA().equals("Y")) out.print("id=\"txtchanged\""); %> size="10" maxlength="9" value="<%= apBasic.getE01DLCMRA()%>" readonly>
            </td>

          </tr>
          <tr id="trdark">
            <td nowrap width="25%" >
              <div align="right">Rate Revision Cycle :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" name="E01DEARRP" <% if (apBasic.getF01DEARRP().equals("Y")) out.print("id=\"txtchanged\""); %> size="3" maxlength="3" value="<%= apBasic.getE01DEARRP().trim()%>" readonly>
              <input type="text" name="E01DEAF03" size="10"
				  value="<% if (apBasic.getE01DEAF03().equals("D")) out.print("Day(s)");
							else if (apBasic.getE01DEAF03().equals("M")) out.print("Month(s)");
							else if (apBasic.getE01DEAF03().equals("Y")) out.print("Year(s)");
							else out.print("");%>"
				readonly>
			</td>
            <td nowrap width="25%" >
              <div align="right">Rate Revision Date :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E01DEARR1" <% if (apBasic.getF01DEARR1().equals("Y")) out.print("id=\"txtchanged\""); %> size="2" maxlength="2" value="<%= apBasic.getE01DEARR1().trim()%>" readonly>
              <input type="text" name="E01DEARR2" <% if (apBasic.getF01DEARR2().equals("Y")) out.print("id=\"txtchanged\""); %> size="2" maxlength="2" value="<%= apBasic.getE01DEARR2().trim()%>" readonly>
              <input type="text" name="E01DEARR3" <% if (apBasic.getF01DEARR3().equals("Y")) out.print("id=\"txtchanged\""); %> size="2" maxlength="2" value="<%= apBasic.getE01DEARR3().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="25%" >
              <div align="right">Maximum Rate Allowed :</div>
            </td>
            <td nowrap width="23%" >
			  <input type="text"  name="E01DEAMXR" <% if (apBasic.getF01DEAMXR().equals("Y")) out.print("id=\"txtchanged\""); %> size="10" maxlength="9" value="<%= apBasic.getE01DEAMXR()%>" readonly>
            </td>
            <td nowrap width="25%" >
              <div align="right">Minimum Rate Allowed :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text"  name="E01DEAMIR" <% if (apBasic.getF01DEAMIR().equals("Y")) out.print("id=\"txtchanged\""); %> size="10" maxlength="9" value="<%= apBasic.getE01DEAMIR()%>" readonly>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="25%" >
              <div align="right">Penalty Rate/Late Fees :</div>
            </td>
            <td nowrap width="23%" >
			  <input type="text" readonly   <% if (apBasic.getF01DEAPEI().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAPEI" size="8" maxlength="7" value="<%= apBasic.getE01DEAPEI().trim()%>" >
              <input type="text" readonly   <% if (apBasic.getF01DEAPIF().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAPIF" size="2" maxlength="1" value="<%= apBasic.getE01DEAPIF().trim()%>" >
            </td>
            <td nowrap colspan=2 >
              (*) Spread will apply when VIR Effective Date Reached
            </td>
          </tr>

          </table>
      </td>
    </tr>
  </table>
  <%}  %>

  <% if(E01DEACLF.equals("H")){ %>
  <table class="tbenter" width="100%">
  	<tr>
		<td>
			 <h4>Home Equity Payment (<%= apBasic.getE01DEAIPD().trim()%>)</h4>
		</td>
		<td align="right">
			<h4><a href="javascript:GetCode('','STATIC_ln_pay_methods.jsp')"><img src="<%=request.getContextPath()%>/images/aquire.gif" alt="Help" border="0" >
               Help</a></h4>
		</td>
	</tr>
  </table>

  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="33%">
              <div align="right">Payment Date :</div>
            </td>
            <td nowrap width="15%">
              <input type="text" name="PRXPAG31" size="2" maxlength="2" value="<%= apBasic.getE01DEARD1().trim()%>" onBlur="document.forms[0].E01DEARD1.value = document.forms[0].PRXPAG31.value" onKeyPress="enterInteger()">
              <input type="text" name="PRXPAG32" size="2" maxlength="2" value="<%= apBasic.getE01DEARD2().trim()%>" onBlur="document.forms[0].E01DEARD2.value = document.forms[0].PRXPAG32.value" onKeyPress="enterInteger()">
              <input type="text" name="PRXPAG33" size="2" maxlength="2" value="<%= apBasic.getE01DEARD3().trim()%>" onBlur="document.forms[0].E01DEARD3.value = document.forms[0].PRXPAG33.value" onKeyPress="enterInteger()">
            </td>
            <td nowrap width="22%">
              <div align="right"></div>
            </td>
            <td nowrap colspan="2">&nbsp; </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="33%">
              <div align="right">Amount of Payment :</div>
            </td>
            <td nowrap width="15%">
              <input type="text" name="E01DEAROA2" size="15" maxlength="13" value="<%= apBasic.getE01DEAROA().trim()%>"
			  onBlur="document.forms[0].E01DEAROA.value = document.forms[0].E01DEAROA2.value" onKeyPress="enterDecimal()">
            </td>
            <td nowrap width="22%">
              <div align="right">Interest Included in Payment :</div>
            </td>
            <td nowrap colspan="2">
              <input type="hidden" name="E01DEAIIP3" value="<%= apBasic.getE01DEAIIP()%>">
              <input type="radio" name="XE01DEAIIP" value="Y" disabled onClick="document.forms[0].E01DEAIIP3.value='Y'"
			   onBlur="document.forms[0].E01DEAIIP.value = document.forms[0].E01DEAIIP3.value"
			  <%if(apBasic.getE01DEAIIP().equals("Y")) out.print("checked");%> >
              Yes
              <input type="radio" name="XE01DEAIIP" value="N" disabled onClick="document.forms[0].E01DEAIIP3.value='N'"
			  onBlur="document.forms[0].E01DEAIIP.value = document.forms[0].E01DEAIIP3.value"
			  <%if(apBasic.getE01DEAIIP().equals("N")) out.print("checked");%> >
              No </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="33%" >
              <div align="right">Minimum Payment Amount :</div>
            </td>
            <td nowrap width="15%" >
              <input type="text" name="E01DEAMPA" size="15" maxlength="13" value="<%= apBasic.getE01DEAMPA().trim()%>" onKeyPress="enterInteger()">
            </td>
            <td nowrap width="22%" >
              <div align="right">Minimum Disbursement :</div>
            </td>
            <td nowrap colspan="2" >
              <input type="text" name="E01DEAA01" size="15" maxlength="13" value="<%= apBasic.getE01DEAA01().trim()%>" onKeyPress="enterInteger()">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="33%" >
              <div align="right">Payment Percent :</div>
            </td>
            <td nowrap width="15%" >
              <input type="text" name="E01DEAPCT" size="4" maxlength="3" value="<%= apBasic.getE01DEAPCT().trim()%>" onKeyPress="enterInteger()">
            </td>
            <td nowrap width="22%" >
              <div align="right">Allow Check Processing :</div>
            </td>
            <td nowrap colspan="2" >
              <input type="hidden" name="E01DEAF02" value="<%= apBasic.getE01DEAF02()%>">
              <input type="radio" name="CE01DEAF02" value="Y" disabled onClick="document.forms[0].E01DEAF02.value='Y'"
			  <%if(apBasic.getE01DEAF02().equals("Y")) out.print("checked");%>>
              Yes
              <input type="radio" name="CE01DEAF02" value="N" disabled onClick="document.forms[0].E01DEAF02.value='N'"
			  <%if(apBasic.getE01DEAF02().equals("N")) out.print("checked");%>>
              No</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <%
    }
    else {
  %>
  <% if(DEAPPD.equals("MAT")) { %>
  <table class="tbenter" width="100%">
  	<tr>
		<td>
			 <h4>Principal and Interest at Maturity (MAT) </h4>
		</td>
		<td align="right">
			<h4><a href="javascript:GetCode('','STATIC_ln_pay_methods.jsp')"><img src="<%=request.getContextPath()%>/images/aquire.gif" alt="Help" border="0" >
               Help</a></h4>
		</td>
	</tr>
  </table>

  <%}%> <% if(isDEAIPDNum && DEAPPD.equals("MAT")){ %>

  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="33%">
              <div align="right">Interest Payment Cycle :</div>
            </td>
            <td nowrap width="15%"> <%= apBasic.getE01DEAIPD().trim()%> </td>
            <td nowrap width="22%">
              <div align="right">Next Payment Date :</div>
            </td>
            <td nowrap colspan="2">
              <input type="text" readonly   <% if (apBasic.getF01DEARD1().equals("Y")) out.print("id=\"txtchanged\""); %> name="PRXPAG01" size="2" maxlength="2" value="<%= apBasic.getE01DEARD1().trim()%>" >
              <input type="text" readonly   <% if (apBasic.getF01DEARD2().equals("Y")) out.print("id=\"txtchanged\""); %> name="PRXPAG02" size="2" maxlength="2" value="<%= apBasic.getE01DEARD2().trim()%>" >
              <input type="text" readonly   <% if (apBasic.getF01DEARD3().equals("Y")) out.print("id=\"txtchanged\""); %> name="PRXPAG03" size="2" maxlength="2" value="<%= apBasic.getE01DEARD3().trim()%>" >
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="33%">
              <div align="right">Principal Payment Cycle :</div>
            </td>
            <td nowrap width="15%"> <%= apBasic.getE01DEAPPD().trim()%> </td>
            <td nowrap width="22%">
              <div align="right"></div>
            </td>
            <td nowrap colspan="2">&nbsp; </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <%}%> <% if(isDEAIPDNum && isDEAPPDNum){ %>
  <table class="tbenter" width="100%">
  	<tr>
		<td>
			 <h4>Principal and Interest at Cycles </h4>
		</td>
		<td align="right">
			<h4><a href="javascript:GetCode('','STATIC_ln_pay_methods.jsp')"><img src="<%=request.getContextPath()%>/images/aquire.gif" alt="Help" border="0" >
               Help</a></h4>
		</td>
	</tr>
  </table>
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="33%">
              <div align="right">Interest Payment Cycle:</div>
            </td>
            <td nowrap width="15%"> <%= apBasic.getE01DEAIPD().trim()%> </td>
            <td nowrap width="23%">
              <div align="right">Next Payment Date :</div>
            </td>
            <td nowrap colspan="2" width="29%">
              <input type="text" readonly   <% if (apBasic.getF01DEARD1().equals("Y")) out.print("id=\"txtchanged\""); %> name="PRXPAG11" size="2" maxlength="2" value="<%= apBasic.getE01DEARD1().trim()%>" >
              <input type="text" readonly   <% if (apBasic.getF01DEARD2().equals("Y")) out.print("id=\"txtchanged\""); %> name="PRXPAG12" size="2" maxlength="2" value="<%= apBasic.getE01DEARD2().trim()%>" >
              <input type="text" readonly   <% if (apBasic.getF01DEARD3().equals("Y")) out.print("id=\"txtchanged\""); %> name="PRXPAG13" size="2" maxlength="2" value="<%= apBasic.getE01DEARD3().trim()%>" >
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="33%">
              <div align="right">Principal Payment Cycle :</div>
            </td>
            <td nowrap width="15%"> <%= apBasic.getE01DEAPPD().trim()%> </td>
            <td nowrap width="23%">
              <div align="right">Next Payment Date :</div>
            </td>
            <td nowrap colspan="2" width="29%">
              <input type="text" readonly   <% if (apBasic.getF01DEAHE1().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAHE1" size="2" maxlength="2" value="<%= apBasic.getE01DEAHE1().trim()%>">
              <input type="text" readonly   <% if (apBasic.getF01DEAHE2().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAHE2" size="2" maxlength="2" value="<%= apBasic.getE01DEAHE2().trim()%>">
              <input type="text" readonly   <% if (apBasic.getF01DEAHE3().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAHE3" size="2" maxlength="2" value="<%= apBasic.getE01DEAHE3().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="33%" >
              <div align="right">Payment Amount :</div>
            </td>
            <td nowrap width="15%" >
              <input type="text" readonly   <% if (apBasic.getF01DEAROA().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAROA" size="15" maxlength="15" value="<%= apBasic.getE01DEAROA().trim()%>">
            </td>
            <td nowrap width="23%" >
              <div align="right">Interest Included in Payment :</div>
            </td>
            <td nowrap colspan="2" width="29%" >
              <input type="hidden" name="E01DEAIIP" value="<%= apBasic.getE01DEAIIP()%>">
              <input type="radio" name="CE01DEAIIP" value="Y" onClick="document.forms[0].E01DEAIIP.value='Y'"
			  <%if(apBasic.getE01DEAIIP().equals("Y")) out.print("checked");%> disabled>
              Yes
              <input type="radio" name="CE01DEAIIP" value="N" onClick="document.forms[0].E01DEAIIP.value='N'"
			  <%if(apBasic.getE01DEAIIP().equals("N")) out.print("checked");%> disabled>
              No </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <%}%> <% if(DEAIPD.equals("SC1") && DEAPPD.equals("SC1")){ %>
  <table class="tbenter" width="100%">
  	<tr>
		<td>
			 <h4>Fixed Payment Amount (SC1 - Amortization Schedule)</h4>
		</td>
		<td align="right">
			<h4><a href="javascript:GetCode('','STATIC_ln_pay_methods.jsp')"><img src="<%=request.getContextPath()%>/images/aquire.gif" alt="Help" border="0" >
               Help</a></h4>
		</td>
	</tr>
  </table>
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="33%">
              <div align="right">Number of Payments :</div>
            </td>
            <td nowrap width="15%">
              <input type="text" readonly   <% if (apBasic.getF01DLCNC1().equals("Y")) out.print("id=\"txtchanged\""); %> name="VALNC01" size="4" maxlength="3" value="<%= apBasic.getE01DLCNC1().trim()%>" >
            </td>
            <td nowrap width="22%">
              <div align="right">Payment Frequency :</div>
            </td>
            <td nowrap colspan="2">
              <input type="text" readonly   <% if (apBasic.getF01DLCFP1().equals("Y")) out.print("id=\"txtchanged\""); %> name="FRCFP01" size="4" maxlength="3" value="<%= apBasic.getE01DLCFP1().trim()%>" >
              <input type="text" readonly   <% if (apBasic.getF01DLCTP1().equals("Y")) out.print("id=\"txtchanged\""); %> name="FRCTP01" size="15" maxlength="15"
				  value="<% if (apBasic.getE01DLCTP1().equals("D")) out.print("Day(s)");
							else if (apBasic.getE01DLCTP1().equals("M")) out.print("Month(s)");
							else if (apBasic.getE01DLCTP1().equals("Y")) out.print("Year(s)");
							else out.print("");%>"
				>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="33%">
              <div align="right">Prepaid Interest :</div>
            </td>
            <td nowrap width="15%">
              <input type="text" readonly   <% if (apBasic.getF01DLCPD1().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DLCPD1" size="2" maxlength="2" value="<%= apBasic.getE01DLCPD1().trim()%>">
              <input type="text" readonly   <% if (apBasic.getF01DLCPM1().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DLCPM1" size="2" maxlength="2" value="<%= apBasic.getE01DLCPM1().trim()%>">
              <input type="text" readonly   <% if (apBasic.getF01DLCPY1().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DLCPY1" size="2" maxlength="2" value="<%= apBasic.getE01DLCPY1().trim()%>">
            </td>
            <td nowrap width="22%">
              <div align="right">Grace Period :</div>
            </td>
            <td nowrap colspan="2">
              <input type="text" readonly   <% if (apBasic.getF01DLCGD1().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DLCGD1" size="2" maxlength="2" value="<%= apBasic.getE01DLCGD1().trim()%>">
              <input type="text" readonly   <% if (apBasic.getF01DLCGM1().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DLCGM1" size="2" maxlength="2" value="<%= apBasic.getE01DLCGM1().trim()%>">
              <input type="text" readonly   <% if (apBasic.getF01DLCGM1().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DLCGY1" size="2" maxlength="2" value="<%= apBasic.getE01DLCGY1().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="33%" >
              <div align="right">First Payment Date :</div>
            </td>
            <td nowrap width="15%" >
              <input type="text" readonly   <% if (apBasic.getF01DLCGD1().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DLCGD1" size="2" maxlength="2" value="<%= apBasic.getE01DLCXM1().trim()%>">
              <input type="text" readonly   <% if (apBasic.getF01DLCGM1().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DLCGM12" size="2" maxlength="2" value="<%= apBasic.getE01DLCXD1().trim()%>">
              <input type="text" readonly   <% if (apBasic.getF01DLCGM1().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DLCGY12" size="2" maxlength="2" value="<%= apBasic.getE01DLCXY1().trim()%>">
            </td>
            <td nowrap width="22%" >
              <div align="right">Payment Amount :</div>
            </td>
            <td nowrap colspan="2" >
              <input type="text" readonly   <% if (apBasic.getF01DLCVA1().equals("Y")) out.print("id=\"txtchanged\""); %> name="VALVA01" size="14" maxlength="13" value="<%= apBasic.getE01DLCVA1().trim()%>" >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <%}%><% if(DEAIPD.equals("SC2") && DEAPPD.equals("SC2")){ %>
  <table class="tbenter" width="100%">
  	<tr>
		<td>
			 <h4>Double Payment Schedule (SC2 - Double Amortization Schedule)</h4>
		</td>
		<td align="right">
			<h4><a href="javascript:GetCode('','STATIC_ln_pay_methods.jsp')"><img src="<%=request.getContextPath()%>/images/aquire.gif" alt="Help" border="0" >
               Help</a></h4>
		</td>
	</tr>
  </table>
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trclear">
            <td nowrap width="33%"><b>Schedule 1</b></td>
            <td nowrap width="15%">&nbsp;</td>
            <td nowrap width="22%">&nbsp;</td>
            <td nowrap colspan="2">&nbsp;</td>
          </tr>
          <tr id="trdark">
            <td nowrap width="33%">
              <div align="right">Percent of Principal :</div>
            </td>
            <td nowrap width="15%">
              <input type="text" readonly   <% if (apBasic.getF01DLCOR1().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DLCOR1" size="4" maxlength="3" value="<%= apBasic.getE01DLCOR1().trim()%>">
              % </td>
            <td nowrap width="22%">
              <div align="right">Principal Amount :</div>
            </td>
            <td nowrap colspan="2">
              <input type="text" readonly   <% if (apBasic.getF01DLCPP1().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DLCPP1" size="14" maxlength="13" value="<%= apBasic.getE01DLCPP1().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="33%" height="31">
              <div align="right">Number of Payments :</div>
            </td>
            <td nowrap width="15%" height="31">
              <input type="text" readonly   <% if (apBasic.getF01DLCNC1().equals("Y")) out.print("id=\"txtchanged\""); %> name="VALNC11" size="4" maxlength="3" value="<%= apBasic.getE01DLCNC1().trim()%>" >
            </td>
            <td nowrap width="22%" height="31">
              <div align="right">Payment Frequency :</div>
            </td>
            <td nowrap colspan="2" height="31">
              <input type="text" readonly   <% if (apBasic.getF01DLCFP1().equals("Y")) out.print("id=\"txtchanged\""); %> name="FRCFP11" size="4" maxlength="3" value="<%= apBasic.getE01DLCFP1().trim()%>" >
              <input type="text" readonly   <% if (apBasic.getF01DLCTP1().equals("Y")) out.print("id=\"txtchanged\""); %> name="FRCTP11" size="15" maxlength="15"
				  value="<% if (apBasic.getE01DLCTP1().equals("D")) out.print("Day(s)");
							else if (apBasic.getE01DLCTP1().equals("M")) out.print("Month(s)");
							else if (apBasic.getE01DLCTP1().equals("Y")) out.print("Year(s)");
							else out.print("");%>"
				>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="33%" >
              <div align="right">Payment Amount :</div>
            </td>
            <td nowrap width="15%" >
              <input type="text" readonly   <% if (apBasic.getF01DLCVA1().equals("Y")) out.print("id=\"txtchanged\""); %> name="VALVA11" size="14" maxlength="13" value="<%= apBasic.getE01DLCVA1().trim()%>" >
            </td>
            <td nowrap width="22%" >
              <div align="right"></div>
            </td>
            <td nowrap colspan="2" >&nbsp; </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="33%" >
              <div align="right"></div>
            </td>
            <td nowrap width="15%" >&nbsp; </td>
            <td nowrap width="22%" >
              <div align="right"></div>
            </td>
            <td nowrap colspan="2" >&nbsp; </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="33%" ><b>Schedule 2</b></td>
            <td nowrap width="15%" >&nbsp;</td>
            <td nowrap width="22%" >&nbsp;</td>
            <td nowrap colspan="2" >&nbsp;</td>
          </tr>
          <tr id="trclear">
            <td nowrap width="33%">
              <div align="right">Percentage of Principal :</div>
            </td>
            <td nowrap width="15%">
              <input type="text" readonly   <% if (apBasic.getF01DLCOR2().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DLCOR2" size="4" maxlength="3" value="<%= apBasic.getE01DLCOR2().trim()%>">
              % </td>
            <td nowrap width="22%">
              <div align="right">Principal Amount :</div>
            </td>
            <td nowrap colspan="2">
              <input type="text" readonly   <% if (apBasic.getF01DLCPP2().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DLCPP2" size="14" maxlength="13" value="<%= apBasic.getE01DLCPP2().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="33%" height="31">
              <div align="right">Number of Payments :</div>
            </td>
            <td nowrap width="15%" height="31">
              <input type="text" readonly   <% if (apBasic.getF01DLCNC2().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DLCNC2" size="4" maxlength="3" value="<%= apBasic.getE01DLCNC2().trim()%>">
            </td>
            <td nowrap width="22%" >
              <div align="right">Payment Frequency :</div>
            </td>
            <td nowrap colspan="2" >
              <input type="text" readonly   <% if (apBasic.getF01DLCFP2().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DLCFP2" size="4" maxlength="3" value="<%= apBasic.getE01DLCFP2().trim()%>">
              <input type="text" readonly   <% if (apBasic.getF01DLCTP2().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DLCTP2" size="15" maxlength="15"
				  value="<% if (apBasic.getE01DLCTP2().equals("D")) out.print("Day(s)");
							else if (apBasic.getE01DLCTP2().equals("M")) out.print("Month(s)");
							else if (apBasic.getE01DLCTP2().equals("Y")) out.print("Year(s)");
							else out.print("");%>"
				>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="33%" >
              <div align="right">Payment Amount :</div>
            </td>
            <td nowrap width="15%" >
              <input type="text" readonly   <% if (apBasic.getF01DLCVA2().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DLCVA2" size="14" maxlength="13" value="<%= apBasic.getE01DLCVA2().trim()%>">
            </td>
            <td nowrap width="22%" >&nbsp;</td>
            <td nowrap colspan="2" >&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <%}%> <% if(DEAIPD.equals("SCH") && DEAPPD.equals("SCH")){ %>
  <table class="tbenter" width="100%">
  	<tr>
		<td>
			 <h4>Payment Plan (SCH - Payment Schedule) <a href="javascript:showPayMaint()"><img src="<%=request.getContextPath()%>/images/eibs_deducciones.gif" alt="Payment Plan" align="middle" border="0" ></a></h4>
		</td>
		<td align="right">
			<h4><a href="javascript:GetCode('','STATIC_ln_pay_methods.jsp')"><img src="<%=request.getContextPath()%>/images/aquire.gif" alt="Help" border="0" >
               Help</a></h4>
		</td>
	</tr>
  </table>
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="33%">
              <div align="right">Interest Payment Cycle :</div>
            </td>
            <td nowrap width="15%"> <%= apBasic.getE01DEAIPD().trim()%> </td>
            <td nowrap width="22%">
              <div align="right">Principal Payment Cycle :</div>
            </td>
            <td nowrap colspan="2"><%= apBasic.getE01DEAPPD().trim()%> </td>
          </tr>
        </table>
        <table class="tableinfo" style="filter:''">
          <tr >
            <td nowrap>
              <table cellpadding=2 cellspacing=0 width="100%" border="0">
                <tr id="trdark">
                  <td nowrap width="25%">
                    <div align="center">Payment Number </div>
                  </td>
                  <td nowrap width="23%">
                    <div align="center">Date</div>
                  </td>
                  <td nowrap width="25%">
                    <div align="center">Principal</div>
                  </td>
                  <td nowrap width="27%">
                    <div align="center">Interest</div>
                  </td>
                  <td nowrap width="27%">Include Interest in Payments</td>
                </tr>
                <%
                pmnt.initRow();
                while (pmnt.getNextRow()) {
                    if (pmnt.getFlag().equals("")) {
                    		//out.println(coll.getRecord());
	      %>
                <tr id="trclear">
                  <td nowrap width="25%">
                    <div align="center"><%= pmnt.getRecord(0) %></div>
                  </td>
                  <td nowrap width="23%">
                    <div align="center"><%= Util.formatDate(pmnt.getRecord(1),pmnt.getRecord(2),pmnt.getRecord(3))%></div>
                  </td>
                  <td nowrap width="25%">
                    <div align="center"><%= pmnt.getRecord(4) %></div>
                  </td>
                  <td nowrap width="27%">
                    <div align="center"><%= pmnt.getRecord(5) %></div>
                  </td>
                  <td nowrap width="27%">
                    <div align="center"><%= pmnt.getRecord(6) %></div>
                  </td>
                </tr>
                <%
                    }
                }
    %>
              </table>
            </td>
          </tr>
        </table>

        <p align="center">&nbsp;</p>

      </td>
    </tr>
  </table>
  <%}%> <% if(isDEAIPDNum && DEAPPD.equals("SCH")){ %>
  <h5 align="center">Interest will be paid according its own schedule and Principal
    will be paid according to an irregular Payment Plan</h5>
  <table class="tableinfo">
    <tr>
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="33%">
              <div align="right">Interest Payment Cycle :</div>
            </td>
            <td nowrap width="15%"> <%= apBasic.getE01DEAIPD().trim()%> </td>
            <td nowrap width="22%">
              <div align="right">Principal Payment Cycle :</div>
            </td>
            <td nowrap colspan="2"><%= apBasic.getE01DEAPPD().trim()%> </td>
          </tr>
        </table>
        <p><b>Interest</b></p>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="33%">
              <div align="right">Next Payment Date :</div>
            </td>
            <td nowrap width="67%">
              <input type="text" readonly   <% if (apBasic.getF01DEARD1().equals("Y")) out.print("id=\"txtchanged\""); %> name="PRXPAG21" size="2" maxlength="2" value="<%= apBasic.getE01DEARD1().trim()%>" >
              <input type="text" readonly   <% if (apBasic.getF01DEARD2().equals("Y")) out.print("id=\"txtchanged\""); %> name="PRXPAG22" size="2" maxlength="2" value="<%= apBasic.getE01DEARD2().trim()%>" >
              <input type="text" readonly   <% if (apBasic.getF01DEARD3().equals("Y")) out.print("id=\"txtchanged\""); %> name="PRXPAG23" size="2" maxlength="2" value="<%= apBasic.getE01DEARD3().trim()%>" >
            </td>
          </tr>
        </table>
        <p><b>Principal</b></p>
        <table class="tableinfo" style="filter:''">
          <tr >
            <td nowrap>
              <table cellpadding=2 cellspacing=0 width="100%" border="0">
                <tr id="trdark">
                  <td nowrap width="25%">
                    <div align="center">Payment No.</div>
                  </td>
                  <td nowrap width="23%">
                    <div align="center">Date</div>
                  </td>
                  <td nowrap width="25%">
                    <div align="center">Principal</div>
                  </td>
                </tr>
                <%
                pmnt.initRow();
                while (pmnt.getNextRow()) {
                    if (pmnt.getFlag().equals("")) {
                    		//out.println(coll.getRecord());
	      %>
                <tr id="trclear">
                  <td nowrap width="25%">
                    <div align="center"><%= pmnt.getRecord(0) %></div>
                  </td>
                  <td nowrap width="23%">
                    <div align="center"><%= Util.formatDate(pmnt.getRecord(1),pmnt.getRecord(2),pmnt.getRecord(3))%></div>
                  </td>
                  <td nowrap width="25%">
                    <div align="center"><%= pmnt.getRecord(4) %></div>
                  </td>
                </tr>
                <%
                    }
                }
    %>
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <%
     }
    }
  %>
  <h4>Administrative Information</h4>
  <table class="tableinfo">
    <tr>
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <%if (apBasic.getE01DEAPAR().equals("")){%>
          <tr id="trclear">
            <td nowrap width="25%" >
			  <div align="right">Demand Loan :</div>
            </td>
            <td nowrap width="23%" >
              <input type="hidden" name="E01DEALNC" value="<%= apBasic.getE01DEALNC()%>">
              <input type="radio" name="CE01DEALNC" value="Y" onClick="document.forms[0].E01DEALNC.value='Y'"
			  <%if(apBasic.getE01DEALNC().equals("Y")) out.print("checked");%> disabled>
              Yes
              <input type="radio" name="CE01DEALNC" value="N" onClick="document.forms[0].E01DEALNC.value='N'"
			  <%if(apBasic.getE01DEALNC().equals("N")) out.print("checked");%> disabled>
              No
			</td>
			<td nowrap  >
			  <div align="right"></div>
            </td>
            <td nowrap >
			  </td>
          </tr>
          <%}%>
          <tr id="trdark">
            <td nowrap width="25%" >
              <div align="right">Taxes and Withholding :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" readonly   <% if (apBasic.getF01DEAWHF().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAWHF" size="30" maxlength="30"
				  value="<% if (apBasic.getE01DEAWHF().equals("1")) out.print("Withholding Deduction");
							else if (apBasic.getE01DEAWHF().equals("2")) out.print("Sales Tax");
							else if (apBasic.getE01DEAWHF().equals("3")) out.print("Both (Withholding & Taxes)");
							else if (apBasic.getE01DEAWHF().equals("4")) out.print("Taxes in Commissions");
							else if (apBasic.getE01DEAWHF().equals("5")) out.print("Taxes in Interest");
							else if (apBasic.getE01DEAWHF().equals("N")) out.print("None");
							else out.print("");%>"
				>
            </td>
            <td nowrap width="25%" >
              <div align="right">Mailing Address :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" readonly   <% if (apBasic.getF01DEAMLA().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAMLA" size="2" maxlength="1" value="<%= apBasic.getE01DEAMLA().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right">Broker Code:</div>
            </td>
            <td nowrap >
              <input type="text" readonly   <% if (apBasic.getF01DEABRK().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEABRK" size="4" maxlength="3" value="<%= apBasic.getE01DEABRK().trim()%>">
              <input type="text" readonly   <% if (apBasic.getF01DEABCP().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEABCP" size="10" maxlength="9" value="<%= apBasic.getE01DEABCP().trim()%>" >
              <b>%</b>
            </td>
            <td nowrap width="25%" >
              <div align="right">Deferred Loan Cost : </div>
            </td>
            <td nowrap width="23%" >
              <input type="text" name="E01DEATDA" size="17" maxlength="15" value="<%= apBasic.getE01DEATDA().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="25%" >
              <div align="right">Rate Table :</div>
            </td>
            <td nowrap width="23%" >
            	<input type="text" readonly   <% if (apBasic.getF01DEARTB().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEARTB" size="2" maxlength="1" value="<%= apBasic.getE01DEARTB().trim()%>">
            </td>
            <td nowrap >
              <div align="right">Loan Revision Date :</div>
            </td>
            <td nowrap >
              <input type="text" readonly    name="E01DEARPS1" size="2" maxlength="2" value="<%= apBasic.getE01DEAPS1().trim()%>">
              <input type="text" readonly    name="E01DEARPS2" size="2" maxlength="2" value="<%= apBasic.getE01DEAPS2().trim()%>">
              <input type="text" readonly    name="E01DEARPS3" size="2" maxlength="2" value="<%= apBasic.getE01DEAPS3().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="25%" >
              <div align="right">Interest Type :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" readonly   <% if (apBasic.getF01DEAICT().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAICT" size="30" maxlength="30"
				  value="<% if (apBasic.getE01DEAICT().equals("S")) out.print("Simple Interest");
							else if (apBasic.getE01DEAICT().equals("M")) out.print("Simple Interest Commercial Months");
							else if (apBasic.getE01DEAICT().equals("P")) out.print("Prepaid Interest");
							else if (apBasic.getE01DEAICT().equals("A")) out.print("Prepaid Interest Commercial Months");
							else if (apBasic.getE01DEAICT().equals("D")) out.print("Discount Interest Calendar Months");
							else if (apBasic.getE01DEAICT().equals("T")) out.print("Discount Interest Commercial Months");
							else if (apBasic.getE01DEAICT().equals("R")) out.print("Reinvestment for (CD'S Only)");
							else if (apBasic.getE01DEAICT().equals("8")) out.print("Rule 78");
							else out.print("");%>"
				>
            </td>
            <td nowrap width="25%" >
              <div align="right">Charges Table :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" readonly   <% if (apBasic.getF01DEATLN().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEATLN" size="2" maxlength="2" value="<%= apBasic.getE01DEATLN().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="25%" >
              <div align="right">Interest Accrual Flag :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" readonly   <% if (apBasic.getF01DEAIFL().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAIFL" size="30" maxlength="30"
				  value="<% if (apBasic.getE01DEAIFL().equals("1")) out.print("Outstanding Principal");
							else if (apBasic.getE01DEAIFL().equals("2")) out.print("Original Principal");
							else if (apBasic.getE01DEAIFL().equals("3")) out.print("Outstanding Principal Less Principal Due");
							else if (apBasic.getE01DEAIFL().equals("N")) out.print("None Accrual");
							else out.print("");%>"
				>
            </td>
            <td nowrap width="25%" >
              <div align="right">Penalty Interest Flag :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" readonly   <% if (apBasic.getF01DEAPCL().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAPCL" size="30" maxlength="30"
				  value="<% if (apBasic.getE01DEAPCL().equals("1")) out.print("Principal Due");
							else if (apBasic.getE01DEAPCL().equals("2")) out.print("Original Principal");
							else if (apBasic.getE01DEAPCL().equals("3")) out.print("Outstanding Principal");
							else if (apBasic.getE01DEAPCL().equals("4")) out.print("Payment Amount P+I");
							else if (apBasic.getE01DEAPCL().equals("N")) out.print("No penalty");
							else out.print("");%>"
				>
            </td>
          </tr>

		  <%if (apBasic.getE01DEAPAR().equals("")){%>
          <tr id="trclear">
            <td nowrap width="25%" >
              <div align="right">Relation Type 1 :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" readonly  name="E01DEAPAR" size="25" maxlength="25"
			  	value="<% if (apBasic.getE01DEAPAR().equals("F")) out.print("Funding");
							else if (apBasic.getE01DEAPAR().equals("A")) out.print("Leasing");
							else if (apBasic.getE01DEAPAR().equals("S")) out.print("Sindicated");
							else if (apBasic.getE01DEAPAR().equals("P")) out.print("Participation");
							else if (apBasic.getE01DEAPAR().equals("T")) out.print("Tied to a CDS or a TDS");
							else out.print("None");%>">
            </td>
            <td nowrap width="25%" >
              <div align="right">Relation Account 1 :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" readonly   <% if (apBasic.getF01DEAPAC().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAPAC" size="12" maxlength="12" value="<%= apBasic.getE01DEAPAC().trim()%>">
            </td>
          </tr>
		  <%}%>
          <tr id="trclear">
            <td nowrap width="25%" >
              <div align="right">Loan Type : </div>
            </td>
            <td nowrap width="23%" >
              <input type="text" name="E01DEACLF" size="2" maxlength="1" value="<%= apBasic.getE01DEACLF().trim()%>" readonly>
            </td>
            <td nowrap width="25%" >
              <div align="right">Inquiry Level (0-9) : </div>
            </td>
            <td nowrap width="23%" >
             	<input type="text"  name="E01DEAOPT" size="2" maxlength="1" value="<%= apBasic.getE01DEAOPT().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="29%" height="19">
              <div align="right">User's Code 3 :</div>
            </td>
            <td nowrap>
              <input type="text" name="E02UC3" size="5" maxlength="4" <% if (lnCodes.getF02UC3().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= lnCodes.getE02UC3().trim()%>" readonly>
              <input type="text" name="D02UC3" size="40" maxlength="35" <% if (lnCodes.getF02UC3().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= lnCodes.getD02UC3().trim()%>" readonly>
            </td>
           <td nowrap width="25%" >
              <div align="right">Reference Number :</div>
            </td>
			<td nowrap width="25%" >
              <input type="text"  name="E01DEAREF" size="9" maxlength="9" value="<%= apBasic.getE01DEAREF().trim()%>" readonly>
            </td>
		</tr>
          <tr id="trclear">
            <td nowrap width="29%" height="19">
              <div align="right">Customer Grade :</div>
            </td>
            <td nowrap colspan="3">
              <input type="text" name="E02UC5" size="5" maxlength="4" <% if (lnCodes.getF02UC5().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= lnCodes.getE02UC5().trim()%>" readonly>
              <input type="text" name="D02UC5" size="40" maxlength="35" <% if (lnCodes.getF02UC5().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= lnCodes.getD02UC5().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="29%" height="19">
              <div align="right">Facility Grade :</div>
            </td>
            <td nowrap colspan="3">
              <input type="text" name="E02UC6" size="5" maxlength="4"  <% if (lnCodes.getF02UC6().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= lnCodes.getE02UC6().trim()%>" readonly>
              <input type="text" name="D02UC6" size="40" maxlength="35" <% if (lnCodes.getF02UC6().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= lnCodes.getD02UC6().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="29%" height="19">
              <div align="right">User's Code 7 :</div>
            </td>
            <td nowrap colspan="3">
              <input type="text" name="E02UC7" size="5" maxlength="4" <% if (lnCodes.getF02UC7().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= lnCodes.getE02UC7().trim()%>" readonly>
              <input type="text" name="D02UC7" size="40" maxlength="35" <% if (lnCodes.getF02UC7().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= lnCodes.getD02UC7().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="29%" height="19">
              <div align="right">Call Report :</div>
            </td>
            <td nowrap colspan="3">
              <input type="text" name="E02UC4" size="7" maxlength="6" <% if (lnCodes.getF02UC4().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= lnCodes.getE02UC4().trim()%>" readonly>
              <input type="text" name="D02UC4" size="40" maxlength="35" <% if (lnCodes.getF02UC4().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= lnCodes.getD02UC4().trim()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

<h4>Community Reinvestment Act (CRA) Information</h4>
  <table class="tableinfo">
    <tr>
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="25%">
              <div align="right">Action Taken Type :</div>
            </td>
            <td nowrap width="23%">
				<input type="text" readonly  name="E01CRLACT" size="25" maxlength="25"
			  		value="<% if (apBasic.getE01CRLACT().equals("1")) out.print("Loan Originated");
							else if (apBasic.getE01CRLACT().equals("2")) out.print("Purchased by Institution");
							else out.print("");%>">
            </td>
            <td nowrap width="25%">
              <div align="right"></div>
            </td>
            <td nowrap width="27%">

            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="25%">
              <div align="right">FIPS State Code :</div>
            </td>
            <td nowrap width="23%">
            	<input type="text" readonly name="E01CRLSTC" size="3" maxlength="2" value="<%= apBasic.getE01CRLSTC().trim()%>" >
            </td>
            <td nowrap width="25%">
              <div align="right">FIPS County Code :</div>
            </td>
            <td nowrap width="27%">
              <input type="text" readonly name="E01CRLCTC" size="4" maxlength="3" value="<%= apBasic.getE01CRLCTC().trim()%>" >
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="25%">
              <div align="right">MSA/MD Code :</div>
            </td>
            <td nowrap width="23%">
            	<input readonly type="text" name="E01CRLMSA" size="6" maxlength="5" value="<%= apBasic.getE01CRLMSA().trim()%>" >
            </td>
            <td nowrap width="25%">
              <div align="right">Census Track :</div>
            </td>
            <td nowrap width="27%">
              <input type="text" readonly name="E01CRLCET" size="7" maxlength="6" value="<%= apBasic.getE01CRLCET().trim()%>" >
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="25%">
              <div align="right">Gross Anual Revenue :</div>
            </td>
            <td nowrap width="23%">
			  <input type="text" readonly  name="E01CRLRVC" size="30" maxlength="30"
			  		value="<% if (apBasic.getE01CRLRVC().equals("1")) out.print("Less Or Equal To 1 Million");
							else if (apBasic.getE01CRLRVC().equals("2")) out.print("Greater Than 1 Million");
							else if (apBasic.getE01CRLRVC().equals("3")) out.print("Not Known");
							else if (apBasic.getE01CRLRVC().equals("4")) out.print("N/A");
							else out.print("");%>">

            </td>
            <td nowrap width="25%">
              <div align="right">Affiliate Code :</div>
            </td>
            <td nowrap width="27%">
              <input type="text" readonly  name="E01CRLAFC" size="35" maxlength="35"
			  		value="<% if (apBasic.getE01CRLAFC().equals("1")) out.print("Action Taked at this Institution");
							else if (apBasic.getE01CRLAFC().equals("2")) out.print("Action Taken at an Affiliate");
							else out.print("");%>">

            </td>
          </tr>
   		</table>
      </td>
    </tr>
  </table>



  <h4>Account to be Debited Automatically when Payment is Due</h4>
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="32%">
              <div align="center">Concept</div>
            </td>
            <td nowrap width="14%">
              <div align="center">Bank</div>
            </td>
            <td nowrap width="17%">
              <div align="center">Branch</div>
            </td>
            <td nowrap width="22%">
              <div align="center">Currency</div>
            </td>
            <td nowrap width="15%">
              <div align="center">Reference</div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="32%" >
              <div align="center">
                <input type="hidden" name="E01PAGOPE" value="<%= apBasic.getE01PAGOPE().trim()%>">
                <input type="hidden" name="E01PAGGLN" value="<%= apBasic.getE01PAGGLN().trim()%>">
                <input type="text" readonly  <% if (colorConcept.equals("Y")) out.print("id=\"txtchanged\""); %> name="E01PAGCON" size="25" maxlength="25"  value="<%= apBasic.getE01PAGCON().trim()%>">
              </div>
            </td>
            <td nowrap width="14%" >
              <div align="center">
                <input type="text" readonly <% if (colorConcept.equals("Y")) out.print("id=\"txtchanged\""); %>   name="E01PAGBNK" size="2" maxlength="2" value="<%= apBasic.getE01PAGBNK().trim()%>">
              </div>
            </td>
            <td nowrap width="17%" >
              <div align="center">
                <input type="text" readonly <% if (colorConcept.equals("Y")) out.print("id=\"txtchanged\""); %>  name="E01PAGBRN" size="3" maxlength="3" value="<%= apBasic.getE01PAGBRN().trim()%>">
                <a href="javascript:GetBranch('E01PAGBRN',document.forms[0].SCRDEABNK.value)">
                </a></div>
            </td>
            <td nowrap width="22%" >
              <div align="center">
                <input type="text" readonly <% if (colorConcept.equals("Y")) out.print("id=\"txtchanged\""); %>  name="E01PAGCCY" size="3" maxlength="3" value="<%= apBasic.getE01PAGCCY().trim()%>">
                <a href="javascript:GetCurrency('E01PAGCCY',document.forms[0].SCRDEABNK.value)">
                </a></div>
            </td>
            <td nowrap width="15%" >
              <div align="center">
                <input type="text" readonly <% if (colorConcept.equals("Y")) out.print("id=\"txtchanged\""); %>  name="E01PAGACC" size="12" maxlength="12"  value="<%= apBasic.getE01PAGACC().trim()%>">
                <a href="javascript:GetAccount('E01PAGACC','','RT','')"> </a></div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="32%" >&nbsp;</td>
            <td nowrap width="14%" >&nbsp;</td>
            <td nowrap width="17%" >&nbsp;</td>
            <td nowrap width="22%" >&nbsp;</td>
            <td nowrap width="15%" >&nbsp;</td>
          </tr>
        </table>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="22%">
              <div align="right">Payment Via :</div>
            </td>
            <td nowrap width="24%">
              <div align="left">
                <select name="E01PMTVIA" disabled>
                  <option value="" <% if(apBasic.getE01PMTVIA().equals("")) out.print("selected");%>></option>
                  <option value="F" <% if(apBasic.getE01PMTVIA().equals("F")) out.print("selected");%>>Fed</option>
                  <option value="1" <% if(apBasic.getE01PMTVIA().equals("1")) out.print("selected");%>>Swift
                  MT-103</option>
                  <option value="2" <% if(apBasic.getE01PMTVIA().equals("2")) out.print("selected");%>>Swift
                  MT-200</option>
                  <option value="3" <% if(apBasic.getE01PMTVIA().equals("3")) out.print("selected");%>>Swift
                  MT-220</option>
                  <option value="G" <% if(apBasic.getE01PMTVIA().equals("G")) out.print("selected");%>>General
                  Ledger</option>
                  <option value="R" <% if(apBasic.getE01PMTVIA().equals("R")) out.print("selected");%>>Retail
                  Account</option>
                  <option value="C" <% if(apBasic.getE01PMTVIA().equals("C")) out.print("selected");%>>Official
                  Check</option>
                  <option value="A" <% if(apBasic.getE01PMTVIA().equals("A")) out.print("selected");%>>ACH</option>
                </select>
              </div>
            </td>
            <td nowrap width="24%">
              <%if (apBasic.getE01DEAPAR().equals("P")){%>
              <div align="right">Payment Method :</div>
              <%}%>
            </td>
            <td nowrap width="30%">
              <%if (apBasic.getE01DEAPAR().equals("P")){%>
              <select name="E01PMTMTH" disabled>
                <option value="" <% if(apBasic.getE01PMTMTH().equals("")) out.print("selected");%>></option>
                <option value="F" <% if(apBasic.getE01PMTMTH().equals("1")) out.print("selected");%>>Tied
                to the Loan</option>
                <option value="S" <% if(apBasic.getE01PMTMTH().equals("2")) out.print("selected");%>>Independent</option>
                <option value="O" <% if(apBasic.getE01PMTMTH().equals("3")) out.print("selected");%>>Manual</option>
              </select>
              <%}%>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="22%">
              <div align="right">Overdraft Authorization : </div>
            </td>
            <td nowrap width="24%">
              <input type="text" readonly   <% if (apBasic.getF01DEAODA().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAODA" size="2" maxlength="1" value="<%= apBasic.getE01DEAODA().trim()%>">
            </td>
            <td nowrap width="24%">
              <div align="right">Allow Payments in Holidays : </div>
            </td>
            <td nowrap width="30%">
              <input type="hidden" name="E01DEAHFQ" value="<%= apBasic.getE01DEAHFQ()%>">
              <input type="radio" name="CE01DEAHFQ" value="1" onClick="document.forms[0].E01DEAHFQ.value='1'"
			  <%if(apBasic.getE01DEAHFQ().equals("1")) out.print("checked");%> disabled>
              Yes
              <input type="radio" name="CE01DEAHFQ" value="2" onClick="document.forms[0].E01DEAHFQ.value='2'"
			  <%if(apBasic.getE01DEAHFQ().equals("2")) out.print("checked");%> disabled>
              No </td>
          </tr>
          <%
                pmnt.initRow();
                while (pmnt.getNextRow()) {
                    if (pmnt.getFlag().equals("")) {
                    		//out.println(coll.getRecord());
	      %>
          <%
                    }
                }
    %>
        </table>

      </td>
    </tr>
  </table>
  <%if (apBasic.getE01PMTVIA().equals("A")) { %>
 <h4>ACH Information</h4>
       <table class="tableinfo" >
		 <tr id="trdark">
            <td nowrap width="30%">
              <div align="right">Bank Routing :</div>
            </td>
            <td nowrap width="70%">
              <input type="text" readonly name="E01ACDROU" size="10" maxlength="9" value="<%= apBasic.getE01ACDROU().trim()%>">

            </td>
         </tr>
         <tr id="trclear">
            <td nowrap width="30%">
			  <div align="right">External Account :</div>
            </td>
            <td nowrap width="70%">
				<input type="text" readonly name="E01ACDDAC" size="18" maxlength="17" value="<%= apBasic.getE01ACDDAC().trim()%>">

            </td>
          </tr>
		 <tr id="trdark">
            <td nowrap width="30%">
              <div align="right">Account Type :</div>
            </td>
            <td nowrap width="70%">
              <select name="E01ACDACT" disabled>
                <option value="C" <% if(apBasic.getE01ACDACT().equals("C")) out.print("selected");%>>Checking</option>
                <option value="S" <% if(apBasic.getE01ACDACT().equals("S")) out.print("selected");%>>Saving</option>
              </select>

             </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="30%">
			  <div align="right">Name :</div>
            </td>
            <td nowrap width="70%">
				<input type="text" readonly name="E01ACDNME" size="50" maxlength="45" value="<%= apBasic.getE01ACDNME().trim()%>">

            </td>
          </tr>
		 <tr id="trdark">
            <td nowrap width="30%">
              <div align="right">Address :</div>
            </td>
            <td nowrap width="70%">
				<input type="text" readonly name="E01ACDADD" size="50" maxlength="45" value="<%= apBasic.getE01ACDADD().trim()%>">

             </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="30%">
			  <div align="right">City, State, Zip Code :</div>
            </td>
            <td nowrap width="70%">
				<input type="text" readonly name="E01ACDCSZ" size="50" maxlength="45" value="<%= apBasic.getE01ACDCSZ().trim()%>">

            </td>
         </tr>
		 <tr id="trdark">
            <td nowrap width="30%">
              <div align="right">e-mail :</div>
            </td>
            <td nowrap width="70%" >
				<input type="text" readonly name="E01ACDEMA" size="70" maxlength="60" value="<%= apBasic.getE01ACDEMA().trim()%>">
             </td>
         </tr>
      </table>
      <% }%>
  <h4><% if(E01DEACLF.equals("A")) { %>Leaved Asset Information</h4>
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="25%">
              <div align="right">Asset Number :</div>
            </td>
            <td nowrap width="23%">
              <input type="text" readonly   <% if (apBasic.getF01FIXASN().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01FIXASN" size="9" maxlength="9" value="<%= apBasic.getE01FIXASN().trim()%>">
            </td>
            <td nowrap width="25%">
              <div align="right">G/L Account :</div>
            </td>
            <td nowrap width="27%">
              <input type="text" readonly  name="E01FIXGLN" size="16" maxlength="16" value="<%= apBasic.getE01FIXGLN().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="25%">
              <div align="right"> Asset Brand :</div>
            </td>
            <td nowrap width="23%">
              <input type="text" readonly   <% if (apBasic.getF01FIXMAR().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01FIXMAR" size="20" maxlength="20" value="<%= apBasic.getE01FIXMAR().trim()%>">
            </td>
            <td nowrap width="25%">
              <div align="right">Cost Center :</div>
            </td>
            <td nowrap width="27%">
              <input type="text" readonly  name="E01FIXCCN" size="8" maxlength="8" value="<%= apBasic.getE01FIXCCN().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="25%" >
              <div align="right">Asset Module :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" readonly   <% if (apBasic.getF01FIXMOD().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01FIXMOD" size="15" maxlength="15" value="<%= apBasic.getE01FIXMOD().trim()%>" >
            </td>
            <td nowrap width="25%" >
              <div align="right">Exchange Rate :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" readonly   <% if (apBasic.getF01FIXTIC().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01FIXTIC" size="11" maxlength="11" value="<%= apBasic.getE01FIXTIC().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="25%" >
              <div align="right">Purchase Price :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" readonly   <% if (apBasic.getF01FIXPPR().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01FIXPPR" size="15" maxlength="2" value="<%= apBasic.getE01FIXPPR().trim()%>" >
            </td>
            <td nowrap width="25%" >
              <div align="right">Type of Depreciation :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" readonly   <% if (apBasic.getF01FIXDTY().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01FIXDTY" size="2" maxlength="1" value="<%= apBasic.getE01FIXDTY().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="25%" >
              <div align="right">Serial Number :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" readonly   <% if (apBasic.getF01FIXSER().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01FIXSER" size="15" maxlength="15" value="<%= apBasic.getE01FIXSER().trim()%>">
            </td>
            <td nowrap width="25%" >
              <div align="right">Percent of Depreciation :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" readonly   <% if (apBasic.getF01FIXPRT().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01FIXPRT" size="5" maxlength="4" value="<%= apBasic.getE01FIXPRT().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="25%" >
              <div align="right">Location :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" readonly   <% if (apBasic.getF01FIXLOC().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01FIXLOC" size="4" maxlength="3" value="<%= apBasic.getE01FIXLOC().trim()%>">
            </td>
            <td nowrap width="25%" >
              <div align="right">Months :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" readonly   <% if (apBasic.getF01FIXMTH().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01FIXMTH" size="4" maxlength="3" value="<%= apBasic.getE01FIXMTH().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="25%" >
              <div align="right">Class :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" readonly   <% if (apBasic.getF01FIXCLS().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01FIXCLS" size="5" maxlength="4" value="<%= apBasic.getE01FIXCLS().trim()%>">
            </td>
            <td nowrap width="25%" >
              <div align="right">Remarks :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" readonly   <% if (apBasic.getF01FIXRMK().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01FIXRMK" size="30" maxlength="25" value="<%= apBasic.getE01FIXRMK().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="25%" >
              <div align="right">Residual Value :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" readonly   <% if (apBasic.getF01FIXRVA().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01FIXRVA" size="15" maxlength="15" value="<%= apBasic.getE01FIXRVA().trim()%>">
            </td>
            <td nowrap width="25%" >
              <div align="right">Vendor Number :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" readonly   <% if (apBasic.getF01FIXPIN().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01FIXPIN" size="10" maxlength="9" value="<%= apBasic.getE01FIXPIN().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <%}%> <% if(E01FLGREF.equals("1")||E01FLGREF.equals("2") || E01FLGREF.equals("3")) { %>
  <h4>Refinance <% if(E01FLGREF.equals("1")) { %> </h4>
  <h5 align="center">Refinance Interest</h5>
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="40%">
              <div align="right">Cycle Refinance :</div>
            </td>
            <td nowrap width="60%"> <%= apBasic.getE01DEAXRC().trim()%> </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="40%">
              <div align="right">Next Date of Refinance :</div>
            </td>
            <td nowrap width="60%">
              <input type="text" readonly   <% if (apBasic.getF01DEAXR1().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAXR1" size="2" maxlength="2" value="<%= apBasic.getE01DEAXR1().trim()%>">
              <input type="text" readonly   <% if (apBasic.getF01DEAXR2().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAXR2" size="2" maxlength="2" value="<%= apBasic.getE01DEAXR2().trim()%>">
              <input type="text" readonly   <% if (apBasic.getF01DEAXR3().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAXR3" size="2" maxlength="2" value="<%= apBasic.getE01DEAXR3().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="40%" >
              <div align="right">To Even Refinance :</div>
            </td>
            <td nowrap width="60%" >
              <input type="text" readonly   <% if (apBasic.getF01DEAPC1().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAPC1" size="2" maxlength="1" value="<%= apBasic.getE01DEAPC1().trim()%>">
              <input type="text" readonly   <% if (apBasic.getF01DEAPC2().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAPC2" size="2" maxlength="1" value="<%= apBasic.getE01DEAPC2().trim()%>">
              <input type="text" readonly   <% if (apBasic.getF01DEAPC3().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAPC3" size="2" maxlength="1" value="<%= apBasic.getE01DEAPC3().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <%}%> <% if(E01FLGREF.equals("2")) { %>
  <h5 align="center">Partial Refinance Payment with Increase to the Same Loan</h5>
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trclear">
            <td nowrap width="40%">
              <div align="right">Payment Amount :</div>
            </td>
            <td nowrap width="60%">
              <input type="text" readonly   <% if (apBasic.getF01REFPAG().equals("Y")) out.print("id=\"txtchanged\""); %> name="REFPAG01" size="15" maxlength="15" value="<%= apBasic.getE01REFPAG().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <%}%> <% if(E01FLGREF.equals("3")) { %>
  <h5 align="center">Partial Refinance Payment with Increase to Another Loan</h5>
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF">
      <td nowrap>
        <table >
          <tr id="trdark">
            <td nowrap width="40%">
              <div align="right">Payment Amount :</div>
            </td>
            <td nowrap width="60%">
              <input type="text" readonly   <% if (apBasic.getF01REFPAG().equals("Y")) out.print("id=\"txtchanged\""); %> name="REFPAG11" size="15" maxlength="15" value="<%= apBasic.getE01REFPAG().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="40%">
              <div align="right">Credit Number To Apply Refinancing : </div>
            </td>
            <td nowrap width="60%">
              <input type="text" readonly   <% if (apBasic.getF01REFACC().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01REFACC" size="12" maxlength="12" value="<%= apBasic.getE01REFACC().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <%}%> <%}%> <% if(E01FLGPAY.equals("Y")) { %>
  <h4>Projected Payments</h4>
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="25%">
              <div align="right">Final Payment Amount :</div>
            </td>
            <td nowrap width="23%">
              <input type="text" readonly   <% if (apBasic.getF01DEABAP().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEABAP" size="15" maxlength="15" value="<%= apBasic.getE01DEABAP().trim()%>">
            </td>
            <td nowrap width="25%">
              <div align="right">Final Payment Date :</div>
            </td>
            <td nowrap width="27%">
              <input type="text" readonly   <% if (apBasic.getF01DEABA1().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEABA1" size="2" maxlength="2" value="<%= apBasic.getE01DEABA1().trim()%>">
              <input type="text" readonly   <% if (apBasic.getF01DEABA2().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEABA2" size="2" maxlength="2" value="<%= apBasic.getE01DEABA2().trim()%>">
              <input type="text" readonly   <% if (apBasic.getF01DEABA3().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEABA3" size="2" maxlength="2" value="<%= apBasic.getE01DEABA3().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="25%">
              <div align="right">% Payment Increase :</div>
            </td>
            <td nowrap width="23%">
              <input type="text" readonly   <% if (apBasic.getF01DEAPAP().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAPAP" size="10" maxlength="9" value="<%= apBasic.getE01DEAPAP().trim()%>">
            </td>
            <td nowrap width="25%">
              <div align="right">Factor :</div>
            </td>
            <td nowrap width="27%">
              <input type="text" readonly   <% if (apBasic.getF01DEA2TC().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEA2TC" size="4" maxlength="1" value="<%= apBasic.getE01DEAOAM().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="25%" >
              <div align="right">Next Payment Increase Cycle : </div>
            </td>
            <td nowrap width="23%" >
              <input type="text" readonly   <% if (apBasic.getF01DEAPCU().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAPCU" size="4" maxlength="3" value="<%= apBasic.getE01DEAPCU().trim()%>">
            </td>
            <td nowrap width="25%" >
              <div align="right">Date :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" readonly   <% if (apBasic.getF01DEALS1().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEALS1" size="2" maxlength="2" value="<%= apBasic.getE01DEALS1().trim()%>">
              <input type="text" readonly   <% if (apBasic.getF01DEALS2().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEALS2" size="2" maxlength="2" value="<%= apBasic.getE01DEALS2().trim()%>">
              <input type="text" readonly   <% if (apBasic.getF01DEALS3().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEALS3" size="2" maxlength="2" value="<%= apBasic.getE01DEALS3().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="25%" >
              <div align="right">Principal Payment :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" readonly   <% if (apBasic.getF01DLCABA().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DLCABA" size="14" maxlength="13" value="<%= apBasic.getE01DLCABA().trim()%>" >
            </td>
            <td nowrap width="25%" >
              <div align="right">Factor :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" readonly   <% if (apBasic.getF01DLCABF().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DLCABF" size="4" maxlength="1" value="<%= apBasic.getE01DLCABF().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="25%" >
              <div align="right">Next Payment Cycle :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" readonly   <% if (apBasic.getF01DLCABC().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DLCABC" size="4" maxlength="3" value="<%= apBasic.getE01DLCABC().trim()%>" >
            </td>
            <td nowrap width="25%" >
              <div align="right">Date :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" readonly   <% if (apBasic.getF01DLCAB1().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DLCAB1" size="2" maxlength="2" value="<%= apBasic.getE01DLCAB1().trim()%>">
              <input type="text" readonly   <% if (apBasic.getF01DLCAB2().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DLCAB2" size="2" maxlength="2" value="<%= apBasic.getE01DLCAB2().trim()%>">
              <input type="text" readonly   <% if (apBasic.getF01DLCAB3().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DLCAB3" size="2" maxlength="2" value="<%= apBasic.getE01DLCAB3().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <%}%>
  <p><% if(userPO.getHeader16().equals("Y")) { %> </p>
  <h4>Deductions List</h4>
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="6%" >Selection</td>
            <td nowrap width="23%" >
              <div align="center">Code</div>
            </td>
            <td nowrap width="16%" >
              <div align="center">Company</div>
            </td>
            <td nowrap width="22%">
              <div align="center">Policy Number</div>
            </td>
            <td nowrap width="17%" >
              <div align="center">Deduction</div>
            </td>
            <td nowrap width="16%" >
              <div align="center">Factor</div>
            </td>
          </tr>
          <%
                ded.initRow();
                while (ded.getNextRow()) {
                    if (ded.getFlag().equals("")) {
                    		//out.println(list.getRecord());
	      %>
          <tr id="trclear">
            <td nowrap width="6%" >
              <div align="center"><%= Util.formatBlank(ded.getRecord(0)) %></div>
            </td>
            <td nowrap width="23%" >
              <div align="center"><%= ded.getRecord(1) %></div>
            </td>
            <td nowrap width="16%" >
              <div align="center"><%= ded.getRecord(2) %></div>
            </td>
            <td nowrap width="22%" >
              <div align="center"><%= ded.getRecord(3) %></div>
            </td>
            <td nowrap width="17%" >
              <div align="center"><%= Util.formatCCY(ded.getRecord(4)) %></div>
            </td>
            <td nowrap width="16%" >
              <div align="center"><%= ded.getRecord(5) %></div>
            </td>
          </tr>
          <%
                    }
                }
    %>
        </table>
      </td>
    </tr>
  </table>
  <%}%>
  <p><% if(userPO.getHeader17().equals("Y")) { %> </p>
  <h4>Collaterals List</h4>
  <table class="tableinfo">
    <tr>
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="25%">
              <div align="center">Collateral No. </div>
            </td>
            <td nowrap width="23%">
              <div align="center">Type of Collateral</div>
            </td>
            <td nowrap width="25%">
              <div align="center">Currency</div>
            </td>
            <td nowrap width="27%">
              <div align="center">Amount</div>
            </td>
          </tr>
          <%
                coll.initRow();
                while (coll.getNextRow()) {
                    if (coll.getFlag().equals("")) {
                    		//out.println(coll.getRecord());
	      %>
          <tr id="trclear">
            <td nowrap width="25%">
              <div align="center"><%= coll.getRecord(0) %></div>
            </td>
            <td nowrap width="23%">
              <div align="center"><%= coll.getRecord(1) %></div>
            </td>
            <td nowrap width="25%">
              <div align="center"><%= coll.getRecord(2) %></div>
            </td>
            <td nowrap width="27%">
              <div align="center"><%= Util.formatCCY(coll.getRecord(3)) %></div>
            </td>
          </tr>
          <%
                    }
                }
    %>
        </table>
      </td>
    </tr>
  </table>
  <%}%>
</form>
</body>
</html>
