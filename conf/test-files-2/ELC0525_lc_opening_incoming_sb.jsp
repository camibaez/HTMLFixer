<!--	'S' = Emitida  (outgoing)  <->  'O' = Import
		'R' = Recibida (incoming)  <->  'I' = Export
-->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Letters of Credit Opening/Maintenance</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<SCRIPT language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id="msg"  class="datapro.eibs.beans.ELC040001Message" scope="session" />
<jsp:useBean id="error"  class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />

<SCRIPT LANGUAGE="javascript">

	builtNewMenu(lc_apr_standby);
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
<BODY>
<H3 align="center">Export Stand By Letter Of Credit Approval Inquiry [Basic Information]
	<IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="lc_opening_incoming_sb.jsp, ELC0525"></H3>

<HR size="4">
<FORM>

<TABLE cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
  <TR id="trdark">
    <TD align="right"><STRONG>Bank :</STRONG></TD>
    <TD><INPUT type="text" name="E01LCMBNK" readonly size="4" maxlength="2" value="<%=msg.getE01LCMBNK().trim()%>"></TD>
    <TD width="16%" align="right" nowrap><STRONG>Letter of Credit ID : </STRONG></TD>
    <TD><%if (msg.getE01LCMACC().trim().equals("999999999999"))
				{%>
        <INPUT type="text" size="12" maxlength="12" value="New" readonly>
        <INPUT name="E01LCMACC" type="hidden" value="<%=msg.getE01LCMACC().trim()%>" readonly="readonly">
        <%}
				else
				{%>
        <INPUT type="text" name="E01LCMACC" size="12" maxlength="12" value="<%=msg.getE01LCMACC().trim()%>" readonly>
        <%}%></TD>
  </TR>
  <TR>
    <TD align="right"><STRONG>Our Reference :</STRONG></TD>
    <TD><INPUT name="E01LCMORF" type="text" value="<%=msg.getE01LCMORF().trim()%>" size="20" maxlength="16" readonly="readonly"></TD>
    <TD width="16%" align="right" nowrap><STRONG>Product : </STRONG></TD>
    <TD><B>
      <INPUT type="text" name="E01LCMPRO" size="4" maxlength="4" value="<%=msg.getE01LCMPRO().trim()%>" readonly>
    </B></TD>
  </TR>
  <TR id="trdark">
    <TD align="right"><STRONG>Their Reference :</STRONG></TD>
    <TD><B>
      <INPUT name="E01LCMTRF" type="text" value="<%=msg.getE01LCMTRF().trim()%>" size="20" maxlength="16" readonly="readonly">
    </B></TD>
    <TD width="16%" align="right" nowrap><STRONG>Product Description : </STRONG></TD>
    <TD><B>
      <INPUT type="text" name="E01DSCPRO" size="40"
						maxlength="40" value="<%=msg.getE01DSCPRO().trim()%>" readonly>
    </B></TD>
  </TR>
