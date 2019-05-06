<html>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "msgRT" class= "datapro.eibs.beans.EFE022001Message"  scope="session"/>

<script language="JavaScript">
function enter(){
	  document.forms[0].submit();
	 }
</script>

</head>
<body>

 
 <% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
    }
%>
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEFE0220" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="H01FLGWK1" VALUE="<%= msgRT.getH01FLGWK1() %>">
	<% if (msgRT.getH01FLGWK1().equals("1")) {%>
  <INPUT TYPE=HIDDEN NAME="E01RATBNK" VALUE="">
	<% } %>
  
  <h3 align="center">Exchange Rate<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="exchange_rate_enter.jsp,EFE0220"></h3>
  <hr size="4">
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <table id="tbenter" align="center" style="width:85%" border="1">
    <tr> 
      <td> 
        <table id="tbenter" width="100%" border="0" cellspacing="1" cellpadding="0">
        <% if (!msgRT.getH01FLGWK1().equals("1")) {%>
          <tr> 
            <td width="18%" nowrap>&nbsp;</td>
            <td width="22%" nowrap> 
              <div align="right">Bank :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E01RATBNK" size="3" maxlength="2" VALUE="<%= msgRT.getE01RATBNK() %>" >
            </td>
          </tr>
        <% } %>
          <tr> 
            <td width="18%" nowrap>&nbsp;</td>
            <td width="22%" nowrap> 
              <div align="right">Currency :</div>
            </td>
            <td nowrap width="60%"> 
				<% if (!msgRT.getH01FLGWK1().equals("1")) {%>
              		<input type="text" name="E01RATCCY" size="4" maxlength="3"  value="ALL">
				<% } else { %>
					<input type="text" name="E01RATCCY" size="4" maxlength="3"  value="">
				<% } %>
              <a href="javascript:GetCurrency('E01RATCCY','')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a> 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </p>
        <p>&nbsp;</p>
  <p><BR>
  </p>
  <p align="center">&nbsp; </p>
      
</form>
</body>
</html>
