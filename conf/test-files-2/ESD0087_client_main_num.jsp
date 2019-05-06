<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<TITLE>Customers Number</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</HEAD>

<SCRIPT LANGUAGE="JavaScript" SRC="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "msgcl" class= "datapro.eibs.beans.ESD008701Message"  scope="session" />

<body bgcolor="#FFFFFF">

<h3 align="center">Customers Number<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="client_main_num.jsp,ESD0087"></h3>
<hr>
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0087" >
  <CENTER>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
    <table cellspacing="0" cellpadding="2" class="tbenter" border=0   width=70% align="center" height="80%">
      <tr valign="middle">
        <td nowrap colspan="2" align="bottom" height="120">&nbsp;</td>
      </tr>
      <tr valign="middle">
        <td nowrap width=40% align="right" height="17" > Enter, Old Customer Number:</td>
        <td nowrap width=40% align="left" height="17" >
 		  <INPUT type="text" name="E01OLDCUS" size="15" maxlength="9" onkeypress="enterInteger()" value="<%= msgcl.getE01OLDCUS() %>">
          <a href="javascript:GetCustomerDescId('E01OLDCUS','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="absmiddle" border="0" ></a>
          &nbsp; </td>
      </tr>
      <tr valign="middle">
        <td nowrap width=40% align="right" height="17">Enter, New Customer Number: </td>
        <td nowrap width=40% align="left" height="17" >
           <INPUT type="text" name="E01NEWCUS" size="15" maxlength="9" onkeypress="enterInteger()" value="<%= msgcl.getE01NEWCUS() %>">
        </td>
      </tr>
      <tr>
        <td nowrap colspan="2" valign="middle" height="120">
          <div align="center">
            <input id="EIBSBTN" type=submit name="Submit" value="Submit">
          </div>
        </td>
      </tr>
      <tr>
        <td nowrap colspan="2" valign="middle">&nbsp;</td>
      </tr>
    </table>
  </CENTER>
<script language="JavaScript">
  document.forms[0].E01OLDCUS.focus();
  document.forms[0].E01OLDCUS.select();
</script>
<%
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT Language="Javascript">;
            showErrors();
     </SCRIPT>;
 <%
 }
%>
 </FORM>
</BODY>
</HTML>

