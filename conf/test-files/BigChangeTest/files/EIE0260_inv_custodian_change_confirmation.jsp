<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Investment Custodian Change</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" 	class= "datapro.eibs.beans.ELEERRMessage"  		scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos" 			scope="session" />
<jsp:useBean id= "invTrade" 	class= "datapro.eibs.beans.EIE026001Message"  	scope="session" />

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

<h3 align="center">Investment Custodian Change Confirmation<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="EIE0260_inv_custodian_change_confirmation.jsp"></h3>
<hr size="4">

<form method="post"  action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0260">
   	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="400">
    <INPUT TYPE=HIDDEN NAME="H01FLGWK1" VALUE="3">

 
	<h4>Basic Information</h4>
	<table class="tableinfo">
	 <tr > 
	  <td nowrap> 
		<table  class="tbenter" width="100%" height="75%" border="0" cellspacing=0 cellpadding=2>
			
			<tr>
		    	<td align="right"> 
		        	Instrument Code : 
		        </td>
		    	<td align="left"> 
		            <input type="text" name="E01ISIIIC" size="10" readonly value="<%= invTrade.getE01ISIIIC()%>">
		            <input type="text" name="E01ISIDSC" size="45" readonly value="<%= invTrade.getE01ISIDSC()%>">
		    	</td>
		    </tr>
		    <tr>
		    	<td align="right"> 
		        	Type : 
		        </td>
		    	<td align="left"> 
		            <input type="text" name="E01ISIPTY" size="4" readonly value="<%= invTrade.getE01ISIPTY()%>">
		    	</td>
		    	<td align="right"> 
		        	Currency : 
		        </td>
		    	<td align="left"> 
		            <input type="text" name="E01ISICCY" size="4" readonly value="<%= invTrade.getE01ISICCY()%>">
		    	</td>
		    </tr>
		    
			<tr>
		    	<td align="right"> 
		    	 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        	Portfolio : 
		        </td>
		    	<td align="left"> 
		            <input type="text" name="E01ORDPRF" size="10" readonly value="<%= invTrade.getE01ORDPRF()%>">
		            <input type="text" name="E01PRFDSC" size="45" readonly value="<%= invTrade.getE01PRFDSC()%>">
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
		              Custodian :
		        </td>
		    	<td align="left"> 
					<input type="text" name="E01OLDCUN" size="5" readonly value="<%= invTrade.getE01OLDCUN()%>">
		            <input type="text" name="E01OLDNM1" size="45" readonly value="<%= invTrade.getE01OLDNM1()%>">
		        </td>
		    </tr>
		    
		    <tr>
		    	<td align="right"> 
		              Bank :
		        </td>
		    	<td align="left"> 
					<input type="text" name="E01OLDCBK" size="4" readonly value="<%= invTrade.getE01OLDCBK()%>">		             
		        </td>
		        <td align="right"> 
		              Branch :
		        </td>
		    	<td align="left"> 					 
		            <input type="text" name="E01OLDCBR" size="4" readonly value="<%= invTrade.getE01OLDCBR()%>">
		        </td>
		        <td align="right"> 
		              Currency :
		        </td>
		    	<td align="left"> 					 
		            <input type="text" name="E01OLDCCY" size="4" readonly value="<%= invTrade.getE01OLDCCY()%>">
		        </td>
		    </tr>
		    <tr>
		    	<td align="right"> 
		              General Ledger :
		        </td>
		    	<td align="left"> 
					<input type="text" name="E01OLDCGL" size="16" readonly value="<%= invTrade.getE01OLDCGL()%>">		             
		        </td>
		        <td align="right"> 
		              Account :
		        </td>
		    	<td align="left"> 
					<input type="text" name="E01OLDCAC" size="16" readonly value="<%= invTrade.getE01OLDCAC()%>">		             
		        </td>
		    </tr>
		    <tr>
		    <td align="right"> 
		              Balance :
		        </td>
		    	<td align="left"> 
					<input type="text" name="E01POSBAL" size="16" readonly value="<%= invTrade.getE01POSBAL()%>">		             
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
		              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		              Custodian :
		        </td>
		    	<td align="left"> 
					<input type="text" name="E01NEWCUN" size="5" readonly value="<%= invTrade.getE01NEWCUN()%>">
		            <input type="text" name="E01NEWNM1" size="45" readonly value="<%= invTrade.getE01NEWNM1()%>">
		        </td>
		    </tr>
		    
		    <tr>
		    	<td align="right"> 
		              Bank :
		        </td>
		    	<td align="left"> 
					<input type="text" name="E01NEWCBK" size="4" readonly value="<%= invTrade.getE01NEWCBK()%>">		             
		        </td>
		        <td align="right"> 
		              Branch :
		        </td>
		    	<td align="left"> 					 
		            <input type="text" name="E01NEWCBR" size="4" readonly value="<%= invTrade.getE01NEWCBR()%>">
		        </td>
		        <td align="right"> 
		              Currency :
		        </td>
		    	<td align="left"> 					 
		            <input type="text" name="E01NEWCCY" size="4" readonly value="<%= invTrade.getE01NEWCCY()%>">
		        </td>
		    </tr>
		    <tr>
		    	<td align="right"> 
		              General Ledger :
		        </td>
		    	<td align="left"> 
					<input type="text" name="E01NEWCGL" size="16" readonly value="<%= invTrade.getE01NEWCGL()%>">		             
		        </td>
		        <td align="right"> 
		              Account :
		        </td>
		    	<td align="left"> 
					<input type="text" name="E01NEWCAC" size="16" readonly value="<%= invTrade.getE01NEWCAC()%>">		             
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
