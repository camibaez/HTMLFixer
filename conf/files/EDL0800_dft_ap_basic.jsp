<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Consulta Descuento de Documentos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT> 
 <script src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"></script>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>


<jsp:useBean id="dftBasic" class="datapro.eibs.beans.EDL080001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<jsp:useBean id= "lstAcceptors" class= "datapro.eibs.beans.JBListRec"  scope="session" />

<jsp:useBean id= "lstDocuments" class= "datapro.eibs.beans.JBListRec"  scope="session" />

<SCRIPT Language="Javascript">

builtNewMenu(dft_a_opt);
builtHPopUp();
initMenu();

</SCRIPT>

</head>
<body nowrap>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }
if (userPO.getPurpose().equals("MAINTENANCE")){
 out.println("<SCRIPT>  initMenu(); </SCRIPT>");}

  String DEAIPD, DEAPPD;
  String E01FLGDED, E01FLGREF,E01FLGPAY,E01FLGCOL,E01DEACLF;
  boolean isDEAIPDNum = true;
  boolean isDEAPPDNum = true;
  //DEAIPD = lnBasic.getE01DEAIPD().trim();
  //DEAPPD = lnBasic.getE01DEAPPD().trim();
  //E01FLGDED = lnBasic.getE01FLGDED().trim();
  //E01FLGREF = lnBasic.getE01FLGREF().trim();
  //E01FLGPAY = lnBasic.getE01FLGPAY().trim();
  //E01FLGCOL = lnBasic.getE01FLGCOL().trim();
  //E01DEACLF = lnBasic.getE01DEACLF().trim();
  
  String genFlag = "";
  try {
      genFlag = request.getParameter("generic").trim();
      if (genFlag == null) genFlag = "";
  } catch (Exception e) {
    //genFlag = lnBasic.getE01DEACLF().trim();
  }
	
  String strBlank = "";

%> 
<h3 align="center"> <%= dftBasic.getE01DSCPRO().trim() %><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="dft_ap_basic.jsp, EDL0800"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0800" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="502">
  <INPUT TYPE=HIDDEN NAME="ACTION" VALUE="F">
  <INPUT TYPE=HIDDEN NAME="E01DEABNK" value="<%= dftBasic.getE01DEABNK() %>">
  <input type=HIDDEN name="E01DEATYP" value="<%= dftBasic.getE01DEATYP() %>">
  <input type=hidden name="GRP" value="0">

  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left">
                <input type="text" name="E01DEACUN" size="9" maxlength="9" value="<%= dftBasic.getE01DEACUN() %>" readonly>
                </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" name="E01CUSNA1" size="45" maxlength="45" value="<%= dftBasic.getE01CUSNA1() %>" readonly>
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
<%            
			  String strNroAcc = dftBasic.getE01DEAACC();
              if (dftBasic.getE01DEAACC().equals("999999999999")) {
              	strNroAcc = "NEW ACCOUNT";	  
              }
