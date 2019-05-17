<HTML>
<HEAD>
<TITLE>
Print Books Inquiry
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "prBooks" class= "datapro.eibs.beans.JBList"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">
<%
if ( userPO.getOption().equals("RT") ) {
%>
	builtNewMenu(rt_i_opt);
	 initMenu(); 
<%   
}
else if ( userPO.getOption().equals("SV") ) {
%>
	builtNewMenu(sv_i_opt);
	 initMenu(); 
<%   
}
%>
</SCRIPT>

</head>

<body>

<SCRIPT> initMenu();  </SCRIPT>


<h3 align="center">Line to Print for Saving Passbook<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="print_books_inq.jsp,EDD0990"></h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0990" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">

<%
	if ( prBooks.getNoResult() ) {
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
                <input type="text" name="CUSCUN" size="9" maxlength="9" value="<%= userPO.getCusNum().trim()%>" readonly>
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
                <input type="text" name="PROCCY" size="4" readonly maxlength="4" value="<%= userPO.getHeader2().trim()%>">
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
      <TH ALIGN=CENTER>Date</TH>
      <TH ALIGN=CENTER>TR</TH>
      <TH ALIGN=CENTER>Description</TH>
      <TH ALIGN=CENTER>Debit Amount</TH>
      <TH ALIGN=CENTER>Credit Amount</TH>
      <TH ALIGN=CENTER>Balance</TH>
      <TH ALIGN=CENTER>Teller</TH>
      <TH ALIGN=CENTER>Reference</TH>
      <TH ALIGN=CENTER>Time</TH>
    </TR>
    <%
                prBooks.initRow();
                while (prBooks.getNextRow()) {
                    // if (prBooks.getFlag().equals("")) {
                    		out.println(prBooks.getRecord());
                    // }
                }
    %> 
  </TABLE>

  <h4></h4>
	<table class="tableinfo">
    <tr > 
      <td nowrap>
        
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trclear"> 
            <td width="25%"> 
              <div align="right"><b>Passbook Balance : </b></div>
            </td>
            <td width="25%"><%= userPO.getHeader4() %></td>
            <td width="25%"> 
              <div align="right"><b>Account Balance :</b></div>
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
