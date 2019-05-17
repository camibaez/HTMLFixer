<HTML>
<HEAD>
<TITLE>
Deferred Inquiry
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "def" class= "datapro.eibs.beans.JBList"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">
<%
if (userPO.getPurpose().equals("INQUIRY")){
%>

<%
if ( userPO.getOption().equals("RT") ) {
%>
	builtNewMenu(rt_i_opt);
<%   
}
else if ( userPO.getOption().equals("SV") ) {
%>
	builtNewMenu(sv_i_opt);
<%   
}
%>

<%
}
%>
</SCRIPT>

</head>

<body>

<%
   if (userPO.getPurpose().equals("INQUIRY")){ 
   out.println("<SCRIPT> initMenu();  </SCRIPT>");}
%> 


<h3 align="center">Uncollected & Holds<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="deferred_inq.jsp,EDD0395"></h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0395" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">

<%
	if ( def.getNoResult() ) {
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
            <td nowrap width="16%" > 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="CUSCUN" size="9" maxlength="9" value="<%= userPO.getHeader2().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="CUSNA1" size="45" readonly maxlength="45" value="<%= userPO.getHeader3().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account : </b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="ACCNUM" size="12" readonly maxlength="9" value="<%= userPO.getIdentifier().trim()%>" >
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency :</b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
                <input type="text" name="PROCCY" size="4" readonly maxlength="4" value="<%= userPO.getCurrency().trim()%>">
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
                <input type="text" name="PROCOD" size="4" readonly maxlength="4" value="<%= userPO.getHeader1().trim()%>">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<h4></h4>
<TABLE class="tableinfo">
  <TR id=trdark> 
      <TH ALIGN=CENTER>Reference</TH>
      <TH ALIGN=CENTER>Reason</TH>
      <TH ALIGN=CENTER>Type</TH>
      <TH ALIGN=CENTER>Process Date</TH>
      <TH ALIGN=CENTER>Maturity Date</TH>
      <TH ALIGN=CENTER>No. Days</TH>
      <TH ALIGN=CENTER>Uncollected Amount</TH>
      <TH ALIGN=CENTER>Hold Amount</TH>
  </TR>
  <%
                def.initRow();
                while (def.getNextRow()) {
                    // if (def.getFlag().equals("")) {
                    		out.println(def.getRecord());
                    // }
                }
    %> 
</TABLE>

  <h4></h4>
	<table class="tableinfo">
    <tr > 
      <td nowrap height="28"> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trclear"> 
            <td width="25%"> 
              <div align="right"><b>Uncollected : </b></div>
            </td>
            <td width="25%"><%= userPO.getHeader4() %></td>
            <td width="25%"> 
              <div align="right"><b>Holds :</b></div>
            </td>
            <td width="25%"><%= userPO.getHeader5() %></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

<%
  }
%>

</FORM>

</BODY>
</HTML>
