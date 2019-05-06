<html>
<head>
<title>MSA Codes Basic</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import ="datapro.eibs.master.Util" %>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "msgMSA" 	class= "datapro.eibs.beans.ECRA03001Message"  	scope="session" />
<jsp:useBean id= "error" 	class= "datapro.eibs.beans.ELEERRMessage"  		scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos"  			scope="session"/>

<SCRIPT Language="Javascript">


</SCRIPT>


<% 
if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
%>
<SCRIPT Language="Javascript">
        showErrors();
</SCRIPT>
<%}%>

</head>
<body>

<H3 align="center">MSA/MS Codes Basic<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="MSA_codes_basic, ECRA030"></H3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECRA030">
 
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="400">
  <INPUT TYPE=HIDDEN NAME="E01CRMSTC" VALUE="<%= msgMSA.getE01CRMSTC() %>">
  <INPUT TYPE=HIDDEN NAME="E01CRMSTS" VALUE="<%= msgMSA.getE01CRMSTS() %>">
  <table class="tableinfo">
   <tr> 
   <td>
    <table cellspacing=0 cellpadding=2 width="100%" border="0">    
     	<tr id=trclear> 
	      <td nowrap width="40%"> 
	        <div align="right">MSA Code : </div>
	      </td>
		  <td nowrap width="60%" colspan="7">
		  	<input type="text" name="E01CRMMSA" size="6" maxlength="6" value="<%= msgMSA.getE01CRMMSA() %>" readonly>
			<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" > 
		  </td>
		</tr>
      	<tr id=trdark> 
	      <td nowrap> 
	        <div align="right">Description : </div>
	      </td>
		  <td nowrap colspan="3">
			 <div align="left">
				<input type="text" name="E01CRMDSC" size="52" maxlength="50" value="<%= msgMSA.getE01CRMDSC() %>"> 
				<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0">
			 </div>
		  </td>
	   </tr>
      	<tr id=trclear> 
	      <td nowrap> 
	        <div align="right">FIPS State : </div>
	      </td>
		  <td nowrap colspan="3">
			 <div align="left">
				<input type="text" name="D01STCDSC" size="31" maxlength="30" value="<%= msgMSA.getD01STCDSC() %>" readonly> 
				<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0">
			 </div>
		  </td>
	   </tr>	   
	  </table>
    </td>
   </tr>
  </table>
  <br>
  
  <p align="center"> 
    <input id="EIBSBTN" type="submit" name="Submit" value="Submit">
  </p>
</form>
</body>
</html>
