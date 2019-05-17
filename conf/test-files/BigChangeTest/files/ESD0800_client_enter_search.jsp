<!DOCTYPE html>
<HTML lang="en">
<HEAD>

<TITLE>Conexión</TITLE>
<%@ page import = "java.io.*,java.net.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*" %>

<meta charset="utf-8">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<script type="text/javascript" id="eAction">  
function enterAction(code,desc,id) {
	var form = document.getElementById('clientSearchForm');
// var Type = "N";
 //for(var i = 0; i < document.forms[0].Type.length; i++)
//	{
//		if (document.forms[0].Type[i].checked)
//			Type = document.forms[0].Type[i].value;
//	}
 //if (Type == "A") { //Account Search
 //	form["E01CUSCUN"].value = desc;
// } else {
 	form.elements["E01CUSCUN"].value = code;
// }
 	form.elements["E01CUSIDN"].value = id;
  
 	form.submit();
}
</script>
 
<script type="text/javascript">

<% if (currClient.getH01WK1().equals("1")) {%>
    parent.parent.client.document.forms[0].E01CUSIDN.value="<%= currClient.getE01CUSIDN() %>";
    parent.parent.client.document.forms[0].E01CUSNA1.value="<%= currClient.getE01CUSNA1() %>";
    parent.parent.client.document.forms[0].E01RELBAN.value="<%= currClient.getE01RELBAN() %>";
   //parent.window.location.href="<%=request.getContextPath()%>/pages/background.jsp";
 <% } %>
     
function justifyRight(c,l) {
	var fc = "";
	for (var i = 0; i < (l - c.length); i++){
	  	fc += "0";
	}
	return (fc + c);
}

function typeClick(value,row){
  if (value == "I" || value == "N"){    
  	
  	  getElement("DIVSUBMIT").style.display="";
      if (value == "N") document.getElementById('clientSearchForm').NameSearch.onkeypress = enterInteger;
      else document.getElementById('clientSearchForm').NameSearch.onkeypress = ""; 
  }
  else{   
   	  getElement("DIVSUBMIT").style.display="none";
   	  if (value == "A") document.getElementById('clientSearchForm').NameSearch.onkeypress = enterInteger;
      else document.getElementById('clientSearchForm').NameSearch.onkeypress = ""; 
  }
  var nameInput = document.getElementById("DIVNAME");
  var tableElement = document.getElementById("tbhelp");
  var tableCell = tableElement.rows[row].cells[2];
  
  nameInput.style.top = tableCell.offsetParent.offsetTop + tableCell.offsetTop + "px";
  nameInput.style.left = tableCell.offsetParent.offsetLeft + tableCell.offsetLeft + "px";
  document.getElementById('clientSearchForm').NameSearch.value="";
  document.getElementById('clientSearchForm').NameSearch.focus();
}

function enter(){
	var NameSearch = document.getElementById('clientSearchForm').NameSearch.value;
	var FromRecord = 0;
	var Type = "N";
	var Client = "";
	var AppCode = "";
	var Bank = "";
	var Selection = "";
	var tmp = "";
	
	for(var i = 0; i < document.getElementById('clientSearchForm').Type.length; i++){
		if (document.getElementById('clientSearchForm').Type[i].checked)
			Type = document.getElementById('clientSearchForm').Type[i].value;
	}
	if (NameSearch.length < 1){
	   if (Type == "A") NameSearch="0";
	   else NameSearch=".";
	}
	if (Type == "N") {
		NameSearch = justifyRight(NameSearch,20);
	}
	//if (Type == "A") { //Account Search
	//	parent.results.window.location.href="<%=request.getContextPath()%>/pages/e/MISC_search_wait.jsp?URL='<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0005?NameSearch=" + tmp + "@FromRecord=" + FromRecord + "@shrBank=" + Bank + "@shrAppCode=" +  AppCode + "@shrSelect=" + Selection + "@shrClient=" + Client + "@shrAcc=" + NameSearch + "'";
	//} else {
    parent.results.window.location.href="<%=request.getContextPath()%>/pages/e/MISC_search_wait.jsp?URL='<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0001?NameSearch=" + NameSearch + "@Type=" + Type + "@FromRecord=" + FromRecord + "'";
   // }
}

