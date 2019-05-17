<html>
<head>
<title>Additional Codes</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</head>

<jsp:useBean id = "lnCodes" class= "datapro.eibs.beans.ESD001401Message"  scope="session" />


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>


<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"   scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   builtNewMenu(ln_a_opt);

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
<h3 align="center">Loan Policy Exceptions of <%= userPO.getHeader4().trim()%><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="ln_ap_addcodes.jsp,EDL0140" ></h3> 
<hr size="4">
 <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0150" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="36">
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
              <div align="left"><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" name="E02NA12" size="45" maxlength="45" readonly value="<%= userPO.getHeader3().trim()%>">
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
                <input type="text" name="E02ACC" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
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
  <h4>Additional Codes</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Additional Code 1 :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" name="E14UC0" size="5" maxlength="4" value="<%= lnCodes.getE14UC0().trim()%>" readonly>
              <input type="text" name="D14UC0" size="40" maxlength="35" value="<%= lnCodes.getD14UC0().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%" > 
              <div align="right">Additional Code 2 :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" name="E14UC1" size="5" maxlength="4" value="<%= lnCodes.getE14UC1().trim()%>" readonly>
              <input type="text" name="D14UC1" size="40" maxlength="35" value="<%= lnCodes.getD14UC1().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="3%"> 
              <div align="right">Additional Code 3 :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" name="E14UC2" size="5" maxlength="4" value="<%= lnCodes.getE14UC2().trim()%>" readonly>
              <input type="text" name="D14UC2" size="40" maxlength="35" value="<%= lnCodes.getD14UC2().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="3%"> 
              <div align="right">Additional Code 4 :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" name="E14UC3" size="5" maxlength="4" value="<%= lnCodes.getE14UC3().trim()%>" readonly>
              <input type="text" name="D14UC3" size="40" maxlength="35" value="<%= lnCodes.getD14UC3().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Additional Code 5 :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" name="E14UC4" size="5" maxlength="4" value="<%= lnCodes.getE14UC4().trim()%>" readonly>
              <input type="text" name="D14UC4" size="40" maxlength="35" value="<%= lnCodes.getD14UC4().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">Additional Code 6 :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" name="E14UC5" size="5" maxlength="4" value="<%= lnCodes.getE14UC5().trim()%>" readonly>
              <input type="text" name="D14UC5" size="40" maxlength="35" value="<%= lnCodes.getD14UC5().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Additional Code 7 :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" name="E14UC6" size="5" maxlength="4" value="<%= lnCodes.getE14UC6().trim()%>" readonly>
              <input type="text" name="D14UC6" size="40" maxlength="35" value="<%= lnCodes.getD14UC6().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">Additional Code 8 :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" name="E14UC7" size="5" maxlength="4" value="<%= lnCodes.getE14UC7().trim()%>" readonly>
              <input type="text" name="D14UC7" size="40" maxlength="35" value="<%= lnCodes.getD14UC7().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Additional Code 9 :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" name="E14UC8" size="5" maxlength="4" value="<%= lnCodes.getE14UC8().trim()%>" readonly>
              <input type="text" name="D14UC8" size="40" maxlength="35" value="<%= lnCodes.getD14UC8().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">Additional Code 10 :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" name="E14UC9" size="5" maxlength="4" value="<%= lnCodes.getE14UC9().trim()%>" readonly>
              <input type="text" name="D14UC9" size="40" maxlength="35" value="<%= lnCodes.getD14UC9().trim()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <center>
  </center>
</form>
</body>
</html>

