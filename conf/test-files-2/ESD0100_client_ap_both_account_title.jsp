<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Account Title</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</head>

<jsp:useBean id= "mailA" class= "datapro.eibs.beans.ESD000004Message"  scope="session"/>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

     <% 
   if ( userPO.getOption().equals("CLIENT_P") ) {
   %>
		builtNewMenu(client_ap_personal_opt);
  <%      
   }
   else
   {
   %>
		builtNewMenu(client_ap_corp_opt);
   <%
   }
   %>

</SCRIPT>

<body >
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
  if ( !userPO.getPurpose().equals("NEW") ) {
    out.println("<SCRIPT> initMenu(); </SCRIPT>");
 }
%> 
<h3 align="center">Account Title<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="client_ap_both_account_title, ESD0100" ></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="66">
  

<table class="tableinfo">
  <tr > 
    <td nowrap> 
      <table cellspacing="0" cellpadding="2" width="100%" class="tbhead" bgcolor="#FFFFFF" bordercolor="#FFFFFF" bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF"  align="center">
        <tr>
             
            <td nowrap width="10%" align="right"> Customer: </td>
          <td nowrap width="12%" align="left">
      			<%= userPO.getHeader1()%>
          </td>
            <td nowrap width="6%" align="right">ID:  
            </td>
          <td nowrap width="14%" align="left">
      			<%= userPO.getHeader2()%>
          </td>
            <td nowrap width="8%" align="right"> Name: </td>
          <td nowrap width="50%"align="left">
      			<%= userPO.getHeader3()%>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<br>

  <table id="mainTable9" class="tableinfo">
   <tr bordercolor="#FFFFFF"> 
      <td nowrap >
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">
         <tr id="trdark"> 
            <td nowrap width="42%"> 
              <div align="right">Legal Name :</div>
            </td>
            <td nowrap width="58%"> 
              <input type="text" name="E94MA1" maxlength="45" size="46" value="<%= mailA.getField("E94MA1").getString().trim()%>" readonly>
            </td>
          </tr>
         <tr> 
            <td nowrap width="42%"> 
              <div align="right">Title/Address :</div>
            </td>
            <td nowrap width="58%"> 
              <input type="text" name="E94MA2" maxlength="35" size="36" value="<%= mailA.getField("E94MA2").getString().trim()%>" readonly>
            </td>
          </tr>
         <tr id="trdark"> 
            <td nowrap width="42%"> 
              <div align="right">Address :</div>
            </td>
            <td nowrap width="58%"> 
              <input type="text" name="E94MA3" maxlength="35" size="36" value="<%= mailA.getField("E94MA3").getString().trim()%>" readonly>
            </td>
          </tr>
         <tr> 
            <td nowrap width="42%"> 
              <div align="right">Address :</div>
            </td>
            <td nowrap width="58%"> 
              <input type="text" name="E94MA4" maxlength="35" size="36" value="<%= mailA.getField("E94MA4").getString().trim()%>" readonly>
            </td>
          </tr>
         <tr id="trdark"> 
            <td nowrap width="42%"> 
              <div align="right">City :</div>
            </td>
            <td nowrap width="58%"> 
              <input type="text" name="E94CTY" maxlength="30" size="31" value="<%= mailA.getField("E94CTY").getString().trim()%>" readonly>
            </td>
          </tr>
         <tr> 
            <td nowrap width="42%"> 
              <div align="right">State :</div>
            </td>
            <td nowrap width="58%"> 
              <input type="text" name="E94STE" maxlength="4" size="5" value="<%= mailA.getField("E94STE").getString().trim()%>" readonly>
            </td>
          </tr>
         <tr id="trdark"> 
            <td nowrap width="42%"> 
              <div align="right">Country :</div>
            </td>
            <td nowrap width="58%"> 
              <input type="text" name="E94CTR" maxlength="20" size="21" value="<%= mailA.getField("E94CTR").getString().trim()%>" readonly>
            </td>
          </tr>
         <tr> 
            <td nowrap width="42%"> 
              <div align="right">P.O.Box :</div>
            </td>
            <td nowrap width="58%"> 
              <input type="text" name="E94POB" maxlength="10" size="11" value="<%= mailA.getField("E94POB").getString().trim()%>" readonly>
            </td>
          </tr>
         <tr id="trdark"> 
            <td nowrap width="42%"> 
              <div align="right">Zip Code :</div>
            </td>
            <td nowrap width="58%"> 
              <input type="text" name="E94ZPC" maxlength="15" size="16" value="<%= mailA.getField("E94ZPC").getString().trim()%>" readonly>
            </td>
          </tr>
         <tr> 
            <td nowrap width="42%"> 
              <div align="right">Mailing Code :</div>
            </td>
            <td nowrap width="58%"> 
              <input type="text" name="E94MLC" maxlength="3" size="4" value="<%= mailA.getField("E94MLC").getString().trim()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  </form>
</body>
</html>
