<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<html>
<head><title>Cash Accounts </title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EWD0314Help" class= "datapro.eibs.beans.JBList"   scope="session"/>

<SCRIPT language="JavaScript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>)
</SCRIPT>

<script language="javascript">
//<!-- Hide from old browsers
function enter(code1,code2,code3) {
//var formLength= top.opener.document.forms[0].elements.length;
//for(n=0;n<formLength;n++){
//var elementName= top.opener.document.forms[0].elements[n].name;
//	if(elementName == top.opener.fieldName){
//  		top.opener.document.forms[0].elements[n].value = code1;
//  		top.opener.document.forms[0].elements[n-1].value = code2;
//  		top.opener.document.forms[0].elements[n-2].value = code3;
//  		break;
//	}
// }
  top.opener.document.forms[0][top.opener.fieldName].value = code1;
  top.opener.document.forms[0][top.opener.fieldAux1].value = code2;
  top.opener.document.forms[0][top.opener.fieldAux2].value = code3;
  top.opener.document.forms[0][top.opener.fieldAux1].focus();
  top.close();
 }
//-->
</script>
</head>
<body>
<%
	if ( EWD0314Help.getNoResult() ) {
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
    <th colspan="3">Cash Accounts List</th>
  </tr>
  <TR id="trdark"> 
    <th> 
      <div align="center">Currency</div>
    </th>
    <th> 
      <div align="center">Account</div>
    </th>
    <th> 
      <div align="center">Balance</div>
    </th>
  </tr>
  <%
                EWD0314Help.initRow();
                while (EWD0314Help.getNextRow()) {
                    if (EWD0314Help.getFlag().equals("")) {
                    		out.println(EWD0314Help.getRecord());
                    }
                }
    %> 
</TABLE>
<%
   }  
%>
</body>
</html>