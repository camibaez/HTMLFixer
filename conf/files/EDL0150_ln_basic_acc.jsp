<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Loans Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="lnBasic" class="datapro.eibs.beans.EDL015001Message"  scope="session" />
<jsp:useBean id= "lnCodes" class= "datapro.eibs.beans.ESD000002Message"  scope="session" />
<jsp:useBean id= "ded" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id= "coll" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id= "pmnt" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT> 
 <script src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"></script>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>
<SCRIPT Language="Javascript">

<%if (userPO.getPurpose().equals("MAINTENANCE")){%>

	builtNewMenu(ln_m_opt);

<%}%>

   builtHPopUp();

  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }

  function getNewDeduct(acc){
   page = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0370?SCREEN=7&ACCNUM=" + acc;
   CenterWindow(page,600,500,2);
  }

  function getDeduct(acc,cod){
   var row;
   for(var i=1;i < TBDEDUCT.rows.length;i++){
     if (TBDEDUCT.rows[i].cells[0].innerText == cod) {
      row = i;
      break
     }
   }
   page = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0370?SCREEN=3&ACCNUM=" + acc + "&COD=" + cod + "&ROW="+ row;
   CenterWindow(page,600,500,2);
  }

  function showPayOver() {
	   if (divPayOver.style.display == "none") divPayOver.style.display = "";
	   else divPayOver.style.display = "none";
  }

  function showVariableRate() {
  		divFixedRate.style.display = "none";
		divVariableRate.style.display = "";
		document.forms[0].E01DEAMXR_VIR.value = document.forms[0].E01DEAMXR_1.value;
		document.forms[0].E01DEAMIR_VIR.value = document.forms[0].E01DEAMIR_1.value;
		document.forms[0].E01DEARTE_VIR.value = document.forms[0].E01DEARTE_1.value;
		document.forms[0].E01DEAPEI_VIR.value = document.forms[0].E01DEAPEI_1.value;
		document.forms[0].E01DEAPIF_VIR.value = document.forms[0].E01DEAPIF_1.value;
		document.forms[0].E01DEARRP_VIR.value = document.forms[0].E01DEARRP_1.value;
		document.forms[0].E01DEARR1_VIR.value = document.forms[0].E01DEARR1_1.value;
		document.forms[0].E01DEARR2_VIR.value = document.forms[0].E01DEARR2_1.value;
		document.forms[0].E01DEARR3_VIR.value = document.forms[0].E01DEARR3_1.value;
		document.forms[0].E01DEAF03_VIR.value = document.forms[0].E01DEAF03_1.value;
		document.forms[0].E01DEAEXR_VIR.value = document.forms[0].E01DEAEXR_1.value;
  }

  function setRateValues() {

  		/*if (divFixedRate.style.display == "none") {
  			document.forms[0].E01DEAMXR.value = document.forms[0].E01DEAMXR_VIR.value;
			document.forms[0].E01DEAMIR.value = document.forms[0].E01DEAMIR_VIR.value;
			document.forms[0].E01DEARTE.value = document.forms[0].E01DEARTE_VIR.value;
			document.forms[0].E01DEAPEI.value = document.forms[0].E01DEAPEI_VIR.value;
			document.forms[0].E01DEAPIF.value = document.forms[0].E01DEAPIF_VIR.value;
			document.forms[0].E01DEARRP.value = document.forms[0].E01DEARRP_VIR.value;
			document.forms[0].E01DEARR1.value = document.forms[0].E01DEARR1_VIR.value;
			document.forms[0].E01DEARR2.value = document.forms[0].E01DEARR2_VIR.value;
			document.forms[0].E01DEARR3.value = document.forms[0].E01DEARR3_VIR.value;
			document.forms[0].E01DEAF03.value = document.forms[0].E01DEAF03_VIR.value;
			document.forms[0].E01DEAEXR.value = document.forms[0].E01DEAEXR_VIR.value;
		} else {
			document.forms[0].E01DEAMXR.value = document.forms[0].E01DEAMXR_1.value;
			document.forms[0].E01DEAMIR.value = document.forms[0].E01DEAMIR_1.value;*/
			document.forms[0].E01DEARTE.value = document.forms[0].E01DEARTE_1.value;
			document.forms[0].E01DEAPEI.value = document.forms[0].E01DEAPEI_1.value;
			document.forms[0].E01DEAPIF.value = document.forms[0].E01DEAPIF_1.value;
			/*document.forms[0].E01DEARRP.value = document.forms[0].E01DEARRP_1.value;
			document.forms[0].E01DEARR1.value = document.forms[0].E01DEARR1_1.value;
			document.forms[0].E01DEARR2.value = document.forms[0].E01DEARR2_1.value;
			document.forms[0].E01DEARR3.value = document.forms[0].E01DEARR3_1.value;
			document.forms[0].E01DEAF03.value = document.forms[0].E01DEAF03_1.value;
			document.forms[0].E01DEAEXR.value = document.forms[0].E01DEAEXR_1.value;
		}*/
		document.forms[0]["Submit"].disabled = true;
		document.forms[0].submit();
  }

  function ShowHideACH() {
  	if (document.forms[0].E01PMTVIA.value == 'A') {
  		divACH.style.display = "";
  	} else {
  		divACH.style.display = "none";
  	}
  }

  function goRefresh() {
  	document.forms[0].SCREEN.value = '60';
  	document.forms[0]["Submit"].disabled = true;
	document.forms[0].submit();
  }
</SCRIPT>

</head>
<body>
<%

 boolean showFields = true;
 if (currUser.getE01INT().equals("B") && lnBasic.getE01DEATYP().equals("LNS") && lnBasic.getE01DEAPRO().equals("ACC")) {
 	showFields = false;
 }


 String CUSCUN = "";
 String CUSNA1 = "";

 if (!currClient.getE01CUSCUN().equals("0") && lnBasic.getE01DEACUN().equals("0")) {
    CUSCUN = currClient.getE01CUSCUN().trim();
    CUSNA1 = currClient.getE01CUSNA1().trim();
 } else {
    CUSCUN = lnBasic.getE01DEACUN().trim();
    CUSNA1 = lnBasic.getE01CUSNA1().trim();
 }

 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }
  if (userPO.getPurpose().equals("MAINTENANCE")){
 out.println("<SCRIPT> initMenu();  </SCRIPT>");}

  String DEAIPD, DEAPPD;
  String E01FLGDED, E01FLGREF,E01FLGPAY,E01FLGCOL,E01DEACLF;
  boolean isDEAIPDNum = true;
  boolean isDEAPPDNum = true;
  DEAIPD = lnBasic.getE01DEAIPD().trim();
  DEAPPD = lnBasic.getE01DEAPPD().trim();
  E01FLGDED = lnBasic.getE01FLGDED().trim();
  E01FLGREF = lnBasic.getE01FLGREF().trim();
  E01FLGPAY = lnBasic.getE01FLGPAY().trim();
  E01FLGCOL = lnBasic.getE01FLGCOL().trim();
  E01DEACLF = lnBasic.getE01DEACLF().trim();

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
%>

