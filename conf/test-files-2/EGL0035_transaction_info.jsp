<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META name="GENERATOR" content="IBM WebSphere Studio">
<html>
<head>
<title>Transactions</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT LANGUAGE="JavaScript" >

function enterInfo() {
<%  
     
    String option = userPO.getAccOpt();
	String readonly = ""; 
	try {
		readonly = request.getParameter("ROW").trim();
	} catch (Exception e) {
    	readonly = "";
	}
	String m = "";
	try {
		m = request.getParameter("CurrRow").trim();
	} catch (Exception e) {
		m = "";
	}
%>
 
 	var form = top.opener.document.forms[0];
 	var row = "<%= m %>";
 
 
 	if ( row != ""  ) {
   		row = "_" + row;
<%
		if (option.equals("AC")) {
%>
			form["E01WRKCKN"+ row].value = trim(document.forms[0].E01WRKCKN.value);
		 	form["E01WRKEXR"+ row].value = trim(document.forms[0].E01WRKEXR.value);
		 	form["E01WRKCUN"+ row].value = trim(document.forms[0].E01WRKCUN.value);
		 	form["E01WRKCR2"+ row].value = trim(document.forms[0].E01WRKCR2.value);
		 	form["E01WRKUN2"+ row].value = trim(document.forms[0].E01WRKUN2.value);
		 	form["E01WRKCR3"+ row].value = trim(document.forms[0].E01WRKCR3.value);
		 	form["E01WRKUN3"+ row].value = trim(document.forms[0].E01WRKUN3.value);
<%
		}
%>
	  	form["E01WRKMD1"+ row].value = trim(document.forms[0].E01WRKMD1.value);
	  	form["E01WRKMD2"+ row].value = trim(document.forms[0].E01WRKMD2.value);
	  	form["E01WRKMD3"+ row].value = trim(document.forms[0].E01WRKMD3.value);
	  	form["E01WRKVD1"+ row].value = trim(document.forms[0].E01WRKVD1.value);
	  	form["E01WRKVD2"+ row].value = trim(document.forms[0].E01WRKVD2.value);
	  	form["E01WRKVD3"+ row].value = trim(document.forms[0].E01WRKVD3.value);
   }
   form["E01WRKTDS"+ row].value = trim(document.forms[0].E01WRKTDS.value);

  

 
	top.close();
}

function setInfo() {
	var form = top.opener.document.forms[0];
 	var row = "<%= m %>";
 	if ( row != "" ) {
		row = "_" + row;
<%
	if (option.equals("AC")) {
%>
		document.forms[0].E01WRKCKN.value=form["E01WRKCKN"+ row].value;
	 	document.forms[0].E01WRKEXR.value=form["E01WRKEXR"+ row].value;
	 	document.forms[0].E01WRKCUN.value=form["E01WRKCUN"+ row].value;
	 	document.forms[0].E01WRKCR2.value=form["E01WRKCR2"+ row].value;
	 	document.forms[0].E01WRKUN2.value=form["E01WRKUN2"+ row].value;
	 	document.forms[0].E01WRKCR3.value=form["E01WRKCR3"+ row].value;
	 	document.forms[0].E01WRKUN3.value=form["E01WRKUN3"+ row].value;
<%
	}
%>
  	document.forms[0].E01WRKMD1.value=form["E01WRKMD1"+ row].value;
  	document.forms[0].E01WRKMD2.value=form["E01WRKMD2"+ row].value;
  	document.forms[0].E01WRKMD3.value=form["E01WRKMD3"+ row].value;
 }
 document.forms[0].E01WRKTDS.value=form["E01WRKTDS"+ row].value;
 document.forms[0].E01WRKVD1.value=form["E01WRKVD1"+ row].value;
 document.forms[0].E01WRKVD2.value=form["E01WRKVD2"+ row].value;
 document.forms[0].E01WRKVD3.value=form["E01WRKVD3"+ row].value;
 
 
}
  
function checkLength(field) {
   if ( field.value.length < 300 ) {
     field.value = field.value.toUpperCase();
     return true;
	}
	else {
     return false;
	}
}

function verifyDays(){    
      if(document.forms[0].E01WRKCR2.value != "" && document.forms[0].E01WRKUN2.value == "") {
         document.forms[0].E01WRKUN2.value = "77";
      }
      if(document.forms[0].E01WRKCR3.value != "" && document.forms[0].E01WRKUN3.value == "") {
         document.forms[0].E01WRKUN3.value = "99";
      }
  }  
 </SCRIPT>
 
