<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Installation Control Parameters</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id="bankOld" class="datapro.eibs.beans.ESD000503Message" 	scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" 	scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" 	scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage"	scope="session" />

</head>

<body bgcolor="#FFFFFF">

<%if (!error.getERRNUM().equals("0")) {
	error.setERRNUM("0");
	out.println("<SCRIPT Language=\"Javascript\">");
	out.println("       showErrors()");
	out.println("</SCRIPT>");
	}

%>

<h3 align="center">Installation Control Parameters Maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="bank_param_maint, ESD0005"></h3>
<hr size="4">
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0005A">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="400">
  <table class="tableinfo" >
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="16%" >
              <div align="right"><b>Bank Code :</b></div>
            </td>
            <td nowrap width="20%" >
              <div align="left">
					<input type="text" name="E03MSGBNK" size="3" readonly maxlength="2" value="<%=bankOld.getE03MSGBNK().trim()%>">            </td>
            <td nowrap width="16%" >
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" >
              <div align="left">
                <input type="text" name="E03MSGNME" size="36" readonly maxlength="35" value="<%=bankOld.getE03MSGNME().trim()%>">
              </div>
            </td>
          </tr>
         </table>
      </td>
    </tr>
  </table>
<h4></h4>
<div align="left">
<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%"border="0">
	<tr id="trdark">
		<td nowrap width="25%">
		<div align="right">Expiration Date :</div>
		</td>
		<td nowrap width="75%">
          <input type="text" name="E03MSGEX1" size="2" maxlength="2" value="<%= bankOld.getE03MSGEX1().trim()%>" onkeypress="enterInteger()">
          <input type="text" name="E03MSGEX2" size="2" maxlength="2" value="<%= bankOld.getE03MSGEX2().trim()%>" onkeypress="enterInteger()">
          <input type="text" name="E03MSGEX3" size="2" maxlength="2" value="<%= bankOld.getE03MSGEX3().trim()%>" onkeypress="enterInteger()">
          <a href="javascript:DatePicker(document.forms[0].E03MSGEX1,document.forms[0].E03MSGEX2,document.forms[0].E03MSGEX3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="Help" border="0" ></a>
	   </td>
	</tr>
	<tr id="trclear">
		<td nowrap width="25%" valign="top">
			<div align="right">English Message :</div>
		</td>
		<td nowrap width="75%">
 			<input type="text" name="E03MSGONE" size="51" maxlength="50" value="<%=bankOld.getE03MSGONE().trim()%>"><br></br>
 			<input type="text" name="E03MSGTWO" size="51" maxlength="50" value="<%=bankOld.getE03MSGTWO().trim()%>"><br></br>
 			<input type="text" name="E03MSGTHR" size="51" maxlength="50" value="<%=bankOld.getE03MSGTHR().trim()%>">
 	   </td>
	</tr>
	<tr id="trdark">
		<td nowrap width="25%" valign="top">
		<div align="right">Spanish Message :</div>
		</td>
		<td nowrap width="75%">
 			<input type="text" name="E03MSGFOU" size="51" maxlength="50" value="<%=bankOld.getE03MSGFOU().trim()%>"><br></br>
 			<input type="text" name="E03MSGFIV" size="51" maxlength="50" value="<%=bankOld.getE03MSGFIV().trim()%>"><br></br>
 			<input type="text" name="E03MSGSIX" size="51" maxlength="50" value="<%=bankOld.getE03MSGSIX().trim()%>">
 	   </td>
	</tr>
</table>
<p>
<div align="center"><input id="EIBSBTN" type=submit name="Submit"
	value="Submit"></div>
</p>
</form>
</body>
</html>

