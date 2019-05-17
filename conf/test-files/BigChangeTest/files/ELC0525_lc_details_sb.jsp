<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Letter of Credit Details</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<SCRIPT language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id="msg040002" class="datapro.eibs.beans.ELC040002Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

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
<H3 align="center">Standby Letters Of Credit Approval Inquiry [Credit Conditions]
	<IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="lc_details_sb.jsp, ELC0525"></H3>

<HR size="4">
<FORM>
<TABLE cellspacing="0" cellpadding="2" width="100%" border="0" class="tableinfo" id="trclear">
					<TR id="trdark">
						<TD nowrap width="16%" align="right"><B>Bank : </B></TD>
						<TD nowrap width="30%">
						<INPUT type="text" name="E02LCMBNK" size="4" maxlength="2" value="<%=msg040002.getE02LCMBNK().trim()%>" readonly></TD>
						<TD nowrap align="right" width="22%"><B>Letter of Credit Number : </B></TD>
						<TD nowrap width="16%">
						<DIV align="left"><B> <%if (msg040002.getE02LCMACC().trim().equals("999999999999"))
				{%> <INPUT type="text" size="12" maxlength="12" value="New"
							readonly> <INPUT type="hidden" name="E02LCMACC"
							value="<%=msg040002.getE02LCMACC().trim()%>" readonly> <%}
				else
				{%> <INPUT type="text" name="E02LCMACC" size="13" maxlength="12"
							value="<%=(msg040002.getE02LCMACC().trim().equals("0") ? userPO.getIdentifier() : msg040002.getE02LCMACC().trim() )%>" readonly> <%}%> </B></DIV>
						</TD>
					</TR>
					<TR>
						<TD nowrap width="16%" align="right"><B>Our Reference : </B>
						</TD>
						<TD nowrap align="left" width="30%"><INPUT type="text" name="E02LCMORF" size="20"
							maxlength="16" value="<%=msg040002.getE02LCMORF().trim()%>" readonly> 
						</TD>
						<TD nowrap align="right" width="22%"><B>Product : </B></TD>
						<TD nowrap width="16%" align="left"><B> <INPUT type="text" name="E02LCMPRO" size="4"
							maxlength="4" value="<%=msg040002.getE02LCMPRO().trim()%>" readonly>
						</B></TD>

					</TR>
					<TR id="trdark">
						<TD width="16%" align="right" nowrap><B>Their Reference : </B></TD>
						<TD nowrap width="30%"><B> <INPUT type="text" name="E02LCMTRF"
							size="20" maxlength="16" value="<%=msg040002.getE02LCMTRF().trim()%>" readonly>
						</B></TD>

						<TD nowrap align="right" width="22%"><B>Product Description : </B></TD>
						<TD nowrap width="16%" align="left"><B><INPUT type="text" name="E02DSCPRO"
							size="40" maxlength="35" value="<%=userPO.getHeader2().trim()%>"
							readonly> </B></TD>

					</TR>
				</TABLE>

  <H4>Letter Of Credit Information</H4>
  <TABLE class="tableinfo">
    <TR > 
      <TD nowrap> 
        <TABLE cellpadding="2" cellspacing="0" width="100%" border="0">
           <TBODY><TR id="trdark"> 
            <TD nowrap width="25%" align="right">Issuing Date: </TD>
            <TD nowrap width="25%"> 
              <INPUT name="E02LCMID1" type="text" onKeyPress="enterInteger()" value='<%= (msg040002.getE02LCMID1().trim().equals("0") ? "":msg040002.getE02LCMID1().trim())%>' size="2" maxlength="2" readonly="readonly">
              <INPUT name="E02LCMID2" type="text" onKeyPress="enterInteger()" value='<%= (msg040002.getE02LCMID2().trim().equals("0") ? "":msg040002.getE02LCMID2().trim())%>' size="2" maxlength="2" readonly="readonly">
              <INPUT name="E02LCMID3" type="text" onKeyPress="enterInteger()" value='<%  if(msg040002.getE02LCMID3().length() < 2 && !msg040002.getE02LCMID3().equals("0"))
							out.print("0");
					out.print((msg040002.getE02LCMID3().trim().equals("0") ? "":msg040002.getE02LCMID3().trim()));%>' size="2" maxlength="2" readonly="readonly">
              
              <IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" border="0">  			</TD>
            <TD nowrap width="25%" align="right"> Expiration Date: </TD>
            <TD nowrap width="27%"> 
              <INPUT name="E02LCMEX1" type="text" onKeyPress="enterInteger()" value='<%= (msg040002.getE02LCMEX1().trim().equals("0") ? "":msg040002.getE02LCMEX1().trim())%>' size="2" maxlength="2" readonly="readonly">
              <INPUT name="E02LCMEX2" type="text" onKeyPress="enterInteger()" value='<%= (msg040002.getE02LCMEX2().trim().equals("0") ? "":msg040002.getE02LCMEX2().trim())%>' size="2" maxlength="2" readonly="readonly">
              <INPUT name="E02LCMEX3" type="text" onKeyPress="enterInteger()" value='<%  if(msg040002.getE02LCMEX3().length() < 2 && !msg040002.getE02LCMEX3().equals("0"))
							out.print("0");
					out.print((msg040002.getE02LCMEX3().trim().equals("0") ? "":msg040002.getE02LCMEX3().trim()));%>' size="2" maxlength="2" readonly="readonly">
               
            <IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" border="0"></TD>
          </TR>   
           <TR id="trclear"> 
            <TD nowrap width="25%" align="right">Confirmation Date: </TD><TD nowrap width="25%"> 
              <INPUT name="E02LCMCN1" type="text" onKeyPress="enterInteger()" value='<%= (msg040002.getE02LCMCN1().trim().equals("0") ? "":msg040002.getE02LCMCN1().trim())%>' size="2" maxlength="2" readonly="readonly">
              <INPUT name="E02LCMCN2" type="text" onKeyPress="enterInteger()" value='<%= (msg040002.getE02LCMCN2().trim().equals("0") ? "":msg040002.getE02LCMCN2().trim())%>' size="2" maxlength="2" readonly="readonly">
              <INPUT name="E02LCMCN3" type="text" onKeyPress="enterInteger()" value='<%  if(msg040002.getE02LCMCN3().length() < 2 && !msg040002.getE02LCMCN3().equals("0"))
							out.print("0");
					out.print((msg040002.getE02LCMCN3().trim().equals("0") ? "":msg040002.getE02LCMCN3().trim()));%>' size="2" maxlength="2" readonly="readonly">
               
            </TD>
            
            <TD nowrap width="25%" align="right">Cost Center: </TD><TD nowrap width="27%"> 
				<INPUT type="text" name="E02LCMCCN" size="9" maxlength="8" value="<%= msg040002.getE02LCMCCN().trim()%>" readonly> 
				
            </TD>
          </TR>         
           <TR id="trdark"> 
			<TD nowrap width="25%" align="right">Currency: </TD>
            <TD nowrap width="25%"><INPUT type="text" name="E02LCMCCY" size="4" maxlength="4" value="<%= msg040002.getE02LCMCCY().trim()%>" readonly></TD>
            <TD nowrap width="25%" align="right">Original Amount :</TD>
            <TD nowrap width="27%"><INPUT type="text" name="E02LCMOAM" size="17" maxlength="16" value="<%= msg040002.getE02LCMOAM().trim()%>" readonly >
              <IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" border="0"></TD>
          </TR>           
          <TR id="trclear">
            <TD nowrap align="right">Confirmed: </TD>
            <TD nowrap><INPUT name="E02LCMCNF" type="radio" disabled value="Y" readonly="readonly" <% if(msg040002.getE02LCMCNF().equals("Y")) out.print("checked");%>>
              Yes
              <INPUT name="E02LCMCNF" type="radio" disabled value="N" readonly="readonly" <% if(msg040002.getE02LCMCNF().equals("N")) out.print("checked");%>>
              No </TD> 
            <TD nowrap align="right">Add Confirmation: </TD>
            <TD nowrap width="25%" align="left">
                <% 
                	String test = msg040002.getE02LCMCNO().trim();
                	String confirm = null;
                	if(test.equalsIgnoreCase("Y")){
                		confirm =  "CONFIRM";
                	}
                	else if(test.equalsIgnoreCase("N")){
                		confirm = "WITHOUT";
                	}
                	else if(test.equalsIgnoreCase("M")){
                		confirm = "MAY ADD";
                	}
                	else
                		confirm = ""; 
                %>
              	<INPUT name="E02LCMCNO" type="TEXT" size="28" readonly="readonly"  value = "<%= confirm %>">
			</TD>
            
          </TR>   
          <TR id="trdark">
            <TD nowrap align="right">Tenor: </TD>
            <TD nowrap><SELECT name="E02LCMTNR" disabled="disabled">
                <OPTION value="S" <% if(msg040002.getE02LCMTNR().equals("S")) out.print("selected");%>>Sight Payment</OPTION>
                <OPTION value="A" <% if(msg040002.getE02LCMTNR().equals("A")) out.print("selected");%>>Acceptance</OPTION>
                <OPTION value="M" <% if(msg040002.getE02LCMTNR().equals("M")) out.print("selected");%>>Mixed Payment</OPTION>
                <OPTION value="D" <% if(msg040002.getE02LCMTNR().equals("D")) out.print("selected");%>>Deferred Payment</OPTION>
                <OPTION value="N" <% if(msg040002.getE02LCMTNR().equals("N")) out.print("selected");%>>Negociation</OPTION>
              </SELECT>
                <IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" border="0"></TD> 
            <TD nowrap width="25%" align="right">  Cash Collateral Percentage: </TD><TD nowrap width="27%"> 
  			<INPUT name="E02LCMCPE" type="text" onKeyPress="enterDecimal()" value="<%= msg040002.getE02LCMCPE().trim()%>" size="17" maxlength="16" readonly="readonly"></TD>
          </TR>   
          <TR id="trclear"> 
            <TD nowrap width="25%" align="right">Cash Collateral Amount: </TD>
            <TD nowrap width="25%"> 
				<INPUT name="E02LCMCAM" type="text" onKeyPress="enterDecimal()" value="<%= msg040002.getE02LCMCAM().trim()%>" size="17" maxlength="16" readonly="readonly">            </TD>
            <TD nowrap width="25%" align="right">Cash Collateral Account: </TD><TD nowrap width="27%">
					<TABLE id="trclear">
						<TBODY>
							<TR>
								<TD rowspan="2"><INPUT name="E02LCMCCA" type="text" value="<%= msg040002.getE02LCMCCA().trim()%>" size="17" maxlength="16" readonly="readonly"></TD>
						</TR></TBODY>
					</TABLE>
					</TD>
          </TR>
				<TR id="trdark"> 
            <TD nowrap width="25%" align="right">Commissions Table: </TD>
            <TD nowrap width="25%"> 
				<INPUT name="E02LCMTAR" type="text" value="<%= msg040002.getE02LCMTAR().trim()%>" size="2" maxlength="2" readonly="readonly">
				 
            <IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" border="0"></TD>
            <TD nowrap align="right">Our Charges for Account of: </TD>
            <TD nowrap><SELECT name="E02LCMAOB" disabled>
                <OPTION value=" "></OPTION>
                <OPTION value="A" <% if(msg040002.getE02LCMAOB().equals("A")) out.print("selected");%>>Applicant</OPTION>
                <OPTION value="B" <% if(msg040002.getE02LCMAOB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
              </SELECT>
                <IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" border="0"></TD>
			 </TR>   
          <TR id="trclear">
            <TD nowrap align="right">Customer Line of Credit: </TD>
            <TD nowrap><INPUT name="E02LCMLNR" type="text" onKeyPress="enterInteger()" value="<%= msg040002.getE02LCMLNR().trim()%>" size="10" maxlength="9" readonly="readonly">
                
                <INPUT name="E02LCMCMN" type="text" onKeyPress="enterInteger()" value="<%= msg040002.getE02LCMCMN().trim()%>" size="4" maxlength="4" readonly="readonly">
				</TD> 
		            <TD nowrap width="25%" align="right">Applicable Rules: </TD><TD nowrap width="27%">
            	<SELECT name="E02LCMAPR" disabled>
                	<OPTION value="9">NONE</OPTION>
                	<OPTION value="7" <% if(msg040002.getE02LCMAPR().equals("1")) out.print("selected");%>>IIC URCG</OPTION>
                	<OPTION value="8" <% if(msg040002.getE02LCMAPR().equals("2")) out.print("selected");%>>IIC URDG</OPTION>
                	<OPTION value="6" <% if(msg040002.getE02LCMAPR().equals("3")) out.print("selected");%>>Other</OPTION>
              	</SELECT>  
  			<IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" border="0"><INPUT name="E02LCMST3" type="text" value="<%= msg040002.getE02LCMST3().trim()%>"
						size="40" maxlength="35" readonly="readonly"></TD>
          </TR>        
          <TR id="trdark"> 
            <TD nowrap width="25%" align="right">Opening Comm. at Issuance: </TD>
            <TD nowrap width="25%">
                	<INPUT name="E02LCMOCI" type="radio" disabled value="Y" readonly="readonly" <% if(msg040002.getE02LCMOCI().equals("Y")) out.print("checked");%>>Yes
                	<INPUT name="E02LCMOCI" type="radio" disabled value="N" readonly="readonly" <% if(msg040002.getE02LCMOCI().equals("N")) out.print("checked");%>>No            <IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" border="0"></TD>
            <TD nowrap width="25%" align="right">Amendment Comm. at Issuance :</TD><TD nowrap width="27%">
                	<INPUT name="E02LCMACI" type="radio" disabled value="Y" readonly="readonly" <% if(msg040002.getE02LCMACI().equals("Y")) out.print("checked");%>>Yes
                	<INPUT name="E02LCMACI" type="radio" disabled value="N" readonly="readonly" <% if(msg040002.getE02LCMACI().equals("N")) out.print("checked");%>>No
  			        <IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" border="0"></TD>
          </TR>
				<TR id="trclear">
				  <TD nowrap width="25%" align="right">Place of Expiry: </TD>
				  <TD nowrap width="25%"><INPUT name="E02LCMPLE" type="text" value="<%= msg040002.getE02LCMPLE().trim()%>" size="31" maxlength="29" readonly="readonly"></TD>
					<TD nowrap width="25%" align="right">&nbsp;</TD>
					<TD nowrap width="27%">&nbsp;</TD>
				</TR>
				
				<TR id="trdark">
				  <TD align="right" nowrap>Evergreen Clause: </TD>
				  <TD align="left" nowrap><INPUT name="E02LCMEVF" type="radio" disabled value="Y" readonly="readonly" <% if(!msg040002.getE02LCMEVF().equals("N")) out.print("checked");%>>
				    Yes 
				    <INPUT name="E02LCMEVF" type="radio" disabled value="N" readonly="readonly" <% if( msg040002.getE02LCMEVF().equals("N")) out.print("checked");%>>
				    No </TD>
				  <TD nowrap align="right">&nbsp;</TD>
				  <TD nowrap>&nbsp;</TD>
			 </TR>
				<TR id="trclear">
				  <TD align="right" nowrap>Days to Advice Non Renewal: </TD>
				  <TD align="left" nowrap><INPUT name="E02LCMNRD" type="text" onKeyPress="enterInteger()" value="<%= msg040002.getE02LCMNRD().trim()%>" size="3" maxlength="3" readonly="readonly"></TD>
				  <TD align="right" nowrap>Renewal Period : </TD>
				  <TD align="left" nowrap><INPUT name="E02LCMRDY" type="text" onKeyPress="enterInteger()" value="<%= msg040002.getE02LCMRDY().trim()%>" size="3" maxlength="3" readonly="readonly">
				<SELECT name="E02LCMFL1" disabled>
                    <OPTION value="D" <% if(msg040002.getE02LCMFL1().equals("D")) out.print("selected");%>>Days</OPTION>
                    <OPTION value="M" <% if(msg040002.getE02LCMFL1().equals("M")) out.print("selected");%>>Months</OPTION>
                    <OPTION value="Y" <% if(msg040002.getE02LCMFL1().equals("Y")) out.print("selected");%>>Years</OPTION>
                  </SELECT></TD>
			 </TR>
				<TR id="trdark">
				  <TD align="right" nowrap>Generate Swift: </TD>
				  <TD align="left" nowrap><INPUT name="E02LCMSWF" type="radio" disabled value="Y" readonly="readonly" <% if(!msg040002.getE02LCMSWF().equals("N")) out.print("checked");%>>
				    Yes
				    <INPUT name="E02LCMSWF" type="radio" disabled value="N" readonly="readonly" <% if( msg040002.getE02LCMSWF().equals("N")) out.print("checked");%>>
				    No </TD>
				  <TD align="right" nowrap>Swift Message Type: </TD>
				  <TD align="left" nowrap><SELECT name="E02LCMSMT" disabled>
                      <OPTION value="760" <% if(msg040002.getE02LCMSMT().equals("760")) out.print("selected");%>>MT760</OPTION>
                      <OPTION value="700" <% if(msg040002.getE02LCMSMT().equals("700")) out.print("selected");%>>MT700</OPTION>
                  </SELECT></TD>
			 </TR>
				
			 <TR>
					<TD nowrap width="25%"></TD><TD nowrap width="25%"></TD>
					
					<TD nowrap width="25%"></TD>
					<TD nowrap width="27%"></TD>
			</TR>
	    </TBODY></TABLE>
      </TD>
    </TR>
  </TABLE>  
  <% if( !msg040002.getE02LCMOPT().equals("N") ) {%>
  <H4>Increase / Decrease Credit Amount</H4>
  <TABLE class="tableinfo">
    <TBODY>
      <TR>
        <TD nowrap><TABLE cellspacing="0" cellpadding="2" width="100%" border="0"
				class="tbhead">
            <TBODY>
              <TR id="trdark">
                <TD nowrap width="16%"align="right">Increase / Decrease: </TD>
                <TD nowrap width="20%" align="left">
                  <SELECT name="E02LCMIDF" disabled>
                    <OPTION value=""> </OPTION>
                    <OPTION value="I" <% if(msg040002.getE02LCMIDF().equals("I")) out.print("selected");%>>Increase</OPTION>
                    <OPTION value="D" <% if(msg040002.getE02LCMIDF().equals("D")) out.print("selected");%>>Decrease</OPTION>
                  </SELECT></TD>
                <TD nowrap width="16%"align="right">Amount: </TD>
                <TD nowrap width="16%"><INPUT name="E02LCMIDA" type="text" value="<%= msg040002.getE02LCMIDA().trim()%>" size="17" maxlength="16" readonly></TD>
                <TD nowrap width="16%"align="right">Actual Balance: </TD>
                <TD nowrap width="16%"><INPUT name="E02LCMMEB" type="text" value="<%= msg040002.getE02LCMMEB().trim()%>" size="17" maxlength="16" readonly></TD>
              </TR>
            </TBODY>
        </TABLE></TD>
      </TR>
    </TBODY>
  </TABLE>
  <% } %>
  <BR>
</BODY>
</HTML>
