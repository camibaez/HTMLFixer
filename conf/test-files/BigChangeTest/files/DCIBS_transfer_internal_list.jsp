<%@ taglib uri="/WEB-INF/display.tld" prefix="display" %>
<!DOCTYPE HTML PUBLIC "-/W3C/DTD HTML 3.2 FINAL/EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META NAME="Author" CONTENT="Datapro">
<META NAME="Generator" CONTENT="NetObjects Fusion 4.0.1 for Windows">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<TITLE>Internet Banking System</TITLE>


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

</HEAD>

<BODY topmargin="0" leftmargin="0">
<H3 align="center">DCIBS Entity Internal Transfers <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="DCIBS_transfer_internal_list.jsp, DCIBS"></H3>
<hr size="4">
<FORM METHOD=POST ACTION="<%=request.getContextPath()%>/servlet/com.datapro.eibs.internet.JSTransfersFilter">
<INPUT TYPE=HIDDEN NAME="TYPE"    VALUE="1">
<INPUT TYPE=HIDDEN NAME="ACT" VALUE="1">

<BR>

<TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH=90% >
  <tr>
    <TD width=12><img src="<%= request.getContextPath() %>/images/ball.gif" vspace="6"></TD>
    <TD>&nbsp;Operations Pending of Approval</TD>
  </TR>
</TABLE>

<BR>	

  <table  width=90%  class="tableinfo">
    <tr>
<td>
<display:table width="100%" name="lsTransfers" property="list" scope="session" decorator="com.datapro.eibs.internet.wrappers.TransferWrapper">
  <display:column property="refe"      align="center"  title="[ ]"/>
  <display:column property="DCIBS_REF" align="center"  title="Reference"/>
  <display:column property="ODATE"     align="center"  title="Date" />
  <display:column property="AMOUNT"    align="right"   title="Amount"/>
  <display:column property="DEBITACC"  align="center"  title="Debit Account"/>
  <display:column property="CREDITACC" align="center"  title="Credit Account"/>
  <display:column property="OUSER"     align="center"  title="Open User"/>
  <display:column property="NUMAPR"    align="center"  title="No.<br>Apr."/>
</display:table> 
</td>
</tr>
</table>


  <p align="center">
    <input id="EIBSBTN" type=submit name="Submit" value="Inquiry" >
  </p>
  
</FORM>
</BODY>
</HTML>
 