<html>
<head>
<title>Search Wait</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<SCRIPT language="JavaScript">
function redirectURL() {
  var target = <%= request.getParameter("URL").replace('@', '&') %>;
  window.location.href=target;
}
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" onLoad="redirectURL()">
<table border="0" cellspacing="0" cellpadding="0" style="background-repeat:no-repeat; background-attachement:fixed;" align="center" width="100%" vspace="0" hspace="0" height="100%">
  <tr> 
    <td height="356"> 
      <table width="350" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr> 
          <td height="50" width="51">&nbsp;</td>
          <td width="258" height="3"> 
            <div align="center"><img src="<%=request.getContextPath()%>/images/search.gif" width="65" height="65"></div>
          </td>
          <td width="41" height="3"><font size="4"></font></td>
        </tr>
        <tr> 
          <td height="50" width="51"> 
            <div align="right"><img src="<%=request.getContextPath()%>/images/wait.gif" width="30" height="30"></div>
          </td>
          <td width="258" height="32"> 
            <div align="center"><font face="Tahoma, Arial, Garamond, Futura Lt BT, Futura XBlk BT, Futura Md BT, FuturaBlack BT" size="4" color="#000099"><b><font size="5" color="#0066CC">Please 
              Wait </font></b></font></div>
          </td>
          <td width="41" height="32"><img src="<%=request.getContextPath()%>/images/wait.gif" width="30" height="30"></td>
        </tr>
        <tr> 
          <td colspan="3" height="50"> 
            <div align="center"><font face="Tahoma, Arial, Garamond, Futura Lt BT, Futura XBlk BT, Futura Md BT, FuturaBlack BT" size="4" color="#000099"><b><font color="#0066CC">The system 
              is processing your request</font> </b></font></div>
          </td>
        </tr>
      </table>
      <div align="center"> </div>
    </td>
  </tr>
</table>
</body>
</html>
