<html>
<head>
<title>Safe Deposit Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import ="datapro.eibs.master.Util" %>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "msgCC" 	class= "datapro.eibs.beans.ECRA02001Message"  	scope="session" />
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

<H3 align="center">County Codes by State<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="county_codes_enter, ECRA020"></H3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECRA020">
 
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  
  <table class="tableinfo">
   <tr> 
   <td>
    <table cellspacing=0 cellpadding=2 width="100%" border="0">    
     	
      	<tr id=trclear> 
	      <td nowrap> 
	        <div align="right">FIPS State Code : </div>
	      </td>
			<td nowrap colspan="3">
				<div align="left">
					<input type="text" name="E01CRCSTC" size="6" maxlength="5" value="<%= msgCC.getE01CRCSTC() %>"> 
					<a href="javascript:GetCodeCNOFC_St_FIPS('E01CRCSTC','','27')"> <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></a> 
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
