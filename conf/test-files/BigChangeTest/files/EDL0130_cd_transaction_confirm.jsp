<html>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<head>
<title>Transactions Confirmation </title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT language="Javascript">
	setTimeout("document.forms[0].submit();", 7000);
</SCRIPT>


</head>

<body>

 
<h3 align="center">Transactions Confirmation<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cd_transaction_confirm, EDL0130" ></h3>
<hr size="4">
<br>
<FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130" >
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1000">
	<INPUT TYPE=HIDDEN NAME="E03DEAACC" VALUE="<%=userPO.getIdentifier()%>">	
	
<table width="100%" height="90%" class="tableinfo">
  <tr > 
      
    <td> 
      <p align="center">The operations requested for the Time Deposit number <b><%= datapro.eibs.master.Util.justifyRight(userPO.getIdentifier(),9)%></b> 
        have been successfully processed .<br>
        <br>
      Please wait...</p>
          </td>
    </tr>
  </table>
</FORM>
</body>
</html>
