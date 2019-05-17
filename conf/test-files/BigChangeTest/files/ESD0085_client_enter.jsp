<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Customer Names Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="msgClient" class="datapro.eibs.beans.ESD008501Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   function checkDel(obj){
     if (obj.checked) obj.value="Y"; else obj.value="";
   }
</SCRIPT>

</head>

<body>

 <h3 align="center">Customer Names Maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="client_enter, ESD0085"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0085">
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  </p>

   <table class="tableinfo">
    <tr>
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap align="right" valign="middle" width="49%">Customer Number :
            </td>
            <td nowrap align="left" valign="middle" colspan="2">
              <INPUT type="text" name="E85CUN" value="<%= msgClient.getE85CUN() %>" maxlength="10" size="11" onkeypress="enterInteger()">
              <a href="javascript:GetCustomerDescId('E85CUN','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap align="right" valign="middle" width="49%">Customer Name :
            </td>
            <td nowrap align="left" valign="middle" colspan="2">
              <input type="text" name="E85NA1" value="<%= msgClient.getE85NA1() %>" maxlength="45" size="45">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap align="center" valign="middle" colspan="3">
              Delete Data <input type="checkbox" name="H85WK1" value="<%= msgClient.getH85WK1() %>" onClick="checkDel(this)">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p align="center">
   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </p>
<script language="JavaScript">
  document.forms[0].E85CUN.focus();
  document.forms[0].E85CUN.select();
</script>
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
</form>
</body>
</html>
