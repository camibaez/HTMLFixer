 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>

<head>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<style>
TH {
  background: #FFFFFF;
}
</style>
<script language="JavaScript">
function enter(){


var pos = document.forms[0].Pos.value;
var DESCRIPTION = document.forms[0].DESCRIPTION.value;
var ISINNUM = document.forms[0].ISINNUM.value;

parent.results.window.location.href="<%=request.getContextPath()%>/pages/e/MISC_search_wait.jsp?URL='<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0308F?DESCRIPTION=" + DESCRIPTION + "@ISINNUM=" + ISINNUM + "@Pos=" + pos + "'";
}
 
</script>
</head>

<body>
<FORM Action="javascript:enter()">

  <table id="tbhelp" align="center" width="556" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td align="center"><b>Instrument Search</b></td>
    </tr>
    <tr>
      <td align="center">&nbsp;</td>
    </tr>
    <tr> 
      <td align="left"><b>Search By : </b></td>
    </tr>
    
    <tr> 
      <td align="center">Instrument Description : <input type="text" name="DESCRIPTION" size="40" maxlength="40">
        <input type="hidden" name="Pos">
        <img src="<%=request.getContextPath()%>/images/search1.gif" onClick="enter()"></td>
       
    </tr>
    <td align="center">ISIN Number : <input type="text" name="ISINNUM" size="37" maxlength="14"> 
    <tr>
    </tr>
  </table>
  
<script language="JavaScript">
  document.forms[0].DESCRIPTION.focus();
  document.forms[0].ISINNUM.focus();
</script>
  
</form>
</body>
</html>

 