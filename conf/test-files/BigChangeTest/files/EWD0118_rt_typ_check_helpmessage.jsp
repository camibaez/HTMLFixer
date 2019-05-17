<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<html>
<head><title>Type of Checkbook</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ewd0118Help" class= "datapro.eibs.beans.JBList"   scope="session"/>

<SCRIPT language="JavaScript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>)
</SCRIPT>

<script language="javascript">


 
function enter(type,code) {
 
var form = top.opener.document.forms[0]; 
                                        
    if(top.opener.fieldCode !== ""){form[top.opener.fieldCode].value = code;} 
    if(top.opener.fieldType !== ""){form[top.opener.fieldType].value = type;}
  
top.close();
 }
 
</script>
</head>
<body>
<%
	if ( ewd0118Help.getNoResult() ) {
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
    <th >Currency</th>
    <th >Account <br>Type</th>
    <th >Type</th>
    <th >Code</th>
    <th >Description</th>
    <th >Number <br>
      of Checks</th>
  </tr>
  <%
                ewd0118Help.initRow();
                while (ewd0118Help.getNextRow()) {
                    if (ewd0118Help.getFlag().equals("")) {
                    		out.println(ewd0118Help.getRecord());
                    }
                }
    %> 
</TABLE>

<%
   }
%>
</body>
</html>	 
