<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META NAME="Luis Velando" CONTENT="Datapro">
<META name="GENERATOR" content="Microsoft FrontPage 5.0">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<TITLE>Externals Transfer</TITLE>

<jsp:useBean id="transdatabean" class="com.datapro.eibs.internet.beans.DC_TRANSFER"  scope="session"/>

</HEAD>

<BODY topmargin="0" leftmargin="0">
<H3 align="center">DCIBS External Transfers ( International )<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="DCIBS_transfer_external_ot_readonly.jsp, DCIBS"></H3>
<hr size="4">
<FORM>  

<BR>
<table border=0 cellspacing=0 cellpadding=0 width=550>
  <tr> 
    <td width="12"><img src="<%= request.getContextPath() %>/images/ball.gif" vspace="6"></td>
    <td id="sectbody2">Payment Information</td>
  </tr>
</table>
<TABLE class="tableinfo" width=100%>
  <TR id="trdark">
    <TD WIDTH=39% ALIGN=RIGHT>Debit Account :</TD>
    <TD><INPUT TYPE=TEXT NAME="DEBITACC" READONLY VALUE="<%= transdatabean.getDEBITACC().trim() %>" SIZE=35 MAXLENGTH=35></TD> 
  </TR>
  <TR id="trclear">
    <TD width="39%" ALIGN=RIGHT>Amount :</TD>
    <TD ALIGN=LEFT><INPUT TYPE=TEXT NAME="AMOUNT" READONLY VALUE="<%= transdatabean.getAMOUNT() %>" SIZE=11 MAXLENGTH=9></TD>
  </TR>
  <TR id="trdark">
    <TD width="39%" ALIGN=RIGHT>Currency : </TD>
    <TD ALIGN=LEFT><INPUT TYPE=TEXT NAME="CCY" READONLY VALUE="<%= transdatabean.getCCY().trim() %>" SIZE=3 MAXLENGTH=3></TD>
  </TR>
  <TR id="trclear">
    <TD width="39%" ALIGN=RIGHT>Value Date : </TD>
    <TD ALIGN=LEFT>
          <INPUT type="TEXT" name="VALUE_DATE_MM"  size="2" maxlength="2" READONLY value="<%= transdatabean.getVALUE_DATE_MM() %>">
          <INPUT type="TEXT" name="VALUE_DATE_DD"  size="2" maxlength="2" READONLY value="<%= transdatabean.getVALUE_DATE_DD() %>">
          <INPUT type="TEXT" name="VALUE_DATE_YY"  size="2" maxlength="2" READONLY value="<%= transdatabean.getVALUE_DATE_YY() %>">
   </TD>  
  </TR>
  <TR id="trdark">
    <TD width="39%" ALIGN=RIGHT>Charges Intermediary Bank :</TD>
    <TD ALIGN=LEFT><INPUT TYPE=TEXT NAME="INT_BANK_CHARGE1" READONLY VALUE="
<%if (transdatabean.getINT_BANK_CHARGE().equals("A")){%> Solicitante    <%}%>
<%if (transdatabean.getINT_BANK_CHARGE().equals("B")){%> Beneficiario <%}%>
                                          " SIZE=35 MAXLENGTH=35></TD>  
  </TR>
</TABLE>

<BR>
<table border=0 cellspacing=0 cellpadding=0 width=550>
    <tr> 
      <td width="12"><img src="<%= request.getContextPath() %>/images/ball.gif" vspace="6"></td>
      <td id="sectbody2">Beneficiary Information</td>
    </tr>
</table>
<TABLE class="tableinfo" width=100%>
    <TR id="trdark">
      <TD width="39%" ALIGN=RIGHT>Credit Account :</TD>
      <TD><INPUT TYPE=TEXT NAME="CREDITACC" READONLY VALUE="<%= transdatabean.getCREDITACC().trim() %>" SIZE=35 MAXLENGTH=20></TD>
  </TR>
  <TR id="trclear">
      <TD width="39%" ALIGN=RIGHT>Name : </TD>
      <TD><INPUT TYPE=TEXT NAME="BENE_NAME" READONLY VALUE="<%= transdatabean.getBENE_NAME().trim() %>" SIZE=35 MAXLENGTH=35></TD>
  </TR>
  <TR id="trdark">
      <TD width="39%" ALIGN=RIGHT valign="top"><br>Address :</TD>
      <TD><INPUT TYPE=TEXT NAME="BENE_ADD1" READONLY VALUE="<%= transdatabean.getBENE_ADD1().trim() %>" SIZE=35 MAXLENGTH=35><br>
          <INPUT TYPE=TEXT NAME="BENE_ADD2" READONLY VALUE="<%= transdatabean.getBENE_ADD2().trim() %>" SIZE=35 MAXLENGTH=35 ></TD>
  </TR>
  <TR id="trclear">
      <TD width="39%" ALIGN=RIGHT valign="top"><br>Description</TD>
      <TD><INPUT type="TEXT" name="BENE_MEMO1" READONLY value="<%= transdatabean.getBENE_MEMO1().trim() %>" size="35" maxlength="35" ><br>
          <INPUT type="TEXT" name="BENE_MEMO2" READONLY value="<%= transdatabean.getBENE_MEMO2().trim() %>" size="35" maxlength="35" ><br>
          <INPUT type="TEXT" name="BENE_MEMO3" READONLY value="<%= transdatabean.getBENE_MEMO3().trim() %>" size="35" maxlength="35" ></TD>
  </TR>                
