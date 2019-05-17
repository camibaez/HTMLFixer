<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id="ESD008301Help" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>
<script language="JavaScript">

	builtNewMenu(client_inq_rela_opt);

	builtHPopUp();

function newInstrument(){
	  document.forms[0].SCREEN.value = 600;
      document.forms[0].opt.value = 600;
	  document.forms[0].submit();
	 }

function closeEnter(){
   	  enterACC.filters[0].apply();
      enterACC.style.visibility="hidden";
      enterACC.filters[0].Play();
}

function ShowEnterCod() {
	 var y=event.clientY + document.body.scrollTop;
     var x=event.clientX + document.body.scrollLeft;
	 cancelBub();
	 eval('enterACC.style.pixelTop=' + y);
     eval('enterACC.style.pixelLeft=' + x);
	 enterACC.filters[0].apply();
     enterACC.style.visibility="visible";
     enterACC.filters[0].Play();

}

function cancelBub(){
  event.cancelBubble = true;
}

function goAction(op) {
    document.forms[0].SCREEN.value = op;
	document.forms[0].submit();

}

document.onclick= closeEnter;
</script>

<META name="GENERATOR" content="IBM WebSphere Studio">
</head>
<body>

<h3 align="center">Customer Related Inquiry<img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" ALT="cust_realted_list.jsp, ESD0083"></h3>
<hr size="4">

<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0083">

		<input type=HIDDEN name="SCREEN" value="600">
		<input type=HIDDEN name="opt" value="600">

<table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
          <tr id="trdark">
            <td nowrap  >
              <div align="right">Customer  :</div>
            </td>
            <td nowrap  colspan=3>
              <input type="text" readonly name="E02CUN" size="10" maxlength="9" value="<%=userPO.getCusNum()%>">
            </td>
            <td nowrap >
              <div align="right">Name  :</div>
            </td>
            <td nowrap >
              <input type="text" readonly name="E02NA1" size="50" maxlength="45" value="<%=userPO.getHeader3()%>">
            </td>

          </tr>
</TABLE>
<BR>


<div id="enterACC" style="position:absolute; visibility:hidden; left:25px; top:-50px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)" onclick="cancelBub()">
<TABLE id=tbhelp style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-color: #0b23b5; border-style: solid solid solid solid; filter: progid : DXImageTransform . Microsoft . dropshadow(OffX=3, OffY=3, Color='gray', Positive='true')">
	<tr id="trdark">
		<td align=CENTER width="18%">
		<div align="right">Customer related :</div>
		</td>
		<td align=CENTER width="34%">
		<div align="left">
			<input type="text" name="E02CUPCUR" size="9" maxlength="9" value="">
			<a href="javascript:GetCustomerDescId('E02CUPCUR','','')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0">
			</a>
			<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0">
		</div>
		</td>

	</tr>
</TABLE>
</div>

<%if (ESD008301Help.getNoResult()) {  %>
<p>&nbsp;</p>
<p>&nbsp;</p><p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<TABLE class="tbenter" width="100%">
  <TR>
    <TD width="100%">
      <div align="center">
        <p><b>There is no match for your search criteria</b></p>

      </div>
    </TD>
  </TR>
</TABLE>
<p><%} else {
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}  %>
&nbsp;</p>

<div align="center">

<BR>

<br>
<table id=cfTable class="tableinfo">
  <tr> <td NOWRAP valign="top" width="100%">
      <table id="headTable" width="100%">
        <tr id="trdark">
          <th align=CENTER nowrap width="10%">Customer</th>
          <th align=CENTER nowrap width="10%">
            <div align="center">Short Name</div>
          </th>
          <th align=CENTER nowrap width="10%">
            <div align="center">Identification</div>
          </th>
        </tr>
        <%ESD008301Help.initRow();
          boolean firstTime = true;
          String chk = "";
          while (ESD008301Help.getNextRow()) {
          		if (firstTime) {
          			firstTime = false;
          			chk = "checked";
					} else {
						chk = "";
					}
		datapro.eibs.beans.ESD008301Message msgList =(datapro.eibs.beans.ESD008301Message) ESD008301Help.getRecord();
		%>
		<tr>
		  <td NOWRAP align=CENTER width=\"10%\"><%=msgList.getE01CUPCUR()%></td>
		  <td NOWRAP align=CENTER width=\"10%\"><%=msgList.getE01CUSSHN()%></td>
		  <td NOWRAP align=CENTER width=\"10%\"><%=msgList.getE01CUSIDN()%></td>
		</tr>
		<%}%>
	 </table>
   </td> </tr>
</table>
<%}  %>
</div>
</form>
</body>
</html>