%>
                <input type="hidden" name="E01DEAACC" size="12" maxlength="12" value="<%= dftBasic.getE01DEAACC()  %>">
                <input type="text" name="E01DEAACCDSC" size="12" maxlength="12" value="<%= strNroAcc  %>" readonly>              

              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="4" maxlength="3" value="<%= dftBasic.getE01DEACCY() %>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <input type="text" name="E01DEAPRO" size="4" maxlength="4" value="<%= dftBasic.getE01DEAPRO() %>" readonly>
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
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Opening Date:</div>
            </td>
            <td nowrap width="23%"> 
              <input type="text" name="E01DEAOD1" <% if (dftBasic.getF01DEAOD1().equals("Y")) out.print("id=\"txtchanged\""); %> size="2" maxlength="2" value="<%= dftBasic.getE01DEAOD1() %>" readonly>
              <input type="text" name="E01DEAOD2" <% if (dftBasic.getF01DEAOD2().equals("Y")) out.print("id=\"txtchanged\""); %> size="2" maxlength="2" value="<%= dftBasic.getE01DEAOD2() %>" readonly>
              <input type="text" name="E01DEAOD3" <% if (dftBasic.getF01DEAOD3().equals("Y")) out.print("id=\"txtchanged\""); %> size="2" maxlength="2" value="<%= dftBasic.getE01DEAOD3() %>" readonly>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Original Amount :</div>
            </td>
            <td nowrap width="27%">
		<input type="text" name="E01DEAOAM" <% if (dftBasic.getF01DEAOAM().equals("Y")) out.print("id=\"txtchanged\""); %> size="15" maxlength="15" value="<%= dftBasic.getE01DEAOAM() %>" readonly>
              </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Tipo de Tasa Flotante:</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEAFTB" <% if (dftBasic.getF01DEAFTB().equals("Y")) out.print("id=\"txtchanged\""); %> size="2" maxlength="2" value="<%= dftBasic.getE01DEAFTB() %>" readonly> <select name="E01DEAFTY" disabled>
                            <OPTION value=" " <% if (!(dftBasic.getE01DEAFTY().equals("FP") ||dftBasic.getE01DEAFTY().equals("FS"))) out.print("selected"); %>=""></OPTION>
                            <OPTION value="FP" <% if (dftBasic.getE01DEAFTY().equals("FP")) out.print("selected"); %>="">FP</OPTION>
                            <OPTION value="FS" <% if (dftBasic.getE01DEAFTY().equals("FS")) out.print("selected"); %>="">FS</OPTION>
                        </select>
              <input type="text" name="E01FLTRTE" <% if (dftBasic.getF01FLTRTE().equals("Y")) out.print("id=\"txtchanged\""); %> size="9" maxlength="9" value="<%= dftBasic.getE01FLTRTE() %>" readonly>
            </td>
            <td nowrap width="25%" > 
              <div align="right">Interest Rate/Spread :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DEARTE" <% if (dftBasic.getF01DEARTE().equals("Y")) out.print("id=\"txtchanged\""); %> size="10" maxlength="9" value="<%= dftBasic.getE01DEARTE() %>" readonly> </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Penalty Rate/Charges:</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEAPEI" <% if (dftBasic.getF01DEAPEI().equals("Y")) out.print("id=\"txtchanged\""); %> size="8" maxlength="7" value="<%= dftBasic.getE01DEAPEI() %>"  readonly>
              <input type="text" name="E01DEAPIF" <% if (dftBasic.getF01DEAPIF().equals("Y")) out.print("id=\"txtchanged\""); %> size="2" maxlength="1" value="<%= dftBasic.getE01DEAPIF() %>"  readonly> </td>
            <td nowrap width="25%" > 
              <div align="right">Reference Number:</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DEAREF" <% if (dftBasic.getF01DEAREF().equals("Y")) out.print("id=\"txtchanged\""); %> size="12" maxlength="12" value="<%= dftBasic.getE01DEAREF() %>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Line of Credit :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEACMC" <% if (dftBasic.getF01DEACMC().equals("Y")) out.print("id=\"txtchanged\""); %> size="9" maxlength="9" value="<%= dftBasic.getE01DEACMC() %>"  readonly>
              <input type="text" name="E01DEACMN" <% if (dftBasic.getF01DEACMN().equals("Y")) out.print("id=\"txtchanged\""); %> size="4" maxlength="4" value="<%= dftBasic.getE01DEACMN() %>"  readonly> </td>
            <td nowrap width="25%" > 
              <div align="right">Cost Center : </div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DEACCN" <% if (dftBasic.getF01DEACCN().equals("Y")) out.print("id=\"txtchanged\""); %> size="8" maxlength="8" value="<%= dftBasic.getE01DEACCN() %>" readonly> </td>
          </tr>
          
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Taxes and Withholding:</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEAWHF" <% if (dftBasic.getF01DEAWHF().equals("Y")) out.print("id=\"txtchanged\""); %> size="2" maxlength="1" value="<%= dftBasic.getE01DEAWHF() %>" readonly> </td>
            <td nowrap width="25%" > 
              <div align="right">Mailing Address:</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DEAMLA" <% if (dftBasic.getF01DEAMLA().equals("Y")) out.print("id=\"txtchanged\""); %> size="2" maxlength="1" value="<%= dftBasic.getE01DEAMLA() %>" readonly> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Broker Code :</div>
           </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEABRK" <% if (dftBasic.getF01DEABRK().equals("Y")) out.print("id=\"txtchanged\""); %> size="4" maxlength="3" value="<%= dftBasic.getE01DEABRK() %>" readonly> </td>
            <td nowrap width="25%" > 
              <div align="right">Commission Percentage :</div>
            </td>
            <td nowrap width="27%" > 
		<input type="text" name="E01DEABCP" <% if (dftBasic.getF01DEABCP().equals("Y")) out.print("id=\"txtchanged\""); %> size="10" maxlength="9" value="<%= dftBasic.getE01DEABCP() %>"  readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Document Type:</div>
            </td>
            <td nowrap width="23%" >
		<select name="E01DEARET" disabled>
                            <OPTION value=" " <% if (dftBasic.getE01DEARET().trim().equals(""))  out.print("selected"); %>=""></OPTION>
                            <OPTION value="1" <% if (dftBasic.getE01DEARET().equals("1"))  out.print("selected"); %>="">Giros o Letras</OPTION>
                            <OPTION value="2" <% if (dftBasic.getE01DEARET().equals("2")) out.print("selected"); %>="">Conformes</OPTION>
                            <OPTION value="3" <% if (dftBasic.getE01DEARET().equals("3")) out.print("selected"); %>="">Facturas</OPTION>
                            <OPTION value="4" <% if (dftBasic.getE01DEARET().equals("4")) out.print("selected"); %>="">Checks</OPTION>
                            <OPTION value="5" <% if (dftBasic.getE01DEARET().equals("5")) out.print("selected"); %>="">MasterCard Coupons</OPTION>
                        </select>

              </td>
            <td nowrap width="25%" ><INPUT type="hidden" name="E01DEACLF" size="2" maxlength="1" value="<%= dftBasic.getE01DEACLF() %>" readonly></td>
            <td nowrap width="27%" > 
            </td>
          </tr>
          
          <%if (userPO.getPurpose().equals("MAINTENANCE")){%> 
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Interest Type:</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEAICT" <% if (dftBasic.getF01DEAICT().equals("Y")) out.print("id=\"txtchanged\""); %> size="2" maxlength="1" value="<%= dftBasic.getE01DEAICT() %>" readonly>
              </td>
            <td nowrap width="25%" > 
              <div align="right">Per�odo Base :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DEABAS" <% if (dftBasic.getF01DEABAS().equals("Y")) out.print("id=\"txtchanged\""); %> size="4" maxlength="3" value="<%= dftBasic.getE01DEABAS() %>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Interest Calculation Method:</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEAIFL" <% if (dftBasic.getF01DEAIFL().equals("Y")) out.print("id=\"txtchanged\""); %> size="2" maxlength="1" value="<%= dftBasic.getE01DEAIFL() %>" readonly> </td>
            <td nowrap width="25%" > 
              <div align="right">Penalty Rate/Late Fees:</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DEAPCL" <% if (dftBasic.getF01DEAPCL().equals("Y")) out.print("id=\"txtchanged\""); %> size="2" maxlength="1" value="<%= dftBasic.getE01DEAPCL() %>"  readonly>
              </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Charges Table:</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEATLN" <% if (dftBasic.getF01DEATLN().equals("Y")) out.print("id=\"txtchanged\""); %> size="2" maxlength="2" value="<%= dftBasic.getE01DEATLN() %>" readonly> </td>
            <td nowrap width="25%" > 
              <div align="right">Grace Period:</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DEAGPD" <% if (dftBasic.getF01DEAGPD().equals("Y")) out.print("id=\"txtchanged\""); %> size="3" maxlength="2" value="<%= dftBasic.getE01DEAGPD() %>"  readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Rate Table:</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEARTB" <% if (dftBasic.getF01DEARTB().equals("Y")) out.print("id=\"txtchanged\""); %> size="2" maxlength="1" value="<%= dftBasic.getE01DEARTB() %>" readonly> </td>
            <td nowrap width="25%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="27%" >
              </td>
          </tr>
          <%}%> 
        </table>
      </td>
    </tr>
  </table>

