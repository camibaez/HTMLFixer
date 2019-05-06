<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Deletion</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<meta http-equiv="Refresh" CONTENT="5;url='<%=request.getContextPath()%>/pages/background.jsp">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">





<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

</head>
<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%> 
<h3 align="center"> Treasury Deletion - Operation Confirmation<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="del_confirm.jsp,EFE0120"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0000?SCREEN=1300">
  <p>
    <input type=HIDDEN name="SCREEN" value="1300">
  </p>
  <p>&nbsp; </p>
  <table cellspacing="0" cellpadding="2" class="tbenter" border=0   width=70% align="center" height="80%">
    <tr valign="middle"> 
      <td nowrap colspan="2" align="center" height="131">&nbsp;</td>
    </tr>
    <tr>
      <td nowrap colspan="2" valign="middle">
        <div align="center">The Transaction Number <%= userPO.getIdentifier()%> 
          has been deleted </div>
      </td>
    </tr>
    <tr> 
      <td nowrap colspan="2" valign="middle"> 
        <div align="center"><INPUT id="EIBSBTN" type="submit"
			name="Submit" value="Next"></div>
      </td>
    </tr>
  </table>
  
     
  
  <p>&nbsp;</p>
  <BR>
  </form>
<p>&nbsp;</p>
</body>
</html>
