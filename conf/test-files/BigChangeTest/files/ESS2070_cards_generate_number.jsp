<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 FINAL//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META NAME="Author" CONTENT="Datapro">
<META NAME="Generator" CONTENT="NetObjects Fusion 4.0.1 for Windows">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />

<SCRIPT LANGUAGE="JavaScript"> 
<!--- hide script from old browsers

function FSubmitValidation() {
  if(document.forms[0].NCARDS.value==""){
    alert("Please enter number of cards to generate");
    document.forms[0].NCARDS.focus();
    return false;
  }
  if(confirm("Are you sure to generate " + document.forms[0].NCARDS.value + " Secure Cards")){
     return true;
  }
  return false; 
}

// end hiding from old browsers -->
</SCRIPT>
</HEAD>

<BODY> 
<h3 align="center">Secure Cards Generation<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="cards_generate_number, ESS2070"></h3>
<hr size="4">
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0") ;
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 %> 
<form method="post" action="<%=request.getContextPath()%>/servlet/com.datapro.eibs.internet.JSESS2070" onsubmit="return FSubmitValidation()">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="11">
<INPUT TYPE=HIDDEN NAME="TYPE" VALUE="2"> 
<input type=HIDDEN name="PB" value="2">

 <table border=0 cellpadding=0 cellspacing=0 width=600>
   <tr class="sectheader"> 
    <td width=600></td>
  </tr>
 </table>
 
 <h4 align="center">Please enter secure cards number to generate</h4>
  <p>&nbsp; </p>

      
<table border=1 bordercolor="BECADA" cellpadding=0 cellspacing=0 width=450 class="tableinfo">
  <tr id="trdark"> 
    <td width=39% align=right>Cards to Generate :</td>
    <td><input type=text name="NCARDS" value="" size=20 maxlength=4></TD>
  </tr>
</table>

<BR>

  <p align="center"> 
   <input id="EIBSBTN" type=submit name="Submit" value="Submit"> 
  </p>

</FORM>
</BODY>
</HTML>
 