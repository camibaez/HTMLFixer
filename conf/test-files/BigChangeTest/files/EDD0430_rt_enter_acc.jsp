<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<title>Relaciones entre Cuentas</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />



<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">
  function goAction(op) {
     document.forms[0].opt.value = op;
     var st= trim(document.forms[0].ACCNUM.value);
	 if ( st.length > 0 ) {
          document.forms[0].submit();
     }
     else {
			alert("A valid account number must be entered");
     		document.forms[0].ACCNUM.focus();
     		document.forms[0].opt.value = "0";
     }
  }

  function enter() {
     if (document.forms[0].opt.value =="0") {
     	alert("Select an option before continue");
        return false;
     } else return true;
  }

  function goExit(){
  	window.location.href="<%=request.getContextPath()%>/pages/background.jsp";
  }
</SCRIPT>

</head>

<body>

<h3 align="center">Relations between Accounts<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="rt_enter_acc, EDD0430"></h3>
<hr size="4">
<p>&nbsp;</p>


<form method="post"  action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0430" onsubmit="return(enter());">
<p>
  <input type=HIDDEN name="SCREEN" value="400">
  <INPUT TYPE=HIDDEN NAME="opt" VALUE="0">
</p>
<TABLE class="tbenter">
<TR>

  <TD ALIGN=CENTER width="17%" class=TDBKG>
    <div align=center>
  	  <a href="javascript:goAction(2)"><b>Relationship<BR>Accounts</b></a>
  	<div>
  </TD>
  <TD ALIGN=CENTER width="16%" class=TDBKG>
  	<div align=center >
  	  <a  href="javascript:goAction(5)"><b>Overdraft <br>Protection</b></a>
  	<div>
  </TD>
  <TD ALIGN=CENTER width="16%" class=TDBKG>
   <div align=center>
  	  <a  href="javascript:goExit()"><b>Exit</b></a>
  	<div>
  </TD>
 </TR>
</TABLE>

  <table width="100%" height="40%" class="tbenter">
	<tr >
      <td>
        <table  class="tbenter" width="100%" border="0" cellspacing=0 cellpadding=2>
            <td width="50%">
              <div align="right">Account Number  : </div>
            </td>
            <td width="50%">
              <input type="text" name="ACCNUM" size="10" maxlength="09" onKeypress="enterInteger()">
              <a href="javascript:GetAccount('ACCNUM','','RA','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<script language="JavaScript">
  document.forms[0].ACCNUM.focus();
  document.forms[0].ACCNUM.select();
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
