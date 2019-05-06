<html>
<head>
<title>Teller Transaction</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ETLR00001Help" class= "datapro.eibs.beans.JBList"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">

function enter(code) {
	var form = top.opener.document.forms[0];
	form[top.opener.fieldName].value = code;
	form[top.opener.fieldName].focus();
	top.close();
}

setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>)

</script>

</head>

<BODY>

<form>

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

<TABLE  id="mainTable" class="tableinfo" height="70%" width="80%">
 	<TR height="5%"> 
   		<TD NOWRAP valign="top" width="80%"> 
	        <table id="headTable" width="100%">
	          <tr id="trdark"> 
	            <th align=CENTER nowrap width="30%"><div align="center">Code</div></th>
	            <th align=CENTER nowrap width="70%"><div align="left">Transaction</div></th>
	          </tr>
			</table>
		</TD>
	</TR>
  	<TR height="95%"> 
    	<TD NOWRAP valign="top" width="80%">
		  	<div id="dataDiv1" style="height:250px; overflow:auto;">  
				<table id=dataTable cellspacing="0" cellpadding="0" border="0" width="100%" >
		          <%
		          ETLR00001Help.initRow();
		          while (ETLR00001Help.getNextRow()) {
		          	if (ETLR00001Help.getFlag().equals("")) {
		            	out.println(ETLR00001Help.getRecord());
		            }
		          }
				 %>
				</table>
			</div>
   	  	</TD>
  	</TR>	
</TABLE>

<%}%>
</form>
</body>
</html>