</TABLE>
<BR>
<TABLE class="tableinfo" cellspacing="0" cellpadding="2" border="0" width="100%" align="center">
  <TR id="trdark">
    <TD colspan="2" align="center" valign="middle"><FONT size="medium"><B>Aplicant :</B></FONT></TD>
  </TR>
  <TR id="">
    <TD align="right">Customer CIF or DDA Account :</TD>
    <TD nowrap><SELECT name="E01LCMAF2" disabled>
        <OPTION value=" "
								<%if (!(msg.getE01LCMAF2().equals("C") || msg.getE01LCMAF2().equals("A"))) out.print("selected");%>
								selected></OPTION>
        <OPTION value="C" <%if (msg.getE01LCMAF2().equals("C")) out.print("selected");%>>CIF</OPTION>
        <OPTION value="A" <%if (msg.getE01LCMAF2().equals("A")) out.print("selected");%>>DDA</OPTION>
      </SELECT>
        <INPUT name="E01LCMAPA" type="text" value="<%=msg.getE01LCMAPA()%>" size="12"
							maxlength="12" readonly="readonly">
        <IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" border="0"></TD>
  </TR>
  <TR id="">
    <TD width="35%" align="right">Name :</TD>
    <TD align="left"><INPUT name="E01LCMAP1" type="text" value="<%=msg.getE01LCMAP1()%>" size="45"
					maxlength="35" readonly="readonly">    </TD>
  </TR>
  <TR id="">
    <TD align="right">Address :</TD>
    <TD align="left"><INPUT name="E01LCMAP2" type="text" value="<%=msg.getE01LCMAP2()%>" size="45"
					maxlength="35" readonly="readonly">    </TD>
  </TR>
  <TR id="">
    <TD></TD>
    <TD align="left"><INPUT name="E01LCMAP3" type="text" value="<%=msg.getE01LCMAP3()%>" size="45"
					maxlength="35" readonly="readonly">    </TD>
  </TR>
  <TR id="">
    <TD></TD>
    <TD align="left"><INPUT name="E01LCMAP4" type="text" value="<%=msg.getE01LCMAP4()%>" size="45"
					maxlength="35" readonly="readonly">    </TD>
  </TR>
  <TR id="">
    <TD align="right">State :</TD>
    <TD align="left"><INPUT name="E01LCMAP5" type="text"
							value="<%=msg.getE01LCMAP5()%>" size="4" maxlength="4" readonly="readonly">
      Zip Code :
      <INPUT
							name="E01LCMAP6" type="text"
							value="<%=msg.getE01LCMAP6()%>" size="11" maxlength="10" readonly="readonly">
      Country :
      <INPUT
							name="E01LCMAP7" type="text"
							value="<%=msg.getE01LCMAP7()%>" size="4" maxlength="4" readonly="readonly"></TD>
  </TR>
</TABLE>
<BR>
<TABLE class="tableinfo"  cellspacing="0" cellpadding="2" border="0" width="100%" align="center">
  <TR id="trdark">
    <TD colspan="2" align="center" valign="middle"><FONT size="medium"><B>Beneficiary</B></FONT></TD>
  </TR>
  <TR id="">
    <TD align="right">Customer CIF or DDA Account :</TD>
    <TD nowrap><SELECT name="E01LCMAF3" disabled>
        <OPTION value=" " <%if (!(msg.getE01LCMAF3().equals("C") || msg.getE01LCMAF3().equals("A"))) out.print("selected");%>></OPTION>
        <OPTION value="C" <%if (msg.getE01LCMAF3().equals("C")) out.print("selected");%>>CIF</OPTION>
        <OPTION value="A" <%if (msg.getE01LCMAF3().equals("A")) out.print("selected");%>>DDA</OPTION>
      </SELECT>
        <INPUT name="E01LCMBAC" type="text" value="<%=msg.getE01LCMBAC()%>" size="12" maxlength="12" readonly="readonly"></TD>
  </TR>
  <TR id="">
    <TD width="35%" align="right"> Name :</TD>
    <TD align="left"><INPUT name="E01LCMBN1" type="text" value="<%=msg.getE01LCMBN1()%>" size="45"
					maxlength="35" readonly="readonly">
        <IMG
					src="<%=request.getContextPath()%>/images/Check.gif"
					alt="campo obligatorio" border="0"></TD>
  </TR>
  <TR id="">
    <TD align="right">Address :</TD>
    <TD align="left"><INPUT name="E01LCMBN2" type="text" value="<%=msg.getE01LCMBN2()%>" size="45"
					maxlength="35" readonly="readonly">    </TD>
  </TR>
  <TR id="">
    <TD></TD>
    <TD align="left"><INPUT name="E01LCMBN3" type="text" value="<%=msg.getE01LCMBN3()%>" size="45"
					maxlength="35" readonly="readonly">    </TD>
  </TR>
  <TR id="">
    <TD></TD>
    <TD align="left"><INPUT name="E01LCMBN4" type="text" value="<%=msg.getE01LCMBN4()%>" size="45"
					maxlength="35" readonly="readonly">    </TD>
  </TR>
  <TR id="">
    <TD align="right">State : </TD>
    <TD align="left"><INPUT name="E01LCMBN5" type="text"
							value="<%=msg.getE01LCMBN5()%>" size="2" maxlength="2" readonly="readonly">
      Zip Code :
      <INPUT
							name="E01LCMBN6" type="text"
							value="<%=msg.getE01LCMBN6()%>" size="11" maxlength="10" readonly="readonly">
      Country :
      <INPUT
							name="E01LCMBN7" type="text"
							value="<%=msg.getE01LCMBN7()%>" size="4" maxlength="4" readonly="readonly">
     </TD>
  </TR>
