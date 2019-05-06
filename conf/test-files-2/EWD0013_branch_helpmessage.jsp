<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<html>
<head><title>Branch Search</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ewd0013Help" class= "datapro.eibs.beans.JBList"   scope="session"/>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT language="JavaScript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>)
</SCRIPT>

<script language="javascript">
//<!-- Hide from old browsers
function enter(code) {
//var formLength= top.opener.document.forms[0].elements.length;
//for(n=0;n<formLength;n++){
//var elementName= top.opener.document.forms[0].elements[n].name;
//	if(elementName == top.opener.fieldName){
//  		top.opener.document.forms[0].elements[n].value = code;
//  		break;
//	}
// }
top.opener.document.forms[0][top.opener.fieldName].value = code;
top.opener.document.forms[0][top.opener.fieldName].focus();
top.close();
 }
//-->
</script>
</head>
<body>
<form>
<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
<%
if ( ewd0013Help.getNoResult() ) {
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

<TABLE  id="mainTable" class="tableinfo" ALIGN=CENTER style="width:'95%'">
 <TR> 
    <TD NOWRAP valign="top" width="100%" >
  <TABLE id="headTable" >
    <TR id="trdark">
			  <th nowrap>Number</th>
			  <th nowrap>Name</th>
			  <th nowrap>City</th>
			 </tr>
   </TABLE>
  
   <div id="dataDiv1" class="scbarcolor" >
    <table id="dataTable" >			
<%		
	 ewd0013Help.initRow();
				int i=0;
                while (ewd0013Help.getNextRow()) {
                    if (ewd0013Help.getFlag().equals("")) {
                    		out.println(ewd0013Help.getRecord());
							i++;
                    }
                }
    %> 
</table>
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
</form>
</body>
</html>			
		