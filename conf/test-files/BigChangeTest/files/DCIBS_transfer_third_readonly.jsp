<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META NAME="Author" CONTENT="Datapro">
<META http-equiv="Content-Style-Type" content="text/css">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<TITLE></TITLE>

<%
session = request.getSession(false);
String UTYPEVAL = (String)session.getAttribute("UTYPE");
%>

<jsp:useBean id="transdatabean" class="com.datapro.eibs.internet.beans.DC_TRANSFER"  scope="session"/>

</HEAD>

<BODY topmargin="0" leftmargin="0">
<H3 align="center">DCIBS Entity Third Party Transfers <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="DCIBS_transfer_third_readonly.jsp, DCIBS"></H3>
<hr size="4">
<FORM> 
<INPUT TYPE=HIDDEN NAME="ACT"        VALUE=<%= transdatabean.getACT() %>>
<INPUT TYPE=HIDDEN NAME="TYPE"       VALUE=<%= transdatabean.getTYPE() %>>
<INPUT TYPE=HIDDEN NAME="SUBTYPE"    VALUE=<%= transdatabean.getSUBTYPE() %>>
<INPUT TYPE=HIDDEN NAME="STS" VALUE=<%= transdatabean.getSTS() %>>
<INPUT TYPE=HIDDEN NAME="NUMAPR" VALUE=<%= transdatabean.getNUMAPR() %>>
<INPUT TYPE=HIDDEN NAME="DCIBS_REF" VALUE=<%= transdatabean.getDCIBS_REF() %>>
<INPUT TYPE=HIDDEN NAME="OUSER" VALUE=<%= transdatabean.getOUSER() %>>
<INPUT TYPE=HIDDEN NAME="VUSER" VALUE=<%= transdatabean.getVUSER() %>>


  
<TABLE class="tableinfo" WIDTH=90%>	  
 <TR id="trdark"> 
    <TD width="25%" ALIGN=RIGHT>Debit Account :</TD>
    <TD><INPUT TYPE=TEXT NAME="DEBITACC" READONLY VALUE="<%= transdatabean.getDEBITACC().trim() %>" SIZE=13 MAXLENGTH=13></TD>
  </TR>
  <TR id="trclear"> 
    <TD ALIGN=RIGHT>Credit Amount :</TD>
    <TD><INPUT TYPE=TEXT NAME="AMOUNT" READONLY VALUE="<%= transdatabean.getCREDITACC() %>" SIZE=13 MAXLENGTH=13></TD>
  </TR>
  <TR id="trdark"> 
    <TD ALIGN=RIGHT>Currency :</TD>
    <TD><INPUT TYPE=TEXT NAME="AMOUNT" READONLY VALUE="<%= transdatabean.getAMOUNT() %>" SIZE=13 MAXLENGTH=13></TD>
  </TR>
</table>

<BR>

  <p align="center">
    <input id="EIBSBTN" type=button value="Return"  onClick="window.location.href='DCIBS_transfer_third_list.jsp'"></TD>
 </p>


</FORM>
</BODY>
</HTML>
 