</head>
<body>
<form method="post">

  <h3 align="left">Information</h3>

  <table width="100%" class="tableinfo" cellpadding="2" cellspacing="2">
    <tr> 
      <td id=trdark width="14%" nowrap valign="top"> 
        <div align="right">Description : </div>
      </td>
      <td nowrap > 
        <textarea name="E01WRKTDS" cols="35" rows="10" <%= readonly %>></textarea>
      </td>
    </tr>
    <tr> 
      <td id=trdark width="14%" nowrap > 
        <div align="right">Value Date : </div>
      </td>
      <td nowrap> 
        <input type="text" name="E01WRKVD1" size="2" maxlength="2" onKeypress="enterInteger()" value="" readonly>
        <input type="text" name="E01WRKVD2" size="2" maxlength="2" onKeypress="enterInteger()" value="" readonly>
        <input type="text" name="E01WRKVD3" size="2" maxlength="2" onKeypress="enterInteger()" value="" readonly>
      </td>
    </tr>
    <% 
     if ( !(m.equals(""))) {%>
	    <tr> 
	      <td id=trdark width="14%" nowrap > 
	        <div align="right">Maturity Date : </div>
	      </td>
	      <td nowrap> 
	        <input type="text" name="E01WRKMD1" size="2" maxlength="2" onKeypress="enterInteger()" value="" <%= readonly %>>
	        <input type="text" name="E01WRKMD2" size="2" maxlength="2" onKeypress="enterInteger()" value="" <%= readonly %>>
	        <input type="text" name="E01WRKMD3" size="2" maxlength="2" onKeypress="enterInteger()" value="" <%= readonly %>>
	        <% if (readonly.equals("") ){%>
	        <a href="javascript:DatePicker(document.forms[0].E01WRKMD1,document.forms[0].E01WRKMD2,document.forms[0].E01WRKMD3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></a> 
	        <% } %>
	      </td>
	    </tr>
    <%}%>
    <%     
     if ( !(m.equals(""))  && (option.equals("AC"))   ){
    %>
    <tr> 
      <td id=trdark width="14%" nowrap > 
        <div align="right">Check Number : </div>
      </td>
      <td nowrap> 
        <input type="text" name="E01WRKCKN" size="11" maxlength="10" onKeypress="enterInteger()" value="" <%= readonly %>>
      </td>
    </tr>    
    
    <tr> 
      <td id=trdark width="14%" nowrap > 
        <div align="right">Exchange Rate : </div>
      </td>
      <td nowrap> 
        <input type="text" name="E01WRKEXR" size="11" maxlength="10" onKeypress="enterSignDecimal()" value="" <%= readonly %>>
      </td>
    </tr>
    <tr> 
      <td id=trdark width="14%" nowrap > 
        <div align="right">Local Check :</div>
      </td>
      <td nowrap> 
        <input type="text" name="E01WRKCR2" size="17" maxlength="15" onKeyPress="enterSignDecimal()" value="" <%= readonly %>>
        Days / Uncol :
        <input type="text" name="E01WRKUN2" size="3" maxlength="2" onKeyPress="enterInteger()" value="77" <%= readonly %>>
      </td>
    </tr>
    <tr> 
      <td id=trdark width="14%" nowrap > 
        <div align="right">No Local Check :</div>
      </td>
      <td nowrap>
        <input type="text" name="E01WRKCR3" size="17" maxlength="15" onKeyPress="enterSignDecimal()" value="" <%= readonly %>>
        Days / Uncol : 
        <input type="text" name="E01WRKUN3" size="3" maxlength="2" onKeyPress="enterInteger()" value="99" <%= readonly %>>
      </td>
    </tr>
    <tr> 
      <td id=trdark width="14%" nowrap > 
        <div align="right">Customer / <BR>
		Portfolio Number : </div>
      </td>
      <td nowrap> 
        <input type="text" name="E01WRKCUN" size="10" maxlength="9" onKeypress="enterInteger()" value="" <%= readonly %>>
        <% if (readonly.equals("") ){%>
        <a href="javascript:GetCustomerDescId('E01WRKCUN','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0" ></a> 
        <% } %>
      </td>
    </tr>
    <%  } %>
    
  </table> 
  <BR>
 
  <div align="center"> 
   <input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="enterInfo()">
  </div>
 
  
</form>
  <SCRIPT type="text/javascript">
  	setInfo();
   	document.forms[0].E01WRKTDS.focus();
  </SCRIPT>
</body>
</html>			
