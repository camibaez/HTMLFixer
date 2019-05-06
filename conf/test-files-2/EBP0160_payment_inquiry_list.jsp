<!DOCTYPE HTML><%@page import="java.util.Iterator"%>
<%@page language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 
<title>Payment Inquiry</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "list" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

</head>
<body>

<h3 align="center"> Bills Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" ALT="bill_inqury_list.jsp, EBP0160"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/pages/background.jsp">

<%	
	if ( list.getNoResult() ) {
%>
 	<TABLE class="tbenter" width="100%" height=50%">
 		<TR>
      		<TD align="center" width="100%"> 
     			<h4 style="text-align:center"> There are no Payments for your search criteria.</h4>
    		</TD>
      	</TR>
   	</TABLE>
<%
	} else {
%>    
<TABLE  id="mainTable" class="tableinfo" style="height:430px;">
 	<TR height="5%"> 
   		<TD NOWRAP valign="top" width="80%"> 
    		<TABLE id="headTable" width="100%">
    			<TR id="trdark"> 
    				<th NOWRAP align="center" width="20%"><B>Internal Number</B></th>
    				<th NOWRAP align="center" width="20%"><B>Sequence</B></th>
    				<th NOWRAP align="center" width="20%"><B>Amount</B></th>
    				<th NOWRAP align="center" width="20%"><B>Date/Payment</B></th>
    				<th NOWRAP align="center" width="20%"><B>User Approve</B></th> 
				</TR>
			</TABLE>
		</TD>
	</TR>
	<tr height="95%">    
		<td nowrap="nowrap">      
			<div id="dataDiv1" style="height:430px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%"> 
<%
				Iterator iterator = list.listIterator();
				while (iterator.hasNext()) {
					out.println(iterator.next().toString());
				}
%>		         
		       </table>
		    </div>
		</td>
	</tr>	       
</TABLE>					
<%
	}
%>

  <p align="center"> 
    <input class="eibsbtn" type="button" name="close" value="Cerrar" onclick="checkClose()">
  </p>


</form>
</body>
</html>