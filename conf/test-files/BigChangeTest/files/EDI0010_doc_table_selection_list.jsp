<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>
Document List
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "tblList" class= "datapro.eibs.beans.JBList"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<SCRIPT SRC="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"></SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT language="javascript">

<%
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
		 builtNewMenu(lc_i_opt);
  <%      
 }
else if ( userPO.getOption().equals("DV") ) {
   %>
		 builtNewMenu(coll_i_opt);
   <%
   }
else if ( userPO.getOption().equals("PORTAFOLIO") ) {
   %>
		 builtNewMenu(cus_port_opt);
   <%
   }   
   %>

</SCRIPT>

</HEAD>

<BODY >


<SCRIPT Language="Javascript"> 
     initMenu();
</SCRIPT>

<h3 align="center">Documents<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="doc_table_selection_list.jsp, EDI0010"></h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1">
<INPUT TYPE=HIDDEN NAME="Type" VALUE="<%= userPO.getHeader22()%>">
<%
if ( tblList.getNoResult() ) {
%>
  
  <TABLE class="tbenter" width=100% height=100%>
    <TR>
      <TD> 
        <div align="center">
          <font size="3"><b>
        	There is no match for your search criteria 
          </b></font>
        </div>
      </TD>
    </TR>
  </TABLE>

<%   		
}
else {
%>
<h4>Select Table</h4>
<TABLE  id="mainTable" class="tableinfo"  NOWRAP>
    <TR id="trdark"> 
      <TH ALIGN=CENTER NOWRAP></TH>
      <TH ALIGN=CENTER NOWRAP>Table</TH>
      <TH ALIGN=CENTER NOWRAP>Description</TH>
    </TR>
  
    <%
                tblList.initRow();
                while (tblList.getNextRow()) {
                    if (tblList.getFlag().equals("")) {
                       out.println(tblList.getRecord());
                    }
                }
    %> 
    
</TABLE>

<br>
 <div align="center"> 
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>      
<%
}
%>

</FORM>

</BODY>
</HTML>
