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

<%	if (!userPO.getPurpose().equals("NEW")) {%>
		builtNewMenu(sb_opening);
<%	} %>

   	builtHPopUp();

  	function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   		init(opth,field,bank,ccy,field1,field2,opcod);
   		showPopupHelp();
   	}
   
</SCRIPT>

<%if (!error.getERRNUM().equals("0")) {
	error.setERRNUM("0");
	out.println("<SCRIPT Language=\"Javascript\">");
	out.println("       showErrors()");
	out.println("</SCRIPT>");
}

if (!userPO.getPurpose().equals("NEW")) {
	out.println("<SCRIPT> initMenu();  </SCRIPT>");
}
%>

</HEAD>
<BODY>
<H3 align="center">Incoming Stand By Letter Of Credit <%= (userPO.getPurpose().equals("NEW") ? "New" : "Maintenance") %> [Basic Information]
	<IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="sb_opening_incoming.jsp, ELC0400"></H3>
<HR size="4">
<FORM method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0400">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
<INPUT TYPE=HIDDEN NAME="E01LCMATY" VALUE="<%=msg.getE01LCMATY().trim()%>">

<TABLE cellspacing="0" cellpadding="2" width="100%" border="0" class="tableinfo">
  <TR id="trdark">
    <TD align="right"><STRONG>Bank :</STRONG></TD>
    <TD><INPUT type="text" name="E01LCMBNK" readonly size="4" maxlength="2" value="<%=msg.getE01LCMBNK().trim()%>"></TD>
    <TD width="16%" align="right" nowrap><STRONG>Letter of Credit Number : </STRONG></TD>
    <TD><%if (msg.getE01LCMACC().trim().equals("999999999999"))
				{%>
        <INPUT type="text" size="12" maxlength="12" value="New" readonly>
        <INPUT type="hidden" name="E01LCMACC" value="<%=msg.getE01LCMACC().trim()%>">
        <%}
				else
				{%>
        <INPUT type="text" name="E01LCMACC" size="12" maxlength="12" value="<%=msg.getE01LCMACC().trim()%>" readonly>
        <%}%></TD>
  </TR>
  <TR>
    <TD align="right" nowrap><STRONG>Our Reference :</STRONG></TD>
    <TD><INPUT type="text" name="E01LCMORF" size="20" maxlength="16" value="<%=msg.getE01LCMORF().trim()%>"></TD>
    <TD width="16%" align="right" nowrap><STRONG>Product : </STRONG></TD>
    <TD><B>
      <INPUT type="text" name="E01LCMPRO" size="4" maxlength="4" value="<%=msg.getE01LCMPRO().trim()%>" readonly>
    </B></TD>
  </TR>
  <TR id="trdark">
    <TD align="right" nowrap="nowrap"><STRONG>Their Reference :</STRONG></TD>
    <TD><B>
      <INPUT type="text" name="E01LCMTRF" size="20" maxlength="16" value="<%=msg.getE01LCMTRF().trim()%>">
    </B></TD>
    <TD width="16%" align="right" nowrap><STRONG>Product Description : </STRONG></TD>
    <TD><B>
      <INPUT type="text" name="E01DSCPRO" size="40"
						maxlength="40" value="<%=msg.getE01DSCPRO().trim()%>" readonly>
    </B></TD>
  </TR>
