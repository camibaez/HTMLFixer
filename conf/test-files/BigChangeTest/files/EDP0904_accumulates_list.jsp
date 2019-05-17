<%@ page import ="datapro.eibs.master.Util" %>
<html>
<head>
<title>Actualización Acumulados de Otras Entidades</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id= "trans" class= "datapro.eibs.beans.JBListRec"  scope="session" /> 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>
<script language="JavaScript">

function submitThis() {
	document.forms[0].SCREEN.value="2";
	document.forms[0].submit();
 }

</SCRIPT>  

</head>
<BODY>
<%
	 trans.initRow();
    int max_row = 9999;
    int row;
    int total_row;
    try {
      row = Integer.parseInt(request.getParameter("ROW"));
    }
    catch (Exception e) {
      row = 0;
    }
    if ( (row == 0) || (row < trans.getLastRow()) ) {
      total_row = trans.getLastRow();
    }
    else {
		total_row = row;       
    }
%> 
<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
%>

<h3 align="center">Acumulados por Institución
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="accumulates_list,EDP0904"></h3>

<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.creditproposal.JSEDP0904" >
  <p> 
    <INPUT TYPE=HIDDEN NAME="CURRENTROW" VALUE="0"> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
    <input type=HIDDEN name="opt">
    <INPUT TYPE=HIDDEN NAME="totalRow" VALUE="<%= total_row %>">
  </p>
  <p> 
 
<table class="tableinfo">
 <TR > 
     <%
		trans.initRow();
        trans.getNextRow();
	 %>
    <INPUT TYPE=HIDDEN NAME="E01MVCYEA" VALUE="<%= trans.getRecord(6) %>">
    <INPUT TYPE=HIDDEN NAME="E01MVCINS" VALUE="<%= trans.getRecord(9) %>">
    <INPUT TYPE=HIDDEN NAME="E01MVCTAC" VALUE="<%= trans.getRecord(15) %>">
    <INPUT TYPE=HIDDEN NAME="E01MVCACC" VALUE="<%= trans.getRecord(14) %>">

  <TD NOWRAP >
   <TABLE id="headTable1" width="100%" cellpading=0 cellspacing=0>

    <tr id="trdark"> 
      <td align="right"  >
         <b>Cliente :</b>
      </td>
      <td nowrap > 
         <input type="text" name="E01MVCCUN" size="12" readonly value="<%= trans.getRecord(1)%>">
      </td>
      <td align="right"  >
         <b>Nombre :</b>
      </td>
      <td nowrap colspan=3> 
         <input type="text" name="D01MVCINS" size="45" readonly value="<%= trans.getRecord(2)%>">
      </td>         
    </tr> 
    <tr id="trdark"> 
      <td align="right"  >
         <b>Año : </b>
      </td> 
      <td nowrap > 
         <b><%=trans.getRecord(6)%></b>
      </td>
      <td align="right"  >
         <b>Institucion : </b>
      </td>
      <td align="left"  >
         <b><%=trans.getRecord(12)%></b>
      </td>
    </tr>  
    <tr id="trdark"> 
      <td align="right"  >
         <b>Tipo de Cuenta : </b>
      </td> 
      <td nowrap > 
         <b>
		<% if (trans.getRecord(15).trim().equals("R")) {;
		%>
		Depósitos
		<% }else{; %>
		Ahorros         
		<% }; %>
         </b>
      </td>
      <td align="right"  >
         <b>Número : </b>
      </td>
      <td align="left"  >
         <b><%=trans.getRecord(14)%></b>
      </td>
    </tr>  

  </table> 
 </td>        
 </tr>  
</table>
 
  <p> 
  <table class="tbenter" width=100% align=center>
    <tr> 
    <td class=TDBKG width="20%">
        <div align="center">
        <a href="javascript:submitThis()"><b>Enviar</b></a>
        </div> 
    </td> 
      <td class=TDBKG width="20%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </td>
    </tr>
  </table>
  
<table id="mainTable"  class="tableinfo">
  <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
	<TABLE id="tbenter" align="center" style="width: 100%" border="0">
    <TD NOWRAP>
      <td NOWRAP valign="top" > 
        <table id="headTable" >
          <tr id="trdark"> 
            <th align=CENTER nowrap > <div align="center">Mes</div> </th>
            <th align=CENTER nowrap >Depósitos</th>
            <th align=CENTER nowrap >Saldos</th>
           </tr>
        </table>
  
   <div id="dataDiv1" class="scbarcolor" NOWRAP>
    <%
		int i = 0;
    %> 

    <table id="dataTable" NOWRAP> 

          <%
	 			trans.initRow();
                while (trans.getNextRow()) {
				i++;
		 %>
          <tr> 
		    <INPUT TYPE=HIDDEN NAME="E01MVCINS_<%= trans.getCurrentRow() %>" VALUE="<%= trans.getRecord(9) %>">
		    <INPUT TYPE=HIDDEN NAME="E01MVCMON_<%= trans.getCurrentRow() %>" VALUE="<%= trans.getRecord(7) %>">
	      	<td align="center" nowrap >  
				<DIV NOWRAP><%=trans.getRecord(8)%></DIV>
      		</td>
	      	<td align="center" nowrap >  
    	      <input type="text" name="E01MVCDEP_<%= trans.getCurrentRow() %>"  size="17" maxlength="17"  value="<%= trans.getRecord(10) %>" onkeypress=enterDecimal(2) style="text-align:right"> 
      		</td>
	      	<td align="center" nowrap >  
    	      <input type="text" name="E01MVCBAL_<%= trans.getCurrentRow() %>"  size="17" maxlength="17"  value="<%= trans.getRecord(11) %>" onkeypress=enterDecimal(2) style="text-align:right"> 
      		</td>
          </tr>
    <%
                }
    %> 
  </table>
  <input type="HIDDEN" name="RECNUM" value="<%=i%>">
  </div>

  </TABLE>
  </td>
  </tr>
</table>

<SCRIPT language="JavaScript">

     function resizeDoc() {
       	divResize();
     	adjustEquTables(headTable, dataTable, dataDiv1,1,false);
      }
     resizeDoc();
     window.onresize=resizeDoc;

</SCRIPT>
</form>
</body>
</html>