<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Assign Accounts to Cards</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">

function CheckCard(){
	if ( document.forms[0].E01CCMPCN.value.length < 1) {
  		alert("A valid card number must be entered");
  		document.forms[0].E01CCMPCN.value='';
  		document.forms[0].E01CCMPCN.focus();
	} else {
  		document.forms[0].submit();
  	}
}

</SCRIPT>
</head>


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<body bgcolor="#FFFFFF">

<H3 align="center">Card Activation<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cards_activation_enter, ECC0050"></H3>

<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC0050">
<p><INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="12"></p>

	<table class="tbenter" HEIGHT="75%" width="100%" border="0">
    	<tr> 
      		<td nowrap ALIGN=CENTER>Card Number : 
        		<INPUT type="text" name="E01CCMPCN" size="21" maxlength="16" onkeypress="enterInteger()">
        		<br>
 				<div align="center"><input id="EIBSBTN" type=button name="Activate" value="Activate" onClick="CheckCard()"></div>     
      		</td>
    	</tr>
  	</table>
  
<script language="JavaScript">
  document.forms[0].E01CCMPCN.focus();
  document.forms[0].E01CCMPCN.select();
</script>

<% 
 	if ( !error.getERRNUM().equals("0")  ) {
    	error.setERRNUM("0");
%>
     	<SCRIPT Language="Javascript">;
            showErrors();
     	</SCRIPT>
<% } %> 

</form>
</body>
</html>
