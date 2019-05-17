<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<TITLE>Customer's Generated Documents Inquiry</TITLE>
<%@ page import = "java.io.*,java.net.*,datapro.eibs.sockets.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*" %>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="JavaScript">

function setDates(DTFMT, MM, DD, YY) {
	if (DTFMT == 'MDY') {
		document.forms[0].E01RWDFD1.value = 01;
		document.forms[0].E01RWDFD2.value = 01;
		document.forms[0].E01RWDFD3.value = YY;
		document.forms[0].E01RWDTD1.value = MM;
		document.forms[0].E01RWDTD2.value = DD;
		document.forms[0].E01RWDTD3.value = YY;
      } else if (DTFMT == 'DMY') {
			document.forms[0].E01RWDFD1.value = 01;	
			document.forms[0].E01RWDFD2.value = 01;
			document.forms[0].E01RWDFD3.value = YY;
			document.forms[0].E01RWDTD1.value = DD;
			document.forms[0].E01RWDTD2.value = MM	;
			document.forms[0].E01RWDTD3.value = YY;
             } else if (DTFMT == 'YMD') {
					document.forms[0].E01RWDFD1.value = YY;	
					document.forms[0].E01RWDFD2.value = 01;
					document.forms[0].E01RWDFD3.value = 01;
					document.forms[0].E01RWDTD1.value = YY;
					document.forms[0].E01RWDTD2.value = MM	;
					document.forms[0].E01RWDTD3.value = DD;
	             }
}


function enter(){
	document.forms[0].submit();
}
	 
</script>

<META name="GENERATOR" content="IBM WebSphere Studio">
</head>
<body>
	<h3 align="center">Customer's Generated Documents<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
  		name="EIBS_GIF" ALT="cust_doc_inq_search.jsp,EWD0902"> 
	</h3>
 
 <% 
 String runMonth;
 String runDay;
 String runYear;
 String formatDate = "MDY"; //default
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 } 
%>
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.general.JSEWD0902" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  <INPUT TYPE=HIDDEN NAME="Pos" VALUE="0">
  
  <table id="tbenter" align="center" style="width:85%" border="1">
    <tr> 
      <td> 
        <table id="tbenter" width="100%" border="0" cellspacing="1" cellpadding="0">
          <tr> 
            <td valign="middle" align="center" colspan="3" height=33> <b>SEARCH CRITERIA</b>
            </td>
          </tr>
          <tr> 
            <td>&nbsp;</td>
            <td nowrap width="30%"> 
              <div align="right">Customer / Portfolio :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E01RWDCUN" size=10 maxlength="9" onKeypress="enterInteger()">
            	<A href="javascript:GetCustomerDescId('E01RWDCUN','','')">
            	<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="..." align="bottom" border="0">
			</A>
			</td>
          </tr>
          <tr>
				<td colspan="3" align="center">&nbsp;
				<B> OR</B>&nbsp;
				</td>
			</tr>
          <tr>
            <td width="10%" align="center">&nbsp;</td>
            <td nowrap align="right" width="30%">
              <div align="right"> </div>
            Account Number :</td>
            <td nowrap width="60%">
            <INPUT type="text" name="E01RWDACC" size="12" maxlength="9" onkeypress="enterInteger()">
              <A href="javascript:GetAccount('E01RWDACC','','','')">
              <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="bottom" border="0">
              </A>(Blanks = ALL)</td>
          </tr>
			<TR>
				<TD width="10%" align="center"></TD>
				<TD nowrap align="right" width="30%"><BR>
				</TD>
				<TD nowrap width="60%"></TD>
				<TD></TD>
			</TR>
			<TR>
				<TD width="10%" align="center"></TD>
				<TD nowrap align="right" width="30%"><BR>
				</TD>
				<TD nowrap width="60%"></TD>
				<TD></TD>
			</TR>
			<TR>
				<TD width="10%" align="center"></TD>
				<TD nowrap align="right" width="30%"><BR>
				</TD>
				<TD nowrap width="60%"></TD>
				<TD></TD>
			</TR>
			<tr>
				<td align="center" colspan="3">&nbsp;<B>FILTERS</B></td>
			</tr>
          <tr> 
            <td width="10%" align="center">&nbsp;</td>
            <td nowrap width="30%"> 
              <div align="right">Report :</div>
            </td>
            <td nowrap width="60%"> 
              <div align="left"> </div>
                <INPUT type="text" name="E01RWDRPN" size="11" maxlength="10" >
              		<A href="javascript:GetReport('','','')">
              	<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="..." align="bottom" border="0">
              </A>(Blanks = ALL)</td>
			</tr>
			<TR>
				<TD width="10%" align="center"></TD>
				<TD nowrap width="30%"></TD>
				<TD nowrap width="60%"><BR>
				</TD>
				<TD></TD>
			</TR>
			<TR>
				<TD width="10%" align="center">&nbsp;</TD>
				<TD nowrap width="30%">
				<DIV align="right"> Date From:</DIV>
				</TD>
				<TD nowrap width="60%">
					<INPUT type="text" size="2" maxlength="2" name="E01RWDFD1" onkeypress="enterInteger()">
					<INPUT type="text" size="2" maxlength="2" name="E01RWDFD2" onkeypress="enterInteger()">
					<INPUT type="text" size="2" maxlength="2" name="E01RWDFD3" onkeypress="enterInteger()">
					<A href="javascript:DatePicker(document.forms[0].E01RWDFD1,document.forms[0].E01RWDFD2,document.forms[0].E01RWDFD3)">
						<IMG src="<%=request.getContextPath()%>/images/calendar.gif" alt="..." align="middle" border="0"></A> Date To: 
					<INPUT type="text" size="2" maxlength="2" name="E01RWDTD1" onkeypress="enterInteger()"> 
					<INPUT type="text" size="2" maxlength="2" name="E01RWDTD2" onkeypress="enterInteger()">
					<INPUT type="text" size="2" maxlength="2" name="E01RWDTD3" onkeypress="enterInteger()"> 
					<A href="javascript:DatePicker(document.forms[0].E01RWDTD1,document.forms[0].E01RWDTD2,document.forms[0].E01RWDTD3)">
						<IMG src="<%=request.getContextPath()%>/images/calendar.gif" alt="..." align="middle" border="0"></A>
				</TD>
			</TR>
