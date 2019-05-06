<html>
<head>
<title>Investments Products Inquiry</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<jsp:useBean id="invProdInq" class="datapro.eibs.beans.ESD071113Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     error.setERRNUM("0");
     out.println("</SCRIPT>");
     }
%>

<h3 align="center">Investments Product Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="products_inq_inv.jsp, ESD0711"></h3>
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
              <input type="text" readonly name="E13APCTYP" size="6" maxlength="4" value="<%= invProdInq.getE13APCTYP().trim()%>">
              <input type="text" readonly name="E13TYPDES" size="37" maxlength="35" value="<%= invProdInq.getE13TYPDES().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="30%"> 
              <div align="right">Product Code: </div>
            </td>
            <td width="70%"> 
              <input type="text" readonly name="E13APCCDE" size="6" maxlength="4" value="<%= invProdInq.getE13APCCDE().trim()%>">
              <input type="text" readonly name="E13DESCRI" size="65" maxlength="63" value="<%= invProdInq.getE13DESCRI().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="30%"> 
              <div align="right">Alias: </div>
            </td>
            <td width="70%"> 
              <input type="text" readonly name="E13MERCAD" size="17" maxlength="15" value="<%= invProdInq.getE13MERCAD().trim()%>">
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
              <input type="text" readonly name="E13APCBNK" size="4" maxlength="2" value="<%= invProdInq.getE13APCBNK().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="50%"> 
              <div align="right">Currency: </div>
            </td>
            <td width="50%"> 
              <input type="text" readonly name="E13APCCCY" size="5" maxlength="3" value="<%= invProdInq.getE13APCCCY().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="50%"> 
              <div align="right">Account: </div>
            </td>
            <td width="50%"> 
              <input type="text" readonly name="E13APCGLN" size="18" maxlength="12" value="<%= invProdInq.getE13APCGLN().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="50%"> 
              <div align="right">Account Description: </div>
            </td>
            <td width="50%"> 
              <input type="text" readonly name="E13GLMDSC" size="37" maxlength="35" value="<%= invProdInq.getE13GLMDSC().trim()%>">
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
              <div align="right">Accrual Type: </div>
            </td>
            <td width="55%"> 
              <input type="text" readonly name="E13APCIPD23" size="3" maxlength="3" value="<%= invProdInq.getE13APCICT().trim()%>">
              <input type="text" readonly name="E13APCICT" size="30" maxlength="1"  
			   value="<% if (invProdInq.getE13APCICT().equals("1")) out.print("Current/current[in period]");
			    		else if (invProdInq.getE13APCICT().equals("2")) out.print("Current/365");
						else if (invProdInq.getE13APCICT().equals("3")) out.print("Current/365[366 leap year]");
						else if (invProdInq.getE13APCICT().equals("4")) out.print("Current/360");
						else if (invProdInq.getE13APCICT().equals("5")) out.print("30/360");
						else if (invProdInq.getE13APCICT().equals("6")) out.print("30E/360");
						else if (invProdInq.getE13APCICT().equals("7")) out.print("22/252");%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="45%"> 
              <div align="right">Investment Type: </div>
            </td>
            <td width="55%"> 
              <input type="text" readonly name="E13APCINV" size="5" maxlength="4" value="<%= invProdInq.getE13APCINV().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="45%"> 
              <div align="right">Cupon Payment Period:</div>
            </td>
            <td width="55%"> 
              <input type="text" readonly name="E13APCROY" size="4" maxlength="3" value="<%= invProdInq.getE13APCROY().trim()%>">
              (Per&iacute;odo expresado en meses) </td>
          </tr>
          <tr id="trclear"> 
            <td width="45%"> 
              <div align="right">Amortization Type:</div>
            </td>
            <td width="55%"> 
              <input type="text" readonly name="E13APCIPD2" size="3" maxlength="3" value="<%= invProdInq.getE13APCAMO().trim()%>">
              <input type="text" readonly name="E13APCAMO" size="15" maxlength="1"  
			   value="<% if (invProdInq.getE13APCAMO().equals("S")) out.print("Straight Line");
			    		else if (invProdInq.getE13APCAMO().equals("L")) out.print("Level Yield");%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="45%"> 
              <div align="right">Portfolio Type:</div>
            </td>
            <td width="55%"> 
              <input type="text" readonly name="E13APCIPD22" size="3" maxlength="3" value="<%= invProdInq.getE13APCITP().trim()%>">
              <input type="text" readonly name="E13APCITP" size="35" maxlength="1"  
			   value="<% if (invProdInq.getE13APCITP().equals("1")) out.print("Holding to Mature");
			    		else if (invProdInq.getE13APCITP().equals("2")) out.print("Available to Sale");
						else if (invProdInq.getE13APCITP().equals("3")) out.print("Trading");
						%>">
            </td>
          </tr>
          <tr id="trclear">
            <td width="45%">
              <div align="right">Reevaluation Type:</div>
            </td>
            <td width="55%"> 
              <input type="text" readonly name="E13APCIPD222" size="3" maxlength="3" value="<%= invProdInq.getE13APCFRN().trim()%>">
              <input type="text" readonly name="E13APCFRN" size="35" maxlength="1"  
			   value="<% if (invProdInq.getE13APCFRN().equals("1")) out.print("Re-evaluate Loses and Profits");
			    		else if (invProdInq.getE13APCFRN().equals("2")) out.print("Re-evaluate just Loses");
						else if (invProdInq.getE13APCFRN().equals("N")) out.print("No Re-evaluation");
						%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="45%"> 
              <div align="right">Days to Change to Past Due:</div>
            </td>
            <td width="55%">
              <input type="text" readonly name="E13APCIPD" size="3" maxlength="3" value="<%= invProdInq.getE13APCIPD().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="45%"> 
              <div align="right">Documents Table: </div>
            </td>
            <td width="55%"> 
              <input type="text" readonly name="E13APCFTF" size="3" maxlength="2" value="<%= invProdInq.getE13APCFTF().trim()%>">
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
              <input type="text" readonly name="E13APEAUD" size="82" maxlength="80" value="<%= invProdInq.getE13APEAUD().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="50%"> 
              <div align="right">Video : </div>
            </td>
            <td width="50%"> 
              <input type="text" readonly name="E13APEVID" size="82" maxlength="80" value="<%= invProdInq.getE13APEVID().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="50%"> 
              <div align="right">HTML : </div>
            </td>
            <td width="50%"> 
              <input type="text" readonly name="E13APEHTM" size="82" maxlength="80" value="<%= invProdInq.getE13APEHTM().trim()%>">
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
