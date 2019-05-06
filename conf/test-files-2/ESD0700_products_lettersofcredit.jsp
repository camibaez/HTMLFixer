<html>
<head>
<title>Letter of Credit Product Maintenance</title>
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

<h3 align="center">Letter of Credit Product Maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="products_letterofcredit.jsp, ESD0700"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0700" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1">
  <INPUT TYPE=HIDDEN NAME="E01APCACD" VALUE="<%= prd.getE01APCACD()%>">
  <table class="tableinfo">
    <tr >
      <td>
        <table cellspacing="0" cellpadding="2" width="100%"  class="tbhead"  align="center">
          <tr>
            <td nowrap width="10%" align="right"> Bank : </td>
            <td nowrap width="12%" align="left">
              <input type="text"  name="E01APCBNK" size="3" maxlength="2" value="<%= prd.getE01APCBNK()%>" readonly>
            </td>
            <td nowrap width="6%" align="right"> Product : </td>
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
              <div align="right">Marketing Name :</div>
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
              <div align="right"> General Ledger :</div>
            </td>
            <td >
              <input type="text"  name="E01APCGLN" size="16" maxlength="12" value="<%= prd.getE01APCGLN().trim()%>">
              <a href="javascript:GetLedger('E01APCGLN',document.forms[0].E01APCBNK.value,document.forms[0].E01APCCCY.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
            <td>
          		<div align="right">Table of Documents :</div>
          	</td>
          	<td>
          	<input type="text"  name="E01APCFTF" size="4" maxlength="2" value="<%= prd.getE01APCFTF().trim()%>">
            	<a href="javascript:GetDocInv('E01APCFTF')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
          	</td>
          </tr>
          <tr>
          	<td>
          		<div align="right">Commissions Table :</div>
          	</td>
          	<td>
          		<input type="text"  name="E01APCTLN" size="4" maxlength="2" value="<%= prd.getE01APCTLN().trim()%>">
          		<a href="javascript:GetTariffLC('E01APCTLN',document.forms[0].E01APCTYP.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
          	</td>
          	<td>
          		<div align="right">Letter of Credit Type :</div>
          	</td>
            <td>
                <SELECT name="E01APCAMO">
              	    <option value="I" <%if (prd.getE01APCAMO().equals("I")) { out.print("selected"); }%>>Incomig (Export)</option>
              	    <option value="O" <%if (prd.getE01APCAMO().equals("O")) { out.print("selected"); }%>>Outgoing (Import)</option>
                    <option value="R" <%if (prd.getE01APCAMO().equals("R")) { out.print("selected"); }%>>Incomig Standby</option>
              	    <option value="S" <%if (prd.getE01APCAMO().equals("S")) { out.print("selected"); }%>>Outgoing Standby</option>
				</SELECT>
          	</td>
          </tr>
 
        </table>
      </td>
  	</tr>
  </table>
  <h4>Additional Information</h4>

  <table class="tableinfo">
    <tr >
      <td >
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
          	<td>
          		<div align="right">Withholding Taxes :</div>
          	</td>
          	<td>
          		<input type="text"  name="E01APCTAX" size="4" maxlength="2" value="<%= prd.getE01APCTAX().trim()%>">
          		<a href="javascript:GetCode('E01APCTAX','STATIC_client_help_tax_instructions.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
          	</td>
          	<td>
          		<div align="right">Charges for Account of :</div>
          	</td>
          	<td>
          	  <select name="E01APCITP">
                <option value="B" <%if (prd.getE01APCITP().equals("B")) { out.print("selected"); }%>>Beneficiary</option>
                <option value="A" <%if (prd.getE01APCITP().equals("A")) { out.print("selected"); }%>>Aplicant</option>
              </select>	
          	</td>
          </tr>
         
          <tr id="trclear">
          	<td>
          		<div align="right">Confirmed :</div>
          	</td>
          	<td>
          		<input type="radio" name="E01APCICT" value="Y"  <%if (prd.getE01APCICT().equals("Y")) out.print("checked"); %>>
              Yes
              <input type="radio" name="E01APCICT" value="N"  <%if (prd.getE01APCICT().equals("N")) out.print("checked"); %>>
              No
            </td>
          	<td>
          		<div align="right">Tenor :</div>
          	</td>
          	<td >
                <input type="text"  name="E01APCCDT" size="4" maxlength="4" value="<%= prd.getE01APCCDT().trim()%>">
          		<a href="javascript:GetCode('E01APCCDT','STATIC_cc_tenor.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>  
            </td>
          </tr>
          <tr id="trdark">
          	<td>
          		<div align="right">Partial Shipments :</div>
          	</td>
          	<td>
          		<input type="radio" name="E01APCMCI" value="Y"  <%if (prd.getE01APCMCI().equals("Y")) out.print("checked"); %>>
              Yes
                <input type="radio" name="E01APCMCI" value="N"  <%if (prd.getE01APCMCI().equals("N")) out.print("checked"); %>>
              No	
          	</td>
          	<td>
          		<div align="right">Transshipment :</div>
          	</td>
          	<td>
          		<input type="radio" name="E01APCMCP" value="Y"  <%if (prd.getE01APCMCP().equals("Y")) out.print("checked"); %>>
              Yes
                <input type="radio" name="E01APCMCP" value="N"  <%if (prd.getE01APCMCP().equals("N")) out.print("checked"); %>>
              No
            </td>
         
        </table>
  	  </td>
  	</tr>
  </table>
     
  <div align="center"><p><input id="EIBSBTN" type=submit name="Submit" value="Submit"></p></div>

 </form>
</body>
</html>
