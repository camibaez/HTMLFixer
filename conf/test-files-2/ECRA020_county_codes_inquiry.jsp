<html>
<head>
<title>Safe Deposit Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import ="datapro.eibs.master.Util" %>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "msgPart" 	class= "datapro.eibs.beans.ECRA02001Message"  	scope="session" />
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

<H3 align="center">County Codes Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="county_codes_inquiry, ECRA020"></H3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECRA020">
 
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="500">
    <INPUT TYPE=HIDDEN NAME="E01SBMBNK" VALUE="<%=msgPart.getE01SBMBNK()%>">
  
  <table class="tableinfo">
   <tr> 
   <td>
    <table cellspacing=0 cellpadding=2 width="100%" border="0">    
     	<tr id=trclear> 
	      <td nowrap width="40%"> 
	        <div align="right">County Code : </div>
	      </td>
		  <td nowrap width="60%" colspan="7"><input type="text"
					name="E01CRCCTC" size="6" maxlength="6"
					value="<%= msgPart.getE01CRCCTC() %>" readonly>
					<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" > 
		  </td>
			</tr>
      	<tr id=trdark> 
	      <td nowrap> 
	        <div align="right">Description : </div>
	      </td>
				<td nowrap colspan="3">
				<div align="left"><input
					type="text" name="E01CRCDSC" size="52" maxlength="50"
					value="<%= msgPart.getE01CRCDSC() %>" readonly> <img
					src="<%=request.getContextPath()%>/images/Check.gif"
					alt="mandatory field" align="absbottom" border="0"></div>
				</td>
			</tr>
     	<TR id=trclear>
	      <td nowrap> 
	        <div align="right">State Alphabetic Code : </div>
	      </td>
				<td nowrap colspan="3">
				<div align="left"><input type="text" name="E01CRCSAC" size="4"
					maxlength="3" value="<%= msgPart.getE01CRCSAC() %>" readonly> <input
					type="text" name="D01STCDSC" size="22" maxlength="20"
					value="<%= msgPart.getD01STCDSC() %>" readonly> <img
					src="<%=request.getContextPath()%>/images/Check.gif"
					alt="mandatory field" align="absbottom" border="0"></div>
				</td>
			</TR>
     	<tr id=trdark> 
	      <td nowrap> 
	        <div align="right">FIPS State Code : </div>
	      </td>
				<td nowrap colspan="3">
				<div align="left"><input type="text" name="E01CRCSTC" size="32"
					maxlength="30" value="<%= msgPart.getE01CRCSTC() %>" readonly> <img
					src="<%=request.getContextPath()%>/images/Check.gif"
					alt="mandatory field" align="absbottom" border="0"></div>
				</td>
			</tr>
      	<tr id=trclear> 
	      <td nowrap> 
	        <div align="right">MSA/MD Code : </div>
	      </td>
				<td nowrap colspan="3">
				<div align="left"><input type="text" name="E01CRCMSA" size="6"
					maxlength="5" value="<%= msgPart.getE01CRCMSA() %>" readonly> <input
					type="text" name="D01MSADSC" size="52" maxlength="50"
					value="<%= msgPart.getD01MSADSC() %>" readonly> <a
					href="javascript:GetCodeMSA('E01CRCMSA','D01MSADSC','')"> <img
					src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"
					align="bottom" border="0"></a> <img
					src="<%=request.getContextPath()%>/images/Check.gif"
					alt="mandatory field" align="absbottom" border="0"></div>
				</td>
			</tr>
			</table>
    </td>
   </tr>
  </table>
  <br>
</form>
</body>
</html>
