<html>
<head>
<title>Retail Accounts Product Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<jsp:useBean id="prd" class="datapro.eibs.beans.ESD070001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />


<body>
<P><BR>
</P>
<%
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     error.setERRNUM("0");
     out.println("</SCRIPT>");
     }
%>

<h3 align="center">Retail Accounts Product Maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="products_dda.jsp, ESD0700"></h3>
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
            <td nowrap width="6%" align="right">Product: </td>
            <td nowrap width="14%" align="left">
              <input type="text"  name="E01APCCDE" size="6" maxlength="4" value="<%= prd.getE01APCCDE()%>" readonly>
            </td>
            <td nowrap width="8%" align="right"> Product Type : </td>
            <td nowrap width="50%"align="left">
              <input type="text"  name="E01APCTYP" size="6" maxlength="4" value="<%= prd.getE01APCTYP()%>" readonly>
              -
              <input type="text"  name="E01DSCTYP" size="30" maxlength="25" value="<%= prd.getE01DSCTYP()%>" readonly>
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
          <tr id="trclear">
            <td >
              <div align="right">Description :</div>
            </td>
            <td colspan="3">
              <input type="text"  name="E01APCDS1" size="55" maxlength="40" value="<%= prd.getE01APCDS1()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td >
              <div align="right">Marketing Name :</div>
            </td>
            <td colspan="3">
              <input type="text"  name="E01APCDS2" size="30" maxlength="15" value="<%= prd.getE01APCDS2()%>">
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
              <div align="right"> General Ledger :</div>
            </td>
            <td >
              <input type="text"  name="E01APCGLN" size="16" maxlength="12" value="<%= prd.getE01APCGLN().trim()%>">
              <a href="javascript:GetLedger('E01APCGLN',document.forms[0].E01APCBNK.value,document.forms[0].E01APCCCY.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
            <td >
              <div align="right">Withholding Taxes :</div>
            </td>
            <td >
              <input type="text"  name="E01APCTAX" size="3" maxlength="2" value="<%= prd.getE01APCTAX()%>">
              <a href="javascript:GetCode('E01APCTAX','STATIC_client_help_tax_instructions.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
            </td>
          </tr>
          <tr id="trclear">
            <td >
              <div align="right">Table of Documents :</div>
            </td>
            <td >
              <input type="text"  name="E01APCFTF" size="4" maxlength="2" value="<%= prd.getE01APCFTF().trim()%>">
              <a href="javascript:GetDocInv('E01APCFTF')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
            </td>
            <td >
              <div align="right">Resident/Non Resident :</div>
            </td>
            <td >
              <select name="E01APCRES">
                <option value="1" <%if (prd.getE01APCRES().equals("1")) { out.print("selected"); }%>>Resident</option>
                <option value="2" <%if (prd.getE01APCRES().equals("2")) { out.print("selected"); }%>>Non Resident</option>
                <option value="" <%if (prd.getE01APCRES().equals(""))   { out.print("selected"); }%>>Not Aplicable</option>
              </select>
            </td>
          </tr>
          <tr id="trdark">
            <td >
              <div align="right">Product Family :</div>
            </td>
            <td >
              <input type="text"  name="E01APCUC1" size="4" maxlength="2" value="<%= prd.getE01APCUC1().trim()%>">
            </td>
            <td>
            	<div align="right">Service Charges Structure :</div>
            </td>
            <td width="18%">
                <input type="text" name="E01APCTAR" size="2" maxlength="2" value="<%= prd.getE01APCTAR().trim()%>">
                <a href="javascript:GetRetCod('E01APCTAR',document.forms[0].E01APCTYP.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a>
                <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  >
            </td>
          </tr>
          <tr id="trclear">
          	<td>
          		<div align="right">ATM cards Type :</div>
          	</td>
          	<td width="25%">
              <input type="text"  name="E01APCCC1" size="3" maxlength="1" value="<%= prd.getE01APCCC1().trim()%>">

            </td>
          	<td>
          		<div align="right">Overdraft Allowed :</div>
          	</td>
          	<td width="18%">
              <input type="radio" name="E01APCAMO" value="1"  <%if (prd.getE01APCAMO().equals("1")) out.print("checked"); %>>
              Yes
              <input type="radio" name="E01APCAMO" value="N"  <%if (prd.getE01APCAMO().equals("N")) out.print("checked"); %>>
              No</td>
          </tr>
          <tr id="trdark">
          	<td>
          		<div align="right">Checkbook Control :</div>
          	</td>
          	<td width="25%">
          		<input type="radio" name="E01APCCBC" value="Y"  <%if (prd.getE01APCCBC().equals("Y")) out.print("checked"); %>>
              Yes
              <input type="radio" name="E01APCCBC" value="N"  <%if (prd.getE01APCCBC().equals("N")) out.print("checked"); %>>
              No
            </td>
          	<td>
          		<div align="right">Corporate/Personal :</div>
          	</td>
          	<td width="18%">
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

  <h4>Overdraft Protection Information</h4>

  <table class="tableinfo">
  	<tr>
  	  <td>
  		<table cellspacing="0" cellpadding="2" width="100%" border="0">
  		  <tr id="trdark">
  			<td>
  			  <div align="right"><b>Overdraft Protection :</B></div>
  		    </td>
  		    <td colspan="3">
  			  <input type="radio" name="E01APCREL" value="5"  <%if (prd.getE01APCREL().equals("5")) out.print("checked"); %>>
              <b>Yes</b>
              <input type="radio" name="E01APCREL" value="N"  <%if (prd.getE01APCREL().equals("N")) out.print("checked"); %>>
              <b>No</b>
            </td>
          </tr>
          <tr id="trclear">
          	<td>

              <div align="right">Product Credit Relationship :</div>
          	</td>
          	<td>
              <input type="text"  name="E01APAPRD" size="3" maxlength="1" value="<%= prd.getE01APAPRD() %>" readonly>

            </td>
          	<td>
          		<div align="right">Maximum Loan Amount :</div>
          	</td>
          	<td>
          		<input type="text"  name="E01APAOAM" size="18" maxlength="16" value="<%= prd.getE01APAOAM() %>">
          	</td>
          </tr>
          <tr id="trdark">
          	<td>
          		<div align="right">Amortization Type :</div>
          	</td>
          	<td>

              <input type="text"  name="E01APAPCR" size="3" maxlength="1" value="<%= prd.getE01APAPCR() %>" >
              <a href="javascript:GetCode('E01APAPCR','STATIC_typ_amortization.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
          	</td>
          	<td>
          		<div align="right">Amortization Amount :</div>
          	</td>
          	<td>

              <input type="text"  name="E01APAPMT" size="18" maxlength="16" value="<%= prd.getE01APAPMT() %>">
          	</td>
          </tr>
          <tr id="trclear">
          	<td>
          		<div align="right">Payment Currency :</div>
          	</td>
          	<td>

              <input type="text"  name="E01APARCY" size="3" maxlength="3" value="<%= prd.getE01APARCY() %>" >
              	<a href="javascript:GetCurrency('E01APARCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
          	</td>
          	<td>
          		<div align="right">Payment Type :</div>
          	</td>
          	<td>
          		<select name="E01APAPIF">
                	<option value="F" <%if (prd.getE01APAPIF().equals("F")) { out.print("selected"); }%>>Fix Amount</option>
                	<option value="%" <%if (prd.getE01APAPIF().equals("%")) { out.print("selected"); }%>>Percentage</option>
                </select>
          	</td>
          </tr>
          <tr id="trdark">
          	<td>
          		<div align="right">Include Interest in Payment :</div>
          	</td>
          	<td>
          		<input type="radio" name="E01APAIIP" value="Y"  <%if (prd.getE01APAIIP().equals("Y")) out.print("checked"); %>>
              	Yes
              	<input type="radio" name="E01APAIIP" value="N"  <%if (prd.getE01APAIIP().equals("N")) out.print("checked"); %>>
              	No
          	</td>
          	<td>
              <div align="right">Transfer in Multiples of </div>
            </td>
          	<td>

              <input type="text"  name="E01APAMUL" size="18" maxlength="16" value="<%= prd.getE01APAMUL() %>">
          	</td>
          </tr>
          <tr id="trclear">
          	<td>
          		<div align="right">Minimum Balance in Account :</div>
          	</td>
          	<td>

              <input type="text"  name="E01APAMIN" size="18" maxlength="16" value="<%= prd.getE01APAMIN() %>">
          	</td>
          	<td>
          		<div align="right">Coverage Type :</div>
          	</td>
          	<td>
          		<select name="E01APAGLT">
                	<option value="1" <%if (prd.getE01APAGLT().equals("1")) { out.print("selected"); }%>>Line</option>
                	<option value="2" <%if (prd.getE01APAGLT().equals("2")) { out.print("selected"); }%>>End of Day</option>
                </select>
          	</td>
          </tr>
          <tr id="trclear">
          	<td>
          		<div align="right">Revision Cycle :</div>
          	</td>
          	<td colspan="3">

              <input type="text"  name="E01APARPD" size="4" maxlength="3" value="<%= prd.getE01APARPD()%>">
          		<select name="E01APARFL">

                	<option value="D" <%if (prd.getE01APARFL().equals("D")) { out.print("selected"); }%>>Daily</option>
                	<option value="M" <%if (prd.getE01APARFL().equals("M")) { out.print("selected"); }%>>Monthly</option>
                	<option value="Y" <%if (prd.getE01APARFL().equals("Y"))   { out.print("selected"); }%>>Annually</option>
              	</select>
          	</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p>
  <div align="center">
    <input id="EIBSBTN" type=submit name="Submit" value="Submit" >
  </div>
</form>
</body>
</html>
