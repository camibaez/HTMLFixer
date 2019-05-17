<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>

<html>
<head>

<title>Assign Accounts to Cards Confirmation</title>

<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "card" class= "datapro.eibs.beans.ECC005001Message" scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT LANGUAGE="javascript">

 	setTimeout(redirect(), 5000);

 	function finish(){
 		self.window.location.href = "<%=request.getContextPath()%>/pages/background.jsp";
 	}
 	
 	function redirect() {
 		self.window.location.href = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC0050?SCREEN=10";
 	}
 
</SCRIPT>

</head>
<body>

<% 
 	if ( !error.getERRNUM().equals("0")  ) {
 		error.setERRNUM("0");
    	out.println("<SCRIPT Language=\"Javascript\">");
     	out.println("       showErrors()");
     	out.println("</SCRIPT>");
 	} 
%> 

<h3 align="center">
	Card Activation Confirmation<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="card_activation_confirm.jsp, ECC0050"></h3> 
<hr size="4">

<FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC0050" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="">
	<table class="tableinfo">
    	<tr > 
      		<td><p align="center">&nbsp; </p>
	        	<table width="100%">
	          		<tr>
	            		<td width="9%">&nbsp;</td>
	            		<td width="91%"><div align="center"> </div></td>
	          		</tr>
	          		<tr>
	            		<td width="9%">&nbsp;</td>
	            		<td width="91%">&nbsp;</td>
	          		</tr>
	          		<tr>
	            		<td width="9%">&nbsp;</td>
	            		<td width="91%">Card Number : <%= Util.justifyRight(card.getE01CCMPCN().trim(), 9) %> 
	              			<input type=HIDDEN name="E01CCMPCN" value="<%= card.getE01CCMPCN()%>">
	            		</td>
	          		</tr>
	          		<tr>
	            		<td width="9%">&nbsp;</td>
	            		<td width="91%">&nbsp;</td>
	          		</tr>
	          		<tr>
	            		<td height="35" width="9%">&nbsp;</td>
	            		<td height="35" width="91%"></td>
	          		</tr>
	          		<tr>
	            		<td width="9%">&nbsp;</td>
	            		<td width="91%"></td>
	          		</tr>
	          		<tr>
	            		<td width="9%">&nbsp;</td>
	            		<td width="91%"></td>
	          		</tr>
	          		<tr>
	            		<td width="9%">&nbsp;</td>
	            		<td width="91%">&nbsp;</td>
	          		</tr>
	          		<tr>
	            		<td width="9%">&nbsp;</td>
	            		<td width="91%"><div align="center">The Debit Card has been processed successfully, please approve this activation.</div></td>
	          		</tr>
	        	</table>
      		</td>
		</tr>
	</table>
  
  <p align="center">&nbsp; </p><div align="center"> </div>
  
</form>
</body>
</html>
