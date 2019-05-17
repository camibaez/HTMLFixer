<html>
<head>
<title>Special Codes</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</head>

<jsp:useBean id= "clCodes" class= "datapro.eibs.beans.ESD000002Message" scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage" scope="session"/>

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos" scope="session"/>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   builtNewMenu(cl_m_opt);

</SCRIPT>

<body nowrap bgcolor="#FFFFFF">
<%
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
    out.println("<SCRIPT> initMenu();  </SCRIPT>");

%>
<h3 align="center">Special Codes <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cl_codes.jsp,ELN0000" width="35" ></h3>
<hr size="4">
 <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.credit.JSELN0000" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="22">
  </p>
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="16%" >
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="20%" >
              <div align="left">
                <input type="text" name="E02CUN2" size="9" maxlength="9" readonly value="<%= userPO.getHeader2().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" >
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" >
              <div align="left">
                <input type="text" name="E02NA12" size="45" maxlength="45" readonly value="<%= userPO.getHeader3().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%">
              <div align="right"><b>Line :</b></div>
            </td>
            <td nowrap width="20%">
              <div align="left">
                <input type="text" name="E02ACC" size="12" maxlength="12" value="<%= userPO.getCreditLineNum().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%">
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="16%">
              <div align="left"><b>
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%">
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%">
              <div align="left"><b>
                <input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getHeader1().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Special Codes </h4>
  <table class="tableinfo">
    <tr >
      <td nowrap >
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="35%">
              <div align="right">Officer :</div>
            </td>
            <td nowrap width="65%">
              <input type="text" name="E02OFC" size="5" maxlength="4" value="<%= clCodes.getE02OFC().trim()%>">
              <input type="text" name="D02OFC" size="40" maxlength="35" value="<%= clCodes.getD02OFC().trim()%>" readonly>
              <a href="javascript:GetCodeDescCNOFC('E02OFC','D02OFC','15')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="35%" >
              <div align="right">Secondary Officer :</div>
            </td>
            <td nowrap width="65%">
              <input type="text" name="E02OF2" size="5" maxlength="4" value="<%= clCodes.getE02OF2().trim()%>">
              <input type="text" name="D02OF2" size="40" maxlength="35" value="<%= clCodes.getD02OF2().trim()%>" readonly>
              <a href="javascript:GetCodeDescCNOFC('E02OF2','D02OF2','15')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="35%">
              <div align="right">Industry Code :</div>
            </td>
            <td nowrap width="65%">
              <input type="text" name="E02INC" size="5" maxlength="4" value="<%= clCodes.getE02INC().trim()%>">
              <input type="text" name="D02INC" size="40" maxlength="35" value="<%= clCodes.getD02INC().trim()%>" readonly>
              <a href="javascript:GetCodeDescCNOFC('E02INC','D02INC','09')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="35%">
              <div align="right">Risk Code :</div>
            </td>
            <td nowrap width="65%">
              <input type="text" name="E02GRC" size="5" maxlength="4" value="<%= clCodes.getE02GRC().trim()%>" readonly>
              <input type="text" name="D02GRC" size="40" maxlength="35" value="<%= clCodes.getD02GRC().trim()%>" readonly>
              <a href="javascript:GetCodeDescCNOFC('E02GRC','D02GRC','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="35%">
              <div align="right">Geographical Residence Code :</div>
            </td>
            <td nowrap width="65%">
              <input type="text" name="E02GEC" size="5" maxlength="4" value="<%= clCodes.getE02GEC().trim()%>">
              <input type="text" name="D02GEC" size="40" maxlength="35" value="<%= clCodes.getD02GEC().trim()%>" readonly>
              <a href="javascript:GetCodeDescCNOFC('E02GEC','D02GEC','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="35%">
              <div align="right">Line of Business :</div>
            </td>
            <td nowrap width="65%">
              <input type="text" name="E02BUC" size="5" maxlength="4" value="<%= clCodes.getE02BUC().trim()%>">
              <input type="text" name="D02BUC" size="40" maxlength="35" value="<%= clCodes.getD02BUC().trim()%>" readonly>
              <a href="javascript:GetCodeDescCNOFC('E02BUC','D02BUC','12')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="35%">
              <div align="right">User's Code 1 :</div>
            </td>
            <td nowrap width="65%">
              <input type="text" name="E02UC1" size="5" maxlength="4" value="<%= clCodes.getE02UC1().trim()%>">
              <input type="text" name="D02UC1" size="40" maxlength="35" value="<%= clCodes.getD02UC1().trim()%>" readonly>
              <a href="javascript:GetCodeDescCNOFC('E02UC1','D02UC1','2A')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="35%">
              <div align="right">User's Code 2 :</div>
            </td>
            <td nowrap width="65%">
              <input type="text" name="E02UC2" size="5" maxlength="6" value="<%= clCodes.getE02UC2().trim()%>">
              <input type="text" name="D02UC2" size="40" maxlength="35" value="<%= clCodes.getD02UC2().trim()%>" readonly>
              <a href="javascript:GetCodeDescCNOFC('E02UC2','D02UC2','2B')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="35%">
              <div align="right">User's Code 3 :</div>
            </td>
            <td nowrap width="65%">
              <input type="text" name="E02UC3" size="5" maxlength="4" value="<%= clCodes.getE02UC3().trim()%>">
              <input type="text" name="D02UC3" size="40" maxlength="35" value="<%= clCodes.getD02UC3().trim()%>" readonly>
              <a href="javascript:GetCodeDescCNOFC('E02UC3','D02UC3','2C')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<p align="center">
    <input id="EIBSBTN" type=submit name="Submit" value="Submit">
</p>
</form>
</body>
</html>

