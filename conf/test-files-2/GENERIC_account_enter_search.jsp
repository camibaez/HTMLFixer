<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css"> 
<TITLE>Conexión</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />

<% 

	String client = "0";
	String title = "";
	String cuenta = "Account";

	if (userPO.getOption().equals("CD")) { 
    	cuenta = "CD";
		title = title + "CDs";
	} else if (userPO.getOption().equals("15")) { 
    	cuenta = "Federal Fund";
		title = title + "Federal Funds";
	} else if (userPO.getOption().equals("LN")) { 
				cuenta = "Loan";
				title = title + "Loans";
	} else if (userPO.getOption().equals("CL")) { 
				cuenta = "Line";
				title = title + "Linea Multiuso";
	} else if (userPO.getOption().equals("RT")) { 
				title = title + "Retail Account";
	} else if (userPO.getOption().equals("SV")) { 
				title = title + "Saving Account";
	} else if (userPO.getOption().equals("CC")) { 
				title = title + "Credit Cards";
	} else if (userPO.getOption().equals("CA")) { 
				title = title + "Additional Credit Cards";
	} else if (userPO.getOption().equals("DC")) { 
				title = title + "Debit Cards";
	} else if (userPO.getOption().equals("WT")) { 
				title = title + "Giros Diferidos";
	} else if (userPO.getOption().equals("SB")) { 
				//cuenta = "Prestamo";
				title = title + "Sobregiro Pactado";
	} else if (userPO.getOption().equals("LC")) { 
				cuenta = "Line";
				title = title + "Credit Line";
	} else if (userPO.getOption().equals("TC")) { 
				//cuenta = "Prestamo";
				title = title + "Tarjetas de Credito";
	} else if (userPO.getOption().equals("X1")) { 
				//cuenta = "Linea";
				title = title + "Creditos Hipotecarios";
	} else if (userPO.getOption().equals("X2")) { 
				//cuenta = "Linea";
				title = title + "Mutuos Hipotecarios";
	} else if (userPO.getOption().equals("X3")) { 
				//cuenta = "Linea";
				title = title + "Comercio Exterior";
	} else if (userPO.getOption().equals("X4")) { 
				//cuenta = "Linea";
				title = title + "Cobranza de Letras";
	} else if (userPO.getOption().equals("IN")) {
    			title = title + "Inversiones";
	}

	if (userPO.getPurpose().equals("MAINTENANCE")) {
   		title=title + " Maintenance";
	} else if (userPO.getPurpose().equals("NEW")) {
   		title=title + " New";
	} else if (userPO.getPurpose().equals("PDN")) {
   		title=title;
	} else if (userPO.getPurpose().equals("STATEMENT")) {
   		title=title + " Statement";
	} else if (userPO.getPurpose().equals("INQUIRY") || userPO.getPurpose().equals("")) {
   		title=title + " Inquiry";
	} else title = title + " " + userPO.getPurpose();

	if (currClient != null) {
  		client = currClient.getE01CUSCUN();
	}
	
%>

<script language="JavaScript">
  
function enterAction(code,numc,id,prod,card) {

	if (document.getElementById("OPTION_STATUS").value == "C") {
		 if ( !confirm("Do you want to active Account Number: " + code)) {
		    return false;
		 } else {
		 	document.getElementById("header2").value = "A";
		 }   
	}
	
 	<% if (!userPO.getHeader1().equals("")) {%>
 			document.forms[0].<%= userPO.getHeader1() %>.value = code;
 	<% } %>
 	<% if (!userPO.getHeader3().equals("")) {%>
 		document.forms[0].<%= userPO.getHeader3() %>.value = prod;
 	<% } %>
 	<% if (!userPO.getHeader4().equals("")) {%>
 		document.forms[0].<%= userPO.getHeader4() %>.value = id;
 	<% } %>
 	<% if (!userPO.getHeader5().equals("")) {%>
 		document.forms[0].<%= userPO.getHeader5() %>.value = card;
 	<% } %>
 	document.forms[0].SELCLIENT.value = numc;
 	document.forms[0].submit();
}

function justifyRight(c,l) {
	var fc = "";
	for (var i = 0; i < (l - c.length); i++){
	  	fc += "0";
	}
	return (fc + c);
}

