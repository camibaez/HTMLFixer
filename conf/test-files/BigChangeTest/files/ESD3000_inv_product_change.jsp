<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Investment Product Change</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" 	class= "datapro.eibs.beans.ELEERRMessage"  		scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos" 			scope="session" />
<jsp:useBean id= "account" 	class= "datapro.eibs.beans.ESD300001Message"  	scope="session" />

<SCRIPT Language="javascript">
function CheckACC(){
	if(document.forms[0].E01OLDPRD.value.length < 1){
		alert("A valid old product must be entered");
		document.forms[0].E01OLDPRD.value='';
		document.forms[0].E01OLDPRD.focus();
	} else {
  		document.forms[0].submit();
	}
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

<h3 align="center">Investment Product Change<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="ESD3000_inv_product_change.jsp"></h3>
<hr size="4">

<form method="post" name="product_change" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD3000">
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="300">
    <INPUT TYPE=HIDDEN NAME="H01FLGWK1" VALUE="3">
    <INPUT TYPE=HIDDEN NAME="Type" VALUE="<%= userPO.getType()%>">

  <table  class="tbenter" width="100%" border="0" cellspacing=0 cellpadding=2>
	
	
	<tr>
    	<td align="right">
              Old Product Code :
        </td>
    	<td align="left">
    	    
			<input type="text" name="E01OLDPRD" size="5" value="<%= account.getE01OLDPRD()%>">
			<input type="text" name="E01PRDDSC" size="45" readonly value="<%= userPO.getHeader10()%>">
            <a href="javascript:GetProduct('E01OLDPRD','E01PRDDSC','<%= userPO.getType()%>','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a>
			<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  > 
		   
        </td>
    </tr>
	<tr>
    	<td align="right">
              New Product Code :
        </td>
    	<td align="left">
              <input type="text" name="E01NEWPRD" size="5" maxlength="4" value="<%= account.getE01NEWPRD()%>">
              <input type="text" name="E01PRDDSC" size="45" readonly value="<%= userPO.getHeader10()%>">
              <a href="javascript:GetProduct('E01NEWPRD','E01PRDDSC','<%= userPO.getType()%>','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  > 
        </td>
    </tr>
    
    <tr>
    	<td align="right">
            Instrument Code :
        </td>
    	<td align="left">             
        	<input type="text" name="E01OLDACC" size="10" maxlength="9" onkeypress="enterInteger()" value="<%= account.getE01OLDACC()%>">               
              <a href="javascript:GetInstrumentParams('E01OLDACC',' ',' ',' ',' ',' ',' ')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0"></a> 
    	</td>
    </tr>
	<tr>
    	<td align="center" colspan="2">
			<input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="CheckACC()">
    	</td>
    </tr>
   </table>

<script language="JavaScript">
  document.forms[0].E01OLDACC.focus();
  document.forms[0].E01OLDACC.select();
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