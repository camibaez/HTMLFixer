<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<html>
<head>
<title>Documents Inventory</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ewd0165Help" class= "datapro.eibs.beans.JBList"   scope="session"/>

<SCRIPT language="JavaScript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>)
</SCRIPT>

<script language="javascript">
//<!-- Hide from old browsers
function enter(code) {
var form= top.opener.document.forms[0];
form[top.opener.fieldName].value = code;
form[top.opener.fieldName].focus();
top.close();
 }
//-->
</script>
</head>
<body>
<%
	if ( ewd0165Help.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
      <div align="center"><b> There is no match for your  search criteria</b> 
      </div>
      </TD></TR>
   		</TABLE>
<%   		
		}
	else {
%>	

			<table class="tableinfo" style="width:95%" ALIGN=CENTER>
			 <tr id="trdark">
			  <th ALIGN=CENTER  nowrap width=10%>Code</th>
			  <th ALIGN=CENTER  nowrap width=85%>Description</th>
			 </tr>
		
<%
                ewd0165Help.initRow();
                while (ewd0165Help.getNextRow()) {
                    if (ewd0165Help.getFlag().equals("")) {
                    		out.println(ewd0165Help.getRecord());
                    }
                }
    %> 

  </TABLE>

<%
   }
%>
</body>
</html>			