function typeClick(value, row){
  if (value == "A") {       
   		document.getElementById("DIVSUBMIT").style.display=""; 
  } else {
   		document.getElementById("DIVSUBMIT").style.display="none";
  } 
  document.getElementById("DIVNAME").style.pixelTop=document.getElementById("TBHELP").offsetTop + document.getElementById("TBHELP").rows[row].cells[2].offsetTop - 3;
  document.getElementById("DIVNAME").style.pixelLeft=document.getElementById("TBHELP").offsetLeft + document.getElementById("TBHELP").rows[row].cells[2].offsetLeft;
  document.forms[0].NameSearch.value="";
  document.forms[0].NameSearch.focus();
}

function enterSearch(firsTime){
	var NameSearch = document.forms[0].NameSearch.value;
	var FromRecord = 0;
	var Client = "<%= client %>";
	var AppCode = "<%= userPO.getProdCode() %>";
	var Bank = "";
	var Selection = "";
	var Type ="A";
	var Account = "";
	var OldAccount = "";
	var Card = "";
	var Status = document.forms[0].shrSTATUS.value;

	var option = "<%=userPO.getOption()%>";
	if (NameSearch.length < 1){
		NameSearch=".";
	} //else Client = "0";
	
	for (var i = 0; i < document.forms[0].Type.length; i++)	{
		if (document.forms[0].Type[i].checked)
			 Type = document.forms[0].Type[i].value;
	}
	
	if (Type == "N" && !firsTime) {
		Client = NameSearch;
		NameSearch=".";
	}
	if (Type == "A") { //Account Search
	    Account = NameSearch;
	    if(NameSearch.length > 1 && option == "DC") {
			enterACC();
			document.forms[0].submit();
			return;
		}
	    NameSearch="";
	}  
	if (Type == "O") { //Old Account Search
	    OldAccount = NameSearch;
	    NameSearch="";
	}  	
	if (Type == "C") { //Card Search
		AppCode = "B2";
	    Card = NameSearch;
	    NameSearch="";
	}  	
    parent.results.window.location.href="<%=request.getContextPath()%>/pages/e/MISC_search_wait.jsp?URL='<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0005?NameSearch=" + NameSearch + "@FromRecord=" + FromRecord + "@shrBank=" + Bank + "@shrAppCode=" +  AppCode + "@shrSelect=" + Type + "@shrClient=" + Client + "@shrAcc=" + Account + "@shrOldAcc=" + OldAccount + "@shrCard=" + Card + "@shrSTATUS=" + Status + "'";
}

function enterACC(){
	var NameSearch = trim(document.forms[0].NameSearch.value);
    
    if (document.getElementById("DIVSUBMIT").style.display != "") {
    	if (document.forms[0].<%= userPO.getHeader1() %>.value != "0") {
    		return true;
    	} else {
    	   	enterSearch(false); //call search
    	   	return false;
    	}
    }
	if (NameSearch.length > 0){ 
		var option = "<%=userPO.getOption()%>";
	    if (option == "CA" || option == "CC")  {
    	   	enterSearch(false); //call search
    	   	return false;
	    } else { 
	    	document.forms[0].<%=userPO.getHeader1()%>.value=NameSearch;	 
	    	return true;
	    }	
	} else {
		alert("Field can not be blank");
		document.forms[0].NameSearch.focus();
		return false;
	}
}
</script>

</HEAD>


<body> 

