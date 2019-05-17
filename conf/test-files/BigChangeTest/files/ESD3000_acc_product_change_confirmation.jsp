<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Product Change</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" 	class= "datapro.eibs.beans.ELEERRMessage"  		scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos" 			scope="session" />
<jsp:useBean id= "account" 	class= "datapro.eibs.beans.ESD300001Message"  	scope="session" />

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

<h3 align="center">Product Change Confirmation<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="ESD3000_acc_product_change_confirmation.jsp"></h3>
<hr size="4">

<form method="post"  action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD3000">
   	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
    <INPUT TYPE=HIDDEN NAME="H01FLGWK1" VALUE="1">

  	</p>
	<h4>Basic Information</h4>
	<table class="tableinfo">
	<tr > 
	<td nowrap> 
		<table  class="tbenter" width="100%" height="75%" border="0" cellspacing=0 cellpadding=2>
			<tr>
		    	<td align="right"> 
		        	Client : 
		        </td>
		    	<td align="left"> 
		            <input type="text" name="E01CUSNUM" size="18" readonly value="<%= account.getE01CUSNUM()%>">
		            <input type="text" name="E01CUSNA1" size="35" readonly value="<%= account.getE01CUSNA1()%>">
		    	</td>
		    </tr>
			<tr>
		    	<td align="right"> 
		        	Account Number : 
		        </td>
		    	<td align="left"> 
		            <input type="text" name="E01OLDACC" size="18" readonly value="<%= account.getE01OLDACC()%>">
		    	</td>
		    </tr>
		    <tr>
		    	<td align="right"> 
		              General Ledger :
		        </td>
		    	<td align="left"> 
					<input type="text" name="E01OLDGLN" size="18" readonly value="<%= account.getE01OLDGLN()%>">
		            <input type="text" name="E01OGLNDE" size="35" readonly value="<%= account.getE01OGLNDE()%>">
		        </td>
		    </tr>
		</table>
	</td>
	</tr>
	</table>
	<h4>Previous Information</h4>
	<table class="tableinfo">
	<tr > 
	<td nowrap> 
		<table  class="tbenter" width="100%" height="75%" border="0" cellspacing=0 cellpadding=2>
			<tr>
		    	<td align="right"> 
		              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		              Product :
		        </td>
		    	<td align="left"> 
					<input type="text" name="E01OLDPRD" size="5" readonly value="<%= account.getE01OLDPRD()%>">
		            <input type="text" name="E01OPRDNA" size="50" readonly value="<%= account.getE01OPRDNA()%>">
		        </td>
		    </tr>
		</table>
	</td>
	</tr>
	</table>
	<h4>New Information</h4>
	<table class="tableinfo">
	<tr > 
	<td nowrap> 
		<table  class="tbenter" width="100%" height="75%" border="0" cellspacing=0 cellpadding=2>
		    <tr>
		    	<td align="right"> 
		              Product :
		        </td>
		    	<td align="left"> 
		    		<input type="text" name="E01NEWPRD" size="5" readonly value="<%= account.getE01NEWPRD()%>">
		            <input type="text" name="E01NPRDNA" size="50" readonly value="<%= account.getE01NPRDNA()%>">
		        </td>
		    </tr>
		    <tr>
		    	<td align="right"> 
		              General Ledger :
		        </td>
		    	<td align="left"> 
					<input type="text" name="E01NEWGLN" size="16" readonly value="<%= account.getE01NEWGLN()%>">
		            <input type="text" name="E01NGLNDE" size="39" readonly value="<%= account.getE01NGLNDE()%>">
		        </td>
		    </tr>
		</table>
	</td>
	</tr>
	</table>
  	<p align="center"> 
		<input id="EIBSBTN" type="submit" name="Submit" value="Confirm">
	</p>            
      
</form>
</body>
</html>