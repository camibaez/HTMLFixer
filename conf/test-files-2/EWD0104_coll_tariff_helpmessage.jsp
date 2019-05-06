<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<html>
<head><title>Collection Tariff Search</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ewd0104Help" class= "datapro.eibs.beans.JBList"   scope="session"/>

<SCRIPT language="JavaScript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>)
</SCRIPT>
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
	if ( ewd0104Help.getNoResult() ) {
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
			     <th width="10%">Code</th>
			     <th width="10%">Bank</th>
				  <th width="10%">Currency</th>
			     <th width="20%">Table Type</th>
			     <th width="50%">Description</th>
			  </TR>

    <%
                ewd0104Help.initRow();
                while (ewd0104Help.getNextRow()) {
                    if (ewd0104Help.getFlag().equals("")) {
                    		out.println(ewd0104Help.getRecord());
                    }
                }
    %> 

  </TABLE>

<%
   }
%>

</body>
</html>