</TABLE>

<BR>
<table border=0 cellspacing=0 cellpadding=0 width=550>
    <tr> 
      <td width="12"><img src="<%= request.getContextPath() %>/images/ball.gif" vspace="6"></td>
      <td id="sectbody2">Beneficiary Bank</td>
    </tr>
</table>
<TABLE class="tableinfo" width=100%>
    <TR id="trdark">
      <TD width="39%" ALIGN=RIGHT>Bank Name</TD>
      <TD><INPUT TYPE="text" NAME="BENE_BANK_NAME" READONLY VALUE="<%= transdatabean.getBENE_BANK_NAME().trim() %>" SIZE=35 MAXLENGTH="35">
  </TR>
  <TR id="trclear">
      <TD width="39%" ALIGN=RIGHT valign="top"><br>Address</TD>
      <TD><INPUT type="text" name="BENE_BANK_ADD1" READONLY value="<%= transdatabean.getBENE_BANK_ADD1().trim() %>" size="35" maxlength="35"><br>
          <INPUT type="text" name="BENE_BANK_ADD2" READONLY value="<%= transdatabean.getBENE_BANK_ADD2().trim() %>" size="35" maxlength="35"><br>
          <INPUT type="text" name="BENE_BANK_ADD3" READONLY value="<%= transdatabean.getBENE_BANK_ADD3().trim() %>" size="35" maxlength="35"></TD>
  </TR>
  <TR id="trdark">
      <TD width="39%" ALIGN=RIGHT>SWIFT :</TD>
      <TD><INPUT type="text" name="BENE_BANK_ID" READONLY value="<%= transdatabean.getBENE_BANK_ID().trim() %>" size="35" maxlength="12">
  </TR>
</TABLE>

<%
if (false) {
%>

<INPUT TYPE=HIDDEN NAME="INT_BANK_NAME" VALUE="<%= transdatabean.getINT_BANK_NAME().trim() %>">
<INPUT TYPE=HIDDEN NAME="INT_BANK_ADD1" VALUE="<%= transdatabean.getINT_BANK_ADD1().trim() %>">
<INPUT TYPE=HIDDEN NAME="INT_BANK_ADD2" VALUE="<%= transdatabean.getINT_BANK_ADD2().trim() %>">
<INPUT TYPE=HIDDEN NAME="INT_BANK_ADD3" VALUE="<%= transdatabean.getINT_BANK_ADD3().trim() %>">
<INPUT type=HIDDEN name="INT_BANK_ID" value="<%= transdatabean.getINT_BANK_ID().trim() %>">

<%
}
else {
%>

<BR>
<table border=0 cellspacing=0 cellpadding=0 width=550>
    <tr> 
      <td width="12"><img src="<%= request.getContextPath() %>/images/ball.gif" vspace="6"></td>
      <td id="sectbody2">Intermediary Bank ( Optional )</td>
    </tr>
</table>
<TABLE class="tableinfo" width=100%>
    <TR id="trclear">
      <TD width="39%" ALIGN=RIGHT>Name</TD>
      <TD><INPUT TYPE=TEXT NAME="INT_BANK_NAME" READONLY VALUE="<%= transdatabean.getINT_BANK_NAME().trim() %>" SIZE=35 MAXLENGTH=35></TD>
  </TR>
  <TR id="trdark">
      <TD width="39%" ALIGN=RIGHT valign="top"><br>Address</TD>
      <TD><INPUT TYPE=TEXT NAME="INT_BANK_ADD1" READONLY VALUE="<%= transdatabean.getINT_BANK_ADD1().trim() %>" SIZE=35 MAXLENGTH=35><br>
          <INPUT TYPE=TEXT NAME="INT_BANK_ADD2" READONLY VALUE="<%= transdatabean.getINT_BANK_ADD2().trim() %>" SIZE=35 MAXLENGTH=35><br>
          <INPUT TYPE=TEXT NAME="INT_BANK_ADD3" READONLY VALUE="<%= transdatabean.getINT_BANK_ADD3().trim() %>" SIZE=35 MAXLENGTH="35"></TD>
  </TR>
  <TR id="trclear">
      <TD width="39%" ALIGN=RIGHT>ABA :</TD>
    <TD><INPUT type="text" name="INT_BANK_ID" READONLY value="<%= transdatabean.getINT_BANK_ID().trim() %>" size="35" maxlength="12"></TD>
  </TR>
</TABLE>
<%
}
%>

<BR>

 <p align="center">
    <input id="EIBSBTN" type=button name="Submit" value="Return" onClick="window.location.href='DCIBS_transfer_external_ot_list.jsp'">
  </p>   
</FORM>
</BODY>
</HTML>