</TABLE>
<BR>
<BR>
<TABLE class="tableinfo"  cellspacing="0" cellpadding="2" border="0" width="100%" align="center">
  <TR id="trdark">
    <TD colspan="2" align="center" valign="middle" ><FONT size="medium"><B>Advise Through Bank</B></FONT></TD>
  </TR>
  <TR id="">
    <TD align="right" nowrap="nowrap">Customer :</TD>
    <TD align="left" nowrap><INPUT name="E01LCMCBC" type="text" value="<%=msg.getE01LCMCBC()%>" size="12" maxlength="12" readonly="readonly"></TD>
  </TR>
  <TR id="">
    <TD width="35%" align="right" nowrap="nowrap">Swift Code :</TD>
    <TD align="left"><INPUT name="E01LCMCAI" type="text" value="<%=msg.getE01LCMCAI()%>" size="12" maxlength="12" readonly="readonly">
 </TD>
  </TR>
  <TR id="">
    <TD align="right"> Name :</TD>
    <TD align="left"><INPUT name="E01LCMCA1" type="text" value="<%=msg.getE01LCMCA1()%>" size="45" maxlength="35" readonly="readonly">    </TD>
  </TR>
  <TR id="">
    <TD align="right">Address :</TD>
    <TD align="left"><INPUT name="E01LCMCA2" type="text" value="<%=msg.getE01LCMCA2()%>" size="45" maxlength="35" readonly="readonly">    </TD>
  </TR>
  <TR id="">
    <TD></TD>
    <TD align="left"><INPUT name="E01LCMCA3" type="text" value="<%=msg.getE01LCMCA3()%>" size="45" maxlength="35" readonly="readonly">    </TD>
  </TR>
  <TR id="">
    <TD></TD>
    <TD align="left"><INPUT name="E01LCMCA4" type="text" value="<%=msg.getE01LCMCA4()%>" size="45" maxlength="35" readonly="readonly">    </TD>
  </TR>
  <TR id="">
    <TD align="right" valign="bottom">State : </TD>
    <TD align="left" nowrap><INPUT name="E01LCMCA5" type="text" value="<%=msg.getE01LCMCA5()%>" size="2" maxlength="2" readonly="readonly">
      Zip Code :
      <INPUT name="E01LCMCA6" type="text" value="<%=msg.getE01LCMCA6()%>" size="11" maxlength="10" readonly="readonly">
      Country : 
      <INPUT name="E01LCMCA7" type="text" value="<%=msg.getE01LCMCA7()%>" size="3" maxlength="7" readonly="readonly"></TD>
  </TR>
</TABLE>
<BR>
<TABLE width="100%" border="0" align="center" cellpadding="2"  cellspacing="0" class="tableinfo">
  <TR id="trdark">
    <TD colspan="2" align="center" valign="middle" ><FONT size="medium"><B>Correspondent Bank</B></FONT></TD>
  </TR>
  <TR id="">
    <TD align="right" nowrap="nowrap">Customer :</TD>
    <TD align="left" nowrap><INPUT name="E01LCMCOR" type="text" id="E01LCMCOR" value="<%=msg.getE01LCMCOR()%>" size="12" maxlength="12" readonly="readonly">
         Linea de Credito:
      <INPUT name="E01LCMCMG" type="text" value="<%=msg.getE01LCMCMG()%>" size="4" maxlength="4" readonly="readonly">
	 </TD>
  </TR>
  <TR id="">
    <TD width="35%" align="right" nowrap="nowrap">Code Swift :</TD>
    <TD align="left"><INPUT name="E01LCMCBI" type="text" id="E01LCMCBI" value="<%=msg.getE01LCMCBI()%>" size="12" maxlength="12" readonly="readonly">
