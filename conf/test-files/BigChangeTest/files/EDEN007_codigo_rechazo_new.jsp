<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<link rel="stylesheet" href="../../theme/Master.css" type="text/css">
<title>EDEN007_codigo_rechazo_new</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</head>

<body>
<h3 align="center">New - Rejection Codes</h3>

<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.ofac.JSEDEN007">

  <INPUT TYPE=HIDDEN id="SCREEN" NAME="SCREEN" VALUE="5">
  
  <h4>Basic Information  </h4>
<TABLE class="tableinfo"> 
	<TR class="trdark">
		<TD align="right" width="10%">Enter  code: </TD>
		<TD align="left" width="100%">
			<input type="text" id="E01DTCCDE" name="E01DTCCDE" size="8" maxlength="5" value=""> </TD> 
		</TR>
	<TR class="clear">
		<TD align="right" width="20%">   Description       : </TD>
		<TD align="left" width="20%">
		    <input type="text" id="E01DTCDSC" name="E01DTCDSC" size="65" maxlength="60" value=""> </TD>
	  	
	</TR>
</TABLE>
		<p align=center> 
			<div id=DIVSUBMIT align="center"> 
			<input id="EIBSBTN" type=submit name="Submit" value="Submit" >
	  		</div>
  		</p>
</form>
</body>
</html>