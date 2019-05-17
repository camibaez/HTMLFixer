<html>
<head>
<title>Inquiry Loan Product</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="lnProdInq" class= "datapro.eibs.beans.ESD071110Message"  scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">
<%
if ( userPO.getHeader23().equals("G") ||  userPO.getHeader23().equals("V")){
%>
	builtNewMenu(ln_i_1_opt);
<%
}
else  {
%>
	builtNewMenu(ln_i_2_opt);
<%
}
%>

</SCRIPT>
<body>

<%
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }
    out.println("<SCRIPT> initMenu();  </SCRIPT>");

%>

<h3 align="center">Inquiry Loan Products<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="ln_products_inq.jsp, EDL0160"></h3>
<hr size="4">

<form>
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="14%" >
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="9%" >
              <div align="left">
                <input type="text" name="E02CUN2" size="9" maxlength="9" readonly value="<%= userPO.getHeader2().trim()%>">
              </div>
            </td>
            <td nowrap width="12%" >
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap >
              <div align="left">
                <input type="text" name="E02NA12" size="45" maxlength="45" readonly value="<%= userPO.getHeader3().trim()%>">
              </div>
            </td>
            <td nowrap >
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap ><b>
              <input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getHeader1().trim()%>">
              </b></td>
          </tr>
          <tr id="trdark">
            <td nowrap width="14%">
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="9%">
              <div align="left">
                <input type="text" name="E02ACC" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%">
              <div align="right">Officer :</div>
            </td>
            <td nowrap width="33%">
              <div align="left"><b>
                <input type="text" name="E02NA122" size="30" maxlength="30" readonly value="<%= userPO.getOfficer().trim()%>">
                </b> </div>
            </td>
            <td nowrap width="11%">
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="21%">
              <div align="left"><b>
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4> Clasification of Product</h4>
  <table class="tableinfo">
    <tr >
      <td >
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td width="30%">
              <div align="right">Product Type : </div>
            </td>
            <td width="70%">
              <input type="text" readonly name="E10APCTYP" size="6" maxlength="4" value="<%= lnProdInq.getE10APCTYP().trim()%>">
              <input type="text" readonly name="E10TYPDES" size="37" maxlength="35" value="<%= lnProdInq.getE10TYPDES().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td width="30%">
              <div align="right">Product Code : </div>
            </td>
            <td width="70%">
              <input type="text" readonly name="E10APCCDE" size="6" maxlength="4" value="<%= lnProdInq.getE10APCCDE().trim()%>">
              <input type="text" readonly name="E10DESCRI" size="37" maxlength="63" value="<%= lnProdInq.getE10DESCRI().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td width="30%">
              <div align="right">Marketing Name : </div>
            </td>
            <td width="70%">
              <input type="text" readonly name="E10MERCAD" size="17" maxlength="15" value="<%= lnProdInq.getE10MERCAD().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <h4>General Ledger Information </h4>

  <table class="tableinfo">
    <tr >
      <td >
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td width="50%">
              <div align="right">Bank Code : </div>
            </td>
            <td width="50%">
              <input type="text" readonly name="E10APCBNK" size="4" maxlength="2" value="<%= lnProdInq.getE10APCBNK().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td width="50%">
              <div align="right">Currency Code : </div>
            </td>
            <td width="50%">
              <input type="text" readonly name="E10APCCCY" size="5" maxlength="3" value="<%= lnProdInq.getE10APCCCY().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td width="50%">
              <div align="right">General Ledger Account Code: </div>
            </td>
            <td width="50%">
              <input type="text" readonly name="E10APCGLN" size="18" maxlength="16" value="<%= lnProdInq.getE10APCGLN().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td width="50%">
              <div align="right"> General Ledger Account Description : </div>
            </td>
            <td width="50%">
              <input type="text" readonly name="E10GLMDSC" size="37" maxlength="35" value="<%= lnProdInq.getE10GLMDSC().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <h4>Finacial Information</h4>

  <table class="tableinfo">
    <tr>
      <td >
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td width="41%">
              <div align="right">Loan Type: </div>
            </td>
            <td width="59%">
              <input type="text" readonly name="E10APCFRN" size="3" maxlength="1" value="<%= lnProdInq.getE10APCFRN().trim()%>">
              <input type="text" readonly name="E10APCRES2" size="35" maxlength="1"
			   value="<% if (lnProdInq.getE10APCFRN().equals("L")) out.print("Regular Loans");
			    		else if (lnProdInq.getE10APCFRN().equals("F")) out.print("Fixed Payments Loans");
						else if (lnProdInq.getE10APCFRN().equals("G")) out.print("Factoring");
						else if (lnProdInq.getE10APCFRN().equals("V")) out.print("Local Collections");
						else if (lnProdInq.getE10APCFRN().equals("O")) out.print("Loans for Overdraft");
						else if (lnProdInq.getE10APCFRN().equals("C")) out.print("Consumer Loans");
						else if (lnProdInq.getE10APCFRN().equals("A")) out.print("Leasing");
						else if (lnProdInq.getE10APCFRN().equals("M")) out.print("Mortgage Loans");%>">
            </td>
          </tr>
          <tr id="trclear">
            <td width="41%">
              <div align="right">Interest Calculate : </div>
            </td>
            <td width="59%">
              <input type="text" readonly name="E10APCMCI" size="3" maxlength="1" value="<%= lnProdInq.getE10APCMCI().trim()%>">
              <input type="text" readonly name="E10APCRES22" size="35" maxlength="1"
			   value="<% if (lnProdInq.getE10APCMCI().equals("1")) out.print("Outstanding  Principal");
			    		else if (lnProdInq.getE10APCMCI().equals("2")) out.print("Original Principal");
						else if (lnProdInq.getE10APCMCI().equals("3")) out.print("Outstanding Principal less Principal Due");
						else if (lnProdInq.getE10APCMCI().equals("N")) out.print("No Accrual");
						else out.print("");%>">
            </td>
          </tr>
          <tr id="trdark">
            <td width="41%">
              <div align="right">Penalty Calculate : </div>
            </td>
            <td width="59%">
              <input type="text" readonly name="E10APCMCP" size="3" maxlength="1" value="<%= lnProdInq.getE10APCMCP().trim()%>">
              <input type="text" readonly name="E10APCRES222" size="35" maxlength="1"
			   value="<% if (lnProdInq.getE10APCMCP().equals("1")) out.print("Principal Due");
			    		else if (lnProdInq.getE10APCMCP().equals("2")) out.print("Original Principal");
						else if (lnProdInq.getE10APCMCP().equals("3")) out.print("Outstanding Principal");
						else if (lnProdInq.getE10APCMCP().equals("4")) out.print("Payment Amount P + I");
						else if (lnProdInq.getE10APCMCI().equals("N")) out.print("No Penalty");
						else out.print("");%>">
            </td>
          </tr>
          <tr id="trclear">
            <td width="41%">
              <div align="right">Principal Payment Cycle :</div>
            </td>
            <td width="59%">
              <input type="text" readonly name="E10APCPPD" size="5" maxlength="3" value="<%= lnProdInq.getE10APCPPD().trim()%>">
              <input type="text" readonly name="E10APCRES2222" size="45" maxlength="1"
			   value="<% if (lnProdInq.getE10APCPPD().equals("MAT")) out.print("Principal at Maturity");
						else if (lnProdInq.getE10APCPPD().equals("SCH")) out.print("Irregular Payment Plan");
						else if (lnProdInq.getE10APCPPD().equals("SC1")) out.print("Fixed Payment Amount");
						else if (lnProdInq.getE10APCPPD().equals("SC2")) out.print("Double Payment Schedule");
						else out.print("Principal at Cycle");%>">
            </td>
          </tr>
          <tr id="trdark">
            <td width="41%">
              <div align="right">Interest Payment Cycle :</div>
            </td>
            <td width="59%">
              <input type="text" readonly name="E10APCIPD" size="5" maxlength="3" value="<%= lnProdInq.getE10APCIPD().trim()%>">
              <input type="text" readonly name="E10APCRES22222" size="45" maxlength="1"
			   value="<% if (lnProdInq.getE10APCIPD().equals("MAT")) out.print("Interest at Maturity");
						else if (lnProdInq.getE10APCIPD().equals("SCH")) out.print("Irregular Payment Plan");
						else if (lnProdInq.getE10APCIPD().equals("SC1")) out.print("Fixed Payment Amount");
						else if (lnProdInq.getE10APCIPD().equals("SC2")) out.print("Double Payment Schedule");
						else out.print("Interest at Cycle");%>">
            </td>
          </tr>
          <tr id="trclear">
            <td width="41%">
              <div align="right">Table of Charges : </div>
            </td>
            <td width="59%">
              <input type="text" readonly name="E10APCTLN" size="4" maxlength="2" value="<%= lnProdInq.getE10APCTLN().trim()%>">
              <input type="text" readonly name="E10TBLDSC" size="37" maxlength="35" value="<%= lnProdInq.getE10TBLDSC().trim()%>">
              <a href="javascript:showLNServCharge('<%= lnProdInq.getE10APCBNK().trim()%>','<%= lnProdInq.getE10APCTYP().trim()%>','<%= lnProdInq.getE10APCTLN().trim()%>');"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
          </tr>
          <tr id="trdark">
            <td width="41%">
              <div align="right">Table of Charges / Range : </div>
            </td>
            <td width="59%">
              <input type="text" readonly name="E10APCCDT" size="3" maxlength="1" value="<%= lnProdInq.getE10APCCDT().trim()%>">
              <a href="javascript:showCDRates('<%= lnProdInq.getE10APCCCY().trim()%>','<%= lnProdInq.getE10APCCDT().trim()%>');"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
          </tr>
          <tr id="trclear">
            <td width="41%">
              <div align="right">Customer Type : </div>
            </td>
            <td width="59%">
              <input type="text" readonly name="E10APCRES" size="15" maxlength="1"
			   value="<% if (lnProdInq.getE10APCRES().equals("1")) out.print("Resident");
			    		else if (lnProdInq.getE10APCRES().equals("2")) out.print("No Resident");
						else out.print("N/A");%>">
            </td>
          </tr>
          <tr id="trdark">
            <td width="41%">
              <div align="right">Floating Rate Table: </div>
            </td>
            <td width="59%">
              <input type="text" readonly name="E10APCFRT" size="4" maxlength="2" value="<%= lnProdInq.getE10APCFRT().trim()%>">
              <input type="text" readonly name="E10FLTDSC" size="37" maxlength="35" value="<%= lnProdInq.getE10FLTDSC().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td width="41%">
              <div align="right">Floating Rate Type: </div>
            </td>
            <td width="59%">
              <input type="text" readonly name="E10APCFTY" size="15" maxlength="2"
				value="<% if (lnProdInq.getE10APCFTY().equals("FP")) out.print("Primary");
			    		else if (lnProdInq.getE10APCFTY().equals("FS")) out.print("Secondary");
						else out.print("");%>">
            </td>
          </tr>
          <tr id="trdark">
            <td width="41%">
              <div align="right">Change Rate Cycle :</div>
            </td>
            <td width="59%">
              <input type="text" readonly name="E10APCRRD" size="5" maxlength="3" value="<%= lnProdInq.getE10APCRRD().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td width="41%">
              <div align="right">Documents Table : </div>
            </td>
            <td width="59%">
              <input type="text" readonly name="E10APCFTF" size="4" maxlength="2" value="<%= lnProdInq.getE10APCFTF().trim()%>">
              <input type="text" readonly name="E10DOCDSC" size="37" maxlength="35" value="<%= lnProdInq.getE10DOCDSC().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Access Address</h4>
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
  <BR>

</form>
</body>
</html>
