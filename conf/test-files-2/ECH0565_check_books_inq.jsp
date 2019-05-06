<HTML>
<HEAD>
<TITLE>
Checkbook Inquiry
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "checkBooks" class= "datapro.eibs.beans.JBList"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"   scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   builtNewMenu(rt_i_opt);

</SCRIPT>

</head>

<body>

<SCRIPT> initMenu();  </SCRIPT>


<h3 align="center">Checkbook Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="check_books_inq.jsp, ECH0565"></h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECH0565" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">

<%
	if ( checkBooks.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
        <div align="center"> <font size="3"><b> There is no match for your search 
          criteria </b></font></div>
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
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
                <input type="text" name="CUSNA1" size="45" readonly maxlength="45" value="<%= userPO.getHeader3().trim()%>" >
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="ACCNUM" size="12" readonly maxlength="12" value="<%= userPO.getIdentifier().trim()%>" >
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency : </b></div>
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
      <TH ALIGN=CENTER colspan="2">Date</TH>
      <TH ALIGN=CENTER rowspan="2" width="13%">Checkbook Number</TH>
      <TH ALIGN=CENTER rowspan="2" width="12%">Checkbook Status</TH>
      <TH ALIGN=CENTER rowspan="2" width="12%">Number of Checks</TH>
      <TH ALIGN=CENTER rowspan="2" width="8%">Initial Check</TH>
      <TH ALIGN=CENTER rowspan="2" width="7%">Final Check</TH>
      <TH ALIGN=CENTER rowspan="2" width="4%">Snd Pro</TH>
      <TH ALIGN=CENTER rowspan="2" width="4%">Rcv Pro</TH>
      <TH ALIGN=CENTER rowspan="2" width="4%">Snd Brn</TH>
      <TH ALIGN=CENTER rowspan="2" width="4%">Rcv Brn</TH>
      <TH ALIGN=CENTER rowspan="2" width="4%">Snd Cus</TH>
    </TR>
    <TR id=trdark> 
      <TH ALIGN=CENTER width="5%">Request</TH>
      <TH ALIGN=CENTER width="5%">Delivery</TH>
    </TR>
    <%
                checkBooks.initRow();
                while (checkBooks.getNextRow()) {
                    // if (checkBooks.getFlag().equals("")) {
                    		out.println(checkBooks.getRecord());
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
