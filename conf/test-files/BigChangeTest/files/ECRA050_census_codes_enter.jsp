<html>
<head>
<title>Safe Deposit Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import ="datapro.eibs.master.Util" %>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "msgCT" 	class= "datapro.eibs.beans.ECRA05001Message"  	scope="session" />
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

<H3 align="center">Census Tract Codes<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="census_codes_enter, ECRA050"></H3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECRA050">
 
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  
  <table class="tableinfo">
   <tr> 
   <td>
    <table cellspacing=0 cellpadding=2 width="100%" border="0">    
     	
      	<tr id=trdark> 
	      <td nowrap> 
	        <div align="right">FIPS State Code : </div>
	      </td>
			<td nowrap colspan="3">
				<div align="left">
					<input type="text" name="E01CRUSTC" size="6" maxlength="5" value="<%= msgCT.getE01CRUSTC() %>"> 
					<a href="javascript:GetCodeCNOFC_St_FIPS('E01CRUSTC','','27')"> <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></a> 
					<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" >
				</div>
			</td>
		</tr>
      	<tr id=trclear> 
	      <td nowrap> 
	        <div align="right">FIPS County Code : </div>
	      </td>
			<td nowrap colspan="3">
				<div align="left">
					<input type="text" name="E01CRUCTC" size="6" maxlength="5" value="<%= msgCT.getE01CRUCTC() %>"> 
					<a href="javascript:GetCodeCounty('E01CRUCTC','',document.forms[0].E01CRUSTC.value)"> <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></a> 
					<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" >
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
