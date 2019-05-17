<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>
Módulo de Solicitudes
</TITLE>

<%@ page import = "datapro.eibs.master.Util" %>

<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "EWD0414DSHelp" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

</HEAD>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<BODY >
<h3 align="center">Módulo de Solicitudes - Consulta<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="inq_list.jsp,EWD0414"> 
  </h3>
<hr size="4">
  
  
<FORM >

<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
 
   <table  id=cfTable class="tableinfo">
    <tr > 
      <td NOWRAP valign="top" width="100%"> 
        <table id="headTable" width="100%">
          <tr id="trdark"> 
            <th align=CENTER nowrap width="20%"> 
              <div align="center">Número<BR>Solicitud</div>
            </th>
            <th align=CENTER nowrap width="20%"> 
              <div align="center">Tipo</div>
            </th>
            <th align=CENTER nowrap width="20%"> 
              <div align="center">Referencia</div>
            </th>
            <th align=CENTER nowrap width="20%"> 
              <div align="center">Fecha<br>Ingreso</div>
            </th>
            <th align=CENTER nowrap width="20%"> 
              <div align="center">Estado</div>
            </th>            
          </tr>
          <%
          EWD0414DSHelp.initRow();
          boolean firstTime = true;
          String chk = "";
                while (EWD0414DSHelp.getNextRow()) {
				if (firstTime) {
					firstTime = false;
					chk = "checked";
				} else {
					chk = "";
				}
                 
                datapro.eibs.beans.EWD0414DSMessage msgList = (datapro.eibs.beans.EWD0414DSMessage) EWD0414DSHelp.getRecord();
		  %>
          <tr> 
            <td NOWRAP  align=LEFT width=\"20%\"><A HREF="javascript:showInqSolicitud('<%=msgList.getSWDRQN()%>','<%=msgList.getSWDTYP()%>','<%=msgList.getSWDCLS()%>')"><%= msgList.getSWDRQN() %></A></td>
            <td NOWRAP  align=LEFT width=\"20%\"><A HREF="javascript:showInqSolicitud('<%=msgList.getSWDRQN()%>','<%=msgList.getSWDTYP()%>','<%=msgList.getSWDCLS()%>')"><%= msgList.getSWDTDS() %></A></td>
            <td NOWRAP  align=LEFT width=\"20%\"><A HREF="javascript:showInqSolicitud('<%=msgList.getSWDRQN()%>','<%=msgList.getSWDTYP()%>','<%=msgList.getSWDCLS()%>')"><%= msgList.getSWDREF() %></A></td>
            <td NOWRAP  align=CENTER width=\"20%\"><A HREF="javascript:showInqSolicitud('<%=msgList.getSWDRQN()%>','<%=msgList.getSWDTYP()%>','<%=msgList.getSWDCLS()%>')"><%= Util.formatDate(msgList.getSWDINM(),msgList.getSWDIND(),msgList.getSWDINY()) %></A></td>
            <td NOWRAP  align=LEFT width=\"20%\"><A HREF="javascript:showInqSolicitud('<%=msgList.getSWDRQN()%>','<%=msgList.getSWDTYP()%>','<%=msgList.getSWDCLS()%>')"><%= msgList.getSWDSDS() %></A></td>
          </tr>
          <%}%>
        </table>
  </table>
     
<SCRIPT language="JavaScript">
	showChecked("ACCNUM");
</SCRIPT>


</FORM>

</BODY>
</HTML>
