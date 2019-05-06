<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css"> 
<TITLE>Line of Credit Inquiry by Type</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<SCRIPT LANGUAGE="JavaScript" SRC="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">

function CheckACC(){
if ( document.forms[0].CLTYPE.value.length < 1) {
  alert("A valid type must be entered");
  document.forms[0].CLTYPE.value='';
  document.forms[0].CLTYPE.focus();
}
else {
  document.forms[0].submit();
  }
}

</SCRIPT>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

</HEAD>

<body>

<h3 align="center">Line of Credit Inquiry by Type<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="cl_type_enter, ELN0110"></h3>
<hr>
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.credit.JSELN0110" >
    <p><INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
    </p>
    <table  class="tbenter" width="100%" height="75%" border="0" cellspacing=0 cellpadding=2>
	<tr>
     <td align="center">
          Enter the Type : 
           <input type=TEXT name="CLTYPE" value="" size= "4" maxlength="3" >
            <a href="javascript:GetCodeCNOFC('CLTYPE','14')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a> 
            <p align="center"> 
						<input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="CheckACC()">
 				 </p> 
     </td>        
    </tr>
  </table>
<script language="JavaScript">
  document.forms[0].CLTYPE.focus();
  document.forms[0].CLTYPE.select();
</script>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT Language="Javascript">
            showErrors();
     </SCRIPT>
 <%
 }
%>
 </FORM>
</BODY>
</HTML>
 