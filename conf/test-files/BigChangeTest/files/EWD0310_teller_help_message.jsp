<html>
<head>
<title>Teller Help</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EDD031001Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">

	function enter(code) {
		var form = top.opener.document.forms[0];
		if (isValidObject(form[top.opener.fieldName])) {
			form[top.opener.fieldName].value = code;
			form[top.opener.fieldName].focus();
		}
		top.close();
	}

</SCRIPT> 

</head>

<BODY>

<h3 align="center">TELLER HELP
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="teller_help_message.jsp, EWD0310"></h3>
<hr size="4">
<FORM METHOD="post" action="">
    
<% if ( EDD031001Help.getNoResult() ) { %>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>There is no match for your search criteria</b></p>
        </div>

	  </TD>
	</TR>
    </TABLE>
	<%} else {
	%> 
<TABLE  id="mainTable" class="tableinfo" style="width: 90%; height: 70%;" align="center">
 	<TR height="5%"> 
   		<TD NOWRAP valign="top" width="80%"> 
		  <table class="headTable" width="100%" align="center" >
		     <tr id="trdark"> 
		       <th align=CENTER nowrap width="30%">Teller ID</th>
		       <th align=CENTER nowrap width="70%"><div align="center">Type</div></th>
		     </tr>
		  </table>
		</TD>
	</TR>
  	<TR height="95%"> 
    	<TD NOWRAP valign="top" width="80%">
		  	<div id="dataDiv1" style="height:200px; overflow:auto;"> 
				<table id=dataTable cellspacing="0" cellpadding="0" border="0" width="100%" >
				<% 
		          EDD031001Help.initRow();
		          while (EDD031001Help.getNextRow()) {
		                datapro.eibs.beans.EDD031001Message msgList = (datapro.eibs.beans.EDD031001Message) EDD031001Help.getRecord();
		                String sType = "";
		                if (msgList.getE01TLMTYP().equals("T")) {
		                	sType = "Regular Teller";
		                } else if (msgList.getE01TLMTYP().equals("H")) {
		                	sType = "Head Teller";
		                } else if (msgList.getE01TLMTYP().equals("O")) {
		                    sType = "O/D Official";
		                } else if (msgList.getE01TLMTYP().equals("S")) {
		                    sType = "Operations Supervisor";
		                } else if (msgList.getE01TLMTYP().equals("I")) {
		                    sType = "Teller Interface";
		                }
				%>
		          <tr> 
		            <td NOWRAP align=CENTER width="30%"><a href="javascript:enter('<%= msgList.getE01TLMTID() %>')"><%= msgList.getE01TLMTID() %></a></td>
		            <td NOWRAP align=CENTER width="70%"><a href="javascript:enter('<%= msgList.getE01TLMTID() %>')"><%= sType %></a></td>
		          </tr>
		        <%
		             }
				%>
			  	</table>
		  	</div>
		</TD>
	</TR>	  	 
</TABLE>		  
<SCRIPT type="text/javascript">
     divResize(false);
     adjustEquTables(getElement("headTable"), getElement("dataTable"), getElement("dataDiv1"), 1, false);     
</SCRIPT>
<%	} %>
</form>
</body>
</html>



