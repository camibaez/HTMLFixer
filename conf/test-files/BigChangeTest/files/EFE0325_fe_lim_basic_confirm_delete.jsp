<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Customer Settlement Limits</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">



<jsp:useBean id="fex" class="datapro.eibs.beans.EFE0325DSMessage"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

</head>
<body nowrap>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%> 
<h3 align="center"> Customer Settlement Limits - Operation Confirmation<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="ln_basic.jsp,EDL0150"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0325" >
  <p>
    <input type=HIDDEN name="SCREEN" value="4">
  </p>
  <p>&nbsp; </p>
  <table  class="tableinfo" width="545">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap colspan="2" >The Settlement Limits for <%= fex.getD01FEOCP1()%> 
              have been deleted </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="36%" > 
              <div align="right">Limit Currency :</div>
            </td>
            <td nowrap width="64%" > <%= fex.getE01FEOCCY().trim()%> - <%= Util.fcolorCCY(fex.getE01FEOLIM())%> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="36%" > 
              <div align="right">Used Amount :</div>
            </td>
            <td nowrap width="64%" ><%= Util.fcolorCCY(fex.getE01FEOUTI())%></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="36%" > 
              <div align="right">Settlement Date :</div>
            </td>
            <td nowrap width="64%" > <%= Util.formatDate(fex.getE01FEODT1(),fex.getE01FEODT2(),fex.getE01FEODT3())%> 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <BR>
  </form>
</body>
</html>
