<%@ taglib uri="/WEB-INF/display.tld" prefix="display" %>
<!DOCTYPE HTML PUBLIC "-/W3C/DTD HTML 3.2 FINAL/EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META NAME="Author" CONTENT="Datapro">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<TITLE>Internet Banking System</TITLE>
<SCRIPT language="javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
</HEAD>

<BODY topmargin="0" leftmargin="0">
<h3 align="center">Secure Card Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="cards_inq_entity_asigned, ESS2070"></h3>
<hr size="4">
<h4 align="center">Cards Assigned to User/Entity</h4>
<FORM>
<INPUT TYPE=HIDDEN NAME="ENTITYID" VALUE="">

<br>

<table border=0 CELLSPACING=0 CELLPADDING=0 WIDTH=100%>
  <TR> 
    <TD width=12><img src="<%=request.getContextPath()%>/images/arrow.gif"></TD>
    <TD class="sectbody2">User/Entity  :<%= (String) session.getAttribute("ENTITYID") %> </TD>		
  </TR>
</TABLE>

<BR>

<table class="tableinfo">
  <TR class="rowlight" > 
<td>
<display:table width="100%" name="lsCardsInq" property="list" scope="session">
  <display:column property="SERIAL" align="center"  title="Serial"/>
  <display:column property="STS" align="center"  title="Status"/>
</display:table> 
</td>
</tr>
</table>

<BR>

<table border=0 CELLSPACING=0 CELLPADDING=0 WIDTH=100%>
  <TR> 
    <TD width=12><img src="<%=request.getContextPath()%>/images/app.gif"></TD>
    <TD class="sectbody2">E: Entity Pending  - A: Assigned - X: Void</TD>		
  </TR>
</TABLE>

<BR>

<table border=0 CELLSPACING=0 CELLPADDING=0 WIDTH=100%>
    <TR>
    <TD WIDTH=100% ALIGN=CENTER><input id="EIBSBTN" type=button value="Print"   onClick="eIBSPrint()"></TD>
  </TR>    
</TABLE>

</FORM>
</BODY>
</HTML>
 