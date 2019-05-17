<html>
<head>
<title>Calificación Puntuación Credit Scoring por Cliente</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id= "trans1" class= "datapro.eibs.beans.JBListRec"  scope="session" /> 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<script language="JavaScript">

	builtNewMenu(pc_docs);
	initMenu();

function getParams2(p1,p2,p3,p4) {
	document.forms[0].E01PLPNPR.value=p2;
	document.forms[0].E01CNOACD.value=p3;
	document.forms[0].E01CNORCD.value=p4;
}

function goUpdVal(){
	document.forms[0].SCREEN.value=300;
	document.forms[0].submit();	 
}

function callDocs() {
var NPR = document.forms[0].E01PLPNPR.value
var WARR = document.forms[0].E01CNORCD.value
	if (!document.forms[0].E01CNORCD.value == '') {
    	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.creditproposal.JSEDP0737?SCREEN=100&E01PLTNPR="+NPR+"&E01PLTPRO="+WARR;
    	CenterWindow(page,950,600,2);
   	}else{
		alert('Seleccione Una Garantía para traer sus documentos de Control.');
	}  
}

</script>

</head>
<body >
<%
	 trans1.initRow();
    int max_row = 9999;
    int row;
    int total_row;
    try {
      row = Integer.parseInt(request.getParameter("ROW"));
    }
    catch (Exception e) {
      row = 0;
    }
    if ( (row == 0) || (row < trans1.getLastRow()) ) {
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
<% if (userPO.getHeader23().equals("1")) {;%>
<h3 align="center">Garantías Generales de la Compañía
<%}else{;%>
<h3 align="center">Garantías Específicas de la Compañía
<%};%>

<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="guarantee_list.jsp,EDP0901">
</h3>

<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.creditproposal.JSEDP0901" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="300">
  <input type=HIDDEN name="opt">
  <input type="hidden" name="E01PLPNPR" > 
  <input type="hidden" name="E01CNOACD" > 
  <input type="hidden" name="E01CNORCD" > 

  <h4 align="center"> 
  <INPUT TYPE=HIDDEN NAME="totalRow" VALUE="">
    <tr bordercolor="#FFFFFF"> 
      Cliente : 
	<INPUT type="text" name="DSC" size="10" maxlength="9" value="<%= userPO.getCusNum().trim()%>" readonly >
	<INPUT type="text" name="DSC1" size="35" maxlength="35" value="<%= userPO.getCusName().trim()%>" readonly>
	</tr>
    <tr bordercolor="#FFFFFF"> 
      Num. Propuesta : 
	<INPUT type="text" name="DSC" size="10" maxlength="9" value="<%= userPO.getIdentifier().trim()%>" readonly >
	</tr>
  </h4> 

<h4>Seleccione Garantia para Control Documentos :</h4>

<table id="mainTable"  class="tableinfo">
  <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
	<TABLE id="tbenter" align="center" style="width: 100%" border="0">
    <TD NOWRAP>
      <td NOWRAP valign="top" > 
        <table id="headTable1" >
          <tr id="trdark"> 
            <th align=CENTER nowrap > <div align="center">Sel.</div> </th>
            <th align=CENTER nowrap > <div align="center">Garantía/Modalidad</div> </th>
            <th align=CENTER nowrap > <div align="center">%Porcentaje<br>Cobertura</div> </th>
 	      </tr>
	</TABLE>
   <div id="dataDiv1" class="scbarcolor" NOWRAP>

    <%
		int i = 0;
		int j = 0;
    %> 

    <table id="dataTable1" NOWRAP> 

          <%
	 			trans1.initRow();
	 			boolean firstTime = true;
				String Chk1 = "";
                while (trans1.getNextRow()) {
					if (firstTime) {
						Chk1 = "checked";
						firstTime = false;
					}else{
						Chk1 = "";
					}
				i++;
		 %>
		<% if (!trans1.getRecord(6).equals("T")) { %>		
		<% if (trans1.getRecord(6).equals("H")) { %>		
          <tr id="trdark"> 
	   	      <input type="hidden" name="E01TIPREG_<%= trans1.getCurrentRow() %>" value="<%= trans1.getRecord(6) %>"> 
	      	<th align="left" nowrap >  
				<DIV NOWRAP></DIV>
      		</th>
	      	<th align="left" nowrap >  
				<DIV NOWRAP><%=trans1.getRecord(8)%></DIV>
      		</th>
<%--
--%>
	      	<th align="left" nowrap >  
				<DIV NOWRAP></DIV>
      		</th>
          </tr>
	        <% j++; }else { %>
          <tr> 
    	      <input type="hidden" name="E01PLPNPR_<%= trans1.getCurrentRow() %>" value="<%= trans1.getRecord(1) %>"> 
    	      <input type="hidden" name="E01TIPREG_<%= trans1.getCurrentRow() %>" value="<%= trans1.getRecord(6) %>"> 
    	      <input type="hidden" name="E01CNOACD_<%= trans1.getCurrentRow() %>" value="<%= trans1.getRecord(7) %>"> 
    	      <input type="hidden" name="E01CNORCD_<%= trans1.getCurrentRow() %>" value="<%= trans1.getRecord(9) %>"> 
		    <td NOWRAP  align=CENTER > 
              <input type="radio" name="CURRCODE2" <% if(trans1.getRecord(11).equals("1")){out.print("checked value=1");}else{out.print("value=0");}%> onClick="getParams2(this.value,'<%= trans1.getRecord(1) %>','<%= trans1.getRecord(7) %>','<%= trans1.getRecord(9) %>',<%= trans1.getCurrentRow() %>)"
			<% if(userPO.getPurpose().equals("INQUIRY")) {out.print("disabled") ;}%>
              >
		    </td>
	      	<td align="right" nowrap >  
			  <DIV NOWRAP><%=trans1.getRecord(10)%></DIV>
      		</td>
	      	<td align="center" nowrap >  
    	      <input type="text" name="E01PORCOB_<%= trans1.getCurrentRow() %>"  size="10" maxlength="10"  value="<%= trans1.getRecord(12) %>" <% if(!userPO.getPurpose().equals("INQUIRY")){out.print("onkeypress=enterDecimal()");} %> > 
      		</td>
    	      <input type="hidden" name="E01SELECC_<%= trans1.getCurrentRow() %>" value="<%= trans1.getRecord(11) %>"> 
          </tr>
            <% } %>
	        <% }else { %>
          <tr id="trdark"> 
	   	      <input type="hidden" name="E01TIPREG_<%= trans1.getCurrentRow() %>" value="<%= trans1.getRecord(6) %>"> 
			<TD ALIGN=CENTER NOWRAP>
			</TD>
			<TH ALIGN=RIGHT NOWRAP>
				<DIV NOWRAP><%=trans1.getRecord(10)%></DIV>
			</TH>
			<TH ALIGN=CENTER NOWRAP>
				<DIV NOWRAP><%=trans1.getRecord(13)%></DIV>
			</TH>
          </tr>
            <% } %>

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

  <table class="tbenter" width=100% align=center>
    <tr> 
	<% if(!userPO.getPurpose().equals("INQUIRY")) {%>
    <td class=TDBKG width="20%">
        <div align="center"><a href="javascript:goUpdVal()"><b>Enviar</b></a></div> 
    </td> 
	<% }; %>
      <td class=TDBKG width="20%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </td>
    </tr>
  </table>
  
  <SCRIPT language="JavaScript">

     function resizeDoc() {
    	divResize();
	    var dataTab1 = document.all["dataTable1"];
     	adjustEquTables(headTable1, dataTab1, dataDiv1,1,false);
      }
     resizeDoc();
     window.onresize=resizeDoc;

</SCRIPT>
</form>
</body>
</html>