</TABLE>
<INPUT type=HIDDEN name="SCREEN" value="2">
<P>&nbsp;</P>
<TABLE class="tableinfo" cellspacing="0" cellpadding="2" border="0" width="100%" align="center">
  <TR id="trdark">
    <TD colspan="2" align="center" valign="middle"><FONT size="medium"><B>Applicant</B></FONT></TD>
  </TR>
  <TR id="">
    <TD align="right">Customer  or Account Number :</TD>
    <TD nowrap><SELECT name="E01LCMAF2">
			        <OPTION value=" " <%if (!(msg.getE01LCMAF2().equals("C") || msg.getE01LCMAF2().equals("A"))) out.print("selected");%> selected></OPTION>
			        <OPTION value="C" <%if (msg.getE01LCMAF2().equals("C")) out.print("selected");%>>CIF</OPTION>
			        <OPTION value="A" <%if (msg.getE01LCMAF2().equals("A")) out.print("selected");%>>DDA</OPTION>
      			</SELECT>
        <INPUT type="text" name="E01LCMAPA" size="12" maxlength="12" value="<%=msg.getE01LCMAPA()%>">
         
        <A href="javascript: GetCustomerDetailsLC('E01LCMAPA','E01LCMAP1','E01LCMAP2','E01LCMAP3','E01LCMAP4','E01LCMAP5','E01LCMAP6','','')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." 
           onClick="javascript: document.forms[0].E01LCMAF2.selectedIndex = 1" border="0"></A> Customer or 
		<A href="javascript: GetAccByClient('E01LCMAPA','','RT','','E01LCMAP1')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ."
		   onclick="javascript: document.forms[0].E01LCMAF2.selectedIndex = 2"  border="0"></A> Account
	</TD>
  </TR>
  <TR id="">
    <TD width="35%" align="right">Name :</TD>
    <TD align="left"><INPUT type="text" name="E01LCMAP1" size="45" maxlength="35" value="<%=msg.getE01LCMAP1()%>">    
    <IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" border="0"></TD>
  </TR>
  <TR id="">
    <TD align="right">Address :</TD>
    <TD align="left"><INPUT type="text" name="E01LCMAP2" size="45" maxlength="35" value="<%=msg.getE01LCMAP2()%>">    </TD>
  </TR>
  <TR id="">
    <TD></TD>
    <TD align="left"><INPUT type="text" name="E01LCMAP3" size="45" maxlength="35" value="<%=msg.getE01LCMAP3()%>">    </TD>
  </TR>
  <TR id="">
    <TD></TD>
    <TD align="left"><INPUT type="text" name="E01LCMAP4" size="45" maxlength="35" value="<%=msg.getE01LCMAP4()%>">    </TD>
  </TR>
  <TR id="">
    <TD align="right">State : </TD>
    <TD align="left"><INPUT type="text" name="E01LCMAP5" size="4" maxlength="4"	value="<%=msg.getE01LCMAP5()%>">
        <A href="javascript:GetCodeCNOFC('E01LCMAP5','84')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></A> 
        Zip Code : 
        <INPUT type="text" name="E01LCMAP6" size="11" maxlength="10"	value="<%=msg.getE01LCMAP6()%>">
        Country : 
        <INPUT type="text" name="E01LCMAP7" size="4" maxlength="4" value="<%=msg.getE01LCMAP7()%>">
        <A href="javascript:GetCodeCNOFC('E01LCMAP7','03')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></A> 
    </TD>
  </TR>
