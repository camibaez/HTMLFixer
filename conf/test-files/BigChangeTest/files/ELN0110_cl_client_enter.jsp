<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>Line of Credit</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<SCRIPT LANGUAGE="JavaScript" SRC="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">

function CheckACC(){
if ( document.forms[0].CUSNUM.value.length < 1) {
  alert("A valid customer number must be entered");
  document.forms[0].CUSNUM.value='';
  document.forms[0].CUSNUM.focus();
}
else {
  document.forms[0].submit();
  }
}

</SCRIPT>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

</HEAD>

<body>

<h3 align="center">Line of Credit By Customer Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="cl_client_enter, ELN0110"></h3>
<hr>
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.credit.JSELN0110" >

    <p><INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="400">
    </p>
    <table  class="tbenter" width="100%" height="75%" border="0" cellspacing=0 cellpadding=2>
	<tr>
     <td align="center">
           Customer Number :
            <INPUT type="text" name="CUSNUM" size="15" maxlength="9" onkeypress="enterInteger()">
            <a href="javascript:GetCustomerDescId('CUSNUM','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="absmiddle" border="0" ></a>

        <p align="center"> <input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="CheckACC()">
        </p>
     </td>
    </tr>
  </table>

<script language="JavaScript">
  document.forms[0].CUSNUM.focus();
  document.forms[0].CUSNUM.select();
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
 </FORM>
</BODY>
</HTML>
