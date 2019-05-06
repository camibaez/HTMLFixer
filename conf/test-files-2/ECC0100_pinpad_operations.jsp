<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>
PINpad Operations
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<body >
<% 
 if ( !error.getERRNUM().equals("0")  ) {
 
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
%> 
<h3 align="center">PINpad Operations<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="pinpad_operations.jsp, ECC0100"></h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC010001" id="form1" name="form1" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="30">
<input type="hidden" id="NUSER" name="NUSER" value="<%= currUser.getH01USR()%>">

	<h4>Pinpad</h4>
	<div align="center"> 
		<input type="radio" name="param" onClick="actualizarParametro('0');" selected>Default
		<input type="radio" name="param" onClick="actualizarParametro('1');">New PIN
		<input type="radio" name="param" onClick="actualizarParametro('2');">Reset PIN
		<input type="radio" name="param" onClick="actualizarParametro('3');">Change PIN
	</div>
	<br>
	<div align="center"> 
		<applet code="com.app.class" archive="appletPinpad8.jar" name="KSNCuatro" id="KSNCuatro" width="400" height="100" MAYSCRIPT>
			<PARAM name="parametro" value="0"/>
		</applet>
	</div>

</FORM>

<script type="text/javascript">
function actualizarParametro(param){
	document.applets[0].setValores(param, document.getElementById('NUSER').value);
}
</script>
</BODY>
</HTML>

