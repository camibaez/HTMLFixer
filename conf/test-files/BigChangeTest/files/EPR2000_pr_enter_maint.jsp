<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Payment Orders</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<SCRIPT SRC="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">

function CheckACC(){
 if ( document.forms[0].E01PRPDAC.value.length < 1) {
   alert("Enter a valid number account");
   document.forms[0].E01PRPDAC.value='';
   document.forms[0].E01PRPDAC.focus();
   return false;
 }
 else {
   if ( document.forms[0].E01PRPNUM.value.length > 0) document.forms[0].OPCODE.value = "0002";
   return true;
 }
}

</SCRIPT>
</head>

<body>

<%
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
	 error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }

%>

<h3 align="center">Payment Orders Maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="pr_enter_maint.jsp,EPR2000"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.transfer.JSEPR2000" onsubmit="return(CheckACC())">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
  <INPUT TYPE=HIDDEN NAME="OPCODE" VALUE="0001">

  <table class="tbenter">

    <tr >
      <td nowrap align="center" width="40%">
        <div align="right">Debit Account Number:</div>
      </td>
      <td nowrap align="center" width="60%">
        <div align="left">
          <input type="text" name="E01PRPDAC" size="12" maxlength="12" onKeyPress="enterInteger()" value="">
          <a href="javascript:GetAccount('E01PRPDAC','','','RA')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a></div>
      </td>
    </tr>

    <tr >
      <td nowrap align="center" width="40%">
        <div align="right">Reference Number:</div>
      </td>
      <td nowrap align="center" width="60%">
        <div align="left">
          <input type="text" name="E01PRPNUM" size="9" maxlength="9" onKeyPress="enterInteger()" value="">
          ( 0 or Blank for new references)
        </div>
      </td>
    </tr>

  </table>
  <p align="center">
  	<input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </p>
</form>
</body>
</html>
