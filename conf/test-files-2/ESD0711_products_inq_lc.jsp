<html>
<head>
<title>Letter of Credit Product Inquiry</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<jsp:useBean id="lcProdInq" class="datapro.eibs.beans.ESD071104Message"  scope="session" />
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

<h3 align="center">Letter of Credit Product Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="products_inq_lc.jsp, ESD0711"></h3>
<hr size="4">

<form>


  <h4>Product Classification</h4>

  <table class="tableinfo">
    <tr >
      <td >
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td width="30%">
              <div align="right">Product Type: </div>
            </td>
            <td width="70%">
              <input type="text" readonly name="E04APCTYP" size="6" maxlength="4" value="<%= lcProdInq.getE04APCTYP().trim()%>">
              <input type="text" readonly name="E04TYPDES" size="37" maxlength="35" value="<%= lcProdInq.getE04TYPDES().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td width="30%">
              <div align="right">Product Code: </div>
            </td>
            <td width="70%">
              <input type="text" readonly name="E04APCCDE" size="6" maxlength="4" value="<%= lcProdInq.getE04APCCDE().trim()%>">
              <input type="text" readonly name="E04DESCRI" size="65" maxlength="63" value="<%= lcProdInq.getE04DESCRI().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td width="30%">
              <div align="right">Alias: </div>
            </td>
            <td width="70%">
              <input type="text" readonly name="E04MERCAD" size="17" maxlength="15" value="<%= lcProdInq.getE04MERCAD().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <h4>Account Information</h4>

  <table class="tableinfo">
    <tr >
      <td >
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td width="50%">
              <div align="right">Bank: </div>
            </td>
            <td width="50%">
              <input type="text" readonly name="E04APCBNK" size="4" maxlength="2" value="<%= lcProdInq.getE04APCBNK().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td width="50%">
              <div align="right">Currency: </div>
            </td>
            <td width="50%">
              <input type="text" readonly name="E04APCCCY" size="5" maxlength="3" value="<%= lcProdInq.getE04APCCCY().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td width="50%">
              <div align="right">Account: </div>
            </td>
            <td width="50%">
              <input type="text" readonly name="E04APCGLN" size="18" maxlength="12" value="<%= lcProdInq.getE04APCGLN().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td width="50%">
              <div align="right">Account Description: </div>
            </td>
            <td width="50%">
              <input type="text" readonly name="E04GLMDSC" size="37" maxlength="35" value="<%= lcProdInq.getE04GLMDSC().trim()%>">
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
          <tr id="trdark">
            <td width="45%">
              <div align="right">Tariff Number: </div>
            </td>
            <td width="55%">
              <input type="text" readonly name="E04APCTLN" size="3" maxlength="2" value="<%= lcProdInq.getE04APCTLN().trim()%>">
              <input type="text" readonly name="E04TLNDSC" size="30" maxlength="25" value="<%= lcProdInq.getE04TLNDSC().trim()%>">
              <a href="javascript:showLCServCharge('<%= lcProdInq.getE04APCBNK().trim()%>','<%= lcProdInq.getE04APCTYP().trim()%>','<%= lcProdInq.getE04APCTLN().trim()%>');"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"  ></a>
            </td>
          </tr>
          <tr id="trclear">
            <td width="45%">
              <div align="right">Letter of Credit Type: </div>
            </td>
            <td width="55%">
              <input type="text" readonly name="E04APCAMO" size="3" maxlength="2" value="<%= lcProdInq.getE04APCAMO().trim()%>">
              <input type="text" readonly name="E04APCAMO" size="10" maxlength="1"
			   value="<% if (lcProdInq.getE04APCAMO().equals("I")) out.print("Export");
			    		else if (lcProdInq.getE04APCAMO().equals("O")) out.print("Import");
						else if (lcProdInq.getE04APCAMO().equals("S")) out.print("Stand By");
						%>">
            </td>
          </tr>
          <tr id="trdark">
            <td width="45%">
              <div align="right">Confirmed :</div>
            </td>
            <td width="55%">
              <input type="text" readonly name="E04APCICT" size="3" maxlength="1"
			   value="<% if (lcProdInq.getE04APCICT().equals("Y")) out.print("Yes");
			    		else if (lcProdInq.getE04APCICT().equals("N")) out.print("No");
						%>">
            </td>
          </tr>
          <tr id="trclear">
            <td width="45%">
              <div align="right">Charges for Account of:</div>
            </td>
            <td width="55%">
              <input type="text" readonly name="E04APCFRN122" size="3" maxlength="2" value="<%= lcProdInq.getE04APCITP().trim()%>">
              <input type="text" readonly name="E04APCITP" size="15" maxlength="1"
			   value="<% if (lcProdInq.getE04APCITP().equals("B")) out.print("Beneficiarie");
			    		else if (lcProdInq.getE04APCITP().equals("A")) out.print("Aplicant");
						%>">
            </td>
          </tr>
          <tr id="trdark">
            <td width="45%">
              <div align="right">Tenor :</div>
            </td>
            <td width="55%">
              <input type="text" readonly name="E04APCFRN12" size="3" maxlength="2" value="<%= lcProdInq.getE04APCCDT().trim()%>">
              <input type="text" readonly name="E04APCCDT" size="15" maxlength="1"
			   value="<% if (lcProdInq.getE04APCCDT().equals("S")) out.print("A la vista");
			    		else if (lcProdInq.getE04APCCDT().equals("T")) out.print("Term");
						else if (lcProdInq.getE04APCCDT().equals("M")) out.print("Mix");
						else if (lcProdInq.getE04APCCDT().equals("D")) out.print("Deferred");
						%>">
            </td>
          </tr>
          <tr id="trclear">
            <td width="45%">
              <div align="right">Partial Shipment:</div>
            </td>
            <td width="55%">
              <input type="text" readonly name="E04APCMCI" size="3" maxlength="1"
			   value="<% if (lcProdInq.getE04APCMCI().equals("Y")) out.print("Yes");
			    		else if (lcProdInq.getE04APCMCI().equals("N")) out.print("No");
						%>">
            </td>
          </tr>
          <tr id="trdark">
            <td width="45%">
              <div align="right">Transshipment:</div>
            </td>
            <td width="55%">
              <input type="text" readonly name="E04APCMCP" size="3" maxlength="1"
			   value="<% if (lcProdInq.getE04APCMCP().equals("Y")) out.print("Yes");
			    		else if (lcProdInq.getE04APCMCP().equals("N")) out.print("No");
						%>">
            </td>
          </tr>
          <tr id="trclear">
            <td width="45%">
              <div align="right">Interest Accrual:</div>
            </td>
            <td width="55%">
              <input type="text" readonly name="E04APCFRN1" size="3" maxlength="2" value="<%= lcProdInq.getE04APCFRN().trim()%>">
              <input type="text" readonly name="E04APCFRN" size="35" maxlength="1"
			   value="<% if (lcProdInq.getE04APCFRN().equals("1")) out.print("Current Capital Calculation");
			    		else if (lcProdInq.getE04APCFRN().equals("2")) out.print("Original Capital Calculation");
						else if (lcProdInq.getE04APCFRN().equals("3")) out.print("Current Capital minus Matured Capital Calculation");
						else if (lcProdInq.getE04APCFRN().equals("N")) out.print("No Interest Calculation");
						else out.print("");%>">
            </td>
          </tr>
          <tr id="trdark">
            <td width="45%">
              <div align="right">Interest Type:</div>
            </td>
            <td width="55%">
              <input type="text" readonly name="E04APCFRN13" size="3" maxlength="2" value="<%= lcProdInq.getE04APCRES().trim()%>">
              <input type="text" readonly name="E04APCRES" size="35" maxlength="1"
			   value="<% if (lcProdInq.getE04APCRES().equals("1")) out.print("Current Capital Calculation");
			    		else if (lcProdInq.getE04APCRES().equals("2")) out.print("Original Capital Calculation");
						else if (lcProdInq.getE04APCRES().equals("3")) out.print("Current Capital minus Matured Capital Calculation");
						else if (lcProdInq.getE04APCRES().equals("N")) out.print("No Interest Calculation");
						else out.print("");%>">
            </td>
          </tr>
          <tr id="trclear">
            <td width="45%">
              <div align="right">Basic Period:</div>
            </td>
            <td width="55%">
              <input type="text" readonly name="E04APCROY" size="4" maxlength="3" value="<%= lcProdInq.getE04APCROY().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td width="45%">
              <div align="right">Documents Table: </div>
            </td>
            <td width="55%">
              <input type="text" readonly name="E04APCFTF" size="3" maxlength="2" value="<%= lcProdInq.getE04APCFTF().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Access Path</h4>
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF">
      <td >
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td width="50%">
              <div align="right">Audio : </div>
            </td>
            <td width="50%">
              <input type="text" readonly name="E04APEAUD" size="82" maxlength="80" value="<%= lcProdInq.getE04APEAUD().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td width="50%">
              <div align="right">Video : </div>
            </td>
            <td width="50%">
              <input type="text" readonly name="E04APEVID" size="82" maxlength="80" value="<%= lcProdInq.getE04APEVID().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td width="50%">
              <div align="right">HTML : </div>
            </td>
            <td width="50%">
              <input type="text" readonly name="E04APEHTM" size="82" maxlength="80" value="<%= lcProdInq.getE04APEHTM().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>


  <p align="center">
  <input id="EIBSBTN" type=button name="Submit" value="Close" onclick="top.close()">
  </p>

</form>
</body>
</html>
