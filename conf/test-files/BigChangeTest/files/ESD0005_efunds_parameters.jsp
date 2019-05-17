<html>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id="error" class= "datapro.eibs.beans.ELEERRMessage" scope="session"/>
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="efunds" class="datapro.eibs.beans.ESD000508Message" scope="session" />
<%
	String title = "Clarke American"; 
	if (efunds.getH08FLGWK1().equals("E")) title= "eFUNDS";
%>

<SCRIPT Language="Javascript">
	   function checkDel(obj){
	     if (obj.checked) obj.value="X"; else obj.value="";
	   } 
</SCRIPT>

</head>
<body>
 <h3 align="center">Control Parameters - <%= title %><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="efunds_parameters.jsp,ESD0005"> 
  </h3>
  <hr size="4">
 
 <% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
    }
%>
<% if (efunds.getH08FLGWK1().equals("E")) {%>
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0005EFUNDS" >
<% } else { %>
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0005" >
<% } %>
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  <INPUT TYPE=HIDDEN NAME="E08EFNBNK" VALUE="<%= efunds.getE08EFNBNK()%>">
  <INPUT TYPE=HIDDEN NAME="PREEFNPWD" VALUE="<%= efunds.getE08EFNPWD()%>">
  <input type="hidden" name="H08FLGWK1" value="<%= efunds.getH08FLGWK1()%>">
          
  <h4>Basic Information</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
         <% if (efunds.getH08FLGWK1().equals("E")) {%>
          <tr id=trdark> 
            <td width="40%" nowrap> 
              <div align="right">Security User ID :</div>
            </td>
            <td width="60%" nowrap> 
              <input type="text" name="E08EFNUID" size="30" maxlength="40" value="<%= efunds.getE08EFNUID()%>">
            </td>
          </tr>
          <tr id=trclear> 
            <td width="40%" nowrap> 
              <div align="right">Security Password :</div>
            </td>
            <td width="60%" nowrap> 
              <input type="password" name="E08EFNPWD" size="36" maxlength="35" value="<%= efunds.getE08EFNPWD()%>">
            </td>
          </tr>
          <tr id=trdark> 
            <td width="40%" nowrap> 
              <div align="right">Customer ID :</div>
            </td>
            <td width="60%" nowrap> 
              <input type="text" name="E08EFNCID" size="30" maxlength="30" value="<%= efunds.getE08EFNCID()%>" >
            </td>
          </tr> 
          <tr id=trclear> 
            <td width="40%" nowrap> 
              <div align="right"></div>
            </td>
            <td width="60%" nowrap> 
              <input type="checkbox" name="E02SEND" value="" onClick="checkDel(this)">Send Change Password Request to eFunds
            </td>
          </tr>           
          <input type="hidden" name="E08EFNUIC" value="<%= efunds.getE08EFNUIC()%>">
          <input type="hidden" name="E08EFNPWC" value="<%= efunds.getE08EFNPWC()%>">

        <% } else { %>
          <tr id=trdark> 
            <td width="40%" nowrap> 
              <div align="right">User ID :</div>
            </td>
            <td width="60%" nowrap> 
              <input type="text" name="E08EFNUIC" size="10" maxlength="8" value="<%= efunds.getE08EFNUIC()%>">
            </td>
          </tr>
          <tr id=trclear> 
            <td width="40%" nowrap> 
              <div align="right">Password :</div>
            </td>
            <td width="60%" nowrap> 
              <input type="password" name="E08EFNPWC" size="10" maxlength="8" value="<%= efunds.getE08EFNPWC()%>">
            </td>
          </tr>
          <input type="hidden" name="E08EFNUID" value="<%= efunds.getE08EFNUID()%>">
          <input type="hidden" name="E08EFNPWD" value="<%= efunds.getE08EFNPWD()%>">
          <input type="hidden" name="E08EFNCID" value="<%= efunds.getE08EFNCID()%>">  
        <% } %>
        </table>
      </td>
    </tr>
  </table>
 
  <p align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </p>
  
 
</form>
</body>
</html>
