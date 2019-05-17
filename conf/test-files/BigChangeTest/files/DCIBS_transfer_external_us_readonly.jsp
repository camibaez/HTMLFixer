<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META NAME="Luis Velando" CONTENT="Datapro">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
<TITLE></TITLE>

<jsp:useBean id="transdatabean" class="com.datapro.eibs.internet.beans.DC_TRANSFER"  scope="session"/>

</HEAD>

<BODY topmargin="0" leftmargin="0">
<H3 align="center">DCIBS External Transfers ( USA )<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="DCIBS_transfer_external_us_readonly.jsp, DCIBS"></H3>
<hr size="4">
<FORM>  
<INPUT TYPE=HIDDEN NAME="ACT"       VALUE=<%= transdatabean.getACT() %>>
<INPUT TYPE=HIDDEN NAME="TYPE"      VALUE=<%= transdatabean.getTYPE() %>>
<INPUT TYPE=HIDDEN NAME="SUBTYPE"   VALUE=F>


<BR>
<table border=0 cellspacing=0 cellpadding=0 width=100%>
  <tr> 
    <td width="12"><img src="<%= request.getContextPath() %>/images/ball.gif" vspace="6"></td>
    <td class="sectbody2">&nbsp;Payment Information</td>
  </tr>
</table>

<TABLE class="tableinfo" width=100%>
  <TR id="trdark"> 
    <TD width="30%" ALIGN=RIGHT>Debit Account :</TD>
    <TD><INPUT TYPE=TEXT NAME="DEBITACC" READONLY VALUE="<%= transdatabean.getDEBITACC().trim() %>" SIZE=13 MAXLENGTH=13></TD>
  </TR>
  <TR id="trclear"> 
    <TD ALIGN=RIGHT>Amount :</TD>
    <TD><INPUT TYPE=TEXT NAME="AMOUNT" READONLY VALUE="<%= transdatabean.getAMOUNT() %>" SIZE=13 MAXLENGTH=13></TD>
  </TR>
  <TR id="trdark"> 
    <TD ALIGN=RIGHT>Currency :</TD>
    <TD><INPUT TYPE=TEXT NAME="CCY" READONLY VALUE="USD" SIZE=3 MAXLENGTH=3></TD>
  </TR>
  <TR id="trclear">
    <TD ALIGN=RIGHT>Value Date :</TD>
    <TD ALIGN=LEFT>
          <INPUT type="TEXT" name="VALUE_DATE_MM"  size="2" maxlength="2" READONLY value="<%= transdatabean.getVALUE_DATE_MM() %>">
          <INPUT type="TEXT" name="VALUE_DATE_DD"  size="2" maxlength="2" READONLY value="<%= transdatabean.getVALUE_DATE_DD() %>">
          <INPUT type="TEXT" name="VALUE_DATE_YY"  size="2" maxlength="2" READONLY value="<%= transdatabean.getVALUE_DATE_YY() %>">
    </TD>      
  </TR>
</TABLE>

<BR>

<table  width=100%>
  <tr> 
    <td width="12"><img src="<%= request.getContextPath() %>/images/ball.gif" vspace="6"></td>
    <td class="sectbody2">&nbsp;Beneficiary Information</td>
  </tr>
</table>

<TABLE class="tableinfo" width=100%>
  <TR id="trdark">
    <TD width="30%" ALIGN=RIGHT>Credit Account</TD>
    <TD><INPUT TYPE=TEXT NAME="CREDITACC" READONLY VALUE="<%= transdatabean.getCREDITACC().trim() %>" SIZE=35 MAXLENGTH=12></TD>
  </TR>
  <TR id="trclear">
    <TD ALIGN=RIGHT>Beneficiary Name</TD>
    <TD><INPUT TYPE=TEXT NAME="BENE_NAME" READONLY VALUE="<%= transdatabean.getBENE_NAME().trim() %>" SIZE=35 MAXLENGTH=35 ></TD>
  </TR>
  <TR id="trdark">
    <TD ALIGN=RIGHT valign="top"><br>Address</TD>
    <TD><INPUT TYPE=TEXT NAME="BENE_ADD1" READONLY VALUE="<%= transdatabean.getBENE_ADD1().trim() %>" SIZE=35 MAXLENGTH=35 ><br>
        <INPUT TYPE=TEXT NAME="BENE_ADD2" READONLY VALUE="<%= transdatabean.getBENE_ADD2().trim() %>" SIZE=35 MAXLENGTH=35 ></TD>
  </TR>
  <TR id="trclear">
    <TD ALIGN=RIGHT valign="top"><br>Description</TD>
    <TD><INPUT type="TEXT" name="BENE_MEMO1" READONLY value="<%= transdatabean.getBENE_MEMO1().trim() %>" size="35" maxlength="35" ><br>
        <INPUT type="TEXT" name="BENE_MEMO2" READONLY value="<%= transdatabean.getBENE_MEMO2().trim() %>" size="35" maxlength="35" ><br>
        <INPUT type="TEXT" name="BENE_MEMO3" READONLY value="<%= transdatabean.getBENE_MEMO3().trim() %>" size="35" maxlength="35" ></TD>
  </TR>                
