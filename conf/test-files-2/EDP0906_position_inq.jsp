<html>
<head>
<title>Posición Consolidada de Riesgo</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id= "trans2" class= "datapro.eibs.beans.JBListRec"  scope="session" /> 
<jsp:useBean id="Edp090601" class= "datapro.eibs.beans.JBListRec"  scope="session" /> 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>
<script language="JavaScript">
function goCancel(fmt) {
	document.forms[0].SCREEN.value="200";
	document.forms[0].submit(); 
}

</script>

</head>
<body >

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
%>

<H3 align="center">Posición Consolidada de las Empresas Relacionadas del Grupo<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="posicion_inq.jsp, EDP0906"></H3>
<P align="center">
</P>
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.creditproposal.JSEDP0906" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="300">
  <input type=HIDDEN name="opt">
  <INPUT TYPE=HIDDEN NAME="totalRow" VALUE="">
  <h4>Datos del(los Cliente(s)</h4>
    <%
	 			Edp090601.initRow();
                Edp090601.getNextRow();
	%>  
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
		<TABLE id="tbenter" align="center" style="width: 100%" border="0">
			<tr id="trclear">
				<th	nowrap width="20%">
					<div align="right">Grupo Económico :</div>
				</th>
				<th nowrap align="left" width="10%">
					<DIV NOWRAP><%=Edp090601.getRecord(3)%></DIV>
				</th>
				<th nowrap align="left" width="70%">
					<DIV NOWRAP><%=Edp090601.getRecord(4)%></DIV>
				</th>
			</tr>
		</TABLE>
	  </td>
    </tr>
  </table>

<h4>Empresas Relacionadas :</h4>
  
<table  class="tableinfo">
  <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
		
  <table  id=mainTable class="tableinfo">
    <tr > 
     <td NOWRAP > 
   <TABLE id="headTable1" NOWRAP>
          <tr id="trdark"> 
            <th align=CENTER nowrap width="25%"> <div align="center">Nombre/Razón Social</div> </th>
            <th align=CENTER nowrap width="25%"> <div align="center">C.I./Rif.</div> </th>
            <th align=CENTER nowrap width="25%"> <div align="center">Ciudad</div> </th>
            <th align=CENTER nowrap width="25%"> <div align="center">Estado</div> </th>
	      </tr>
	</TABLE>
   <div id="dataDiv1" class="scbarcolor" NOWRAP>

    <%
		int i = 0;
    %> 

    <table id="dataTable1" NOWRAP> 

          <%
	 			Edp090601.initRow();
	 			boolean firstTime = true;
				String Chk1 = "";
                while (Edp090601.getNextRow()) {
					if (firstTime) {
						Chk1 = "checked";
						firstTime = false;
					}else{
						Chk1 = "";
					}
				i++;
		 %>
		<% if (Edp090601.getRecord(23).equals("")) { %>		
          <tr> 
	      	<td align="left" nowrap >  
				<DIV NOWRAP><%=Edp090601.getRecord(6)%></DIV>
      		</td>
	      	<td align="left"" nowrap >  
				<DIV NOWRAP><%=Edp090601.getRecord(7)%></DIV>
      		</td>
	      	<td align="left"" nowrap >  
				<DIV NOWRAP><%=Edp090601.getRecord(8)%></DIV>
      		</td>
	      	<td align="left" nowrap >  
				<DIV NOWRAP><%=Edp090601.getRecord(9)%></DIV>
      		</td>
          </tr>
    <%
          };
          };
    %> 
  </table>
  </div>

  </TABLE>

</table>

<h4>POSICION DE RIESGO (Representado en Bolívares)<h4>
  
<table  class="tableinfo">
  <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
		
  <table  id=mainTable class="tableinfo">
    <tr > 
     <td NOWRAP > 
   <TABLE id="headTable2" NOWRAP>
     <tr id="trdark"> 
       <th align=CENTER nowrap width="15%">Tipo de Crédito</th>
       <th align=CENTER nowrap width="10%"> <div align="center">Monto</div> </th>
       <th align=CENTER nowrap width="10%"> <div align="center">Otorgamiento</div> </th>
       <th align=CENTER nowrap width="10%"> <div align="center">Vencimiento</div> </th>
       <th align=CENTER nowrap width="10%"> <div align="center">Saldo</div> </th>
       <th align=CENTER nowrap width="15%"> <div align="center">Tipo de <BR>Crédito</div> </th>
       <th align=CENTER nowrap width="10%"> <div align="center">Monto</div> </th>
       <th align=CENTER nowrap width="10%"> <div align="center">Plazo</div> </th>
       <th align=CENTER nowrap width="10%"> <div align="center">Termino</div> </th>
     </tr>
     <tr id="trdark"> 
       <th align=CENTER nowrap width="15%">Nombre/Razón Social</th>
       <th align=CENTER nowrap width="30%" colspan="3"> <div align="center">Créditos Autorizados por el Banco</div> </th>
       <th align=CENTER nowrap width="10%"> <div align="center">Actual</div> </th>
       <th align=CENTER nowrap width="45%" colspan="4"> <div align="center">Créditos Propuestos</div> </th>
     </tr>
	</TABLE>
   <div id="dataDiv2" class="scbarcolor" NOWRAP>

    <%
		i = 0;
    %> 

    <table id="dataTable2" NOWRAP> 

          <%
	 			Edp090601.initRow();
	 			firstTime = true;
				Chk1 = "";
                while (Edp090601.getNextRow()) {
					if (firstTime) {
						Chk1 = "checked";
						firstTime = false;
					}else{
						Chk1 = "";
					}
				i++;
		 %>
		<% if (Edp090601.getRecord(23).equals("H")) { %>		
          <tr id="trdark"> 
	      	<th align="left" nowrap >  
				<DIV NOWRAP><%=Edp090601.getRecord(6)%></DIV>
      		</th>
	      	<td align="right" nowrap >  
      		</td>
	      	<td align="right" nowrap >  
      		</td>
	      	<td align="right" nowrap >  
      		</td>
	      	<td align="right" nowrap >  
      		</td>
	      	<td align="right" nowrap >  
      		</td>
	      	<td align="right" nowrap >  
      		</td>
	      	<td align="right" nowrap >  
      		</td>
	      	<td align="right" nowrap >  
      		</td>
          </tr>

    <%
          };
    %> 
		<% if (Edp090601.getRecord(23).equals("D")) { %>		
          <tr> 
	      	<td align="right" nowrap width="15%">  
				<DIV NOWRAP><%=Edp090601.getRecord(6)%></DIV>
      		</td>
	      	<td align="right" nowrap width="10%">  
				<DIV NOWRAP><%=Edp090601.getRecord(10)%></DIV>
      		</td>
	      	<td align="right" nowrap width="10%">  
				<DIV NOWRAP><%=Edp090601.getRecord(11)%>/<%=Edp090601.getRecord(12)%>/<%=Edp090601.getRecord(13)%></DIV>
      		</td>
	      	<td align="right" nowrap width="10%">  
				<DIV NOWRAP><%=Edp090601.getRecord(14)%>/<%=Edp090601.getRecord(15)%>/<%=Edp090601.getRecord(16)%></DIV>
      		</td>
	      	<td align="right" nowrap width="10%">  
				<DIV NOWRAP><%=Edp090601.getRecord(17)%></DIV>
      		</td>
	      	<td align="right" nowrap width="15%">  
				<DIV NOWRAP><%=Edp090601.getRecord(19)%></DIV>
      		</td>
	      	<td align="right" nowrap width="10%">  
				<DIV NOWRAP><%=Edp090601.getRecord(20)%></DIV>
      		</td>
	      	<td align="right" nowrap width="10%">  
				<DIV NOWRAP><%=Edp090601.getRecord(21)%></DIV>
      		</td>
	      	<td align="left" nowrap width="10%">  
				<DIV NOWRAP><%=Edp090601.getRecord(22)%></DIV>
      		</td>
          </tr>

    <%
          };
    %> 
		<% if (Edp090601.getRecord(23).equals("T")) { %>		
          <tr border="1"> 
	      	<th align="left" nowrap nowrap width="15%">  
				<DIV NOWRAP><%=Edp090601.getRecord(6)%></DIV>
      		</th>
	      	<th align="right" nowrap nowrap width="10%">  
				<DIV NOWRAP><%=Edp090601.getRecord(10)%></DIV>
      		</th>
	      	<th align="right" nowrap nowrap width="10%">  
      		</th>
	      	<th align="right" nowrap nowrap width="10%">  
      		</th>
	      	<th align="right" nowrap nowrap width="10%">  
				<DIV NOWRAP><%=Edp090601.getRecord(17)%></DIV>
      		</th>
	      	<th align="right" nowrap width="15%">  
      		</th>
	      	<th align="right" nowrap width="10%">  
				<DIV NOWRAP><%=Edp090601.getRecord(20)%></DIV>
      		</th>
	      	<th align="right" nowrap width="10%">  
      		</th>
	      	<th align="right" nowrap width="10%">  
      		</th>
          </tr>
    <%
          };
          }
    %> 
  </table>
  </div>

  </TABLE>

</table>
  
<div align="center"> 
	<TD ALIGN=CENTER width="24%" class=tdbkg><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
</div>
 <SCRIPT language="JavaScript">

     function resizeDoc() {
       	divResize();
     	adjustEquTables(headTable1, dataTable1, dataDiv1,1,false);
     	adjustEquTables(headTable2, dataTable2, dataDiv2,1,false);
      }
     resizeDoc();
     window.onresize=resizeDoc;

</SCRIPT>


</form>
</body>
</html>