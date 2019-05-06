<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Pledge Agreement</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" 	class= "datapro.eibs.beans.ELEERRMessage"  		scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos" 			scope="session" />
<jsp:useBean id= "account" 	class= "datapro.eibs.beans.EDL014030Message"  	scope="session" />

<SCRIPT Language="Javascript">
function PrintPreviewPDF() {
  CenterWindow('<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0143L?SCREEN=6&E30DEAACC=' + document.forms[0].E30DEAACC.value + "&DOCTYPE=" + document.forms[0].DOCTYPE.value ,600,500,4);
}
</SCRIPT>



<%
if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
%>
<SCRIPT Language="Javascript">
        showErrors();
</SCRIPT>
<%}%>

</head>
<body>

<h3 align="center">Pledge Agreement<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="EDL0143_enter_search.jsp"></h3>
<hr size="4">

<form method="post" name="ledger_change" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0143L">
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="6">

  <table  class="tbenter" width="100%" border="0" cellspacing=0 cellpadding=2>
	<tr>
    	<td align="right">
        	Account Number :
        </td>
    	<td align="left">
            <input type="text" name="E30DEAACC" size="12" maxlength="9" onkeypress="enterInteger()" value="<%= account.getE30DEAACC()%>">
            <a href="javascript:GetAccount('E30DEAACC','','10','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
    	</td>
    </tr>
	<tr>
    	<td align="right">
              Document Type :
        </td>
    	<td align="left">
           <select name="DOCTYPE">
	           <option value="2" >Pledge and Security Agreement</option>
                <option value="1" selected>Loan Agreement</option>
           </select>

        </td>
    </tr>
	<tr>
    	<td align="center" colspan="2">
			<input id="EIBSBTN" type=button name="Submit" value="PDF" OnClick="PrintPreviewPDF();">
    	</td>
    </tr>
   </table>

<script language="JavaScript">
  document.forms[0].E30DEAACC.focus();
  document.forms[0].E30DEAACC.select();
</script>

<%if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
%>
     <SCRIPT Language="Javascript">
            showErrors();
     </SCRIPT>
<%}%>
</form>
</body>
</html>
