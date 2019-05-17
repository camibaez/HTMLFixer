<html>
<head>
<title>Line and Credit Limit</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="rtCredit" class="datapro.eibs.beans.EDD000004Message"   scope="session"/>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"    scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"   scope="session"/>

<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

<%
if ( userPO.getOption().equals("RT") ) {
%>
	builtNewMenu(rt_a_opt);
<%   
}
else if ( userPO.getOption().equals("SV") ) {
%>
	builtNewMenu(sv_a_opt);
<%   
}
%>

</SCRIPT>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
  	 error.setERRNUM("0");
   out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
    out.println("<SCRIPT> initMenu();  </SCRIPT>");
%> 
<H3 align="center">Line of Credit and Credit Limit<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="rt_ap_credit, EDD1000"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="8">
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
                <input type="text" name="E04ACMCUN" size="9" maxlength="9" value="<%= rtCredit.getE04ACMCUN().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E04CUSNA1" size="45" maxlength="45" value="<%= rtCredit.getE04CUSNA1().trim()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E04ACMACC" size="12" maxlength="12" value="<%= rtCredit.getE04ACMACC().trim()%>" readonly>
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
                <input type="text" name="E04ACMPRO" size="4" maxlength="4" value="<%= rtCredit.getE04ACMPRO().trim()%>" readonly>
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <H4>Line of Credit and Credit Limit</H4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="40%"> 
              <div align="right">Customer of the Line :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E04ACMCMC" maxlength="9" size="9" value="<%= rtCredit.getE04ACMCMC().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="40%">
              <div align="right">Line of Credit :</div>
            </td>
            <td nowrap width="60%">
              <input type="text" name="E04ACMCMN" maxlength="4" size="4" value="<%= rtCredit.getE04ACMCMN().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%"> 
              <div align="right">Credit Limit :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E04ACMCLI" size="11" maxlength="11" value="<%= rtCredit.getE04ACMCLI().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="40%" height="23"> 
              <div align="right">Limit of Credit Revision Date :</div>
            </td>
            <td nowrap width="60%" height="23"> 
              <input type="text" maxlength="2" size="2" name="E04ACMRV1" value="<%= rtCredit.getE04ACMRV1().trim()%>" readonly>
              <input type="text" maxlength="2" size="2" name="E04ACMRV2" value="<%= rtCredit.getE04ACMRV2().trim()%>" readonly>
              <input type="text" maxlength="2" size="2" name="E04ACMRV3" value="<%= rtCredit.getE04ACMRV3().trim()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  </form>
</body>
</html>