<% 
  	ESS0030DSMessage msgUser = null;
	session = (HttpSession)request.getSession(false);
	if (session != null) {
        msgUser = (datapro.eibs.beans.ESS0030DSMessage)session.getValue("currUser");
        formatDate = msgUser.getE01DTF();
        runMonth = msgUser.getE01RDM();
        runDay = msgUser.getE01RDD();
        runYear = msgUser.getE01RDY();
		out.println("<SCRIPT Language=\"Javascript\">");
    	out.println("       setDates('" + formatDate + "','" + runMonth + "','" + runDay + "','" + runYear + "')");
    	out.println("</SCRIPT>");
    }
  %>
			<TR>
				<TD width="10%" align="center"></TD>
				<TD nowrap width="30%"></TD>
				<TD nowrap width="60%"><BR>
				</TD>
				<TD></TD>
			</TR>
			<tr> 
            <td width="10%" align="center">&nbsp;</td>
            <td nowrap align="right" width="30%">Account Type :</td>
            <td nowrap width="60%">
            <INPUT type="text" name="E01RWDTYP" size="4" maxlength="3" >
              <A href="javascript:GetCodeCNOFC('E01RWDTYP','04')">
              	<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="..." align="bottom" border="0">
              </A>(STM: Consolidated Statement)</td>
          </tr>
          <tr> 
            <td width="10%" align="center"></td>
            <td nowrap width="30%"></td>
            <td nowrap width="60%"></td>
          </tr>
          <tr> 
            <td width="10%" align="center"></td>
            <td nowrap width="30%"></td>
            <td nowrap width="60%"></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>


  <br>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="100%" align="center"> 
       		<input id="EIBSBTN" type=submit onClick="enter()" name="Submit" value="Submit">
	  </td>
      </tr>    
  </table>
          
      
</form>
</body>
</html>
