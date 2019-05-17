<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Apertura de Carta de Credito</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<SCRIPT language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id="msgLC" class="datapro.eibs.beans.ELC050002Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<SCRIPT LANGUAGE="javascript">
<%if (!userPO.getPurpose().equals("NEW")){%>
	builtNewMenu(lc_opening);
	initMenu();
<%}%>
</SCRIPT>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 } 

%>
 
</HEAD>
<BODY>
<H3 align="center">Letter Of Credit [Details]<IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="lc_details.jsp,ELC0500"></H3> 

<HR size="4">
<FORM method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0500" >

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="6">
<TABLE cellspacing="1" cellpadding="2" width="100%" border="0" class="tableinfo" id="trclear">
    <TR id="trdark">
      <TD width="20%" align="right" nowrap="nowrap"><B>Bank</B></TD>
      <TD width="26%" nowrap="nowrap"><INPUT type="text" name="E02LCMBNK" 
							size="4" maxlength="2" value="<%=msgLC.getE02LCMBNK().trim()%>" readonly></TD>
      <TD width="25%" align="right" nowrap="nowrap"><B>Letter of Credit Number</B></TD>
      <TD width="29%" nowrap="nowrap"><B>
        <%if (msgLC.getE02LCMACC().trim().equals("999999999999"))
				{%>
        <INPUT type="text" size="12" maxlength="14" value="Nuevo" readonly>
        <INPUT type="hidden" name="E02LCMACC"
							value="<%=msgLC.getE02LCMACC().trim()%>" disabled>
        <%}
				else
				{%>
        <INPUT type="text" name="E02LCMACC" size="14" maxlength="12"
							value="<%=msgLC.getE02LCMACC().trim()%>" readonly>
        <%}%>
      </B></TD>
    </TR>
    <TR>
      <TD align="right" nowrap="nowrap"><B>Our Reference</B></TD>
      <TD nowrap="nowrap"><INPUT type="text" name="E02LCMORF" size="20"
							maxlength="16" value="<%=msgLC.getE02LCMORF().trim()%>" readonly></TD>
      <TD align="right" nowrap="nowrap"><B>Product</B></TD>
      <TD nowrap="nowrap"><B>
        <INPUT type="text" name="E02LCMPRO" size="4"
							maxlength="4" value="<%=msgLC.getE02LCMPRO().trim()%>" readonly>
      </B></TD>
    </TR>
    <TR id="trdark">
      <TD align="right" nowrap="nowrap"><B>Their Reference</B></TD>
      <TD nowrap="nowrap"><B>
        <INPUT type="text" name="E02LCMTRF"
							size="20" maxlength="16" value="<%=msgLC.getE02LCMTRF().trim()%>" readonly>
      </B></TD>
      <TD align="right" nowrap="nowrap"><B>Product Description</B></TD>
      <TD nowrap="nowrap"><B>
        <INPUT type="text" name="E02DSCPRO"
							size="42" maxlength="35" value="<%=userPO.getHeader2().trim()%>" readonly>
      </B></TD>
    </TR>
  </TABLE>
  <BR>
