<html>
<head>
<title>Checks</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import ="datapro.eibs.master.Util" %>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" 	class= "datapro.eibs.beans.ELEERRMessage"  		scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos"  			scope="session"/>
<jsp:useBean id= "msgCC" 	class= "datapro.eibs.beans.EOF010001Message"  	scope="session" />

<SCRIPT Language="Javascript">
function goAction() {
	if (document.forms[0].ID.value == 'C') {
		document.forms[0].SCREEN.value = 4;
	} else {
		document.forms[0].SCREEN.value = 4;
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

<H3 align="center"><% if (userPO.getHeader1().equals("D")) {out.print("Available Officials Checks for Stop Payment");} else {out.print("Stop Payment Checks for Release");}%><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="sp_release_action, EOF0100"></H3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEOF0100">
 
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
  <INPUT TYPE=HIDDEN NAME="E01STPSEQ" VALUE="<%= msgCC.getE01STPSEQ() %>">
  <INPUT TYPE=HIDDEN NAME="E01STPBNK" VALUE="<%= msgCC.getE01STPBNK() %>">
  <INPUT TYPE=HIDDEN NAME="E01STPBRN" VALUE="<%= msgCC.getE01STPBRN() %>">
  <INPUT TYPE=HIDDEN NAME="E01STPACC" VALUE="<%= msgCC.getE01STPACC() %>">
  <INPUT TYPE=HIDDEN NAME="E01STPGLN" VALUE="<%= msgCC.getE01STPGLN() %>">
  <INPUT TYPE=HIDDEN NAME="ID" VALUE="<%= userPO.getIdentifier() %>">
   
  <table class="tableinfo">
   <tr> 
   <td>
    <table cellspacing=0 cellpadding=2 width="100%" border="0">    
     	<tr id=trclear> 
	      <td nowrap width="40%"> 
	        <div align="right">Check Number : </div>
	      </td>
		  <td nowrap width="60%" >
		  	<input type="text" name="E01STPCKN" size="11" maxlength="10" value="<%= msgCC.getE01STPCKN() %>" readonly>
		  </td>
		</tr>
      	<tr id=trdark > 
	      <td nowrap width="40%"> 
	        <div align="right">Currency : </div>
	      </td>
		  <td nowrap width="60%" >
			<input type="text" name="E01STPCCY" size="4" maxlength="3" value="<%= msgCC.getE01STPCCY() %>" readonly> 
		  </td>
		</tr>
     	<tr id=trclear> 
	      <td nowrap width="40%"> 
	        <div align="right">Amount : </div>
	      </td>
		  <td nowrap width="60%" >
		  	<input type="text" name="E01STPAMT" size="18" maxlength="17" value="<%= msgCC.getE01STPAMT() %>" readonly>
		  </td>
		</tr>
      	<tr id=trdark > 
	      <td nowrap width="40%"> 
	        <div align="right">Date : </div>
	      </td>
		  <td nowrap width="60%" >
			<input type="text" name="E01STPDT1" size="3" maxlength="2" value="<%= msgCC.getE01STPDT1() %>" readonly> 
			<input type="text" name="E01STPDT2" size="3" maxlength="2" value="<%= msgCC.getE01STPDT2() %>" readonly>
			<input type="text" name="E01STPDT3" size="3" maxlength="2" value="<%= msgCC.getE01STPDT3() %>" readonly>
		  </td>
		</tr>
     	<tr id=trclear> 
	      <td nowrap width="40%"> 
	        <div align="right">Beneficiary : </div>
	      </td>
		  <td nowrap width="60%" >
		  	<input type="text" name="E01STPBNF" size="50" maxlength="50" value="<%= msgCC.getE01STPBNF() %>" readonly>
		  </td>
		</tr>
  	 </table>
    </td>
   </tr>
  </table>
  <br>
  
  <p align="center"> 
    <input id="EIBSBTN" type="submit" name="Submit" value="Submit" >
  </p>
</form>
</body>
</html>