<h4>Payment Account</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="33%"> 
              <div align="center">Concept</div>
            </td>
            <td nowrap width="15%"> 
              <div align="center">Bank</div>
            </td>
            <td nowrap width="22%"> 
              <div align="center">Branch</div>
            </td>
            <td nowrap> 
              <div align="center">Currency </div>
            </td>
            <td nowrap> 
              <div align="center">Reference</div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="33%" > 
              <div align="center" nowrap> 
                <input type="text" name="E01PAGOPE" value="<%= dftBasic.getE01PAGOPE() %>" size="3" maxlength="3" readonly>
                <input type="hidden" name="E01PAGGLN" value="<%= dftBasic.getE01PAGGLN() %>">
                <input type="text" name="E01PAGCON" size="25" maxlength="25" readonly value="<%= dftBasic.getE01PAGCON() %>"
                  oncontextmenu="showPopUp(conceptHelp,this.name,document.forms[0].E01DEABNK.value,'','E01PAGGLN','E01PAGOPE','10')">
			  </div>
            </td>
            <td nowrap width="15%" > 
              <div align="center"> 
                <input type="text" name="E01PAGBNK" <% if (dftBasic.getF01PAGBNK().equals("Y")) out.print("id=\"txtchanged\""); %> size="2" maxlength="2" value="<%= dftBasic.getE01PAGBNK() %>" readonly>
              </div>
            </td>
            <td nowrap width="22%" > 
              <div align="center"> 
                <input type="text" name="E01PAGBRN" <% if (dftBasic.getF01PAGBRN().equals("Y")) out.print("id=\"txtchanged\""); %> size="3" maxlength="3" value="<%= dftBasic.getE01PAGBRN() %>"
                oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E01DEABNK.value,'','','','')" readonly>
			  </div>
            </td>
            <td nowrap width="14%" > 
              <div align="center"> 
                <input type="text" name="E01PAGCCY" <% if (dftBasic.getF01PAGCCY().equals("Y")) out.print("id=\"txtchanged\""); %> size="3" maxlength="3" value="<%= dftBasic.getE01PAGCCY() %>"
                oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E01DEABNK.value,'','','','')" readonly>
			</div>
            </td>
            <td nowrap width="16%" > 
              <div align="center"> 
                <input type="text" name="E01PAGACC" <% if (dftBasic.getF01PAGACC().equals("Y")) out.print("id=\"txtchanged\""); %> size="12" maxlength="12"  value="<%= dftBasic.getE01PAGACC() %>"
                oncontextmenu="showPopUp(accountHelp,this.name,document.forms[0].E01DEABNK.value,'','','','RT')" readonly>
			  </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="33%" >&nbsp;</td>
            <td nowrap width="15%" >&nbsp;</td>
            <td nowrap width="22%" >&nbsp;</td>
            <td nowrap width="14%" >&nbsp;</td>
            <td nowrap width="16%" >&nbsp;</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="33%" >Allowed Overdraft : <input type="text" name="E01DEAODA" <% if (dftBasic.getF01DEAODA().equals("Y")) out.print("id=\"txtchanged\""); %> size="2" maxlength="1" value="<%= dftBasic.getE01DEAODA() %>" readonly> </td>
            <td nowrap width="15%" > 
              <div align="center"> </div>
            </td>
            <td nowrap width="22%" > 
              <div align="right">Allowed Payment in Holliday: </div>
            </td>
            <td nowrap colspan="2" > 
              <div align="left">
                <input type="hidden" name="E01DEAHFQ" value="<%= dftBasic.getE01DEAHFQ() %>">
                <input type="radio" name="CE01DEAHFQ" value="1" onClick="document.forms[0].E01DEAHFQ.value='1'"
			  <%if(dftBasic.getE01DEAHFQ().equals("1")) out.print("checked");%> readonly> Yes <input type="radio" name="CE01DEAHFQ" value="2" onClick="document.forms[0].E01DEAHFQ.value='2'"
			  <%if(dftBasic.getE01DEAHFQ().equals("2")) out.print("checked");%> readonly>
                No </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

