<!-- Sample HTML file -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 //EN">
<HTML>
<HEAD>
<TITLE>
Sockect no responding
</TITLE>
<SCRIPT language="JavaScript">
   var newWin
 
   function setLayout() {
 if ( window.name !="main" ){
 		self.moveTo(300,150)
		self.resizeTo(450,430);
  											}
 														}
</SCRIPT>
</HEAD>

<BODY BGCOLOR="#FFFFFF" onLoad="setLayout()">
<table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%">
  <tr>
    <td>
      <table width="400" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr> 
          <td colspan="3" bgcolor="#0078BD" height="17"> 
            <div align="right"><font face="Tahoma, Arial, Garamond, Futura Lt BT, Futura XBlk BT, Futura Md BT, FuturaBlack BT" color="#FFFFFF"><b><font size="3" face="Arial, Helvetica, sans-serif">eIBS</font></b></font></div>
          </td>
        </tr>
        <tr> 
          <td width="69">&nbsp;</td>
          <td width="276"> 
            <div align="center"><img src="<%=request.getContextPath()%>/images/socket_no_response.gif" width="200" height="200"></div>
          </td>
          <td width="55">&nbsp;</td>
        </tr>
        <tr> 
          <td width="69">&nbsp;</td>
          <td width="276">&nbsp;</td>
          <td width="55">&nbsp;</td>
        </tr>
        <tr> 
          <td colspan="3"> 
            <div align="center"><font face="Tahoma, Arial, Garamond, Futura Lt BT, Futura XBlk BT, Futura Md BT, FuturaBlack BT" size="5" color="#0078BD"><b><font size="3">
		Warning:  <br>
		Communication with the server has been lost. 
		If the problem persists, Please contact the system Administrator.
	     </font></b></font></div>
          </td>
        </tr>
        <tr> 
          <td width="69">&nbsp;</td>
          <td width="276">&nbsp;</td>
          <td width="55">&nbsp;</td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</BODY>
</HTML>
