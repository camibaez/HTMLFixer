<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<html>
<head><title>Foreign Exchange </title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EWD0327Help" class= "datapro.eibs.beans.JBList"   scope="session"/>

</head>
<body>
<h3 align="center">Currency Position Detail<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="fe_tod_deals.jsp,EWD0321"> 
</h3>
<hr size="4">
<%
	if ( EWD0327Help.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
      <div align="center"> <b> There is no match for your search 
        criteria </b></div>
      </TD></TR>
   		</TABLE>
<%  
		}
	else {
%>	
   
<p>&nbsp;</p>
<TABLE class="tableinfo" >
  <TR id="trdark"> 
    <th>Description</th>
    <th>Amount </th>
    <th>Equivalent<BR>
      Amount</th>
    <th>Rate</th>
    <th>Value <BR> Date</th>
    <th>Dealer <br>
      ID</th>
    <th>Reference</th>
	<th>Name</th>
  </tr>
  <%
                EWD0327Help.initRow();
                while (EWD0327Help.getNextRow()) {
                    if (EWD0327Help.getFlag().equals("")) {
                    		out.println(EWD0327Help.getRecord());
                    }
                }
    %> 
</TABLE>
<%
   }  
%>
</body>
</html>