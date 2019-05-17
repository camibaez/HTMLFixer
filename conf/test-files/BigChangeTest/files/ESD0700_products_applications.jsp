<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Consulta de Productos de Productos y Derivados</title>
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

<h3 align="center">Products and Derivatives<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="products_inq_ln.jsp, ESD0711"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0700" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1">
  <INPUT TYPE=HIDDEN NAME="E01APCACD" VALUE="<%= prd.getE01APCACD()%>">
  <table class="tableinfo">
    <tr >
      <td>
        <table cellspacing="0" cellpadding="2" width="100%"  class="tbhead"  align="center">
          <tr>
            <td nowrap width="10%" align="right">Bank : </td>
            <td nowrap width="12%" align="left">
              <input type="text"  name="E01APCBNK" size="3" maxlength="2" value="<%= prd.getE01APCBNK()%>" readonly>
            </td>
            <td nowrap width="6%" align="right">Product : </td>
            <td nowrap width="14%" align="left">
              <input type="text"  name="E01APCCDE" size="6" maxlength="4" value="<%= prd.getE01APCCDE()%>" readonly>
            </td>
            <td nowrap width="8%" align="right">Product Type: </td>
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
  <h4>Informaci&oacute;n General</h4>

  <table class="tableinfo">
    <tr>
      <td>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td >
              <div align="right">Description :</div>
            </td>
            <td >
              <input type="text"  name="E01APCDS1" size="40" maxlength="40" value="<%= prd.getE01APCDS1()%>">
            </td>
            <td >
              <div align="right">Marketing Name:</div>
            </td>
            <td >
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
              <div align="right">Offered via :</div>
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
              <div align="right">GL Account:</div>
            </td>
            <td >
              <input type="text"  name="E01APCGLN" size="18" maxlength="16" value="<%= prd.getE01APCGLN().trim()%>">
              <a href="javascript:GetLedger('E01APCGLN',document.forms[0].E01APCBNK.value,document.forms[0].E01APCCCY.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
            <td >
              <div align="right">Withholding Taxes:</div>
            </td>
            <td >
              <input type="text"  name="E01APCTAX" size="3" maxlength="2" value="<%= prd.getE01APCTAX()%>">
              <a href="javascript:GetCode('E01APCTAX','STATIC_ln_prod_tax_ret.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
            </td>
          </tr>
          <tr id="trclear">
            <td >
              	<div align="right">Documents Tables:</div>
            </td>
            <td >
              	<input type="text"  name="E01APCFTF" size="4" maxlength="2" value="<%= prd.getE01APCFTF().trim()%>">
            	<a href="javascript:GetDocInv('E01APCFTF')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
            </td>
            <td >
              <div align="right">Family Product :</div>
            </td>
            <td >
              <input type="text"  name="E01APCUC1" size="4" maxlength="2" value="<%= prd.getE01APCUC1().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td >
              	<div align="right">Corporate/Personal :</div>
            </td>
            <td >
              <select name="E01APCFL4">
                <option value="1" <%if (prd.getE01APCFL4().equals("1")) { out.print("selected"); }%>>Corporate</option>
                <option value="2" <%if (prd.getE01APCFL4().equals("2")) { out.print("selected"); }%>>Personal</option>
                <option value="" <%if (prd.getE01APCFL4().equals(""))   { out.print("selected"); }%>>Not Aplicable</option>
              </select>
            </td>
            <td >
              <div align="right"></div>
            </td>
            <td >

            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
    <p>
  <div align="center">
    <input id="EIBSBTN" type=button name="Submit" OnClick="submit()" value="Enviar">
  </div>
</form>
</body>
</html>
