<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK HREF="<%=request.getContextPath()%>/pages/style.css" REL="stylesheet">
<TITLE>eIBS Teller Transaction LogIn</TITLE>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

	document.onmousedown = right;
	window.onmousedown = right;

   	if ( window.name != "main" ) {
			top.close(); 
 	}
 
 	function goAction() {
 		if ((document.forms[0].SCREEN.value == "100") && (document.getElementById("CODE").value == "")) {
 			document.forms[0].SCREEN.value = "300";
 		} 
 		if ((document.forms[0].SCREEN.value == "900") && (document.getElementById("SEQUENCE").value == "")) {
 			document.forms[0].SCREEN.value = "1000";
 		} 
 		if ((document.forms[0].SCREEN.value == "1700") && (document.getElementById("SEQUENCE").value == "")) {
 			document.forms[0].SCREEN.value = "1800";
 		} 
 		document.forms[0].submit();
 	}
 
</script>
 
<BODY>
<%
	String Login = userPO.getRedirect().trim();
    String Title = "TELLER TRANSACTIONS";
	if (Login.equals("900")) {
		Title = "TELLER REVERSE";
    } 
	if (Login.equals("1700")) {
		Title = "TELLER OVERRIDE";
    }
%>
<h3 align="center"><%= Title %><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="teller_login.jsp, ETLR000"></h3>
<hr size="4">
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.teller.JSETLR000">
  <INPUT TYPE="hidden" NAME="Language" VALUE="e/">
  <INPUT TYPE="hidden" NAME="SCREEN" VALUE= <%= userPO.getRedirect() %>>
  
<% 
String user = currUser.getH01USR().substring(3, 6);
if ( !error.getERRNUM().equals("0")  ) {
%> 
<table width="100%" border="0" cellspacing="2" cellpadding="2" class="tbenter" align="center">
	<tr>
    	<td width="33"><img src="<%=request.getContextPath()%>/images/warning.gif" width="32" height="32"></td>
        <td valign="bottom"> 
          <table class="tbenter" width="100%" border="1" cellspacing="0" cellpadding="2" align="center" bordercolor="#FF0033">
            <tr valign="top"> 
              <td valign="middle">
                <div align="center">
       				<font color="red"><B> <%= error.getERDS01()%> </B></font>
    			</div>
              </td>
            </tr>
          </table>
        </td>
        <td width="33"><img src="<%=request.getContextPath()%>/images/warning.gif" width="32" height="32"></td>
	</tr>
</table>
<%
error.setERRNUM("0");
}
%>
<br><br><br>

<DIV align="center">
 
<table class="tableinfo">
	<TR id="trdark">
    	<TD ALIGN="right" width="40%"> Teller ID :</TD>
        <TD ALIGN="left" width="60%"><INPUT type="text" SIZE=4 MAXLENGTH=3 NAME="UserId" value="<%= user %>" READONLY></TD>
    </TR>
	<TR id="trclear">
        <TD ALIGN=right width="40%" > Currency :</TD>
        <td align="left"  width="60%"><input type="text" id="CURRENCY" name="Currency" size="4" maxlength="3" value="">					
            <a href="javascript:GetCurrency('Currency','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0"></a> 
        </td>
 	</TR>
	<TR id=trdark>
        <TD ALIGN=right width="40%" > Password :</TD>
        <TD ALIGN="left" width="60%"><INPUT TYPE="password" id="PASSWORD" NAME="Password" SIZE="12" MAXLENGTH="10" ></TD>
 	</TR>
	<TR id="trclear">
        <TD ALIGN=right width="40%" > Transaction Code :</TD>
        <td align="left"  width="60%"><input type="text" id="CODE" name="Code" size="5" maxlength="4" value="">	
        <a href="javascript:GetTransactionCodes('Code', document.forms[0].UserId.value, document.forms[0].Currency.value, document.forms[0].Password.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0"></a> 
        </td>
 	</TR>
<%
	if (Login.equals("900") || Login.equals("1700")) {
%>
	<TR id=trdark>
        <TD ALIGN=right width="40%" > Transaction Sequence :</TD>
        <td align="left"  width="60%"><input type="text" id="SEQUENCE" name="Sequence" size="6" maxlength="5" value="">	
        </td>
 	</TR>
	<TR id="trclear">
        <td align="right" width="40%" > Transaction Status :</td>
        <td width="60%"> 
          <div align="left"> 
          <select id="STATUS" name="Status" size="1"  >
<%
	if (Login.equals("900")) {
%>
				<option value=" ">All Status</option>
				<option value="A">Process</option>
				<option value="D">Reversed</option>
<%
	} else {
%>
				<option value=" ">All Status</option>
				<option value="A">Approved</option>
				<option value="R">Rejected</option>
				<option value="P">Pending</option>
<%
	}
%>
			</select>
          </div>
        </td>
 	</TR>
</TABLE>
<%
	}
%>
     
<BR>
   
<TABLE class="tbenter" WIDTH="100%" BORDER=0>
	<TR> 
    	<TD VALIGN=middle><div align="center"><input id="EIBSBTN" type="button" name="Submit" value="Login" onclick="goAction()"></div></TD>
    </TR>
</TABLE>
		 
</DIV>

</FORM>  

<script language="JavaScript">
  	document.forms[0].Currency.focus();
  	document.forms[0].Currency.select();
  	if (document.forms[0].SCREEN.value == "900" || document.forms[0].SCREEN.value == "1700") {
  		document.forms[0].Status.value = "A";
  	}	
</script>

</BODY>
</HTML>
