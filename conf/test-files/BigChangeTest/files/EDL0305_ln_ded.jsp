<html>
<head>
<title>Deduction Inqquiry</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "cifPos" class= "datapro.eibs.beans.JBList"  scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">
<%if ( userPO.getHeader23().equals("G") ||  userPO.getHeader23().equals("V")){%>
	builtNewMenu(ln_i_1_opt);
<%} else  {%>
	builtNewMenu(ln_i_2_opt);
<%}%>
</SCRIPT>

</head>
<BODY>

<SCRIPT> initMenu();  </SCRIPT>

<h3 align="center">Deduction Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="ln_ded.jsp,EDL0305"></h3>
<hr size="4">
  <form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JEDL0305" >
    <INPUT TYPE=HIDDEN NAME="SCREEN" value="2">
	<INPUT TYPE=HIDDEN NAME="CODE" VALUE="">
	<INPUT TYPE=HIDDEN NAME="TYPE" VALUE="">
	<INPUT TYPE=HIDDEN NAME="ACCOUNT" VALUE="">
<%if ( cifPos.getNoResult() ) {%>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
        <div align="center"> <font size="3"><b> There is no match for your search criteria 
          </b></font> </div>
      </TD></TR>
   		</TABLE>
<%} else {%> 
  <table class="tableinfo">
    <tr> 
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
              <div align="right"><b>Name :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left">
                <input type="text" name="E02NA12" size="45" maxlength="45" readonly value="<%= userPO.getHeader3().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account : </b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E02ACC" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency :</b></div>
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
  <h4>Deductions</h4>
  <TABLE class="tableinfo">
    <TR id="trdark"> 
      <TH ALIGN=CENTER >Code</TH>
      <TH ALIGN=CENTER >Name</TH>
      <TH ALIGN=CENTER >Type</TH>
      <TH ALIGN=CENTER >Policy</TH>
      <TH ALIGN=CENTER >Coverage</TH>
      <TH ALIGN=CENTER >Deduction</TH>
      <TH ALIGN=CENTER >Factor</TH>
    </TR>
    <%
	cifPos.initRow();
	while (cifPos.getNextRow()) {
	    if (cifPos.getFlag().equals("1")) {
	    		out.println(cifPos.getRecord());
	    }
	}
    %> 
  </TABLE>
  <BR>
<%}%> 
</form>
</body>
</html>
