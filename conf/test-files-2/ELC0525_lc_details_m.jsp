<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Mantenimiento de Carta de Credito</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<SCRIPT language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id="msg" class="datapro.eibs.beans.ELC051002Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

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
<BODY>
<H3 align="center">Comercial Letter Of Credit Approval Inquiry [Credit Conditions]
	<IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="lc_details_m.jsp, ELC0525"></H3>
<HR size="4">
<FORM>
<TABLE cellspacing="0" cellpadding="2" width="100%" border="0" class="tableinfo" id="trclear">
    <TR id="trdark">
      <TD width="20%" align="right" nowrap="nowrap"><B>Bank :</B></TD>
      <TD width="26%" nowrap="nowrap"><INPUT type="text" name="E02LCMBNK" 
							size="4" maxlength="2" value="<%=msg.getE02LCMBNK().trim()%>" readonly></TD>
      <TD width="25%" align="right" nowrap="nowrap"><B>Letter of Credit Number :</B></TD>
      <TD width="29%" nowrap="nowrap"><B>
        <%if (msg.getE02LCMACC().trim().equals("999999999999"))
				{%>
        <INPUT type="text" size="12" maxlength="12" value="New" readonly>
        <INPUT name="E02LCMACC" type="hidden" disabled
							value="<%=msg.getE02LCMACC().trim()%>" readonly="readonly">
        <%}
				else
				{%>
        <INPUT type="text" name="E02LCMACC" size="14" maxlength="12"
							value="<%=msg.getE02LCMACC().trim()%>" readonly>
        <%}%>
      </B></TD>
    </TR>
    <TR>
      <TD align="right" nowrap="nowrap"><B>Our Reference :</B></TD>
      <TD nowrap="nowrap"><INPUT type="text" name="E02LCMORF" size="20"
							maxlength="16" value="<%=msg.getE02LCMORF().trim()%>" readonly></TD>
      <TD align="right" nowrap="nowrap"><B>Product :</B></TD>
      <TD nowrap="nowrap"><B>
        <INPUT type="text" name="E02LCMPRO" size="4"
							maxlength="4" value="<%=msg.getE02LCMPRO().trim()%>" readonly>
      </B></TD>
    </TR>
    <TR id="trdark">
      <TD align="right" nowrap="nowrap"><B>Their Reference :</B></TD>
      <TD nowrap="nowrap"><B>
        <INPUT type="text" name="E02LCMTRF"
							size="20" maxlength="16" value="<%=msg.getE02LCMTRF().trim()%>" readonly>
      </B></TD>
      <TD align="right" nowrap="nowrap"><B>Product Description :</B></TD>
      <TD nowrap="nowrap"><B>
        <INPUT type="text" name="E02DSCPRO"
							size="42" maxlength="35" value="<%=userPO.getHeader2().trim()%>" readonly>
      </B></TD>
    </TR>
  </TABLE>

  <H4>Operation Type</H4>
  <TABLE class="tableinfo">
    <TBODY>
      <TR>
        <TD nowrap><TABLE cellspacing="0" cellpadding="2" width="100%" border="0"
				class="tbhead">
            <TBODY>
              <TR id="trdark">
                <TD nowrap width="16%"align="right"><B>Amendment :</B></TD>
                <TD nowrap width="20%" align="left">
                  <% if (msg.getE02LCMAMF().equals("Y")) out.print("YES"); else out.print("NO");%>
                  <INPUT name="E02LCMLAN" type="HIDDEN"
							value="<%= msg.getE02LCMLAN().trim()%>" readonly="readonly"></TD>
                <TD nowrap width="16%"align="right"><B>Last Amendment :</B></TD>
                <TD nowrap width="16%"><DIV align="left"><B>
                    <INPUT name="E02LCMLAN" type="text" disabled value="<%= msg.getE02LCMLAN().trim()%>" size="4" maxlength="4" readonly="readonly">
                    </B></DIV>
                  <INPUT name="E02LCMLAN" type="HIDDEN" value="<%= msg.getE02LCMLAN().trim()%>" readonly="readonly"></TD>
                <TD nowrap width="16%"align="right"><B>Last Amendment Date :</B></TD>
                <TD nowrap width="16%"><DIV align="left"><B>
                    <INPUT name="E02LCMLA1" type="text" disabled value="<%= msg.getE02LCMLA1().trim()%>" size="3"
							maxlength="2" readonly="readonly">
                    <INPUT name="E02LCMLA2" type="text" disabled
							value="<%= msg.getE02LCMLA2().trim()%>" size="3" maxlength="2" readonly="readonly">
                    <INPUT name="E02LCMLA3"
							type="text" disabled
							value="<%= msg.getE02LCMLA3().trim()%>" size="3" maxlength="2" readonly="readonly">
                    </B></DIV>
                  <INPUT name="E02LCMLA1" type="HIDDEN"
							value="<%= msg.getE02LCMLA1().trim()%>" readonly="readonly">
                  <INPUT
							name="E02LCMLA2" type="HIDDEN" value="<%= msg.getE02LCMLA2().trim()%>" readonly="readonly">
                  <INPUT name="E02LCMLA3"
							type="HIDDEN"
							value="<%= msg.getE02LCMLA3().trim()%>" readonly="readonly"></TD>
              </TR>
            </TBODY>
          </TABLE></TD>
      </TR>
    </TBODY>
  </TABLE>
  <H4>Letter Of Credit Information</H4>
  <TABLE class="tableinfo">
    <TR >
      <TD nowrap><TABLE cellpadding="2" cellspacing="0" width="100%" border="0">
          <TBODY>
            <TR id="trdark">
              <TD nowrap width="25%" align="right">Issuing Date :</TD>
              <TD nowrap width="27%"><INPUT name="E02LCMID1" type="text" onKeyPress="enterInteger()" value="<%= (msg.getE02LCMID1().trim().equals("0") ? "":msg.getE02LCMID1().trim())%>" size="2" maxlength="2" readonly="readonly">
                <INPUT name="E02LCMID2" type="text" onKeyPress="enterInteger()" value="<%= (msg.getE02LCMID2().trim().equals("0") ? "":msg.getE02LCMID2().trim())%>" size="2" maxlength="2" readonly="readonly">
                <INPUT name="E02LCMID3" type="text" onKeyPress="enterInteger()" value='<%  if(msg.getE02LCMID3().length() < 2 && !msg.getE02LCMID3().equals("0"))
							out.print("0");
					out.print((msg.getE02LCMID3().trim().equals("0") ? "":msg.getE02LCMID3().trim()));%>' size="2" maxlength="2" readonly="readonly">
                 <IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field"  border="0" > </TD>
              <TD nowrap width="27%" align="right"> Expiration Date :</TD>
              <TD nowrap width="27%"><INPUT name="E02LCMEX1" type="text" onKeyPress="enterInteger()" value="<%= (msg.getE02LCMEX1().trim().equals("0") ? "":msg.getE02LCMEX1().trim())%>" size="2" maxlength="2" readonly="readonly">
                <INPUT name="E02LCMEX2" type="text" onKeyPress="enterInteger()" value="<%= (msg.getE02LCMEX2().trim().equals("0") ? "":msg.getE02LCMEX2().trim())%>" size="2" maxlength="2" readonly="readonly">
                <INPUT name="E02LCMEX3" type="text" onKeyPress="enterInteger()" value='<%  if(msg.getE02LCMEX3().length() < 2 && !msg.getE02LCMEX3().equals("0"))
							out.print("0");
					out.print((msg.getE02LCMEX3().trim().equals("0") ? "":msg.getE02LCMEX3().trim()));%>' size="2" maxlength="2" readonly="readonly">
                 <IMG src="<%=request.getContextPath()%>/images/Check.gif"
						alt="Mandatory Field"  border="0"></TD>
            </TR>
            <TR id="trclear">
              <TD nowrap width="25%" align="right">Latest Date of Shipment :</TD>
              <TD nowrap width="27%"><INPUT name="E02LCMSD1" type="text" onKeyPress="enterInteger()" value="<%= (msg.getE02LCMSD1().trim().equals("0") ? "":msg.getE02LCMSD1().trim())%>" size="2" maxlength="2" readonly="readonly">
                <INPUT name="E02LCMSD2" type="text" onKeyPress="enterInteger()" value="<%= (msg.getE02LCMSD2().trim().equals("0") ? "":msg.getE02LCMSD2().trim())%>" size="2" maxlength="2" readonly="readonly">
                <INPUT name="E02LCMSD3" type="text" onKeyPress="enterInteger()" value='<%  if(msg.getE02LCMSD3().length() < 2 && !msg.getE02LCMSD3().equals("0"))
							out.print("0");
					out.print((msg.getE02LCMSD3().trim().equals("0") ? "":msg.getE02LCMSD3().trim()));%>' size="2" maxlength="2" readonly="readonly">
                 </TD>
              <TD nowrap width="27%" align="right">Confirmation Date :</TD>
              <TD nowrap width="27%"><INPUT name="E02LCMCN1" type="text" onKeyPress="enterInteger()" value="<%= (msg.getE02LCMCN1().trim().equals("0") ? "":msg.getE02LCMCN1().trim())%>" size="2" maxlength="2" readonly="readonly">
                <INPUT name="E02LCMCN2" type="text" onKeyPress="enterInteger()" value="<%= (msg.getE02LCMCN2().trim().equals("0") ? "":msg.getE02LCMCN2().trim())%>" size="2" maxlength="2" readonly="readonly">
                <INPUT name="E02LCMCN3" type="text" onKeyPress="enterInteger()" value='<%  if(msg.getE02LCMCN3().length() < 2 && !msg.getE02LCMCN3().equals("0"))
							out.print("0");
					out.print((msg.getE02LCMCN3().trim().equals("0") ? "":msg.getE02LCMCN3().trim()));%>' size="2" maxlength="2" readonly="readonly">
                 </TD>
            </TR>
            <TR id="trdark">
              <TD nowrap width="25%" align="right">Currency :</TD>
              <TD nowrap width="27%"><INPUT name="E02LCMCCY" type="text" disabled value="<%= msg.getE02LCMCCY().trim()%>" size="4" maxlength="4" readonly="readonly"></TD>
              <TD nowrap width="27%" align="right">Foreing Exchange Rate :</TD>
              <TD nowrap width="27%"><INPUT name="E02LCMOFX" type="text" disabled="disabled" value="<%= msg.getE02LCMOFX().trim()%>" size="12" maxlength="11" readonly="readonly">              </TD>
            </TR>
            <TR id="trclear">
              <TD nowrap width="25%" align="right">Cost Center :</TD>
              <TD nowrap width="27%"><INPUT name="E02LCMCCN" type="text" disabled value="<%= msg.getE02LCMCCN().trim()%>" size="9" maxlength="8" readonly="readonly">
                 </TD>
              <TD nowrap width="27%" align="right">Original Amount :</TD>
              <TD nowrap width="27%"><INPUT name="E02LCMOAM" type="text" value="<%= msg.getE02LCMOAM().trim()%>" size="17" maxlength="16" disabled="disabled">
                <IMG src="<%=request.getContextPath()%>/images/Check.gif"
						alt="Mandatory Field"  border="0"></TD>
            </TR>
            <TR id="trdark">
              <TD nowrap width="25%" align="right">About Clause :</TD>
              <TD nowrap width="27%"><INPUT name="E02LCMABC" type="radio" disabled value="Y" readonly="readonly" <% if(msg.getE02LCMABC().equals("Y")) out.print("checked");%>>
                Yes
                <INPUT name="E02LCMABC" type="radio" disabled value="N" readonly="readonly" <% if(msg.getE02LCMABC().equals("N")) out.print("checked");%>>
                No
                &nbsp; &nbsp; &nbsp; Percentage :
                <INPUT name="E02LCMABP" type="text" onKeyPress="enterInteger()"
				value="<%if(msg.getE02LCMABP().trim().length() == 1 && !msg.getE02LCMABP().trim().equals("0")) out.print("0");%><%= msg.getE02LCMABP().trim()%>" size="2" maxlength="2" readonly="readonly">
                <INPUT name="E02LCMAPM" type="text" onKeyPress="enterInteger()"
				value="<%if(msg.getE02LCMAPM().trim().length() == 1 && !msg.getE02LCMAPM().trim().equals("0")) out.print("0");%><%= msg.getE02LCMAPM().trim()%>" size="2" maxlength="2" readonly="readonly"></TD>
              <TD nowrap width="27%"align="right">Incoterms :</TD>
              <TD nowrap width="27%"><INPUT name="E02LCMITR" type="text" value="<%= msg.getE02LCMITR().trim()%>" size="4" maxlength="4" readonly="readonly">
                 </TD>
            </TR>
            <TR id="trclear">
              <TD nowrap width="25%"align="right">Tenor:</TD>
              <TD nowrap width="27%"><SELECT name="E02LCMTNR" disabled>
                  <OPTION value=" "></OPTION>
                  <OPTION value="S" <% if(msg.getE02LCMTNR().equals("S")) out.print("selected");%>>Payment</OPTION>
                  <OPTION value="A" <% if(msg.getE02LCMTNR().equals("A")) out.print("selected");%>>Acceptance</OPTION>
                  <OPTION value="M" <% if(msg.getE02LCMTNR().equals("M")) out.print("selected");%>>Mixed Payment</OPTION>
                  <OPTION value="D" <% if(msg.getE02LCMTNR().equals("D")) out.print("selected");%>>Deferred Payment</OPTION>
                  <OPTION value="N" <% if(msg.getE02LCMTNR().equals("N")) out.print("selected");%>>Negociation</OPTION>
                </SELECT>
                <IMG src="<%=request.getContextPath()%>/images/Check.gif"
						alt="Mandatory Field" border="0"></TD>
              <TD nowrap width="27%"align="right">Confirmed :</TD>
              <TD nowrap width="27%"><INPUT name="E02LCMCNF" type="radio" value="Y" disabled <% if(msg.getE02LCMCNF().equals("Y")) out.print("checked");%>>
                Yes
                <INPUT name="E02LCMCNF" type="radio" disabled value="N" readonly="readonly" <% if(msg.getE02LCMCNF().equals("N")) out.print("checked");%>>
                No </TD>
            </TR>
            <TR id="trdark">
              <TD nowrap width="25%" align="right">Add Confirmation: </TD>
              <TD nowrap width="27%"><INPUT name="E02LCMCNO" type="radio" disabled value="Y" readonly="readonly" <% if(msg.getE02LCMCNO().equals("Y")) out.print("checked");%>>
                Yes
                <INPUT name="E02LCMCNO" type="radio" disabled value="N" readonly="readonly" <% if(msg.getE02LCMCNO().equals("N")) out.print("checked");%>>
                No </TD>
              <TD nowrap width="27%" align="right">Transferable :</TD>
              <TD nowrap width="27%"><INPUT name="E02LCMTRN" type="radio" disabled value="Y" readonly="readonly" <% if(msg.getE02LCMTRN().equals("Y")) out.print("checked");%>>
                Yes
                <INPUT name="E02LCMTRN" type="radio" disabled value="N" readonly="readonly" <% if(msg.getE02LCMTRN().equals("N")) out.print("checked");%>>
                No </TD>
            </TR>
            <TR id="trclear">
              <TD nowrap width="25%" align="right">Partial Shipments :</TD>
              <TD nowrap width="27%"><INPUT name="E02LCMPSH" type="radio" disabled value="Y" readonly="readonly" <% if(msg.getE02LCMPSH().equals("Y")) out.print("checked");%>>
                Yes
                <INPUT name="E02LCMPSH" type="radio" disabled value="N" readonly="readonly" <% if(msg.getE02LCMPSH().equals("N")) out.print("checked");%>>
                No </TD>
              <TD nowrap width="27%" align="right">Transshipment  :</TD>
              <TD nowrap width="27%"><INPUT name="E02LCMTSH" type="radio" disabled value="Y" readonly="readonly" <% if(msg.getE02LCMTSH().equals("Y")) out.print("checked");%>>
                Yes
                <INPUT name="E02LCMTSH" type="radio" disabled value="N" readonly="readonly" <% if(msg.getE02LCMTSH().equals("N")) out.print("checked");%>>
                No </TD>
            </TR>
            <TR id="trdark">
              <TD nowrap width="25%" align="right">Agent :</TD>
              <TD nowrap width="27%"><INPUT name="E02LCMBRK" type="text"  disabled onKeyPress="enterDecimal()" value="<%= msg.getE02LCMBRK().trim()%>" size="17" maxlength="16" readonly="readonly"></TD>
              <TD nowrap width="27%" align="right"> Cash Collateral Percentage :</TD>
              <TD nowrap width="27%"><INPUT name="E02LCMCPE" type="text" disabled="disabled" onKeyPress="enterDecimal()" value="<%= msg.getE02LCMCPE().trim()%>" size="17" maxlength="16" readonly="readonly"></TD>
            </TR>
            <TR id="trclear">
              <TD nowrap width="25%" align="right">Cash Collateral Amount :</TD>
              <TD nowrap width="27%"><INPUT name="E02LCMCAM" type="text" disabled="disabled" onKeyPress="enterDecimal()" value="<%= msg.getE02LCMCAM().trim()%>" size="17" maxlength="16" readonly="readonly">              </TD>
              <TD nowrap width="27%" align="right">Cash Collateral Account :</TD>
              <TD nowrap width="27%"><TABLE id="trclear">
                  <TBODY>
                    <TR>
                      <TD rowspan="2"><INPUT name="E02LCMCCA" type="text" disabled="disabled" value="<%= msg.getE02LCMCCA().trim()%>" size="17" maxlength="16" readonly="readonly"></TD>
                  </TBODY>
                </TABLE></TD>
            </TR>
            <TR id="trdark">
              <TD nowrap width="25%" align="right">Customer Tariff :</TD>
              <TD nowrap width="27%"><INPUT name="E02LCMTAR" type="text" value="<%= msg.getE02LCMTAR().trim()%>" size="2" maxlength="2" readonly="readonly">
                 
				<IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field"  border="0"></TD>
              <TD align="right">Charges By :</TD>
              <TD nowrap><SELECT name="E02LCMAOB" disabled>
                  <OPTION value=" "></OPTION>
                  <OPTION value="A" <% if(msg.getE02LCMAOB().equals("A")) out.print("selected");%>>Aplicant</OPTION>
                  <OPTION value="B" <% if(msg.getE02LCMAOB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
                </SELECT>
                <IMG src="<%=request.getContextPath()%>/images/Check.gif"
						alt="Mandatory Field"  border="0"></TD>
            </TR>
            <TR id="trclear">
              <TD align="right">Customer Line of Credit :</TD>
              <TD nowrap><INPUT name="E02LCMLNR" type="text" onKeyPress="enterInteger()" value="<%= msg.getE02LCMLNR().trim()%>" size="10" maxlength="9" readonly="readonly">
                
                <INPUT name="E02LCMCMN" type="text" onKeyPress="enterInteger()" value="<%= msg.getE02LCMCMN().trim()%>" size="4" maxlength="4" readonly="readonly">
				</TD>
              <TD nowrap width="27%" align="right">ALADI Reference  Number :</TD>
              <TD nowrap width="27%"><INPUT name="E02LCMSRF"  type="text" disabled value="<%= msg.getE02LCMSRF().trim()%>" size="17" maxlength="16" readonly="readonly">              </TD>
            </TR>
            <TR id="trdark">
              <TD nowrap width="25%" align="right">Opening Comm. at Issuance :</TD>
              <TD nowrap width="27%"><INPUT name="E02LCMOCI" type="radio" disabled  value="Y" readonly="readonly" <% if(msg.getE02LCMOCI().equals("Y")) out.print("checked");%>>
                Yes
                <INPUT name="E02LCMOCI" type="radio" disabled  value="N" readonly="readonly" <% if(msg.getE02LCMOCI().equals("N")) out.print("checked");%>>
                No </TD>
              <TD nowrap width="27%" align="right">Amendment Comm. at Issuance :</TD>
              <TD nowrap width="27%"><INPUT name="E02LCMACI" type="radio" disabled  value="Y" readonly="readonly" <% if(msg.getE02LCMACI().equals("Y")) out.print("checked");%>>
                Yes
                <INPUT name="E02LCMACI" type="radio" disabled  value="N" readonly="readonly" <% if(msg.getE02LCMACI().equals("N")) out.print("checked");%>>
                No </TD>
            </TR>
            <TR id="trclear">
              <TD nowrap width="25%" align="right">Location :</TD>
              <TD nowrap width="27%"><INPUT name="E02LCMPLE" type="text" value="<%= msg.getE02LCMPLE().trim()%>" size="29" maxlength="29" readonly="readonly">
                <IMG src="<%=request.getContextPath()%>/images/Check.gif"
						alt="Mandatory Field"  border="0"></TD>
              <TD width="25%" align="right" nowrap>Reference to Pre-Advise :</TD>
			<TD nowrap width="27%">
				<INPUT type="text" name="E02LCMRF1" size="18" maxlength="16" value="<%= msg.getE02LCMRF1().trim()%>" readonly>
			</TD>
              
            </TR>
            <TR id="trdark">
              <TD nowrap width="25%" align="right">Applicable Rules :</TD>
              <TD nowrap width="27%" colspan="3">              <SELECT name="E02LCMAPR" disabled>
						<OPTION value=""></OPTION>
						<OPTION value="1" <% if(msg.getE02LCMAPR().equals("1")) out.print("selected");%>>UCP Latest Version</OPTION>
						<OPTION value="2" <% if(msg.getE02LCMAPR().equals("2")) out.print("selected");%>>EUCP Latest Version</OPTION>
						<OPTION value="3" <% if(msg.getE02LCMAPR().equals("3")) out.print("selected");%>>UCPURR Latest Version</OPTION>
						<OPTION value="4" <% if(msg.getE02LCMAPR().equals("4")) out.print("selected");%>>EUCPURR Latest Version</OPTION>
						<OPTION value="5" <% if(msg.getE02LCMAPR().equals("5")) out.print("selected");%>>ISP Latest Version</OPTION>
						<OPTION value="6" <% if(msg.getE02LCMAPR().equals("6")) out.print("selected");%>>Other</OPTION>
					</SELECT>  <IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" border="0"> <INPUT
						name="E02LCMST3" type="text" value="<%= msg.getE02LCMST3().trim()%>" size="40" maxlength="35" readonly="readonly"></TD>
            </TR>
				<TR id="trclear">
				  <TD align="right" nowrap>Place of Taking in Charge/Place of Receipt :</TD>
				  <TD nowrap colspan="3"><INPUT name="E02LCMPLR" type="text"
						value="<%= msg.getE02LCMPLR().trim()%>" size="65" maxlength="65" readonly="readonly"></TD>
		    </TR>
				<TR id="trclear">
              <TD nowrap width="25%" align="right">Place of Loading/Airport of Departure :</TD>
              <TD nowrap width="27%" colspan="3"><INPUT name="E02LCMPOL" type="text" value="<%= msg.getE02LCMPOL().trim()%>" size="65" maxlength="65" readonly="readonly"></TD>
            </TR>
            <TR id="trdark">
              <TD nowrap width="25%" align="right">Port of Discharge/Airport of Destination :</TD>
              <TD nowrap width="27%" colspan="3"><INPUT name="E02LCMPOD" type="text" value="<%= msg.getE02LCMPOD().trim()%>" size="65" maxlength="65" readonly="readonly"></TD>
            </TR>
            <TR id="trclear">
              <TD nowrap width="25%" align="right">Place of Final Destination/Place of Delivery :</TD>
              <TD nowrap width="27%" colspan="3"><INPUT name="E02LCMPLD" type="text" value="<%= msg.getE02LCMPLD().trim()%>" size="65" maxlength="65" readonly="readonly"></TD>
            </TR>
            <TR id="trdark">
              <TD align="right" nowrap>Available With ... :</TD>
              <TD align="left" nowrap><INPUT name="E02LCMAWI" type="text" value="<%= msg.getE02LCMAWI().trim()%>" size="14" maxlength="12" readonly="readonly">
                </TD>
              <TD align="right" nowrap>Drawee Bank : </TD>
              <TD align="left" nowrap><INPUT name="E02LCMDWI" type="text" value="<%= msg.getE02LCMDWI().trim()%>" size="14" maxlength="12" readonly="readonly">
                </TD>
            </TR>
         
         
          </TBODY>
        </TABLE></TD>
    </TR>
  </TABLE>
  <H4>Operation Type</H4>
  <TABLE class="tableinfo">
    <TBODY>
      <TR>
        <TD nowrap><TABLE cellspacing="0" cellpadding="2" width="100%" border="0"
				class="tbhead">
            <TBODY>
              <TR id="trdark00">
                <TD nowrap width="16%"align="right">Increase / Decrease :</TD>
                <TD nowrap width="20%" align="left"><SELECT name="E02LCMIDF" disabled>
                  <OPTION value=""> </OPTION>
                  <OPTION value="I" <% if(msg.getE02LCMIDF().equals("I")) out.print("selected");%>>Increase</OPTION>
                  <OPTION value="D" <% if(msg.getE02LCMIDF().equals("D")) out.print("selected");%>>Decrease</OPTION>
                </SELECT></TD>
                <TD nowrap width="16%"align="right">Amount</TD>
                <TD nowrap width="16%"><INPUT name="E02LCMIDA" type="text" onKeyPress="enterDecimal()" value="<%= msg.getE02LCMIDA().trim()%>" size="17" maxlength="16" readonly="readonly"></TD>
              </TR>
            </TBODY>
        </TABLE></TD>
      </TR>
    </TBODY>
  </TABLE>

</FORM>
</BODY>
</HTML>
