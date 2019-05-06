<!-- Sample HTML file -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>
Downloads
</TITLE>
<LINK href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet" type="text/css">

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="javascript">
 function showReceipt() {
	var page="";
	var receiptwin = null;
	page= "<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0160B?product=<%=userPO.getProdCode()%>&account=<%=userPO.getAccNum()%>";
	receiptwin = CenterNamedWindow(page,'Receipt',500,400,2);
 }
</script>

</HEAD>

<BODY BGCOLOR="#FFFFFF">

<% 
   if (userPO.getOption().equals("DO_PRINT")) {
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("alert('printing receipt');");
     out.println("       showReceipt();");
     out.println("</SCRIPT>"); 
     userPO.setOption("");    
   }
%>
<table class="tbenter" width=101% height=100%>
  <tr> 
    <td> 
      <div align="center"> <font size="3"><b>There is no match for your search criteria</b></font> </div>
    </td>
  </tr>
</table>
<div align="center"></div>
</BODY>
</HTML>
