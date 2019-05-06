<html>
<head>
<title>Reference Code</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="refCodes" class="datapro.eibs.beans.EUS000002Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT LANGUAGE="JavaScript">
builtHPopUp();

function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }
   
</SCRIPT>

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
%>


<H3 align="center">Special User Codes - <%=userPO.getHeader10()%>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="usfl1_codes_details.jsp, EUS0000"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEUS0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  <h4>Basic Information</h4>
  <table  class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Classification  :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E02US1RTY" size="3" maxlength="2" value="<%= refCodes.getE02US1RTY().trim()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%" > 
              <div align="right">Code :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E02US1CDE" size="7" maxlength="6" value="<%= refCodes.getE02US1CDE().trim()%>">
                <input type="text" name="E02US1DSC" size="61" maxlength="60" value="<%= refCodes.getE02US1DSC().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">:</div>
            </td>
            <td nowrap> 
              <div align="left">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
          
          <%if (refCodes.getE02US1RTY().equals("16")) {%> 
          
            <td nowrap width="30%" align="right">Responsible Area :</td>
            <td nowrap> 
            	<select name="E02US1CD1">
          			<option value="1" <%if (refCodes.getE02US1CD1().equals("1")) { out.print("selected"); }%>>Private Banking</option>
          			<option value="2" <%if (refCodes.getE02US1CD1().equals("2")) {  out.print("selected"); }%>>Treasury</option>
          			<option value="3" <%if (refCodes.getE02US1CD1().equals("3")) {  out.print("selected"); }%>>Back Office</option>          		 
				</select>              
            </td>
            
            
          <%}else{%>           
            <td nowrap width="30%" align="right">Reference 1 :</td>
            <td nowrap> 
              <div align="left">
                <INPUT type="text" name="E02US1CD1" size="7" maxlength="6"
					value="<%= refCodes.getE02US1CD1().trim()%>"></div>
            </td>            
          <%}%>
             
          </tr>
          <tr id="trdark"> 
            <TD nowrap width="30%" align="right">Reference 2 :</TD><TD nowrap> 
              <DIV align="left">
                <INPUT type="text" name="E02US1CD2" size="7" maxlength="6" value="<%= refCodes.getE02US1CD2().trim()%>"></DIV>
            </TD>
            
          </tr>
          <tr id="trclear"> 
            <TD nowrap width="30%" align="right">Reference 3 :</TD><TD nowrap> 
              <DIV align="left">
                <INPUT type="text" name="E02US1CD3" size="7" maxlength="6" value="<%= refCodes.getE02US1CD3().trim()%>"></DIV>
            </TD>
            
          </tr>
          <tr id="trdark"> 
            <TD nowrap width="30%" align="right">Reference 4 :</TD><TD nowrap> 
              <DIV align="left">
                <INPUT type="text" name="E02US1CD4" size="7" maxlength="6" value="<%= refCodes.getE02US1CD4().trim()%>"></DIV>
            </TD>
            
          </tr>
          <tr id="trclear"> 
            <TD nowrap width="30%" align="right">Reference 5 :</TD><TD nowrap> 
              <DIV align="left">
                <INPUT type="text" name="E02US1CD5" size="7" maxlength="6" value="<%= refCodes.getE02US1CD5().trim()%>"></DIV>
            </TD>
            
          </tr>
          <tr id="trdark"> 
            <TD nowrap width="30%" align="right">Reference 6 :</TD><TD nowrap> 
              <DIV align="left">
                <INPUT type="text" name="E02US1CD6" size="7" maxlength="6" value="<%= refCodes.getE02US1CD6().trim()%>"></DIV>
            </TD>
            
          </tr>
          <tr id="trclear"> 
            <TD nowrap width="30%" align="right">Reference 7 :</TD><TD nowrap> 
              <DIV align="left">
                <INPUT type="text" name="E02US1CD7" size="7" maxlength="6" value="<%= refCodes.getE02US1CD7().trim()%>"></DIV>
            </TD>
            
          </tr>
          <tr id="trdark"> 
            <TD nowrap width="30%" align="right">Reference 8 :</TD><TD nowrap> 
              <DIV align="left">
                <INPUT type="text" name="E02US1CD8" size="7" maxlength="6" value="<%= refCodes.getE02US1CD8().trim()%>"></DIV>
            </TD>
            
          </tr>
          <tr id="trclear"> 
            <TD nowrap width="30%" align="right">Reference 9 :</TD><TD nowrap> 
              <DIV align="left">
                <INPUT type="text" name="E02US1CD9" size="7" maxlength="6" value="<%= refCodes.getE02US1CD9().trim()%>" size="7"></DIV>
            </TD>
            
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%"></td>
            <td nowrap></td>
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
