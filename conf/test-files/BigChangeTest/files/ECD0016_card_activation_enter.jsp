<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Activación de Tarjeta</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">

function CheckNum(){
	if (document.forms[0].E01CDRTAR.value.length < 1){
		alert("Introduce a valid card number");
		document.forms[0].E01CDRTAR.value='';
		document.forms[0].E01CDRTAR.focus();
	}
	else {
		document.forms[0].submit();
	}
}

</SCRIPT>
</head>



<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />


<body bgcolor="#FFFFFF">


<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
	 out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center">Activate Card<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="card_activation_enter.jsp, ECD0016"> 
</h3><hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.cards.JSECD0016" >
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1">
  </p>
  
  <table class="tbenter" height="75%" width="100%" border="0">
    <tr>
          
      <td nowrap align="center">Card Number : 
        <input type="text" name="E01CDRTAR" size="21" maxlength="20" onKeyPress="enterInteger()">
        <br>
        <div align="center"> 
   		   <input id="EIBSBTN" type=button name="Submit" id="EIBSBTN" OnClick="CheckNum()" value="Submit">
    	</div>
      </td>
    </tr>
  </table>
<script language="JavaScript">
  document.forms[0].E01CDRTAR.focus();
  document.forms[0].E01CDRTAR.select();
</script>

</form>
</body>
</html>
 