<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<meta http-equiv="Refresh" CONTENT="5;url='<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEFE0224?SCREEN=100'">
<META name="GENERATOR" content="IBM WebSphere Studio">
<head>
<title>Confirmacion </title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id="msgFL" class="datapro.eibs.beans.EFE022401Message"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<body>
 
<h3 align="center"><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="EFE0224_bloomberg_transfer_confirm, EFE0224" ></h3>
<hr size="4">

  <table width="100%" height="30%" border="1" bordercolor="#000000">
    <tr > 
      <td> 
        <table width="100%" height="30%">        
          <tr>             
	          	<td align=center> Bloomberg File has been transfered</td>
          </tr>
          <tr>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</body>
</html>
