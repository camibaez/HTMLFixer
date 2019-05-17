<html>
<head>
<title>Codigos Especiales</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "msgLC" class= "datapro.eibs.beans.ESD000002Message" scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

builtNewMenu(<%= userPO.getPurpose().trim().equals("MAINTENANCE") ? "lc_maint" : "lc_opening"%>);
initMenu(); 

</SCRIPT>
</head>
<body bgcolor="#FFFFFF">

 
 <% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }

%>
<h3 align="center">Letter Of Credit Maintenance [Special Codes]<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="lc_codes_maint.jsp,ESD0000"></h3>
<hr size="4">
 <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0510" >
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="202">
	

<p></p>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <TABLE cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <TBODY><TR id="trdark"> 
            <TD nowrap width="16%"> 
              <DIV align="right"><B>Letter Of Credit ID :</B></DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E02ACC" size="14" maxlength="12" value="<%= msgLC.getE02ACC().trim()%>" readonly>
              </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right"><B>Product : </B></DIV>
            </TD><TD nowrap width="16%"> 
              <DIV align="left"><B> 
                <INPUT type="text" name="E02PRO" size="4" maxlength="4" readonly value="<%= userPO.getHeader1().trim()%>">
                </B> </DIV>
            </TD>
            
          </TR>
        </TBODY></TABLE>
      </td>
    </tr>
  </table>
  <h4>Clasification Codes  </h4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap height="43"> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0" height="118">
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Primary Officer :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" name="E02OFC" size="5" maxlength="4" value="<%= msgLC.getE02OFC().trim()%>">
              <input type="text" name="D02OFC" size="40" maxlength="35" value="<%= msgLC.getD02OFC().trim()%>" readonly>
              <a href="javascript:GetCodeDescCNOFC('E02OFC','D02OFC','15')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"  border="0"></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field"  border="0" > 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%" height="37"> 
              <div align="right">Secondary Officer:</div>
            </td>
            <td nowrap width="70%" height="37"> 
              <input type="text" name="E02OF2" size="5" maxlength="4" value="<%= msgLC.getE02OF2().trim()%>">
              <input type="text" name="D02OF2" size="40" maxlength="35" value="<%= msgLC.getD02OF2().trim()%>" readonly>
              <a href="javascript:GetCodeDescCNOFC('E02OF2','D02OF2','10')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"  border="0" ></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field"  border="0"  > 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Industry Code :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" name="E02INC" size="5" maxlength="4" value="<%= msgLC.getE02INC().trim()%>">
              <input type="text" name="D02INC" size="40" maxlength="35" value="<%= msgLC.getD02INC().trim()%>" readonly>
              <a href="javascript:GetCodeDescCNOFC('E02INC','D02INC','09')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"  border="0" ></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field"  border="0"  > 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="3%"> 
              <div align="right">Business Line :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" name="E02BUC" size="5" maxlength="4" value="<%= msgLC.getE02BUC().trim()%>">
              <input type="text" name="D02BUC" size="40" maxlength="35" value="<%= msgLC.getD02BUC().trim()%>" readonly>
              <a href="javascript:GetCodeDescCNOFC('E02BUC','D02BUC','12')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"  border="0" ></a> 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Country Residence :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" name="E02GEC" size="5" maxlength="4" value="<%= msgLC.getE02GEC().trim()%>">
              <input type="text" name="D02GEC" size="40" maxlength="35" value="<%= msgLC.getD02GEC().trim()%>" readonly>
              <a href="javascript:GetCodeDescCNOFC('E02GEC','D02GEC','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"  border="0" ></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field"  border="0"  > 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">Country Risk Code :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" name="E02GRC" size="5" maxlength="4" value="<%= msgLC.getE02GRC().trim()%>">
              <input type="text" name="D02GRC" size="40" maxlength="35" value="<%= msgLC.getD02GRC().trim()%>" readonly>
              <a href="javascript:GetCodeDescCNOFC('E02GRC','D02GRC','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"  border="0" ></a> 
            </td>
          </tr>

          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Source of Funds :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" name="E02ORG" size="5" maxlength="4" value="<%= msgLC.getE02ORG().trim()%>">
              <input type="text" name="D02ORG" size="40" maxlength="35" value="<%= msgLC.getD02ORG().trim()%>" readonly>
              <a href="javascript:GetCodeDescCNOFC('E02ORG','D02ORG','18')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"  border="0" ></a> 
              <%if(userPO.getType().trim().equals("I")){%>
              	<IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" border="0">
              	<%}%></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">Destination of Funds:</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" name="E02DST" size="5" maxlength="4" value="<%= msgLC.getE02DST().trim()%>">
              <input type="text" name="D02DST" size="40" maxlength="35" value="<%= msgLC.getD02DST().trim()%>" readonly>
              <a href="javascript:GetCodeDescCNOFC('E02DST','D02DST','38')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"  border="0" ></a> 
			</td>
          </tr>


          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">User Code 1 :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" name="E02UC1" size="5" maxlength="4" value="<%= msgLC.getE02UC1().trim()%>">
              <input type="text" name="D02UC1" size="40" maxlength="35" value="<%= msgLC.getD02UC1().trim()%>" readonly>
              <a href="javascript:GetCodeDescCNOFC('E02UC1','D02UC1','2A')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"  border="0"></a> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">User Code 2 :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" name="E02UC2" size="5" maxlength="4" value="<%= msgLC.getE02UC2().trim()%>">
              <input type="text" name="D02UC2" size="40" maxlength="35" value="<%= msgLC.getD02UC2().trim()%>" readonly>
              <a href="javascript:GetCodeDescCNOFC('E02UC2','D02UC2','2B')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"  border="0" ></a> 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">User Code 3 :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" name="E02UC3" size="5" maxlength="4" value="<%= msgLC.getE02UC3().trim()%>">
              <input type="text" name="D02UC3" size="40" maxlength="35" value="<%= msgLC.getD02UC3().trim()%>" readonly>
              <a href="javascript:GetCodeDescCNOFC('E02UC3','D02UC3','2C')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"  border="0" ></a> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">User Code 4 :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" name="E02UC4" size="5" maxlength="6" value="<%= msgLC.getE02UC4().trim()%>">
              <input type="text" name="D02UC4" size="40" maxlength="35" value="<%= msgLC.getD02UC4().trim()%>" readonly>
              <a href="javascript:GetCodeDescCNOFC('E02UC4','D02UC4','CA')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"  border="0" ></a> 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
          <div align="center"> 
            <input id="EIBSBTN" type=submit name="Submit" value="Submit">
          </div>
</form>
</body>
</html>