</TABLE>
<BR>
<TABLE class="tableinfo"  cellspacing="0" cellpadding="2" border="0" width="100%" align="center">
  <TR id="trdark">
    <TD colspan="2" align="center" valign="middle"><FONT size="medium"><B>Beneficiary</B></FONT></TD>
  </TR>
  <TR id="">
    <TD align="right">Customer  or  Account Number :</TD>
    <TD nowrap><SELECT name="E01LCMAF3">
			        <OPTION value=" " <%if (!(msg.getE01LCMAF3().equals("C") || msg.getE01LCMAF3().equals("A"))) out.print("selected");%>></OPTION>
			        <OPTION value="C" <%if (msg.getE01LCMAF3().equals("C")) out.print("selected");%>>CIF</OPTION>
			        <OPTION value="A" <%if (msg.getE01LCMAF3().equals("A")) out.print("selected");%>>DDA</OPTION>
		       </SELECT>
        <INPUT type="text" name="E01LCMBAC" size="12" maxlength="12" value="<%=msg.getE01LCMBAC()%>">
        <A href="javascript: GetCustomerDetailsLC('E01LCMBAC','E01LCMBN1','E01LCMBN2','E01LCMBN3','E01LCMBN4','E01LCMBN5','E01LCMBN6','','')"> 
        <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." 
        onClick="javascript: document.forms[0].E01LCMAF3.selectedIndex = 1" border="0"></A> Customer or 
        <A href="javascript: GetAccByClient('E01LCMBAC','','RT','','E01LCMBN1')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"
        onclick="javascript: document.forms[0].E01LCMAF3.selectedIndex = 2" border="0"></A> Account</TD>
  </TR>
  <TR id="">
    <TD width="35%" align="right"> Name :</TD>
    <TD align="left"><INPUT type="text" name="E01LCMBN1" size="45" maxlength="35" value="<%=msg.getE01LCMBN1()%>">
        <IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" border="0">
    </TD>
  </TR>
  <TR id="">
    <TD align="right">Address :</TD>
    <TD align="left"><INPUT type="text" name="E01LCMBN2" size="45" maxlength="35" value="<%=msg.getE01LCMBN2()%>">    </TD>
  </TR>
  <TR id="">
    <TD></TD>
    <TD align="left"><INPUT type="text" name="E01LCMBN3" size="45" maxlength="35" value="<%=msg.getE01LCMBN3()%>">    </TD>
  </TR>
  <TR id="">
    <TD></TD>
    <TD align="left"><INPUT type="text" name="E01LCMBN4" size="45" maxlength="35" value="<%=msg.getE01LCMBN4()%>">    </TD>
  </TR>
  <TR id="">
    <TD align="right">State : </TD>
    <TD align="left"><INPUT type="text" name="E01LCMBN5" size="2" maxlength="2"	value="<%=msg.getE01LCMBN5()%>">
        <A href="javascript:GetCodeCNOFC('E01LCMBN5','84')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></A> 
        Zip Code : 
        <INPUT type="text" name="E01LCMBN6" size="11" maxlength="10" value="<%=msg.getE01LCMBN6()%>">
        Country : 
       <INPUT type="text" name="E01LCMBN7" size="4" maxlength="4" value="<%=msg.getE01LCMBN7()%>">
       <A href="javascript:GetCodeCNOFC('E01LCMBN7','03')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></A> </TD>
  </TR>
</TABLE>
<BR>
<BR>
<TABLE class="tableinfo"  cellspacing="0" cellpadding="2" border="0" width="100%" align="center">
  <TR id="trdark">
    <TD colspan="2" align="center" valign="middle" ><FONT size="medium"><B>Advise Through Bank</B></FONT></TD>
  </TR>
  <TR id="">
    <TD align="right" nowrap="nowrap">Customer Number :</TD>
    <TD align="left" nowrap><INPUT type="text" name="E01LCMCBC" size="12" maxlength="12" value="<%=msg.getE01LCMCBC()%>">
        <A href="javascript: GetCustomerDetailsLC('E01LCMCBC','E01LCMCA1','E01LCMCA2','E01LCMCA3','E01LCMCA4','E01LCMCA5','E01LCMCA6','','C')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></A>
    </TD>
  </TR>
  <TR id="">
    <TD width="35%" align="right" nowrap="nowrap">Swift BIC :</TD>
    <TD align="left"><INPUT type="text" name="E01LCMCAI" size="14" maxlength="12" value="<%=msg.getE01LCMCAI()%>">
        <!--<A href="javascript:GetCorrespondentDescIdSwift('E01LCMCAI','','E01LCMCBC','1')">-->
        <A href="javascript:GetSwiftIdDesc('E01LCMCAI','','','')">
        <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></A> 
    </TD>
  </TR>
  <TR id="">
    <TD align="right"> Name :</TD>
    <TD align="left"><INPUT type="text" name="E01LCMCA1" size="45" maxlength="35" value="<%=msg.getE01LCMCA1()%>">    </TD>
  </TR>
  <TR id="">
    <TD align="right">Address :</TD>
    <TD align="left"><INPUT type="text" name="E01LCMCA2" size="45" maxlength="35" value="<%=msg.getE01LCMCA2()%>">    </TD>
  </TR>
  <TR id="">
    <TD></TD>
    <TD align="left"><INPUT type="text" name="E01LCMCA3" size="45" maxlength="35" value="<%=msg.getE01LCMCA3()%>">    </TD>
  </TR>
  <TR id="">
    <TD></TD>
    <TD align="left"><INPUT type="text" name="E01LCMCA4" size="45" maxlength="35" value="<%=msg.getE01LCMCA4()%>">    </TD>
  </TR>
  <TR id="">
    <TD align="right" valign="bottom">State : </TD>
    <TD align="left" nowrap><INPUT type="text" name="E01LCMCA5" size="2" maxlength="2" value="<%=msg.getE01LCMCA5()%>">
        <A href="javascript:GetCodeCNOFC('E01LCMCA5','84')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></A> 
        Zip Code : 
        <INPUT type="text" name="E01LCMCA6" size="11" maxlength="10" value="<%=msg.getE01LCMCA6()%>">
        Country : 
        <INPUT type="text" name="E01LCMCA7" size="3" maxlength="7" value="<%=msg.getE01LCMCA7()%>">
        <A href="javascript:GetCodeCNOFC('E01LCMCA7','03')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></A>
     </TD>
  </TR>
