<%@ taglib uri="/WEB-INF/display.tld" prefix="display" %>
<html>
<head>
<title>Groups</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>


<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<br><br><br>


<H3 align="center">Select Group <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="EODPDF_groups_list_view.jsp, JSEODPDF"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEODPDF" >
  	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  
	<table align="center" border=1 CELLSPACING=0 CELLPADDING=0 width="70%" bordercolor="#6684A3" style="border-collapse: collapse" >
    	<tr>
			<td>
				<display:table  width="100%" name="groupList" property="list" scope="session" pagesize="33" decorator="datapro.eibs.beans.WEODPDF">
  					<display:column property="group" 		align="center" title="Group"/> 
  					<display:column property="name" 		align="left" title="Name"/> 
				</display:table> 
			</td>
		</tr>
	</table>	

	<br>

	<table class="tbenter" width=100% align=center>
		<tr> 
	        <td><div align="center"><input id="EIBSBTN" type=submit name="Accept" value="Accept"></div></td>
			<td><div align="center"><input id="EIBSBTN" type=button name="Exit" value="Exit" onClick="window.location.href='<%=request.getContextPath()%>/pages/background.jsp'"></div></td>
	    </tr>
	</table>
  
</form>
</body>
</html>
