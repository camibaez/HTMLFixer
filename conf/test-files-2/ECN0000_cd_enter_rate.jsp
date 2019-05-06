<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Inquiry</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">

function CheckACC(){
if ( document.forms[0].E01ACMACC.value.length < 1) {
  alert("A valid account number must be entered");
  document.forms[0].E01ACMACC.value='';
  document.forms[0].E01ACMACC.focus();
}
else {
  document.forms[0].submit();
  }
}

</SCRIPT>

</head>



<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<jsp:useBean id="cdRenRat" class="datapro.eibs.beans.ECN0001DSMessage"  scope="session" />

<body bgcolor="#FFFFFF">


<h3 align="center">Rate Table Maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cd_enter_rate.jsp, ECN0000"  ></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000I">
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1400">
  </p>
  <h4>Basic Information</h4>
  <table class="tableinfo" cellspacing=0 cellpadding=0 width="100%" border="0">
    <tr id="trdark"> 
      <td nowrap align="center" height="38" width="34%"> 
        <div align="right">Table Code : </div>
      </td>
      <td nowrap align="center" height="38" width="66%"> 
        <div align="left"> 
          <input type="text" name="E01CDRRTB" size="4" maxlength="2" onKeyPress="enterInteger()">
        </div>
      </td>
    </tr>
    <tr id="trclear"> 
      <td nowrap align="center" height="2" width="34%"> 
        <div align="right">Efective Rate Date :</div>
      </td>
      <td nowrap align="center" height="2" width="66%"> 
        <div align="left">
          <input type="text" name="E01CDRDT1" size="3" maxlength="2" onKeyPress="enterInteger()">
          <input type="text" name="E01CDRDT2" size="3" maxlength="2" onKeyPress="enterInteger()">
          <input type="text" name="E01CDRDT3" size="3" maxlength="2" onKeyPress="enterInteger()">
        </div>
      </td>
    </tr>
    <tr id="trdark">
      <td nowrap align="center" height="2" width="34%">
        <div align="right">Currency :</div>
      </td>
      <td nowrap align="center" height="2" width="66%">
        <div align="left">
          <input type="text" name="E01CDRCCY" size="4" maxlength="3" onKeyPress="enterInteger()">
          <a href="javascript:GetCurrency('E01CDRCCY', '')"> 
          <img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0"  ></a></div>
      </td>
    </tr>
    <tr id="tclear"> 
      <td nowrap align="center" height="2" width="34%"> 
        <div align="right">Base Rate Tier To :</div>
      </td>
      <td nowrap align="center" height="2" width="66%"> 
        <div align="left">
          <input type="text" name="E01CDBRTN" size="3" maxlength="1" onKeyPress="enterInteger()">
        </div>
      </td>
    </tr>
  </table>
  <h4>Copy from </h4>
  <table class="tableinfo" cellspacing=0 cellpadding=0 width="100%" border="0">
    <tr id="trdark"> 
      <td nowrap align="center" height="38" width="34%"> 
        <div align="right">Table Code : </div>
      </td>
      <td nowrap align="center" height="38" width="66%"> 
        <div align="left"> 
          <input type="text" name="E01CFRRTB" size="4" maxlength="2" onKeyPress="enterInteger()">
        </div>
      </td>
    </tr>
    <tr id="trclear"> 
      <td nowrap align="center" height="2" width="34%"> 
        <div align="right">Efective Rate Date :</div>
      </td>
      <td nowrap align="center" height="2" width="66%"> 
        <div align="left">
          <input type="text" name="E01CFRDT1" size="3" maxlength="2" onKeyPress="enterInteger()">
          <input type="text" name="E01CFRDT2" size="3" maxlength="2" onKeyPress="enterInteger()">
          <input type="text" name="E01CFRDT3" size="3" maxlength="2" onKeyPress="enterInteger()">
        </div>
      </td>
    </tr>
    <tr id="trdark"> 
      <td nowrap align="center" height="2" width="34%"> 
        <div align="right">Currency :</div>
      </td>
      <td nowrap align="center" height="2" width="66%"> 
        <div align="left">
          <input type="text" name="E01CFRCCY" size="4" maxlength="3" onKeyPress="enterInteger()">
          <a href="javascript:GetCurrency('E01CFRCCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0"  ></a></div>
      </td>
    </tr>
  </table>
  <br>
  <div align="center"> 
	   <input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="CheckACC()">
  </div>
    <script language="JavaScript">
  document.forms[0].E01ACMACC.focus();
  document.forms[0].E01ACMACC.select();
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