</TABLE>
<BR>
<TABLE width="100%" border="0" align="center" cellpadding="2"  cellspacing="0" class="tableinfo">
  <TR id="trdark">
    <TD colspan="2" align="center" valign="middle" ><FONT size="medium"><B>Correspondent Bank</B></FONT></TD>
  </TR>
  <TR id="">
    <TD align="right" nowrap="nowrap">Customer Number:</TD>
    <TD align="left" nowrap><INPUT name="E01LCMCOR" type="text" id="E01LCMCOR" value="<%=msg.getE01LCMCOR()%>" size="12" maxlength="12">
        <A href="javascript: GetCustomerDetailsLC('E01LCMCOR','E01LCMCB1','E01LCMCB2','E01LCMCB3','E01LCMCB4','E01LCMCB5','E01LCMCB6','','4')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></A> 
        Line of Credit : 
        <INPUT type="text" name="E01LCMCMG" size="4" maxlength="4" value="<%=msg.getE01LCMCMG()%>">
	    <A href="javascript:GetCreditLine('E01LCMCMG',document.forms[0].E01LCMCOR.value)"><IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></A>
	</TD>
  </TR>
  <TR id="">
    <TD width="35%" align="right" nowrap="nowrap">Swift BIC :</TD>
    <TD align="left"><INPUT name="E01LCMCBI" type="text" id="E01LCMCBI" value="<%=msg.getE01LCMCBI()%>" size="14" maxlength="12">
        <!--<A href="javascript:GetCorrespondentDescIdSwift('E01LCMCBI','','E01LCMCOR','4')">-->
        <A href="javascript:GetSwiftIdDesc('E01LCMCBI','','','')">
        <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"	border="0"></A> 
	</TD>
  </TR>
  <TR id="">
    <TD align="right"> Name :</TD>
    <TD align="left"><INPUT name="E01LCMCB1" type="text" id="E01LCMCB1" value="<%=msg.getE01LCMCB1()%>" size="45" maxlength="35">    </TD>
  </TR>
  <TR id="">
    <TD align="right">Address :</TD>
    <TD align="left"><INPUT name="E01LCMCB2" type="text" id="E01LCMCB2" value="<%=msg.getE01LCMCB2()%>" size="45" maxlength="35">    </TD>
  </TR>
  <TR id="">
    <TD></TD>
    <TD align="left"><INPUT name="E01LCMCB3" type="text" id="E01LCMCB3" value="<%=msg.getE01LCMCB3()%>" size="45" maxlength="35">    </TD>
  </TR>
  <TR id="">
    <TD></TD>
    <TD align="left"><INPUT name="E01LCMCB4" type="text" id="E01LCMCB4" value="<%=msg.getE01LCMCB4()%>" size="45" maxlength="35">    </TD>
  </TR>
  <TR id="">
    <TD align="right" valign="bottom">State : </TD>
    <TD align="left" nowrap><INPUT name="E01LCMCB5" type="text" id="E01LCMCB5" value="<%=msg.getE01LCMCB5()%>" size="2" maxlength="2">
        <A href="javascript:GetCodeCNOFC('E01LCMCB5','84')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></A> 
        Zip Code : 
        <INPUT name="E01LCMCB6" type="text" id="E01LCMCB6" value="<%=msg.getE01LCMCB6()%>" size="11" maxlength="10">
        Country : 
        <INPUT name="E01LCMCB7" type="text" id="E01LCMCB7" value="<%=msg.getE01LCMCB7()%>" size="3" maxlength="7">
       <A href="javascript:GetCodeCNOFC('E01LCMCB7','03')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></A>
    </TD>
  </TR>
