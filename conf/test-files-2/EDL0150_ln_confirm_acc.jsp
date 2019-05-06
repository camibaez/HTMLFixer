<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Loan Confirmation </title>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">

<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT language="Javascript1.1">
	setTimeout("document.forms[0].submit();", 7000);
</SCRIPT>

</head>

<body>

 
<h3 align="center">Confirmation<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="ln_confirm_acc, EDL0150" ></h3>
<hr size="4">
<FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDL0150ACC" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="400">
  <INPUT TYPE=HIDDEN NAME="E01DEAACC" VALUE="<%= userPO.getIdentifier()%>">
  <table width="100%" height="100%" border="1" >
    <tr > 
      <td> 
        <table width="100%" height="100%">
          <tr> 
            
          <td align=center> The loan number <b><%= datapro.eibs.master.Util.justifyRight(userPO.getIdentifier(), 9)%></b> 
            has been succesfully issued . </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</FORM>
</body>
</html>
