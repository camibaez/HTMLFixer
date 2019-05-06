<HTML>
<HEAD>
<TITLE>
Customer List
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</HEAD>

<%@page import="datapro.eibs.beans.JBList"%>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<script language="javascript">
  function setMsg(row, app, cun, msg, prc) {

		document.forms[0].appCode.value = app;
		document.forms[0].msgCode.value = msg;
		document.forms[0].prcCode.value = prc;
		document.forms[0].NUMREF.value = cun;
		parent.msgText.window.location.href="<%=request.getContextPath()%>/pages/e/ESS0090_message_text.jsp?row=" + row;

  }
</script>

<BODY >

<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESS0090" target="main">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
<INPUT TYPE=HIDDEN NAME="opt" VALUE="1">
<INPUT TYPE=HIDDEN NAME="appCode" VALUE="">
<INPUT TYPE=HIDDEN NAME="msgCode" VALUE="">
<INPUT TYPE=HIDDEN NAME="prcCode" VALUE="">
<INPUT TYPE=HIDDEN NAME="reason" VALUE="">
<INPUT TYPE=HIDDEN NAME="NUMREF" VALUE="">

<%
	JBList msgList = (JBList)request.getSession(false).getAttribute("msgList");
	if ( msgList.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
        <div align="center">
        		<b>
        				There is no match for your search criteria
        		</b>
        	</div>
      </TD></TR>
   		</TABLE>
<%   		
	} else {
%>

  <TABLE class="tableinfo">
    <TR id=trdark> 
      <TH ALIGN=CENTER rowspan="2"></TH>
      <TH ALIGN=CENTER colspan="2">Refered to</TH>
      <TH ALIGN=CENTER colspan="3">Originated</TH>
    </TR>
    <TR id=trdark> 
      <TH ALIGN=CENTER>Code</TH>
      <TH ALIGN=CENTER>Account/REF</TH>
      <TH ALIGN=CENTER>By</TH>
      <TH ALIGN=CENTER>Date</TH>
      <TH ALIGN=CENTER>Hour</TH>
    </TR>
    <%
                msgList.initRow();
                while (msgList.getNextRow()) {
                    		out.println(msgList.getRecord());
                }
    %> 
  </TABLE>
  <script language="javascript">
		// document.forms[0].ACCNUM[0].checked = true;
  	try {
		document.forms[0].ACCNUM[0].click();
	} catch (exception) {
		document.forms[0].ACCNUM.click();
	}
  </script>

<%
  }
%>

</FORM>

</BODY>
</HTML>
