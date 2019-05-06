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

<jsp:useBean id="msg" class="datapro.eibs.beans.ELC040002Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<SCRIPT LANGUAGE="javascript">

<%	if (!userPO.getPurpose().equals("NEW")){%>
		builtNewMenu(sb_opening);
		initMenu();
<%	} %>

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
<H3 align="center">Standby Letter Of Credit <%= (userPO.getPurpose().equals("NEW") ? "New" : "Maintenance") %> [Credit Conditions]
	<IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="sb_details, ELC0400"></H3> 

<HR size="4">
<FORM method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0400">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="6">

<TABLE cellspacing="0" cellpadding="2" width="100%" border="0" class="tableinfo">
					<TR id="trdark">
						<TD nowrap width="16%" align="right"><B>Bank : </B></TD>
						<TD nowrap width="20%">
						<INPUT type="text" name="E02LCMBNK" size="4" maxlength="2" value="<%=msg.getE02LCMBNK().trim()%>" readonly></TD>
						<TD nowrap width="16%" align="right"><B>Letter of Credit Number :</B></TD>
						<TD nowrap width="16%">
						<DIV align="left"><B> <%if (msg.getE02LCMACC().trim().equals("999999999999"))
				{%> <INPUT type="text" size="12" maxlength="12" value="New"
							readonly> <INPUT type="hidden" name="E02LCMACC"
							value="<%=msg.getE02LCMACC().trim()%>" readonly> <%}
				else
				{%> <INPUT type="text" name="E02LCMACC" size="14" maxlength="12"
							value="<%=(msg.getE02LCMACC().trim().equals("0") ? userPO.getIdentifier() : msg.getE02LCMACC().trim() )%>" readonly> <%}%> </B></DIV>
						</TD>
					</TR>
					<TR>
						<TD nowrap width="16%" align="right"><B>Our Reference :</B>
						</TD>
						<TD nowrap width="20%" align="left"><INPUT type="text" name="E02LCMORF" size="20"
							maxlength="16" value="<%=msg.getE02LCMORF().trim()%>" readonly>
						</TD>
						<TD nowrap width="16%" align="right"><B>Product : </B></TD>
						<TD nowrap width="16%" align="left"><B> <INPUT type="text" name="E02LCMPRO" size="4"
							maxlength="4" value="<%=msg.getE02LCMPRO().trim()%>" readonly>
						</B></TD>

					</TR>
					<TR id="trdark">
						<TD width="16%" align="right" nowrap><B>Their Reference : </B></TD>
						<TD nowrap width="16%"><B> <INPUT type="text" name="E02LCMTRF"
							size="20" maxlength="16" value="<%=msg.getE02LCMTRF().trim()%>" readonly>
						</B></TD>

						<TD nowrap width="16%" align="right"><B>Product Description : </B></TD>
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
              <INPUT type="text" name="E02LCMID1" size="2" maxlength="2" value='<%= (msg.getE02LCMID1().trim().equals("0") ? "":msg.getE02LCMID1().trim())%>' onKeyPress="enterInteger()">
              <INPUT type="text" name="E02LCMID2" size="2" maxlength="2" value='<%= (msg.getE02LCMID2().trim().equals("0") ? "":msg.getE02LCMID2().trim())%>' onKeyPress="enterInteger()">
              <INPUT type="text" name="E02LCMID3" size="2" maxlength="2" value='<%  if(msg.getE02LCMID3().length() < 2 && !msg.getE02LCMID3().equals("0"))
							out.print("0");
					out.print((msg.getE02LCMID3().trim().equals("0") ? "":msg.getE02LCMID3().trim()));%>' onKeyPress="enterInteger()">
              <A href="javascript:DatePicker(document.forms[0].E02LCMID1,document.forms[0].E02LCMID2,document.forms[0].E02LCMID3)"><IMG src="<%=request.getContextPath()%>/images/calendar.gif" alt="Help" align="middle" border="0"></A>
              <IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" border="0">  			</TD>
            <TD nowrap width="25%" align="right"> Expiration Date: </TD>
            <TD nowrap width="27%"> 
              <INPUT type="text" name="E02LCMEX1" size="2" maxlength="2" value='<%= (msg.getE02LCMEX1().trim().equals("0") ? "":msg.getE02LCMEX1().trim())%>' onKeyPress="enterInteger()">
              <INPUT type="text" name="E02LCMEX2" size="2" maxlength="2" value='<%= (msg.getE02LCMEX2().trim().equals("0") ? "":msg.getE02LCMEX2().trim())%>' onKeyPress="enterInteger()">
              <INPUT type="text" name="E02LCMEX3" size="2" maxlength="2" value='<%  if(msg.getE02LCMEX3().length() < 2 && !msg.getE02LCMEX3().equals("0"))
							out.print("0");
					out.print((msg.getE02LCMEX3().trim().equals("0") ? "":msg.getE02LCMEX3().trim()));%>' onKeyPress="enterInteger()">
              <A href="javascript:DatePicker(document.forms[0].E02LCMEX1,document.forms[0].E02LCMEX2,document.forms[0].E02LCMEX3)"><IMG src="<%=request.getContextPath()%>/images/calendar.gif" alt="Help" align="middle" border="0"></A> 
            <IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" border="0"></TD>
          </TR>   
           <TR id="trclear"> 
            <TD nowrap width="25%" align="right">Confirmation Date: </TD><TD nowrap width="25%"> 
              <INPUT type="text" name="E02LCMCN1" size="2" maxlength="2" value='<%= (msg.getE02LCMCN1().trim().equals("0") ? "":msg.getE02LCMCN1().trim())%>' onKeyPress="enterInteger()">
              <INPUT type="text" name="E02LCMCN2" size="2" maxlength="2" value='<%= (msg.getE02LCMCN2().trim().equals("0") ? "":msg.getE02LCMCN2().trim())%>' onKeyPress="enterInteger()">
              <INPUT type="text" name="E02LCMCN3" size="2" maxlength="2" value='<%  if(msg.getE02LCMCN3().length() < 2 && !msg.getE02LCMCN3().equals("0"))
							out.print("0");
					out.print((msg.getE02LCMCN3().trim().equals("0") ? "":msg.getE02LCMCN3().trim()));%>' onKeyPress="enterInteger()">
              <A href="javascript:DatePicker(document.forms[0].E02LCMCN1,document.forms[0].E02LCMCN2,document.forms[0].E02LCMCN3)"><IMG src="<%=request.getContextPath()%>/images/calendar.gif" alt="Help" align="middle" border="0"></A> 
            </TD>
            
            <TD nowrap width="25%" align="right">Cost Center: </TD><TD nowrap width="27%"> 
				<INPUT type="text" name="E02LCMCCN" size="9" maxlength="8" value="<%= msg.getE02LCMCCN().trim()%>" readonly> 
				<A href="javascript:GetCostCenter('E02LCMCCN',document.forms[0].E02LCMBNK.value)"><IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></A>
            </TD>
          </TR>         
           <TR id="trdark"> 
			<TD nowrap width="25%" align="right">Currency & F/X Rate: </TD>
            <TD nowrap width="25%"><INPUT type="text" name="E02LCMCCY" size="4" maxlength="4" value="<%= msg.getE02LCMCCY().trim()%>" disabled> 
            <INPUT type="text" name="E02LCMOFX" size="9" maxlength="8" value="<%= msg.getE02LCMOFX().trim() %>" disabled>
            </TD>
            <TD nowrap width="25%" align="right">Original Amount: </TD><TD nowrap width="27%">
            <INPUT type="text" name="E02LCMOAM" size="17" maxlength="16" value="<%= msg.getE02LCMOAM().trim()%>" 
            <%= ( msg.getE02LCMOPT().equals("N") ? "onKeyPress=\"enterDecimal()\"" : "disabled=\"disabled\"" ) %>>
              <IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" border="0"></TD>
          </TR>           
          <TR id="trclear">
            <TD nowrap align="right">Confirmed: </TD>
            <TD nowrap><INPUT type="radio" name="E02LCMCNF" value="Y" <% if(msg.getE02LCMCNF().equals("Y")) out.print("checked");%>>
              Yes
              <INPUT type="radio" name="E02LCMCNF" value="N" <% if(msg.getE02LCMCNF().equals("N")) out.print("checked");%>>
              No </TD> 
            <TD nowrap align="right">Add Confirmation: </TD>
            <TD align="left" nowrap><SELECT name="E02LCMCNO">
                  <OPTION value=" "></OPTION>
                  <OPTION value="Y" <% if(msg.getE02LCMCNO().equals("Y")) out.print("selected");%>>CONFIRM</OPTION>
                  <OPTION value="N" <% if(msg.getE02LCMCNO().equals("N")) out.print("selected");%>>WITHOUT</OPTION>
                  <OPTION value="M" <% if(msg.getE02LCMCNO().equals("M")) out.print("selected");%>>MAY ADD</OPTION>
                </SELECT>             
              </TD>
          </TR>   
          <TR id="trdark">
            <TD nowrap align="right">Tenor: </TD>
            <TD nowrap><SELECT name="E02LCMTNR" disabled="disabled">
                <OPTION value="S" <% if(msg.getE02LCMTNR().equals("S")) out.print("selected");%>>Sight Payment</OPTION>
                <OPTION value="A" <% if(msg.getE02LCMTNR().equals("A")) out.print("selected");%>>Acceptance</OPTION>
                <OPTION value="M" <% if(msg.getE02LCMTNR().equals("M")) out.print("selected");%>>Mixed Payment</OPTION>
                <OPTION value="D" <% if(msg.getE02LCMTNR().equals("D")) out.print("selected");%>>Deferred Payment</OPTION>
                <OPTION value="N" <% if(msg.getE02LCMTNR().equals("N")) out.print("selected");%>>Negociation</OPTION>
              </SELECT>
                <IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" border="0"></TD> 
            <TD nowrap width="25%" align="right">Cash Collateral Percentage: </TD><TD nowrap width="27%"> 
  			<INPUT name="E02LCMCPE" type="text" value="<%= msg.getE02LCMCPE().trim()%>" size="17" maxlength="16"></TD>
          </TR>   
          <TR id="trclear"> 
            <TD nowrap width="25%" align="right">Cash Collateral Amount: </TD>
            <TD nowrap width="25%"> 
				<INPUT name="E02LCMCAM" type="text" onKeyPress="enterDecimal()" value="<%= msg.getE02LCMCAM().trim()%>" size="17" maxlength="16" readonly="readonly">            </TD>
            <TD nowrap width="25%" align="right">Cash Collateral Account: </TD><TD nowrap width="27%">
					<TABLE id="trclear">
						<TBODY>
							<TR>
								<TD rowspan="2"><INPUT name="E02LCMCCA" type="text" value="<%= msg.getE02LCMCCA().trim()%>" size="17" maxlength="16"></TD>
								<TD>G/L<BR></TD>
								<TD rowspan="2"><A href="javascript:GetLedger('E02LCMCCA',document.forms[0].E02LCMBNK.value,'','')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></A></TD>
								<TD>DDA<BR></TD>
								<TD rowspan="2"><A href="javascript: GetAccByClient('E02LCMCCA','','RT','','')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></A></TD>
						</TR></TBODY>
					</TABLE>
					</TD>
          </TR>
				<TR id="trdark"> 
            <TD nowrap width="25%" align="right">Commissions Table: </TD>
            <TD nowrap width="25%"> 
				<INPUT type="text" name="E02LCMTAR" size="2" maxlength="2" value="<%= msg.getE02LCMTAR().trim()%>">
				<A href="javascript:GetTariffLC('E02LCMTAR','<%=msg.getE02LCMATY()%>','<%=msg.getE02LCMCUN()%>','C')">
				<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></A> 
            <IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" border="0"></TD>
            <TD nowrap align="right">Our Charges for Account Of: </TD>
            <TD nowrap><SELECT name="E02LCMAOB">
                <OPTION value=" "></OPTION>
                <OPTION value="A" <% if(msg.getE02LCMAOB().equals("A")) out.print("selected");%>>Aplicant</OPTION>
                <OPTION value="B" <% if(msg.getE02LCMAOB().equals("B")) out.print("selected");%>>Beneficiary</OPTION>
              </SELECT>
                <IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" border="0"></TD>
			 </TR>   
          <TR id="trclear">
            <TD nowrap align="right">Customer Line of Credit: </TD>
            <TD nowrap><INPUT type="text" name="E02LCMLNR" size="10" maxlength="9" value="<%= msg.getE02LCMLNR().trim()%>" onKeyPress="enterInteger()">
                <A href="javascript:GetCustomer('E02LCMLNR')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></A>
                <INPUT type="text" name="E02LCMCMN" size="4" maxlength="4" value="<%= msg.getE02LCMCMN().trim()%>" onKeyPress="enterInteger()">
				<A href="javascript:GetCreditLine('E02LCMCMN',document.forms[0].E02LCMLNR.value)"><IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></A></TD> 
		    <TD nowrap width="25%" align="right">Place of Expiry: </TD>
		    <TD nowrap width="25%"><INPUT type="text" name="E02LCMPLE" size="31" maxlength="29" value="<%= msg.getE02LCMPLE().trim()%>"></TD>
          </TR>        
          <TR id="trdark"> 
            <TD nowrap width="25%" align="right">Opening Comm. at Issuance: </TD>
            <TD nowrap width="25%">
                	<INPUT type="radio" name="E02LCMOCI" value="Y" <% if(msg.getE02LCMOCI().equals("Y")) out.print("checked");%>>Yes
                	<INPUT type="radio" name="E02LCMOCI" value="N" <% if(msg.getE02LCMOCI().equals("N")) out.print("checked");%>>No            
                	<IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" border="0"></TD>
            <TD nowrap width="25%" align="right">Amendment Comm. at Issuance: </TD><TD nowrap width="27%">
                	<INPUT type="radio" name="E02LCMACI" value="Y" <% if(msg.getE02LCMACI().equals("Y")) out.print("checked");%>>Yes
                	<INPUT type="radio" name="E02LCMACI" value="N" <% if(msg.getE02LCMACI().equals("N")) out.print("checked");%>>No
  			        <IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" border="0"></TD>
                </TR>
			    <TR id="trdark">
		            <TD nowrap width="25%" align="right">Applicable Rules: </TD><TD nowrap width="27%">
		            	<SELECT name="E02LCMAPR">
		                	<OPTION value="9">NONE</OPTION>
		                	<OPTION value="7" <% if(msg.getE02LCMAPR().equals("7")) out.print("selected");%>>IIC URCG</OPTION>
		                	<OPTION value="8" <% if(msg.getE02LCMAPR().equals("8")) out.print("selected");%>>IIC URDG</OPTION>
		                	<OPTION value="5" <% if(msg.getE02LCMAPR().equals("5")) out.print("selected");%>>UCP LATEST VERSION</OPTION>
		                	<OPTION value="4" <% if(msg.getE02LCMAPR().equals("4")) out.print("selected");%>>ISP LATEST VERSION</OPTION>
		                	<OPTION value="6" <% if(msg.getE02LCMAPR().equals("6")) out.print("selected");%>>Other</OPTION>
		              	</SELECT>  
		  			<IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" border="0">
		  			</TD>
					<TD nowrap width="25%" align="left"><INPUT type="text"
						name="E02LCMST3" size="40" maxlength="35"
						value="<%= msg.getE02LCMST3().trim()%>"></TD>
					<TD nowrap width="27%">&nbsp;</TD>
				</TR>
				
				<TR id="trclear">
				  <TD align="right" nowrap>Evergreen Clause: </TD>
				  <TD align="left" nowrap><INPUT type="radio" name="E02LCMEVF" value="Y" <% if(!msg.getE02LCMEVF().equals("N")) out.print("checked");%>>
				    Yes
				    <INPUT type="radio" name="E02LCMEVF" value="N" <% if( msg.getE02LCMEVF().equals("N")) out.print("checked");%>>
				    No </TD>
				  <TD nowrap align="right">&nbsp;</TD>
				  <TD nowrap>&nbsp;</TD>
			 </TR>
				<TR id="trdark">
				  <TD align="right" nowrap>Days to Advice Non Renewal: </TD>
				  <TD align="left" nowrap><INPUT type="text" name="E02LCMNRD" size="3" maxlength="3" value="<%= msg.getE02LCMNRD().trim()%>" onKeyPress="enterInteger()"></TD>
				  <TD align="right" nowrap>Renewal Period (Days) : </TD>
				  <TD align="left" nowrap><INPUT type="text" name="E02LCMRDY" size="3" maxlength="3" value="<%= msg.getE02LCMRDY().trim()%>" onKeyPress="enterInteger()">
				<SELECT name="E02LCMFL1">
                    <OPTION value="D" <% if(msg.getE02LCMFL1().equals("D")) out.print("selected");%>>Days</OPTION>
                    <OPTION value="M" <% if(msg.getE02LCMFL1().equals("M")) out.print("selected");%>>Months</OPTION>
                    <OPTION value="Y" <% if(msg.getE02LCMFL1().equals("Y")) out.print("selected");%>>Years</OPTION>
                  </SELECT></TD>
			 </TR>
				<TR id="trclear">
				  <TD align="right" nowrap>Generate Swift: </TD>
				  <TD align="left" nowrap><INPUT type="radio" name="E02LCMSWF" value="Y" <% if(!msg.getE02LCMSWF().equals("N")) out.print("checked");%>>
				    Yes
				    <INPUT type="radio" name="E02LCMSWF" value="N" <% if( msg.getE02LCMSWF().equals("N")) out.print("checked");%>>
				    No </TD>
				  <TD align="right" nowrap>Swift Message Type: </TD>
				  <TD align="left" nowrap><SELECT name="E02LCMSMT">
                      <OPTION value="760" <% if(msg.getE02LCMSMT().equals("760")) out.print("selected");%>>MT760</OPTION>
                      <OPTION value="700" <% if(msg.getE02LCMSMT().equals("700")) out.print("selected");%>>MT700</OPTION>
                      <OPTION value="710" <% if(msg.getE02LCMSMT().equals("710")) out.print("selected");%>>MT710</OPTION>
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
  <% if( !msg.getE02LCMOPT().equals("N") ) {%>
  <H4>Operation Type</H4>
  <TABLE class="tableinfo">
    <TBODY>
      <TR>
        <TD nowrap><TABLE cellspacing="0" cellpadding="2" width="100%" border="0"
				class="tbhead">
            <TBODY>
              <TR id="trdark0">
                <TD nowrap width="16%"align="right">Increase / Decrease : </TD>
                <TD nowrap width="20%" align="left"><SELECT name="E02LCMIDF">
                  <OPTION value=""> </OPTION>
                  <OPTION value="I" <% if(msg.getE02LCMIDF().equals("I")) out.print("selected");%>>Increase</OPTION>
                  <OPTION value="D" <% if(msg.getE02LCMIDF().equals("D")) out.print("selected");%>>Decrease</OPTION>
                </SELECT></TD>
                <TD nowrap width="16%"align="right">Amount : </TD>
                <TD nowrap width="16%"><INPUT name="E02LCMIDA" type="text"  value="<%= msg.getE02LCMIDA().trim()%>" size="17" maxlength="16"></TD>
                <TD nowrap width="15%"align="right">Actual Balance : </TD>
                <TD nowrap width="15%"><INPUT name="E02LCMMEB" type="text"  value="<%= msg.getE02LCMMEB().trim()%>" size="17" maxlength="16" readonly></TD>
              </TR>
            </TBODY>
        </TABLE></TD>
      </TR>
    </TBODY>
  </TABLE>
  <% } %>
  <BR>
  
  <DIV align="center"> 
  <h4 style="text-align:center"><input type="checkbox" name="H02FLGWK2" value="A" <% if(msg.getH02FLGWK2().equals("A")){ out.print("checked");} %>>
      Accept with Warnings</h4>
  <INPUT type="hidden" name="H02FLGWK1" value="">
	   <INPUT id="EIBSBTN" type=submit name="Submit" value="Submit"> &nbsp; &nbsp; &nbsp;
  <INPUT id="EIBSBTN" type="submit" name="Finish" value="Finish" onClick="document.forms[0].H02FLGWK1.value='Y'"></DIV>
</FORM>
 
<!--<H5>  <%
String s = msg.toString();
for(int i = 0; i < s.length(); i++)
{
	if(s.charAt(i) == ':')	out.print("<BR>");
	else if (s.charAt(i) == '<') out.print("{");
		else if (s.charAt(i) == '>') out.print("}");
	else 					out.print(s.charAt(i));

}%></H5>-->
</BODY>
</HTML>
