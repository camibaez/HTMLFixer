<html>
<head> 
<META HTTP-EQUIV="Pragma" CONTENT="No-cache"> 
<title>Busqueda de Descripción de Tarjetas de ATM</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ewd0135Help" class= "datapro.eibs.beans.JBList"   scope="session"/>

<SCRIPT language="JavaScript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>)
</SCRIPT>

<script language="javascript">
//<!-- Hide from old browsers
function enter(code,desc) {
//var formLength= top.opener.document.forms[0].elements.length;
//for(n=0;n<formLength;n++){
//var elementName= top.opener.document.forms[0].elements[n].name;
//	if(elementName == top.opener.fieldName){
//  		top.opener.document.forms[0].elements[n].value = code;
//  		break;
//	}
	var form = top.opener.document.forms[0];
	form[top.opener.fieldName].value = code;
	if (top.opener.fieldDesc !== ""){
	  	form[top.opener.fieldDesc].value = desc;
	}
	form[top.opener.fieldName].focus();
	top.close();
 }
//-->
</script>
</head>
<body>
<%
	if ( ewd0135Help.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
      <div align="center"> <font size="3"><b>There is no match for your search 
        criteria </b></font></div>
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
                ewd0135Help.initRow();
                while (ewd0135Help.getNextRow()) {
                    if (ewd0135Help.getFlag().equals("")) {
                    		out.println(ewd0135Help.getRecord());
                    }
                }
    %> 

  </TABLE>

<%
   }
%>
</body>
</html>			
