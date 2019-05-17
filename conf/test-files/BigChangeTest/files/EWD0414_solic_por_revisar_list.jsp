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
<script language="javascript">
  var reason1 = '';
  var reason2 = '';
  var reason3 = '';
  var reason4 = '';
  var reason5 = '';
  var msg = '';

  function goAction(op) {
	
     document.forms[0].action.value = op;
     document.forms[0].reason1.value = reason1;
     document.forms[0].reason2.value = reason2;
     document.forms[0].reason3.value = reason3;
     document.forms[0].reason4.value = reason4;
     document.forms[0].reason5.value = reason5;
     document.forms[0].msg.value = msg;
     
     var formLength= document.forms[0].elements.length;
     var ok = false;
     for(var n=0;n<formLength;n++)
     {
      	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "ACCNUM") 
      	{
        		ok = true;
        		break;
      	}
      }
      if ( ok ) {
            document.forms[0].submit();
      }
      else {
 	alert("Seleccione una solicitud antes de realizar esta operación");	   
      }

 }
 
 function goExit(){
  window.location.href="<%=request.getContextPath()%>/pages/background.jsp";
  }
  
</script>
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
<h3 align="center">Módulo de Solicitudes - Solicitudes por Revisar<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="solic_por_revisar_list.jsp,EWD0414"> 
  </h3>
<hr size="4">
  
  
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.request.JSERQ1140">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
<INPUT TYPE=HIDDEN NAME="action" VALUE="2">
<INPUT TYPE=HIDDEN NAME="reason1" VALUE="">
<INPUT TYPE=HIDDEN NAME="reason2" VALUE="">
<INPUT TYPE=HIDDEN NAME="reason3" VALUE="">
<INPUT TYPE=HIDDEN NAME="reason4" VALUE="">
<INPUT TYPE=HIDDEN NAME="reason5" VALUE="">
<INPUT TYPE=HIDDEN NAME="msg" VALUE="">
<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">

   <TABLE class="tbenter">
    <TR>
      <TD ALIGN=CENTER width="25%" class=TDBKG>
  			<a href="javascript:goAction('2')" >Marcar<br>como revisada</a>
      </TD>
      <TD ALIGN=CENTER width="25%" class=TDBKG>
  			<a href="javascript:goExit()" >Salir</a>
      </TD>
    </TR>
  </TABLE>
  
   <table  id=cfTable class="tableinfo">
    <tr > 
      <td NOWRAP valign="top" width="100%"> 
        <table id="headTable" width="100%">
          <tr id="trdark"> 
            <th align=CENTER nowrap width="5%"> 
              <div align="center"></div>
            </th>
            <th align=CENTER nowrap width="20%"> 
              <div align="center">Número<BR>Solicitud</div>
            </th>
            <th align=CENTER nowrap width="20%"> 
              <div align="center">Tipo</div>
            </th>
            <th align=CENTER nowrap width="15%"> 
              <div align="center">Referencia</div>
            </th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">Fecha<br>Ingreso</div>
            </th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">Estado</div>
            </th> 
            <th align=CENTER nowrap width="20%"> 
              <div align="center">Promotor</div>
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
            <td NOWRAP  align=CENTER width="5%"> 
              <input type="radio" name="ACCNUM" value="<%= msgList.getSWDRQN() %>" <%=chk%>>
            </td>
            <td NOWRAP  align=CENTER width=\"20%\"><A HREF="javascript:showInqSolicitud('<%=msgList.getSWDRQN()%>','<%=msgList.getSWDTYP()%>','<%=msgList.getSWDCLS()%>')"><%= msgList.getSWDRQN() %></A></td>
            <td NOWRAP  align=CENTER width=\"20%\"><A HREF="javascript:showInqSolicitud('<%=msgList.getSWDRQN()%>','<%=msgList.getSWDTYP()%>','<%=msgList.getSWDCLS()%>')"><%= msgList.getSWDTDS() %></A></td>
            <td NOWRAP  align=CENTER width=\"15%\"><A HREF="javascript:showInqSolicitud('<%=msgList.getSWDRQN()%>','<%=msgList.getSWDTYP()%>','<%=msgList.getSWDCLS()%>')"><%= msgList.getSWDREF() %></A></td>
            <td NOWRAP  align=CENTER width=\"10%\"><A HREF="javascript:showInqSolicitud('<%=msgList.getSWDRQN()%>','<%=msgList.getSWDTYP()%>','<%=msgList.getSWDCLS()%>')"><%= Util.formatDate(msgList.getSWDINM(),msgList.getSWDIND(),msgList.getSWDINY()) %></A></td>
            <td NOWRAP  align=CENTER width=\"10%\"><A HREF="javascript:showInqSolicitud('<%=msgList.getSWDRQN()%>','<%=msgList.getSWDTYP()%>','<%=msgList.getSWDCLS()%>')"><%= msgList.getSWDSDS() %></A></td>
            <td NOWRAP  align=CENTER width=\"20%\"><A HREF="javascript:showInqSolicitud('<%=msgList.getSWDRQN()%>','<%=msgList.getSWDTYP()%>','<%=msgList.getSWDCLS()%>')"><%= msgList.getSWDON1() %></A></td>
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
