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

<jsp:useBean id="msgLC"  class="datapro.eibs.beans.ELC050001Message" scope="session" />
<jsp:useBean id="error"  class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />

<SCRIPT LANGUAGE="javascript">
<%	if (!userPO.getPurpose().equals("NEW"))
	{%>
		builtNewMenu(lc_opening);
		initMenu();
<%	}
	if (!error.getERRNUM().equals("0"))
	{%>
		showErrors();
	<%}%>
</SCRIPT>


</HEAD>
<BODY>
<H3 align="center">Export Letter of Credit [New]
	<IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"	name="EIBS_GIF" alt="ELC0500_lc_opening_export"></H3>
<HR size="4">

<FORM method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0500">
<INPUT type="hidden" NAME="SCREEN" VALUE="2">
<INPUT type="hidden" NAME="E01LCMATY" VALUE="<%=msgLC.getE01LCMATY().trim()%>">
<INPUT type="hidden" NAME="E01LCMTYP" VALUE="<%=msgLC.getE01LCMTYP().trim()%>">
<BR>
<TABLE cellspacing="0" cellpadding="2" width="100%" border="0" class="tableinfo" id="trclear">
	<TR id="trdark">
	  <TD width="20%" align="right" nowrap="nowrap"><B>Bank :</B></TD>
		<TD width="26%" nowrap="nowrap"><INPUT type="text" name="E01LCMBNK" readonly size="4" maxlength="2" value="<%=msgLC.getE01LCMBNK().trim()%>"></TD>
		<TD width="25%" align="right" nowrap="nowrap"><B>Letter of Credit  Number :</B></TD>
		<TD width="29%" nowrap="nowrap"><B>
		  <%if (msgLC.getE01LCMACC().trim().equals("999999999999"))
				{%>
          <INPUT type="text" size="12" maxlength="12" value="New" readonly>
          <INPUT type="hidden" name="E01LCMACC" value="<%=msgLC.getE01LCMACC().trim()%>">
          <%}
				else
				{%>
          <INPUT type="text" name="E01LCMACC" size="12" maxlength="12" value="<%=msgLC.getE01LCMACC().trim()%>" readonly>
          <%}%>
		</B></TD>
	</TR>
	<TR>
	  <TD align="right" nowrap="nowrap"><B>Our Reference :</B></TD>
		<TD nowrap="nowrap"><INPUT type="text" name="E01LCMORF" size="20" maxlength="16" value="<%=msgLC.getE01LCMORF().trim()%>"></TD>
		<TD align="right" nowrap="nowrap"><B>Product :</B></TD>
		<TD nowrap="nowrap"><B>
		  <INPUT type="text" name="E01LCMPRO" size="4" maxlength="4" value="<%=msgLC.getE01LCMPRO().trim()%>" readonly>
		</B></TD>
	</TR>
	<TR id="trdark">
	  <TD align="right" nowrap="nowrap"><B>Their Reference :</B></TD>
		<TD nowrap="nowrap"><B>
		  <INPUT type="text" name="E01LCMTRF" size="20" maxlength="16" value="<%=msgLC.getE01LCMTRF().trim()%>">
		</B></TD>
		<TD align="right" nowrap="nowrap"><B>Product Description :</B></TD>
		<TD nowrap="nowrap"><B>
		  <INPUT type="text" name="E01DSCPRO" size="40"
						maxlength="40" value="<%=msgLC.getE01DSCPRO().trim()%>" readonly>
		</B></TD>
	</TR>
