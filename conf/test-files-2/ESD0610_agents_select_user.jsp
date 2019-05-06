<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Sales Agents - User Access</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<SCRIPT Language="javascript">

function CheckUSR(){
	if ( document.forms[0].E01AGUUSR.value.length < 1) {
  		alert("A valid user id must be entered");
  		document.forms[0].E01AGUUSR.value='';
  		document.forms[0].E01AGUUSR.focus();
	}
	else {
  		document.forms[0].submit();
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

<h3 align="center">Sales Agents - User Access<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" alt="agents_select_user, ESD0610"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0610">
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  </p>
  <br>
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap align="right" valign="middle" width="45%"> 
              <div align="right">User :</div>
            </td>
            <td nowrap align="left" valign="middle">
                <INPUT type="text" name="E01AGUUSR" size="11" maxlength="10" >
        		<INPUT type="text" name="E01AGUNME" size= 35 maxlength=35 readonly>
        		<a href="javascript:GetUser('E01AGUUSR','E01AGUNME',document.forms[0].E01AGUUSR.value)">
        		<img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0">
        		</a> 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p align="center"> 
   <input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="CheckUSR()">
  </p>
  
<script language="JavaScript">
  document.forms[0].E01AGUUSR.focus();
  document.forms[0].E01AGUUSR.select();
</script>

</form>
</body>
</html>
