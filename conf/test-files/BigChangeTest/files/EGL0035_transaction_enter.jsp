<html>
<head>
<title>Transactions</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

</head>


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<jsp:useBean id="trMant" class="datapro.eibs.beans.EGL003501Message"  scope="session" />

<body bgcolor="#FFFFFF">

<%

String title = "Multiple Transactions Input";
 if ( session.getAttribute("TARGET") != null && session.getAttribute("TARGET").equals("EGL0035M") ) {
 	title = title + " Monthly";
 } else {
 	if ( session.getAttribute("TARGET") != null && session.getAttribute("TARGET").equals("EGL0035A") ) {
    	title = title + " Years";
    }	
 }
 
%>


<H3 align="center"><%= title %><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="transaction_enter,EGL0035"></H3>

<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEGL0035">

<%
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%>
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
  </p>
  <h4>&nbsp;</h4>
  <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0">
    <tr>
      <td width="50%">
        <div align="right">Batch Number : </div>
      </td>
      <td width="50%">
        <div align="left">
          <input type="text" name="E01BTHNUM" onKeypress="enterInteger()" size="4" maxlength="4" value="<%= trMant.getE01BTHNUM()%>">
          <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom"></div>
      </td>
    </tr>
    <tr>
      <td width="50%">
        <div align="right">Originator Bank Code : </div>
      </td>
      <td width="50%">
        <div align="left">
          <input type="text" name="E01WRKOBK" size="2" maxlength="2" value="<%= trMant.getE01WRKOBK()%>">
          <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom"></div>
      </td>
    </tr>
    <tr>
      <td width="50%">
        <div align="right">Originator Branch : </div>
      </td>
      <td width="50%">
        <div align="left">
          <input type="text" name="E01WRKOBR" onKeypress="enterInteger()" size="3" maxlength="3" value="<%= trMant.getE01WRKOBR()%>">
          <a href="javascript:GetBranch('E01WRKOBR', document.forms[0].E01WRKOBK.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
        </div>
      </td>
    </tr>
  </table>
  <p align="center">
    <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </p>
<script language="JavaScript">
  document.forms[0].E01BTHNUM.focus();
  document.forms[0].E01BTHNUM.select();
</script>

</form>
</body>
</html>
