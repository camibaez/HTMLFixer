<html>
<head>
<title>Teller Transaction</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ETLR00001Help" class= "datapro.eibs.beans.JBList"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT language="JavaScript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>)
</SCRIPT>

<script language="javascript">
//<!-- Hide from old browsers
function enter(code) {
	top.opener.document.forms[0][top.opener.fieldName].value = code;
	top.opener.document.forms[0][top.opener.fieldName].focus();
	top.close();
}
//-->
</script>

</head>

<BODY>

<form>
<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">

<%
	if ( ETLR00001Help.getNoResult() ) {
%>
  <TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>There is no match for your search criteria</b></p><p>&nbsp;</p>
        </div>
	  </TD>
	</TR>
  </TABLE>
	<%} else {
	%> 

  <br>

<TABLE  id="mainTable" class="tableinfo" ALIGN=CENTER style="width:'95%'">
    <tr > 
      <td NOWRAP valign="top" width="100%"> 
        <table id="headTable" width="100%">
          <tr id="trdark"> 
            <th align=CENTER nowrap width="30%"><div align="center">Code</div></th>
            <th align=CENTER nowrap width="70%"><div align="left">Transaction</div></th>
          </tr>
		</table>

		<div id="dataDiv1" class="scbarcolor" >
			<table id="dataTable" >		
	          <%
	          ETLR00001Help.initRow();
			  int i=0;
	          while (ETLR00001Help.getNextRow()) {
	          	if (ETLR00001Help.getFlag().equals("")) {
	            	out.println(ETLR00001Help.getRecord());
					i++;
	            }
	          }
			 %>
			</table>
		</div>
   	  </TD>
  	</TR>	
</TABLE>

<SCRIPT language="JavaScript">
     document.forms[0].totalRow.value="<%= i %>";
     divResize(false);
     adjustEquTables(headTable, dataTable, dataDiv1, 1, false);     
</SCRIPT>
<%}%>
</form>
</body>
</html>