</TABLE>
<BR>
<TABLE class="tableinfo" cellspacing="0" cellpadding="2" border="0" width="100%" align="center">
  <TR id="trdark">
    <TD colspan="2" align="center" valign="middle"><FONT size="medium"><B>Applicant</B></FONT></TD>
  </TR>
  <TR id="">
    <TD width="35%" align="right">Customer or Account Number :</TD>
    <TD nowrap><SELECT name="E01LCMAF2">
      <OPTION value=" "
								<%if (!(msgLC.getE01LCMAF2().equals("C") || msgLC.getE01LCMAF2().equals("A"))) out.print("selected");%>
								selected></OPTION>
      <OPTION value="C" <%if (msgLC.getE01LCMAF2().equals("C")) out.print("selected");%>>CIF</OPTION>
      <OPTION value="A" <%if (msgLC.getE01LCMAF2().equals("A")) out.print("selected");%>>Account</OPTION>
    </SELECT>
        <INPUT type="text" name="E01LCMAPA" size="12"
							maxlength="12" value="<%=msgLC.getE01LCMAPA()%>">        <A href="javascript: GetCustomerDetailsLC('E01LCMAPA','E01LCMAP1','E01LCMAP2','E01LCMAP3','E01LCMAP4','E01LCMAP5','E01LCMAP6','','')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." onClick="javascript: document.forms[0].E01LCMAF2.selectedIndex = 1"
			border="0"></A> Customer or <A
							href="javascript: GetAccByClient('E01LCMAPA','','RT','','E01LCMAP1')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ."
							onclick="javascript: document.forms[0].E01LCMAF2.selectedIndex = 2"  border="0"></A> Account</TD>
  </TR>
  <TR id="">
    <TD align="right">Name :</TD>
    <TD align="left"><INPUT type="text" name="E01LCMAP1" size="45"
					maxlength="35" value="<%=msgLC.getE01LCMAP1()%>">
      <IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" border="0">    </TD>
  </TR>
  <TR id="">
    <TD align="right">Address :</TD>
    <TD align="left"><INPUT type="text" name="E01LCMAP2" size="45"
					maxlength="35" value="<%=msgLC.getE01LCMAP2()%>">
    </TD>
  </TR>
  <TR id="">
    <TD></TD>
    <TD align="left"><INPUT type="text" name="E01LCMAP3" size="45"
					maxlength="35" value="<%=msgLC.getE01LCMAP3()%>">
    </TD>
  </TR>
  <TR id="">
    <TD></TD>
    <TD align="left"><INPUT type="text" name="E01LCMAP4" size="45"
					maxlength="35" value="<%=msgLC.getE01LCMAP4()%>">
    </TD>
  </TR>
  <TR id="">
    <TD align="right">State :</TD>
    <TD align="left"><INPUT type="text" name="E01LCMAP5" size="4" maxlength="4"
							value="<%=msgLC.getE01LCMAP5()%>">
        <A href="javascript:GetCodeCNOFC('E01LCMAP5','84')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></A> Zip Code
        <INPUT type="text"
							name="E01LCMAP6" size="11" maxlength="10"
							value="<%=msgLC.getE01LCMAP6()%>">
      Country
      <INPUT type="text"
							name="E01LCMAP7" size="4" maxlength="4"
							value="<%=msgLC.getE01LCMAP7()%>">
      <A href="javascript:GetCodeCNOFC('E01LCMAP7','03')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></A> </TD>
  </TR>
