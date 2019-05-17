<html>
<head>
<title>Special Instructions</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id = "specInst" class= "datapro.eibs.beans.ESD000005Message"   scope="session" />

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   <% 
   if ( userPO.getOption().equals("CLIENT_P") ) {
   %>
		builtNewMenu(client_inq_personal_opt);
  <%      
   }
   else
   {
   %>
		builtNewMenu(client_inq_corp_opt);
   <%
   }
   %>
	
</SCRIPT>

</head>

<body bgcolor="#FFFFFF">

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 if ( !userPO.getPurpose().equals("NEW") ) {
    out.println("<SCRIPT> initMenu();  </SCRIPT>");
 }
%> 
<h3 align="center">Special Instructions<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="client_both_special_inst.jsp, ESD0080"></h3>
<hr size="4">

 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="36">
   
<p>
<table  class="tableinfo">
  <tr > 
    <td nowrap> 
      <table cellspacing="0" cellpadding="2" width="100%" class="tbhead" bgcolor="#FFFFFF" bordercolor="#FFFFFF" bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF"  align="center">
        <tr>
            <td nowrap align="right"> Customer: </td>
          <td nowrap align="left">
      			<%= userPO.getHeader1()%>
          </td>
            <td nowrap align="right"> ID:  
            </td>
          <td nowrap align="left">
      			<%= userPO.getHeader2()%>
          </td>
            <td nowrap align="right"> Name: </td>
          <td nowrap align="left">
      			<%= userPO.getHeader3()%>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</p>
<table  class="tableinfo">
    <tr > 
      <td nowrap align="center"> 

          <input type="text" readonly name="E15DSC" size="81" maxlength="80" value="<%= specInst.getE15DSC().trim()%>"><br>
          <input type="text" readonly name="E25DSC" size="81" maxlength="80" value="<%= specInst.getE25DSC().trim()%>"><br>
          <input type="text" readonly name="E35DSC" size="81" maxlength="80" value="<%= specInst.getE35DSC().trim()%>"><br>
          <input type="text" readonly name="E45DSC" size="81" maxlength="80" value="<%= specInst.getE45DSC().trim()%>"><br>
          <input type="text" readonly name="E55DSC" size="81" maxlength="80" value="<%= specInst.getE55DSC().trim()%>"><br>
          <input type="text" readonly name="E65DSC" size="81" maxlength="80" value="<%= specInst.getE65DSC().trim()%>"><br>
          <input type="text" readonly name="E75DSC" size="81" maxlength="80" value="<%= specInst.getE75DSC().trim()%>"><br>
          <input type="text" readonly name="E85DSC" size="81" maxlength="80" value="<%= specInst.getE85DSC().trim()%>"><br>
          <input type="text" readonly name="E95DSC" size="81" maxlength="80" value="<%= specInst.getE95DSC().trim()%>"><br>
          <input type="text" readonly name="E05DSC" size="81" maxlength="80" value="<%= specInst.getE05DSC().trim()%>"><br>
          <input type="text" readonly name="EA5DSC" size="81" maxlength="80" value="<%= specInst.getEA5DSC().trim()%>"><br>
          <input type="text" readonly name="EB5DSC" size="81" maxlength="80" value="<%= specInst.getEB5DSC().trim()%>"><br>
          <input type="text" readonly name="EC5DSC" size="81" maxlength="80" value="<%= specInst.getEC5DSC().trim()%>"><br>
          <input type="text" readonly name="ED5DSC" size="81" maxlength="80" value="<%= specInst.getED5DSC().trim()%>"><br>
          <input type="text" readonly name="EE5DSC" size="81" maxlength="80" value="<%= specInst.getEE5DSC().trim()%>"><br>
          <input type="text" readonly name="EF5DSC" size="81" maxlength="80" value="<%= specInst.getEF5DSC().trim()%>"><br>
          <input type="text" readonly name="EG5DSC" size="81" maxlength="80" value="<%= specInst.getEG5DSC().trim()%>"><br>
          <input type="text" readonly name="EH5DSC" size="81" maxlength="80" value="<%= specInst.getEH5DSC().trim()%>"><br>
          <input type="text" readonly name="EI5DSC" size="81" maxlength="80" value="<%= specInst.getEI5DSC().trim()%>"><br>
          <input type="text" readonly name="EJ5DSC" size="81" maxlength="80" value="<%= specInst.getEJ5DSC().trim()%>"><br>

      </td>
    </tr>
  </table>
  </form>
</body>
</html>
