<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK HREF="<%=request.getContextPath()%>/pages/style.css" REL="stylesheet">
<TITLE>eIBS Teller Transaction LogIn</TITLE>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<BODY>
<h3 align="center">TELLER TRANSACTIONS<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="teller_login.jsp, EDD0330"></h3>
<hr size="4">
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.teller.JSEDD0330">
  <INPUT TYPE="hidden" NAME="Language" VALUE="e/">
  <INPUT TYPE="hidden" NAME="SCREEN" VALUE="100">
  
<% 
String user = "";
user = currUser.getH01USR().substring(3, 6);
if ( !error.getERRNUM().equals("0")  ) {
%> 
<table width="100%" border="0" cellspacing="2" cellpadding="2" class="tbenter" align="center">
	<tr>
    	<td width="33"><img src="<%=request.getContextPath()%>/images/warning.gif" width="32" height="32"></td>
        <td valign="bottom"> 
          <table class="tbenter" width="100%" border="1" cellspacing="0" cellpadding="2" align="center" bordercolor="#FF0033">
            <tr valign="top"> 
              <td valign="middle">
                <div align="center">
       				<font color="red"><B> <%= error.getERDS01()%> </B></font>
    			</div>
              </td>
            </tr>
          </table>
        </td>
        <td width="33"><img src="<%=request.getContextPath()%>/images/warning.gif" width="32" height="32"></td>
	</tr>
</table>
<br><br><br><br>
<%
} else {
%>
<br><br><br><br><br><br>
<%
}
%>
<DIV align="center">
 
<table class="tableinfo">
	<TR id="trdark">
    	<TD ALIGN="right" width="40%"> Teller ID :</TD>
        <TD ALIGN="left" width="60%"><INPUT type="text" SIZE=4 MAXLENGTH=3 NAME="UserId" value="<%= user %>" READONLY></TD>
    </TR>
	<TR id="trclear">
        <TD ALIGN=right width="40%" > Currency :</TD>
        <td align="left"  width="60%"><input type="text" name="Currency" size="4" maxlength="3" value="">					
            <a href="javascript:GetCurrency('Currency','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0"></a> 
        </td>
 	</TR>
	<TR id=trdark>
        <TD ALIGN=right width="40%" > Password :</TD>
        <TD ALIGN="left" width="60%"><INPUT TYPE="password" SIZE="12" MAXLENGTH="10" NAME="Password"></TD>
 	</TR>
	<TR id="trclear">
        <TD ALIGN=right width="40%" > Transaction Code :</TD>
        <td align="left"  width="60%"><input type="text" name="Code" size="4" maxlength="3" value="">					
            <a href="javascript:GetTransactionCodes('Code', document.forms[0].UserId.value, document.forms[0].Currency.value, document.forms[0].Password.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0"></a> 
        </td>
 	</TR>
</TABLE>
     
<BR>
   
<TABLE class="tbenter" WIDTH="100%" BORDER=0>
	<TR> 
    	<TD VALIGN=middle> 
          <div align="center"> 
            <input type=image name="imgLogin" src="<%=request.getContextPath()%>/images/e/login.gif" onClick="imgDown('imgLogin', 'login_over.gif')">
          </div>
        </TD>
    </TR>
</TABLE>
		 
</DIV>

</FORM>  

<script language="JavaScript">
  document.forms[0].Currency.focus();
  document.forms[0].Currency.select();
</script>

</BODY>
</HTML>
