<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Loans Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">

function CheckACC(){
if ( document.forms[0].E01DEAPAC.value.length < 1) {
  alert("A valid participation number must be entered");
  document.forms[0].E01DEAPAC.value='';
  document.forms[0].E01DEAPAC.focus();
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

<h3 align="center">New Participation Loan<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="ln_enter_maint,EDL0150"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0150">
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
  </p>



  <table class="tableinfo" >
    <tr id="trdark">
      <td nowrap align="center">
        <div align="right">Product Code :</div>
      </td>
      <td nowrap align="center">
        <div align="left">
          <input type="text" name="E01DEAPRO" size="4" maxlength="3" readonly >
        </div>
      </td>
    </tr>
    <tr id="trclear">
      <td nowrap align="center">
        <div align="right">Participation Number :</div>
      </td>
      <td nowrap align="center">
        <div align="left">
          <input type="text" name="E01DEAPAC" size="12" maxlength="9" onKeyPress="enterInteger()" >
          <a href="javascript:GetAccount('E01DEAPAC','','10','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
        </div>
      </td>
    </tr>
    <tr id="trdark">
      <td nowrap align="center">
        <div align="right">Reference Number :</div>
      </td>
      <td nowrap align="center">
        <div align="left">
          <input type="text" name="E01DEAACC" size="12" maxlength="9" onKeyPress="enterInteger()" >
        </div>
      </td>
    </tr>
  </table>




  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF">
      <td width="33%">
        <div align="center">
          <input id="EIBSBTN" type=button name="Button" value="Button" onClick="CheckACC()">
        </div>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td>
        <div align="center"> </div>
      </td>
    </tr>
  </table>
  <p>
    <script language="JavaScript">
  document.forms[0].E01DEAPAC.focus();
  document.forms[0].E01DEAPAC.select();
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
  </p>
</form>
</body>
</html>