<h4>Acceptants</h4>

<TABLE class="tableinfo">
   <tr > 
      <td nowrap>
            <table cellpadding="2" cellspacing="0" width="100%" border="0">
<% 
	lstAcceptors.initRow();
	boolean firstTime = true;
	String chk = "";
     	while (lstAcceptors.getNextRow()) {
     		out.print("<tr id=\"trdark\">");
    		out.print("<TD nowrap width=\"20%\">"); 
    		out.print("<div align=\"center\">Identification</div>"); 
    		out.print("</TD>");
    		out.print("<TD nowrap width=\"20%\">");
    		out.print("<div align=\"left\">Name</div>");
    		out.print("</TD>");
    		out.print("<TD nowrap width=\"60%\">");
    		out.print("</TD>");
    		out.print("</TR>");
    		
         	if (lstAcceptors.getFlag().equals("")) {
     			out.print("<tr id=\"trclear\">");
				out.print("<TD nowrap width=\"20%\">");
				out.print("<div align=\"center\"><INPUT size=\"20\" type=\"text\" name=\"IDACCEPTOR\" value=\"" + lstAcceptors.getRecord(0) + "\" readonly></div>");
				out.print("</TD>");
				out.print("<TD nowrap width=\"20%\">");
				out.print("<div align=\"center\"><INPUT size=\"45\" type=\"text\" name=\"NMEACCEPTOR\" value=\"" + lstAcceptors.getRecord(1) + "\" readonly></div>");
				out.print("</TD>");
				out.print("<TD nowrap width=\"60%\">");
				
				out.print("</TD>");
				out.print("</tr>");
				lstDocuments.initRow();
				firstTime = true;
				while (lstDocuments.getNextRow()) {
					if (lstDocuments.getFlag().equals("") && lstDocuments.getRecord(8).equals(lstAcceptors.getRecord(0))) {
					    if (firstTime) {
					         out.print("<tr>");
					         out.print("<td colspan=\"3\">");
					         
					         out.print("<table>");
					         firstTime = false;
					         out.print("<tr>");
						     out.print("<TD>");
						     out.print("</td>");
						     out.print("<TD>");
							 out.print("</td>");
							 out.print("<TD>");
							 out.print("<div align=\"center\">Sequence</div>");
							 out.print("</TD>");
							 out.print("<TD>");
							 out.print("<div align=\"center\">Maturity Date</div>");
							 out.print("</TD>");
							 out.print("<TD>");
							 out.print("<div align=\"center\">Amount</div>");
							 out.print("</TD>");
							 out.print("<TD>");
							 out.print("<div align=\"center\">Interest Rate</div>");
							 out.print("</TD>");
							 out.print("<TD>");
							 out.print("Debit Account");
							 out.print("</TD>");
							 out.print("<TD>");
							 out.print("Payment Via");
							 out.print("</TD>");
							 out.print("<TD>");
							 out.print("Interest");
							 out.print("</TD>");
							 out.print("<TD>");
							 out.print("Penalty Interest");
							 out.print("</TD>");
							 out.print("<TD>");
							 out.print("Status");
							 out.print("</TD>");
							 out.print("<TD>");
							 out.print("Payment Date");
							 out.print("</TD>");
							 out.println("</tr>"); 
					    }
					    
						out.print("<tr id=\"trclear\">");
						out.print("<TD width=\"14\">");
						out.print("<div align=\"center\"></div></td>");
						out.print("<TD width=\"14\">");
						out.print("<div align=\"center\"></div></td>");
						out.print("<TD nowrap>");
						out.print("<div align=\"center\"><INPUT size=\"9\" type=\"text\" name=\"NDR\" value=\"" + lstDocuments.getRecord(0) + "\" readonly></div>");
						out.print("</TD>");
						out.print("<TD nowrap>");
						out.print("<div align=\"center\"><INPUT size=\"2\" type=\"text\" name=\"MA1\" value=\"" + lstDocuments.getRecord(1) + "\" readonly>");
						out.print("<INPUT size=\"2\" type=\"text\" name=\"MA2\" value=\"" + lstDocuments.getRecord(2) + "\" readonly>");
						out.print("<INPUT size=\"2\" type=\"text\" name=\"MA3\" value=\"" + lstDocuments.getRecord(3) + "\" readonly></div>");
						out.print("</TD>");
						out.print("<TD nowrap>");
						out.print("<div align=\"center\"><INPUT size=\"20\" type=\"text\" name=\"OAM\" value=\"" + lstDocuments.getRecord(4) + "\" readonly></div>");
						out.print("</TD>");
						out.print("<TD nowrap>");
						out.print("<div align=\"center\"><INPUT size=\"10\" type=\"text\" name=\"ARC\" value=\"" + lstDocuments.getRecord(5) + "\" readonly></div>");
						out.print("</TD>");
						out.print("<TD nowrap>");
						out.print("<div align=\"center\"><INPUT size=\"12\" type=\"text\" name=\"ACC\" value=\"" + lstDocuments.getRecord(6) + "\" readonly></div>");
						out.print("</TD>");
						out.print("<TD nowrap>");
						out.print("<div align=\"center\"><INPUT size=\"6\" type=\"text\" name=\"REW\" value=\"" + lstDocuments.getRecord(10) + "\" readonly></div>");
						out.print("</TD>");
						out.print("<TD nowrap>");
						out.print("<div align=\"center\"><INPUT size=\"15\" type=\"text\" name=\"INT\" value=\"" + lstDocuments.getRecord(11) + "\" readonly></div>");
						out.print("</TD>");
						out.print("<TD nowrap>");
						out.print("<div align=\"center\"><INPUT size=\"15\" type=\"text\" name=\"MOR\" value=\"" + lstDocuments.getRecord(12) + "\" readonly></div>");
						out.print("</TD>");
						out.print("<TD nowrap>");
						out.print("<div align=\"center\"><INPUT size=\"2\" type=\"text\" name=\"STS\" value=\"" + lstDocuments.getRecord(13) + "\" readonly></div>");
						out.print("</TD>");
						out.print("<TD nowrap>");
						out.print("<div align=\"center\"><INPUT size=\"2\" type=\"text\" name=\"PA1\" value=\"" + lstDocuments.getRecord(14) + "\" readonly>");
						out.print("<INPUT size=\"2\" type=\"text\" name=\"PA2\" value=\"" + lstDocuments.getRecord(15) + "\" readonly>");
						out.print("<INPUT size=\"2\" type=\"text\" name=\"PA3\" value=\"" + lstDocuments.getRecord(16) + "\" readonly></div>");
						out.print("</TD>");
								
						
						out.print("</tr>");
					}
				}
				out.print("<TR>");
				out.print("<TD>");
				out.print("</TD>");
				out.print("<TD>");
				out.print("</TD>");
				out.print("<TD>");
				out.print("</TD>");
				out.print("<TD>");
			    out.print("<div align=\"right\">Total :</div>");
				out.print("</TD>");
				out.print("<TD>");
				out.print("<div align=\"center\"><INPUT size=\"20\" type=\"text\" name=\"TOTACCEPTOR\" value=\"" + lstAcceptors.getRecord(2) + "\" readonly></div>");
				out.print("</TD>");
				out.print("<TD>");
				out.print("</TD>");
				out.print("<TD>");
				out.print("</TD>");
				out.print("<TD>");
				out.print("</TD>");
				out.println("</TR>"); 
				
				out.print("</table>");
				out.print("</td>");
				out.print("</tr>");
         	}
       	}
%>
   </table>
    </td>
  </tr>
</table>

<p align="center">&nbsp;</p>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="33%"> 
        <div align="center"></div>
      </td>
      <td width="34%"> 
        <div align="center">
        </div>
      </td>
      <td width="33%"> 
        <div align="center"></div>
      </td>
    </tr>
  </table>
  <p align="center">&nbsp; </p>
  </form>

</body>
</html>