</TABLE>

<BR>

<table  width=100%>
  <tr> 
    <td width="12"><img src="<%= request.getContextPath() %>/images/ball.gif" vspace="6"></td>
    <td id="sectbody2">&nbsp;Beneficiary Bank</td>
  </tr>
</table>

<TABLE class="tableinfo" width=90%>
  <TR id="trdark">
    <TD width="30%" ALIGN=RIGHT>Name :</TD>
    <TD><INPUT TYPE="TEXT" NAME="BENE_BANK_NAME" READONLY VALUE="<%= transdatabean.getBENE_BANK_NAME().trim() %>" SIZE=35 MAXLENGTH="35"></TD>
  </TR>
  <TR id="trclear">
    <TD ALIGN=RIGHT valign="top"><br>Address :</TD>
    <TD><INPUT type="TEXT" name="BENE_BANK_ADD1" READONLY value="<%= transdatabean.getBENE_BANK_ADD1().trim() %>" size="35" maxlength="35"><br>
          <INPUT type="TEXT" name="BENE_BANK_ADD2" READONLY value="<%= transdatabean.getBENE_BANK_ADD2().trim() %>" size="35" maxlength="35"><br>
          <INPUT type="TEXT" name="BENE_BANK_ADD3" READONLY value="<%= transdatabean.getBENE_BANK_ADD3().trim() %>" size="35" maxlength="35"></TD>
  </TR>
  <TR id="trdark">
    <TD ALIGN=RIGHT>ABA Code :</TD>
    <TD><INPUT type="TEXT" name="BENE_BANK_ID" READONLY value="<%= transdatabean.getBENE_BANK_ID().trim() %>" size="35" maxlength="12"></TD>        
  </TR>
</TABLE>

<br>

<TABLE width=100%>
  <tr> 
    <td width="12"><img src="<%= request.getContextPath() %>/images/ball.gif" vspace="6"></td>
    <td id="sectbody2">&nbsp;Intermediary Bank ( Optional )</td>
  </tr>
</table>

<TABLE class="tableinfo" width=90%>
  <TR id="trclear">
    <TD width="30%" ALIGN=RIGHT>Name :  </TD>
    <TD><INPUT TYPE=TEXT NAME="INT_BANK_NAME" READONLY VALUE="<%= transdatabean.getINT_BANK_NAME().trim() %>" SIZE=35 MAXLENGTH=35></TD>
  </TR>
  <TR id="trdark">
    <TD ALIGN=RIGHT valign="top"><br>Address : </TD>
    <TD><INPUT TYPE=TEXT NAME="INT_BANK_ADD1" READONLY VALUE="<%= transdatabean.getINT_BANK_ADD1().trim() %>" SIZE=35 MAXLENGTH=35><br>
        <INPUT TYPE=TEXT NAME="INT_BANK_ADD2" READONLY VALUE="<%= transdatabean.getINT_BANK_ADD2().trim() %>" SIZE=35 MAXLENGTH=35><br>
        <INPUT TYPE=TEXT NAME="INT_BANK_ADD3" READONLY VALUE="<%= transdatabean.getINT_BANK_ADD3().trim() %>" SIZE=35 MAXLENGTH=35></TD>
  </TR>
  <TR id="trclear">
    <TD ALIGN=RIGHT>ABA Code </TD>
    <TD><INPUT type="text" name="INT_BANK_ID" READONLY value="<%= transdatabean.getINT_BANK_ID().trim() %>" size="35" maxlength="12"></TD>
  </TR>
</TABLE>

<br>

   <p align="center">
    <input id="EIBSBTN" type=button name="Submit" value="Return" onClick="window.location.href='DCIBS_transfer_external_us_list.jsp'">
  </p>   
</FORM>
</BODY>
</HTML>
 