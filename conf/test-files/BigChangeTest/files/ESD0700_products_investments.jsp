<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Investments Product Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
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

<h3 align="center">Investments Product Maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="products_investments.jsp, ESD0700"></h3>
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
              <input type="text"  name="E01APCBNK" size="3" maxlength="2" value="<%= prd.getE01APCBNK()%>" readonly>
            </td>
            <td nowrap width="6%" align="right"> Product: </td>
            <td nowrap width="14%" align="left">
              <input type="text"  name="E01APCCDE" size="6" maxlength="4" value="<%= prd.getE01APCCDE()%>" readonly>
            </td>
            <td nowrap width="8%" align="right"> Product Type : </td>
            <td nowrap width="50%"align="left">
              <input type="text"  name="E01APCTYP" size="6" maxlength="4" value="<%= prd.getE01APCTYP()%>" readonly>
              -
              <input type="text"  name="E01DSCTYP" size="25" maxlength="25" value="<%= prd.getE01DSCTYP()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>General Information</h4>

  <table class="tableinfo">
    <tr >
      <td >
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td>
              <div align="right">Description :</div>
            </td>
            <td>
              <input type="text"  name="E01APCDS1" size="40" maxlength="40" value="<%= prd.getE01APCDS1()%>">
            </td>
            <td>
              <div align="right">Marketing Name:</div>
            </td>
            <td>
              <input type="text"  name="E01APCDS2" size="30" maxlength="25" value="<%= prd.getE01APCDS2()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td >
              <div align="right">Currency :</div>
            </td>
            <td >
              <input type="text"  name="E01APCCCY" size="3" maxlength="3" value="<%= prd.getE01APCCCY()%>">
              <a href="javascript:GetCurrency('E01APCCCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
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
              <input type="text"  name="E01APCGLN" size="16" maxlength="12" value="<%= prd.getE01APCGLN().trim()%>">
              <a href="javascript:GetLedger('E01APCGLN',document.forms[0].E01APCBNK.value,document.forms[0].E01APCCCY.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
            <td>
            	<div align="right">Accrual Type :</div>
          	</td>
          	<td width="25%">
               <select name="E01APCICT">
                <option value="" <%if (prd.getE01APCICT().equals("")) { out.print("selected"); }%>></option>
                <option value="1" <%if (prd.getE01APCICT().equals("1")) { out.print("selected"); }%>>Actual/actual (in period)</option>
                <option value="2" <%if (prd.getE01APCICT().equals("2")) { out.print("selected"); }%>>Actual/365</option>
                <option value="3" <%if (prd.getE01APCICT().equals("3")) { out.print("selected"); }%>>Actual/365 (366 in leap year)</option>
                <option value="4" <%if (prd.getE01APCICT().equals("4")) { out.print("selected"); }%>>Actual/360</option>
                <option value="5" <%if (prd.getE01APCICT().equals("5")) { out.print("selected"); }%>>30/360</option>
                <option value="6" <%if (prd.getE01APCICT().equals("6")) { out.print("selected"); }%>>30E/360</option>
                <option value="7" <%if (prd.getE01APCICT().equals("7")) { out.print("selected"); }%>>22/252</option>
              </select>

            </td>
          </tr>
          <tr id="trclear">
            <td >
              <div align="right"> Corporate/Personal :</div>
            </td>
            <td >
               <select name="E01APCFL4">
                <option value="1" <%if (prd.getE01APCFL4().equals("1")) { out.print("selected"); }%>>Corporate</option>
                <option value="2" <%if (prd.getE01APCFL4().equals("2")) { out.print("selected"); }%>>Personal</option>
                <option value="" <%if (prd.getE01APCFL4().equals(""))   { out.print("selected"); }%>>Not Aplicable</option>
              </select>
             </td>
            <td>
            	<div align="right">REPOS Product :</div>
          	</td>
          	<td width="25%">
            <INPUT type="text" name="E01APARCD" size="5" maxlength="4"
					value="<%= prd.getE01APARCD().trim()%>">
			<INPUT type="text" name="D01APARCD" size="20" maxlength="20"
					value="<%= prd.getD01APARCD().trim()%>" readonly>
					<a href="javascript:GetProduct('E01APARCD','D01APARCD','PL','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <h4>Additional Information </h4>

  <table class="tableinfo">
    <tr >
      <td >
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td>
          		<div align="right">Past Due Change in Days :</div>
          	</td>
          	<td>
          	 	<input type="text"  name="E01APCIPD" size="4" maxlength="2" value="<%= prd.getE01APCIPD().trim()%>">
            </td>
            <td>
              <div align="right">Investment Type : </div>
            </td>
            <td>
            	<select name="E01APCINV">
                	<option value="BND" <%if (prd.getE01APCINV().equals("BND")) { out.print("selected"); }%>>Bonds</option>
               	 	<option value="MUT" <%if (prd.getE01APCINV().equals("MUT")) { out.print("selected"); }%>>Mutual Funds</option>
               	 	<option value="EQT" <%if (prd.getE01APCINV().equals("EQT")) { out.print("selected"); }%>>Equity</option>
               	 	<option value="PFS" <%if (prd.getE01APCINV().equals("PFS")) { out.print("selected"); }%>>Preferred Stocks</option>
               	 	<option value="ACD" <%if (prd.getE01APCINV().equals("ACD")) { out.print("selected"); }%>>Commodities</option>
                </select>

            </td>
          </tr>
          <tr id="trclear">
         	 <td>
            	<div align="right">Coupon Period Payments</div>
          	 </td>
            <td>
              <input type="text"  name="E01APCROY" size="4" maxlength="3" value="<%= prd.getE01APCROY()%>" onkeypress="enterInteger()">&nbsp;(Months)
            </td>
            <td>
            	<div align="right">Amortization Type</div>
            </td>
            <td>
            	<select name="E01APCAMO">
                	<option value="S" <%if (prd.getE01APCAMO().equals("S")) { out.print("selected"); }%>>StraightLine</option>
               	 	<option value="L" <%if (prd.getE01APCAMO().equals("L")) { out.print("selected"); }%>>Level Yield</option>
               	 	<option value="N" <%if (prd.getE01APCAMO().equals("N")) { out.print("selected"); }%>>No Amortization</option>
                </select>
            </td>
          </tr>
          <tr id="trdark">
          	<td>
          		<div align="right">Portfolio Type :</div>
          	</td>
          	<td width="25%">

            	<select name="E01APCITP">
                	<option value="1" <%if (prd.getE01APCITP().equals("1")) { out.print("selected"); }%>>Held to Maturity</option>
               	 	<option value="2" <%if (prd.getE01APCITP().equals("2")) { out.print("selected"); }%>>Available For Sale</option>
               	 	<option value="3" <%if (prd.getE01APCITP().equals("3")) { out.print("selected"); }%>>Trading</option>
                </select>

            </td>
            <td>
          		<div align="right">Revaluation Type :</div>
          	</td>
          	<td width="25%">
            	<input type="text"  name="E01APCFRN" size="4" maxlength="2" value="<%= prd.getE01APCFRN().trim()%>">
            	<a href="javascript:GetCode('E01APCFRN','STATIC_pc_prod_typ_rev.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
          </tr>
          <tr id="trclear">
          	<td>
          		<div align="right">Withholding Taxes :</div>
          	</td>
          	<td>
          		<input type="text"  name="E01APCTAX" size="4" maxlength="2" value="<%= prd.getE01APCTAX().trim()%>">
              <a href="javascript:GetCode('E01APCTAX','STATIC_client_help_tax_instructions.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
          	</td>
          	<td>
          		<div align="right">Table of Documents :</div>
          	</td>
          	<td>
          		<input type="text"  name="E01APCFTF" size="4" maxlength="2" value="<%= prd.getE01APCFTF().trim()%>">
          		<a href="javascript:GetDocInv('E01APCFTF')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
          	</td>
          </tr>
          <tr id="trdark">
          	<td>
          		<div align="right">Product Family :</div>
          	</td>
          	<td>
          		<input type="text"  name="E01APCUC1" size="4" maxlength="2" value="<%= prd.getE01APCUC1().trim()%>">
          	</td>
          	<td>
          		<div align="right">Customer Price Margin :</div>
          	</td>
          	<td>
          	<INPUT type="text" name="E01APAMPR" size="17" maxlength="15"
					value="<%=prd.getE01APAMPR()%>">
            %</td>
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