</TABLE>
<BR>
<TABLE class="tableinfo"  cellspacing="0" cellpadding="2" border="0" width="100%" align="center">
  <TR id="trdark">
    <TD colspan="2" align="center" valign="middle" ><FONT size="medium"><B>Reimbursing Bank</B></FONT></TD>
  </TR>
  <TR id="">
    <TD nowrap="nowrap" align="right">Customer  or  Account Number :</TD>
    <TD  align="left" nowrap><INPUT type="text" name="E01LCMRBA" size="12" maxlength="12" value="<%=msg.getE01LCMRBA()%>">
        <A href="javascript: GetCustomerDetailsLC('E01LCMRBA','E01LCMRB1','E01LCMRB2','E01LCMRB3','E01LCMRB4','E01LCMRB5','E01LCMRB6','','5')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></A> Customer or <A href="javascript: GetAccByClient('E01LCMRBA','','RT','','E01LCMRB1')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></A>
         Account
    </TD>
  </TR>
  <TR id="">
    <TD nowrap="nowrap" align="right">Swift BIC : </TD>
    <TD align="left" nowrap><INPUT type="text" name="E01LCMRBI" size="14" maxlength="12" value="<%=msg.getE01LCMRBI()%>">
      <!--<A href="javascript:GetCorrespondentDescIdSwift('E01LCMRBI','','E01LCMRBA','5')">--> 
      <A href="javascript:GetSwiftIdDesc('E01LCMRBI','','','')">
      <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></A>
    </TD>
  </TR>
  <TR id="">
    <TD align="right" nowrap="nowrap">Name :</TD>
    <TD><INPUT type="text" name="E01LCMRB1" size="45" maxlength="35" value="<%=msg.getE01LCMRB1()%>"></TD>
  </TR>
  <TR id="">
    <TD align="right">Address :</TD>
    <TD align="left"><INPUT type="text" name="E01LCMRB2" size="45" maxlength="35" value="<%=msg.getE01LCMRB2()%>"></TD>
  </TR>
  <TR id="">
    <TD width="35%"></TD>
    <TD align="left"><INPUT type="text" name="E01LCMRB3" size="45" maxlength="35" value="<%=msg.getE01LCMRB3()%>"></TD>
  </TR>
  <TR id="">
    <TD></TD>
    <TD align="left"><INPUT type="text" name="E01LCMRB4" size="45" maxlength="35" value="<%=msg.getE01LCMRB4()%>"></TD>
  </TR>
  <TR id="">
    <TD align="right" valign="bottom">Sate :</TD>
    <TD align="left" valign="bottom" nowrap><INPUT type="text" name="E01LCMRB5" size="2" maxlength="2" value="<%=msg.getE01LCMRB5()%>">
        <A href="javascript:GetCodeCNOFC('E01LCMRB5','84')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></A> 
        Zip Code :
        <INPUT type="text" name="E01LCMRB6" size="11" maxlength="10" value="<%=msg.getE01LCMRB6()%>">
        Country :
        <INPUT type="text" name="E01LCMRB7" size="4" maxlength="4" value="<%=msg.getE01LCMRB7()%>">
        <A href="javascript:GetCodeCNOFC('E01LCMRB7','03')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></A>
     </TD>
  </TR>
