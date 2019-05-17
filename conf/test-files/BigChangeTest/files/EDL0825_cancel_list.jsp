<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Letras</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "docList" class= "datapro.eibs.beans.JBListRec"  scope="session" /> 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "payDoc" class= "datapro.eibs.beans.EDL082501Message"  scope="session" />

</head>
<body >

<% if ( docList.getNoResult() ) { %>
		<TABLE class="tbenter" width=100% height=100%>
 			<TR>
      			<TD><div align="center"><font size="3"><b> There is no match for your search criteria</b></font></div></TD>
      		</TR>
   		</TABLE>
<% } else {
    docList.initRow();
	docList.setCurrentRow(0);
%>
    
<SCRIPT Language="Javascript">

	function ShowCancel(Loan, ID, Doc, Type, row){
	 	var Params = "?SCREEN=5&Loan="+ Loan+"&ID=" + ID + "&Doc=" + Doc + "&Type=" + Type + "&Row=" + row;
	 	page= "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0825" + Params;
	 	CenterWindow(page,630,460,2);           
	}
	
</SCRIPT>

<% 
 	if ( !error.getERRNUM().equals("0")  ) {
    	error.setERRNUM("0");
%>
    	<SCRIPT Language="Javascript">
            showErrors();
     	</SCRIPT>
<% 	} %>


<h3 align="center">Cancellation Documents List<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cancel_list, EDL0825"></h3>
<hr size="4">  
    
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0825">

    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="6">
    <INPUT TYPE=HIDDEN NAME="CURRENTROW" VALUE="">
    <INPUT TYPE=HIDDEN NAME="totalRow" VALUE="<%= docList.getRow() %>">
    <INPUT TYPE=HIDDEN NAME="OPTION" VALUE="<%= request.getParameter("OPT") %>">
  
      
      
	<table class="tableinfo" id="trdark">
    	<tr id="trdark">
      		<th align="center" nowrap colspan="2">
      			<% if (request.getParameter("OPT").equals("LN")) { out.println("Account"); } else { out.println("Aceptante"); } %>
      		</th>
    	</tr>
    	<tr id="trclear">
      		<td align="center" nowrap width="50%">
       			<% 	if (request.getParameter("OPT").equals("LN")) { out.print("<b>Number : </b>" + docList.getRecord(0)); }
        		 	else { out.print("<b>Identificación : </b>" + docList.getRecord(4)); } %>
      		</td>
      		<td align="center" nowrap width="50%">
       			<% 	if (request.getParameter("OPT").equals("LN")) { out.println("<b>Customer : </b>" + docList.getRecord(1)); }
        		 	else { out.println("<b>Nombre : </b>" + docList.getRecord(2)); } %>
      		</td>
    	</tr>   
  	</table>
  
  	<BR>
  	
  	<TABLE  id="mainTable" class="tableinfo">
  		<TR> 
    		<TD NOWRAP>
   				<TABLE id="headTable">
    				<TR id="trdark"> 
				    	<th nowrap>&nbsp;</th>
				      	<th align="center" nowrap > Doc. No.</th>
				      	<th align="center" nowrap >Account</th>
      					<th align="center" nowrap >
      						<% if (request.getParameter("OPT").equals("LN")) { out.println("Acceptant"); }
        		 			   else { out.println("Customer");} %>
        		 		</th>
      					<th align="center" nowrap >Amount</th>
    				</tr>
    			</TABLE>
  
   				<div id="dataDiv1" class="scbarcolor">
    				<table id="dataTable"> 
    					<%
	 						docList.initRow();
        					while (docList.getNextRow()) {
	      				%> 
     					<tr> 
      						<td align="center" nowrap > 
        						<input type="checkbox" name="ROW_<%= docList.getCurrentRow() %>" value="<%= docList.getCurrentRow() %>">
      						</td>
      						<td align="center" nowrap >
      							<a href="javascript:ShowCancel('<%=docList.getRecord(7)%>','<%=docList.getRecord(1)%>','<%=docList.getRecord(0)%>','<%=docList.getRecord(6)%>',<%=docList.getCurrentRow()%>)">
      							<%= docList.getRecord(0) %></a></td>
      						<td align="center" nowrap ><%= docList.getRecord(7) %></td>												
      						<td align="center" nowrap >
      							<%	if (request.getParameter("OPT").equals("LN")) { out.println(docList.getRecord(2)); }
        		 				   	else { out.println(docList.getRecord(9)); } %>
      						</td>
      						<td align="center" nowrap ><%= docList.getRecord(3) %></td>
    					</tr>
    					<%	} %>
  					</table>
  				</div>
   
  			</TD>
  		</TR>	
	</TABLE>

  	<BR><BR>
  	
	<table class="tableinfo">
		<tr>
	    	<td nowrap>
				<table  cellspacing="0" cellpadding="2" width="100%" border="0">
			  		<tr>
	            		<td nowrap width="20%"><div align="right">Date  :</div></td>  
						<td nowrap >
							<div align="left"> 
		        				<input type="text" name="E01PAGVD1" size="2" maxlength="2" onKeypress="enterInteger()" value="<%= payDoc.getE01PAGVD1().trim()%>">
		        				<input type="text" name="E01PAGVD2" size="2" maxlength="2" onKeypress="enterInteger()" value="<%= payDoc.getE01PAGVD2().trim()%>"> 
		        				<input type="text" name="E01PAGVD3" size="2" maxlength="2" onKeypress="enterInteger()" value="<%= payDoc.getE01PAGVD3().trim()%>">
              					<a href="javascript:DOBPicker(document.forms[0].E01PAGVD1,document.forms[0].E01PAGVD2,document.forms[0].E01PAGVD3)">
              					<img src="<%=request.getContextPath()%>/images/calendar.gif" alt="Help" border="0" ></a>
	      		  			</div>
						</td>
						<td nowrap width="20%"><div align="right">Comments :</div></td>  
						<td nowrap >
				  			<div align="left"> 
	        					<input type="text" name="E01DEANR1" size="30" maxlength="30" value="<%= payDoc.getE01DEANR1().trim()%>">
	              			</div>
						</td>
	          		</tr>
			  		<tr>
	            		<td nowrap width="20%"></td>  
						<td nowrap></td>
						<td nowrap width="20%"></td>  
						<td nowrap >
				  			<div align="left"> 
	                			<input type="text" name="E01DEANR2" size="30" maxlength="30" value="<%= payDoc.getE01DEANR2().trim()%>">               
	              			</div>
						</td>
	          		</tr>
	         	</table>
		   	</td>
	    </tr>
	</table>
  	
  	
  	<p align="center"><input id="EIBSBTN" type="submit" name="Submit" value="Submit"></p>
  	
  	<SCRIPT language="JavaScript">
     	function resizeDoc() {
       		divResize();
     		adjustEquTables(headTable, dataTable, dataDiv1, 1, false);
      	}
     	resizeDoc();
     	window.onresize=resizeDoc;
	</SCRIPT>     
</form>

<% } %>

</body>
</html>
