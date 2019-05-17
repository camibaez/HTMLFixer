<HTML>
<HEAD>
<TITLE>Instrucciones Especiales</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<LINK Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "lcInst" class= "datapro.eibs.beans.ESD000005Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />


<SCRIPT language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT LANGUAGE="javascript">

	builtNewMenu(lc_apr_cc_maint);
	initMenu();
   
</SCRIPT>

<%if (!error.getERRNUM().equals("0")) {
	error.setERRNUM("0");
	out.println("<SCRIPT Language=\"Javascript\">");
	out.println("       showErrors()");
	out.println("</SCRIPT>");
}
%>

</HEAD>

<BODY bgcolor="#FFFFFF">
<H3 align="center">Letter of Credit Special Instructions<IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="ELC0525_lc_special_inst_m.jsp"></H3>
<HR size="4">

<BR><BR>

    <table class="tableinfo" cellspacing="0" cellpadding="4" width="100%" border="0">
      <TR id="trdark">
        <TD nowrap align="right" width="10%"><B> Product:</B></TD>
        <TD nowrap align="left" width="20%"><INPUT type="text" name="E03LCDPRO" size="5" maxlength="4" value="<%= userPO.getProdCode() %>" readonly></TD>
        <TD nowrap align="right" width="10%"><B>Bank:</B></TD>
        <TD nowrap align="left" width="20%"><INPUT type="text" readonly name="E03LCDBNK" size="3" maxlength="2" value="<%= userPO.getBank()  %>"></TD>
        <TD nowrap width="25%" align="right"><B>Letter of Credit ID:</B></TD>
        <TD nowrap align="left" width="15%"><INPUT type="text" name="E05ACC" size="14" maxlength="12" value="<%= lcInst.getE05ACC().trim()%>" readonly></TD>
      </TR>
    </TABLE>
 <BR>
  <TABLE class="tableinfo">
    <TR  > 
      <TD> 
        <P align="center"> 
          <INPUT name="E15DSC" type="text" value="<%= lcInst.getE15DSC().trim()%>" size="80" maxlength="80" readonly="readonly"><BR>
          <INPUT name="E25DSC" type="text" value="<%= lcInst.getE25DSC().trim()%>" size="80" maxlength="80" readonly="readonly"><BR>
          <INPUT name="E35DSC" type="text" value="<%= lcInst.getE35DSC().trim()%>" size="80" maxlength="80" readonly="readonly"><BR>
          <INPUT name="E45DSC" type="text" value="<%= lcInst.getE45DSC().trim()%>" size="80" maxlength="80" readonly="readonly"><BR>
          <INPUT name="E55DSC" type="text" value="<%= lcInst.getE55DSC().trim()%>" size="80" maxlength="80" readonly="readonly"><BR>
          <INPUT name="E65DSC" type="text" value="<%= lcInst.getE65DSC().trim()%>" size="80" maxlength="80" readonly="readonly"><BR>
          <INPUT name="E75DSC" type="text" value="<%= lcInst.getE75DSC().trim()%>" size="80" maxlength="80" readonly="readonly"><BR>
          <INPUT name="E85DSC" type="text" value="<%= lcInst.getE85DSC().trim()%>" size="80" maxlength="80" readonly="readonly"><BR>
          <INPUT name="E95DSC" type="text" value="<%= lcInst.getE95DSC().trim()%>" size="80" maxlength="80" readonly="readonly"><BR>
          <INPUT name="E05DSC" type="text" value="<%= lcInst.getE05DSC().trim()%>" size="80" maxlength="80" readonly="readonly"><BR>
          <INPUT name="EA5DSC" type="text" value="<%= lcInst.getEA5DSC().trim()%>" size="80" maxlength="80" readonly="readonly"><BR>
          <INPUT name="EB5DSC" type="text" value="<%= lcInst.getEB5DSC().trim()%>" size="80" maxlength="80" readonly="readonly"><BR>
          <INPUT name="EC5DSC" type="text" value="<%= lcInst.getEC5DSC().trim()%>" size="80" maxlength="80" readonly="readonly"><BR>
          <INPUT name="ED5DSC" type="text" value="<%= lcInst.getED5DSC().trim()%>" size="80" maxlength="80" readonly="readonly"><BR>
          <INPUT name="EE5DSC" type="text" value="<%= lcInst.getEE5DSC().trim()%>" size="80" maxlength="80" readonly="readonly"><BR>
          <INPUT name="EF5DSC" type="text" value="<%= lcInst.getEF5DSC().trim()%>" size="80" maxlength="80" readonly="readonly"><BR>
          <INPUT name="EG5DSC" type="text" value="<%= lcInst.getEG5DSC().trim()%>" size="80" maxlength="80" readonly="readonly"><BR>
          <INPUT name="EH5DSC" type="text" value="<%= lcInst.getEH5DSC().trim()%>" size="80" maxlength="80" readonly="readonly"><BR>
          <INPUT name="EI5DSC" type="text" value="<%= lcInst.getEI5DSC().trim()%>" size="80" maxlength="80" readonly="readonly"><BR>
          <INPUT name="EJ5DSC" type="text" value="<%= lcInst.getEJ5DSC().trim()%>" size="80" maxlength="80" readonly="readonly"><BR>
        </P>
      </TD>
    </TR> 
  </TABLE>
</BODY>
</HTML>