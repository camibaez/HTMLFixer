<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Commissions Table</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<meta http-equiv="Refresh" CONTENT="5;url='<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEWD0306P?SCREEN=1'">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<body>

 
<h3 align="center">Delete Confirmation<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="inv_del_confirm, EIV0000" ></h3>
<hr size="4">

  <table class="tableinfo" height="100%">
    <tr > 
      <td> 
        <table width="100%" height="100%">
          <tr> 
            
          <td align=center> The broker / agent <b><%= userPO.getIdentifier()%></b> 
            has been succesfully deleted.</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

</body>
</html>