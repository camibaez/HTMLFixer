<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Activación de Tarjeta</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "msgCard" class= "datapro.eibs.beans.ECD0016DSMessage"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="JavaScript">
<!--
//-->
function goAction() {
    var ok = confirm("This debit card will be activated");
	if (ok == true) {
		document.forms[0].submit();
	}
}
//-->
</script>

</head>
<body>
<h3 align="center">Activate Card<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="card_activation_info.jsp, ECD0016"> 
</h3>
<hr size="4">
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     //error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
%> 
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.cards.JSECD0016" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">

  <h4>General Information</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right">Customer Number : </div>
            </td>
            <td nowrap width="16%" > 
              <div align="left"> 
                <input type="text" name="E01CDRCUN" size="11" maxlength="10" value="<%= msgCard.getE01CDRCUN().trim()%>" readonly>
			  </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right">Customer Name : </div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E01CDRNAM" size="31" maxlength="30" value="<%= msgCard.getE01CDRNAM().trim()%>" readonly>
              </div>
            </td>
          </tr>    
          <tr id="trclear"> 
			<TD nowrap width="16%">
				<DIV align="right">Card Number : </DIV>
			</TD>
			<TD nowrap width="20%">
				<DIV align="left">
					<INPUT type="text" name="E01CDRTAR" size="21" maxlength="20" value="<%= msgCard.getE01CDRTAR().trim()%>" readonly>
				</DIV>
			</TD>
			<TD nowrap width="16%">
				<DIV align="right">Status : </DIV>
			</TD>
			<TD nowrap width="20%">
				<DIV align="left">
					<INPUT type="text" name="E01CDRSTS" size="5" maxlength="4" value="<%= msgCard.getE01CDRSTS().trim()%>" readonly>
					<INPUT type="text" name="E01CDRDSC" size="16" maxlength="15" value="<%= msgCard.getE01CDRDSC().trim()%>" readonly>
				</DIV>
			</TD>
          </tr>            
        </table>
      </td>
    </tr>
  </table>
<BR>
<DIV align="center">
	<INPUT type="button" name="EIBSBTNOK" id="EIBSBTN" value="Submit" onclick="javascript:goAction()">
</DIV>
</form>
</body>
</html>
