<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>Averages</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<SCRIPT LANGUAGE="JavaScript" SRC="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id= "average" class= "datapro.eibs.beans.ECIF04001Message"  scope="session" />
<jsp:useBean id="userPO" class= "datapro.eibs.beans.UserPos"   scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<SCRIPT>
<%
if (userPO.getPurpose().equals("INQUIRY")){
%>

    <%
    if ( userPO.getOption().equals("RT") ) {
    %>
	 builtNewMenu(rt_i_opt);
    <%
    }
    else if ( userPO.getOption().equals("SV") ) {
    %>
    builtNewMenu(sv_i_opt);
    <%
    }
	else if ( userPO.getOption().equals("CD") ) {
    %>
    builtNewMenu(cd_i_opt);
    <%
    }
	else if (userPO.getOption().equals("LN")) {
    %>
    <%
     if ( userPO.getHeader23().equals("G") ||  userPO.getHeader23().equals("V")){
    %>
	builtNewMenu(ln_i_1_opt);
   <%
   }
    else  {
   %>
	builtNewMenu(ln_i_2_opt);
   <%
   }
   %>
  <%
   }
   %>

<%
}
%>

</SCRIPT>
<SCRIPT Language="javascript">

function CheckACC(){
if ( document.forms[0].E01ACCNUM.value.length < 1) {
  alert("A valid account number must be entered");
  document.forms[0].E01ACCNUM.value='';
  document.forms[0].E01ACCNUM.focus();
}
else {
  document.forms[0].submit();
  }
}

</SCRIPT>
</HEAD>

<body>

 <% if ( !error.getERRNUM().equals("0")  ) {
	  error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
   if (userPO.getPurpose().equals("INQUIRY")){
   out.println("<SCRIPT> initMenu();  </SCRIPT>");}
 %>

<h3 align="center">Average Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="average_enter, ECIF040"></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF040" >

    <p><INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
    </p>
    <table class="tbenter"  border=0  width="100%" height="75%">
      <tr >
        <td nowrap align="center" >
          Account Number :
         <INPUT type="text" name="E01ACCNUM" value="<%= client.getE01ACCNUM() %>" size="15" maxlength="9" onkeypress="enterInteger()">
          <a href="javascript:GetAccount('E01ACCNUM','','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
         <div align="center">
	   <input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="CheckACC()">
  </div>
        </td>

      </tr>
    </table>

 <script language="JavaScript">
  document.forms[0].E01ACCNUM.focus();
  document.forms[0].E01ACCNUM.select();
</script>
</FORM>
</BODY>
</HTML>
