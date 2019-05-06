<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<html>
<head><title>SubAccount Search</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ewd0016Help" class= "datapro.eibs.beans.JBList"   scope="session"/>

<SCRIPT language="JavaScript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>)
</SCRIPT>

<script language="javascript">
//<!-- Hide from old browsers
function enter(code,cust) {
//var formLength= top.opener.document.forms[0].elements.length;
//for(n=0;n<formLength;n++){
//var elementName= top.opener.document.forms[0].elements[n].name;
//	if(elementName == top.opener.fieldName){
//  		top.opener.document.forms[0].elements[n].value = code;
//  		break;
//	}
// }
//top.close();

top.opener.document.forms[0][top.opener.fieldName].value = code;
top.opener.document.forms[0][top.opener.fieldAux2].value = cust;
top.close();
 }
//-->
</script>
</head>
<body>
<%
	if ( ewd0016Help.getNoResult() ) {
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
   <TABLE class="tableinfo" align="center" style="width:'95%'">
    <TR id="trdark"> 
			    <th>SubAccount</th>
			    <th>Name</th>
			    <th>Closing Date</th> 
			</tr>
<%
                ewd0016Help.initRow();
                while (ewd0016Help.getNextRow()) {
                    if (ewd0016Help.getFlag().equals("")) {
                    		out.println(ewd0016Help.getRecord());
                    }
                }
    %> 

  </TABLE>

<%
   }
%>
</body>
</html>						