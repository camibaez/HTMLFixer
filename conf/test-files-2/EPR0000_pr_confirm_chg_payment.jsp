<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Internal/External Transfers</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<meta http-equiv="Refresh" CONTENT="7;url='javascript:finish();">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "prMant" class= "datapro.eibs.beans.EPR010001Message" scope="session" />
 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT LANGUAGE="javascript">
 function finish(){
 document.forms[0].submit();
// self.window.location.href = "file:///R:<%=request.getContextPath()%>_WebApp<%=request.getContextPath()%>/pages/background.jsp";
 }
 
</SCRIPT>

</head>

<body>
 
<h3 align="center">Financial Transactions Module<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="pr_confirm,EPR0000"></h3> 
<hr size="4">
 <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPR0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="9">
  <INPUT TYPE=HIDDEN NAME="REFNUM" VALUE="<%= prMant.getE01PRINUM().trim()%>">
<%
   if (prMant.getE01PRIDPC().equals("10") || prMant.getE01PRIDPC().equals("11") || prMant.getE01PRIDPC().equals("12")){
    double balBefTr = Double.parseDouble(prMant.getE01PRIPBF().trim()) + Double.parseDouble(prMant.getE01PRIIBF().trim());
    double balTr = Double.parseDouble(prMant.getE01PRIPAM().trim()) + Double.parseDouble(prMant.getE01PRIIAM().trim());
    double balPAftTr = Double.parseDouble(prMant.getE01PRIPBF().trim()) - Double.parseDouble(prMant.getE01PRIPAM().trim()) - Double.parseDouble(prMant.getE01PRIPEN().trim());
    double balIAftTr = Double.parseDouble(prMant.getE01PRIIBF().trim()) - Double.parseDouble(prMant.getE01PRIIAM().trim());
    double balTotAftTr = balPAftTr + balIAftTr;
%>
 <table class="tableinfo">
    <tr > 
      <td> 
        <p align="center">&nbsp; </p>
        <table width="100%">
          <tr> 
            <td width="9%">&nbsp;</td>
            <td colspan="4">Reference Number : <%= prMant.getE01PRINUM().trim()%> 
            </td>
          </tr>
          <tr> 
            <td width="9%">&nbsp;</td>
            <td align="center" colspan="4">&nbsp;</td>
          </tr>
          <tr> 
            <td width="9%">&nbsp;</td>
            <td >&nbsp; </td>
            <td >Principal</td>
            <td >Interest</td>
            <td >Balance</td>
          </tr>
          <tr> 
            <td width="9%">&nbsp;</td>
            <td >Before Transaction</td>
            <td ><%= prMant.getE01PRIPBF().trim()%></td>
            <td ><%= prMant.getE01PRIIBF().trim()%></td>
            <td ><%= balBefTr%></td>
          </tr>
          <tr> 
            <td width="9%">&nbsp;</td>
            <td >Transaction</td>
            <td ><%= prMant.getE01PRIPAM().trim()%></td>
            <td ><%= prMant.getE01PRIIAM().trim()%></td>
            <td ><%= balTr%></td>
          </tr>
          <tr> 
            <td width="9%">&nbsp;</td>
            <td >Penalty </td>
            <td ><%= prMant.getE01PRIPEN().trim()%></td>
            <td >&nbsp;</td>
            <td >&nbsp;</td>
          </tr>
          <tr> 
            <td width="9%">&nbsp;</td>
            <td>After Transaction</td>
            <td><%= balPAftTr%></td>
            <td><%= balIAftTr%></td>
            <td><%= balTotAftTr%></td>
          </tr>
          <tr> 
            <td width="9%">&nbsp;</td>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr> 
            <td width="9%">&nbsp;</td>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr> 
            <td width="9%">&nbsp;</td>
            <td colspan="4"> 
              <div align="center">The Transfer has been processed successfully, 
                please wait...</div>
            </td>
          </tr>
        </table>
        
      </td>
    </tr>
  </table>
<% } else { %>
  <table class="tableinfo">
    <tr > 
      <td>
         
        <table width="100%">
          <tr> 
            <td colspan="2"> 
              <div align="center">Reference Number : <%= prMant.getE01PRINUM().trim()%> 
              </div>
            </td>
          </tr>
          <tr> 
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr> 
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr> 
            <td colspan="2"> 
              <div align="center">The Transfer has been processed successfully, 
                please wait...</div>
            </td>
          </tr>
        </table>
        
      </td>
    </tr>
  </table>
<% } %>
  <p align="center">&nbsp; </p>
  <div align="center"> </div>
</form>
</body>
</html>
