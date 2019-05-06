<html>
<head>
<title>Safe Deposit Maintenance</title>
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

<H3 align="center">MSA Codes by State<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="MSA_codes_enter, ECRA030"></H3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECRA030">
 
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="100">
  
  <table class="tableinfo">
   <tr> 
   <td>
    <table cellspacing=0 cellpadding=2 width="100%" border="0">    
     	
      	<tr id=trclear> 
	      <td nowrap> 
	        <div align="right">FIPS  State Code : </div>
	      </td>
			<td nowrap colspan="3">
				<div align="left">
					<input type="text" name="E01CRMSTC" size="6" maxlength="5" value="<%= msgMSA.getE01CRMSTC() %>"> 
					<a href="javascript:GetCodeCNOFC_St_FIPS('E01CRMSTC','','27')"> <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></a> 
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
