<html>
<head>
<title>Averages Account</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="aveBean" class="datapro.eibs.beans.JBAverage"  scope="session" />

</head>

<body>
<h3 align="center">Averages</h3>
<hr size="4">
  
<h4>Graphics</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap>
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td width="100%"> 
				<%= aveBean.getGraph() %>
			</td>
      	  </tr>
		</table>
	  </td>
	</tr>
  </table>	
<div align="center"> 
	   <input id="EIBSBTN" type=button name="Submit" value="Close" OnClick="top.close()">
  </div>  
</body>
</html>
