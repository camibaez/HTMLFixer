<html>
<head>
<title>Approval  of Special Codes</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</head>

<jsp:useBean id= "cdCodes" class= "datapro.eibs.beans.ESD000002Message"   scope="session"/>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"   scope="session"/>


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   <% 
    if (userPO.getOption().equals("CD_TREASURY") && userPO.getHeader16().equals("N")) {  
   %>
		builtNewMenu(cdt_a_act_opt);
  <%      
   }
    else if (userPO.getOption().equals("CD_TREASURY") && (!userPO.getHeader16().equals("N"))) {
   %>
		builtNewMenu(cdt_a_opt);
   <%
   }
    else if (!userPO.getOption().equals("CD_TREASURY")) {
   %>
		builtNewMenu(cd_a_opt);
   <%
   }
   %>



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

<h3 align="center">Classification Codes<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cd_ap_codes.jsp,EDL0140" width="35" ></h3> 
<hr size="4">
 <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130A" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="22">
  </p>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Client :</b></div>
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
  <br><table class="tableinfo" >
    <tr > 
      <td nowrap > 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Officer Code :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" name="E02OFC" size="5" maxlength="4" <% if (cdCodes.getF02OFC().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= cdCodes.getE02OFC().trim()%>" readonly> 
              <input type="text" name="D02OFC" size="40" maxlength="35" <% if (cdCodes.getF02OFC().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= cdCodes.getD02OFC().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%" > 
              <div align="right">Substitute Officer :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" name="E02OF2" size="5" maxlength="4" <% if (cdCodes.getF02OF2().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= cdCodes.getE02OF2().trim()%>" readonly>
              <input type="text" name="D02OF2" size="40" maxlength="35" <% if (cdCodes.getF02OF2().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= cdCodes.getD02OF2().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Country of Residence :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" name="E02GEC" size="5" maxlength="4" <% if (cdCodes.getF02GEC().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= cdCodes.getE02GEC().trim()%>" readonly>
              <input type="text" name="D02GEC" size="40" maxlength="35" <% if (cdCodes.getF02GEC().equals("Y")) out.print("id=\"txtchanged\""); %>  value="<%= cdCodes.getD02GEC().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">Country of Risk :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" name="E02GRC" size="5" maxlength="4" <% if (cdCodes.getF02GRC().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= cdCodes.getE02GRC().trim()%>" readonly>
              <input type="text" name="D02GRC" size="40" maxlength="35" <% if (cdCodes.getF02GRC().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= cdCodes.getD02GRC().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Industry Code :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" name="E02INC" size="5" maxlength="4" <% if (cdCodes.getF02INC().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= cdCodes.getE02INC().trim()%>" readonly>
              <input type="text" name="D02INC" size="40" maxlength="35" <% if (cdCodes.getF02INC().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= cdCodes.getD02INC().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="3%"> 
              <div align="right">Line of Business :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" name="E02BUC" size="5" maxlength="4" <% if (cdCodes.getF02BUC().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= cdCodes.getE02BUC().trim()%>" readonly>
              <input type="text" name="D02BUC" size="40" maxlength="35" <% if (cdCodes.getF02BUC().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= cdCodes.getD02BUC().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">User's Code 3 :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" name="E02UC3" size="5" maxlength="4" <% if (cdCodes.getF02UC3().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= cdCodes.getE02UC3().trim()%>" readonly>
              <input type="text" name="D02UC3" size="40" maxlength="35"  <% if (cdCodes.getF02UC3().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= cdCodes.getD02UC3().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">User's Code 5 :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" name="E02UC5" size="5" maxlength="4" <% if (cdCodes.getF02UC5().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= cdCodes.getE02UC5().trim()%>" readonly>
              <input type="text" name="D02UC5" size="40" maxlength="35" <% if (cdCodes.getF02UC5().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= cdCodes.getD02UC5().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">User's Code 6 :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" name="E02UC6" size="5" maxlength="6" <% if (cdCodes.getF02UC6().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= cdCodes.getE02UC6().trim()%>" readonly>
              <input type="text" name="D02UC6" size="40" maxlength="35" <% if (cdCodes.getF02UC6().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= cdCodes.getD02UC6().trim()%>" readonly>
            </td>
          </tr>
          <tr> 
            <td nowrap width="30%"> 
              <div align="right">User's Code 7 :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" name="E02UC7" size="5" maxlength="4" <% if (cdCodes.getF02UC7().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= cdCodes.getE02UC7().trim()%>" readonly>
              <input type="text" name="D02UC7" size="40" maxlength="35" <% if (cdCodes.getF02UC7().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= cdCodes.getD02UC7().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Call Report :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" name="E02UC4" size="7" maxlength="6" <% if (cdCodes.getF02UC4().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= cdCodes.getE02UC4().trim()%>" readonly>
              <input type="text" name="D02UC4" size="40" maxlength="35" <% if (cdCodes.getF02UC4().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= cdCodes.getD02UC4().trim()%>" readonly>            </td>
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

