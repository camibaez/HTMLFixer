<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Reports Security</title>
	
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"></script>	
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/e/javascripts/Ajax.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/plugins/jstree/_lib/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/plugins/jstree/_lib/jquery.cookie.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/plugins/jstree/_lib/jquery.hotkeys.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/plugins/jstree/jquery.jstree.js"></script>

<script type="text/javascript">

var user;
var report;
var updateHtml;

function changeLabel(value) {
	if (value == 'U') {
		document.getElementById("searchLabel").innerHTML = "User :";
	} else {
	  	document.getElementById("searchLabel").innerHTML = "Group :";
	}  
}

function clearReportsFilter(value) {
	document.getElementById("reportText").value = "";
	loadReports(user, getElementChecked("searchType").value);
}

function searchUsers() {
	var criteria = document.getElementById("searchCriteria").value;
    var type = getElementChecked("searchType").value;
    var userId = type == 'U' ? criteria : "";
	var group = type == 'G' ? criteria : "";    
	$("#userSpace").jstree({
		"json_data" : {
			"ajax" : {
				"url" : function (n) {
					return "<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSUsersAccess?SCREEN=2";
				},
				"cache" : false, 
				"data" : function (n) {
					//Data to be sent to the server, could be key/value pairs
					return {
						"type" : type,
						"group" : group,
						"user" : userId
					};
				}
			}
		},
		"types" : {
			"valid_children" : [ "group", "user" ], 
			"types" : {
				"user" : {
					"icon" : { "image" : '<%=request.getContextPath()%>/images/user.gif' }
				}
			}
		}, 
		"plugins" : [ "themes", "json_data", "ui", "types" ]
		}).bind("select_node.jstree", function (event, data) {
			if (data.rslt.obj.attr("rel") == "group") {
				document.getElementById("searchTypeDiv").innerHTML = "Group : " + data.rslt.obj.attr("id");
				loadReports(data.rslt.obj.attr("id"), "G");
			} else {
				document.getElementById("searchTypeDiv").innerHTML = "User : " + data.rslt.obj.attr("id");
				loadReports(data.rslt.obj.attr("id"), "U");
			}
		}); 

};

function closeAll() {
     $("#reports").jstree("close_all");
}


function loadReports(userId, type) {
	user = userId;
	callWaiting("reports", '<%=request.getContextPath()%>/images/gears7.gif', "Searching Reports ...");
	$("#reports").jstree({
		"json_data" : {
			"ajax" : {
				"url" : function (n) {
					return "<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSUsersAccess?SCREEN=3";
				},
				"cache" : false, 
				"data" : function (n) {
					//Data to be sent to the server, could be key/value pairs
					return {
						"user" : userId,
						"module" : n.attr ? n.attr("rel") : "",
						"id" : n.attr ? n.attr("id") : "",
						"type" : type,
						"report" : report
					};
				}
			}
		},
		"search" : {
			"ajax" : {
				"url" : function (n) {
					return "<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSUsersAccess?SCREEN=6";
				},
				"cache" : false, 
				"data" : function (str) {
					//Data to be sent to the server, could be key/value pairs
					return {
						"user" : userId,
						"report" : str
					};
				}
			}
		},
		"plugins" : [ "themes", "json_data", "checkbox", "search" ]
        }).bind("search.jstree", function (e, data) {
			report = "";
		}); 
};		

function submitChecked(){
	var all = false;
	var added_ids = [];	
	$("#reports").jstree("get_checked", null, true).each 
		(function () {
			if(this.id == "ALL"){
				all = true;
			}
			var att = this.attributes.getNamedItem("selected"); 
			if (att != null) {
				if(att.value == 'false' && this.id.length > 2){
					all = false;
       				added_ids.push(this.id);
       			}
			}

	});
	var removed_ids = [];
	$("#reports").jstree("get_unchecked", null, true).each 
		(function () {
			var att = this.attributes.getNamedItem("selected");
			if (att != null) {
				if(att.value == "true" && this.id.length > 2){
	       			removed_ids.push(this.id);
	       		}
			}
	});
	if(!all && added_ids.length ==0 && removed_ids.length == 0){
		alert('No selection has been made');
		return;
	}
	var type = $("#userSpace").jstree("get_selected").attr("rel") == "group" ? "G" : "U";
	var text = type == "G" ? "Updating group reports..." : "Updating user reports...";
	updateHtml = document.getElementById("reportUpdateDiv").innerHTML;
	callWaiting("reportUpdateDiv", '<%=request.getContextPath()%>/images/gears7.gif', text);
	var url = "<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSUsersAccess";
	if(all){
		PostXMLRequest(url, "user="+user+"&type="+type+"&SCREEN=5", submitStatus, true);
	} else {
		PostXMLRequest(url, "user="+user+"&type="+type+"&added="+added_ids+"&removed="+removed_ids+"&SCREEN=4", submitStatus, true);
	}
}
  
