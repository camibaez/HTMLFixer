<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"> 
<html>
<head>
<title>Corporative Customer Confirmation </title> 
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<meta http-equiv="Refresh" CONTENT="5;url='<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=500&E01CUN=<%= userPO.getCusNum()%>'">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<body>

 
<h3 align="center">Confirmation<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="client_rela_confirm, ESD0080" ></h3>
<hr size="4">

  <table class="tableinfo" height="100%">
    <tr > 
      <td> 
        <table width="100%" height="100%"> 
          <tr> 
            
          <td align=center> The customer <b><%= userPO.getHeader3()%></b> has 
            been succesfully created having <b><%= datapro.eibs.master.Util.justifyRight(userPO.getCusNum(), 9)%></b> 
            as a system number . </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

</body>
</html>
