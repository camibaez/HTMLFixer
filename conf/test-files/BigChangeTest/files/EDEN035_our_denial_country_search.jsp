<%  
response.setHeader("Pragma", "no-cache"); 
response.setDateHeader("Expires", 0); 

response.setHeader("Cache-Control", "no-cache");
response.addHeader("Cache-Control", "max-age=0");
response.addHeader("Cache-Control", "s-maxage=0");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>

<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
 
<TITLE>Conexión</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />

<script language="JavaScript" id="eAction">

function enter(code) {
 	document.forms[0].<%= userPO.getHeader1() %>.value = code;
	document.forms[0].submit();
}
  
function enterAction(code,numc,id,prod,card) {
 	document.forms[0].<%= userPO.getHeader1() %>.value = code;
 	<% if (!userPO.getHeader3().equals("")) {%>
 		document.forms[0].<%= userPO.getHeader3() %>.value = prod;
 	<% } %>
 	<% if (!userPO.getHeader4().equals("")) {%>
 		document.forms[0].<%= userPO.getHeader4() %>.value = id;
 	<% } %>
 	<% if (!userPO.getHeader5().equals("")) {%>
 		document.forms[0].<%= userPO.getHeader5() %>.value = card;
 	<% } %>
 	document.forms[0].SELCLIENT.value = numc;
 	document.forms[0].submit();
}

</script>
 
</HEAD>


<body> 

<h3 align="center">Country Search, states maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="our_denial_country_search, EDEN035"></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.ofac.JSEDEN035" target="_main" >
  <input type="hidden" name="SCREEN" value="2">
  
  <CENTER>  
	   <table  id="TBHELP" align="center" width="370" border="0" cellspacing="0" cellpadding="0">
		<tr>
		  <td nowrap width="10%">Search by country:</td>
		  <td nowrap width="20%" >
		  	<input type="hidden" name="code" value="">
		  	<input type="text" name="country" value="" size="50">
		  </td>
	   	  <td nowrap align="left">
	   	  	<a href="javascript:GetCountryCodeOfacISO('code','country')"><img
					src="<%=request.getContextPath()%>/images/search1.gif" title="Ayuda"
					align="bottom" border="0"></a>
	   	  </td>
    	</tr>
    		 	<tr valign="middle"> 
      		<td nowrap colspan="3" align="center">
          		<div id="DIVSUBMIT" align="center"> 
    				<input id="EIBSBTN" type="submit" name="Submit" value="Submit" >
          		</div>
      		</td>
    	</tr>
 	</table>
 	
 </CENTER>
</FORM>
</BODY>
</HTML>
 