</TABLE>
<BR>
<TABLE class="tableinfo"  cellspacing="0" cellpadding="2" border="0" width="100%" align="center">
  <TR id="trdark">
    <TD colspan="2" align="center" valign="middle"><FONT size="medium"><B>Beneficiary</B></FONT></TD>
  </TR>
  <TR id="">
    <TD align="right">Customer or Account Number :</TD>
    <TD nowrap><SELECT name="E01LCMAF3">
        <OPTION value=" " <%if (!(msgLC.getE01LCMAF3().equals("C") || msgLC.getE01LCMAF3().equals("A"))) out.print("selected");%>></OPTION>
        <OPTION value="C" <%if (msgLC.getE01LCMAF3().equals("C")) out.print("selected");%>>Customer</OPTION>
        <OPTION value="A" <%if (msgLC.getE01LCMAF3().equals("A")) out.print("selected");%>>Account</OPTION>
      </SELECT>
        <INPUT type="text" name="E01LCMBAC" size="12" maxlength="12" value="<%=msgLC.getE01LCMBAC()%>">
        <A href="javascript: GetCustomerDetailsLC('E01LCMBAC','E01LCMBN1','E01LCMBN2','E01LCMBN3','E01LCMBN4','E01LCMBN5','E01LCMBN6','','')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." onClick="javascript: document.forms[0].E01LCMAF3.selectedIndex = 1"
			border="0"></A> Customer or <A
							href="javascript: GetAccByClient('E01LCMBAC','','RT','','E01LCMBN1')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ."
							onclick="javascript: document.forms[0].E01LCMAF3.selectedIndex = 2" border="0"></A> Account</TD>
  </TR>
  <TR id="">
    <TD width="35%" align="right"> Name :</TD>
    <TD align="left"><INPUT type="text" name="E01LCMBN1" size="45"
					maxlength="35" value="<%=msgLC.getE01LCMBN1()%>">
        <IMG
					src="<%=request.getContextPath()%>/images/Check.gif"
					alt="mandatory field" border="0"></TD>
  </TR>
  <TR id="">
    <TD align="right">Address :</TD>
    <TD align="left"><INPUT type="text" name="E01LCMBN2" size="45"
					maxlength="35" value="<%=msgLC.getE01LCMBN2()%>">    </TD>
  </TR>
  <TR id="">
    <TD></TD>
    <TD align="left"><INPUT type="text" name="E01LCMBN3" size="45"
					maxlength="35" value="<%=msgLC.getE01LCMBN3()%>">    </TD>
  </TR>
  <TR id="">
    <TD></TD>
    <TD align="left"><INPUT type="text" name="E01LCMBN4" size="45"
					maxlength="35" value="<%=msgLC.getE01LCMBN4()%>">    </TD>
  </TR>
  <TR id="">
    <TD align="right">State <B> :</B></TD>
    <TD align="left"><INPUT type="text" name="E01LCMBN5" size="2" maxlength="2"
							value="<%=msgLC.getE01LCMBN5()%>">
        <A href="javascript:GetCodeCNOFC('E01LCMBN5','84')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></A> Zip Code
        <INPUT type="text"
							name="E01LCMBN6" size="11" maxlength="10"
							value="<%=msgLC.getE01LCMBN6()%>">
      Country
      <INPUT type="text"
							name="E01LCMBN7" size="4" maxlength="4"
							value="<%=msgLC.getE01LCMBN7()%>">
      <A href="javascript:GetCodeCNOFC('E01LCMBN7','03')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></A> </TD>
  </TR>
</TABLE>
<BR>
      <TABLE border="0" cellpadding="2"  cellspacing="0" class="tableinfo" width="100%" align="center">
          <TR id="trdark">
            <TD colspan="2" align="center" valign="middle"><FONT size="medium"><B>Issuing Bank</B></FONT></TD>
          </TR>
          <TR id="">
            <TD width="35%" align="right" nowrap="NOWRAP">Customer  or Account Number :</TD>
            <TD nowrap><SELECT name="E01LCMAF1">
                <OPTION value=" "></OPTION>
