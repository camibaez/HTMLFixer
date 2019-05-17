<html>
<head>
<title>Untitled Document</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="employment" class="datapro.eibs.beans.ESD008006Message"  scope="session" />

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   builtNewMenu(client_personal_opt);

</SCRIPT>

</head>

<%
response.setHeader("Pragma", "No-cache");
response.setDateHeader ("Expires", 0);
response.setHeader("Cache-Control", "no-cache");
%>

<body bgcolor="#FFFFFF">

 <%
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
  if ( !userPO.getPurpose().equals("NEW") ) {
    out.println("<SCRIPT> initMenu();  </SCRIPT>");
 }
%>

<h3 align="center">Financial and Employment Information<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="client_personal_employment, ESD0080"></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="6">

<table class="tableinfo" >
  <tr >
    <td wrap>
      <table cellspacing="0" cellpadding="2" width="100%" class="tbhead" bgcolor="#FFFFFF" bordercolor="#FFFFFF" bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF"  align="center">
        <tr>

            <td nowrap width="10%" align="right"> Customer : </td>
          <td nowrap width="12%" align="left">
      			<%= userPO.getHeader1()%>
          </td>
            <td nowrap width="6%" align="right">ID :
            </td>
          <td nowrap width="14%" align="left">
      			<%= userPO.getHeader2()%>
          </td>
            <td nowrap width="8%" align="right"> Name : </td>
          <td nowrap width="50%"align="left">
      			<%= userPO.getHeader3()%>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<BR>
  <h4>Financial Information</h4>
 <table class="tableinfo" >
    <tr >
      <td wrap >
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">
          <tr id="trclear">
            <td wrap width="41%">
              <div align="right">Monthly Income :</div>
            </td>
            <td wrap width="59%">
              <input type="text" name="E06CAI" size="16" maxlength="15" value="<%= employment.getE06CAI().trim()%>" onkeypress="enterDecimal()">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  >
            </td>
          </tr>
          <tr id="trdark">
            <td wrap width="41%">
              <div align="right">Other Annual Income :</div>
            </td>
            <td wrap width="59%">
              <input type="text" name="E06CAS" size="16" maxlength="15" value="<%= employment.getE06CAS().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear">
            <td wrap width="41%">
              <div align="right">Source of Income :</div>
            </td>
            <td wrap width="59%">
              <input type="text" name="E06ORI" value="<%= employment.getE06ORI().trim()%>" size="5" maxlength="4">
              <a href="javascript:GetCodeCNOFC('E06ORI','30')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <BR>
  <h4>Employment Information</h4>
  <table class="tableinfo" >
    <tr >
      <td wrap >
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">
          <tr id="trclear">
            <td wrap width="41%">
              <div align="right">Company Name:</div>
            </td>
            <td wrap width="59%">
              <input type="text" name="E06CP1" size="31" maxlength="30" value="<%= employment.getE06CP1().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td wrap width="41%">
              <div align="right">Title/Position :</div>
            </td>
            <td wrap width="59%">
              <input type="text" name="E06CP3" size="16" maxlength="15" value="<%= employment.getE06CP3().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td wrap width="41%">
              <div align="right">Years of Employment:</div>
            </td>
            <td wrap width="59%">
              <input type="text" name="E06TIM" size="6" maxlength="2" value="<%= employment.getE06TIM().trim()%>" onkeypress="enterInteger()">
            </td>
          </tr>
          <tr id="trdark">
            <td wrap width="41%">
              <div align="right">Type of Business:</div>
            </td>
            <td wrap width="59%">
				<input type="text" name="E06FC1" size="6" maxlength="4" value="<%= employment.getE06FC1().trim()%>">
				<a href="javascript:GetCodeCNOFC('E06FC1','12')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <BR>
  <h4>Employment Address</h4>
  <table class="tableinfo" >
  	<tr id="trdark">
		<td wrap width="41%">
			<div align="right">Company Address :</div>
		</td>
		<td wrap width="59%">
			<input type="text" name="E06CP2" size="35" maxlength="30" value="<%= employment.getE06CP2().trim()%>">
		</td>
  	</tr>
  	<tr id="trclear">
		<td wrap width="41%">
			<div align="right">City :</div>
		</td>
		<td wrap width="59%">
			<input type="text" name="E06CTY" size="35" maxlength="30" value="<%= employment.getE06CTY().trim()%>">
		</td>
  	</tr>
  	<tr id="trdark">
		<td wrap width="41%">
			<div align="right">State :</div>
		</td>
		<td wrap width="59%">
			<input type="text" name="E06STE" size="4" maxlength="4" value="<%= employment.getE06STE().trim()%>">
			<a href="javascript:GetCodeCNOFC('E06STE','27')">
			<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
		</td>
  	</tr>
  	<tr id="trclear">
		<td wrap width="41%">
			<div align="right">Country :</div>
		</td>
		<td wrap width="59%">
			<input type="text" name="E06CTR" size="25" maxlength="20" value="<%= employment.getE06CTR().trim()%>">
		</td>
  	</tr>
  	<tr id="trdark">
		<td wrap width="41%">
			<div align="right">POBox :</div>
		</td>
		<td wrap width="59%">
			<input type="text" name="E06POB" size="12" maxlength="10" value="<%= employment.getE06POB().trim()%>">
		</td>
  	</tr>
  	<tr id="trclear">
		<td wrap width="41%">
			<div align="right">Phone/Extension :</div>
		</td>
		<td wrap width="59%">
			<input type="text" name="E06PHN" size="13" maxlength="11" value="<%= employment.getE06PHN().trim()%>">
			<input type="text" name="E06FAX" size="6" maxlength="5" value="<%= employment.getE06FAX().trim()%>">
		</td>
  	</tr>
  	<tr id="trdark">
		<td wrap width="41%">
			<div align="right">Web Page :</div>
		</td>
		<td wrap width="59%">
			<input type="text" name="E06WEB" size="45" maxlength="40" value="<%= employment.getE06WEB().trim()%>">
		</td>
  	</tr>

  </table>
  
  <p align="center">
    <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </p>
</form>
</body>
</html>