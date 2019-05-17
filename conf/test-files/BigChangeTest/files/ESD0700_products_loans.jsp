<html>
<head>
<title>Loans Product Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<jsp:useBean id="prd" class="datapro.eibs.beans.ESD070001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<body>

<%
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     error.setERRNUM("0");
     out.println("</SCRIPT>");
     }
%>

<h3 align="center"> Loans Product Maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="products_loans.jsp, ESD0700"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0700" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1">
  <INPUT TYPE=HIDDEN NAME="E01APCACD" VALUE="<%= prd.getE01APCACD()%>">
  <table class="tableinfo">
    <tr >
      <td>
        <table cellspacing="0" cellpadding="2" width="100%"  class="tbhead"  align="center">
          <tr>
            <td nowrap width="10%" align="right"> Bank: </td>
            <td nowrap width="12%" align="left">
              <input type="text"  name="E01APCBNK" size="3" maxlength="2" value="<%= prd.getE01APCBNK()%>" >
            </td>
            <td nowrap width="6%" align="right">Product : </td>
            <td nowrap width="14%" align="left">
              <input type="text"  name="E01APCCDE" size="6" maxlength="4" value="<%= prd.getE01APCCDE()%>" >
            </td>
            <td nowrap width="8%" align="right"> Product Type : </td>
            <td nowrap width="50%"align="left">
              <input type="text"  name="E01APCTYP" size="6" maxlength="4" value="<%= prd.getE01APCTYP()%>" >
              -
              <input type="text"  name="E01DSCTYP" size="25" maxlength="25" value="<%= prd.getE01DSCTYP()%>" >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>General Information </h4>

  <table class="tableinfo">
    <tr >
      <td >
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td >
              <div align="right">Description :</div>
            </td>
            <td >
              <input type="text"  name="E01APCDS1" size="50" maxlength="40" value="<%= prd.getE01APCDS1()%>">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  >
            </td>
            <td >
              <div align="right">Marketing Name :</div>
            </td>
            <td >
              <input type="text"  name="E01APCDS2" size="30" maxlength="25" value="<%= prd.getE01APCDS2()%>">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  >
            </td>
          </tr>
          <tr id="trclear">
            <td >
              <div align="right">Currency :</div>
            </td>
            <td >
              <input type="text"  name="E01APCCCY" size="3" maxlength="3" value="<%= prd.getE01APCCCY()%>">
              <a href="javascript:GetCurrency('E01APCCCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  >
            </td>
            <td >
              <div align="right">Offered Via :</div>
            </td>
            <td >
                 <SELECT name="H01FLGWK3">
              	    <option value="1" <%if (prd.getH01FLGWK3().equals("1")) { out.print("selected"); }%>>Internet</option>
              	    <option value="3" <%if (prd.getH01FLGWK3().equals("3")) { out.print("selected"); }%>>Plattform</option>
                    <option value="5" <%if (prd.getH01FLGWK3().equals("5")) { out.print("selected"); }%>>Both</option>
              	    <option value="N" <%if (prd.getH01FLGWK3().equals("N")) { out.print("selected"); }%>>None</option>
				</SELECT>
            </td>
          </tr>
          <tr id="trdark">
            <td >
              <div align="right"> General Ledger:</div>
            </td>
            <td >
              <input type="text"  name="E01APCGLN" size="16" maxlength="12" value="<%= prd.getE01APCGLN() %>">
              <a href="javascript:GetLedger('E01APCGLN',document.forms[0].E01APCBNK.value,document.forms[0].E01APCCCY.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  >
            </td>
            <td >
              <div align="right">Witholding Taxes :</div>
            </td>
            <td >
              <input type="text"  name="E01APCTAX" size="3" maxlength="2" value="<%= prd.getE01APCTAX()%>" >
              <a href="javascript:GetCode('E01APCTAX','STATIC_client_help_tax_instructions.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
            </td>
          </tr>
          <tr id="trclear">
            <td >
              <div align="right">Table of Documents :</div>
            </td>
            <td >
              <input type="text"  name="E01APCFTF" size="4" maxlength="2" value="<%= prd.getE01APCFTF() %>" onKeypress="enterInteger()">
              <a href="javascript:GetDocInv('E01APCFTF')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  >
            </td>
            <td >
              <div align="right">Resident/Non Resident :</div>
            </td>
            <td >
              <select name="E01APCRES">
                <option value="1" <%if (prd.getE01APCRES().equals("1")) { out.print("selected"); }%>>Resident</option>
                <option value="2" <%if (prd.getE01APCRES().equals("2")) { out.print("selected"); }%>>Non Resident</option>
                <option value="" <%if (prd.getE01APCRES().equals(""))   { out.print("selected"); }%>>Not Applicable</option>
              </select>
            </td>
          </tr>
          <tr id="trdark">
            <td >
              <div align="right">Product Family :</div>
            </td>
            <td >
              <input type="text"  name="E01APCUC1" size="4" maxlength="2" value="<%= prd.getE01APCUC1() %>">
            </td>
            <td>
            	<div align="right">Corporate/Personal :</div>
            </td>
            <td>
              <select name="E01APCFL4">
                <option value="1" <%if (prd.getE01APCFL4().equals("1")) { out.print("selected"); }%>>Corporate</option>
                <option value="2" <%if (prd.getE01APCFL4().equals("2")) { out.print("selected"); }%>>Personal</option>
                <option value="" <%if (prd.getE01APCFL4().equals(""))   { out.print("selected"); }%>>Not Aplicable</option>
              </select>
			</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <h4>Additional Information</h4>

  <table class="tableinfo" width="779" >
    <tr >
      <td >
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td width="31%">
              <div align="right">Loan Type : </div>
            </td>
            <td width="25%">
              <input type="text"  name="E01APCITP" size="3" maxlength="1" value="<%= prd.getE01APCITP() %>" >
              <a href="javascript:GetCode('E01APCITP','STATIC_ln_cred_class.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
            </td>
            <td width="26%">
              <div align="right"> Deductions :</div>
            </td>
            <td width="18%">
              <input type="radio" name="E01APCFRN" value="Y"  <%if (prd.getE01APCFRN().equals("Y")) out.print("checked"); %>>
              Yes
              <input type="radio" name="E01APCFRN" value="N"  <%if (prd.getE01APCFRN().equals("N")) out.print("checked"); %>>
              No</td>
          </tr>
          <tr id="trclear">
            <td width="31%">
              <div align="right">Normal Interest Calc :</div>
            </td>
            <td width="25%">
              <input type="text"  name="E01APCMCI" size="3" maxlength="1" value="<%= prd.getE01APCMCI() %>" >
              <a href="javascript:GetCode('E01APCMCI','STATIC_ln_prov.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
            </td>
            <td width="26%">
              <div align="right">Collaterals :</div>
            </td>
            <td width="18%">
              <input type="radio" name="E01APCAMO" value="Y"  <%if (prd.getE01APCAMO().equals("Y")) out.print("checked"); %>>
              Yes
              <input type="radio" name="E01APCAMO" value="N"  <%if (prd.getE01APCAMO().equals("N")) out.print("checked"); %>>
              No</td>
          </tr>
          <tr id="trdark">
            <td width="31%">
              <div align="right">Past Due Interest Calc :</div>
            </td>
            <td width="25%">
              <input type="text"  name="E01APCMCP" size="3" maxlength="1" value="<%= prd.getE01APCMCP() %>" >
              <a href="javascript:GetCode('E01APCMCP','STATIC_ln_mor.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a></td>
            <td width="26%">
              <div align="right">Revision Rate Cycle :</div>
            </td>
            <td width="18%"> <a href="javascript:GetCode('E01APCSF3','STATIC_ln_ref.jsp')">
              </a>
              <input type="text" name="E01APCRRD" size="3" maxlength="3" value="<%= prd.getE01APCRRD() %>">
            </td>
          </tr>
          <tr id="trclear">
            <td width="31%">
              <div align="right">Interest Payment Cycle :</div>
            </td>
            <td width="25%">
              <input type="text"  name="E01APCIPD" size="3" maxlength="3" value="<%= prd.getE01APCIPD() %>" >
              <a href="javascript:GetCode('E01APCIPD','STATIC_ln_pay_int.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  >
            </td>
            <td width="26%">
              <div align="right">Floating Rate Table :</div>
            </td>
            <td width="18%">
              <input type="text" name="E01APCFRT" size="3" maxlength="2" value="<%= prd.getE01APCFRT() %>">
              <a href="javascript:GetFloating('E01APCFRT')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a>
            </td>
          </tr>
          <tr id="trdark">
            <td width="31%">
              <div align="right">Principal Payment Cycle :</div>
            </td>
            <td width="25%">
              <input type="text"  name="E01APCPPD" size="3" maxlength="3" value="<%= prd.getE01APCPPD() %>" >
              <a href="javascript:GetCode('E01APCPPD','STATIC_ln_pay_int.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  >
            </td>
            <td width="26%">
              <div align="right">Floating Rate Type :</div>
            </td>
            <td width="18%">
              <select name="E01APCFTY">
                <option value="FP" <%if (prd.getE01APCFTY().equals("FP")) { out.print("selected"); }%>>Primary
                Float</option>
                <option value="FS" <%if (prd.getE01APCFTY().equals("FS")) { out.print("selected"); }%>>Secondary
                Float</option>
              </select>
            </td>
          </tr>
          <tr id="trclear">
            <td width="31%">
              <div align="right">Commission Table :</div>
            </td>
            <td width="25%">
              <input type="text" name="E01APCTLN" size="3" maxlength="2" value="<%= prd.getE01APCTLN()%>">
              <a href="javascript:GetLoanTable('E01APCTLN',document.forms[0].E01APCTYP.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a></td>
            <td width="26%">
              <div align="right">Participation Loan :</div>
            </td>
            <td width="18%">
              <input type="radio" name="E01APCFL2" value="Y"  <%if (prd.getE01APCFL2().equals("Y")) out.print("checked"); %>>
              Yes
              <input type="radio" name="E01APCFL2" value="N"  <%if (prd.getE01APCFL2().equals("N")) out.print("checked"); %>>
              No </td>
          </tr>
          <tr id="trdark">
            <td width="31%">
              <div align="right">Discount Type :</div>
            </td>
            <td width="25%">
              <input type="text"  name="E01APCFL3" size="3" maxlength="1" value="<%= prd.getE01APCFL3() %>" >
              <a href="javascript:GetCode('E01APCFL3','STATIC_ln_discount_type.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a></td>
            <td width="26%">
              <div align="right">Offering Required :</div>
            </td>
            <td width="18%">
              <input type="radio" name="E01APCOFR" value="Y"  <%if (prd.getE01APCOFR().equals("Y")) out.print("checked"); %>>
              Yes
              <input type="radio" name="E01APCOFR" value="N"  <%if (prd.getE01APCOFR().equals("N")) out.print("checked"); %>>
              No
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  >
             </td>
          </tr>
          <tr id="trclear">
            <td width="31%">
              <div align="right">Minimum Disbursement :</div>
            </td>
            <td width="25%">
              <input type="text" name="E01APCAM1" size="15" maxlength="13" value="<%= prd.getE01APCAM1() %>">
            </td>
            <td width="26%">
              <div align="right">Allow Check Process :</div>
            </td>
            <td width="18%">
              <input type="radio" name="E01APCCHR" value="Y"  <%if (prd.getE01APCCHR().equals("Y")) out.print("checked"); %>>
              Yes
              <input type="radio" name="E01APCCHR" value="N"  <%if (prd.getE01APCCHR().equals("N")) out.print("checked"); %>>
              No </td>
          </tr>
          <tr id="trdark">
            <td width="31%">
              <div align="right">Payment Percentage :</div>
            </td>
            <td width="25%">
              <input type="text" name="E01APCPWH" size="5" maxlength="4" value="<%= prd.getE01APCPWH() %>">
            </td>
            <td width="26%">
              <div align="right">Minimum Payment Amount :</div>
            </td>
            <td width="18%">
              <input type="text" name="E01APCAM2" size="15" maxlength="13" value="<%= prd.getE01APCAM2() %>">
            </td>
          </tr>
          <tr id="trclear">
            <td width="31%">
              <div align="right">CRA Loan Type :</div>
            </td>
            <td width="25%" >
              <select name="E01APCNWH">
              	<option value="" <%if (prd.getE01APCNWH().equals("")) { out.print("selected"); }%>></option>
                <option value="1" <%if (prd.getE01APCNWH().equals("1")) { out.print("selected"); }%>>Small Business Loan</option>
				<option value="2" <%if (prd.getE01APCNWH().equals("2")) { out.print("selected"); }%>>Small Farm Loan</option>
				<option value="3" <%if (prd.getE01APCNWH().equals("3")) { out.print("selected"); }%>>Other Lines/Loans for Purposes of Small Business</option>
				<option value="4" <%if (prd.getE01APCNWH().equals("4")) { out.print("selected"); }%>>Home Equity</option>
				<option value="5" <%if (prd.getE01APCNWH().equals("5")) { out.print("selected"); }%>>Motor Vehicle</option>
				<option value="6" <%if (prd.getE01APCNWH().equals("6")) { out.print("selected"); }%>>Credit Card</option>
				<option value="7" <%if (prd.getE01APCNWH().equals("7")) { out.print("selected"); }%>>Other Secured Consumer Loans</option>
				<option value="8" <%if (prd.getE01APCNWH().equals("8")) { out.print("selected"); }%>>Other Unsecured Consumer Loans</option>
				<option value="9" <%if (prd.getE01APCNWH().equals("9")) { out.print("selected"); }%>>Other Miscellaneous Consumer Loans</option>
				<option value="10" <%if (prd.getE01APCNWH().equals("10")) { out.print("selected"); }%>>Community Development</option>
				<option value="11" <%if (prd.getE01APCNWH().equals("11")) { out.print("selected"); }%>>Consortium/Third Party</option>
              </select>

            </td>
            <td width="26%">
              <div align="right">IRS Reporting :</div>
            </td>
            <td width="18%">
              <select name="E01APCAIW">
                <option value="1" <%if (prd.getE01APCAIW().equals("1")) { out.print("selected"); }%>>IRS Form 1098</option>
				<option value="2" <%if (prd.getE01APCAIW().equals("2")) { out.print("selected"); }%>>Notice to Customer Only</option>
				<option value="3" <%if (prd.getE01APCAIW().equals("3")) { out.print("selected"); }%>>None</option>
              </select>
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
              <select name="E01APAMPF">
                <option value="M" <%if (prd.getE01APAMPF().equals("M")) { out.print("selected"); }%>>Monthly</option>
                <option value="Q" <%if (prd.getE01APAMPF().equals("Q")) { out.print("selected"); }%>>Quarterly</option>
                <option value="S" <%if (prd.getE01APAMPF().equals("S")) { out.print("selected"); }%>>Semiannually</option>
                <option value="Y" <%if (prd.getE01APAMPF().equals("Y")) { out.print("selected"); }%>>Annually</option>
                <option value=""  <%if (prd.getE01APAMPF().equals(""))  { out.print("selected"); }%>>None</option>
              </select>
            </td>
          </tr>
          <tr id="trdark">
            <td width="70%">
              <div align="right">First Time to Override Minimum Payment (Months) : </div>
            </td>
            <td width="30%">
              <input type="text"  name="E01APAEMP" size="4" maxlength="3" value="<%= prd.getE01APAEMP() %>" onKeypress="enterInteger()">
            </td>
          </tr>
          <tr id="trclear">
            <td width="70%">
              <div align="right">Minimum Payment Override Cycle (Months) : </div>
            </td>
            <td width="30%">
              <input type="text"  name="E01APAEMF" size="4" maxlength="3" value="<%= prd.getE01APAEMF() %>" onKeypress="enterInteger()">
            </td>
          </tr>
          <tr id="trdark">
            <td width="20%">
              <div align="right">Minimum Payment Change Cap (%) : </div>
            </td>
            <td width="80%">
              <input type="text"  name="E01APAMPR" size="17" maxlength="16" value="<%= prd.getE01APAMPR() %>">
            </td>
          </tr>
          <tr id="trclear">
            <td width="70%">
              <div align="right">Minimun Payment Factor (%) : </div>
            </td>
            <td width="30%">
				<input type="text"  name="E01APAMFA" size="17" maxlength="16" value="<%= prd.getE01APAMFA() %>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Access Types</h4>
  <table class="tableinfo">
    <tr >
      <td >
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td width="20%">
              <div align="right">Audio : </div>
            </td>
            <td width="80%">
              <input type="text"  name="E01APEAUD" size="82" maxlength="80" value="<%= prd.getE01APEAUD() %>">
            </td>
          </tr>
          <tr id="trclear">
            <td width="20%">
              <div align="right">Video : </div>
            </td>
            <td width="80%">
              <input type="text"  name="E01APEVID" size="82" maxlength="80" value="<%= prd.getE01APEVID() %>">
            </td>
          </tr>
          <tr id="trdark">
            <td width="20%">
              <div align="right">HTML : </div>
            </td>
            <td width="80%">
              <input type="text"  name="E01APEHTM" size="82" maxlength="80" value="<%= prd.getE01APEHTM() %>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
    <p>
  <div align="center">
    <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>
 </form>
</body>
</html>
