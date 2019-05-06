<HTML>
<HEAD>
<TITLE>
Checks List
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</HEAD>

<jsp:useBean id= "checks" class= "datapro.eibs.beans.JBList"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<body>
<h3 align="center">Checkbook Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="checks_inq.jsp,ECH0565"></h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECH0565" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">

<%
	if ( checks.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
        <div align="center"> <font size="3"><b> There is no match for your criteria 
          </b></font> </div>
      </TD></TR>
   		</TABLE>
<%   		
	}
	else {
%>
  <table class="tableinfo">
    <tr > 
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="23%" height="31"> 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="35%" height="31"> 
              <input type="text" name="E01LDMCUN" size="9" maxlength="9" value="<%= userPO.getHeader2().trim()%>" readonly>
            </td>
            <td nowrap width="24%" height="31"> 
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="18%" height="31"> 
              <input type="text" name="E01LDMACC" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="23%"> 
              <div align="right"><b>Name :</b></div>
            </td>
            <td nowrap width="35%"> 
              <input type="text" name="E01CUSNA1" size="45" maxlength="45" value="<%= userPO.getHeader3().trim()%>" readonly>
            </td>
            <td nowrap width="24%"> 
              <div align="right"><b>Product :</b></div>
            </td>
            <td nowrap width="18%"> 
              <input type="text" name="E01LDMPRO" size="4" maxlength="4" value="<%= userPO.getHeader1().trim()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<h4></h4> 
  
  <TABLE class="tableinfo">
    <TR id=trdark> 
      <TH ALIGN=CENTER >Check</TH>
      <TH ALIGN=CENTER >Status</TH>
      <TH ALIGN=CENTER >Check</TH>
      <TH ALIGN=CENTER >Status</TH>
      <TH ALIGN=CENTER >Check</TH>
      <TH ALIGN=CENTER >Status</TH>
      <TH ALIGN=CENTER >Check</TH>
      <TH ALIGN=CENTER >Status</TH>
      <TH ALIGN=CENTER >Check</TH>
      <TH ALIGN=CENTER >Status</TH>
    </TR>
    <%
                checks.initRow();
                while (checks.getNextRow()) {
                    // if (checks.getFlag().equals("")) {
                    		out.println(checks.getRecord());
                    // }
                }
    %> 
  </TABLE>

<%
  }
%>

</FORM>

</BODY>
</HTML>
