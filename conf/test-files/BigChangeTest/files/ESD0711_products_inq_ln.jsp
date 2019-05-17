<html>
<head>
<title>Loans Products Inquiry</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>


</head>

<jsp:useBean id="lnProdInq" class="datapro.eibs.beans.ESD071110Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<body>

<%
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }
%>

<h3 align="center">Loans Product Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="products_inq_ln.jsp, ESD0711"></h3>
<hr size="4">

<form>


  <h4>Product Classification</h4>

  <table class="tableinfo">
    <tr>
      <td >
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td width="30%">
              <div align="right">Product Type: </div>
            </td>
            <td width="70%">
              <input type="text" readonly name="E10APCTYP" size="6" maxlength="4" value="<%= lnProdInq.getE10APCTYP().trim()%>">
              <input type="text" readonly name="E10TYPDES" size="37" maxlength="35" value="<%= lnProdInq.getE10TYPDES().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td width="30%">
              <div align="right">Product Code: </div>
            </td>
            <td width="70%">
              <input type="text" readonly name="E10APCCDE" size="6" maxlength="4" value="<%= lnProdInq.getE10APCCDE().trim()%>">
              <input type="text" readonly name="E10DESCRI" size="65" maxlength="63" value="<%= lnProdInq.getE10DESCRI().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td width="30%">
              <div align="right">Alias: </div>
            </td>
            <td width="70%">
              <input type="text" readonly name="E10MERCAD" size="17" maxlength="15" value="<%= lnProdInq.getE10MERCAD().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <h4>Account Information</h4>

  <table class="tableinfo">
    <tr>
      <td >
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td width="50%">
              <div align="right">Bank: </div>
            </td>
            <td width="50%">
              <input type="text" readonly name="E10APCBNK" size="4" maxlength="2" value="<%= lnProdInq.getE10APCBNK().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td width="50%">
              <div align="right">Currency: </div>
            </td>
            <td width="50%">
              <input type="text" readonly name="E10APCCCY" size="5" maxlength="3" value="<%= lnProdInq.getE10APCCCY().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td width="50%">
              <div align="right">Account: </div>
            </td>
            <td width="50%">
              <input type="text" readonly name="E10APCGLN" size="18" maxlength="12" value="<%= lnProdInq.getE10APCGLN().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td width="50%">
              <div align="right">Account Description: </div>
            </td>
            <td width="50%">
              <input type="text" readonly name="E10GLMDSC" size="37" maxlength="35" value="<%= lnProdInq.getE10GLMDSC().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <h4>Financial Information</h4>

  <table class="tableinfo">
    <tr >
      <td >
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <!--<tr id="trdark">
            <td width="45%">
              <div align="right">Loan Type: </div>
            </td>
            <td width="55%">
              <input type="text" readonly name="E10APCITP" size="3" maxlength="1" value="">
            </td>
          </tr>-->
          <tr id="trclear">
            <td width="45%">
              <div align="right">Accrual Type: </div>
            </td>
            <td width="55%">
              <input type="text" readonly name="E10APCMCI" size="3" maxlength="1" value="<%= lnProdInq.getE10APCMCI().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td width="45%">
              <div align="right">Past Due Interest: </div>
            </td>
            <td width="55%">
              <input type="text" readonly name="E10APCMCP" size="3" maxlength="1" value="<%= lnProdInq.getE10APCMCP().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td width="45%">
              <div align="right">Principal Payment Cycle:</div>
            </td>
            <td width="55%">
              <input type="text" readonly name="E10APCPPD" size="5" maxlength="3" value="<%= lnProdInq.getE10APCPPD().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td width="45%">
              <div align="right">Interest Payment Cycle:</div>
            </td>
            <td width="55%">
              <input type="text" readonly name="E10APCIPD" size="5" maxlength="3" value="<%= lnProdInq.getE10APCIPD().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td width="45%">
              <div align="right">Table of Charges: </div>
            </td>
            <td width="55%">
              <input type="text" readonly name="E10APCTLN" size="4" maxlength="2" value="<%= lnProdInq.getE10APCTLN().trim()%>">
              <input type="text" readonly name="E10TBLDSC" size="37" maxlength="35" value="<%= lnProdInq.getE10TBLDSC().trim()%>">
			  <a href="javascript:showLNServCharge('<%= lnProdInq.getE10APCBNK().trim()%>','<%= lnProdInq.getE10APCTYP().trim()%>','<%= lnProdInq.getE10APCTLN().trim()%>');"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
          </tr>
          <tr id="trdark">
            <td width="45%">
              <div align="right">Rate Table: </div>
            </td>
            <td width="55%">
              <input type="text" readonly name="E10APCCDT" size="3" maxlength="1" value="<%= lnProdInq.getE10APCCDT().trim()%>">
              <a href="javascript:showCDRates('<%= lnProdInq.getE10APCCCY().trim()%>','<%= lnProdInq.getE10APCCDT().trim()%>');"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
          </tr>
          <tr id="trclear">
            <td width="45%">
              <div align="right">Customer Type: </div>
            </td>
            <td width="55%">
              <input type="text" readonly name="E10APCRES" size="3" maxlength="1" value="<%= lnProdInq.getE10APCRES().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td width="45%">
              <div align="right">Floating Rate Table: </div>
            </td>
            <td width="55%">
              <input type="text" readonly name="E10APCFRT" size="4" maxlength="2" value="<%= lnProdInq.getE10APCFRT().trim()%>">
              <input type="text" readonly name="E10FLTDSC" size="37" maxlength="35" value="<%= lnProdInq.getE10FLTDSC().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td width="45%">
              <div align="right">Floating Rate Type: </div>
            </td>
            <td width="55%">
              <input type="text" readonly name="E10APCFTY" size="4" maxlength="2" value="<%= lnProdInq.getE10APCFTY().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td width="45%">
              <div align="right">Rate Change Cycle:</div>
            </td>
            <td width="55%">
              <input type="text" readonly name="E10APCRRD" size="5" maxlength="3" value="<%= lnProdInq.getE10APCRRD().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td width="45%">
              <div align="right">Documents Table: </div>
            </td>
            <td width="55%">
              <input type="text" readonly name="E10APCFTF" size="4" maxlength="2" value="<%= lnProdInq.getE10APCFTF().trim()%>">
              <input type="text" readonly name="E10DOCDSC" size="37" maxlength="35" value="<%= lnProdInq.getE10DOCDSC().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Mortgage Information</h4>
  <table class="tableinfo">
    <tr >
      <td >
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trclear">
            <td width="70%">
              <div align="right">Minimun Payment Change Frequency : </div>
            </td>
            <td width="30%">
				<input type="text" name="E01APAMPF" size="15" maxlength="15" readonly
			  	value="<% if (lnProdInq.getE01APAMPF().equals("M")) out.print("Monthly");
							else if (lnProdInq.getE01APAMPF().equals("Q")) out.print("Quarterly");
							else if (lnProdInq.getE01APAMPF().equals("S")) out.print("Semiannually");
							else if (lnProdInq.getE01APAMPF().equals("Y")) out.print("Annually");
							else out.print("None");%>">
            </td>
          </tr>
          <tr id="trdark">
            <td width="70%">
              <div align="right">First Time to Override Minimum Payment (Months) : </div>
            </td>
            <td width="30%">
              <input type="text"  name="E01APAEMP" size="4" maxlength="3" readonly value="<%= lnProdInq.getE01APAEMP() %>">
            </td>
          </tr>
          <tr id="trclear">
            <td width="70%">
              <div align="right">Minimum Payment Override Cycle : </div>
            </td>
            <td width="30%">
              <input type="text"  name="E01APAEMF" size="4" maxlength="3" readonly value="<%= lnProdInq.getE01APAEMF() %>">
            </td>
          </tr>
          <tr id="trdark">
            <td width="20%">
              <div align="right">Minimum Payment Change Cap (%) : </div>
            </td>
            <td width="80%">
              <input type="text"  name="E01APAMPR" size="17" maxlength="16" readonly value="<%= lnProdInq.getE01APAMPR() %>">
            </td>
          </tr>
          <tr id="trclear">
            <td width="70%">
              <div align="right">Minimun Payment Factor (%) : </div>
            </td>
            <td width="30%">
				<input type="text"  name="E01APAMFA" size="17" readonly maxlength="16" value="<%= lnProdInq.getE01APAMFA() %>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Access Path</h4>
  <table class="tableinfo">
    <tr >
      <td >
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td width="50%">
              <div align="right">Audio : </div>
            </td>
            <td width="50%">
              <input type="text" readonly name="E10APEAUD" size="82" maxlength="80" value="<%= lnProdInq.getE10APEAUD().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td width="50%">
              <div align="right">Video : </div>
            </td>
            <td width="50%">
              <input type="text" readonly name="E10APEVID" size="82" maxlength="80" value="<%= lnProdInq.getE10APEVID().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td width="50%">
              <div align="right">HTML : </div>
            </td>
            <td width="50%">
              <input type="text" readonly name="E10APEHTM" size="82" maxlength="80" value="<%= lnProdInq.getE10APEHTM().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <br><div align="center">
    <input id="EIBSBTN" type=button name="Submit" value="Close" onClick="top.close()">
  </div>
</form>
</body>
</html>