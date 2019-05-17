<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Commercial Paper</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "cdFinish" class= "datapro.eibs.beans.EFT000010Message" scope="session" />
 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT LANGUAGE="javascript">
 function finish(){
 self.window.location.href = "<%=request.getContextPath()%>/pages/background.jsp";
 }
 
 	setTimeout("document.forms[0].submit();", 7000);
</SCRIPT>

</head>

<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
 	 error.setERRNUM("0");
    out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 } 
%> 
<h3 align="center">Commercial Paper Confirmation<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cp_confirm.jsp,EDL0105"></h3> 
<hr size="4">
 <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0105" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="48">
  <table class="tableinfo">
    <tr > 
      <td> 
        <p align="center">&nbsp; </p>
        <table width="100%">
          <tr>
            <td width="9%">&nbsp;</td>
            <td width="91%"> 
              <div align="center"> <%= cdFinish.getE10BANKNM().trim()%> </div>
            </td>
          </tr>
          <tr>
            <td width="9%">&nbsp;</td>
            <td width="91%">&nbsp;</td>
          </tr>
          <tr>
            <td width="9%">&nbsp;</td>
            <td width="91%">Commercial Paper Number : <%= datapro.eibs.master.Util.justifyRight(cdFinish.getE10DEAACC().trim(),9)%> 
              <input type=HIDDEN name="E10DEAACC" value="<%= cdFinish.getE10DEAACC()%>">
            </td>
          </tr>
          <tr>
            <td width="9%">&nbsp;</td>
            <td width="91%">&nbsp;</td>
          </tr>
          <tr>
            <td width="9%">&nbsp;</td>
            <td width="91%"> 
              <div align="left"> In favor of : <%= cdFinish.getE10CUSNA1().trim()%> 
                , and a face value of $ <%= Util.fcolorCCY(cdFinish.getE10DEAOAM().trim())%> 
              </div>
            </td>
          </tr>
          <tr>
            <td height="35" width="9%">&nbsp;</td>
            <td height="35" width="91%"> <%= cdFinish.getE10LETOAM().trim()%> 
            </td>
          </tr>
          <tr>
            <td width="9%">&nbsp;</td>
            <td width="91%"> with opening date : <%= Util.formatDate(cdFinish.getE10DEAOD1().trim(),cdFinish.getE10DEAOD2().trim(),cdFinish.getE10DEAOD3().trim())%> 
              and maturity date: <%= Util.formatDate(cdFinish.getE10DEAMD1().trim(),cdFinish.getE10DEAMD2().trim(),cdFinish.getE10DEAMD3().trim())%> 
            </td>
          </tr>
          <tr>
            <td width="9%">&nbsp;</td>
            <td width="91%">with a term of <%= cdFinish.getE10DEATRM().trim()%> 
              - <% if(cdFinish.getE10DEATRC().equals("Y")) out.print("Years");
              				else if(cdFinish.getE10DEATRC().equals("M")) out.print("Months");
							else out.print("Days");%> and interest rate : <%= cdFinish.getE10RATE().trim()%> 
              %</td>
          </tr>
          <tr>
            <td width="9%">&nbsp;</td>
            <td width="91%">&nbsp;</td>
          </tr>
          <tr>
            <td width="9%">&nbsp;</td>
            <td width="91%"> 
              <div align="center">The Deal has been processed successfully, please 
                wait...</div>
            </td>
          </tr>
        </table>
        
      </td>
    </tr>
  </table>
  <p align="center">&nbsp; </p>
  <div align="center"> </div>
</form>
</body>
</html>
