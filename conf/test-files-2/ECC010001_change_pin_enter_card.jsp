<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>PIN Change</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">

function CheckCard(){
	if (document.forms[0].E01CCRNUM.value.length < 1) {
		alert("Please enter a valid card.");
		document.forms[0].E01CCRNUM.value = "";
		document.forms[0].E01CCRNUM.focus();
		return false;
	}
	else {
		document.forms[0].submit();
	}
}

</SCRIPT>
</head>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<body onload="top.client.location.reload();" >

<H3 align="center">PIN Change<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="change_pin_enter_card.jsp, ECC010001"></H3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC010001" onsubmit="return(CheckCard())" id="form1" name="form1" >
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="20">
  </p>

  <table class="tbenter" HEIGHT="75%" width="100%" border="0">

    <tr> 
      <td nowrap ALIGN=CENTER> 
        Card Number : 
        <INPUT type="text" name="E01CCRNUM" size="21" maxlength="20" onkeypress="enterInteger()">
			<%--
			<A href="javascript:actPinpad()">
			<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Leer Tarjetas" align="absbottom" border="0"></A> 
			<A href="javascript:GetPlastic2('E01CCANUM', 'D', '')">
			<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Lista Tarjetas" align="absbottom" border="0"></A> 
			--%>
        <br>
 <div align="center"> 
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>     
      </td>
    </tr>
  </table>
  
<script language="JavaScript">
  document.forms[0].E01CCRNUM.focus();
  document.forms[0].E01CCRNUM.select();
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

 