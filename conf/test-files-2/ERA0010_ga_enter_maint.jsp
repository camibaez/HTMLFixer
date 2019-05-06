<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<TITLE>Mantenimiento  de Garantias</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</HEAD>

<SCRIPT LANGUAGE="JavaScript" SRC="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">

function CheckACC(){
if(document.forms[0].CUSNUM.value.length < 1){
alert("A valid customer number must be entered");
document.forms[0].CUSNUM.value='';
document.forms[0].CUSNUM.focus();
}
else {
  document.forms[0].submit();
}
}

</SCRIPT>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<body bgcolor="#FFFFFF">

 <% if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 %>

<h3 align="center">New / Collateral Maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="ERA0010_ga_enter_maint.jsp"></h3>
<hr>
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0010" >

    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
    <table  class="tbenter" width="100%" height="75%" border="0" cellspacing=0 cellpadding=2>
	<tr>
     <td align="center">
           Customer Number :
          <input type=TEXT name="CUSNUM" value="" size=15 maxlength=9 onkeypress="enterInteger()">
          <a href="javascript:GetCustomer('CUSNUM')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="absmiddle" border="0" ></a>
          <p align="center">
    				<input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="CheckACC()">
  			</p>
      </td>
      </tr>
    </table>

 </FORM>
</BODY>
</HTML>
