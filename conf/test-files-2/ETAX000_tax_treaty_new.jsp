<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title></title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id= "msgNew" class= "datapro.eibs.beans.ETAX00001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
	 error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%> 

<H3 align="center">Tax Treaty Table - New<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="our_denial_maint, EDEN020"></H3>
<hr size="4">
<form METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSETAX000">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right"><b>Income Code :</b></div>
            </td>
            <td nowrap width="75%"  > 
              <div align="left"> 
					<INPUT type="text" name="E01TAXINC" size="7" maxlength="6" value="<%= userPO.getHeader1().trim()%>" readonly>
	                
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right"><b>Country Code :</b></div>
            </td>
            <td nowrap width="75%" > 
              <div align="left"> 
	              <input type="text" name="E01TAXCTR" size="4" maxlength="3"  value="<%= userPO.getHeader2().trim()%>" readonly>
                
              </div>
            </td>
           </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right"><b>Withhholding Tax Rate :</b></div>
            </td>
            <td nowrap width="75%" > 
              <div align="left"> 
                <input type="text" name="E01TAXRTE" size="12" maxlength="11"  value="<%= msgNew.getE01TAXRTE().trim()%>" onkeypress="enterSignDecimal()">
              </div>
            </td>
          </tr>         
        </table>
      </td>
    </tr>
  </table>
   <div align="center"> 
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>
  
</form>
</body>
</html>
