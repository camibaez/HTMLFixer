<html>
<head>
<title>Teller Transaction</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="Data" class="java.lang.String"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<BODY>

<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.teller.JSEDD0330" >
<p><input type=HIDDEN name="PAGE_NAME" value="EDD0330_teller_transaction_print.jsp"></p>
  
<table  class="tableinfo">
	<tr id="trdark"> 
    	<td nowrap align="left" width="80" > RECEIPT :</td>
    </tr>	
	<TR id="trclear">
		<TD><%= Data %></TD>
	</TR>
</table>

</form>
</body>
</html>
