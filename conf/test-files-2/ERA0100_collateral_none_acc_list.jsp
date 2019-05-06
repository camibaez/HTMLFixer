<HTML>
<HEAD>
<TITLE>Collaterals
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</HEAD>

<jsp:useBean id= "collList" class= "datapro.eibs.beans.JBList"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<script language="javascript">
function goCollBasic(ref) {
	document.forms[0].REF.value = ref;
	document.forms[0].submit();
}

</script>

<body>

<%@ page import = "datapro.eibs.master.Util" %>

<h3 align="center">Non-Account Collaterals List<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="collateral_none_acc_list.jsp,ERA0100"></h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0100" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="8">
<INPUT TYPE=HIDDEN NAME="CUSNUM" VALUE="<%= userPO.getCusNum() %>">
<INPUT TYPE=HIDDEN NAME="REF" VALUE="">
 
<%
	if ( collList.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
        <div align="center"><b> There is no match for your search 
          criteria </b></div>
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
              <div align="right"><b>Customer : </b></div>
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
              <div align="left"> 
                <input type="text" name="CUSNA1" size="45" readonly maxlength="45" value="<%= userPO.getCusName().trim()%>" >
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<h4></h4>
  
  <TABLE class="tableinfo">
    <TR id="trdark"> 
      <TH ALIGN=CENTER>Reference Number</TH>
      <TH ALIGN=CENTER>Type</TH>
      <TH ALIGN=CENTER>Maturity Date</TH>
      <TH ALIGN=CENTER>CCY</TH>
      <TH ALIGN=CENTER>Net Balance </TH>
      <TH ALIGN=CENTER>Collateral Utilized</TH>
      <TH ALIGN=CENTER>Available Balance </TH>
    </TR>
    <%
                collList.initRow();
                while (collList.getNextRow()) {
                    if (collList.getFlag().equals("")) {
                    		out.println(collList.getRecord());
                    }
                }
    %> 
  </TABLE>

<%
  }
%>

</FORM>

</BODY>
</HTML>