<OPTION value="C" <%if (msgLC.getE01LCMAF1().equals("C")) out.print("selected");%>>Customer</OPTION>
                <OPTION value="A" <%if (msgLC.getE01LCMAF1().equals("A")) out.print("selected");%>>Account</OPTION>
              </SELECT>
                <INPUT type="text" name="E01LCMIBA" size="12" maxlength="12" value="<%=msgLC.getE01LCMIBA()%>">
               <A href="javascript: javascript: GetCustomerDetailsLC('E01LCMIBA','E01LCMIB1','E01LCMIB2','E01LCMIB3','E01LCMIB4','E01LCMIB5','E01LCMIB6','','C')">
			   <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." onClick="javascript: document.forms[0].E01LCMAF1.selectedIndex = 1"
			border="0"></A> Customer or <A href="javascript: GetAccByClient('E01LCMIBA','','RT','','E01LCMIB1')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." onClick="javascript: document.forms[0].E01LCMAF1.selectedIndex = 2" border="0"></A> Account</TD>
          </TR>
          <TR id="">
            <TD align="right">Swift BIC :</TD>
            <TD align="left" nowrap><INPUT type="text" name="E01LCMIBI" size="14" maxlength="12" value="<%=msgLC.getE01LCMIBI()%>">
             <A href="javascript:GetSwiftIdDesc('E01LCMIBI','','','')">
		    <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"  border="0"></A></TD>
          </TR>
          <TR id="">
            <TD align="right">Name :</TD>
            <TD align="left" nowrap><INPUT type="text" name="E01LCMIB1" size="45" maxlength="35" value="<%=msgLC.getE01LCMIB1()%>">
              <A href="javascript:GetCorrespondentDescIdSwift('E01LCMIBI','','')"></A></TD>
          </TR>
          <TR id="">
            <TD align="right">Address :</TD>
            <TD align="left"><INPUT type="text" name="E01LCMIB2" size="45" maxlength="35" value="<%=msgLC.getE01LCMIB2()%>">
            </TD>
          </TR>
          <TR id="">
            <TD></TD>
            <TD align="left"><INPUT type="text" name="E01LCMIB3" size="45" maxlength="35" value="<%=msgLC.getE01LCMIB3()%>"></TD>
          </TR>
          <TR id="">
            <TD></TD>
            <TD align="left"><INPUT type="text" name="E01LCMIB4" size="45" maxlength="35" value="<%=msgLC.getE01LCMIB4()%>">
            </TD>
          </TR>
          <TR id="">
            <TD align="right" valign="bottom">State<B> :</B></TD>
            <TD align="left" valign="bottom" nowrap><INPUT type="text" name="E01LCMIB5" size="2" maxlength="2" value="<%=msgLC.getE01LCMIB5()%>">
              <A href="javascript:GetCodeCNOFC('E01LCMIB5','84')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></A> Zip Code
              <INPUT type="text" name="E01LCMIB6" size="11" maxlength="10" value="<%=msgLC.getE01LCMIB6()%>">
              Country
              <INPUT type="text" name="E01LCMIB7" size="4" maxlength="4" value="<%=msgLC.getE01LCMIB7()%>">
              <A href="javascript:GetCodeCNOFC('E01LCMIB7','03')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></A> </TD>
          </TR>
      </TABLE>
	 <BR>
      <TABLE class="tableinfo"  cellspacing="0" cellpadding="2" border="0" width="100%" align="center">
        <TR id="trdark">
          <TD colspan="2" align="center" valign="middle" ><FONT size="medium"><B>Advise Through Bank</B></FONT></TD>
        </TR>
        <TR id="">
          <TD width="35%" align="right" nowrap="nowrap">Customer :</TD>
          <TD align="left" nowrap><INPUT type="text" name="E01LCMCBC" size="12" maxlength="12" value="<%=msgLC.getE01LCMCBC()%>">
            <A href="javascript: GetCustomerDetailsLC('E01LCMCBC','E01LCMCA1','E01LCMCA2','E01LCMCA3','E01LCMCA4','E01LCMCA5','E01LCMCA6','','C')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></A></TD>
        </TR>
        <TR id="">
          <TD nowrap="nowrap" align="right">Swift BIC :</TD>
          <TD align="left"><INPUT type="text" name="E01LCMCAI" size="14" maxlength="12" value="<%=msgLC.getE01LCMCAI()%>">
            <A href="javascript:GetSwiftIdDesc('E01LCMCAI','','','')"><IMG
						src="<%=request.getContextPath()%>/images/1b.gif" alt="help"
						border="0"></A> </TD>
        </TR>
        <TR id="">
          <TD align="right"> Name :</TD>
          <TD align="left"><INPUT type="text" name="E01LCMCA1" size="45" maxlength="35" value="<%=msgLC.getE01LCMCA1()%>">
          </TD>
        </TR>
        <TR id="">
          <TD align="right">Address :</TD>
          <TD align="left"><INPUT type="text" name="E01LCMCA2" size="45" maxlength="35" value="<%=msgLC.getE01LCMCA2()%>">
          </TD>
        </TR>
        <TR id="">
          <TD></TD>
          <TD align="left"><INPUT type="text" name="E01LCMCA3" size="45" maxlength="35" value="<%=msgLC.getE01LCMCA3()%>">
          </TD>
        </TR>
        <TR id="">
          <TD></TD>
          <TD align="left"><INPUT type="text" name="E01LCMCA4" size="45" maxlength="35" value="<%=msgLC.getE01LCMCA4()%>">
          </TD>
        </TR>
        <TR id="">
          <TD align="right" valign="bottom">State :</TD>
          <TD align="left" nowrap><INPUT type="text" name="E01LCMCA5" size="2" maxlength="2" value="<%=msgLC.getE01LCMCA5()%>">
            <A href="javascript:GetCodeCNOFC('E01LCMCA5','84')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></A> Zip Code
            <INPUT type="text" name="E01LCMCA6" size="11" maxlength="10" value="<%=msgLC.getE01LCMCA6()%>">
            Country
            <INPUT type="text" name="E01LCMCA7" size="3" maxlength="7" value="<%=msgLC.getE01LCMCA7()%>">
            <A href="javascript:GetCodeCNOFC('E01LCMCA7','03')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></A></TD>
        </TR>
      </TABLE>
      <BR>
      <TABLE width="100%" border="0" align="center" cellpadding="2"  cellspacing="0" class="tableinfo">
        <TR id="trdark">
          <TD colspan="2" align="center" valign="middle" ><FONT size="medium"><B>Correspondent Bank</B></FONT></TD>
        </TR>
        <TR id="">
          <TD width="35%" align="right" nowrap="nowrap">Customer :</TD>
          <TD align="left" nowrap><INPUT name="E01LCMCOR" type="text" id="E01LCMCOR" value="<%=msgLC.getE01LCMCOR()%>" size="12" maxlength="12">
              <A href="javascript: GetCustomerDetailsLC('E01LCMCOR','E01LCMCB1','E01LCMCB2','E01LCMCB3','E01LCMCB4','E01LCMCB5','E01LCMCB6','','4')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></A> Line of Credit:
            <INPUT type="text" name="E01LCMCMG" size="4" maxlength="4" value="<%=msgLC.getE01LCMCMG()%>"> 
			<A href="javascript:GetCreditLine('E01LCMCMG',document.forms[0].E01LCMCOR.value)">
				<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></A></TD>
        </TR>
        <TR id="">
          <TD nowrap="nowrap" align="right">Swift BIC :</TD>
          <TD align="left"><INPUT name="E01LCMCBI" type="text" id="E01LCMCBI" value="<%=msgLC.getE01LCMCBI()%>" size="14" maxlength="12">
            <A href="javascript:GetSwiftIdDesc('E01LCMCBI','','','')"><IMG
						src="<%=request.getContextPath()%>/images/1b.gif" alt="help"
						border="0"></A> </TD>
        </TR>
        <TR id="">
          <TD align="right"> Name :</TD>
          <TD align="left"><INPUT name="E01LCMCB1" type="text" id="E01LCMCB1" value="<%=msgLC.getE01LCMCB1()%>" size="45" maxlength="35">
          </TD>
        </TR>
        <TR id="">
          <TD align="right">Address :</TD>
          <TD align="left"><INPUT name="E01LCMCB2" type="text" id="E01LCMCB2" value="<%=msgLC.getE01LCMCB2()%>" size="45" maxlength="35">
          </TD>
        </TR>
        <TR id="">
          <TD></TD>
          <TD align="left"><INPUT name="E01LCMCB3" type="text" id="E01LCMCB3" value="<%=msgLC.getE01LCMCB3()%>" size="45" maxlength="35">
          </TD>
        </TR>
        <TR id="">
          <TD></TD>
          <TD align="left"><INPUT name="E01LCMCB4" type="text" id="E01LCMCB4" value="<%=msgLC.getE01LCMCB4()%>" size="45" maxlength="35">
          </TD>
        </TR>
        <TR id="">
          <TD align="right" valign="bottom">State :</TD>
          <TD align="left" nowrap><INPUT name="E01LCMCB5" type="text" id="E01LCMCB5" value="<%=msgLC.getE01LCMCB5()%>" size="2" maxlength="2">
            <A href="javascript:GetCodeCNOFC('E01LCMCB5','84')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></A> Zip Code
            <INPUT name="E01LCMCB6" type="text" id="E01LCMCB6" value="<%=msgLC.getE01LCMCB6()%>" size="11" maxlength="10">
            Country
            <INPUT name="E01LCMCB7" type="text" id="E01LCMCB7" value="<%=msgLC.getE01LCMCB7()%>" size="3" maxlength="7">
            <A href="javascript:GetCodeCNOFC('E01LCMCB7','03')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></A></TD>
        </TR>
      </TABLE>
      <BR>
      <TABLE class="tableinfo"  cellspacing="0" cellpadding="2" border="0" width="100%" align="center">
        <TR id="trdark">
          <TD colspan="2" align="center" valign="middle" ><FONT size="medium"><B>Reimbursing Bank</B></FONT></TD>
        </TR>
        <TR id="">
          <TD nowrap="nowrap" align="right">Customer  or Account Number :</TD>
          <TD  align="left" nowrap><INPUT type="text" name="E01LCMRBA" size="12" maxlength="12" value="<%=msgLC.getE01LCMRBA()%>">
              <A href="javascript: GetCustomerDetailsLC('E01LCMRBA','E01LCMRB1','E01LCMRB2','E01LCMRB3','E01LCMRB4','E01LCMRB5','E01LCMRB6','','5')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></A> Customer or <A href="javascript: GetAccByClient('E01LCMRBA','','RT','','E01LCMRB1')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></A> Account </TD>
        </TR>
        <TR id="">
          <TD nowrap="nowrap" align="right">Swift BIC : </TD>
          <TD align="left" nowrap><INPUT type="text" name="E01LCMRBI" size="14" maxlength="12" value="<%=msgLC.getE01LCMRBI()%>">
            <A href="javascript:GetSwiftIdDesc('E01LCMRBI','','','')">
             <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="help" border="0"></A></TD>
        </TR>
        <TR id="">
          <TD align="right" nowrap="nowrap">Name :</TD>
          <TD><INPUT type="text" name="E01LCMRB1" size="45" maxlength="35" value="<%=msgLC.getE01LCMRB1()%>"></TD>
        </TR>
        <TR id="">
          <TD align="right">Address :</TD>
          <TD align="left"><INPUT type="text" name="E01LCMRB2" size="45" maxlength="35" value="<%=msgLC.getE01LCMRB2()%>"></TD>
        </TR>
        <TR id="">
          <TD width="35%"></TD>
          <TD align="left"><INPUT type="text" name="E01LCMRB3" size="45" maxlength="35" value="<%=msgLC.getE01LCMRB3()%>"></TD>
        </TR>
        <TR id="">
          <TD></TD>
          <TD align="left"><INPUT type="text" name="E01LCMRB4" size="45" maxlength="35" value="<%=msgLC.getE01LCMRB4()%>"></TD>
        </TR>
        <TR id="">
          <TD align="right" valign="bottom">State :</TD>
          <TD align="left" valign="bottom" nowrap><INPUT type="text" name="E01LCMRB5" size="2" maxlength="2" value="<%=msgLC.getE01LCMRB5()%>">
            <A href="javascript:GetCodeCNOFC('E01LCMRB5','84')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></A> Zip Code
            <INPUT type="text" name="E01LCMRB6" size="11" maxlength="10" value="<%=msgLC.getE01LCMRB6()%>">
            Country
            <INPUT type="text" name="E01LCMRB7" size="4" maxlength="4" value="<%=msgLC.getE01LCMRB7()%>">
            <A href="javascript:GetCodeCNOFC('E01LCMRB7','03')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></A></TD>
        </TR>
      </TABLE>
      <BR>
    <DIV align="center">
<H4 style="text-align:center"><INPUT type="checkbox" name="H01FLGWK2" value="A" <% if(msgLC.getH01FLGWK2().equals("A")){ out.print("checked");} %>>
      Accept with Warnings</H4>
    <INPUT id="EIBSBTN" type=submit name="Submit" value="Submit">

	
  </DIV>

</FORM>
</BODY>
</HTML>
