<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Client New</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />

</head>

<body>

 
<h3 align="center">e-Funds Interface<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="client_both_enter_new, ESD0080"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0081">
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  </p>
  <h4 align="center">Enter either Customer Number or Social Security and Customer 
    Type </h4>
  <p>&nbsp; </p>
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap align="right" valign="middle" width="49%">Customer Number 
              :</td>
            <td nowrap align="left" valign="middle" colspan="2"> 
              <INPUT type="text" name="CUN" value="0" maxlength="10" size="11" onkeypress="enterInteger()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap align="right" valign="middle" width="49%">Social Security/Tax 
              Id Number : </td>
            <td nowrap align="left" valign="middle" colspan="2"> 
              <input type="text" name="IDN" value="" maxlength="12" size="10">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap align="right" valign="middle" colspan="3" > 
              <div align="center">Customer Type</div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap align="right" valign="middle" colspan="2"> Corporate :</td>
            <td nowrap width="46%" align="left" valign="middle"> 
              <input type="radio" name="TYPE" value="1">
            </td>
          </tr>
          <tr  id="trdark"> 
            <td nowrap colspan="2" align="right" valign="middle"> Personal :</td>
            <td nowrap width="46%" align="left" valign="middle"> 
              <input type="radio" name="TYPE" value="2" checked>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap colspan="2" align="right" valign="middle"> Other :</td>
            <td nowrap width="46%" align="left" valign="middle"> 
              <input type="radio" name="TYPE" value="2">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p align="center"> 
   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </p>
<script language="JavaScript">
  document.forms[0].CUN.focus();
  document.forms[0].CUN.select();
</script>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT Language="Javascript">
            showErrors();
     </SCRIPT>
 <%
 }
%>
</form>
</body>
</html>