</TD>
  </TR>
  <TR id="">
    <TD align="right"> Name :</TD>
    <TD align="left"><INPUT name="E01LCMCB1" type="text" id="E01LCMCB1" value="<%=msg.getE01LCMCB1()%>" size="45" maxlength="35" readonly="readonly">    </TD>
  </TR>
  <TR id="">
    <TD align="right">Address :</TD>
    <TD align="left"><INPUT name="E01LCMCB2" type="text" id="E01LCMCB2" value="<%=msg.getE01LCMCB2()%>" size="45" maxlength="35" readonly="readonly">    </TD>
  </TR>
  <TR id="">
    <TD></TD>
    <TD align="left"><INPUT name="E01LCMCB3" type="text" id="E01LCMCB3" value="<%=msg.getE01LCMCB3()%>" size="45" maxlength="35" readonly="readonly">    </TD>
  </TR>
  <TR id="">
    <TD></TD>
    <TD align="left"><INPUT name="E01LCMCB4" type="text" id="E01LCMCB4" value="<%=msg.getE01LCMCB4()%>" size="45" maxlength="35" readonly="readonly">    </TD>
  </TR>
  <TR id="">
    <TD align="right" valign="bottom">State : </TD>
    <TD align="left" nowrap><INPUT name="E01LCMCB5" type="text" id="E01LCMCB5" value="<%=msg.getE01LCMCB5()%>" size="2" maxlength="2" readonly="readonly">
      Zip Code :
      <INPUT name="E01LCMCB6" type="text" id="E01LCMCB6" value="<%=msg.getE01LCMCB6()%>" size="11" maxlength="10" readonly="readonly">
      Country :
      <INPUT name="E01LCMCB7" type="text" id="E01LCMCB7" value="<%=msg.getE01LCMCB7()%>" size="3" maxlength="7" readonly="readonly">
      </TD>
  </TR>
</TABLE>
<BR>
<TABLE class="tableinfo"  cellspacing="0" cellpadding="2" border="0" width="100%" align="center">
  <TR id="trdark">
    <TD colspan="2" align="center" valign="middle" ><FONT size="medium"><B>Reimbursing Bank</B></FONT></TD>
  </TR>
  <TR id="">
    <TD nowrap="nowrap" align="right">Customer CIF or DDA Account :</TD>
    <TD  align="left" nowrap><INPUT name="E01LCMRBA" type="text" value="<%=msg.getE01LCMRBA()%>" size="12" maxlength="12" readonly="readonly"></TD>
  </TR>
  <TR id="">
    <TD nowrap="nowrap" align="right">Swift Code : </TD>
    <TD align="left" nowrap><INPUT name="E01LCMRBI" type="text" value="<%=msg.getE01LCMRBI()%>" size="14" maxlength="12" readonly="readonly">
      </TD>
  </TR>
  <TR id="">
    <TD align="right" nowrap="nowrap">Name :</TD>
    <TD><INPUT name="E01LCMRB1" type="text" value="<%=msg.getE01LCMRB1()%>" size="45" maxlength="35" readonly="readonly"></TD>
  </TR>
  <TR id="">
    <TD align="right">Address :</TD>
    <TD align="left"><INPUT name="E01LCMRB2" type="text" value="<%=msg.getE01LCMRB2()%>" size="45" maxlength="35" readonly="readonly"></TD>
  </TR>
  <TR id="">
    <TD width="35%"></TD>
    <TD align="left"><INPUT name="E01LCMRB3" type="text" value="<%=msg.getE01LCMRB3()%>" size="45" maxlength="35" readonly="readonly"></TD>
  </TR>
  <TR id="">
    <TD></TD>
    <TD align="left"><INPUT name="E01LCMRB4" type="text" value="<%=msg.getE01LCMRB4()%>" size="45" maxlength="35" readonly="readonly"></TD>
  </TR>
  <TR id="">
    <TD align="right" valign="bottom">State :</TD>
    <TD align="left" valign="bottom" nowrap><INPUT name="E01LCMRB5" type="text" value="<%=msg.getE01LCMRB5()%>" size="2" maxlength="2" readonly="readonly">
      Zip Code :
      <INPUT name="E01LCMRB6" type="text" value="<%=msg.getE01LCMRB6()%>" size="11" maxlength="10" readonly="readonly">
      Country :
      <INPUT name="E01LCMRB7" type="text" value="<%=msg.getE01LCMRB7()%>" size="4" maxlength="4" readonly="readonly">
      </TD>
  </TR>
