<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META NAME="Author" CONTENT="Datapro">
<META NAME="Generator" CONTENT="NetObjects Fusion 4.0.1 for Windows">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<TITLE>Transferencias Internas</TITLE>

<jsp:useBean id="transdatabean" class="com.datapro.eibs.internet.beans.DC_TRANSFER"  scope="session"/>

<SCRIPT SRC="<%= request.getContextPath() %>/pages/javascripts/dibs.jsp"> </SCRIPT>

</HEAD>

<BODY topmargin="0" leftmargin="0">
<H3 align="center">DCIBS Entity Internal Transfers <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="DCIBS_transfer_internal_readonly.jsp, DCIBS"></H3>
<hr size="4">
<FORM METHOD=POST ACTION="<%= request.getContextPath() %>/pages/body_wait.jsp?ServletName=<%= request.getContextPath() %>/servlet/com.datapro.dibs.servlets.JSTransfersSub"" onsubmit="return FSubmitValidation()"> 
<INPUT TYPE=HIDDEN NAME="ACT"        VALUE=<%= transdatabean.getACT() %>>
<INPUT TYPE=HIDDEN NAME="TYPE"       VALUE=<%= transdatabean.getTYPE() %>>
<INPUT TYPE=HIDDEN NAME="SUBTYPE"    VALUE=<%= transdatabean.getSUBTYPE() %>>

<BR>

<TABLE  WIDTH=90% class="tableinfo">	  
 <TR id="trdark"> 
    <TD width="25%" ALIGN=RIGHT>Debit Account :</TD>
    <TD><INPUT TYPE=TEXT NAME="DEBITACC" READONLY VALUE="<%= transdatabean.getDEBITACC().trim() %>" SIZE=13 MAXLENGTH=13></TD>
  </TR>
  <TR id="trclear"> 
    <TD ALIGN=RIGHT>Credit Account :</TD>
    <TD><INPUT TYPE=TEXT NAME="AMOUNT" READONLY VALUE="<%= transdatabean.getCREDITACC() %>" SIZE=13 MAXLENGTH=13></TD>
  </TR>
  <TR id="trdark"> 
    <TD ALIGN=RIGHT>Amount :</TD>
    <TD><INPUT TYPE=TEXT NAME="AMOUNT" READONLY VALUE="<%= transdatabean.getAMOUNT() %>" SIZE=13 MAXLENGTH=13></TD>
  </TR>
</table>

<BR>

  <p align="center">
   <input id="EIBSBTN" type=button value="Return"  onClick="window.location.href='DCIBS_transfer_internal_list.jsp'"></TD>
  </p>


</FORM>

</BODY>
   
</HTML>
 