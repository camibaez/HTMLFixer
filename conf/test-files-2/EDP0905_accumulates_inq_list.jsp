<%@ page import ="datapro.eibs.master.Util" %>
<html>
<head>
<title>Acumulados con Otras Entidades</title>
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

<h3 align="center">
<% if (userPO.getHeader2().trim().equals("1")) {;%>
Depósitos en el Banco y Otras Instituciones Financieras
<% }; %>
<% if (userPO.getHeader2().trim().equals("2")) {;%>
Saldos Finales en el Banco y Otras Instituciones Financieras
<% }; %>
<% if (userPO.getHeader2().trim().equals("3")) {;%>
Depósitos en el Banco y Otras Instituciones Financieras - Grupo
<% }; %>
<% if (userPO.getHeader2().trim().equals("4")) {;%>
Saldos Finales en el Banco y Otras Instituciones Financieras - Grupo
<% }; %>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="accumulates_inq_list,EDP0905"></h3>

<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.creditproposal.JSEDP0905" >
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
    <INPUT TYPE=HIDDEN NAME="E01MVCTYP" VALUE="<%= trans.getRecord(3) %>">

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
         <input type="text" name="E01CUSNA1" size="45" readonly value="<%= trans.getRecord(2)%>">
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
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </td>
    </tr>
  </table>
  
<table id="mainTable"  class="tableinfo" BORDER=1>
  <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
	<TABLE id="tbenter" align="center" style="width: 100%" border="0">
    <TD NOWRAP>
      <td NOWRAP valign="top" > 
        <table id="headTable">
          <tr id="trdark"> 
            <th align=CENTER nowrap > <div align="center">Banco/Meses</div> </th>
            <th align=CENTER nowrap ><%=trans.getRecord(10)%></th>
            <th align=CENTER nowrap ><%=trans.getRecord(9)%></th>
            <th align=CENTER nowrap ><%=trans.getRecord(8)%></th>
            <th align=CENTER nowrap ><%=trans.getRecord(7)%></th>
            <th align=CENTER nowrap ><%=trans.getRecord(6)%></th>
            <th align=CENTER nowrap ><%=trans.getRecord(5)%></th>
            <th align=CENTER nowrap >Total</th>
            <th align=CENTER nowrap >Prom. Mens.</th>
			<% if (userPO.getHeader2().trim().equals("1")) {;%>
            <th align=CENTER nowrap >Prom. Trimest.</th>
            <th align=CENTER nowrap >Proyeccion<BR>a 12 meses</th>
            <th align=CENTER nowrap >%Vtas.</th>
			<% }; %>
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
		<% if (!trans.getRecord(24).equals("T")) { %>		
          <tr> 
	      	<td align="center" nowrap >  
				<DIV NOWRAP><%=trans.getRecord(12)%><BR><%=trans.getRecord(25)%></DIV>
      		</td>
   			<TD ALIGN=RIGHT width="10%" NOWRAP><%= datapro.eibs.master.Util.fcolorCCY(trans.getRecord(18)) %></TD>
   			<TD ALIGN=RIGHT width="10%" NOWRAP><%= datapro.eibs.master.Util.fcolorCCY(trans.getRecord(17)) %></TD>
   			<TD ALIGN=RIGHT width="10%" NOWRAP><%= datapro.eibs.master.Util.fcolorCCY(trans.getRecord(16)) %></TD>
   			<TD ALIGN=RIGHT width="10%" NOWRAP><%= datapro.eibs.master.Util.fcolorCCY(trans.getRecord(15)) %></TD>
   			<TD ALIGN=RIGHT width="10%" NOWRAP><%= datapro.eibs.master.Util.fcolorCCY(trans.getRecord(14)) %></TD>
   			<TD ALIGN=RIGHT width="10%" NOWRAP><%= datapro.eibs.master.Util.fcolorCCY(trans.getRecord(13)) %></TD>
   			<TD ALIGN=RIGHT width="10%" NOWRAP><%= datapro.eibs.master.Util.fcolorCCY(trans.getRecord(19)) %></TD>
   			<TD ALIGN=RIGHT width="10%" NOWRAP><%= datapro.eibs.master.Util.fcolorCCY(trans.getRecord(20)) %></TD>
			<% if (userPO.getHeader2().trim().equals("1")) {;%>
   			<TD ALIGN=RIGHT width="10%" NOWRAP><%= datapro.eibs.master.Util.fcolorCCY(trans.getRecord(21)) %></TD>
   			<TD ALIGN=RIGHT width="10%" NOWRAP><%= datapro.eibs.master.Util.fcolorCCY(trans.getRecord(22)) %></TD>
   			<TD ALIGN=RIGHT width="10%" NOWRAP></TD>
			<% }; %>
          </tr>
 	        <% }else { %>
          <tr id="trdark"> 
	      	<th align="center" nowrap >  
				<DIV NOWRAP><%=trans.getRecord(12)%></DIV>
      		</th>
   			<TH ALIGN=RIGHT width="10%" NOWRAP><%= datapro.eibs.master.Util.fcolorCCY(trans.getRecord(18)) %></TH>
   			<TH ALIGN=RIGHT width="10%" NOWRAP><%= datapro.eibs.master.Util.fcolorCCY(trans.getRecord(17)) %></TH>
   			<TH ALIGN=RIGHT width="10%" NOWRAP><%= datapro.eibs.master.Util.fcolorCCY(trans.getRecord(16)) %></TH>
   			<TH ALIGN=RIGHT width="10%" NOWRAP><%= datapro.eibs.master.Util.fcolorCCY(trans.getRecord(15)) %></TH>
   			<TH ALIGN=RIGHT width="10%" NOWRAP><%= datapro.eibs.master.Util.fcolorCCY(trans.getRecord(14)) %></TH>
   			<TH ALIGN=RIGHT width="10%" NOWRAP><%= datapro.eibs.master.Util.fcolorCCY(trans.getRecord(13)) %></TH>
   			<TH ALIGN=RIGHT width="10%" NOWRAP><%= datapro.eibs.master.Util.fcolorCCY(trans.getRecord(19)) %></TH>
   			<TH ALIGN=RIGHT width="10%" NOWRAP><%= datapro.eibs.master.Util.fcolorCCY(trans.getRecord(20)) %></TH>
			<% if (userPO.getHeader2().trim().equals("1")) {;%>
   			<TH ALIGN=RIGHT width="10%" NOWRAP><%= datapro.eibs.master.Util.fcolorCCY(trans.getRecord(21)) %></TH>
   			<TH ALIGN=RIGHT width="10%" NOWRAP><%= datapro.eibs.master.Util.fcolorCCY(trans.getRecord(22)) %></TH>
   			<TH ALIGN=RIGHT width="10%" NOWRAP><%= datapro.eibs.master.Util.fcolorCCY(trans.getRecord(23)) %></TH>
			<% }; %>
          </tr>
 
    <%
                }
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