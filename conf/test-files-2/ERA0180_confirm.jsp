<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Certificates of Deposit</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<meta http-equiv="Refresh" CONTENT="7;url='javascript:finish();">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT LANGUAGE="javascript">
 function finish(){
 self.window.location.href = "<%=request.getContextPath()%>/pages/background.jsp";
 }
 
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
<h3 align="center">Operation Confirmation</h3> 
<hr size="4">
 <FORM  >
  
  <table class="tableinfo" >
    <tr > 
      <td> 
        <p align="center">&nbsp; </p>
        <table width="100%">
          <tr> 
            <td width="28%">&nbsp;</td>
            <td width="72%">&nbsp;</td>
          </tr>
          <tr> 
            <td width="28%"> 
              <div align="right">Retail Account :</div>
            </td>
            <td width="72%"> <%= userPO.getIdentifier()%></td>
          </tr>
          <tr> 
            <td width="28%"> 
              <div align="right">Certificate of Deposit :</div>
            </td>
            <td width="72%"><%= userPO.getHeader1()%></td>
          </tr>
          <tr> 
            <td width="28%"> 
              <div align="right">Credit Limit Amount :</div>
            </td>
            <td width="72%"> 
              <div align="left"> <%= userPO.getHeader2()%> </div>
            </td>
          </tr>
          <tr> 
            <td colspan="2"> 
              <div align="center">This operation has been processed successfully, 
                please wait...</div>
            </td>
          </tr>
        </table>
        
      </td>
    </tr>
  </table>
  <p align="center">&nbsp; </p>
  <div align="center"> </div>
</form>
<SCRIPT language="javascript">
	setTimeout("finish()",10000);
</SCRIPT>
</body>
</html>