function submitStatus(res){
    document.getElementById("reportUpdateDiv").innerHTML = updateHtml;
	alert(res.responseText);
}

$(function () { 
	$("#reportSearchDiv input").click(function () {
		switch(this.id) {
			case "reportSearch":
				report = document.getElementById("reportText").value;
				$("#reports").jstree("search", report);
				break;
			case "reportText": break;
			default:
				$("#reports").jstree(this.id);
				break;
		}
	});
});

</script>
	
<title>User Reports</title>

</head>
<body>
<h3 align="center">Assigment of Reports to Users<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="Users_reportes_tree, UsersReports"></h3>
<hr size="4">

<div id="container" style="width: 100%">

<div id="users" style="width: 400px; padding-top: 10px; float: left;">
	<div id="search">
    	<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSUsersAccess">
     		<table border="0" class="tableinfo" width="100%" >
	    		<tr align="center">
		   			<td align="right">Search By:&nbsp;&nbsp;</td>
		   			<td align="left">
		   				<input type="radio" name="searchType" value="U" onclick="changeLabel(this.value);" checked>User&nbsp;&nbsp; 
		   				<input type="radio" name="searchType" value="G" onclick="changeLabel(this.value);">Group
		   			</td>
	   			</tr>
	   			<tr align="center">
		  			<td align="right"><span id="searchLabel">User : </span>&nbsp;&nbsp;</td>
		  			<td align="left">
		  				<input type="text" id="searchCriteria" name="searchCriteria" value="" size="20" maxlength="10" />&nbsp;&nbsp; 
		  				<input type="button" name="Buscar" id="BuscarUser" value="Search" class="eibsbtn" onclick="searchUsers();" />
		  			</td>
       			</tr>
    		</table>
    	</form>
	</div>

   	<div id="userSpace" style="background-color: white;">
    	<ul id="listaUsuarios" style="background-color: white;"></ul>
   	</div>

</div>


<div id="reportsDiv" style="width: 624px; left:400px; position: absolute; padding-top: 10px; padding-left: 30px;">
	<div id="updateDiv">
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<tr align="center">
				<td align="left" bgcolor="white">
			    	<div id="reportUpdateDiv">
						<table border="0" width="100%" cellpadding="0" cellspacing="0">
							<tr align="center">
								<td align="left" bgcolor="white">
							    	<div id="updateDiv">
							    		<a href="javascript:submitChecked()">
							    		<img src="<%=request.getContextPath()%>/images/e/update.gif" title="Update User Reports" border="0"></a>
							  		</div>
								</td>
						   		<td align="right"  bgcolor="white">Reportes :&nbsp;</td>
								<td align="left" bgcolor="white">
								<div id="reportSearchDiv" style="left:500px;">
									<input type="text" id="reportText" value="" align="top"/>
									<input type="button" id="reportSearch" value="Search" class="eibsbtn"/>
									<input type="button" id="reportClear" value="Clean" class="eibsbtn" onclick="clearReportsFilter()" disabled="disabled"/>
								</div>
								</td>
							</tr>
						</table>	
					</div>
				</td>
	   		</tr>
			<tr align="center">
				<td align="left" bgcolor="white">
			    	<div id="searchTypeDiv">
			  		</div>
				</td>
	   		</tr>
		</table>
    </div>
    
    <div id="reports" style="background-color: white"></div>
</div>



</div>

</body>
</html>
