<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Services Charges</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<SCRIPT language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

</HEAD>


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<BODY bgcolor="#FFFFFF">

<H3 align="center">Letters of Credit Commissions Table by Customer<IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="sc_cust_enter, ELC0600"></H3>

<HR size="4">


<FORM method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0600">
  <P> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="201">
  </P>
<BR>
  <TABLE class="tableinfo" id="clear"  cellspacing="0" cellpadding="2" width="100%"border="0" >   
          <TR> 
            <TD width="50%" nowrap> 
              <DIV align="right">Bank :</DIV>  
            </TD>
            <TD width="50%" nowrap>
             	<INPUT type="text" name="E01RLCBNK" size="3" maxlength="2" value="" onKeyPress="enterInteger()">
            </TD>
          </TR>  
          <TR> 
            <TD width="49%" nowrap> 
        <DIV align="right">Customer Number :</DIV>
      </TD>
      <TD width="51%" nowrap> 
        <INPUT type="text" name="E01RLCCUN" size="16" maxlength="9"
					value="">
        <A href="javascript:GetCustomerDescId('E01RLCCUN','','')"> 
        <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></A> 
      </TD> 
          </TR>        
        </TABLE>
 <P align="center"> 
    <INPUT id="EIBSBTN" type=submit name="Submit" value="Submit" >
  </P>  
<SCRIPT language="JavaScript">
  document.forms[0].E01RLCBNK.focus();
  document.forms[0].E01RLCBNK.select();
</SCRIPT>

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