</TABLE>
<BR>
<TABLE border="0" cellpadding="2"  cellspacing="0" class="tableinfo" width="100%" align="center">
  <TR id="trdark">
    <TD colspan="2" align="center" valign="middle"><FONT size="medium"><B>Issuing Bank </B></FONT></TD>
  </TR>
  <TR id="">
    <TD align="right" nowrap="NOWRAP">Customer CIF or DDA Account :</TD>
    <TD nowrap><SELECT name="E01LCMAF1" disabled>
        <OPTION value=" "></OPTION>
        <OPTION value="C" <%if (msg.getE01LCMAF1().equals("C")) out.print("selected");%>>CIF</OPTION>
        <OPTION value="A" <%if (msg.getE01LCMAF1().equals("A")) out.print("selected");%>>DDA</OPTION>
      </SELECT>
        <INPUT name="E01LCMIBA" type="text" value="<%=msg.getE01LCMIBA()%>" size="12" maxlength="12" readonly="readonly"></TD>
  </TR>
  <TR id="">
    <TD width="35%" align="right">Swift Code:</TD>
    <TD align="left" nowrap><INPUT name="E01LCMIBI" type="text" value="<%=msg.getE01LCMIBI()%>" size="14" maxlength="12" readonly="readonly">
      </TD>
  </TR>
  <TR id="">
    <TD align="right">Name :</TD>
    <TD align="left" nowrap><INPUT name="E01LCMIB1" type="text" value="<%=msg.getE01LCMIB1()%>" size="45" maxlength="35" readonly="readonly">
      </TD>
  </TR>
  <TR id="">
    <TD align="right">Address :</TD>
    <TD align="left"><INPUT name="E01LCMIB2" type="text" value="<%=msg.getE01LCMIB2()%>" size="45" maxlength="35" readonly="readonly">    </TD>
  </TR>
  <TR id="">
    <TD></TD>
    <TD align="left"><INPUT name="E01LCMIB3" type="text" value="<%=msg.getE01LCMIB3()%>" size="45" maxlength="35" readonly="readonly"></TD>
  </TR>
  <TR id="">
    <TD></TD>
    <TD align="left"><INPUT name="E01LCMIB4" type="text" value="<%=msg.getE01LCMIB4()%>" size="45" maxlength="35" readonly="readonly">    </TD>
  </TR>
  <TR id="">
    <TD align="right" valign="bottom">State :</TD>
    <TD align="left" valign="bottom" nowrap><INPUT name="E01LCMIB5" type="text" value="<%=msg.getE01LCMIB5()%>" size="2" maxlength="2" readonly="readonly">
      Zip Code :
      <INPUT name="E01LCMIB6" type="text" value="<%=msg.getE01LCMIB6()%>" size="11" maxlength="10" readonly="readonly">
      Country :
      <INPUT name="E01LCMIB7" type="text" value="<%=msg.getE01LCMIB7()%>" size="4" maxlength="4" readonly="readonly">
       </TD>
  </TR>
</TABLE>

</FORM>
</BODY>
</HTML>
