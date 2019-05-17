<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script language="javascript">

	function enter(code) {
		var form = top.opener.document.forms[0];
		form[top.opener.fieldName].value = code;
		top.close();
 	}

</script>
<TITLE></TITLE>
</head>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "ewd0060Help" class= "datapro.eibs.beans.JBList"  scope="session" />

<body>
<FORM>
<%
	if ( ewd0060Help.getNoResult() ) {
%>
	<TABLE class="tbenter" width=100% height=100%>
 		<TR>
      		<TD> 
      			<div align="center"> <font size="3"><b> There is no match for your  search criteria</b></font></div>
      		</TD>
      	</TR>
   	</TABLE>
<%
	} else {
%>
 
  	<TABLE class="tableinfo" style="width:95%" ALIGN=CENTER>
    	<TR id="trdark"> 
      		<TH ALIGN=CENTER  nowrap width="20%">Table</TH>
      		<TH ALIGN=LEFT  nowrap width="80%">Description</TH>
    	</TR>
    <%
                ewd0060Help.initRow();
                while (ewd0060Help.getNextRow()) {
               		out.println(ewd0060Help.getRecord());
                }
              %> 
  	</TABLE>
<%      
  }
%> 
</FORM>

</BODY>
</HTML>