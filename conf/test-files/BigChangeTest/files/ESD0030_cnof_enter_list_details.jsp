<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<META name="GENERATOR" content="IBM WebSphere Studio">

<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="javascript">
</script>

</head>

<body>

<jsp:useBean id= "ESD003001Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />

<FORM>

<% if ( !ESD003001Help.getNoResult() ) { %>

  <table  id=cfTable class="tableinfo" width="100%">
    <tr > 
      <td valign="top"> 
        <table id="headTable" width="100%">
          	<%
          	 boolean firstTime = true;
          	 String chk = "";
             ESD003001Help.initRow();
              while (ESD003001Help.getNextRow()) {
              
              	/*
				if (firstTime) {
					firstTime = false;
					chk = "checked";
				} else {
					chk = "";
				} */
              	datapro.eibs.beans.ESD003001Message msgList = (datapro.eibs.beans.ESD003001Message) ESD003001Help.getRecord();
		 	%>
		 	<tr> 
            	<td NOWRAP  align=CENTER width="5%"> 
              		<input type="radio" name="CURRCODE" value="<%= msgList.getE01CNOTCN() %>" <%=chk%> onClick="enter('<%= msgList.getE01CNOTCN() %>', '<%= msgList.getE01CNODCN() %>' );">
            	</td>
            	<td NOWRAP  align=CENTER width="20%"><%= msgList.getE01CNOTCN() %></td>
            	<td NOWRAP  align=LEFT width="75%"><%= msgList.getE01CNODCN() %></td>
          	</tr>
          	<% } %>
        </table>
       </td>
      </tr>  
  </table>
<% } %>


<script language="JavaScript">

	function enter(value1, value2) {
		parent.list.window.document.getElementById("code").value = value1;
		parent.list.window.document.getElementById("description").value = value2;
	}

</SCRIPT> 

</FORM>
</BODY>
</HTML>
