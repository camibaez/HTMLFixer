<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />

<title>Seguridad de Reportes</title>
	
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet" type="text/css">

<jsp:useBean id= "msgDocs" class= "datapro.eibs.beans.JBObjList"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/e/javascripts/events.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/e/javascripts/Ajax.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/plugins/jstree/_lib/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/plugins/jstree/_lib/jquery.cookie.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/plugins/jstree/_lib/jquery.hotkeys.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/plugins/jstree/jquery.jstree.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/e/javascripts/json2.js"></script>

<title>Inventario de Documentos</title>

</head>
<body>
<h3 align="center">Inventario de Documentos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="doc_inq_tree_new, EDI0010"></h3>
<hr size="4">

<div id="treeSpace" style="background-color: white;">
    	<ul style="background-color: white;">
    		<%
    		    msgDocs.initRow();
                while (msgDocs.getNextRow()) {
					datapro.eibs.beans.EDI001002Message msg = (datapro.eibs.beans.EDI001002Message) msgDocs.getRecord();
					if (msg.getE02DCINIV().equals("1")) {
						String item = msg.getE02DCIATY().equalsIgnoreCase("*cus")
							? msg.getE02DCIDSC().trim()
							: msg.getE02DCIATY() + " - " + msg.getE02DCIDSC().trim();
			%>
			
					<li><%= "Padre" %></li>
    		<%
    				} else if (msg.getE02DCINIV().equals("2")) {
						boolean hasChilds = true;
    					while (msgDocs.getNextRow()) {
    						if(hasChilds){
    		%>
    							<ul style="background-color: white;">
    		<%				}
    						msg = (datapro.eibs.beans.EDI001002Message) msgDocs.getRecord();
    						if (msg.getE02DCINIV().equals("1")) break;
							String number = msg.getH02FLGWK2().trim().equals("C")?msg.getE02DCICUN().trim():msg.getE02DCIACC().trim();
							String itemLink = request.getContextPath()
										+ "/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=3&Type="
										+ msg.getH02FLGWK2().trim()
										+ "&NUMBER="
										+ number
										+ "&DocType="
										+ msg.getE02DCITYP().trim();
							String item = msg.getE02DCIPRO().equalsIgnoreCase("*cus")
										? msg.getE02DCIDSC().trim()
										: msg.getE02DCIACC().trim()
											+ " - "
											+ msg.getE02DCIPRO()
											+ " - "
											+ msg.getE02DCIDSC().trim();
							if(hasChilds){
			%>
					<li><%= "Hijo" %></li>
			<%				}
						}
    					if(hasChilds){
    						hasChilds = false;
    		%>
    							<ul style="background-color: white;">
    		<%			}
			%>
				</ul>
    		<%
    				}
    		    }
			%>
    	</ul>
</div>

</body>

<script type="text/javascript">
	$("#treeSpace").jstree(); 

</script>

</html>
