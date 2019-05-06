<%@ page import ="datapro.eibs.master.Util" %>
<html>
<head>
<title>Lista Usuarios Liquidadores Productos de Crédito</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EDP075301Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<script language="JavaScript">

function goAction(op) {

		
	if (op == "3") {
      ok = confirm("Esta seguro que desea eliminar el registro seleccionado?");
	  if (ok) 
	       {
	       document.forms[0].opt.value = op;
	       document.forms[0].submit();
	       }  
	  
	} else 
	
			{
	       document.forms[0].opt.value = op;
	       document.forms[0].submit();
	       }
	
	  
}


function getParams(currrow,fmt,dsc) {

	document.forms[0].CURRENTROW.value = currrow;
    document.forms[0].E01DPURUT.value = fmt;
    document.forms[0].E01DPUGRG.value = dsc;
}


</SCRIPT>  

</head>

<BODY>
<h3 align="center">Usuarios Liquidadores Productos Propuesta de Crédito <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="list.jsp, EDP0753"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.creditproposal.JSEDP0753" >
  <p> 
    <INPUT TYPE=HIDDEN NAME="CURRENTROW" VALUE="0"> 
    <input type=HIDDEN name="SCREEN" value="800">
    <input type=HIDDEN name="totalRow" value="0">
    <input type=HIDDEN name="E01DPURUT" >
    <input type=HIDDEN name="E01DPUGRG" >
    <input type=HIDDEN name="opt">
  </p>
  <p> 
    <%
	if ( EDP075301Help.getNoResult() ) {
 %>
  </p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>No hay resultados para su b&uacute;squeda</b></p>
          <table class="tbenter" width=100% align=center>
            <tr> 
              <td class=TDBKG width="30%"> 
                <div align="center"><a href="javascript:goAction(1)"><b>Nueva</b></a></div>
              </td>
              <td class=TDBKG width="30%"> 
                <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
              </td>
            </tr>
          </table>
          <p>&nbsp;</p>
          
        </div>

	  </TD>
	</TR>
    </TABLE>
	
  <%  
		}
	else {
%> <% 

String chk = "";

 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%> 
  <p> 

          
  <table class="tbenter" width=100% align=center>
    <tr> 
      <td class=TDBKG width="30%"> 
        <div align="center"><a href="javascript:goAction(1)"><b>Nueva</b></a></div>

     </td>
		<td class=TDBKG width="30%">
        <div align="center"><a href="javascript:goAction(2)"><b>Mantenimiento</b></a></div> 
     </td> 

	  <td class=TDBKG width="30%"> 
        <div align="center"><a href="javascript:goAction(3)"><b>Borrado</b></a></div>
      </td>
      <td class=TDBKG width="30%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </td>
    </tr>
  </table>
   
  <br>
  <table  id=cfTable class="tableinfo">
    <tr > 
      <td NOWRAP valign="top" width="100%"> 
        <table id="headTable" width="100%">
          <tr id="trdark"> 
            <th align=CENTER nowrap width="10%">&nbsp;</th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">Ruta</div>
            </th>
            <th align=CENTER nowrap width="20%"> 
              <div align="center">Descripción Ruta</div>
            </th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">Gerencia Reg.</div>
            </th>
            <th align=CENTER nowrap width="20%"> 
              <div align="center">Descripción Gerencia Regional</div>
            </th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">Usuario Liq.</div>
            </th>
            <th align=CENTER nowrap width="20%"> 
              <div align="center">Nombre Usuario Liquidador</div>
            </th>
           </tr>
          <%
                EDP075301Help.initRow();
                chk = "checked";
                while (EDP075301Help.getNextRow()) {
                 
                  datapro.eibs.beans.EDP075301Message msgList = (datapro.eibs.beans.EDP075301Message) EDP075301Help.getRecord();
		 %>
          <tr> 
            <td NOWRAP  align=CENTER width="10%"> 
              <input type="radio" name="CURRCODE" value="<%= EDP075301Help.getCurrentRow() %>" <%=chk%> onClick="getParams(this.value,'<%= msgList.getE01DPURUT() %>','<%= msgList.getE01DPUGRG() %>');">
            </td>
            <td NOWRAP  align=CENTER width=\"10%\"><%= msgList.getE01DPURUT() %></td>
			<td NOWRAP  align=CENTER width=\"20%\"><%= msgList.getE01DPUDRU() %></td>
            <td NOWRAP  align=CENTER width=\"10%\"><%= msgList.getE01DPUGRG() %></td>
			<td NOWRAP  align=CENTER width=\"20%\"><%= msgList.getE01DPUDGR() %></td>
            <td NOWRAP  align=CENTER width=\"10%\"><%= msgList.getE01DPUUSL() %></td>
			<td NOWRAP  align=CENTER width=\"20%\"><%= msgList.getE01DPUNUS() %></td>

         </tr>
          <%
              				chk = "";     
                }
              %>
        </table>
  </table>
     
  <SCRIPT language="JavaScript">
 showChecked("CURRCODE");
     
</SCRIPT>

<%}%>

  </form>

</body>
</html>
