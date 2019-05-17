<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page	language="java" contentType="text/html; charset=ISO-8859-1"	pageEncoding="ISO-8859-1"%>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/pages/style.css" type="text/css" rel="stylesheet">
<title>Forms Repository Attachment for e-IBS</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "dir" class= "com.datapro.generic.beanutil.BeanList"  scope="session" />
<jsp:useBean id= "msg" class= "datapro.eibs.beans.ESD074201Message"  scope="session" />

<body>

<SCRIPT SRC="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<%
	String readonly = "0001".equals(msg.getH01OPECOD()) ? "" : "readonly"; 
	String title = "0001".equals(msg.getH01OPECOD()) ? "New" : "Maintenance";
%>

<script language="JavaScript">
	function goExit() {
  		window.location.href="<%=request.getContextPath()%>/pages/background.jsp";
  	}  
</SCRIPT>  

<h3 align="center">Forms Repository Attachment for e-IBS 
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="form_dir_maintenance.jsp, ESD0742"></h3>
<hr size="4">

<% 
 	if ( !error.getERRNUM().equals("0")  ) {
     	error.setERRNUM("0");
     	out.println("<SCRIPT Language=\"Javascript\">");
     	out.println("       showErrors()");
     	out.println("</SCRIPT>");
    }

%> 


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSESD0742">
<INPUT TYPE=HIDDEN NAME="SCREEN" value="400">
<INPUT TYPE=HIDDEN NAME="H01OPECOD" value="<%=msg.getH01OPECOD()%>">

<table class="tableinfo">
	<tr id="trdark">
		<td nowrap>
			<table cellspacing="0" cellpadding="2" width="100%" border="0">
          		<tr id="trdark"> 
            		<td nowrap width="50%"><div align="right">Product Code :</div></td>
            		<td nowrap width="50%"> 
              			<div align="left"> 
                			<input type="text" readonly name="E01APFPRO" size="6" maxlength="4" value="<%= msg.getE01APFPRO().trim()%>">
                			<input type="text" readonly name="D01DSCPRO" size="40" maxlength="35" value="<%= msg.getD01DSCPRO().trim()%>">
              				<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  > 
                			<font color="blue"><b>(<%=title%>)</b></font>
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
          		<tr id="trdark"> 
            		<td nowrap width="50%"><div align="right">Form Code :</div></td>
            		<td nowrap width="50%"> 
              			<div align="left"> 
                			<input type="text" <%=readonly%> name="E01APFFCD" size="18" maxlength="15" value="<%= msg.getE01APFFCD().trim()%>">
              				<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  > 
              			</div>
            		</td>
				</tr>
          		<tr id="trclear"> 
            		<td nowrap width="50%"><div align="right">Description :</div></td>
            		<td nowrap width="50%"> 
              			<div align="left"> 
                			<input type="text" name="E01APFDSC" size="40" maxlength="35" value="<%= msg.getE01APFDSC().trim()%>">
              			</div>
            		</td>
				</tr>
          		<tr id="trdark"> 
            		<td nowrap width="50%"><div align="right">Remote Address:</div></td>
            		<td nowrap width="50%"> 
              			<div align="left"> 
                      		<select name="E01APFPTH">
                      			<option value="" selected >&nbsp;</option>
<%
								dir.initRow();
								while (dir.getNextRow()) {
								 	String path = dir.getRecord().toString();
%>                      		
                      				<option value="<%= path %>" <% if (path.trim().toUpperCase().equals(msg.getE01APFPTH().trim())) {out.print("selected");} %>><%= path %></option>
<%
								} 
%>                      			
                      		</select>
              			</div>
            		</td>
				</tr>
          		<tr id="trclear"> 
            		<td nowrap width="50%"><div align="right">Copies :</div></td>
            		<td nowrap width="50%"> 
              			<div align="left"> 
                			<input type="text" name="E01APFCPI" size="4" maxlength="2" value="<%= msg.getE01APFCPI().trim()%>">
              			</div>
            		</td>
				</tr>
          		<tr id="trdark"> 
            		<td nowrap width="50%"><div align="right">Operation Code :</div></td>
            		<td nowrap width="50%"> 
              			<div align="left"> 
                			<select name="E01APFOPE">
                				<option value="1" <% if ("1".equals(msg.getE01APFOPE())) {out.print("selected");} %>>Form in Screen</option>
                				<option value="2" <% if ("2".equals(msg.getE01APFOPE())) {out.print("selected");} %>>Form in Printer</option>
                				<option value="3" <% if ("3".equals(msg.getE01APFOPE())) {out.print("selected");} %>>Complete Form</option>
                			</select>
              			</div>
            		</td>
				</tr>

          		<tr id="trclear"> 
            		<td nowrap width="50%"><div align="right">Interface :</div></td>
            		<td nowrap width="50%"> 
              			<div align="left"> 
                			<select name="E01APFIFS">
                				<option value=" " <% if (" ".equals(msg.getE01APFIFS())) {out.print("selected");} %>>Standard Form</option>
                				<option value="B" <% if ("B".equals(msg.getE01APFIFS())) {out.print("selected");} %>>Bankers</option>
                				<option value="P" <% if ("P".equals(msg.getE01APFIFS())) {out.print("selected");} %>>eIBS-PDF</option>
                			</select>
              			</div>
            		</td>
				</tr>

			</table>
		</td>
	</tr>
</table>

<br>
   
<p align="center">
	<input id="EIBSBTN" type=submit name="Submit" value="Submit">
	<input id="EIBSBTN" type="button" name="Cancel" value="Cancel" onclick="goExit()">
</p>

</form>
</body>
</html>