<h3 align="center"> <%= lnBasic.getE01DSCPRO().trim()%><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="ln_basic_acc.jsp,EDL0150">
</h3>
<hr size="4">
<form name="loan_basic" method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0150ACC" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="502">
  <INPUT TYPE=HIDDEN NAME="ACTION" VALUE="F">
  <INPUT TYPE=HIDDEN NAME="SCRDEABNK" value="<%= lnBasic.getE01DEABNK().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DEARD1" value="<%= lnBasic.getE01DEARD1().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DEARD2" value="<%= lnBasic.getE01DEARD2().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DEARD3" value="<%= lnBasic.getE01DEARD3().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DEAHE1" value="<%= lnBasic.getE01DEAHE1().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DEAHE2" value="<%= lnBasic.getE01DEAHE2().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DEAHE3" value="<%= lnBasic.getE01DEAHE3().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DLCNC1" value="<%= lnBasic.getE01DLCNC1().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DLCVA1" value="<%= lnBasic.getE01DLCVA1().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DLCFP1" value="<%= lnBasic.getE01DLCFP1().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DLCTP1" value="<%= lnBasic.getE01DLCTP1().trim()%>">
  <input type=HIDDEN name="E01DEATYP" value="<%= lnBasic.getE01DEATYP().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DEAROA" value="<%= lnBasic.getE01DEAROA().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DEAIIP" value="<%= lnBasic.getE01DEAIIP().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DEAMXR" value="<%= lnBasic.getE01DEAMXR().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DEAMIR" value="<%= lnBasic.getE01DEAMIR().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DEARTE" value="<%= lnBasic.getE01DEARTE().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DEAPEI" value="<%= lnBasic.getE01DEAPEI().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DEAPIF" value="<%= lnBasic.getE01DEAPIF().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DEARRP" value="<%= lnBasic.getE01DEARRP().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DEARR1" value="<%= lnBasic.getE01DEARR1().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DEARR2" value="<%= lnBasic.getE01DEARR2().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DEARR3" value="<%= lnBasic.getE01DEARR3().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01PRDIPD" value="<%= lnBasic.getE01PRDIPD().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01PRDPPD" value="<%= lnBasic.getE01PRDPPD().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01PRDRFS" value="<%= lnBasic.getE01PRDRFS().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DEAF03" value="<%= lnBasic.getE01DEAF03().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DEAEXR" value="<%= lnBasic.getE01DEAEXR().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E02ACC" value="<% if(userPO.getPurpose().equals("MAINTENANCE")) {out.print(lnBasic.getE01DEAACC().trim());} else {
                     if (lnBasic.getE01DEAACC().trim().equals("999999999")) out.print("NEW ACCOUNT"); else out.print(lnBasic.getE01DEAACC().trim());} %>">
  <INPUT TYPE=HIDDEN NAME="E01DLCMN1" value="<%= lnBasic.getE01DLCMN1().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DLCMN2" value="<%= lnBasic.getE01DLCMN2().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DLCMN3" value="<%= lnBasic.getE01DLCMN3().trim()%>">

  <br>

  <table class="tableinfo" >
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="16%" >
              <div align="right"><b>Customer : </b></div>
            </td>
            <td nowrap width="20%" >
              <div align="left">
                <input type="text" name="E01DEACUN" size="9" maxlength="9" value="<%= CUSCUN%>">
                <a href="javascript:GetCustomerDescId('E01DEACUN','E01CUSNA1','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0" ></a></div>
            </td>
            <td nowrap width="16%" >
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" >
              <div align="left">
                <input type="text" name="E01CUSNA1" size="45" maxlength="45" value="<%= CUSNA1%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%">
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="20%">
              <div align="left">
                <input type="text" name="E01DEAACC" size="12" maxlength="12"  readonly
					value="<% if(userPO.getPurpose().equals("MAINTENANCE")) {out.print(lnBasic.getE01DEAACC().trim());} else {
                     if (lnBasic.getE01DEAACC().trim().equals("999999999")) out.print("NEW ACCOUNT"); else out.print(lnBasic.getE01DEAACC().trim());} %>">
              </div>
            </td>
            <td nowrap width="16%">
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="16%">
              <div align="left"><b>
                <input type="text" name="E01DEACCY" size="4" maxlength="3" value="<%= lnBasic.getE01DEACCY().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%">
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%">
              <div align="left"><b>
                <input type="text" name="E01DEAPRO" size="7" maxlength="4" value="<%= lnBasic.getE01DEAPRO().trim()%>" readonly>
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>


  <h4>Basic Information</h4>
  <table class="tableinfo">
    <tr>
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trclear">
            <td nowrap width="25%">
              <div align="right">Note Date :</div>
            </td>
            <td nowrap width="23%">
              <input type="text" name="E01DEAOD1" size="2" maxlength="2" value="<%= lnBasic.getE01DEAOD1().trim()%>" <%if (!lnBasic.getH01SCRCOD().equals("N")){out.print("readonly");}%>onkeypress="enterInteger()">
              <input type="text" name="E01DEAOD2" size="2" maxlength="2" value="<%= lnBasic.getE01DEAOD2().trim()%>" <%if (!lnBasic.getH01SCRCOD().equals("N")){out.print("readonly");}%>onkeypress="enterInteger()">
              <input type="text" name="E01DEAOD3" size="2" maxlength="2" value="<%= lnBasic.getE01DEAOD3().trim()%>" <%if (!lnBasic.getH01SCRCOD().equals("N")){out.print("readonly");}%>onkeypress="enterInteger()">
              <%if (lnBasic.getH01SCRCOD().equals("N")){%>
              <a href="javascript:DatePicker(document.forms[0].E01DEAOD1,document.forms[0].E01DEAOD2,document.forms[0].E01DEAOD3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></a>
               <%}%>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  >
            </td>
            <td nowrap width="25%">
              <div align="right">Funding Date :</div>
            </td>
            <td nowrap width="27%">
              <input type="text" name="E01DEAFD1" size="2" maxlength="2" value="<%= lnBasic.getE01DEAFD1().trim()%>" <%if (!lnBasic.getH01SCRCOD().equals("N")){out.print("readonly");}%> onkeypress="enterInteger()">
              <input type="text" name="E01DEAFD2" size="2" maxlength="2" value="<%= lnBasic.getE01DEAFD2().trim()%>" <%if (!lnBasic.getH01SCRCOD().equals("N")){out.print("readonly");}%> onkeypress="enterInteger()">
              <input type="text" name="E01DEAFD3" size="2" maxlength="2" value="<%= lnBasic.getE01DEAFD3().trim()%>" <%if (!lnBasic.getH01SCRCOD().equals("N")){out.print("readonly");}%> onkeypress="enterInteger()">
              <%if (lnBasic.getH01SCRCOD().equals("N")){%>
              <a href="javascript:DatePicker(document.forms[0].E01DEAFD1,document.forms[0].E01DEAFD2,document.forms[0].E01DEAFD3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></a>
               <%}%>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  >
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="25%">
              <div align="right">Maturity Date :</div>
            </td>
            <td nowrap width="23%">
              <input type="text" name="E01DEAMD1" size="2" maxlength="2" value="<%= lnBasic.getE01DEAMD1().trim()%>" <%if (!lnBasic.getH01SCRCOD().equals("N")){out.print("readonly");}%> onkeypress="enterInteger()">
              <input type="text" name="E01DEAMD2" size="2" maxlength="2" value="<%= lnBasic.getE01DEAMD2().trim()%>" <%if (!lnBasic.getH01SCRCOD().equals("N")){out.print("readonly");}%> onkeypress="enterInteger()">
              <input type="text" name="E01DEAMD3" size="2" maxlength="2" value="<%= lnBasic.getE01DEAMD3().trim()%>" <%if (!lnBasic.getH01SCRCOD().equals("N")){out.print("readonly");}%> onkeypress="enterInteger()">
              <%if (lnBasic.getH01SCRCOD().equals("N")){%>
              <a href="javascript:DatePicker(document.forms[0].E01DEAMD1,document.forms[0].E01DEAMD2,document.forms[0].E01DEAMD3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></a>
               <%}%>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  >
            </td>
            <td nowrap width="25%">
              <div align="right">Terms :</div>
            </td>
            <td nowrap width="27%">
              <input type="text" name="E01DEATRM" size="4" maxlength="4" value="<%= lnBasic.getE01DEATRM().trim()%>" onkeypress="enterInteger()">
              <select name="E01DEATRC">
                <option value=" " <% if (!(lnBasic.getE01DEATRC().equals("D") ||lnBasic.getE01DEATRC().equals("M")||lnBasic.getE01DEATRC().equals("Y"))) out.print("selected"); %> selected></option>
                <option value="D" <% if(lnBasic.getE01DEATRC().equals("D")) out.print("selected");%>>Day(s)</option>
                <option value="M" <% if(lnBasic.getE01DEATRC().equals("M")) out.print("selected");%>>Month(s)</option>
                <option value="Y" <% if(lnBasic.getE01DEATRC().equals("Y")) out.print("selected");%>>Year(s)</option>
              </select>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  >
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



          <tr id="trclear">
            <td nowrap width="25%">
              <div align="right">Original Amount :</div>
            </td>
            <td nowrap width="23%">
              <input type="text" name="E01DEAOAM" size="15" maxlength="13" value="<%= lnBasic.getE01DEAOAM().trim()%>" onkeypress="enterDecimal()"
              	<%if (!lnBasic.getH01SCRCOD().equals("N")) out.print("readonly"); %> >
              	<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  >
            </td>

            <td nowrap width="25%">
              <div align="right">SISBACEN Reference :</div>
            </td>
            <td nowrap width="27%">
            	<input type="text" name="E01DEAREF" size="14" maxlength="12" value="<%= lnBasic.getE01DEAREF().trim()%>">
             </td>

          </tr>

          <tr id="trdark">
            <td nowrap width="25%" >
              <div align="right">Relation Type :</div>
            </td>
            <td nowrap width="23%" >
			  <select name="E01DEARET">
                <option value=" " <% if (lnBasic.getE01DEARET().equals(" ")) out.print("selected"); %>></option>
                <option value="X" <% if (lnBasic.getE01DEARET().equals("X")) out.print("selected"); %>>Forex Exchange Deal</option>
              </select>

            </td>
            <td nowrap width="25%" >
              <div align="right">Related Account :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E01DEAREA" size="11" maxlength="9" value="<%= lnBasic.getE01DEAREA().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:GetAccount('E01DEAREA',document.forms[0].E01DEABNK.value,'','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
          </tr>


          <tr id="trclear">
            <td nowrap width="25%" >
              <div align="right">Taxes and Withholding :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" name="E01DEAWHF" size="2" maxlength="1" value="<%= lnBasic.getE01DEAWHF().trim()%>">
              <a href="javascript:GetCode('E01DEAWHF','STATIC_cd_taxes.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a>
            </td>
            <td nowrap width="25%" >
              <div align="right">Mailing Address :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E01DEAMLA" size="2" maxlength="1" value="<%= lnBasic.getE01DEAMLA().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:GetMailing('E01DEAMLA',document.forms[0].E01DEACUN.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0"></a>
            </td>
          </tr>


          <% if (showFields == true) { %>
          <tr id="trdark">
            <td nowrap width="25%">
              <div align="right">Officer Code :</div>
            </td>
            <td nowrap width="23%" colspan="3">
              <input type="text" name="E02OFC" size="5" maxlength="3" value="<%= lnCodes.getE02OFC().trim()%>">
              <input type="text" name="D02OFC" size="40" maxlength="35" value="<%= lnCodes.getD02OFC().trim()%>" readonly>
              <a href="javascript:GetCodeDescCNOFC('E02OFC','D02OFC','15')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" >
            </td>
			</tr>
          <tr id="trclear">
            <td nowrap width="25%">
              <div align="right">Substitute Officer :</div>
            </td>
            <td nowrap width="27%" colspan="3">
              <input type="text" name="E02OF2" size="5" maxlength="3" value="<%= lnCodes.getE02OF2().trim()%>">
              <input type="text" name="D02OF2" size="40" maxlength="35" value="<%= lnCodes.getD02OF2().trim()%>" readonly>
              <a href="javascript:GetCodeDescCNOFC('E02OF2','D02OF2','15')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  >
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="25%">
              <div align="right">Country of Residence :</div>
            </td>
            <td nowrap width="23%" colspan="3">
              <input type="text" name="E02GEC" size="5" maxlength="3" value="<%= lnCodes.getE02GEC().trim()%>">
              <input type="text" name="D02GEC" size="40" maxlength="35" value="<%= lnCodes.getD02GEC().trim()%>" readonly>
              <a href="javascript:GetCodeDescCNOFC('E02GEC','D02GEC','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  >
            </td>
		 </tr>
          <tr id="trclear">
            <td nowrap width="25%">
              <div align="right">Country of Risk Code :</div>
            </td>
            <td nowrap width="27%" colspan="3">
              <input type="text" name="E02GRC" size="5" maxlength="3" value="<%= lnCodes.getE02GRC().trim()%>" readonly>
              <input type="text" name="D02GRC" size="40" maxlength="35" value="<%= lnCodes.getD02GRC().trim()%>" readonly>
              <a href="javascript:GetCodeDescCNOFC('E02GRC','D02GRC','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  >
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="25%">
              <div align="right">Industry Code :</div>
            </td>
            <td nowrap width="23%" colspan="3">
              <input type="text" name="E02INC" size="5" maxlength="3" value="<%= lnCodes.getE02INC().trim()%>">
              <input type="text" name="D02INC" size="40" maxlength="35" value="<%= lnCodes.getD02INC().trim()%>" readonly>
              <a href="javascript:GetCodeDescCNOFC('E02INC','D02INC','09')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  >
            </td>
			</tr>
          <tr id="trclear">
            <td nowrap width="25%">
              <div align="right">Line of Business :</div>
            </td>
            <td nowrap width="27%" colspan="3">
              <input type="text" name="E02BUC" size="5" maxlength="3" value="<%= lnCodes.getE02BUC().trim()%>">
              <input type="text" name="D02BUC" size="40" maxlength="35" value="<%= lnCodes.getD02BUC().trim()%>" readonly>
              <a href="javascript:GetCodeDescCNOFC('E02BUC','D02BUC','12')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
          </tr>
          <% } %>
          <tr id="trdark">
            <td nowrap width="25%">
              <div align="right">Line of Credit :</div>

            </td>
            <td nowrap width="23%">
			  <input type="text" name="E01DEACMC" size="9" maxlength="9" value="<%= lnBasic.getE01DEACMC().trim()%>"  onkeypress="enterInteger()">
              <input type="text" name="E01DEACMN" size="4" maxlength="4" value="<%= lnBasic.getE01DEACMN().trim()%>"  onkeypress="enterInteger()">
              <a href="javascript:GetCreditLine('E01DEACMN',document.forms[0].E01DEACMC.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  >
            </td>
            <td nowrap width="25%">
              <% if (showFields == true) { %> <div align="right">Cost Center :</div><% } %>
            </td>
            <td nowrap width="27%">
            	<% if (showFields == true) { %>
              <input type="text" name="E01DEACCN" size="8" maxlength="8" value="<%= lnBasic.getE01DEACCN().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:GetCostCenter('E01DEACCN',document.forms[0].SCRDEABNK.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
              <% } %>
            </td>
          </tr>
          <% if (showFields == true) { %>
          <tr id="trclear">
            <td nowrap width="25%">
              <div align="right">Risk Classification :</div>
            </td>
            <td nowrap width="23%">
              <input type="text" name="E01DEARRC" size="3" maxlength="2" value="<%= lnBasic.getE01DEARRC().trim()%>">
              <a href="javascript:GetPrevTable('E01DEARRC')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0"></a>
            <IMG src="<%=request.getContextPath()%>/images/Check.gif"
					alt="mandatory field" align="bottom" border="0"></td>
            <td nowrap width="25%">
              <div align="right">Obligor Code :</div>
            </td>
            <td nowrap width="27%">
           		<input type="text" name="E01DEAOBL" size="3" maxlength="2" value="<%= lnBasic.getE01DEAOBL().trim()%>">
            </td>
          </tr>
          <% } %>
          <tr id="trdark">
            <td nowrap width="25%">
              <div align="right">Collateral Type :</div>
            </td>
            <td nowrap width="23%">
              <input type="text" name="E01DEACOT" size="4" maxlength="3" value="<%= lnBasic.getE01DEACOT().trim()%>" >
              <a href="javascript:GetCodeCNOFC('E01DEACOT','05')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"  ></a>
             </td>
            <td nowrap width="25%">
              <div align="right">Grace Period :</div>
            </td>
            <td nowrap width="27%">
            	<input type="text" name="E01DEAGPD" size="3" maxlength="2" value="<%= lnBasic.getE01DEAGPD().trim()%>"  onkeypress="enterInteger()">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="25%">
              <div align="right">Bank/Branch :</div>
            </td>
            <td nowrap width="23%">
             <% if (lnBasic.getH01SCRCOD().trim().equals("N")) { %>
              <input type="text" name="E01DEABNK" size="2" maxlength="2" value="<%= lnBasic.getE01DEABNK().trim()%>"readonly>
              <input type="text" name="E01DEABRN" size="2" maxlength="3" value="<%= lnBasic.getE01DEABRN().trim()%>">
              <a href="javascript:GetBranch('E01DEABRN','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"  ></a>
             <% } else {%>
              <input type="text" name="E01DEABNK" size="2" maxlength="2" value="<%= lnBasic.getE01DEABNK().trim()%>" readonly>
              <input type="text" name="E01DEABRN" size="2" maxlength="3" value="<%= lnBasic.getE01DEABRN().trim()%>" readonly>
             <% }%>
             </td>

            <td nowrap width="25%">
              <div align="right">Accrual Base :</div>
            </td>
            <td nowrap width="27%">
            	<input type="text" name="E01DEABAS" size="4" maxlength="3" value="<%= lnBasic.getE01DEABAS().trim()%>" onkeypress="enterInteger()">
            </td>


          </tr>

   		</table>
      </td>
    </tr>
  </table>


  <h4>Loan Pricing</h4>

   <div id="divFixedRate"  <%if (!lnBasic.getE01DEAFTB().equals("")) out.print("style=\"display:none\""); %>>

    <table class="tableinfo">
    <tr>
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trclear">
            <td nowrap width="25%" >
              <div align="right">Interest Rate :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" name="E01DEARTE_1" size="10" maxlength="9" value="<%= lnBasic.getE01DEARTE().trim()%>" onKeypress="enterSignDecimal()"
              <%if (!lnBasic.getH01SCRCOD().equals("N")) out.print("readonly"); %>>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  >
            </td>
			<td nowrap width="25%" >
              <div align="right">Penalty Rate / Charges :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E01DEAPEI_1" size="8" maxlength="7" value="<%= lnBasic.getE01DEAPEI().trim()%>" onkeypress="enterDecimal()">
              <input type="text" name="E01DEAPIF_1" size="2" maxlength="1" value="<%= lnBasic.getE01DEAPIF().trim()%>" >
              <a href="javascript:lnGetFact('E01DEAPIF_1','STATIC_ln_fact.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0"  ></a>

            </td>
          </tr>
          <% if (showFields == true) { %>
          <tr id="trdark">
            <td nowrap width="25%" >
              <div align="right">Rate Revision Cycle :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" name="E01DEARRP_1" size="3" maxlength="3" value="<%= lnBasic.getE01DEARRP().trim()%>">
			  <a href="javascript:GetCode('E01DEARRP_1','STATIC_ln_rate_rev.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a>
			  <select name="E01DEAF03_1">
                <option value=" " <% if (!(lnBasic.getE01DEAF03().equals("D") ||lnBasic.getE01DEAF03().equals("M") ||lnBasic.getE01DEAF03().equals("Y"))) out.print("selected"); %>></option>
                <option value="D" <% if (lnBasic.getE01DEAF03().equals("D")) out.print("selected"); %>>Day(s)</option>
                <option value="M" <% if (lnBasic.getE01DEAF03().equals("M")) out.print("selected"); %>>Month(s)</option>
				<option value="Y" <% if (lnBasic.getE01DEAF03().equals("Y")) out.print("selected"); %>>Year(s)</option>
              </select>

            </td>
            <td nowrap width="25%" >
              <div align="right">Rate Revision Date :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E01DEARR1_1" size="2" maxlength="2" value="<%= lnBasic.getE01DEARR1().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DEARR2_1" size="2" maxlength="2" value="<%= lnBasic.getE01DEARR2().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DEARR3_1" size="2" maxlength="2" value="<%= lnBasic.getE01DEARR3().trim()%>" onkeypress="enterInteger()">
             <a href="javascript:DatePicker(document.forms[0].E01DEARR1_1,document.forms[0].E01DEARR2_1,document.forms[0].E01DEARR3_1)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></a>
			</td>
          </tr>
          <tr id="trclear">
            <td nowrap width="25%" >
              <div align="right">Maximum Rate Allowed :</div>
            </td>
            <td nowrap width="23%" >
			  <input type="text"  name="E01DEAMXR_1" size="10" maxlength="9" value="<%= lnBasic.getE01DEAMXR()%>">
            </td>
            <td nowrap width="25%" >
              <div align="right">Minimum Rate Allowed :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text"  name="E01DEAMIR_1" size="10" maxlength="9" value="<%= lnBasic.getE01DEAMIR()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="25%" >
              <div align="right">Rate Exchange :</div>
            </td>
            <td nowrap width="23%" >
			  <input type="text"  name="E01DEAEXR_1" size="10" maxlength="9" value="<%= lnBasic.getE01DEAEXR()%>" onKeypress="enterSignDecimal()">
            </td>
            <td nowrap width="25%" >
              <div align="right"></div>
            </td>
            <td nowrap width="27%" >

            </td>
          </tr>

    	  <tr id="trclear">


            <td nowrap align="center" colspan=4 >
              <input type=button name="Coll" value="Variable Interest Rate" onClick="showVariableRate()">
            </td>


          </tr>
          <% } %>
          </table>
      </td>
    </tr>
  </table>
  </div>

  <div id="divVariableRate" <%if (lnBasic.getE01DEAFTB().equals("")) out.print("style=\"display:none\""); %>>
  <table class="tableinfo">
    <tr>
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="25%" >
	              <div align="right">VIR Index Table :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" name="E01DEAFTB" size="2" maxlength="2" value="<%= lnBasic.getE01DEAFTB().trim()%>">
              <a href="javascript:GetFloating('E01DEAFTB')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
              <select name="E01DEAFTY">
                <option value=" " <% if (!(lnBasic.getE01DEAFTY().equals("FP") ||lnBasic.getE01DEAFTY().equals("FS") )) out.print("selected"); %>></option>
                <option value="FP" <% if (lnBasic.getE01DEAFTY().equals("FP")) out.print("selected"); %>>FP</option>
                <option value="FS" <% if (lnBasic.getE01DEAFTY().equals("FS")) out.print("selected"); %>>FS</option>
              </select>
              <input type="text" name="E01FLTRTE" size="9" maxlength="9" value="<%= lnBasic.getE01FLTRTE().trim()%>" readonly>
            </td>
            <td nowrap width="25%" >
              <div align="right">Initial Rate/Spread :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E01DEARTE_VIR" size="10" maxlength="9" value="<%= lnBasic.getE01DEARTE().trim()%>" onKeypress="enterSignDecimal()"
              <%if (!lnBasic.getH01SCRCOD().equals("N")) out.print("readonly"); %>>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  >
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="25%" >
              <div align="right">First VIR Effective Date :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" name="E01DLCPM2" size="2" maxlength="2" value="<%= lnBasic.getE01DLCPM2().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DLCPD2" size="2" maxlength="2" value="<%= lnBasic.getE01DLCPD2().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DLCPY2" size="2" maxlength="2" value="<%= lnBasic.getE01DLCPY2().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01DLCPM2,document.forms[0].E01DLCPD2,document.forms[0].E01DLCPY2)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></a>
            </td>
            <td >
              <div align="right">(*) Points Over VIR :</div>
            </td>
            <td >
               <input type="text"  name="E01DLCFVR" size="10" maxlength="9" value="<%= lnBasic.getE01DLCFVR()%>">
            </td>
          </tr>
          <tr id="trdark">
           <td >
              <div align="right">First VIR Not Greater Than :</div>
            </td>
            <td >
			  <input type="text"  name="E01DLCFVL" size="10" maxlength="9" value="<%= lnBasic.getE01DLCFVL()%>">
            </td>
            <td >
              <div align="right"> Days to Obtain VIR :</div>
            </td>
            <td >
			  <input type="text"  name="E01DLCDOV" size="3" maxlength="2" value="<%= lnBasic.getE01DLCDOV()%>" onKeypress="enterInteger()">
            </td>
          </tr>
          <tr id="trclear">
            <td >
              <div align="right">Rounding Rate :</div>
            </td>
            <td >
              <select name="E01DLCRDT">
                <option value="1" <%if (lnBasic.getE01DLCRDT().equals("1")) { out.print("selected"); }%>>0.001 to the Nearest</option>
                <option value="2" <%if (lnBasic.getE01DLCRDT().equals("2")) { out.print("selected"); }%>>0.010 to the Nearest</option>
                <option value="3" <%if (lnBasic.getE01DLCRDT().equals("3")) { out.print("selected"); }%>>0.100 to the Nearest</option>
                <option value="4" <%if (lnBasic.getE01DLCRDT().equals("4")) { out.print("selected"); }%>>0.125 to the Nearest</option>
                <option value="5" <%if (lnBasic.getE01DLCRDT().equals("5")) { out.print("selected"); }%>>0.250 to the Nearest</option>
                <option value="6" <%if (lnBasic.getE01DLCRDT().equals("6")) { out.print("selected"); }%>>0.500 to the Nearest</option>
                <option value="7" <%if (lnBasic.getE01DLCRDT().equals("7")) { out.print("selected"); }%>>1.000 to the Nearest</option>
                <option value="N" <%if (lnBasic.getE01DLCRDT().equals("N")) { out.print("selected"); }%>>None Routing </option>
              </select>
            </td>
            <td >
              <div align="right">Maximum VIR Change Allowed :</div>
            </td>
            <td >
              <input type="text"  name="E01DLCMRA" size="10" maxlength="9" value="<%= lnBasic.getE01DLCMRA()%>">
            </td>

          </tr>
          <tr id="trdark">
            <td nowrap width="25%" >
              <div align="right">Rate Revision Cycle :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" name="E01DEARRP_VIR" size="3" maxlength="3" value="<%= lnBasic.getE01DEARRP().trim()%>" onblur="rightAlignCharNumber()">
			  <a href="javascript:GetCode('E01DEARRP_VIR','STATIC_ln_rate_rev.jsp')">
			  <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a>
			  <select name="E01DEAF03_VIR">
                <option value=" " <% if (!(lnBasic.getE01DEAF03().equals("D") ||lnBasic.getE01DEAF03().equals("M") ||lnBasic.getE01DEAF03().equals("Y"))) out.print("selected"); %>></option>
                <option value="D" <% if (lnBasic.getE01DEAF03().equals("D")) out.print("selected"); %>>Day(s)</option>
                <option value="M" <% if (lnBasic.getE01DEAF03().equals("M")) out.print("selected"); %>>Month(s)</option>
				<option value="Y" <% if (lnBasic.getE01DEAF03().equals("Y")) out.print("selected"); %>>Year(s)</option>
              </select>

            </td>
            <td nowrap width="25%" >
              <div align="right">Rate Revision Date :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E01DEARR1_VIR" size="2" maxlength="2" value="<%= lnBasic.getE01DEARR1().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DEARR2_VIR" size="2" maxlength="2" value="<%= lnBasic.getE01DEARR2().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DEARR3_VIR" size="2" maxlength="2" value="<%= lnBasic.getE01DEARR3().trim()%>" onkeypress="enterInteger()">
             <a href="javascript:DatePicker(document.forms[0].E01DEARR1_VIR,document.forms[0].E01DEARR2_VIR,document.forms[0].E01DEARR3_VIR)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></a>
			</td>
          </tr>
          <tr id="trclear">
            <td nowrap width="25%" >
              <div align="right">Maximum Rate Allowed :</div>
            </td>
            <td nowrap width="23%" >
			  <input type="text"  name="E01DEAMXR_VIR" size="10" maxlength="9" value="<%= lnBasic.getE01DEAMXR()%>">
            </td>
            <td nowrap width="25%" >
              <div align="right">Minimum Rate Allowed :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text"  name="E01DEAMIR_VIR" size="10" maxlength="9" value="<%= lnBasic.getE01DEAMIR()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="25%" >
              <div align="right">Penalty Rate/Late Fees :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" name="E01DEAPEI_VIR" size="8" maxlength="7" value="<%= lnBasic.getE01DEAPEI().trim()%>" onkeypress="enterDecimal()">
              <input type="text" name="E01DEAPIF_VIR" size="2" maxlength="1" value="<%= lnBasic.getE01DEAPIF().trim()%>" >
              <a href="javascript:lnGetFact('E01DEAPIF_VIR','STATIC_ln_fact.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"  ></a>
            </td>
            <td nowrap width="25%" >
              <div align="right">Rate Exchange :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text"  name="E01DEAEXR_VIR" size="10" maxlength="9" value="<%= lnBasic.getE01DEAEXR()%>" onKeypress="enterSignDecimal()">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap colspan=4>
              (*) Spread will apply when VIR Effective Date Reached
            </td>
          </tr>

          </table>
  	</td>
    </tr>
  </table>
  </div>
  <% if(E01DEACLF.equals("H")){ %>
  <table class="tbenter" width="100%">
  	<tr>
		<td>
			 <h4>Home Equity Payment (<%= lnBasic.getE01DEAIPD().trim()%>)</h4>
		</td>
		<td align="right">
			<% if (lnBasic.getE01PRDRFS().equals("R")) {%>
				<h4><a href="javascript:goRefresh()"><img src="<%=request.getContextPath()%>/images/refresh.gif" alt="Help" border="0" >
               Refresh Payments Cycle</a></h4>
			<%}%>
		</td>
		<td align="right">
			<h4><a href="javascript:GetCode('','STATIC_ln_pay_methods.jsp')"><img src="<%=request.getContextPath()%>/images/aquire.gif" alt="Help" border="0" >
               Help</a></h4>
		</td>
	</tr>
  </table>
  <table  class="tableinfo">
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
        <% 	int g = -1;
            try {g = Integer.parseInt(lnBasic.getE01DEAIPD());} catch(Exception e){}
        	if (lnBasic.getE01DEAPPD().equals("MAT") && g >= 0) { %>
          <tr id="trdark">
            <td nowrap width="33%">
              <div align="right">Payment Date :</div>
            </td>
            <td nowrap width="15%">
              <input type="text" name="PRXPAG31" size="2" maxlength="2" value="<%= lnBasic.getE01DEARD1().trim()%>" onChange="document.forms[0].E01DEARD1.value = document.forms[0].PRXPAG31.value" onKeyPress="enterInteger()">
              <input type="text" name="PRXPAG32" size="2" maxlength="2" value="<%= lnBasic.getE01DEARD2().trim()%>" onChange="document.forms[0].E01DEARD2.value = document.forms[0].PRXPAG32.value" onKeyPress="enterInteger()">
              <input type="text" name="PRXPAG33" size="2" maxlength="2" value="<%= lnBasic.getE01DEARD3().trim()%>" onChange="document.forms[0].E01DEARD3.value = document.forms[0].PRXPAG33.value" onKeyPress="enterInteger()">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  >
            </td>
            <td nowrap width="22%">
              <div align="right"></div>
            </td>
            <td nowrap colspan="2">

            </td>
          </tr>
         <%} else {%>
          <tr id="trdark">
            <td nowrap width="33%">
              <div align="right">Interest Payment Cycle :</div>
            </td>
            <% if (lnBasic.getE01DEAIPD().equals("000") || lnBasic.getE01DEAIPD().equals("")) {%>
            	<td nowrap width="15%"> <input type="text" name="E01DEAIPD" size="4" maxlength="3" value="<%= lnBasic.getE01DEAIPD().trim()%>"> </td>
            <%} else {%>
            	<td nowrap width="15%"> <%= lnBasic.getE01DEAIPD().trim()%> </td>
            <%}%>
            <td nowrap width="22%">
              <div align="right">Next Payment Date :</div>
            </td>
            <td nowrap colspan="2">
              <input type="text" name="PRXPAG31" size="2" maxlength="2" value="<%= lnBasic.getE01DEARD1().trim()%>" onChange="document.forms[0].E01DEARD1.value = document.forms[0].PRXPAG31.value" onKeyPress="enterInteger()">
              <input type="text" name="PRXPAG32" size="2" maxlength="2" value="<%= lnBasic.getE01DEARD2().trim()%>" onChange="document.forms[0].E01DEARD2.value = document.forms[0].PRXPAG32.value" onKeyPress="enterInteger()">
              <input type="text" name="PRXPAG33" size="2" maxlength="2" value="<%= lnBasic.getE01DEARD3().trim()%>" onChange="document.forms[0].E01DEARD3.value = document.forms[0].PRXPAG33.value" onKeyPress="enterInteger()">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  >
            </td>
          </tr>
		  <tr id="trclear">
            <td nowrap width="33%">
              <div align="right">Principal Payment Cycle :</div>
            </td>
            <% if (lnBasic.getE01DEAPPD().equals("000") || lnBasic.getE01DEAIPD().equals("")) {%>
            	<td nowrap width="15%"> <input type="text" name="E01DEAPPD" size="4" maxlength="3" value="<%= lnBasic.getE01DEAPPD().trim()%>" > </td>
            <%} else {%>
            	<td nowrap width="15%"> <%= lnBasic.getE01DEAPPD().trim()%> </td>
            <%}%>

            <td nowrap width="22%">
              <div align="right">Next Payment Date :</div>
            </td>
            <td nowrap colspan="2">
              <input type="text" name="PRHPAG31" size="2" maxlength="2" value="<%= lnBasic.getE01DEAHE1().trim()%>" onChange="document.forms[0].E01DEAHE1.value = document.forms[0].PRHPAG31.value" onKeyPress="enterInteger()">
              <input type="text" name="PRHPAG32" size="2" maxlength="2" value="<%= lnBasic.getE01DEAHE2().trim()%>" onChange="document.forms[0].E01DEAHE2.value = document.forms[0].PRHPAG32.value" onKeyPress="enterInteger()">
              <input type="text" name="PRHPAG33" size="2" maxlength="2" value="<%= lnBasic.getE01DEAHE3().trim()%>" onChange="document.forms[0].E01DEAHE3.value = document.forms[0].PRHPAG33.value" onKeyPress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].PRHPAG31,document.forms[0].PRHPAG32,document.forms[0].PRHPAG33)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  >
            </td>
      	   </tr>
         <%}%>
          <tr id="trclear">
            <td nowrap width="33%">
              <div align="right">Amount of Payment :</div>
            </td>
            <td nowrap width="15%">
              <input type="text" name="E01DEAROA2" size="15" maxlength="13" value="<%= lnBasic.getE01DEAROA().trim()%>"
			  onBlur="document.forms[0].E01DEAROA.value = document.forms[0].E01DEAROA2.value" onKeyPress="enterDecimal()">
            </td>
            <td nowrap width="22%">
              <div align="right">Interest Included in Payment :</div>
            </td>
            <td nowrap colspan="2">
              <input type="hidden" name="E01DEAIIP3" value="<%= lnBasic.getE01DEAIIP()%>">
              <input type="radio" name="XE01DEAIIP" value="Y" onClick="document.forms[0].E01DEAIIP3.value='Y'"
			   onBlur="document.forms[0].E01DEAIIP.value = document.forms[0].E01DEAIIP3.value"
			  <%if(lnBasic.getE01DEAIIP().equals("Y")) out.print("checked");%>>
              Yes
              <input type="radio" name="XE01DEAIIP" value="N" onClick="document.forms[0].E01DEAIIP3.value='N'"
			  onBlur="document.forms[0].E01DEAIIP.value = document.forms[0].E01DEAIIP3.value"
			  <%if(lnBasic.getE01DEAIIP().equals("N")) out.print("checked");%>>
              No <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  >
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="33%" >
              <div align="right">Minimum Payment Amount :</div>
            </td>
            <td nowrap width="15%" >
              <input type="text" name="E01DEAMPA" size="15" maxlength="13" value="<%= lnBasic.getE01DEAMPA().trim()%>" onKeyPress="enterDecimal()">
            </td>
            <td nowrap width="22%" >
              <div align="right">Minimum Disbursement :</div>
            </td>
            <td nowrap colspan="2" >
              <input type="text" name="E01DEAA01" size="15" maxlength="13" value="<%= lnBasic.getE01DEAA01().trim()%>" onKeyPress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="33%" >
              <div align="right">Payment Percent :</div>
            </td>
            <td nowrap width="15%" >
              <input type="text" name="E01DEAPCT" size="5" maxlength="4" value="<%= lnBasic.getE01DEAPCT().trim()%>" >
            </td>
            <td nowrap width="22%" >
              <div align="right">Allow Check Processing :</div>
            </td>
            <td nowrap colspan="2" >
              <input type="hidden" name="E01DEAF02" value="<%= lnBasic.getE01DEAF02()%>">
              <input type="radio" name="CE01DEAF02" value="Y" onClick="document.forms[0].E01DEAF02.value='Y'"
			  <%if(lnBasic.getE01DEAF02().equals("Y")) out.print("checked");%>>
              Yes
              <input type="radio" name="CE01DEAF02" value="N" onClick="document.forms[0].E01DEAF02.value='N'"
			  <%if(lnBasic.getE01DEAF02().equals("N")) out.print("checked");%>>
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
 <% if(isDEAIPDNum && DEAPPD.equals("MAT")){ %>
  <table class="tbenter" width="100%">
  	<tr>
		<td>
			 <h4>Principal and Interest at Maturity (MAT) </h4>
		</td>
		<td align="right">
			<% if (lnBasic.getE01PRDRFS().equals("R")) {%>
				<h4><a href="javascript:goRefresh()"><img src="<%=request.getContextPath()%>/images/refresh.gif" alt="Help" border="0" >
               Refresh Payments Cycle</a></h4>
			<%}%>
		</td>
		<td align="right">
			<h4><a href="javascript:GetCode('','STATIC_ln_pay_methods.jsp')"><img src="<%=request.getContextPath()%>/images/aquire.gif" alt="Help" border="0" >
               Help</a></h4>
		</td>
	</tr>
  </table>

  <table  class="tableinfo">
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="33%">
              <div align="right">Interest Payment Cycle :</div>
            </td>
            <% if (lnBasic.getE01DEAIPD().equals("000") || lnBasic.getE01DEAIPD().equals("")) {%>
            	<td nowrap width="15%"> <input type="text" name="E01DEAIPD" size="4" maxlength="3" value="<%= lnBasic.getE01DEAIPD().trim()%>"> </td>
            <%} else {%>
            	<td nowrap width="15%"> <%= lnBasic.getE01DEAIPD().trim()%> </td>
            <%}%>
            <td nowrap width="22%">
              <div align="right">Next Payment Date :</div>
            </td>
            <td nowrap colspan="2">
              <input type="text" name="PRXPAG01" size="2" maxlength="2" value="<%= lnBasic.getE01DEARD1().trim()%>" onBlur="document.forms[0].E01DEARD1.value = document.forms[0].PRXPAG01.value" onkeypress="enterInteger()">
              <input type="text" name="PRXPAG02" size="2" maxlength="2" value="<%= lnBasic.getE01DEARD2().trim()%>" onBlur="document.forms[0].E01DEARD2.value = document.forms[0].PRXPAG02.value" onkeypress="enterInteger()">
              <input type="text" name="PRXPAG03" size="2" maxlength="2" value="<%= lnBasic.getE01DEARD3().trim()%>" onBlur="document.forms[0].E01DEARD3.value = document.forms[0].PRXPAG03.value" onkeypress="enterInteger()">

              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  >
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="33%">
              <div align="right">Principal Payment Cycle :</div>
            </td>
            <% if (lnBasic.getE01DEAPPD().equals("000") || lnBasic.getE01DEAIPD().equals("")) {%>
            	<td nowrap width="15%"> <input type="text" name="E01DEAPPD" size="4" maxlength="3" value="<%= lnBasic.getE01DEAPPD().trim()%>" > </td>
            <%} else {%>
            	<td nowrap width="15%"> <%= lnBasic.getE01DEAPPD().trim()%> </td>
            <%}%>
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
			<% if (lnBasic.getE01PRDRFS().equals("R")) {%>
				<h4><a href="javascript:goRefresh()"><img src="<%=request.getContextPath()%>/images/refresh.gif" alt="Help" border="0" >
               Refresh Payments Cycle</a></h4>
			<%}%>
		</td>
		<td align="right">
			<h4><a href="javascript:GetCode('','STATIC_ln_pay_methods.jsp')"><img src="<%=request.getContextPath()%>/images/aquire.gif" alt="Help" border="0" >
               Help</a></h4>
		</td>
	</tr>
  </table>

  <table  class="tableinfo">
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="33%">
              <div align="right">Interest Payment Cycle:</div>
            </td>
            <% if (lnBasic.getE01DEAIPD().equals("000") || lnBasic.getE01DEAIPD().equals("")) {%>
            	<td nowrap width="15%"> <input type="text" name="E01DEAIPD" size="4" maxlength="3" value="<%= lnBasic.getE01DEAIPD().trim()%>" > </td>
            <%} else {%>
            	<td nowrap width="15%"> <%= lnBasic.getE01DEAIPD().trim()%> </td>
            <%}%>
            <td nowrap width="23%">
              <div align="right">Next Payment Date :</div>
            </td>
            <td nowrap colspan="2" width="29%">
              <input type="text" name="PRXPAG11" size="2" maxlength="2" value="<%= lnBasic.getE01DEARD1().trim()%>" onBlur="document.forms[0].E01DEARD1.value = document.forms[0].PRXPAG11.value" onkeypress="enterInteger()">
              <input type="text" name="PRXPAG12" size="2" maxlength="2" value="<%= lnBasic.getE01DEARD2().trim()%>" onBlur="document.forms[0].E01DEARD2.value = document.forms[0].PRXPAG12.value" onkeypress="enterInteger()">
              <input type="text" name="PRXPAG13" size="2" maxlength="2" value="<%= lnBasic.getE01DEARD3().trim()%>" onBlur="document.forms[0].E01DEARD3.value = document.forms[0].PRXPAG13.value" onkeypress="enterInteger()">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  >
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="33%">
              <div align="right">Principal Payment Cycle :</div>
            </td>
            <% if (lnBasic.getE01DEAPPD().equals("000") || lnBasic.getE01DEAIPD().equals("")) {%>
            	<td nowrap width="15%"> <input type="text" name="E01DEAPPD" size="4" maxlength="3" value="<%= lnBasic.getE01DEAPPD().trim()%>" > </td>
            <%} else {%>
            	<td nowrap width="15%"> <%= lnBasic.getE01DEAPPD().trim()%> </td>
            <%}%>
            <td nowrap width="23%">
              <div align="right">Next Payment Date :</div>
            </td>
            <td nowrap colspan="2" width="29%">
              <input type="text" name="PRXHAG11" size="2" maxlength="2" value="<%= lnBasic.getE01DEAHE1().trim()%>" onBlur="document.forms[0].E01DEAHE1.value = document.forms[0].PRXHAG11.value" onkeypress="enterInteger()">
              <input type="text" name="PRXHAG12" size="2" maxlength="2" value="<%= lnBasic.getE01DEAHE2().trim()%>" onBlur="document.forms[0].E01DEAHE2.value = document.forms[0].PRXHAG12.value" onkeypress="enterInteger()">
              <input type="text" name="PRXHAG13" size="2" maxlength="2" value="<%= lnBasic.getE01DEAHE3().trim()%>" onBlur="document.forms[0].E01DEAHE3.value = document.forms[0].PRXHAG13.value" onkeypress="enterInteger()">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  >
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="33%" >
              <div align="right">Payment Amount :</div>
            </td>
            <td nowrap width="15%" >
              <input type="text" name="E01DEAROA1" size="15" maxlength="13" value="<%= lnBasic.getE01DEAROA().trim()%>" onKeyPress="enterDecimal()" onBlur="document.forms[0].E01DEAROA.value = document.forms[0].E01DEAROA1.value">
            </td>
            <td nowrap width="23%" >
              <div align="right">Interest Included in Payment :</div>
            </td>
            <td nowrap colspan="2" width="29%" >
              <input type="hidden" name="E01DEAIIP4" value="<%= lnBasic.getE01DEAIIP()%>">
              <input type="radio" name="CE01DEAIIP" value="Y" onClick="document.forms[0].E01DEAIIP4.value='Y'"
              onBlur="document.forms[0].E01DEAIIP.value = document.forms[0].E01DEAIIP4.value"
			  <%if(lnBasic.getE01DEAIIP().equals("Y")) out.print("checked");%>>
              Yes
              <input type="radio" name="CE01DEAIIP" value="N" onClick="document.forms[0].E01DEAIIP4.value='N'"
              onBlur="document.forms[0].E01DEAIIP.value = document.forms[0].E01DEAIIP4.value"
			  <%if(lnBasic.getE01DEAIIP().equals("N")) out.print("checked");%>>
              No <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  ></td>
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
			<% if (lnBasic.getE01PRDRFS().equals("R")) {%>
				<h4><a href="javascript:goRefresh()"><img src="<%=request.getContextPath()%>/images/refresh.gif" alt="Help" border="0" >
               Refresh Payments Cycle</a></h4>
			<%}%>
		</td>
		<td align="right">
			<h4><a href="javascript:GetCode('','STATIC_ln_pay_methods.jsp')"><img src="<%=request.getContextPath()%>/images/aquire.gif" alt="Help" border="0" >
               Help</a></h4>
		</td>
	</tr>
  </table>

  <table  class="tableinfo">
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="33%">
              <div align="right">Number of Payments :</div>
            </td>
            <td nowrap width="15%">
              <input type="text" name="VALNC01" size="4" maxlength="3" value="<%= lnBasic.getE01DLCNC1().trim()%>" onBlur="document.forms[0].E01DLCNC1.value = document.forms[0].VALNC01.value" onkeypress="enterInteger()">
            </td>
            <td nowrap width="22%">
              <div align="right">Payment Frequency :</div>
            </td>
            <td nowrap colspan="2">
              <input type="text" name="FRCFP01" size="4" maxlength="3" value="<%= lnBasic.getE01DLCFP1().trim()%>" onBlur="document.forms[0].E01DLCFP1.value = document.forms[0].FRCFP01.value" onkeypress="enterInteger()">
              <select name="FRCTP01" onBlur="document.forms[0].E01DLCTP1.value = document.forms[0].FRCTP01.value">
                <option value=" " <% if (!(lnBasic.getE01DLCTP1().equals("D") ||lnBasic.getE01DLCTP1().equals("M")||lnBasic.getE01DLCTP1().equals("Y"))) out.print("selected"); %>></option>
                <option value="D" <% if(lnBasic.getE01DLCTP1().equals("D")) out.print("selected");%>>Day(s)</option>
                <option value="M" <% if(lnBasic.getE01DLCTP1().equals("M")) out.print("selected");%>>Month(s)</option>
                <option value="Y" <% if(lnBasic.getE01DLCTP1().equals("Y")) out.print("selected");%>>Year(s)</option>
              </select>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  >
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="33%">
              <div align="right">Prepaid Interest :</div>
            </td>
            <td nowrap width="15%">
              <input type="text" name="E01DLCPM1" readonly size="2" maxlength="2" value="<%= lnBasic.getE01DLCPM1().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DLCPD1" readonly size="2" maxlength="2" value="<%= lnBasic.getE01DLCPD1().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DLCPY1" readonly size="2" maxlength="2" value="<%= lnBasic.getE01DLCPY1().trim()%>" onkeypress="enterInteger()">
            </td>
            <td nowrap width="22%">
              <div align="right">Grace Period :</div>
            </td>
            <td nowrap colspan="2">
              <input type="text" name="E01DLCGM1" size="2" maxlength="2" value="<%= lnBasic.getE01DLCGM1().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DLCGD1" size="2" maxlength="2" value="<%= lnBasic.getE01DLCGD1().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DLCGY1" size="2" maxlength="2" value="<%= lnBasic.getE01DLCGY1().trim()%>" onkeypress="enterInteger()">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="33%" >
              <div align="right">First Payment Date :</div>
            </td>
            <td nowrap width="15%" >
              <input type="text" name="E01DLCXM1" size="2" maxlength="2" value="<%= lnBasic.getE01DLCXM1().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DLCXD1" size="2" maxlength="2" value="<%= lnBasic.getE01DLCXD1().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DLCXY1" size="2" maxlength="2" value="<%= lnBasic.getE01DLCXY1().trim()%>" onkeypress="enterInteger()">
            </td>
            <td nowrap width="22%" >
              <div align="right">Payment Amount :</div>
            </td>
            <td nowrap colspan="2" >
              <input type="text" name="VALVA01" size="14" maxlength="13" value="<%= lnBasic.getE01DLCVA1().trim()%>" onBlur="document.forms[0].E01DLCVA1.value = document.forms[0].VALVA01.value" onkeypress="enterDecimal()">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <%}%>
  <% if(DEAIPD.equals("SC2") && DEAPPD.equals("SC2")){ %>
  <table class="tbenter" width="100%">
  	<tr>
		<td>
			 <h4>Double Payment Schedule (SC2 - Double Amortization Schedule)</h4>
		</td>
		<td align="right">
			<% if (lnBasic.getE01PRDRFS().equals("R")) {%>
				<h4><a href="javascript:goRefresh()"><img src="<%=request.getContextPath()%>/images/refresh.gif" alt="Help" border="0" >
               Refresh Payments Cycle</a></h4>
			<%}%>
		</td>

		<td align="right">
			<h4><a href="javascript:GetCode('','STATIC_ln_pay_methods.jsp')"><img src="<%=request.getContextPath()%>/images/aquire.gif" alt="Help" border="0" >
               Help</a></h4>
		</td>
	</tr>
  </table>

  <table  class="tableinfo">
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
              <input type="text" name="E01DLCOR1" size="4" maxlength="3" value="<%= lnBasic.getE01DLCOR1().trim()%>" onkeypress="enterDecimal()">
              % </td>
            <td nowrap width="22%">
              <div align="right">Principal Amount :</div>
            </td>
            <td nowrap colspan="2">
              <input type="text" name="E01DLCPP1" size="14" maxlength="13" value="<%= lnBasic.getE01DLCPP1().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="33%" height="31">
              <div align="right">Number of Payments :</div>
            </td>
            <td nowrap width="15%" height="31">
              <input type="text" name="VALNC11" size="4" maxlength="3" value="<%= lnBasic.getE01DLCNC1().trim()%>" onBlur="document.forms[0].E01DLCNC1.value = document.forms[0].VALNC11.value" onkeypress="enterInteger()">
            </td>
            <td nowrap width="22%" height="31">
              <div align="right">Payment Frequency :</div>
            </td>
            <td nowrap colspan="2" height="31">
              <input type="text" name="FRCFP11" size="4" maxlength="3" value="<%= lnBasic.getE01DLCFP1().trim()%>" onBlur="document.forms[0].E01DLCFP1.value = document.forms[0].FRCFP11.value" onkeypress="enterDecimal()">
              <select name="FRCTP11" onBlur="document.forms[0].E01DLCTP1.value = document.forms[0].FRCTP11.value">
                <option value=" " <% if (!(lnBasic.getE01DLCTP1().equals("D") ||lnBasic.getE01DLCTP1().equals("M")||lnBasic.getE01DLCTP1().equals("Y"))) out.print("selected"); %>></option>
                <option value="D" <% if(lnBasic.getE01DLCTP1().equals("D")) out.print("selected");%>>Day(s)</option>
                <option value="M" <% if(lnBasic.getE01DLCTP1().equals("M")) out.print("selected");%>>Month(s)</option>
                <option value="Y" <% if(lnBasic.getE01DLCTP1().equals("Y")) out.print("selected");%>>Year(s)</option>
              </select>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="33%" >
              <div align="right">Payment Amount :</div>
            </td>
            <td nowrap width="15%" >
              <input type="text" name="VALVA11" size="14" maxlength="13" value="<%= lnBasic.getE01DLCVA1().trim()%>" onBlur="document.forms[0].E01DLCVA1.value = document.forms[0].VAlVA11.value" onkeypress="enterDecimal()">
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
              <input type="text" name="E01DLCOR2" size="4" maxlength="3" value="<%= lnBasic.getE01DLCOR2().trim()%>" onkeypress="enterDecimal()">
              % </td>
            <td nowrap width="22%">
              <div align="right">Principal Amount :</div>
            </td>
            <td nowrap colspan="2">
              <input type="text" name="E01DLCPP2" size="14" maxlength="13" value="<%= lnBasic.getE01DLCPP2().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="33%" height="31">
              <div align="right">Number of Payments :</div>
            </td>
            <td nowrap width="15%" height="31">
              <input type="text" name="E01DLCNC2" size="4" maxlength="3" value="<%= lnBasic.getE01DLCNC2().trim()%>" onkeypress="enterInteger()">
            </td>
            <td nowrap width="22%" >
              <div align="right">Payment Frequency :</div>
            </td>
            <td nowrap colspan="2" >
              <input type="text" name="E01DLCFP2" size="4" maxlength="3" value="<%= lnBasic.getE01DLCFP2().trim()%>" onkeypress="enterInteger()">
              <select name="E01DLCTP2">
                <option value=" " <% if (!(lnBasic.getE01DLCTP2().equals("D") ||lnBasic.getE01DLCTP2().equals("M")||lnBasic.getE01DLCTP2().equals("Y"))) out.print("selected"); %>></option>
                <option value="D" <% if(lnBasic.getE01DLCTP2().equals("D")) out.print("selected");%>>Day(s)</option>
                <option value="M" <% if(lnBasic.getE01DLCTP2().equals("M")) out.print("selected");%>>Month(s)</option>
                <option value="Y" <% if(lnBasic.getE01DLCTP2().equals("Y")) out.print("selected");%>>Year(s)</option>
              </select>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="33%" >
              <div align="right">Payment Amount :</div>
            </td>
            <td nowrap width="15%" >
              <input type="text" name="E01DLCVA2" size="14" maxlength="13" value="<%= lnBasic.getE01DLCVA2().trim()%>" onkeypress="enterDecimal()">
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

  <table  class="tableinfo">
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="33%">
              <div align="right">Interest Payment Cycle :</div>
            </td>
            <td nowrap width="15%"> <%= lnBasic.getE01DEAIPD().trim()%> </td>
            <td nowrap width="22%">
              <div align="right">Principal Payment Cycle :</div>
            </td>
            <td nowrap colspan="2"><%= lnBasic.getE01DEAPPD().trim()%> </td>
          </tr>
        </table>
        <table  class="tableinfo" style="filter:''">
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
                  <td nowrap width="27%">Compute Interest in Payments</td>
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
                    <div align="center"><% if(pmnt.getRecord(6).equals("Y")) out.print("Yes");
					else if(pmnt.getRecord(6).equals("N")) out.print("No");
				    else out.print("Yes"); %></div>
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
  <table  class="tableinfo">
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="33%">
              <div align="right">Interest Payment Cycle :</div>
            </td>
            <td nowrap width="15%"> <%= lnBasic.getE01DEAIPD().trim()%> </td>
            <td nowrap width="22%">
              <div align="right">Principal Payment Cycle :</div>
            </td>
            <td nowrap colspan="2"><%= lnBasic.getE01DEAPPD().trim()%> </td>
          </tr>
        </table>
        <p><b>Interest</b></p>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="33%">
              <div align="right">Next Payment Date :</div>
            </td>
            <td nowrap width="67%">
              <input type="text" name="PRXPAG21" size="2" maxlength="2" value="<%= lnBasic.getE01DEARD1().trim()%>" onBlur="document.forms[0].E01DEARD1.value = document.forms[0].PRXPAG21.value" onkeypress="enterInteger()">
              <input type="text" name="PRXPAG22" size="2" maxlength="2" value="<%= lnBasic.getE01DEARD2().trim()%>" onBlur="document.forms[0].E01DEARD2.value = document.forms[0].PRXPAG22.value" onkeypress="enterInteger()">
              <input type="text" name="PRXPAG23" size="2" maxlength="2" value="<%= lnBasic.getE01DEARD3().trim()%>" onBlur="document.forms[0].E01DEARD3.value = document.forms[0].PRXPAG23.value" onkeypress="enterInteger()">
            </td>
          </tr>
        </table>
        <p><b>Principal</b><a href="javascript:showPayMaint()"><img src="<%=request.getContextPath()%>/images/eibs_deducciones.gif" alt="Payment Plan" align="middle" border="0" ></a></p>
        <table  class="tableinfo" style="filter:''">
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

  <% if (userPO.getPurpose().equals("MAINTENANCE")) { %>
  <h4>Administrative Information</h4>
  <table class="tableinfo">
    <tr>
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">

          <%if (userPO.getPurpose().equals("MAINTENANCE")){%>
          <tr id="trdark">
            <td nowrap width="25%" >
              <div align="right">Interest Type :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" name="E01DEAICT" size="2" maxlength="1" value="<%= lnBasic.getE01DEAICT().trim()%>">
              <a href="javascript:GetCode('E01DEAICT','STATIC_cd_formula.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a></td>
            <td nowrap width="25%" >
              <div align="right">Loan Status :</div>
            </td>
            <td nowrap width="27%" >
               <input type="text" name="E01DEADLC" size="2" maxlength="1" value="<%= lnBasic.getE01DEADLC().trim()%>">
              <a href="javascript:GetCredCond('E01DEADLC','STATIC_ln_contr.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="25%" >
              <div align="right">Interest Accrual Flag :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" name="E01DEAIFL" size="2" maxlength="1" value="<%= lnBasic.getE01DEAIFL().trim()%>">
              <a href="javascript:lnGetOver('E01DEAIFL','STATIC_ln_prov.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a>
            </td>
            <td nowrap width="25%" >
              <div align="right">Penalty Interest Flag :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E01DEAPCL" size="2" maxlength="1" value="<%= lnBasic.getE01DEAPCL().trim()%>" >
              <a href="javascript:lnGetOver('E01DEAPCL','STATIC_ln_mor.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"  ></a></td>
          </tr>
          <tr id="trdark">
            <td nowrap width="25%" >
              <div align="right">Charges Table :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" name="E01DEATLN" size="2" maxlength="2" value="<%= lnBasic.getE01DEATLN().trim()%>">
              <a href="javascript:GetLoanTable('E01DEATLN',document.forms[0].E01DEATYP.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0"></a>
            </td>
            <td nowrap width="25%" >
              <div align="right">Rate Table :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E01DEARTB" size="2" maxlength="1" value="<%= lnBasic.getE01DEARTB().trim()%>">
              <a href="javascript:GetRateTable('E01DEARTB')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0"></a>
            </td>
          </tr>
        <%}%>

        </table>
      </td>
    </tr>
  </table>
  <% } %>

   <%if (userPO.getPurpose().equals("MAINTENANCE")){%>
  <table class="tbenter">
    <tr >
      <td nowrap>
       <B>List of Deductions</B>
      </td>
      <td nowrap align=center class=tdbkg>
       <a href="javascript:getNewDeduct('<%= lnBasic.getE01DEAACC().trim() %>')">New Deduction</a>
      </td>
    </tr>
  </table>

  <table class="tableinfo" >
    <tr >
      <td nowrap>
        <table  id="TBDEDUCT" cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="20%" >
              <div align="center">Code</div>
            </td>
            <td nowrap width="30%" >
              <div align="center">Company</div>
            </td>
            <td nowrap width="20%" >
              <div align="center">Deduction Amount</div>
            </td>
            <td nowrap width="10%" >
              <div align="center">Factor</div>
            </td>
          </tr>
          <% if (!ded.getNoResult()) {
                ded.initRow();
                while (ded.getNextRow()) {
                    if (ded.getFlag().equals("")) {
	      %>
			          <tr id="trclear">
			            <td nowrap width="20%" >
			              <div align="center"><a href="javascript:getDeduct('<%= lnBasic.getE01DEAACC().trim() %>','<%= ded.getRecord(4) %>')"><%= ded.getRecord(4) %></a></div>
			            </td>
			            <td nowrap width="30%" >
			              <div align="center"><a href="javascript:getDeduct('<%= lnBasic.getE01DEAACC().trim() %>','<%= ded.getRecord(4) %>')"><%= ded.getRecord(10) %></a></div>
			            </td>
			            <td nowrap width="20%" >
			              <div align="center"><a href="javascript:getDeduct('<%= lnBasic.getE01DEAACC().trim() %>','<%= ded.getRecord(4) %>')"><%= ded.getRecord(5) %></a></div>
			            </td>
			            <td nowrap width="10%" >
			              <div align="center"><a href="javascript:getDeduct('<%= lnBasic.getE01DEAACC().trim() %>','<%= ded.getRecord(4) %>')"><%= ded.getRecord(6) %></a></div>
			            </td>
			          </tr>
          <%
                    }
                }
   		  } else {  %>
         <tr id="trclear">
            <td colspan=5>
              <h5 align="center">There are not assigned deductions</h5>
            </td>
         </tr>
       <%  }   %>
       </table>
        </td>
        </tr>
  </table>
  <%  }   %>


  <%if (lnBasic.getE01DEACLF().equals("M")){%>
  <h4><a href="javascript:showPayOver()" >Payment Override </a></h4>
  <div id="divPayOver" style="display:none">
  <table class="tableinfo">
    <tr >
      <td >
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trclear">
           	<td>
            	<div align="right">Payment Option :</div>
            </td>
			<td>
              <select name="E01DLCPOP">
                <option value=" " <% if (!(lnBasic.getE01DLCPOP().equals("1") ||lnBasic.getE01DLCPOP().equals("2")||lnBasic.getE01DLCPOP().equals("3")||lnBasic.getE01DLCPOP().equals("4"))) out.print("selected"); %> selected></option>
                <option value="1" <%if (lnBasic.getE01DLCPOP().equals("1")) { out.print("selected"); }%>>Min. Payment Due</option>
                <option value="2" <%if (lnBasic.getE01DLCPOP().equals("2")) { out.print("selected"); }%>>Int. Only Payment</option>
                <option value="3" <%if (lnBasic.getE01DLCPOP().equals("3")) { out.print("selected"); }%>>XX Years Full Ppal. and Int.</option>
                <option value="4" <%if (lnBasic.getE01DLCPOP().equals("4")) { out.print("selected"); }%>>Normal Loan Payment</option>
              </select>
			</td>
           <td >
              <div align="right">Payment Amount :</div>
            </td>
            <td >
              <input type="text"  name="E01DLCMPA" size="14" maxlength="13" value="<%= lnBasic.getE01DLCMPA() %>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark">
           	<td>
            	<div align="right">Initial Payment Number :</div>
            </td>
			<td>
				<input type="text"  name="E01DLCIPN" size="14" maxlength="13" value="<%= lnBasic.getE01DLCIPN() %>" onKeypress="enterInteger()">
			</td>
           <td >
              <div align="right">Number of Payments :</div>
            </td>
            <td >
              <input type="text"  name="E01DLCNPM" size="14" maxlength="13" value="<%= lnBasic.getE01DLCNPM() %>" onKeypress="enterInteger()">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap colspan=4 ><b>Only for "Minimum Payment Due" Option</b></td>
          </tr>
          <tr id="trdark">
            <td>
            	<div align="right">Factor (%) :</div>
            </td>
			<td>
				<input type="text"  name="E01DLCMFA" size="10" maxlength="9" value="<%= lnBasic.getE01DLCMFA() %>" >
			</td>
           <td >
              <div align="right">Change Frequency :</div>
            </td>
            <td >
              <select name="E01DLCMPF">
                <option value="M" <%if (lnBasic.getE01DLCMPF().equals("M")) { out.print("selected"); }%>>Monthly</option>
                <option value="Q" <%if (lnBasic.getE01DLCMPF().equals("Q")) { out.print("selected"); }%>>Quarterly</option>
                <option value="S" <%if (lnBasic.getE01DLCMPF().equals("S")) { out.print("selected"); }%>>Semiannually</option>
                <option value="Y" <%if (lnBasic.getE01DLCMPF().equals("Y")) { out.print("selected"); }%>>Annually</option>
                <option value="" <%if (lnBasic.getE01DLCMPF().equals(""))   { out.print("selected"); }%>>None</option>
              </select>
            </td>
          </tr>
          <tr id="trclear">
            <td >
              <div align="right">Change Cap (%) :</div>
            </td>
            <td >
              <input type="text"  name="E01DLCMPR" size="10" maxlength="9" value="<%= lnBasic.getE01DLCMPR() %>" >
            </td>
            <td >
              <div align="right">First Time to Override Minimum Payment (Months) :</div>
            </td>
            <td >
              <input type="text"  name="E01DLCEMP" size="4" maxlength="3" readonly value="<%= lnBasic.getE01DLCEMP() %>" >
            </td>
          </tr>
          <tr id="trdark">
            <td>
               <div align="right">Minimum Payment Override Cycle (Months) :</div>
            </td>
            <td>
               <input type="text"  name="E01DLCEMF" size="4" maxlength="3" readonly value="<%= lnBasic.getE01DLCEMF() %>" >
            </td>
            <td nowrap width="22%" >&nbsp;</td>
            <td nowrap colspan="2" >&nbsp;</td>
          </tr>
          <tr id="trclear">
            <td nowrap colspan="4" ><b>Only for "XX-Years Full Principal & Interest" Option</b></td>
          </tr>
          <tr id="trdark">
            <td>
               <div align="right">Loan Terms (Years) :</div>
            </td>
            <td>
               <input type="text"  name="E01DLCTER" size="4" maxlength="3" value="<%= lnBasic.getE01DLCTER() %>" onKeypress="enterInteger()">
            </td>
            <td nowrap width="22%" >&nbsp;</td>
            <td nowrap colspan="2" >&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  </div>
  <%}%>
  <h4>Account to be Debited Automatically when Payment is Due</h4>
  <table  class="tableinfo">
    <tr >
      <td nowrap>
        <table class="tableinfo" style="filter:''">
          <tr id="trdark">
            <td nowrap width="32%">
              <div align="center">Offset</div>
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
                <input type="text" name="E01PAGOPE" value="<%= lnBasic.getE01PAGOPE().trim()%>" size="2" maxlength="2">
                <input type="hidden" name="E01PAGGLN" value="<%= lnBasic.getE01PAGGLN().trim()%>">
                <input type="hidden" name="TYPECONC" value="">
                <input type="text" name="E01PAGCON" size="25" maxlength="25" readonly value="<%= lnBasic.getE01PAGCON().trim()%>"
					oncontextmenu="showPopUp(conceptHelp,this.name,document.forms[0].SCRDEABNK.value,'TYPECONC','E01PAGGLN','E01PAGOPE','10'); return false;">
				</div>
            </td>
            <td nowrap width="14%" >
              <div align="center">
                <input type="text" name="E01PAGBNK" size="2" maxlength="2" value="<%= lnBasic.getE01PAGBNK().trim()%>" onkeypress="enterInteger()">
              </div>
            </td>
            <td nowrap width="17%" >
              <div align="center">
                <input type="text" name="E01PAGBRN" size="3" maxlength="3" value="<%= lnBasic.getE01PAGBRN().trim()%>" onkeypress="enterInteger()"
                oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].SCRDEABNK.value,'','','','')">
					</div>
            </td>
            <td nowrap width="22%" >
              <div align="center">
                <input type="text" name="E01PAGCCY" size="3" maxlength="3" value="<%= lnBasic.getE01PAGCCY().trim()%>"
                oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].SCRDEABNK.value,'','','','')">
				</div>
            </td>
            <td nowrap width="15%" >
              <div align="center">
                <input type="text" name="E01PAGACC" size="12" maxlength="12"  value="<%= lnBasic.getE01PAGACC().trim()%>" onkeypress="enterInteger()"
                oncontextmenu="showPopUp(lnreferHelp,this.name,document.forms[0].SCRDEABNK.value,'',document.forms[0].E01DEACUN.value,'','RT'); return false;">
				</div>
            </td>
          </tr>
        </table>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
		<tr id="trdark">
            <td nowrap width="22%">
              <div align="right">Payment Via :</div>
            </td>
            <td nowrap width="24%">
              <div align="left">
                <select name="E01PMTVIA" onChange="ShowHideACH()">
                  <option value="" <% if(lnBasic.getE01PMTVIA().equals("")) out.print("selected");%>></option>
                  <option value="F" <% if(lnBasic.getE01PMTVIA().equals("F")) out.print("selected");%>>Fed</option>
                  <option value="1" <% if(lnBasic.getE01PMTVIA().equals("1")) out.print("selected");%>>Swift MT-103</option>
                  <option value="2" <% if(lnBasic.getE01PMTVIA().equals("2")) out.print("selected");%>>Swift MT-200</option>
				  <option value="3" <% if(lnBasic.getE01PMTVIA().equals("3")) out.print("selected");%>>Swift MT-220</option>
				  <option value="G" <% if(lnBasic.getE01PMTVIA().equals("G")) out.print("selected");%>>General Ledger</option>
				  <option value="R" <% if(lnBasic.getE01PMTVIA().equals("R")) out.print("selected");%>>Retail Account</option>
                  <option value="C" <% if(lnBasic.getE01PMTVIA().equals("C")) out.print("selected");%>>Official Check</option>
                  <option value="A" <% if(lnBasic.getE01PMTVIA().equals("A")) out.print("selected");%>>ACH</option>
                </select>
              </div>
            </td>
            <td nowrap width="24%">
             <%if (lnBasic.getE01DEAPAR().equals("P")){%>
			  <div align="right">Payment Method :</div>
			  <%}%>
            </td>
            <td nowrap width="30%">
			<%if (lnBasic.getE01DEAPAR().equals("P")){%>
              <select name="E01PMTMTH">
                <option value="" <% if(lnBasic.getE01PMTMTH().equals("")) out.print("selected");%>></option>
                <option value="1" <% if(lnBasic.getE01PMTMTH().equals("1")) out.print("selected");%>>Tied to the Loan</option>
                <option value="2" <% if(lnBasic.getE01PMTMTH().equals("2")) out.print("selected");%>>Independent</option>
                <option value="3" <% if(lnBasic.getE01PMTMTH().equals("3")) out.print("selected");%>>Manual</option>
              </select>
			  <%}%>
            </td>
          </tr>


          <tr id="trclear">
            <td nowrap width="22%">
              <div align="right">Overdraft Authorization : </div>
            </td>
            <td nowrap width="24%">
              <input type="text" name="E01DEAODA" size="2" maxlength="1" value="<%= lnBasic.getE01DEAODA().trim()%>">
              <a href="javascript:lnGetOver('E01DEAODA','STATIC_ln_over.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0"></a></td>
            <td nowrap width="24%">
              <div align="right">Allow Payments in Holidays : </div>
            </td>
            <td nowrap width="30%">
              <input type="hidden" name="E01DEAHFQ" value="<%= lnBasic.getE01DEAHFQ()%>">
              <input type="radio" name="CE01DEAHFQ" value="1" onClick="document.forms[0].E01DEAHFQ.value='1'"
			  <%if(lnBasic.getE01DEAHFQ().equals("1")) out.print("checked");%>>
              Yes
              <input type="radio" name="CE01DEAHFQ" value="2" onClick="document.forms[0].E01DEAHFQ.value='2'"
			  <%if(lnBasic.getE01DEAHFQ().equals("2")) out.print("checked");%>>
              No </td>
          </tr>
          <%
                pmnt.initRow();
                while (pmnt.getNextRow()) {
                    if (pmnt.getFlag().equals("")) {
                    		//out.println(coll.getRecord());
	      %> <%
                    }
                }
    %>
        </table>

      </td>
    </tr>
  </table>

  <div id="divACH" <%if (!lnBasic.getE01PMTVIA().equals("A")) out.print("style=\"display:none\""); %>>
  <h4>ACH Information</h4>
       <table class="tableinfo" >
		 <tr id="trdark">
            <td nowrap width="30%">
              <div align="right">Bank Routing :</div>
            </td>
            <td nowrap width="70%">
              <input type="text" name="E01ACDROU" size="10" maxlength="9" value="<%= lnBasic.getE01ACDROU().trim()%>">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  >
              <a href="javascript:GetExternalAccountACH('E01ACDNME','E01ACDADD','E01ACDCSZ','E01ACDEMA','E01ACDROU','E01ACDDAC','E01ACDACT', document.forms[0].E01DEACUN.value)">Select from ACH Recipients</a>
            </td>
         </tr>
         <tr id="trclear">
            <td nowrap width="30%">
			  <div align="right">External Account :</div>
            </td>
            <td nowrap width="70%">
				<input type="text" name="E01ACDDAC" size="18" maxlength="17" value="<%= lnBasic.getE01ACDDAC().trim()%>">
				<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  >
            </td>
          </tr>
		 <tr id="trdark">
            <td nowrap width="30%">
              <div align="right">Account Type :</div>
            </td>
            <td nowrap width="70%">
              <select name="E01ACDACT">
                <option value="C" <% if(lnBasic.getE01ACDACT().equals("C")) out.print("selected");%>>Checking</option>
                <option value="S" <% if(lnBasic.getE01ACDACT().equals("S")) out.print("selected");%>>Saving</option>
              </select>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  >
             </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="30%">
			  <div align="right">Name :</div>
            </td>
            <td nowrap width="70%">
				<input type="text" name="E01ACDNME" size="50" maxlength="45" value="<%= lnBasic.getE01ACDNME().trim()%>">
				<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  >
            </td>
          </tr>
		 <tr id="trdark">
            <td nowrap width="30%">
              <div align="right">Address :</div>
            </td>
            <td nowrap width="70%">
				<input type="text" name="E01ACDADD" size="50" maxlength="45" value="<%= lnBasic.getE01ACDADD().trim()%>">
				<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  >
             </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="30%">
			  <div align="right">City, State, Zip Code :</div>
            </td>
            <td nowrap width="70%">
				<input type="text" name="E01ACDCSZ" size="50" maxlength="45" value="<%= lnBasic.getE01ACDCSZ().trim()%>">
				<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  >
            </td>
         </tr>
		 <tr id="trdark">
            <td nowrap width="30%">
              <div align="right">e-mail :</div>
            </td>
            <td nowrap width="70%" >
				<input type="text" name="E01ACDEMA" size="70" maxlength="60" value="<%= lnBasic.getE01ACDEMA().trim()%>">
             </td>
         </tr>
      </table>
  </div>


  <% if(E01FLGPAY.equals("Y")) { %>
  <h4>Projected Payments</h4>
  <table  class="tableinfo">
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="25%">
              <div align="right">Final Payment Amount :</div>
            </td>
            <td nowrap width="23%">
              <input type="text" name="E01DEABAP" size="15" maxlength="13" value="<%= lnBasic.getE01DEABAP().trim()%>" onkeypress="enterDecimal()">
            </td>
            <td nowrap width="25%">
              <div align="right">Final Payment Date :</div>
            </td>
            <td nowrap width="27%">
              <input type="text" name="E01DEABA1" size="2" maxlength="2" value="<%= lnBasic.getE01DEABA1().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DEABA2" size="2" maxlength="2" value="<%= lnBasic.getE01DEABA2().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DEABA3" size="2" maxlength="2" value="<%= lnBasic.getE01DEABA3().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01DEABA1,document.forms[0].E01DEABA2,document.forms[0].E01DEABA3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></a>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="25%">
              <div align="right">% Payment Increase :</div>
            </td>
            <td nowrap width="23%">
              <input type="text" name="E01DEAPAP" size="10" maxlength="9" value="<%= lnBasic.getE01DEAPAP().trim()%>" onkeypress="enterDecimal()">
            </td>
            <td nowrap width="25%">
              <div align="right">Factor :</div>
            </td>
            <td nowrap width="27%">
              <input type="text" name="E01DEA2TC" size="4" maxlength="1" value="<%= lnBasic.getE01DEAOAM().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="25%" >
              <div align="right">Next Payment Increase Cycle : </div>
            </td>
            <td nowrap width="23%" >
              <input type="text" name="E01DEAPCU" size="4" maxlength="3" value="<%= lnBasic.getE01DEAPCU().trim()%>" onkeypress="enterInteger()">
            </td>
            <td nowrap width="25%" >
              <div align="right">Date :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E01DEALS1" size="2" maxlength="2" value="<%= lnBasic.getE01DEALS1().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DEALS2" size="2" maxlength="2" value="<%= lnBasic.getE01DEALS2().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DEALS3" size="2" maxlength="2" value="<%= lnBasic.getE01DEALS3().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01DEALS1,document.forms[0].E01DEALS2,document.forms[0].E01DEALS3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></a>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="25%" >
              <div align="right">Principal Payment :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" name="E01DLCABA" size="14" maxlength="13" value="<%= lnBasic.getE01DLCABA().trim()%>" onkeypress="enterDecimal()" >
            </td>
            <td nowrap width="25%" >
              <div align="right">Factor :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E01DLCABF" size="4" maxlength="1" value="<%= lnBasic.getE01DLCABF().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="25%" >
              <div align="right">Next Payment Cycle :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" name="E01DLCABC" size="4" maxlength="3" value="<%= lnBasic.getE01DLCABC().trim()%>"  onkeypress="enterInteger()">
            </td>
            <td nowrap width="25%" >
              <div align="right">Date :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E01DLCAB1" size="2" maxlength="2" value="<%= lnBasic.getE01DLCAB1().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DLCAB2" size="2" maxlength="2" value="<%= lnBasic.getE01DLCAB2().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DLCAB3" size="2" maxlength="2" value="<%= lnBasic.getE01DLCAB3().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01DLCAB1,document.forms[0].E01DLCAB2,document.forms[0].E01DLCAB3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></a>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <%}%>
  <% if(datapro.eibs.master.JSEIBSProp.getShowDeductionList()) { %>
  <h4>Deductions List</h4>
  <table  class="tableinfo">
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
  <% if(datapro.eibs.master.JSEIBSProp.getShowCollateralList()) { %>
  <h4>Collaterals List</h4>
  <table  class="tableinfo">
    <tr >
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
<%
		if (error.getERWRNG().equals("Y")) {
				error.setERWRNG(" ");
	%>
			<h4 style="text-align:center"><input type="checkbox" name="H01FLGWK2" value="A">
      		Accept with Warnings</h4>
	<%
		}
	%>
  <br>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF">
      <td width="50%" align="center">
       		<input id="EIBSBTN" type=button name="Coll" value="Collaterals" onClick="showCollMaint();">
	  </td>
      <td width="50%" align="center">
       		<input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="setRateValues();">
  	  </td>
    </tr>
  </table>

  </form>
</body>
</html>
