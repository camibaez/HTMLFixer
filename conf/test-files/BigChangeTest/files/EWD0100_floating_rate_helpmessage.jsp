<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<html>
<head><title>Floating Rate Table Search</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ewd0100Help" class= "datapro.eibs.beans.JBList"   scope="session"/>

<script language="javascript">
//<!-- Hide from old browsers
function enter(code) {
var formLength= top.opener.document.forms[0].elements.length;
for(n=0;n<formLength;n++){
var elementName= top.opener.document.forms[0].elements[n].name;
	if(elementName == top.opener.fieldName){
  		top.opener.document.forms[0].elements[n].value = code;
  		break;
	}
 }
top.close();
 }
//-->
</script>
</head>
<body>
<%
	if ( ewd0100Help.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
      <div align="center"><b> There is no match for your search 
        criteria </b></div>
      </TD></TR>
   		</TABLE>
<%   		
		}
	else {
%>	
   <TABLE class="tableinfo" align="center" style="width:'95%'">
    <TR id="trdark">
			<th>Table Code</th>
			<th>Primary Rate</th>
			<th>Secondary Rate</th>
			<th>Bank</th>
			<th>Date</th>
			</tr>
<%
                ewd0100Help.initRow();
                while (ewd0100Help.getNextRow()) {
                    if (ewd0100Help.getFlag().equals("")) {
                    		out.println(ewd0100Help.getRecord());
                    }
                }
    %> 

  </TABLE>

<%
   }
%>
</body>
</html>