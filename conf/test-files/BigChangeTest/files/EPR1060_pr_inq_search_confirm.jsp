<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Process Excel</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="Refresh" CONTENT="10;url='javascript:document.forms[0].submit();">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT LANGUAGE="javascript">
 function finish(){
 self.window.location.href = "<%=request.getContextPath()%>/pages/e/EDD0924_report_demand.jsp";
 }
 
</SCRIPT>
</head>

   
<body>

<h3 align="center">Process Excel<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="pr_inq_search_confirm.jsp,EPR1060" width="32" height="32" ></h3>
<hr size="4">


 <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPR1060" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1">

  <h4>&nbsp;</h4>
  <h4>&nbsp;</h4>
  <h4>&nbsp;</h4>
  <h4>&nbsp;</h4>
  <h4>&nbsp;</h4>
  <h4>&nbsp;</h4>
  <h4>&nbsp;</h4>
  
     
  <table class="tableinfo" >
    <tr id="trclear"> 
      <td nowrap colspan="3" > 
        <div align="center"><font size="2">The broader the date range entered as search criteria, the longer the system will take to process the spool file.<br>
        Please take the Report Option from main menu and choose the User Spool to display the Excel File. </font></div>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <h4>&nbsp;</h4>
  <p align="center">&nbsp;</p>
  </form>
</body>
</html>
