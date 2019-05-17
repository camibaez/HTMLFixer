<html>
<head>
<title></title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "clCodes" class= "datapro.eibs.beans.ESD000002Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   builtNewMenu(cl_i_opt);

</SCRIPT>
</head>
<body  nowrap bgcolor="#FFFFFF">


 <% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<SCRIPT> initMenu();  </SCRIPT>

<h3 align="center">Special Codes<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cl_inq_codes.jsp,ELN0060"></h3>
<hr size="4">
 <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130" >
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="28">
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
                <input type="text" name="CUSCUN" size="9" maxlength="9" value="<%= userPO.getCusNum().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="CUSNA1" size="45" readonly maxlength="45" value="<%= userPO.getCusName().trim()%>" >
              </div>
            </td>
            <td nowrap > 
              <div align="right"><b>Line Type : </b></div>
            </td>
            <td nowrap ><b> 
              <input type="text" name="PROCOD" size="4" readonly maxlength="4" value="<%= userPO.getCreditLineType().trim()%>">
              </b></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="14%"> 
              <div align="right"><b>Line Number :</b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> 
                <input type="text" name="ACCNUM" size="12" readonly maxlength="12" value="<%= userPO.getCreditLineNum().trim()%>" >
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
                <input type="text" name="PROCCY" size="4" readonly maxlength="4" value="<%= userPO.getCurrency().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Classification Codes</h4> 
  <table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="35%"> 
              <div align="right">Officer :</div>
            </td>
            <td nowrap width="65%"> 
              <input type="text" readonly  name="E02OFC" size="5" maxlength="4" value="<%= clCodes.getE02OFC().trim()%>">
              <input type="text" readonly  name="D02OFC" size="40" maxlength="35" value="<%= clCodes.getD02OFC().trim()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="35%" > 
              <div align="right">Secondary Officer :</div>
            </td>
            <td nowrap width="65%"> 
              <input type="text" readonly  name="E02OF2" size="5" maxlength="4" value="<%= clCodes.getE02OF2().trim()%>">
              <input type="text" readonly  name="D02OF2" size="40" maxlength="35" value="<%= clCodes.getD02OF2().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="35%"> 
              <div align="right">Industry Code :</div>
            </td>
            <td nowrap width="65%"> 
              <input type="text" readonly  name="E02INC" size="5" maxlength="4" value="<%= clCodes.getE02INC().trim()%>">
              <input type="text" readonly  name="D02INC" size="40" maxlength="35" value="<%= clCodes.getD02INC().trim()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="35%"> 
              <div align="right">Risk Code :</div>
            </td>
            <td nowrap width="65%"> 
              <input type="text" readonly  name="E02GRC" size="5" maxlength="4" value="<%= clCodes.getE02GRC().trim()%>" >
              <input type="text" readonly  name="D02GRC" size="40" maxlength="35" value="<%= clCodes.getD02GRC().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="35%"> 
              <div align="right">Geographical Residence Code :</div>
            </td>
            <td nowrap width="65%"> 
              <input type="text" readonly  name="E02GEC" size="5" maxlength="4" value="<%= clCodes.getE02GEC().trim()%>">
              <input type="text" readonly  name="D02GEC" size="40" maxlength="35" value="<%= clCodes.getD02GEC().trim()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="35%"> 
              <div align="right">Line of Business :</div>
            </td>
            <td nowrap width="65%"> 
              <input type="text" readonly  name="E02BUC" size="5" maxlength="4" value="<%= clCodes.getE02BUC().trim()%>">
              <input type="text" readonly  name="D02BUC" size="40" maxlength="35" value="<%= clCodes.getD02BUC().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="35%"> 
              <div align="right">User's Code 1 :</div>
            </td>
            <td nowrap width="65%"> 
              <input type="text" readonly  name="E02UC1" size="5" maxlength="4" value="<%= clCodes.getE02UC1().trim()%>">
              <input type="text" readonly  name="D02UC1" size="40" maxlength="35" value="<%= clCodes.getD02UC1().trim()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="35%"> 
              <div align="right">User's Code 2 :</div>
            </td>
            <td nowrap width="65%"> 
              <input type="text" readonly  name="E02UC2" size="5" maxlength="6" value="<%= clCodes.getE02UC2().trim()%>">
              <input type="text" readonly  name="D02UC2" size="40" maxlength="35" value="<%= clCodes.getD02UC2().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="35%"> 
              <div align="right">User's Code 3 :</div>
            </td>
            <td nowrap width="65%"> 
              <input type="text" readonly  name="E02UC3" size="5" maxlength="4" value="<%= clCodes.getE02UC3().trim()%>">
              <input type="text" readonly  name="D02UC3" size="40" maxlength="35" value="<%= clCodes.getD02UC3().trim()%>" >
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