<h3 align="center"><%=title%><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="account_enter_search, GENERIC"></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%><%= userPO.getRedirect()%>" target="_parent" onsubmit="return(enterACC());">
  <input type="hidden" id="header1" name="<%= userPO.getHeader1() %>" value="0">
  <input type="hidden" id="header2" name="<%= userPO.getHeader2() %>" value="">
  <input type="hidden" name="SELCLIENT" value="">
  
  <% if (!userPO.getHeader3().equals("")) {%>
  	<input type="hidden" name="<%= userPO.getHeader3() %>" value="">
  <% } %>
  <% if (!userPO.getHeader4().equals("")) {%>
  	<input type="hidden" name="<%= userPO.getHeader4() %>" value="">
  <% } %>
  <% if (!userPO.getHeader5().equals("")) {%>
  	<input type="hidden" name="<%= userPO.getHeader5() %>" value="">
  <% } %>	      	
  <div id=DIVNAME style="position:absolute; left:25px; top:-50px;">
     <input type="text" name="NameSearch"  size=14 maxlength="20">
     &nbsp;&nbsp;<img src="<%=request.getContextPath()%>/images/search1.gif" style="cursor : hand;" onClick="enterSearch(false)"> 
  </div>
  
  <CENTER>  
	   <table  id="TBHELP" align="center" width="370" border="0" cellspacing="0" cellpadding="0">
		<tr>
		  <td nowrap width="90">Search by :</td>
		  <td nowrap width="243">
		    <input type="radio" name="Type" value="N" onclick="typeClick('N',0)" checked>Customer / Portfolio Number
		  <A href="javascript:GetCustomerDescId('NameSearch','','')"><IMG
			src="<%=request.getContextPath()%>/images/1b.gif" alt="help"
			align="bottom" border="0"></A></td>		
		  <td nowrap width="38">
     	  </td>
		</tr>
		<tr>
		  <td nowrap ></td>
		  <td nowrap width="243">
		  	<input type="radio" name="Type" value="I" onclick="typeClick('I',1)">Identification Number
		  </td>
		  <td nowrap width="38"></td>
		</tr>
		<tr>
		  <td nowrap ></td>
		  <td nowrap width="243">
		  	<input type="radio" name="Type" value="K" onclick="typeClick('K',2)">Social Security Number
		  </td>
		  <td nowrap width="38"></td>
		</tr>		
		<tr>
		  <td nowrap ></td>
		  <td nowrap width="243">
		  	<input type="radio" name="Type" value="S" onclick="typeClick('S',3)">Short Name
		  </td>
		  <td nowrap width="38"></td>
		</tr>
		<tr>
		  <td nowrap ></td>
		  <td nowrap width="243">
		  	<input type="radio" name="Type" value="W" onclick="typeClick('W',4)">Word
		  </td>
		  <td nowrap width="38"></td>
		</tr>		
	    <tr>
		  <td nowrap></td>
		  <td nowrap width="243"><input type="radio" name="Type" value="A" onclick="typeClick('A',5)"><%=cuenta%> Number</td>
		  <td nowrap width="38">
		  </td>
		</tr>
	    <tr>
		  <td nowrap></td>
		  <td nowrap width="243"><input type="radio" name="Type" value="O" onclick="typeClick('O',6)">Old Account Number</td>
		  <td nowrap width="38">
		  </td>
		</tr>
		<tr>
			<td nowrap></td>
			<td nowrap width="243"><input type="radio" name="Type" value="C" onclick="typeClick('C',7)">Card Number</td>
			<td nowrap width="38"></td>
		</tr>
	<TR>
		<TD nowrap></TD>
		<TD nowrap width="243"></TD>
		<TD nowrap width="38"></TD>
	</TR>
	<tr>
		  <td nowrap align="right"><SELECT id="OPTION_STATUS" name="shrSTATUS">
			<OPTION value="A">Active</OPTION>
			<OPTION value="C">Closed</OPTION>
			<OPTION value=" ">All</OPTION>
		</SELECT></td>
		  <td nowrap width="243">
		<div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Account Status</div>
		</td>
		  <td nowrap width="38">
		  </td>
		</tr>
		
	 	<tr valign="middle"> 
      		<td nowrap colspan="3" align="center" >
          		<div id=DIVSUBMIT align="center" style="display: none">
          		  <p align=center>   
    				<input id="EIBSBTN" type=submit name="Submit" value="Submit">
          		   </p>
          		</div>
      		</td>
    	</tr>
 	</table>
 </CENTER>

</FORM>

<SCRIPT Language="Javascript">;
	 typeClick('N',0);
     function resizeDoc() {
       for(var i = 0; i < document.forms[0].Type.length; i++)
		{
		if (document.forms[0].Type[i].checked)
			document.forms[0].Type[i].click();
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
 
 if (!client.equals("0")) { 
%>
     <SCRIPT Language="Javascript">
           enterSearch(true);
     </SCRIPT>
 <%
 }
%>
</BODY>
</HTML>
 