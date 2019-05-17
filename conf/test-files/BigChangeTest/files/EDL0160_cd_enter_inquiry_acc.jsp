<html>
<head>
<title>Certificates of Deposit Inquiry</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">

function CheckACC(){
if ( document.forms[0].E01DEAACC.value.length < 1) {
  alert("A valid account number must be entered");
  document.forms[0].E01DEAACC.value='';
  document.forms[0].E01DEAACC.focus();
}
else {
  document.forms[0].submit();
  }
}

</SCRIPT>


</head>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<body nowrap bgcolor="#FFFFFF">

<h3 align="center">Acceptances Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cd_enter_inquiry, EDL0160"></h3>
<hr size="4">
<p>&nbsp;</p>

<form method="post"  action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130I">
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  </p>

  <table  class="tbenter"width="100%" height="75%" border="0" >

	  <tr>
            <td align="center">
              Reference Number :
              <input type="text" name="E01DEAACC" size="12" maxlength="9" onkeypress="enterInteger()">
              <a href="javascript:GetAccount('E01DEAACC','','14','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
 <br>
  <div align="center">
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit"  onClick="CheckACC()">
  </div>
      </td>
    </tr>
  </table>

  <script language="JavaScript">
  document.forms[0].E01DEAACC.focus();
  document.forms[0].E01DEAACC.select();
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
