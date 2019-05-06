<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>Line of Credit Approval</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<SCRIPT LANGUAGE="JavaScript" SRC="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

</HEAD>

<body>

<h3 align="center">Line of Credit Approval Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="cl_ap_enter_maint, ELN0040"></h3>
<hr>
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.credit.JSELN0000A" >
  <CENTER>
    <p><INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
    </p>
    <table cellspacing="0" cellpadding="2" class="tbenter" border=0   width=70% align="center" height="80%">
      <tr valign="middle">
        <td nowrap colspan="2" align="middle" height="131">&nbsp;</td>
      </tr>
      <tr valign="middle">
        <td nowrap width=40% align="right" height="24"> Enter Customer Number
          : </td>
        <td nowrap width=40% align="left" height="24" >
          <INPUT type="text" name="CUSNUM" size="15" maxlength="9" onkeypress="enterInteger()">
            <a href="javascript:GetCustomerDescId('CUSNUM','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="absmiddle" border="0" ></a>
        </td>
      </tr>
      <tr valign="middle">
        <td nowrap width=40% align="right" height="28" > Enter Line of Credit
          Number : </td>
        <td nowrap width=40% align="left" height="28" >
          <input type=TEXT name="LNENUM" value="" size="5" maxlength="4"  onkeypress="enterInteger()">
            <a href="javascript:GetCreditLine('LNENUM',document.forms[0].CUSNUM.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="absmiddle" border="0" ></a>
        </td>
      </tr>
      <tr>
        <td nowrap colspan="2" valign="middle" height="100">
          <div align="center">
 				<input type=image class="imgfilter" name="Submit" src="<%=request.getContextPath()%>/images/e/bt_submit.gif"
 				 onMouseDown="this.className='imgfilterpress'" onMouseUp="this.className='imgfilter'">
          </div>
        </td>
      </tr>
      <tr>
        <td nowrap colspan="2" valign="middle">&nbsp;</td>
      </tr>
    </table>
  </CENTER>
<script language="JavaScript">
  document.forms[0].CUSNUM.focus();
  document.forms[0].CUSNUM.select();
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
