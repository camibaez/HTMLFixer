<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>

<head>
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script language="JavaScript">
function enter(){
var Bank = top.opener.Bank;
var Currency = top.opener.Currency;
var AppCode = top.opener.AppCode;
var Type = top.opener.Type;
var NameSearch = document.forms[0].NameSearch.value;
var FromRecord = 0;
//parent.results.window.location.href="<%=request.getContextPath()%>/pages/e/MISC_search_wait.jsp?URL='<%=request.getContextPath()%>/pages/e/EWD0010_client_help_helpmessage.jsp?NameSearch=" + NameSearch + "@FromRecord=" + FromRecord + "@shrBank=" + Bank + "@shrAppCode=" +  AppCode + "@shrCurrency=" + Currency + "'";
parent.results.window.location.href="<%=request.getContextPath()%>/pages/e/MISC_search_wait.jsp?URL='<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0010?NameSearch=" + NameSearch + "@FromRecord=" + FromRecord + "@shrBank=" + Bank + "@shrAppCode=" +  AppCode + "@shrCurrency=" + Currency + "@shrType=" + Type + "'";

}
</script>
<TITLE></TITLE>
</head>

<body>
<FORM Action="javascript:enter()">

  <table id="tbhelp" align="center" width="510" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td align="center"><b>Chart of Accounts</b></td>
    </tr>
    <tr> 
      <td align="center">&nbsp;</td>
    </tr>
    <tr> 
      <td align="center">Please, enter the Initial Number :&nbsp; 
        <input type="text" name="NameSearch" size=16>
        &nbsp;&nbsp;<img src="<%=request.getContextPath()%>/images/search1.gif" onClick="enter()" width="25" height="21" > 
      </td>
    </tr>
  </table>
  
<script language="JavaScript">
  document.forms[0].NameSearch.focus();
</script>
  
</form>
</body>
</html>
