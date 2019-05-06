<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Corporative Customer Confirmation </title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">

<jsp:useBean id= "prog" class= "java.lang.String"  scope="session" />
<jsp:useBean id= "param" class= "java.lang.String"  scope="session" />

<meta http-equiv="Refresh" CONTENT="2;url='<%=request.getContextPath()%>/pages/background.jsp">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<SCRIPT SRC="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.js"> </SCRIPT>

</head>

<body>

 
<h3 align="center">&nbsp;<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="GENERIC_trade_bridge" ></h3>
<hr size="4">

<OBJECT
	  classid="clsid:8D993778-3E17-4145-9312-30796B0DBF5D"
	  codebase="<%=request.getContextPath()%>/pages/e/activex/eIBSBridgeProj.ocx#version=1,0,34,0"
	  width=0%
	  height=0%
	  align=left
	  hspace=0
	  vspace=0
>
	<PARAM NAME="ProgName" VALUE="<%= prog %>"> 
	<PARAM NAME="ProgParam" VALUE="<%= param %>">
</OBJECT>

<br>

<table border="0" cellspacing="0" cellpadding="0" style="background-repeat:no-repeat; background-attachement:fixed; background-color: #ffffff" align="center" width="100%" vspace="0" hspace="0" height="100%">
  <tr valign="middle" align="center"> 
    <td> 
      <table width="350" border="0" cellspacing="0" cellpadding="0" align="center" style="background-color: #ffffff">
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
            <div align="center"><font face="Tahoma, Arial, Garamond, Futura Lt BT, Futura XBlk BT, Futura Md BT, FuturaBlack BT" size="4" color="#000099"><b><font color="#0066CC" size="5">Please, wait... 
              </font></b></font></div>
          </td>
          <td width="41" height="32"><img src="<%=request.getContextPath()%>/images/wait.gif" width="30" height="30"></td>
        </tr>        
      </table>
      <div align="center"> </div>
    </td>
  </tr>
</table>

</body>
</html>
