<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Redirector</title>

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">

<meta http-equiv="Refresh" CONTENT="3;url='<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0310?SCREEN=100'">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
</head>

<body>

 
<h3 align="center">Reports<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="report_redirect, EIE0500" ></h3>
<hr size="4">
  
<table class="tableinfo" width="782" height="432">
 
  <tr >       
    <td> 
      <table   width="100%">
        <tr > 
          <td nowrap>
            <div align="center"></div>
            <p align="center">Getting the Report ...</p>
          </td>
        </tr>
      </table>
      <div align="center"></div>
      </td>
    </tr>
  </table>

<SCRIPT language="JavaScript">
  invReports('<%=currUser.getH01USR()%>','f:\\iis\\dummy\\eibsreports\\reports\\','<%=request.getParameter("REPNAME")%>');       
</SCRIPT>
</body>
</html>
