<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Forms</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">

function GetHelp(){
 var code = document.forms[0].APP_CODE.value;
 if( code == "00"){
  GetCustomerDescId('ACCOUNT','','');
 }
 else if( code == "XX"){
  GetProduct('ACCOUNT', '', '');
 }
 else {
  GetAccount('ACCOUNT','','','');
 }
}

function validate() {
  if ((document.forms[0].APP_CODE.value == 'XX' && document.forms[0].OPE_CODE.value !== 'AA') || 
      (document.forms[0].APP_CODE.value !== 'XX' && document.forms[0].OPE_CODE.value == 'AA')) {
   alert("When you select form for PRODUCT the type must be APPLICATION and vise versa");
  }
  else {  
   if (trim(document.forms[0].ACCOUNT.value) == '') {
     var msg = "";
     if (document.forms[0].APP_CODE.value == 'XX') msg = "The Product Code can not be blank";
     else if (document.forms[0].APP_CODE.value == '00') msg = "The Customer Number can not be blank";
     else if (document.forms[0].APP_CODE.value == '  ') msg = "The Account Number can not be blank";
     alert(msg);
   }
   else {
     document.forms[0].submit();
   }
  }
}
</SCRIPT>

</head>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<body bgcolor="#FFFFFF">


<h3 align="center">Forms<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="forms_enter,EFRM000"></h3>
<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.reports.JSEFRM000">
    
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1">
    <INPUT TYPE=HIDDEN NAME="H01FLGWK3" VALUE="*">
  </p>
  <p>&nbsp;</p>
  <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0">
    <tr> 
      <td nowrap> 
        <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr> 
            <td nowrap colspan="2"> 
              <div align="right">Interface : </div>
            </td>
            <td nowrap width="57%"> 
              <select name="INTERFACE" >
                <option value=" " selected>eIBS Forms</option>
                <option value="B">Bankers Online Forms</option>
              </select>
            </td>
          </tr>
          <tr>
            <td nowrap colspan="2">
              <div align="right">Type : </div>
            </td>
            <td nowrap width="57%">
              <select name="OPE_CODE" >
                <option value="AA">Application</option>
                <option value="01" selected>Opening</option>
                <option value="02">Change Rate</option>
                <option value="03">Rollover</option>
                <option value="04">Payment</option>
                <option value="05">Cancelation</option>
                <option value="XX">Generic</option>
              </select>
            </td>
          </tr>
          <tr> 
            <td nowrap colspan="2"> 
              <div align="right">Forms for : </div>
            </td>
            <td nowrap width="57%"> 
              <select name="APP_CODE" >
                <option value="  " selected>Account</option>
                <option value="00">Customer</option>
                <option value="XX">Product</option>
              </select>
              <INPUT type="text" name="ACCOUNT" size="12" maxlength="9">
              <a href="javascript:GetHelp()"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0"  ></a> 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p align="center">
    <input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="validate()">
  </p>
<script language="JavaScript">
  document.forms[0].ACCOUNT.focus();
  document.forms[0].ACCOUNT.select();
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
