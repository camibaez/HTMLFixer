<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<title>Cost Center</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ewd0125Help" class= "datapro.eibs.beans.JBList"   scope="session"/>
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
  if ( ewd0125Help.getNoResult() ) {
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
			  <th nowrap><div>App. Code</div></th>
			  <th nowrap>Description</th>
			 </tr>
 </TABLE>
  
   <div id="dataDiv1" class="scbarcolor" >
    <table id="dataTable" >		
<%		
	 ewd0125Help.initRow();
		  int i=0;
                while (ewd0125Help.getNextRow()) {
                    if (ewd0125Help.getFlag().equals("")) {
                    		out.println(ewd0125Help.getRecord());
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
		