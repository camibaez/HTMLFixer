<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Bank Control Parameters</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>
                                                  
<jsp:useBean id="iban" class="datapro.eibs.beans.ESD050001Message" 	scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" 	scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" 	scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage"	scope="session" />

<SCRIPT Language="Javascript">

function checkDeletion() {
  if (document.forms[0].H01FLGWK1.checked == true) { 
  	  document.forms[0].H01FLGWK1.value = 'Y';
  } else {
 	  document.forms[0].H01FLGWK1.value = ''; 	
  }
}  		

function CheckDlt(){	
	if (document.forms[0].H01FLGWK1.value == "Y") {
		if(confirm("Are you sure you want to delete this record?")) {
			document.forms[0].H01FLGWK1.value = 'Y';
			document.forms[0].submit();			
		}
	} else {
		document.forms[0].H01FLGWK1.value = '';
		document.forms[0].submit();
	}
}
</SCRIPT>


</head>

<body bgcolor="#FFFFFF">

<%if (!error.getERRNUM().equals("0")) {
	error.setERRNUM("0");
	out.println("<SCRIPT Language=\"Javascript\">");
	out.println("       showErrors()");
	out.println("</SCRIPT>");
	}
 
%>

<h3 align="center">IBAN Control Parameters Maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="IBAN_parameter_maint, ESD0500"></h3>
<hr size="4">
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0500">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="300"> 
 
<h4>Basic Information</h4>
<div align="left">
<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%"border="0">
	<tr id="trdark">
		<td nowrap width="25%">
			<div align="right">Bank Code :</div>
		</td>
		<td nowrap width="20%">
			<input type="text" name="E01IBNBNK" size="3" readonly maxlength="2" value="<%=iban.getE01IBNBNK().trim()%>">
	  	</td>
	</tr>
	<tr id="trclear">
		<td nowrap width="25%">
		<div align="right">Length :</div>
		</td>
		<td nowrap width="20%"><input type="text" name="E01IBNLEN" size="4" maxlength="3" value="<%=iban.getE01IBNLEN().trim()%>" onKeyPress="enterInteger()">
	   </td>
	</tr>	
	<tr id="trdark">
		<td nowrap width="25%">
		<div align="right">Check Digits NIB :</div>
		</td>
		<td nowrap width="20%">
             <input type="radio" name="E01IBNLV2" value="1"  <%if (iban.getE01IBNLV2().equals("1")) out.print("checked"); %>>
              Yes
             <input type="radio" name="E01IBNLV2" value="0"  <%if (iban.getE01IBNLV2().equals("0")) out.print("checked"); %>>
              No		
		</td>
	</tr>
	<tr id="trclear">
		<td nowrap width="25%">
		    <div align="right">ISO Country Code :</div>
		</td>
		<td nowrap width="20%"><input type="text" name="E01IBNCTR" size="4" maxlength="3" value="<%=iban.getE01IBNCTR().trim()%>">
		   &nbsp;</td>	
	</tr>	
	<tr id="trdark">
		<td nowrap width="25%">
		    <div align="right">Transit Number :</div>
		</td>
		<td nowrap width="20%">
		<INPUT type="text" name="E01IBNTRN" size="16" maxlength="15" value="<%=iban.getE01IBNTRN().trim()%>">(Bank code)
		</td>	
	</tr>		
	<tr id="trclear">
		<td nowrap width="30%">
			<div align="right">IBAN Structure :</div>
		</td>
        <td nowrap width="25%">
			<input type="text" name="E01IBNLV1" size="2" maxlength="1" value="<%=iban.getE01IBNLV1().trim()%>"  onKeyPress="enterInteger()"> (Sub-Groups for Paper format)
        </td>
	</tr>			
	<tr id="trdark">
		<td colspan="2">
		</td>
	</tr>
	<tr id="trclear">
		<td nowrap width="30%">
			<div align="right">Mark for Deletion :</div>
		</td>
		<td nowrap width="25%">
	     <div align="left">
         <input type="checkbox" name="H01FLGWK1" value="" onclick="checkDeletion();"></div>
        </td>
	</tr>
</table>

<h4></h4><h4></h4><div align="center"><input id="EIBSBTN" type=button name="Submit"
	value="Submit" onclick="CheckDlt();"></div>
</form>
</body>
</html>

