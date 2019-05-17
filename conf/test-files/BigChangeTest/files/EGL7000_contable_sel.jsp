<html>
<head>       
<title>Ambient selection Countable Previous Year</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import ="datapro.eibs.master.Util" %>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "msgM" class= "datapro.eibs.beans.EGL700001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos"  		scope="session"/>

<% 


	int NEW = 0;
	try { NEW = Integer.parseInt(request.getParameter("NEW"));} catch (Exception e) {}
	if (NEW == 1) {
	msgM.destroy();
	}

   	if (msgM == null) msgM = new datapro.eibs.beans.EGL700001Message();
   	   
%>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
      
 %>
     <SCRIPT Language="Javascript">
            showErrors(); 
     </SCRIPT>
 <%
 }
%>
</head>
<body >

<H3 align="center">Reprocessing Previous Year<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="products,EGL7000"></H3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEGL7000">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="0002">
  <INPUT TYPE=HIDDEN NAME="E01CONLIB" VALUE="Y">
              
     	<h5 align="center">When you press Process button, start reprocessing previous year.<br>
  Reports in user spool is suggested a backup copy.</h5>
     
   
  <p align="center"> 
    <input id="EIBSBTN" type="submit" name="Submit" value="Process">
  </p>
</form>
</body>
</html>
