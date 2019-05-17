<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>
Forms List
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<jsp:useBean id= "pdfList" class= "datapro.eibs.beans.JBObjList"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<script language="javascript">
  function showPDF(row, pdf) {
  	document.getElementsByName('ROW')[row].checked = true;
    document.forms[0].pdfName.value = pdf;
	CenterNamedWindow('','pdf',600,500,7);
	document.forms[0].submit();
  }
  
<%
boolean option = true;
if ( !userPO.getPurpose().equals("APPROVAL_INQ") ) {

	if ( userPO.getOption().equals("RT") ) {
%>
		builtNewMenu(rt_m_opt);
<%   
	} else if ( userPO.getOption().equals("SV") ) {
%>
		builtNewMenu(sv_m_opt);
<%   
	} else if (userPO.getOption().equals("CD")){
%>
		builtNewMenu(cd_m_opt);
<%   
	} else if (userPO.getOption().equals("LN")){
%>
		builtNewMenu(ln_m_opt);
<%   
	} else if ( userPO.getOption().equals("CLIENT_P") ) {
%>
		builtNewMenu(client_personal_opt);
<%      
	} else if ( userPO.getOption().equals("CLIENT_C") ) {
%>
		builtNewMenu(client_corp_opt);
<%      
	} else if ( userPO.getOption().equals("LC") ) {
%>
		builtNewMenu(lc_opening);
<% 
     } else if ( userPO.getOption().equals("LC_SB") ) {	
%>
        builtNewMenu(sb_opening);
 	
<%
    } else if (userPO.getHeader20().equals("COB")){
%>
      builtNewMenu(dc_d_maint);
<%          
	} else if ( userPO.getOption().equals("DV") ) {
%>
		builtNewMenu(coll_i_opt);
<%
	} else {
	     option = false;
	}
	     
} else {
	if ( userPO.getOption().equals("RT") ) {
%>
		builtNewMenu(rt_a_opt);
<%   
	} else if ( userPO.getOption().equals("SV") ) {
%>
		builtNewMenu(sv_a_opt);
<%   
	} else if (userPO.getOption().equals("CD")){
%>
		builtNewMenu(cd_a_opt);
<%   
	} else if (userPO.getOption().equals("LN")){
%>
		builtNewMenu(ln_a_opt);
<%   
	} else if ( userPO.getOption().equals("CLIENT_P") ) {
%>
		builtNewMenu(client_ap_personal_opt);
<%      
	} else if ( userPO.getOption().equals("CLIENT_C") ) {
%>
		builtNewMenu(client_ap_corp_opt);
<%      
	} else {
	     option = false;
	}
}
%>

</script>

</HEAD>

<BODY >

<%
	if ( option ) {
%>
	<SCRIPT Language="Javascript"> 
	   initMenu(); 
	</SCRIPT>
<%	} %>
  

<h3 align="center">Forms<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="forms_pdf_list.jsp, EFRM000"></h3>
<hr size="4">
<FORM Method="post" Action="<%= userPO.getRedirect() %>" target="pdf">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="3">
<INPUT TYPE=HIDDEN NAME="pdfName" VALUE="">

<% if (pdfList.getNoResult()) { %>
   		<TABLE class="tbenter" width=100% height=90%>
   		<TR>
      <TD> 
        
      <div align="center"> <font size="3"><b> There is no results for your search criteria. 
        </b></font> </div>
      </TD></TR>
   		</TABLE>
<% } else {	%>
	<TABLE class="tableinfo" ALIGN=CENTER >
          <%
				boolean firstTime = true;
				String chk = "";
                pdfList.initRow();
                while (pdfList.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
                 	datapro.eibs.beans.EFRM00001Message msg = (datapro.eibs.beans.EFRM00001Message) pdfList.getRecord();
		 %>
          <tr> 
            <td NOWRAP  align=CENTER width="10%"> 
              <input type="radio" name="ROW" value="<%= pdfList.getCurrentRow() %>" <%=chk%> >
            </td>
            <td NOWRAP align=LEFT width="80%"><A HREF="javascript:showPDF(<%= pdfList.getCurrentRow() %>, '<%= msg.getE01APFPTH() %>')"><%= msg.getE01APFDSC() %></A></td>
          </tr>
		<% } %>
	</TABLE>
<% } %>
</FORM>

</BODY>
</HTML>