</TABLE>
<BR>
<TABLE border="0" cellpadding="2"  cellspacing="0" class="tableinfo" width="100%" align="center">
  <TR id="trdark">
    <TD colspan="2" align="center" valign="middle"><FONT size="medium"><B>Issuing Bank</B></FONT></TD>
  </TR>
  <TR id="">
    <TD align="right" nowrap="NOWRAP">Customer or  Account Number :</TD>
    <TD nowrap><SELECT name="E01LCMAF1">
			        <OPTION value=" "></OPTION>
			        <OPTION value="C" <%if (msg.getE01LCMAF1().equals("C")) out.print("selected");%>>CIF</OPTION>
			        <OPTION value="A" <%if (msg.getE01LCMAF1().equals("A")) out.print("selected");%>>DDA</OPTION>
			    </SELECT>
        <INPUT type="text" name="E01LCMIBA" size="12" maxlength="12" value="<%=msg.getE01LCMIBA()%>">
        <A href="javascript: GetCustomerDetailsLC('E01LCMIBA','E01LCMIB1','E01LCMIB2','E01LCMIB3','E01LCMIB4','E01LCMIB5','E01LCMIB6','','')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." onClick="javascript: document.forms[0].E01LCMAF1.selectedIndex = 1" border="0"></A> 
        Customer or 
        <A href="javascript: GetAccByClient('E01LCMIBA','','RT','','E01LCMIB1')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." onClick="javascript: document.forms[0].E01LCMAF1.selectedIndex = 2" border="0"></A> 
        Account
     </TD>
  </TR>
  <TR id="">
    <TD width="35%" align="right">Swift BIC :</TD>
    <TD align="left" nowrap><INPUT type="text" name="E01LCMIBI" size="14" maxlength="12" value="<%=msg.getE01LCMIBI()%>">
      <A href="javascript:GetSwiftIdDesc('E01LCMIBI','','','')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"  border="0"></A>
    </TD>
  </TR>
  <TR id="">
    <TD align="right">Name :</TD>
    <TD align="left" nowrap><INPUT type="text" name="E01LCMIB1" size="45" maxlength="35" value="<%=msg.getE01LCMIB1()%>">
      <A href="javascript:GetCorrespondentDescIdSwift('E01LCMIBI','','')"></A>
    </TD>
  </TR>
  <TR id="">
    <TD align="right">Address :</TD>
    <TD align="left"><INPUT type="text" name="E01LCMIB2" size="45" maxlength="35" value="<%=msg.getE01LCMIB2()%>">    </TD>
  </TR>
  <TR id="">
    <TD></TD>
    <TD align="left"><INPUT type="text" name="E01LCMIB3" size="45" maxlength="35" value="<%=msg.getE01LCMIB3()%>"></TD>
  </TR>
  <TR id="">
    <TD></TD>
    <TD align="left"><INPUT type="text" name="E01LCMIB4" size="45" maxlength="35" value="<%=msg.getE01LCMIB4()%>">    </TD>
  </TR>
  <TR id="">
    <TD align="right" valign="bottom">State :</TD>
    <TD align="left" valign="bottom" nowrap><INPUT type="text" name="E01LCMIB5" size="2" maxlength="2" value="<%=msg.getE01LCMIB5()%>">
        <A href="javascript:GetCodeCNOFC('E01LCMIB5','84')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></A> 
        Zip Code :
        <INPUT type="text" name="E01LCMIB6" size="11" maxlength="10" value="<%=msg.getE01LCMIB6()%>">
        Country :
        <INPUT type="text" name="E01LCMIB7" size="4" maxlength="4" value="<%=msg.getE01LCMIB7()%>">
        <A href="javascript:GetCodeCNOFC('E01LCMIB7','03')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></A> 
     </TD>
  </TR>
</TABLE>
<BR>

<DIV align="center"><P><INPUT id="EIBSBTN" type=submit name="Submit" value="Submit"></P></DIV>

</FORM>
</BODY>
</HTML>
