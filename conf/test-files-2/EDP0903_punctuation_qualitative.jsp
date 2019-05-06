<html>
<head>
<title>Calificación Analisis Cualitativo</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id= "trans1" class= "datapro.eibs.beans.JBListRec"  scope="session" /> 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<script language="JavaScript">

function getParams2(p1,p2,p3,p4,p5) {
	sec = p5; 
	eval("document.forms[0].E01SELRIS_"+sec+".value = 1");
	eval("document.forms[0].REC"+p2+p3+".value = p4");
//alert(eval("document.forms[0].REC"+p2+p3+".value"));
}

function goUpdVal(){
	document.forms[0].SCREEN.value=300;
	document.forms[0].submit();	 
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

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
%>

<h3 align="center">Calificación Analisis Cualitativo<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="punctuation_qualitative.jsp,EDP0903"></h3>

<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.creditproposal.JSEDP0903" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="300">
  <input type=HIDDEN name="opt">
  <INPUT TYPE=HIDDEN NAME="totalRow" VALUE="">
  <INPUT TYPE=HIDDEN NAME="PURPOSE" VALUE="<%=userPO.getPurpose()%>">

<table class="tableinfo">
 <TR > 
  <TD NOWRAP >
   <TABLE id="headTable" width="100%" cellpading=0 cellspacing=0>
    <tr id="trdark"> 
      <td align="right"  >
         <b>Cliente :</b>
      </td>
      <td nowrap > 
         <input type="text" name="Header1" size="12" readonly value="<%= userPO.getCusNum()%>">
      </td>
      <td align="right"  >
         <b>Nombre :</b>
      </td>
      <td nowrap colspan=3> 
         <input type="text" name="NAMECUM" size="45" readonly value="<%=userPO.getCusName()%>">
      </td>         
    </tr> 
    <tr id="trdark"> 
      <td align="right"  >
         <b>Num. Propuesta:</b>
      </td>
      <td nowrap > 
         <input type="text" name="Identifier" size="15" readonly value="<%=userPO.getIdentifier()%>">
      </td>
      <td align="right"  >
         <b></b>
      </td>
      <td align="right"  >
         <b></b>
      </td>
    </tr>  

  </table> 
 </td>        
 </tr>  
</table>


<h4>Asignar Calificación :</h4>
<table id="mainTable"  class="tableinfo">
  <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
		
	<TABLE id="tbenter" align="center" style="width: 100%" border="0">
    <TD NOWRAP>
      <td NOWRAP valign="top" > 
   <div id="dataDiv1" class="scbarcolor" NOWRAP>

    <%
		int i = 0;
		int j = 0;
    %> 
    <table id="dataTable1" NOWRAP border=1> 
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
		<% if (trans1.getRecord(1).equals("H")) { %>		
          <tr id="trdark"> 
	      	<th align="left" nowrap width="10%">  
				<DIV NOWRAP><%=trans1.getRecord(2)%></DIV>
      		</th>
	      	<th align="left" nowrap width="70%">  
				<DIV NOWRAP><%=trans1.getRecord(3)%></DIV>
      		</th>
	      	<th align="left" nowrap width="10%">  
				<DIV NOWRAP><%=trans1.getRecord(7)%></DIV>
      		</th>
            <th align=CENTER nowrap width="10%"> <div align="center">Sel.</div> </th>
          </tr>
	        <% } %>
		<% if (trans1.getRecord(1).equals("D")) { %>		
          <tr id="trdark"> 
    	      <input type="hidden" name="MODCOD_<%= trans1.getCurrentRow() %>" value="<%= trans1.getRecord(1) %>"> 
	      	<td align="center" nowrap width="10%">  
      		</td>
	      	<th align="left" colspan=2 width="70%"><%= trans1.getRecord(4).trim()%></th>
            <td align=CENTER nowrap  width="10%"></td>
	      	<td align="center" nowrap width="10%">  
      		</td>
          </tr>
            <% j++; } %>
			<% if (trans1.getRecord(1).equals("S")) { %>		
          <tr> 
			<TD ALIGN=CENTER NOWRAP width="10%" >
			</TD>
	      	<td align="left" width="70%" colspan=2 ><%= trans1.getRecord(11) %>.- <%= trans1.getRecord(4).trim()%></td>
		    <td NOWRAP  align=CENTER width="10%"> 
<%--
              <input type="radio" name="REC<%=j%>" <% if(trans1.getRecord(6).equals("1")){out.print("checked value=1");}else{out.print("value=0");}%> onClick="getParams2(this.value,'<%= trans1.getRecord(11) %>',<%= trans1.getCurrentRow() %>)"
--%>
              <input type="radio" name="REC<%= trans1.getRecord(8) %><%= trans1.getRecord(9) %>" <% if(trans1.getRecord(6).equals("1")){out.print("checked value=1");}else{out.print("value=0");}%> onClick="getParams2(this.value,'<%= trans1.getRecord(8) %>','<%= trans1.getRecord(9) %>','<%= trans1.getRecord(11) %>',<%= trans1.getCurrentRow() %>)"
			<% if(userPO.getPurpose().equals("INQUIRY")) {out.print("disabled") ;}%>
              >
    	      <input type="hidden" name="E01LEVREC_<%= trans1.getCurrentRow() %>" value="<%= trans1.getRecord(1) %>"> 
    	      <input type="hidden" name="E01QADCD1_<%= trans1.getCurrentRow() %>" value="<%= trans1.getRecord(8) %>"> 
    	      <input type="hidden" name="E01QADCD2_<%= trans1.getCurrentRow() %>" value="<%= trans1.getRecord(9) %>"> 
    	      <input type="hidden" name="E01QADCD3_<%= trans1.getCurrentRow() %>" value="<%= trans1.getRecord(10) %>"> 
    	      <input type="hidden" name="E01QADMNS_<%= trans1.getCurrentRow() %>" value="<%= trans1.getRecord(11) %>"> 
    	      <input type="hidden" name="E01SELRIS_<%= trans1.getCurrentRow() %>" > 
		    </td>
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