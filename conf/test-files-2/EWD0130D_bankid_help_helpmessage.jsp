<HTML>

<%@ page import = "datapro.eibs.master.Util" %><META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<script language="javascript">

function enter(code,name,address1,address2,address3) {
var form = top.opener.document.forms[0];
		
setField(form[top.opener.fieldName], code);
setField(form[top.opener.fieldDesc], name);
setField(form[top.opener.fieldAux1], address1);
setField(form[top.opener.fieldAux2], address2);
setField(form[top.opener.fieldAux3], address3);
  
top.close();
}

</script>
</head>

<jsp:useBean id= "bankIdHelp" class= "datapro.eibs.beans.JBList"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<body>
 
<FORM>
<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
<%
	if ( bankIdHelp.getNoResult() ) {
%>
 		<TABLE class="tbenter" width=100% height=100%>
 		<TR>
      <TD> 
        
      <div align="center"> <b> There is no match for your search criteria</b> 
      </div>
      </TD></TR>
   		</TABLE>
<%
	}
	else {
%>
 <TABLE  id="mainTable" class="tableinfo" ALIGN=CENTER style="width:'95%'">
 <TR> 
    <TD NOWRAP valign="top" width="100%" >
  <TABLE id="headTable" >
  <TR id="trdark">
 	  <th nowrap>Bank ID</th> 
      <th nowrap>Name</th>
      <th nowrap>Country</th>
	  <th nowrap>State</th>
	  <th nowrap>City</th>
	 </TR>
    </TABLE>
  
    <div id="dataDiv1" class="scbarcolor" >
     <TABLE id="dataTable">	
    		<%
                String NameSearch = (String)session.getAttribute("NameSearch");
                bankIdHelp.initRow();
				int i=0;
                while (bankIdHelp.getNextRow()) {
                    if (bankIdHelp.getFlag().equals("")) {
                    		out.println(bankIdHelp.getRecord());
					i++;
                    }
                }
              %> 
     </TABLE>
  </div>
   </TD>
  </TR>	
</TABLE>

<SCRIPT language="JavaScript">
     document.forms[0].totalRow.value="<%= i %>";
     divResize(false);
     adjustEquTables(headTable, dataTable, dataDiv1,1,false);     
</SCRIPT>
<%      
  }
%> 
</FORM>

</BODY>
</HTML>