function enterRUT(){
	var NameSearch = trim(document.getElementById('clientSearchForm').NameSearch.value);
    if (DIVSUBMIT.style.display !="") {
    	if (document.getElementById('clientSearchForm').E01CUSCUN.value !="0") return true;
    	else {
    	   enter(); //call search
    	   return false;
    	}
    }
	if (NameSearch.length > 0){
	    if (document.getElementById('clientSearchForm').Type[0].checked) document.getElementById('clientSearchForm').E01CUSCUN.value=NameSearch;
	    else {
	    	document.getElementById('clientSearchForm').E01CUSIDN.value=NameSearch;
	    	document.getElementById('clientSearchForm').E01CUSCUN.value="0";
	    }
	    return true;
	}else{
		alert("A value is required");
		document.getElementById('clientSearchForm').NameSearch.focus();
		return false;
	}
}
</script>
</HEAD>

<body> 

	<h3 align="center">Current Customer<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="client_enter_search, ESD0800"></h3>
	<hr size="4">
 <FORM id="clientSearchForm" METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0800" target="_parent" onsubmit="return(enterRUT());">
  <CENTER>
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
  <INPUT TYPE=HIDDEN NAME="E01CUSCUN" value="<%= currClient.getE01CUSCUN() %>">
  <INPUT TYPE=HIDDEN NAME="E01CUSIDN" value="<%= currClient.getE01CUSIDN() %>">
  <INPUT TYPE=HIDDEN NAME="E01RELBAN" value="<%= currClient.getE01RELBAN() %>">   
  <table  id="tbhelp" align="center" width="360" border="0" cellspacing="0" cellpadding="0" style="display: inline-block">
	<tr>
	  <td nowrap width="80" id="THHELP">Search by:</td>
	  <td nowrap width="140"><input type="radio" name="Type" value="N" checked onclick="typeClick('N',0)">Number</td>		
	  <td nowrap width="140"></td>
	</tr>
	<tr>
	  <td nowrap ></td>
	  <td nowrap><input type="radio" name="Type" value="I" onclick="typeClick('I',1)">Identification</td>
	  <td nowrap ></td>
	</tr>
	<tr>
	  <td nowrap ></td>
	  <td nowrap><input type="radio" name="Type" value="S" onclick="typeClick('S',2)">Short Name</td>
	  <td nowrap ></td>
	</tr>
	<tr>
	  <td nowrap ></td>
	  <td nowrap><input type="radio" name="Type" value="W" onclick="typeClick('W',3)">Word</td>
	  <td nowrap ></td>
	</tr>
	<tr>
	  <td nowrap ></td>
	  <td nowrap><input type="radio" name="Type" value="L" onclick="typeClick('L',4)">Legal Name</td>
	  <td nowrap ></td>
	</tr>
	<tr>
	  <td nowrap ></td>
	  <td nowrap><input type="radio" name="Type" value="A" onclick="typeClick('A',5)">Account</td>
	  <td nowrap ></td>
	</tr>   
	      <tr valign="middle"> 
	    	 <td nowrap colspan="3">
	    	  <p>
	         <div id="DIVSUBMIT" align="center">    
	  		<input id="eibsbtn" type=submit name="Submit" value="Submit">
	         </div>
	        </p>
	    	 </td>
	  	</tr>     
 </table>
 	 
	<div id=DIVNAME nowrap width="140" style="display: inline-block; position:absolute;">
      <input type="text" name="NameSearch"  size=14 maxlength="20">
      &nbsp;&nbsp;<img src="<%=request.getContextPath()%>/images/search1.gif" style="cursor : pointer;" onClick="enter()" width="25" height="20"> 
    </div> 
 </CENTER>
</FORM>
<SCRIPT type="text/javascript">;
	 typeClick('N',0);
     document.getElementById('clientSearchForm').NameSearch.focus(); 
     function resizeDoc() {
       for(var i = 0; i < document.getElementById('clientSearchForm').Type.length; i++)
		{
		if (document.getElementById('clientSearchForm').Type[i].checked)
			document.getElementById('clientSearchForm').Type[i].click();
		}
     }    
     window.onresize=resizeDoc;
</SCRIPT>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT Language="Javascript">
            showErrors();
     </SCRIPT>
 <%
 }
%>
</BODY>
</HTML>
 