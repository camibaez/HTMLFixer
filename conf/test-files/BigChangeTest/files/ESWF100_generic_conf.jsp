<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Confirmation</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<meta http-equiv="Refresh"CONTENT="7;url='<%=request.getContextPath()%>/servlet/datapro.eibs.transfer.JSEWD0341F?SCREEN=7'">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">

<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Languaje="javascript">
 function analize(){
  top.opener.document.location.reload();
  self.close();
}
</SCRIPT>

</head>
<body nowrap >
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%> 
<h3 align="center"> Swift Message Repair - Operation Confirmation<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="generic_onf"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0325" >
  <p>
    <input type=HIDDEN name="SCREEN" value="4">
  </p>
  <p>&nbsp; </p>
  <table cellspacing="0" cellpadding="2" class="tbenter" border=0   width=70% align="center" height="80%">
    <tr valign="middle"> 
      <td nowrap colspan="2" align="middle" height="131">&nbsp;</td>
    </tr>
    <tr>
      <td nowrap colspan="2" valign="middle">
        <div align="center">The Swift Message with reference number <%= userPO.getIdentifier()%> 
          have been repaired</div>
      </td>
    </tr>
    <tr> 
      <td nowrap colspan="2" valign="middle"> 
        <div align="center"></div>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <BR>
<SCRIPT Languaje ="javascript"> </SCRIPT>
  </form>
<p>&nbsp;</p>
</body>
</html>
