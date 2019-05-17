
<!DOCTYPE html public "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>

<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<% 
String client = "0";
String cuenta = "Account";

if (userPO.getOption().equals("CD")) { 
    cuenta = "CD";
} else if (userPO.getOption().equals("LN")) { 
	cuenta = "Loan";
} else if (userPO.getOption().equals("RT")) { 
	cuenta = "Account";	
} else if (userPO.getOption().equals("SV")) { 
	cuenta = "Account";
} 

if (currClient != null) {
  client = currClient.getE01CUSCUN();
}
%>
<SCRIPT language="JavaScript">

function enterAction(code,numc,id,prod,card) {
	
	var form = top.opener.document.forms[0];
	setField(form[top.opener.fieldName], code);
	setField(form[top.opener.fieldProduct], prod);
	setField(form[top.opener.fieldAux1], card);
	
	selectField(form[top.opener.fieldName]); 
	top.close();
 }

function typeClick(value, row){
   
  DIVNAME.style.pixelTop=TBHELP.offsetTop + TBHELP.rows[row].cells[2].offsetTop - 3;
  DIVNAME.style.pixelLeft=TBHELP.offsetLeft + TBHELP.rows[row].cells[2].offsetLeft;
  document.forms[0].NameSearch.value="";
  document.forms[0].NameSearch.focus();
}

function justifyRight(c,l) {
	var fc = "";
	for (var i = 0; i < (l - c.length); i++){
	  	fc += "0";
	}
	return (fc + c);
}
 
function enter(firsTime){
 var AppCode = top.top.opener.AppCode;
 var Bank = top.top.opener.Bank;
 var Selection = top.top.opener.Selection;
 var Client = "<%= client %>";
 var NameSearch = document.forms[0].NameSearch.value;
 var FromRecord = 0;
 var Type ="S";
 var Account = "";
 var OldAccount = ""; 
 var Status = document.forms[0].shrSTATUS.value;
	if (NameSearch.length < 1){
	  NameSearch=".";
	}	
	for(var i = 0; i < document.forms[0].Type.length; i++)
	{
		if (document.forms[0].Type[i].checked)
			Type = document.forms[0].Type[i].value;
	}
	
	if (top.top.opener.Client != null && firsTime) { //help by client, to CD and Loans
		Client= top.top.opener.Client;
		NameSearch=".";
	} else if (firsTime) {
	   type ="S";
	}
	
	if (Type == "N" && !firsTime) {
		Client = NameSearch;
		NameSearch=".";
	}
	if (Type == "A") { //Account Search
	    Account = NameSearch;
	    NameSearch="";
	} 
	if (Type == "O") { //Old Account Search
	    OldAccount = NameSearch;
	    NameSearch="";
	} 	
	parent.results.window.location.href="<%=request.getContextPath()%>/pages/e/MISC_search_wait.jsp?URL='<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0005?NameSearch=" + NameSearch + "@FromRecord=" + FromRecord + "@shrBank=" + Bank + "@shrAppCode=" +  AppCode + "@shrSelect=" + Type + "@shrClient=" + Client + "@shrAcc=" + Account + "@shrOldAcc=" + OldAccount + "@shrSTATUS=" + Status + "'";	
 }
</SCRIPT>

</HEAD>
<BODY>
<FORM Action="javascript:enter(document.forms[0].NameSearch.value)">
	
  <div id=DIVNAME style="position:absolute; left:25px; top:-50px;">
     <input type="text" name="NameSearch"  size=14 maxlength="20">
     &nbsp;&nbsp;<img src="<%=request.getContextPath()%>/images/search1.gif" style="cursor : hand;" onClick="enter(false)"> 
  </div>
  
  <CENTER>  
	   <table  id="TBHELP" align="center" width="360" border="0" cellspacing="0" cellpadding="0">
		<tr>
		  <td nowrap width="80">Search by :</td>
		  <td nowrap width="192">
		    <input type="radio" name="Type" value="N" onclick="typeClick('N',0)" checked>Client / Portfolio Number
		  </td>		
		  <td nowrap width="92">
     	  </td>
		</tr>
		<tr>
		  <td nowrap ></td>
		  <td nowrap width="192">
		  	<input type="radio" name="Type" value="I" onclick="typeClick('I',1)">Identification Number
		  </td>
		  <td nowrap width="92"></td>
		</tr>
		<tr>
		  <td nowrap ></td>
		  <td nowrap width="192">
		  	<input type="radio" name="Type" value="S" onclick="typeClick('S',2)">Short Name
		  </td>
		  <td nowrap width="92"></td>
		</tr>
		<tr>
		  <td nowrap ></td>
		  <td nowrap width="192">
		  	<input type="radio" name="Type" value="W" onclick="typeClick('W',3)">Word
		  </td>
		  <td nowrap width="92"></td>
		</tr>
	    <tr>
		  <td nowrap></td>
		  <td nowrap width="192"><input type="radio" name="Type" value="A" onclick="typeClick('A',4)"><%=cuenta%> Number</td>
		  <td nowrap width="92">
		  </td>
		</tr>
	    <tr>
		  <td nowrap></td>
		  <td nowrap width="192"><input type="radio" name="Type" value="O" onclick="typeClick('O',5)">Old Account Number</td>
		  <td nowrap width="92">
		  </td>
		</tr>	
	    <tr>
		  <td nowrap></td>
		  <td nowrap width="192"><div align="right"> Account Status :</div>
		  </td>
		  <td nowrap width="92">
              <select name="shrSTATUS">
                <option value="A" >Active</option>
                <option value="C" >Closed</option>
				<option value=" " >All</option>
              </select>
		  </td>
		</tr>
		 	
 	</table>
 </CENTER>	
	
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
     enter(true);
     
</SCRIPT>

</FORM>
</BODY>
</HTML>
