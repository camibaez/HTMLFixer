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
	if ( document.forms[0].E01CCMPCN.value.length < 1 || document.forms[0].E01CCMAST.value.length < 1) {
		alert("A valid card number and status must be entered");
  		document.forms[0].E01CCMPCN.focus();
	} else {
		document.forms[0].submit();
	}
}

</SCRIPT>
</head>

<jsp:useBean id= "rtCC" class= "datapro.eibs.beans.ECC004001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<body bgcolor="#FFFFFF">

<H3 align="center">Replace Card 
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cards_replace_enter, ECC0050"></H3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC0050">
  <p><INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="33"></p>

<br>

  <table class="tbenter" width="100%" border="0">
    <tr> 
      <td nowrap ALIGN=right width="25%"> Card Number : </td>
      <td nowrap ALIGN=left width="25%"> 
        <INPUT type="text" name="E01CCMPCN" size="21" maxlength="16" value="<%= rtCC.getE01CCMPCN().trim() %>" onkeypress="enterInteger()">
       </td>
    </tr>
    <tr> 
      	<td nowrap ALIGN=right width="25%"> Status : </td>
        <td nowrap width="25%" >
          <select name="E01CCMAST">
            <option value=" " selected></option>
            <option value="R">Damaged</option>
            <option value="2">Lost</option>
            <option value="4">Stolen</option>
            <option value="N">Embossing Name Changed</option>
          </select>
        </td>
    </tr>
  </table>
          <br>
 <div align="center"> 
	   <input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="CheckCard()">
  </div>    
  
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
  <%
 }
%> 
</form>
</body>
</html>