<html>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id="holMsg" class="datapro.eibs.beans.ESD011001Message"  scope="session" />
<jsp:useBean id="error"  class="datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" 	scope="session" />

<script language="JavaScript">
function enter(){
	  document.forms[0].submit();
	 }
</script>

</head>
<body>

 <% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
    }
%>
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0110" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="3">
  <h3 align="center">Control Parameters<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="bank_setup_basic_enter.jsp,ESD0005"> 
  </h3>
  <hr size="4">
<BR> 
<TABLE class="tableinfo" align="center" width="85%">
	<TBODY>
		<TR>
			<TD>
			<TABLE width="100%" border="0" cellspacing="1" cellpadding="0">
				<TBODY>
					<TR>
						<TD nowrap width="16%" align="right">Bank :</TD>
						<TD nowrap width="16%" align="left">
							<input type="text" name="E01SELBNK" size="4" maxlength="4" value="<%=holMsg.getE01SELBNK()%>" readonly></TD>
						<TD nowrap width="16%" align="right">Currency :</TD>
						<TD nowrap width="16%" align="left">
							<input type="text" name="E01SELCCY" size="3" maxlength="2" value="<%=holMsg.getE01SELCCY()%>" readonly></TD>
						<TD nowrap width="16%" align="right">Year :</TD>
						<TD nowrap width="16%" align="left">
							<input type="text" name="E01SELYEAR" size="3" maxlength="2" value="<%=(holMsg.getE01SELYEAR().trim().equals("0") ? "":holMsg.getE01SELYEAR())%>" readonly></TD>

					</TR>
				</TBODY>
			</TABLE>
			</TD>
		</TR>
	</TBODY>
</TABLE>
<BR>
<TABLE class="tableinfo" align="center" >
	<TBODY>
		<TR align="center">
			<TD>
			<TABLE width="100%" align="center" cellspacing="1" cellpadding="0">
				<tr>
				<td  align="right" valign="top" width="50%">Enter Holiday Date  :</td>
				<td  align="left" width="50%">
				<div style="height:400px; overflow-y: scroll">
					<%
					String year,month,day,yearV,monthV,dayV;
					for(int i = 1; i <= 50; i++)
					{
						year =	"E01HOLY" + ( (i<10) ? "0"+Integer.toString(i) : Integer.toString(i));
						month =	"E01HOLM" + ( (i<10) ? "0"+Integer.toString(i) : Integer.toString(i));
						day =	"E01HOLD" + ( (i<10) ? "0"+Integer.toString(i) : Integer.toString(i));
						yearV = holMsg.getField(year).getString().trim();
						monthV= holMsg.getField(month).getString().trim();
						dayV =	holMsg.getField(day).getString().trim();
						if (yearV.equals("0")) yearV = "";
						else if (Integer.parseInt(yearV) < 10) yearV = "0" + yearV;
						if (dayV.equals("0")) dayV = "";
						if (monthV.equals("0")) monthV = "";
						%>
						
						<input size="2" maxlength="2" name="<%=month%>" value="<%=monthV%>" onkeypress="enterInteger()">
						<input size="2" maxlength="2" name="<%=day%>"   value="<%=dayV%>" onkeypress="enterInteger()">
						<input size="2" maxlength="2" name="<%=year%>"  value="<%=yearV%>" onkeypress="enterInteger()"> <A
						href="javascript:DatePicker(document.forms[0].<%=month%>,document.forms[0].<%=day%>,document.forms[0].<%=year%>)"><IMG
						src="<%=request.getContextPath()%>/images/calendar.gif" alt="help"
						align="middle" border="0"></A><br>
					<%}%>
				</div>
				</td>
				</TR>
			</TABLE>
			</TD>
		</TR>
	</TBODY>
</TABLE>

<BR>

  
  <p align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </p>
      
</form>
</body>
</html>
