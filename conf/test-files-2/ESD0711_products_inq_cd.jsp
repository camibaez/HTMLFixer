<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Certificates of Deposit Products Inquiry</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id="cdProdInq" class="datapro.eibs.beans.ESD071111Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

</head>

<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }
%>

<h3 align="center">Certificates of Deposit Product Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="products_inq_cd.jsp, ESD0711"></h3>
<hr size="4">
<form>
  
  <p>
  </p>
  
  <h4>Product Classification</h4>
  
  <table class="tableinfo">
    <tr > 
      <td > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td width="50%"> 
              <div align="right">Product Type: </div>
            </td>
            <td width="50%">
              <input type="text" readonly name="E11APCTYP" size="6" maxlength="4" value="<%= cdProdInq.getE11APCTYP().trim()%>">
            </td>
          </tr> 
          <tr id="trclear"> 
            <td width="50%"> 
              <div align="right">Product Code: </div>
            </td>
            <td width="50%">
              <input type="text" readonly name="E11APCCDE" size="6" maxlength="4" value="<%= cdProdInq.getE11APCCDE().trim()%>">
            </td>
          </tr> 
          <tr id="trdark"> 
            <td width="50%"> 
              <div align="right">Description: </div>
            </td>
            <td width="50%">
              <input type="text" readonly name="E11DESCRI" size="35" maxlength="63" value="<%= cdProdInq.getE11DESCRI().trim()%>">
            </td>
          </tr> 
          <tr id="trclear"> 
            <td width="50%"> 
              <div align="right">Alias: </div>
            </td>
            <td width="50%">
              <input type="text" readonly name="E11MERCAD" size="17" maxlength="15" value="<%= cdProdInq.getE11MERCAD().trim()%>">
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
              <input type="text" readonly name="E11APCBNK" size="4" maxlength="2" value="<%= cdProdInq.getE11APCBNK().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="50%"> 
              <div align="right">Currency: </div>
            </td>
            <td width="50%"> 
              <input type="text" readonly name="E11APCCCY" size="5" maxlength="3" value="<%= cdProdInq.getE11APCCCY().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="50%"> 
              <div align="right">Account: </div>
            </td>
            <td width="50%"> 
              <input type="text" readonly name="E11APCGLN" size="18" maxlength="16" value="<%= cdProdInq.getE11APCGLN().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="50%"> 
              <div align="right">Account Description: </div>
            </td>
            <td width="50%"> 
              <input type="text" readonly name="E11GLMDSC" size="37" maxlength="35" value="<%= cdProdInq.getE11GLMDSC().trim()%>">
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
            <td width="50%"> 
              <div align="right">Floating Rate Structure and Type: </div>
            </td>
            <td width="50%"> 
              <input type="text" readonly name="E11APCFRT" size="4" maxlength="2" value="<%= cdProdInq.getE11APCFRT().trim()%>">
              <input type="text" readonly name="E11APCFTY" size="4" maxlength="2" value="<%= cdProdInq.getE11APCFTY().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="50%"> 
              <div align="right">Floating Rate Percentage: </div>
            </td>
            <td width="50%"> 
              <input type="text" readonly name="E11VARRTE" size="11" maxlength="9" value="<%= cdProdInq.getE11VARRTE().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="50%"> 
              <div align="right">Floating Rate Revision Cycle: </div>
            </td>
            <td width="50%"> 
              <input type="text" readonly name="E11APCRRD" size="5" maxlength="3" value="<%= cdProdInq.getE11APCRRD().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="50%"> 
              <div align="right">Interest Rates: </div>
            </td>
            <td width="50%"> 
              <input type="text" readonly name="E11APCCDT" size="3" maxlength="1" value="<%= cdProdInq.getE11APCCDT().trim()%>">
              <a href="javascript:showCDRates('<%= cdProdInq.getE11APCCCY().trim()%>','<%= cdProdInq.getE11APCCDT().trim()%>');"><img src="<%=request.getContextPath()%>/images/1b.gif" border="0" width="25" height="25" ></a> 
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="50%"> 
              <div align="right">Basic Period: </div>
            </td>
            <td width="50%"> 
              <input type="text" readonly name="E11APCPPD" size="5" maxlength="3" value="<%= cdProdInq.getE11APCPPD().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="50%"> 
              <div align="right">Minimum Opening Term: </div>
            </td>
            <td width="50%"> 
              <input type="text" readonly name="E11APCROY" size="5" maxlength="3" value="<%= cdProdInq.getE11APCROY().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="50%"> 
              <div align="right">Active Certificate Days: </div>
            </td>
            <td width="50%"> 
              <input type="text" readonly name="E11APCIPD" size="5" maxlength="3" value="<%= cdProdInq.getE11APCIPD().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="50%"> 
              <div align="right">Exclude Non-Resident: </div>
            </td>
            <td width="50%"> 
              <input type="text" readonly name="E11APCRES" size="4" maxlength="2"
			  value="<% if (cdProdInq.getE11APCRES().equals("1")) out.print("Si");
						else if (cdProdInq.getE11APCRES().equals("2")) out.print("No");
						else out.print(""); %>">
             </td>
          </tr>
          <tr id="trdark"> 
            <td width="50%"> 
              <div align="right">Document Table: </div>
            </td>
            <td width="50%"> 
              <input type="text" readonly name="E11APCFTF" size="4" maxlength="2" value="<%= cdProdInq.getE11APCFTF().trim()%>">
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
              <input type="text" readonly name="E11APEAUD" size="82" maxlength="80" value="<%= cdProdInq.getE11APEAUD().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="50%"> 
              <div align="right">Video : </div>
            </td>
            <td width="50%"> 
              <input type="text" readonly name="E11APEVID" size="82" maxlength="80" value="<%= cdProdInq.getE11APEVID().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="50%"> 
              <div align="right">HTML : </div>
            </td>
            <td width="50%"> 
              <input type="text" readonly name="E11APEHTM" size="82" maxlength="80" value="<%= cdProdInq.getE11APEHTM().trim()%>">
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
