<%@ page import = "java.io.*,java.net.*" %>
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1"> 
<TITLE>Error</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</HEAD>

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<SCRIPT SRC="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"></SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

 <%
boolean option = true;
if ( userPO.getPurpose().equals("MAINTENANCE") || userPO.getPurpose().equals("NEW") ) 
 {

if ( userPO.getOption().equals("RT") ) {
%>
	builtNewMenu(rt_m_opt);
<%   
}
else if ( userPO.getOption().equals("SV") ) {
%>
	builtNewMenu(sv_m_opt);
<%   
}
else if (userPO.getOption().equals("CD")){
%>
	builtNewMenu(cd_m_opt);
<%   
}
else if (userPO.getOption().equals("LN")){
%>
	builtNewMenu(ln_m_opt);
   <%   
 }
else if ( userPO.getOption().equals("CLIENT_P") ) {
   %>
		builtNewMenu(client_personal_opt);
  <%      
 }
else if ( userPO.getOption().equals("CLIENT_C") ) {
   %>
		builtNewMenu(client_corp_opt);
  <%      
 }
else if ( userPO.getOption().equals("LC") ) {
   %>
		vbuiltNewMenu(lc_i_opt);
  <%      
 }
else if ( userPO.getOption().equals("DV") ) {
   %>
		builtNewMenu(coll_i_opt);
   <%
   }
 else {
     option = false;
   }  
   }

else
{   
   if ( userPO.getOption().equals("RT") ) {
%>
	builtNewMenu(rt_a_opt);
<%   
}
else if ( userPO.getOption().equals("SV") ) {
%>
	builtNewMenu(sv_a_opt);
<%   
}
else if (userPO.getOption().equals("CD")){
%>
	builtNewMenu(cd_a_opt);
<%   
}
else if (userPO.getOption().equals("LN")){
%>
	builtNewMenu(ln_a_opt);
   <%   
 }
else if ( userPO.getOption().equals("CLIENT_P") ) {
   %>
		builtNewMenu(client_ap_personal_opt);
  <%      
 }
else if ( userPO.getOption().equals("CLIENT_C") ) {
   %>
		builtNewMenu(client_ap_corp_opt);
  <%      
 }
 else {
     option = false;
   }  
   }
   
%>   
</SCRIPT>

</HEAD>

<BODY >

<%
 if ( option ) {
%>
<SCRIPT Language="Javascript"> 
   initMenu();
</SCRIPT>
<%
}
%>
  
<h3 align="center">Form Request Error<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="forms_req_error, EFRM000"></h3>
<hr size="4">
<table cellspacing="0" cellpadding="2" class="tbenter"  border=0  width=70% height=70% align="center" >
    <tr>
      
    <td align=middle> 
      <div align="center"><font size="3"><b> 
           <% 
      				String error_msg = (String) session.getValue("error_msg");
      				if ( !error_msg.equals("") ) {
                     out.print(error_msg);
                  }
                  else {
            %> 
                  There are no forms with this option. 
            <%        
                  }
            %> 
      </b></font> </div>
    </td>
    </tr>
</table>
</BODY>
</HTML>
 