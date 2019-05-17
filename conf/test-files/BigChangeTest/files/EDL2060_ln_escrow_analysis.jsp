<html>
<head>
<title>Loan Exchange Rate</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EscrowAnalisys" class= "datapro.eibs.beans.EDL206001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

</head>




<body nowrap>



<%
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 if ( !userPO.getPurpose().equals("NEW") ) {
    out.println("<SCRIPT> initMenu();  </SCRIPT>");
 }
%>

<h3 align="center">Escrow Analysis<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="ln_escrow_analisys.jsp, EDL2060"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL2060" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">

  <h4>Enter the Following Information :</h4>
  <table class="tableinfo">
    <tr >
      <td>
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark">
            <td width="39%">
              <div align="right">Escrow Analysis Date :</div>
            </td>
            <td width="61%">
              <input type="text" name="E01ESCDT1" size="2" maxlength="2" value="<%= EscrowAnalisys.getE01ESCDT1().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01ESCDT2" size="2" maxlength="2" value="<%= EscrowAnalisys.getE01ESCDT2().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01ESCDT3" size="2" maxlength="2" value="<%= EscrowAnalisys.getE01ESCDT3().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01ESCDT1,document.forms[0].E01ESCDT2,document.forms[0].E01ESCDT3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
            </td>
          </tr>
          <tr id="trclear">
            <td width="39%">
              <div align="right">From Escrow Analysis Date :</div>
            </td>
            <td width="61%">
		      <input type="text" name="E01ESCFR1" size="2" maxlength="2" value="<%= EscrowAnalisys.getE01ESCFR1().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01ESCFR2" size="2" maxlength="2" value="<%= EscrowAnalisys.getE01ESCFR2().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01ESCFR3" size="2" maxlength="2" value="<%= EscrowAnalisys.getE01ESCFR3().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01ESCFR1,document.forms[0].E01ESCFR2,document.forms[0].E01ESCFR3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
            </td>
          </tr>
          <tr id="trdark">
            <td width="39%" >
              <div align="right">To Escrow Analysis Date :</div>
            </td>
            <td width="61%">
              <input type="text" name="E01ESCTO1" size="2" maxlength="2" value="<%= EscrowAnalisys.getE01ESCTO1().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01ESCTO2" size="2" maxlength="2" value="<%= EscrowAnalisys.getE01ESCTO2().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01ESCTO3" size="2" maxlength="2" value="<%= EscrowAnalisys.getE01ESCTO3().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01ESCTO1,document.forms[0].E01ESCTO2,document.forms[0].E01ESCTO3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
            </td>
          </tr>
          <tr id="trclear">
            <td width="39%">
              <div align="right">Minimum Amount to Refund :</div>
            </td>
            <td width="61%">
              <input type="text" name="E01ESCMIN" size="17" maxlength="17" value="<%= EscrowAnalisys.getE01ESCMIN().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td width="39%">
            </td>
            <td width="61%">
            </td>
          </tr>
          <tr id="trclear">
            <td width="33%">
             <div align="right">Account Number :</div>
            </td>
            <td width="33%">
              <input type="text" name="E01ESCACC" size="12" maxlength="12" value="<%= EscrowAnalisys.getE01ESCACC().trim()%>">
              <a href="javascript:GetAccount('E01ESCACC','','10','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            ( Leave blank for all accounts )</td>
          </tr>
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