<H4>Letter Of Credit Information</H4>
<TABLE class="tableinfo">
    <TR > 
      <TD nowrap> 
        <TABLE cellpadding="2" cellspacing="0" width="100%" border="0">
           <TBODY><TR id="trdark"> 
            <TD width="25%" align="right" nowrap> 
              Issuing Date :</TD>
            <TD nowrap width="25%"> 
              <INPUT type="text" name="E02LCMID1" size="2" maxlength="2" value='<%= (msgLC.getE02LCMID1().trim().equals("0") ? "":msgLC.getE02LCMID1().trim())%>' onKeyPress="enterInteger()">
              <INPUT type="text" name="E02LCMID2" size="2" maxlength="2" value='<%= (msgLC.getE02LCMID2().trim().equals("0") ? "":msgLC.getE02LCMID2().trim())%>' onKeyPress="enterInteger()">
              <INPUT type="text" name="E02LCMID3" size="2" maxlength="2" value='<%  if(msgLC.getE02LCMID3().length() < 2 && !msgLC.getE02LCMID3().equals("0"))
							out.print("0");
					out.print((msgLC.getE02LCMID3().trim().equals("0") ? "":msgLC.getE02LCMID3().trim()));%>' onKeyPress="enterInteger()">
              <A href="javascript:DatePicker(document.forms[0].E02LCMID1,document.forms[0].E02LCMID2,document.forms[0].E02LCMID3)"><IMG src="<%=request.getContextPath()%>/images/calendar.gif" alt="Help" align="middle" border="0"></A>
              <IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" border="0">  			</TD>
            <TD width="25%" align="right" nowrap> 
              Expiration Date :</TD>
            <TD nowrap width="27%"> 
              <INPUT type="text" name="E02LCMEX1" size="2" maxlength="2" value='<%= (msgLC.getE02LCMEX1().trim().equals("0") ? "":msgLC.getE02LCMEX1().trim())%>' onKeyPress="enterInteger()">
              <INPUT type="text" name="E02LCMEX2" size="2" maxlength="2" value='<%= (msgLC.getE02LCMEX2().trim().equals("0") ? "":msgLC.getE02LCMEX2().trim())%>' onKeyPress="enterInteger()">
              <INPUT type="text" name="E02LCMEX3" size="2" maxlength="2" value='<%  if(msgLC.getE02LCMEX3().length() < 2 && !msgLC.getE02LCMEX3().equals("0"))
							out.print("0");
					out.print((msgLC.getE02LCMEX3().trim().equals("0") ? "":msgLC.getE02LCMEX3().trim()));%>' onKeyPress="enterInteger()">
              <A href="javascript:DatePicker(document.forms[0].E02LCMEX1,document.forms[0].E02LCMEX2,document.forms[0].E02LCMEX3)"><IMG src="<%=request.getContextPath()%>/images/calendar.gif" alt="Help" align="middle" border="0"></A> 
            <IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" border="0"></TD>
          </TR>   
           <TR id="trclear"> 
            <TD width="25%" align="right" nowrap> 
              Last Date for Shipment :</TD>
            <TD nowrap width="25%"> 
              <INPUT type="text" name="E02LCMSD1" size="2" maxlength="2" value='<%= (msgLC.getE02LCMSD1().trim().equals("0") ? "":msgLC.getE02LCMSD1().trim())%>' onKeyPress="enterInteger()">
              <INPUT type="text" name="E02LCMSD2" size="2" maxlength="2" value='<%= (msgLC.getE02LCMSD2().trim().equals("0") ? "":msgLC.getE02LCMSD2().trim())%>' onKeyPress="enterInteger()">
              <INPUT type="text" name="E02LCMSD3" size="2" maxlength="2" value='<%  if(msgLC.getE02LCMSD3().length() < 2 && !msgLC.getE02LCMSD3().equals("0"))
							out.print("0");
					out.print((msgLC.getE02LCMSD3().trim().equals("0") ? "":msgLC.getE02LCMSD3().trim()));%>' onKeyPress="enterInteger()">
			  <A href="javascript:DatePicker(document.forms[0].E02LCMSD1,document.forms[0].E02LCMSD2,document.forms[0].E02LCMSD3)"><IMG src="<%=request.getContextPath()%>/images/calendar.gif" alt="Help" align="middle" border="0"></A>  			</TD>
            <TD width="25%" align="right" nowrap> 
              Confirmation Date :</TD>
            <TD nowrap width="27%"> 
              <INPUT type="text" name="E02LCMCN1" size="2" maxlength="2" value='<%= (msgLC.getE02LCMCN1().trim().equals("0") ? "":msgLC.getE02LCMCN1().trim())%>' onKeyPress="enterInteger()">
              <INPUT type="text" name="E02LCMCN2" size="2" maxlength="2" value='<%= (msgLC.getE02LCMCN2().trim().equals("0") ? "":msgLC.getE02LCMCN2().trim())%>' onKeyPress="enterInteger()">
              <INPUT type="text" name="E02LCMCN3" size="2" maxlength="2" value='<%  if(msgLC.getE02LCMCN3().length() < 2 && !msgLC.getE02LCMCN3().equals("0"))
							out.print("0");
					out.print((msgLC.getE02LCMCN3().trim().equals("0") ? "":msgLC.getE02LCMCN3().trim()));%>' onKeyPress="enterInteger()">
              <A href="javascript:DatePicker(document.forms[0].E02LCMCN1,document.forms[0].E02LCMCN2,document.forms[0].E02LCMCN3)"><IMG src="<%=request.getContextPath()%>/images/calendar.gif" alt="Help" align="middle" border="0"></A>            </TD>
          </TR>                        
           <TR id="trdark"> 
            <TD width="25%" align="right" nowrap> 
              Currency :</TD>
            <TD nowrap width="25%"><INPUT name="E02LCMCCY" type="text" disabled value="<%= msgLC.getE02LCMCCY().trim()%>" size="4" maxlength="4">
              <A href="javascript:GetCurrency('E02LCMFCY',document.forms[0].E02LCMBNK.value)"></A>            </TD>
            <TD width="25%" align="right" nowrap> 
              Foreing Exchange Rate :</TD>
            <TD nowrap width="27%"> 
              <INPUT type="text" name="E02LCMOFX" size="12" maxlength="11" value="<%= msgLC.getE02LCMOFX().trim()%>" disabled="disabled"> 			</TD>
          </TR>                        
           <TR id="trclear"> 
            <TD width="25%" align="right" nowrap> 
              Cost Center:</TD>
            <TD nowrap width="25%"><input type="text" name="E02LCMCCN" size="9" maxlength="8" value="<%= msgLC.getE02LCMCCN().trim()%>">
              <A href="javascript:GetCostCenter('E02LCMCCN',document.forms[0].E02LCMBNK.value)"><IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></A>            </TD>
            <TD width="25%" align="right" nowrap> 
              Original Amount :</TD>
            <TD nowrap width="27%"> 
              <INPUT type="text" name="E02LCMOAM" size="17" maxlength="16" value="<%= msgLC.getE02LCMOAM().trim()%>" onKeyPress="enterDecimal()">
 			<IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" border="0"></TD>
          </TR>         
           <TR id="trdark"> 
            <TD width="25%" align="right" nowrap> 
              About Clause :</TD>
            <TD width="25%" align="left" nowrap> 
                	<INPUT type="radio" name="E02LCMABC" value="Y" <% if(msgLC.getE02LCMABC().equals("Y")) out.print("checked");%>>Si
                	<INPUT type="radio" name="E02LCMABC" value="N" <% if(msgLC.getE02LCMABC().equals("N")) out.print("checked");%>>No
    	        &nbsp; &nbsp; &nbsp; Percentage: <INPUT type="text" name="E02LCMABP" size="2" maxlength="2"
				value="<%if(msgLC.getE02LCMABP().trim().length() == 1 && !msgLC.getE02LCMABP().trim().equals("0")) out.print("0");%><%= msgLC.getE02LCMABP().trim()%>" onKeyPress="enterInteger()">
    	        <INPUT type="text" name="E02LCMAPM" size="2" maxlength="2"
				value="<%if(msgLC.getE02LCMAPM().trim().length() == 1 && !msgLC.getE02LCMAPM().trim().equals("0")) out.print("0");%><%= msgLC.getE02LCMAPM().trim()%>" onKeyPress="enterInteger()"></TD>
            <TD width="25%" align="right" nowrap> 
              Incoterms :</TD>
            <TD nowrap width="27%"> 
              <INPUT type="text" name="E02LCMITR" size="4" maxlength="4" value="<%= msgLC.getE02LCMITR().trim()%>">
              <A href="javascript:GetCodeCNOFC('E02LCMITR','11')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></A> 			</TD>
          </TR>           
          <TR id="trclear"> 
            <TD width="25%" align="right" nowrap> 
              Tenor :</TD>
            <TD nowrap width="25%"> 
				<SELECT name="E02LCMTNR">
                	<OPTION value=" "></OPTION>
                	<OPTION value="S" <% if(msgLC.getE02LCMTNR().equals("S")) out.print("selected");%>>Sight Payment</OPTION>
                	<OPTION value="A" <% if(msgLC.getE02LCMTNR().equals("A")) out.print("selected");%>>Acceptance</OPTION>
                	<OPTION value="M" <% if(msgLC.getE02LCMTNR().equals("M")) out.print("selected");%>>Mixed Payment</OPTION>
                	<OPTION value="D" <% if(msgLC.getE02LCMTNR().equals("D")) out.print("selected");%>>Deferred Payment</OPTION>
                	<OPTION value="N" <% if(msgLC.getE02LCMTNR().equals("N")) out.print("selected");%>>Negotiation</OPTION>
              	</SELECT>
            <IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" border="0"></TD>
            <TD width="25%" align="right" nowrap> 
              Confirmed :</TD>
            <TD nowrap width="27%"> 
                	<INPUT type="radio" name="E02LCMCNF" value="Y" <% if(msgLC.getE02LCMCNF().equals("Y")) out.print("checked");%>>Yes
                	<INPUT type="radio" name="E02LCMCNF" value="N" <% if(msgLC.getE02LCMCNF().equals("N")) out.print("checked");%>>
                	No</TD>
          </TR>   
          <TR id="trdark"> 
            <TD width="25%" align="right" nowrap> 
              Add Confirmation :</TD>
            <TD nowrap width="25%"> 
                	<INPUT type="radio" name="E02LCMCNO" value="Y" <% if(msgLC.getE02LCMCNO().equals("Y")) out.print("checked");%>>Yes
                	<INPUT type="radio" name="E02LCMCNO" value="N" <% if(msgLC.getE02LCMCNO().equals("N")) out.print("checked");%>>
                	No</TD>
            <TD width="25%" align="right" nowrap> 
              Transferable :</TD>
            <TD nowrap width="27%"> 
                	<INPUT type="radio" name="E02LCMTRN" value="Y" <% if(msgLC.getE02LCMTRN().equals("Y")) out.print("checked");%>>Yes
                	<INPUT type="radio" name="E02LCMTRN" value="N" <% if(msgLC.getE02LCMTRN().equals("N")) out.print("checked");%>>
                	No</TD>
          </TR>       
          <TR id="trclear"> 
            <TD width="25%" align="right" nowrap> 
              Partial Shipments :</TD>
            <TD nowrap width="25%"> 
                	<INPUT type="radio" name="E02LCMPSH" value="Y" <% if(msgLC.getE02LCMPSH().equals("Y")) out.print("checked");%>>Yes
                	<INPUT type="radio" name="E02LCMPSH" value="N" <% if(msgLC.getE02LCMPSH().equals("N")) out.print("checked");%>>
                	No</TD>
            <TD width="25%" align="right" nowrap>
            	Transshipment :</TD>
            <TD nowrap width="27%">
                	<INPUT type="radio" name="E02LCMTSH" value="Y" <% if(msgLC.getE02LCMTSH().equals("Y")) out.print("checked");%>>Yes
                	<INPUT type="radio" name="E02LCMTSH" value="N" <% if(msgLC.getE02LCMTSH().equals("N")) out.print("checked");%>>
                	No</TD>
          </TR>  
          <TR id="trdark">
            <TD width="25%" align="right" nowrap> 
              Agent :</TD>
            <TD nowrap width="25%"> 
            <INPUT type="text" name="E02LCMBRK" size="3" maxlength="3" value="<%= msgLC.getE02LCMBRK().trim()%>">
			<!--<A href="javascript:GetBrokerI('T','D')">-->
			<A href="javascript:GetBroker('E02LCMBRK')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="bottom" border="0"></A></TD>
            <TD width="25%" align="right" nowrap> 
              Cash Collateral Percent :</TD>
            <TD nowrap width="27%"><input type="text" name="E02LCMCPE" size="17" maxlength="16" value="<%= msgLC.getE02LCMCPE().trim()%>" onKeyPress="enterDecimal()"></TD>
          </TR>   
          <TR id="trclear"> 
            <TD width="25%" align="right" nowrap> 
              Cash Collateral Amount :</TD>
            <TD nowrap width="25%"> 
				<INPUT type="text" name="E02LCMCAM" size="17" maxlength="16" value="<%= msgLC.getE02LCMCAM().trim()%>" onKeyPress="enterDecimal()" >            </TD>
            <TD width="25%" align="right" nowrap> 
              Cash Collateral Account :</TD><TD nowrap width="27%">
					<TABLE>
						<TR>
							<TD rowspan="2"><INPUT type="text" name="E02LCMCCA" size="17" maxlength="16" value="<%= msgLC.getE02LCMCCA().trim()%>"></TD>
							<TD>G/L<BR>Account</TD>
							<TD rowspan="2"><A href="javascript:GetLedger('E02LCMCCA',document.forms[0].E02LCMBNK.value,'','')">
							<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></A></TD>
							<TD>Customer<BR>Account</TD>
							<TD rowspan="2"><A href="javascript: GetAccByClient('E02LCMCCA','','RT','','')">
							<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></A></TD>
						</TR>
					</TABLE>
					</TD>
          </TR>
				<TR id="trdark"> 
            <TD nowrap width="25%" align="right">Commissions Table :</TD>
            <TD nowrap width="25%"> 
				<INPUT type="text" name="E02LCMTAR" size="2" maxlength="2" value="<%= msgLC.getE02LCMTAR().trim()%>">
				<A href="javascript:GetTariffLC('E02LCMTAR','<%=msgLC.getE02LCMATY()%>','<%=msgLC.getE02LCMCBC()%>','')">
				<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></A> 
            <IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" border="0"></TD>
            <TD align="right" nowrap> Charges for Account Of :</TD>
            <TD nowrap><SELECT name="E02LCMAOB">
                <OPTION value=" "></OPTION>
                <OPTION value="A" <% if(msgLC.getE02LCMAOB().equals("A")) out.print("selected");%>>Applicant</OPTION>
                <OPTION value="B" <% if(msgLC.getE02LCMAOB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
              </SELECT>
                <IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" border="0"></TD>
			 </TR>   
          <TR id="trclear">
            <TD align="right" nowrap>Customer Line of Credit :</TD>
            <TD nowrap><INPUT type="text" name="E02LCMLNR" size="10" maxlength="9" value="<%= msgLC.getE02LCMLNR().trim()%>" onKeyPress="enterInteger()">
                <A href="javascript:GetCustomer('E02LCMLNR')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></A>
                <INPUT type="text" name="E02LCMCMN" size="4" maxlength="4" value="<%= msgLC.getE02LCMCMN().trim()%>" onKeyPress="enterInteger()">
				<A href="javascript:GetCreditLine('E02LCMCMN',document.forms[0].E02LCMLNR.value)">
				<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></A></TD> 
		    <TD nowrap width="27%" align="right">ALADI Reference  Number :</TD>
            <TD nowrap width="27%"><INPUT type="text" name="E02LCMSRF" size="17" maxlength="16" value="<%= msgLC.getE02LCMSRF().trim()%>" disabled>              </TD>
          </TR>        
          <TR id="trdark"> 
            <TD width="25%" align="right" nowrap>Opening Comm at Issuance :</TD>
            <TD nowrap width="25%">
                	<INPUT type="radio" name="E02LCMOCI" value="Y" <% if(msgLC.getE02LCMOCI().equals("Y")) out.print("checked");%>>Yes
                	<INPUT type="radio" name="E02LCMOCI" value="N" <% if(msgLC.getE02LCMOCI().equals("N")) out.print("checked");%>>
                	No</TD>
            <TD width="25%" align="right" nowrap> 
              Amendment Comm at Issuance :</TD>
            <TD nowrap width="27%">
                	<INPUT type="radio" name="E02LCMACI" value="Y" <% if(msgLC.getE02LCMACI().equals("Y")) out.print("checked");%>>Yes
                	<INPUT type="radio" name="E02LCMACI" value="N" <% if(msgLC.getE02LCMACI().equals("N")) out.print("checked");%>>
                	No</TD>
          </TR>
			<TR id="trclear">
			  <TD width="25%" align="right" nowrap>Place of Expiration :</TD>
				<TD nowrap width="25%"> 
				<INPUT type="text" name="E02LCMPLE" size="29" maxlength="29" value="<%= msgLC.getE02LCMPLE().trim()%>">
            <IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" border="0"></TD>
				
				<TD width="25%" align="right" nowrap>Reference to Pre-Advise  :</TD><TD nowrap width="27%"><INPUT
						type="text" name="E02LCMRF1" size="18" maxlength="16"
						value="<%= msgLC.getE02LCMRF1().trim()%>"></TD>
			</TR>
				<TR id="trdark">
					<TD width="25%" align="right" nowrap> 
              Applicable Rules:</TD>
					<TD nowrap width="27%" colspan="3"><SELECT name="E02LCMAPR">
						<OPTION value=""></OPTION>
						<OPTION value="1" <% if(msgLC.getE02LCMAPR().equals("1") || msgLC.getE02LCMAPR().equals("")) out.print("selected");%>>UCP Latest Version</OPTION>
						<OPTION value="2" <% if(msgLC.getE02LCMAPR().equals("2")) out.print("selected");%>>EUCP Latest Version</OPTION>
						<OPTION value="3" <% if(msgLC.getE02LCMAPR().equals("3")) out.print("selected");%>>UCPURR Latest Version</OPTION>
						<OPTION value="4" <% if(msgLC.getE02LCMAPR().equals("4")) out.print("selected");%>>EUCPURR Latest Version</OPTION>
						<OPTION value="5" <% if(msgLC.getE02LCMAPR().equals("5")) out.print("selected");%>>ISP Latest Version</OPTION>
						<OPTION value="6" <% if(msgLC.getE02LCMAPR().equals("6")) out.print("selected");%>>Other</OPTION>
					</SELECT> <IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" border="0">
					<INPUT type="text" name="E02LCMST3" size="40" maxlength="35" value="<%= msgLC.getE02LCMST3().trim()%>"></TD>
				</TR>
				<TR id="trclear">
			    <TD width="25%" align="right" nowrap>Place of Taking in Charge / Place of Receipt :</TD>
				<TD nowrap width="27%" colspan="3">
                <INPUT type="text" name="E02LCMPLR" size="100" maxlength="65" value="<%= msgLC.getE02LCMPLR().trim()%>">           </TD>
			 </TR>
			 <TR id="trdark">
				  <TD width="25%" align="right" nowrap>Place of Loading / Airport of Departure :</TD>
					<TD nowrap width="27%" colspan="3">
                <INPUT type="text" name="E02LCMPOL" size="100" maxlength="65" value="<%= msgLC.getE02LCMPOL().trim()%>"></TD>
				</TR>
				<TR id="trclear">
				<TD width="25%" align="right" nowrap>Port of Discharge / Airport of Destination :</TD>
					<TD nowrap width="27%" colspan="3"><INPUT type="text" name="E02LCMPOD" size="100" maxlength="65" value="<%= msgLC.getE02LCMPOD().trim()%>"></TD>
				</TR>
			<TR id="trdark">
				<TD width="25%" align="right" nowrap>Place of Final Destination / Place of Delivery :</TD><TD nowrap width="27%" colspan="3">
				<INPUT type="text" name="E02LCMPLD" size="100" maxlength="65" value="<%= msgLC.getE02LCMPLD().trim()%>"></TD>
			</TR>
				<TR id="trclear">
				  <TD align="right" nowrap>Available with :</TD>
				  <TD align="left" nowrap><INPUT type="text" name="E02LCMAWI" size="14" maxlength="12" value="<%= msgLC.getE02LCMAWI().trim()%>">
				  <A href="javascript:GetSwiftIdDesc('E02LCMAWI','','','')">
		                  	<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></A></TD>
				  <TD align="right" nowrap>Drawee Bank: </TD>
				  <TD align="left" nowrap><INPUT type="text" name="E02LCMDWI" size="14" maxlength="12" value="<%= msgLC.getE02LCMDWI().trim()%>">
			      <A href="javascript:GetSwiftIdDesc('E02LCMDWI','','','')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></A></TD>
		     </TR>
			
		    <TR id="trclear">
				  <TD width="25%" align="right" nowrap>Generate Swift :</TD>
				  <TD nowrap width="25%"><INPUT type="radio" name="E02LCMSWF" value="Y" <% if(!msgLC.getE02LCMSWF().equals("N")) out.print("checked");%>>
				    Yes
				    <INPUT type="radio" name="E02LCMSWF" value="N" <% if( msgLC.getE02LCMSWF().equals("N")) out.print("checked");%>>
				    No </TD>
				  <TD align="right" nowrap> Swift Message Type : </TD>
				  <TD align="left" nowrap><SELECT name="E02LCMSMT">
                      <OPTION value="710" <% if(msgLC.getE02LCMSMT().equals("710")) out.print("selected");%>>MT710</OPTION>
                      <OPTION value="705" <% if(msgLC.getE02LCMSMT().equals("705")) out.print("selected");%>>MT705</OPTION>
                      <OPTION value="730" <% if(msgLC.getE02LCMSMT().equals("730")) out.print("selected");%>>MT730</OPTION>
                      <OPTION value="700" <% if(msgLC.getE02LCMSMT().equals("700")) out.print("selected");%>>MT700</OPTION>
                  </SELECT></TD>
			 </TR>
		  </TBODY></TABLE>
      </TD>
    </TR>
  </TABLE>  
  <DIV align="center"> 
  <H4 style="text-align:center">
  	<INPUT type="checkbox" name="H02FLGWK2" value="A" <% if(msgLC.getH02FLGWK2().equals("A")){ out.print("checked");} %>>
      Accept with Warnings</H4>
  <INPUT type="hidden" name="H02FLGWK1" value="">
  <INPUT id="EIBSBTN" type=submit name="Submit" value="Submit"> &nbsp; &nbsp; &nbsp;
  <INPUT id="EIBSBTN" type="submit" name="Submit0" value="Finish" onClick="document.forms[0].H02FLGWK1.value='Y'"> &nbsp; &nbsp; &nbsp;
  </DIV>
</FORM>
</BODY>
</HTML>
