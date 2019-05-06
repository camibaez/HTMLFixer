<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Officers Supervisor Update</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<SCRIPT Language="javascript">

function goExit(op) {
	document.forms[0].SCREEN.value = '6';
	document.forms[0].submit();
}

function checkEnter(){
	var Supervisor = trim(document.forms[0].E01CNOSUP.value);
	var Officer = trim(document.forms[0].E01CNORCD.value);
	if (Supervisor.length > 0){
    	document.forms[0].OPTION.value = 'SUPERVISOR';
    	return true;
	} else if (Officer.length > 0){
    	document.forms[0].OPTION.value = 'OFFICER';
    	document.forms[0].E01CNOSUP.value = Officer;
    	return true;

	} else {
	    // alert
		alert("Please enter a valid value");
		document.forms[0].E01CNOSUP.focus();
		return false;
	}
}
</SCRIPT>

</head>
<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 userPO.setPurpose("MAINTENANCE"); 
%> 

<h3 align="center"> Officers Reassignment<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" alt="cnofc_officer_select_supervisor, ESD0031"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0031" onsubmit="return(checkEnter());">
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
    <INPUT TYPE=HIDDEN NAME="OPTION" VALUE="">
  </p>
  <br>
  <TABLE class="tbenter" width="982">
    <TR>
      <TD class="EIBSBTN" width="100%">
      <div align="center"><a href="javascript:goExit()"><b>Return to<BR>Officers Maintenance</b></a></div>
      </TD>
	</TR>
 </TABLE>
 <br> 
  <table class="tableinfo">
    <tr> 
      <td nowrap>
		<table cellspacing="0" cellpadding="2" width="101%" border="0">
			<tr id="trdark">
				<td nowrap align="right" valign="middle" width="46%">
				<div align="right">Supervisor :</div>
				</td>
				<td nowrap align="left" valign="middle" width="461"><INPUT
					type="text" name="E01CNOSUP" size="4" maxlength="3"> <INPUT
					type="text" name="E01SUPDSC" size="45" maxlength="45" readonly> <A
					href="javascript:GetCodeDescCNOFC('E01CNOSUP','E01SUPDSC','45')"> <IMG
					src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ."
					align="bottom" border="0"> </A></td>
			</tr>
			<TR>
				<TD nowrap align="right" valign="middle" width="46%"><b>OR</b></TD>
				<TD nowrap align="left" valign="middle" width="461"></TD>
			</TR>
			<TR>
				<TD nowrap align="right" valign="middle" width="46%">Officer :</TD>
				<TD nowrap align="left" valign="middle" width="461"><INPUT
					type="text" name="E01CNORCD" size="4" maxlength="3"> <INPUT
					type="text" name="E01CNODSC" size="45" maxlength="45" readonly> <A
					href="javascript:GetCodeDescCNOFC('E01CNORCD','E01CNODSC', '15')">
				<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ."
					align="bottom" border="0"> </A></TD>
			</TR>
		</table>
		</td>
    </tr>
  </table>
  <p align="center"> 
   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </p>

</form>
</body>
</html>
