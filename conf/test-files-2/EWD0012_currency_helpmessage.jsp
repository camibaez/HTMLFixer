<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<title>Currency Search</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ewd0012Help" class= "datapro.eibs.beans.JBList" scope="session"/>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT language="JavaScript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);
</SCRIPT>

<script language="javascript">
function enter(code) {
	var form = top.opener.document.forms[0]; 
	if (isValidObject(form[top.opener.fieldName])) {
		form[top.opener.fieldName].value = code;
		form[top.opener.fieldName].focus();
	}
	top.close();
 }
 

</script>
</head>
<body>
<form>
<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
<%
	if ( ewd0012Help.getNoResult() ) {
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
<TABLE  id="mainTable" class="tableinfo" ALIGN=CENTER style="width:'95%'">
 <TR> 
    <TD NOWRAP valign="top" width="100%" >
  <TABLE id="headTable" >
  <TR id="trdark">
 			  <th nowrap align="center">Currency</th>
			  <th nowrap align="center">Exchange Rate</th>
			  <th nowrap align="left">Description</th>
			 </tr>
     </TABLE>
  
   <div id="dataDiv1" class="scbarcolor" >
    <table id="dataTable" >		
<%
                ewd0012Help.initRow();
                while (ewd0012Help.getNextRow()) {
                    if (ewd0012Help.getFlag().equals("")) {
                    		out.println(ewd0012Help.getRecord());
                    }

                }
    %> 

  </table>
   </div>
   </TD>
  </TR>	
</TABLE>

<SCRIPT language="JavaScript">
	divResize(false);
	adjustEquTables(document.getElementById("headTable"), document.getElementById("dataTable"), document.getElementById("dataDiv1"), 1, false);     
</SCRIPT>
<%
   }
%>
</form>
</body>
</html>			
