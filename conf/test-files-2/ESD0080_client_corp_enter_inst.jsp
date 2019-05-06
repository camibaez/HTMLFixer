<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Client New</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<%--
<SCRIPT Language="Javascript">
<% if( request.getParameter("enter") == null ) {   %>    
   builtNewMenu(client_corp_opt) ;
   initMenu() ;
<% } %>
--%>

</SCRIPT>

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

</head>

<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
%> 
<h3 align="center">Customer Instructions<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="client_both_enter_new, ESD0080"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080">
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="62">
  </p>
  <br>
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap align="right" valign="middle" width="49%"> 
              <div align="right">Customer Number :</div>
            </td>
            <td nowrap align="left" valign="middle" colspan="2"> 
              <input type="text" name="E11CUS" maxlength="9" size="10">
              <a href="javascript:GetCustomerDescId('E11CUS','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a> 
            </td>
          </tr>        
          <tr id="trclear"> 
            <td nowrap align="right" valign="middle" width="49%"> 
              <div align="right">Currency Code :</div>
            </td>
            <td nowrap align="left" valign="middle" colspan="2"> 
              <input type="text" name="E11CCY" maxlength="3" size="4">
              <a href="javascript:GetCurrency('E11CCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a> 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap align="right" valign="middle" width="49%"> 
              <div align="right">Type :</div>
            </td>
            <td nowrap align="left" valign="middle" colspan="2">
              <select name="E11TYP">
                <option value=" "></option>
                <option value="1">Default</option>
                <option value="2">Investments</option>
                <option value="3">Foreign Exchange</option>
                <option value="4">Forward Rate Agreements</option>
				<option value="C">CLS Default</option>
				<option value="E">CLS Foreign Exchange</option>
				<option value="D">CLS Invest</option>
				<option value="F">CLS FRA</option>
				<option value="0">FED</option>
              </select>
            </td>
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
