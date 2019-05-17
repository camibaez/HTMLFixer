<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Credit Cards Inquiry</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">
function CheckACC(){
	if (document.forms[0].search[0].checked ){
		var cun = new Number(document.forms[0].E01CCMCUN.value);
		if (isNaN(cun)) {
			alert("Please enter a valid customer number.");
			document.forms[0].E01CCMCUN.value = "";
			document.forms[0].E01CCMCUN.focus();
		} else {
			document.forms[0].submit();
		}
	} else {
		var nxn = new Number(document.forms[0].E01CCMNXN.value);
		if (isNaN(nxn)) {
			alert("Please enter a valid card number.");
			document.forms[0].E01CCMNXN.value = "";
			document.forms[0].E01CCMNXN.focus();
		} else {
			document.forms[0].submit();
		} 
	} 
}

</SCRIPT>


</head>


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<body bgcolor="#FFFFFF">

<H3 align="center">Credit Cards Inquiry	
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cc_inq_enter_cards.jsp, ECC0010"></H3>

<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC0010I">
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
    <INPUT TYPE=HIDDEN NAME="typAcc" VALUE="94">
  </p>

  <table class="tbenter" HEIGHT="25%" width="100%" border="0">
    <tr>
      <td nowrap ALIGN="right">
      	<input type="radio" name="search" value="A" onClick="document.forms[0].E01CCMCUN.focus()" checked>
      		Customer Number : </td>
      <td nowrap ALIGN="left"> 
        <INPUT type="text" name="E01CCMCUN" size="12" maxlength="12" 
				onFocus="document.forms[0].search[0].click()" onkeypress="enterInteger()">
        <a href="javascript:GetCustomerDescId('E01CCMCUN','','')">
        <img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absbottom" border="0" onclick="document.forms[0].search[0].click()"></a>  
      </td>
    </tr> 
    <tr> 
      <td nowrap ALIGN="right">
		<input type="radio" name="search" value="C" onClick="document.forms[0].E01CCMNXN.focus()">
		Card Number : </td>
      <td nowrap ALIGN="left"> 
        <INPUT type="text" name="E01CCMNXN" size="24" maxlength="20" onkeypress="enterInteger()"
        	onFocus="document.forms[0].search[1].click()">
      </td>
    </tr>       
  </table>  
 <p align="center"> 
    <input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="CheckACC()">
  </p>  
<script language="JavaScript">
  document.forms[0].E01CCMCUN.focus();
  document.forms[0].E01CCMCUN.select();
</script>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT Language="Javascript">;
            showErrors();
     </SCRIPT>
  <%
 }
%> 
</form>
</body>
</html>

