<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<html>
<head><title>Foreign Exchange </title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EWD0321Help" class= "datapro.eibs.beans.JBList"   scope="session"/>

</head>
<body>
<h3 align="center">Foreign Exchange - Today Deals<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="fe_tod_deals.jsp,EWD0321"> 
</h3>
<hr size="4">
<%
	if ( EWD0321Help.getNoResult() ) {
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
   
<p>&nbsp;</p><TABLE class="tableinfo" >
  <TR id="trdark"> 
    <th>Dealer<BR> ID</th>
    <th>Reference <BR>Number </th>
    <th>Currency </th>
    <th>Type</th>
    <th>Action <BR>Taken</th>
    <th>Value</th>
  </tr>
  <%
                EWD0321Help.initRow();
                while (EWD0321Help.getNextRow()) {
                    if (EWD0321Help.getFlag().equals("")) {
                    		out.println(EWD0321Help.getRecord());
                    }
                }
    %> 
</TABLE>
<%
   }  
%>
</body>
</html>