<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

</head>


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<body >
<%
 if ( !error.getERRNUM().equals("0")  )
 {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }

%>
<H3 align="center">Checkstubs Manager<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="rt_enter_maint,ECH0000"></H3>
<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECH0000">
  <h4>&nbsp;</h4>
  <Center>
  <TABLE border="1">
    <TBODY>
    <tr>
      <td nowrap width="50%"><div align="right">Account Number : </div></td>
      <td nowrap width="50%"><input type="text" name="E01ACMACC" size="12" maxlength="12" onKeypress="enterInteger()"><a href="javascript:GetAccount('E01ACMACC','','RA','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a></td>
    </tr>
    <TR id="trclear">
        <TD align="right">Customization of Checkbook</TD>
        <TD><INPUT type="radio" name="SCREEN" value="400"></TD>
    </TR>
    <TR id="trclear">
        <TD align="right">Checkbook Request</TD>
        <TD><INPUT type="radio" name="SCREEN" value="401"></TD>
    </TR>
    <TR id="trclear">
        <TD align="right">Approbal and Rejection</TD>
        <TD><INPUT type="radio" name="SCREEN" value="402"> </TD>
    </TR>
    <TR id="trclear">
        <TD align="right">Receipt of Checkbooks</TD>
        <TD><INPUT type="radio" name="SCREEN" value="403"> </TD>
    </TR>
    </TBODY>
</TABLE>

<p align="center">
   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
</p>

</form>
</body>
</html>
