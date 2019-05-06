<html>
<head>
<title>Transmittal Sheet</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import ="datapro.eibs.master.Util" %>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "msgPart" 	class= "datapro.eibs.beans.ECRA00001Message"  	scope="session" />
<jsp:useBean id= "error" 	class= "datapro.eibs.beans.ELEERRMessage"  		scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos"  			scope="session"/>

<SCRIPT Language="Javascript">
function enterAction(code,numc,id,prod,card,apc) {
	
	if (card =="") 
		document.forms[0].fieldName.value = code; 
	else 
		document.forms[0].fieldName.value = card;
 }
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

<H3 align="center">Transmittal Sheet<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="transmittal_sheet, ECRA000"></H3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECRA000">
 
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="500">
  
  <table class="tableinfo">
   <tr> 
   <td>
    <table cellspacing=0 cellpadding=2 width="100%" border="0">    
     	<tr id=trclear> 
	      <td nowrap width="40%"> 
	        <div align="right">Bank : </div>
	      </td>
		  <td nowrap width="60%">
		  		<input type="text" name="E01CRTBNK" size="6" maxlength="6"
					value="<%= userPO.getHeader1() %>" readonly>
				<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" > 
		  </td>
			</tr>
      	<tr id=trdark> 
	      <td nowrap> 
	        <div align="right">Agency Code : </div>
	      </td>
				<td nowrap>
				<div align="left">				
		  		<input type="text" name="E01CRTAGC" size="6" maxlength="6"
					value="<%= msgPart.getE01CRTBNK() %>">
					<A href="javascript:GetCode('E01CRTAGC','STATIC_agencies_codes.jsp')">
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></A>
					<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" > 
				</div>
				</td>
			</tr>
     	<TR id=trclear>
	      <td nowrap> 
	        <div align="right">Tax ID: </div>
	      </td>
				<td nowrap >
				<div align="left"><input type="text" name="E01CRTTI1" size="3"
					maxlength="2" value="<%= msgPart.getE01CRTTI1() %>"> <input
					type="text" name="E01CRTTI2" size="8" maxlength="7"
					value="<%= msgPart.getE01CRTTI2() %>">
					<img src="<%=request.getContextPath()%>/images/Check.gif"
					alt="mandatory field" align="absbottom" border="0">
				</div>
				</td>
			</TR>
	</table>
		</td>
	</tr>
</table> 
	<h4>Respondent Information</h4>
	<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%"border="0">
	<tr id="trdark">
		<td nowrap width="25%">
			<div align="right">Respondent ID :</div>
		</td>
		<td nowrap width="20%">
			<input type="text" name="E01CRTRID" size="11" maxlength="10" value="<%=msgPart.getE01CRTRID().trim()%>">
	  	</td>      
	</tr>
	<tr id="trclear">
		<td nowrap width="25%">
		<div align="right">Name :</div>
		</td>
		<td nowrap width="20%"><input type="text" name="E01CRTRNM" size="32" maxlength="30" value="<%=msgPart.getE01CRTRNM().trim()%>">
	   </td>  
	</tr>	
	<tr id="trdark">
		<td nowrap width="25%">
		<div align="right">Address  :</div>
		</td>
		<td nowrap width="20%"><input type="text" name="E01CRTRAD" size="42" maxlength="40" value="<%=msgPart.getE01CRTRAD().trim()%>">
		</td>  
	</tr>
	<tr id="trclear">
		<td nowrap width="25%">
		    <div align="right">City :</div>
		</td>
		<td nowrap width="20%"><input type="text" name="E01CRTRCY" size="26" maxlength="25" value="<%=msgPart.getE01CRTRCY().trim()%>" >
		     &nbsp;
		</td>
	</tr>	
     	<TR id=trdark>
	      <td nowrap> 
	        <div align="right">State : </div>
	      </td>
				<td nowrap >
				<div align="left"><input
					type="text" name="E01CRTRST" size="3" maxlength="2"
					value="<%= msgPart.getE01CRTRST() %>"><A
					href="javascript:GetCodeCNOFC('E01CRTRST','27')"><IMG
					src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"
					align="bottom" border="0"></A></div>
				</td>
			</TR>	
	<tr id="trclear">
		<td nowrap width="25%">
		    <div align="right">Zip  Code :</div>
		</td>
		<td nowrap width="20%">
				<div align="left"><input type="text" name="E01CRTRZ1" size="5"
					maxlength="5" value="<%= msgPart.getE01CRTRZ1() %>"> <input
					type="text" name="E01CRTRZ2" size="4" maxlength="4"
					value="<%= msgPart.getE01CRTRZ2() %>"><A
					href="javascript:GetLocations('E01SBMLOC','D01LOCNME')"></A></div>
		</td>
	</tr>		

</table>
	<h4>Contact Information</h4>
	<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%"border="0">
	
	<tr id="trdark">
		<td nowrap width="25%">
		<div align="right">Name :</div>
		</td>
		<td nowrap width="20%"><input type="text" name="E01CRTCNM" size="32" maxlength="30" value="<%=msgPart.getE01CRTCNM().trim()%>">
	   </td>  
	</tr>	
	<tr id="trclear">
		<td nowrap width="25%">
		    <div align="right">Phone   Number :</div>
		</td>
		<td nowrap width="20%">
				<div align="left">
					<input type="text" name="E01CRTCP1" size="3"
					maxlength="3" value="<%= msgPart.getE01CRTCP1() %>">
					<input type="text" name="E01CRTCP2" size="3" maxlength="3"
					value="<%= msgPart.getE01CRTCP2() %>">
					<input type="text" name="E01CRTCP3" size="4" maxlength="4"
					value="<%= msgPart.getE01CRTCP3() %>">
					<A href="javascript:GetLocations('E01SBMLOC','D01LOCNME')"></A>
				</div>
		</td>
	</tr>		
	<tr id="trdark">
		<td nowrap width="25%">
		    <div align="right">Fax   Number :</div>
		</td>
		<td nowrap width="20%">
				<div align="left">
					<input type="text" name="E01CRTCF1" size="3"
					maxlength="3" value="<%= msgPart.getE01CRTCF1() %>">
					<input type="text" name="E01CRTCF2" size="3" maxlength="3"
					value="<%= msgPart.getE01CRTCF2() %>">
					<input type="text" name="E01CRTCF3" size="4" maxlength="4"
					value="<%= msgPart.getE01CRTCF3() %>">
					<A href="javascript:GetLocations('E01SBMLOC','D01LOCNME')"></A>
				</div>
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
