<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page	language="java" contentType="text/html; charset=ISO-8859-1"	pageEncoding="ISO-8859-1"%>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/pages/style.css" type="text/css" rel="stylesheet">
<title>Forms Directory Search for e-IBS</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>

<body>

<SCRIPT SRC="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<h3 align="center">Forms Directory Search for e-IBS
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="form_dir_search.jsp, ESD0742"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSESD0742">
<INPUT TYPE=HIDDEN NAME="SCREEN" value="200">

<table class="tableinfo">
	<tr id="trdark">
		<td nowrap>
			<table cellspacing="0" cellpadding="2" width="100%" border="0">
          		<tr id="trdark"> 
            		<td nowrap width="50%"><div align="right">Product Code:</div></td>
            		<td nowrap width="50%"> 
              			<div align="left"> 
                			<input type="text" name="E01APFPRO" size="6" maxlength="4" value="">
                			<input type="text" readonly name="E01APFDSC" size="40" maxlength="35" value="">
		    				<A HREF="javascript:GetProductFamily('E01APFPRO','','E01APFDSC')"> 
		    					<IMG SRC="<%=request.getContextPath()%>/images/1b.gif" title="Help" BORDER="0"></A>
              			</div>
            		</td>
				</tr>
          		<tr id="trclear"> 
            		<td nowrap width="50%"><div align="right">Form Type :</div></td>
            		<td nowrap width="50%"> 
              			<div align="left"> 
				              <select name="E01APFFTY" >
				                <option value="AA">Application</option>
				                <option value="01" selected>Opening</option>
				                <option value="02">Change Rate</option>
				                <option value="03">Rollover</option>
				                <option value="04">Payment</option>
				                <option value="05">Cancelation</option>
				                <option value="XX">Generic</option>
				              </select>
              			</div>
            		</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<br>
   
<p align="center"><input id="EIBSBTN" type=submit name="Submit" value="Submit"></p>

</form>
</body>
</html>