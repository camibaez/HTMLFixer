<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Letters of Credit Commissions Table</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="msg01" class="datapro.eibs.beans.ELC060001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<SCRIPT language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   	builtHPopUp();

  	function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   		init(opth,field,bank,ccy,field1,field2,opcod);
   		showPopupHelp();
   	}
   	
   	function onSubmit() {
   		if (document.getElementById("OPTION").value == "INQUIRY") {
   			document.getElementById("ACTION").value = "101";
   		}
   		return true;
   	}

</SCRIPT>

</HEAD>

<BODY>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
 	 error.setERRNUM("0");
    out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
 String field; int x = 1;
%>

<H3 align="center">Letters Of Credit Commissions Table<IMG
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" ALT="ELC0600_sc_prod_basic"></H3>
<HR size="4">
<FORM name= "form" method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0600" onsubmit="onSubmit()">
	<INPUT TYPE=HIDDEN ID="ACTION" NAME="SCREEN" VALUE="105"> 
	<INPUT TYPE=HIDDEN NAME="E01RLCATY" VALUE="<%=msg01.getE01RLCATY()%>"> 
	<INPUT TYPE=HIDDEN NAME="E01RLCCUN" VALUE="<%=msg01.getE01RLCCUN()%>"> 
	<INPUT TYPE=HIDDEN ID="OPTION" NAME="OPT" VALUE="<%= userPO.getPurpose()%>">
	
<% 
	String readonly = "";
	String disabled = "";
	if (userPO.getPurpose().equals("INQUIRY")) { 
		readonly = "readonly";
		disabled = "disabled";
	}	
%>	

<TABLE class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
	<TBODY>
		<TR id="trdark">
			<TD nowrap><DIV align="right"><B>Bank :</B></DIV></TD>
			<TD nowrap>
				<DIV align="left"><INPUT type="text" name="E01RLCBNK" size="3" maxlength="2" value="<%= msg01.getE01RLCBNK().trim()%>" readonly></DIV>
			</TD>
			<TD nowrap>
				<DIV align="right"><B>Table Number :</B></DIV>
			</TD>
			<TD nowrap>
				<DIV align="left"><INPUT type="text" name="E01RLCTAR" size="3" maxlength="2" value="<%= msg01.getE01RLCTAR().trim()%>" readonly></DIV>
			</TD>
			<TD nowrap>
				<DIV align="right"><B>Tariff Currency:</B></DIV>
			</TD>
			<TD nowrap>
				<DIV align="left"><INPUT type="text" name="E01RLCTCY" size="4" maxlength="3" value="<%= msg01.getE01RLCTCY().trim()%>" <%= readonly %>>
				<% if (readonly.equals("")) { %>
				<A href="javascript:GetCurrency('E01RLCTCY','')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="help" border="0"></A></DIV>
				<% } %>
			</TD>
		</TR>
		<TR id="trclear">
			<TD nowrap height="34">
				<DIV align="right"><B>Accounting Currency :</B></DIV>
			</TD>
			<TD nowrap height="34">
				<DIV align="left"><INPUT type="text" name="E01RLCACY" size="4" maxlength="3" value="<%= msg01.getE01RLCACY().trim()%>" <%= readonly %>>
				<% if (readonly.equals("")) { %>
				<A href="javascript:GetCurrency('E01RLCACY','')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="help" border="0"></A></DIV>
				<% } %>
			</TD>
			<TD nowrap height="34">
				<DIV align="right"><B>Description :</B></DIV>
			</TD>
			<TD nowrap colspan="3" height="34">
				<DIV align="left"><INPUT type="text" name="E01RLCDSC" size="30" maxlength="25" value="<%= msg01.getE01RLCDSC().trim()%>" <%= readonly %>>
				<% if (readonly.equals("")) { %>
				<A href="javascript:GetCorrespondentDescIdSwift('E01PRIRID','E01REQCON','')"></A></DIV>
				<% } %>
			</TD>
		</TR>
		<% if (userPO.getCusNum().equals("2") ) {%>
		<TR id="trdark">
			<TD nowrap> 
            	<DIV align="right"><B>Customer Number :</B></DIV>
        	</TD>
        	<TD nowrap> 
            	<DIV align="left"><INPUT type="text" name="E01RLCCUN" size="15" maxlength="10" value="<%= msg01.getE01RLCCUN().trim()%>" readonly></DIV>
            </TD>
            <TD nowrap> 
            	<DIV align="right"><B>Customer Name :</B> </DIV>
            </TD>
            <TD nowrap colspan="3"> 
            	<DIV align="left"><INPUT type="text" name="E01CUSNME" size="30" maxlength="25" value="<%= msg01.getE01CUSNME().trim()%>" readonly></DIV>
            </TD>
		</TR>
		<% } %>
	</TBODY>
</TABLE>

<% if (userPO.getPurpose().equals("NEW")) { %>
<BR>
<TABLE class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
	<TR id="trdark">
		<TD nowrap>
			<DIV align="right"><B>Copy From </B></DIV>
		</TD>
		<TD nowrap></TD>
		<TD nowrap>
			<DIV align="right"><B> Product Type : </B></DIV>
		</TD>
		<TD nowrap width="143">
			<INPUT type="text" name="E01CPYATY" size="5" maxlength="8" value="LCR" readonly>
   			
   		</TD>
		<TD nowrap width="142">
			<DIV align="right"><B>Table Number : </B></DIV>
		</TD>
		<TD nowrap width="49"><INPUT type="text" name="E01CPYTAR" size="3" maxlength="2" value="<%= msg01.getE01CPYTAR().trim()%>"></TD>
	</TR>
</TABLE>
<% } %>
			
<H4>Charges</H4>

<TABLE class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
<TBODY>
	<TR id="trdark">
		<TD nowrap align="center"><B>Concept</B></TD>
		<TD nowrap align="center"><B>Amount</B></TD>
		<TD nowrap align="center"><B>Percent</B></TD>
		<TD nowrap align="center"><B>Period</B></TD>
		<TD nowrap align="center"><B>Minimum</B></TD>
		<TD nowrap align="center"><B>Maximum</B></TD>
		<TD nowrap align="center"><B>IVA</B></TD>
		<TD nowrap align="center"><B>Apply</B></TD>
	</TR>
	<TR id="trclear">
		<TD nowrap>
			<DIV align="right">Issuance 1 :</DIV>
			</TD>
			<TD nowrap></TD>
			<TD nowrap>
			<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCIBR" size="12" maxlength="11" value="<%= msg01.getE01RLCIBR().trim()%>" onKeyPress="return enterDecimalNum(event)"></DIV>
			</TD>
			<TD nowrap>
			<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCIBP" size="5" maxlength="4" value="<%= msg01.getE01RLCIBP().trim()%>" onKeyPress="enterInteger()"></DIV>
			</TD>
			<TD nowrap>

			<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCIMF" size="12" maxlength="11" value="<%= msg01.getE01RLCIMF().trim()%>" onKeyPress="enterDecimal()"></DIV>
			</TD>
			<TD nowrap>
			<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCIMX" size="12" maxlength="11" value="<%= msg01.getE01RLCIMX().trim()%>" onKeyPress="enterDecimal()"></DIV>
			</TD>
			<TD nowrap>
			<DIV align="center"><SELECT name="E01RLCI01" <%= disabled %>>
				<OPTION value=" " <% if (!(msg01.getE01RLCI01().equals("Y")||msg01.getE01RLCI01().equals("N"))) out.print("selected"); %>></OPTION>
				<OPTION value="Y" <% if (msg01.getE01RLCI01().equals("Y")) out.print("selected"); %>>Yes</OPTION>
				<OPTION value="N" <% if (msg01.getE01RLCI01().equals("N")) out.print("selected"); %>>No</OPTION>
			</SELECT></DIV>
		</TD>
		<TD nowrap>
			<%	field = "E01APPF" + ( x < 10 ? "0" : "") + x; x++; %>
			<SELECT name="<%=field%>" <%= disabled %>> 
				<OPTION value=" "> </OPTION>
				<OPTION value="I" <% if (msg01.getField(field).getString().equals("I")) out.print("selected"); %>>Opening</OPTION>
				<OPTION value="A" <% if (msg01.getField(field).getString().equals("A")) out.print("selected"); %>>Amendment</OPTION>
				<OPTION value="E" <% if (msg01.getField(field).getString().equals("E")) out.print("selected"); %>>Extension of Validity</OPTION>
				<OPTION value="N" <% if (msg01.getField(field).getString().equals("N")) out.print("selected"); %>>Increase</OPTION>
				<OPTION value="T" <% if (msg01.getField(field).getString().equals("T")) out.print("selected"); %>>Transfer</OPTION>
				<OPTION value="P" <% if (msg01.getField(field).getString().equals("P")) out.print("selected"); %>>Assignment Of Proceeds</OPTION>
				<OPTION value="1" <% if (msg01.getField(field).getString().equals("1")) out.print("selected"); %>>Payment</OPTION>
				<OPTION value="2" <% if (msg01.getField(field).getString().equals("2")) out.print("selected"); %>>Negotiation</OPTION>
				<OPTION value="3" <% if (msg01.getField(field).getString().equals("3")) out.print("selected"); %>>Payment and Negotiation</OPTION>
				<OPTION value="4" <% if (msg01.getField(field).getString().equals("4")) out.print("selected"); %>>Cancellation</OPTION>
				<OPTION value="X" <% if (msg01.getField(field).getString().equals("X")) out.print("selected"); %>>Allways</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id="trdark">
		<TD nowrap>
			<DIV align="right">Issuance 2 :</DIV>
		</TD>
		<TD nowrap></TD>
		<TD nowrap>
			<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCIR2" size="12" maxlength="11" value="<%= msg01.getE01RLCIR2().trim()%>" onKeyPress="return enterDecimalNum(event)"></DIV>
		</TD>
		<TD nowrap>
			<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCIP2" size="5" maxlength="4" value="<%= msg01.getE01RLCIP2().trim()%>" onKeyPress="enterInteger()"></DIV>
		</TD>
		<TD nowrap>
			<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCIM2" size="12" maxlength="11" value="<%= msg01.getE01RLCIM2().trim()%>" onKeyPress="enterDecimal()"></DIV>
		</TD>
		<TD nowrap>
			<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCIX2" size="12" maxlength="11" value="<%= msg01.getE01RLCIX2().trim()%>" onKeyPress="enterDecimal()"></DIV>
		</TD>
		<TD nowrap></TD>
		<TD nowrap></TD>
	</TR>
	<TR id="trclear">
		<TD nowrap>
		<DIV align="right">Advising :</DIV>
		</TD>
		<TD nowrap>
		<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCADF" size="12" maxlength="11" value="<%= msg01.getE01RLCADF().trim()%>" onKeyPress="enterDecimal()"></DIV>
		</TD>
		<TD nowrap></TD>
		<TD nowrap></TD>
		<TD nowrap></TD>
		<TD nowrap></TD>
		<TD nowrap>
			<DIV align="center">
				<SELECT name="E01RLCI02" <%= disabled %>>
					<OPTION value=" " <% if (!(msg01.getE01RLCI02().equals("Y")||msg01.getE01RLCI02().equals("N"))) out.print("selected"); %>></OPTION>
					<OPTION value="Y" <% if (msg01.getE01RLCI02().equals("Y")) out.print("selected"); %>>Yes</OPTION>
					<OPTION value="N" <% if (msg01.getE01RLCI02().equals("N")) out.print("selected"); %>>No</OPTION>
				</SELECT>
			</DIV>
		</TD>
		<TD nowrap><% field = "E01APPF" + ( x < 10 ? "0" : "") + x; x++; %>
			<SELECT name="<%=field%>" <%= disabled %>> 
				<OPTION value=" "> </OPTION>
				<OPTION value="I" <% if (msg01.getField(field).getString().equals("I")) out.print("selected"); %>>Opening</OPTION>
				<OPTION value="A" <% if (msg01.getField(field).getString().equals("A")) out.print("selected"); %>>Amendment</OPTION>
				<OPTION value="E" <% if (msg01.getField(field).getString().equals("E")) out.print("selected"); %>>Extension of Validity</OPTION>
				<OPTION value="N" <% if (msg01.getField(field).getString().equals("N")) out.print("selected"); %>>Increase</OPTION>
				<OPTION value="T" <% if (msg01.getField(field).getString().equals("T")) out.print("selected"); %>>Transfer</OPTION>
				<OPTION value="P" <% if (msg01.getField(field).getString().equals("P")) out.print("selected"); %>>Assignment Of Proceeds</OPTION>
				<OPTION value="1" <% if (msg01.getField(field).getString().equals("1")) out.print("selected"); %>>Payment</OPTION>
				<OPTION value="2" <% if (msg01.getField(field).getString().equals("2")) out.print("selected"); %>>Negotiation</OPTION>
				<OPTION value="3" <% if (msg01.getField(field).getString().equals("3")) out.print("selected"); %>>Payment and Negotiation</OPTION>
				<OPTION value="4" <% if (msg01.getField(field).getString().equals("4")) out.print("selected"); %>>Cancellation</OPTION>
				<OPTION value="X" <% if (msg01.getField(field).getString().equals("X")) out.print("selected"); %>>Allways</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id="trdark">
		<TD nowrap>
		<DIV align="right">Confirmation 1 :</DIV>
		</TD>
		<TD nowrap></TD>
		<TD nowrap>
		<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCCBR" size="12" maxlength="11" value="<%= msg01.getE01RLCCBR().trim()%>" onKeyPress="return enterDecimalNum(event)"></DIV>
		</TD>
		<TD nowrap>
		<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCCBP" size="5" maxlength="4" value="<%= msg01.getE01RLCCBP().trim()%>" onKeyPress="enterInteger()"></DIV>
		</TD>
		<TD nowrap>

		<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCCMF" size="12" maxlength="11" value="<%= msg01.getE01RLCCMF().trim()%>" onKeyPress="enterDecimal()"></DIV>
		</TD>
		<TD nowrap>
		<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCCMX" size="12" maxlength="11" value="<%= msg01.getE01RLCCMX().trim()%>" onKeyPress="enterDecimal()"></DIV>
		</TD>
		<TD nowrap>
		<DIV align="center"><SELECT name="E01RLCI03" <%= disabled %>>
			<OPTION value=" " <% if (!(msg01.getE01RLCI03().equals("Y")||msg01.getE01RLCI03().equals("N"))) out.print("selected"); %>></OPTION>
			<OPTION value="Y" <% if (msg01.getE01RLCI03().equals("Y")) out.print("selected"); %>>Yes</OPTION>
			<OPTION value="N" <% if (msg01.getE01RLCI03().equals("N")) out.print("selected"); %>>No</OPTION>
		</SELECT></DIV>
		</TD>
		<TD nowrap><%	field = "E01APPF" + ( x < 10 ? "0" : "") + x; x++; %>
			<SELECT name="<%=field%>" <%= disabled %>> 
				<OPTION value=" "> </OPTION>
				<OPTION value="I" <% if (msg01.getField(field).getString().equals("I")) out.print("selected"); %>>Opening</OPTION>
				<OPTION value="A" <% if (msg01.getField(field).getString().equals("A")) out.print("selected"); %>>Amendment</OPTION>
				<OPTION value="E" <% if (msg01.getField(field).getString().equals("E")) out.print("selected"); %>>Extension of Validity</OPTION>
				<OPTION value="N" <% if (msg01.getField(field).getString().equals("N")) out.print("selected"); %>>Increase</OPTION>
				<OPTION value="T" <% if (msg01.getField(field).getString().equals("T")) out.print("selected"); %>>Transfer</OPTION>
				<OPTION value="P" <% if (msg01.getField(field).getString().equals("P")) out.print("selected"); %>>Assignment Of Proceeds</OPTION>
				<OPTION value="1" <% if (msg01.getField(field).getString().equals("1")) out.print("selected"); %>>Payment</OPTION>
				<OPTION value="2" <% if (msg01.getField(field).getString().equals("2")) out.print("selected"); %>>Negotiation</OPTION>
				<OPTION value="3" <% if (msg01.getField(field).getString().equals("3")) out.print("selected"); %>>Payment and Negotiation</OPTION>
				<OPTION value="4" <% if (msg01.getField(field).getString().equals("4")) out.print("selected"); %>>Cancellation</OPTION>
				<OPTION value="X" <% if (msg01.getField(field).getString().equals("X")) out.print("selected"); %>>Allways</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id="trclear">
		<TD nowrap>
		<DIV align="right">Confirmation 2 :</DIV>
		</TD>
		<TD nowrap></TD>
		<TD nowrap>
		<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCCR2" size="12" maxlength="11" value="<%= msg01.getE01RLCCR2().trim()%>" onKeyPress="return enterDecimalNum(event)"></DIV>
		</TD>
		<TD nowrap>
		<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCCP2" size="5" maxlength="4" value="<%= msg01.getE01RLCCP2().trim()%>" onKeyPress="enterInteger()"></DIV>
		</TD>
		<TD nowrap>

		<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCCM2" size="12" maxlength="11" value="<%= msg01.getE01RLCCM2().trim()%>" onKeyPress="enterDecimal()"></DIV>
		</TD>
		<TD nowrap>
		<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCCX2" size="12" maxlength="11" value="<%= msg01.getE01RLCCX2().trim()%>" onKeyPress="enterDecimal()"></DIV>
		</TD>
		<TD nowrap></TD>
		<TD nowrap></TD>
	</TR>
	<TR id="trdark">
		<TD nowrap>
		<DIV align="right">Extension of Validity :</DIV>
		</TD>
		<TD nowrap></TD>
		<TD nowrap>
		<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCEBR" size="12" maxlength="11" value="<%= msg01.getE01RLCEBR().trim()%>" onKeyPress="return enterDecimalNum(event)"></DIV>
		</TD>
		<TD nowrap>
		<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCEBP" size="5" maxlength="4" value="<%= msg01.getE01RLCEBP().trim()%>" onKeyPress="enterInteger()"></DIV>
		</TD>
		<TD nowrap>
		<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCEMF" size="12" maxlength="11" value="<%= msg01.getE01RLCEMF().trim()%>" onKeyPress="enterDecimal()"></DIV>
		</TD>
		<TD nowrap>
		<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCEMX" size="12" maxlength="11" value="<%= msg01.getE01RLCEMX().trim()%>" onKeyPress="enterDecimal()"></DIV>
		</TD>
		<TD nowrap>
		<DIV align="center"><SELECT name="E01RLCI04" <%= disabled %>>
			<OPTION value=" " <% if (!(msg01.getE01RLCI04().equals("Y")||msg01.getE01RLCI04().equals("N"))) out.print("selected"); %>></OPTION>
			<OPTION value="Y" <% if (msg01.getE01RLCI04().equals("Y")) out.print("selected"); %>>Yes</OPTION>
			<OPTION value="N" <% if (msg01.getE01RLCI04().equals("N")) out.print("selected"); %>>No</OPTION>
		</SELECT></DIV>
		</TD>
		<TD nowrap><%	field = "E01APPF" + ( x < 10 ? "0" : "") + x; x++; %>
			<SELECT name="<%=field%>" <%= disabled %>> 
				<OPTION value=" "> </OPTION>
				<OPTION value="I" <% if (msg01.getField(field).getString().equals("I")) out.print("selected"); %>>Opening</OPTION>
				<OPTION value="A" <% if (msg01.getField(field).getString().equals("A")) out.print("selected"); %>>Amendment</OPTION>
				<OPTION value="E" <% if (msg01.getField(field).getString().equals("E")) out.print("selected"); %>>Extension of Validity</OPTION>
				<OPTION value="N" <% if (msg01.getField(field).getString().equals("N")) out.print("selected"); %>>Increase</OPTION>
				<OPTION value="T" <% if (msg01.getField(field).getString().equals("T")) out.print("selected"); %>>Transfer</OPTION>
				<OPTION value="P" <% if (msg01.getField(field).getString().equals("P")) out.print("selected"); %>>Assignment Of Proceeds</OPTION>
				<OPTION value="1" <% if (msg01.getField(field).getString().equals("1")) out.print("selected"); %>>Payment</OPTION>
				<OPTION value="2" <% if (msg01.getField(field).getString().equals("2")) out.print("selected"); %>>Negotiation</OPTION>
				<OPTION value="3" <% if (msg01.getField(field).getString().equals("3")) out.print("selected"); %>>Payment and Negotiation</OPTION>
				<OPTION value="4" <% if (msg01.getField(field).getString().equals("4")) out.print("selected"); %>>Cancellation</OPTION>
				<OPTION value="X" <% if (msg01.getField(field).getString().equals("X")) out.print("selected"); %>>Allways</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id="trclear">
		<TD nowrap>
		<DIV align="right">Amendment :</DIV>
		</TD>
		<TD nowrap>
		<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCAMF" size="12" maxlength="11" value="<%= msg01.getE01RLCAMF().trim()%>" onKeyPress="enterDecimal()"></DIV>
		</TD>
		<TD nowrap></TD>
		<TD nowrap></TD>
		<TD nowrap></TD>
		<TD nowrap></TD>
		<TD nowrap>
		<DIV align="center"><SELECT name="E01RLCI05" <%= disabled %>>
			<OPTION value=" " <% if (!(msg01.getE01RLCI05().equals("Y")||msg01.getE01RLCI05().equals("N"))) out.print("selected"); %>></OPTION>
			<OPTION value="Y" <% if (msg01.getE01RLCI05().equals("Y")) out.print("selected"); %>>Yes</OPTION>
			<OPTION value="N" <% if (msg01.getE01RLCI05().equals("N")) out.print("selected"); %>>No</OPTION>
		</SELECT></DIV>
		</TD>
		<TD nowrap><%	field = "E01APPF" + ( x < 10 ? "0" : "") + x; x++; %>
			<SELECT name="<%=field%>" <%= disabled %>> 
				<OPTION value=" "> </OPTION>
				<OPTION value="I" <% if (msg01.getField(field).getString().equals("I")) out.print("selected"); %>>Opening</OPTION>
				<OPTION value="A" <% if (msg01.getField(field).getString().equals("A")) out.print("selected"); %>>Amendment</OPTION>
				<OPTION value="E" <% if (msg01.getField(field).getString().equals("E")) out.print("selected"); %>>Extension of Validity</OPTION>
				<OPTION value="N" <% if (msg01.getField(field).getString().equals("N")) out.print("selected"); %>>Increase</OPTION>
				<OPTION value="T" <% if (msg01.getField(field).getString().equals("T")) out.print("selected"); %>>Transfer</OPTION>
				<OPTION value="P" <% if (msg01.getField(field).getString().equals("P")) out.print("selected"); %>>Assignment Of Proceeds</OPTION>
				<OPTION value="1" <% if (msg01.getField(field).getString().equals("1")) out.print("selected"); %>>Payment</OPTION>
				<OPTION value="2" <% if (msg01.getField(field).getString().equals("2")) out.print("selected"); %>>Negotiation</OPTION>
				<OPTION value="3" <% if (msg01.getField(field).getString().equals("3")) out.print("selected"); %>>Payment and Negotiation</OPTION>
				<OPTION value="4" <% if (msg01.getField(field).getString().equals("4")) out.print("selected"); %>>Cancellation</OPTION>
				<OPTION value="X" <% if (msg01.getField(field).getString().equals("X")) out.print("selected"); %>>Allways</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id="trdark">
		<TD nowrap>
			<DIV align="right">Advising Amendment :</DIV>
		</TD>
		<TD nowrap>
			<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCAAF" size="12" maxlength="11" value="<%= msg01.getE01RLCAAF().trim()%>" onKeyPress="enterDecimal()"></DIV>
		</TD>
		<TD nowrap></TD>
		<TD nowrap></TD>
		<TD nowrap></TD>
		<TD nowrap></TD>
		<TD nowrap>
		<DIV align="center"><SELECT name="E01RLCI06" <%= disabled %>>
			<OPTION value=" " <% if (!(msg01.getE01RLCI06().equals("Y")||msg01.getE01RLCI06().equals("N"))) out.print("selected"); %>></OPTION>
			<OPTION value="Y" <% if (msg01.getE01RLCI06().equals("Y")) out.print("selected"); %>>Yes</OPTION>
			<OPTION value="N" <% if (msg01.getE01RLCI06().equals("N")) out.print("selected"); %>>No</OPTION>
		</SELECT></DIV>
		</TD>
		<TD nowrap><%	field = "E01APPF" + ( x < 10 ? "0" : "") + x; x++; %>
			<SELECT name="<%=field%>" <%= disabled %>> 
				<OPTION value=" "> </OPTION>
				<OPTION value="I" <% if (msg01.getField(field).getString().equals("I")) out.print("selected"); %>>Opening</OPTION>
				<OPTION value="A" <% if (msg01.getField(field).getString().equals("A")) out.print("selected"); %>>Amendment</OPTION>
				<OPTION value="E" <% if (msg01.getField(field).getString().equals("E")) out.print("selected"); %>>Extension of Validity</OPTION>
				<OPTION value="N" <% if (msg01.getField(field).getString().equals("N")) out.print("selected"); %>>Increase</OPTION>
				<OPTION value="T" <% if (msg01.getField(field).getString().equals("T")) out.print("selected"); %>>Transfer</OPTION>
				<OPTION value="P" <% if (msg01.getField(field).getString().equals("P")) out.print("selected"); %>>Assignment Of Proceeds</OPTION>
				<OPTION value="1" <% if (msg01.getField(field).getString().equals("1")) out.print("selected"); %>>Payment</OPTION>
				<OPTION value="2" <% if (msg01.getField(field).getString().equals("2")) out.print("selected"); %>>Negotiation</OPTION>
				<OPTION value="3" <% if (msg01.getField(field).getString().equals("3")) out.print("selected"); %>>Payment and Negotiation</OPTION>
				<OPTION value="4" <% if (msg01.getField(field).getString().equals("4")) out.print("selected"); %>>Cancellation</OPTION>
				<OPTION value="X" <% if (msg01.getField(field).getString().equals("X")) out.print("selected"); %>>Allways</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id="trclear">
		<TD nowrap>
			<DIV align="right">Discrepancy :</DIV>
		</TD>
		<TD nowrap>
			<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCDIF" size="12" maxlength="11" value="<%= msg01.getE01RLCDIF().trim()%>" onKeyPress="enterDecimal()"></DIV>
		</TD>
		<TD nowrap></TD>
		<TD nowrap></TD>
		<TD nowrap></TD>
		<TD nowrap></TD>
		<TD nowrap>
		<DIV align="center"><SELECT name="E01RLCI07" <%= disabled %>>
			<OPTION value=" " <% if (!(msg01.getE01RLCI07().equals("Y")||msg01.getE01RLCI07().equals("N"))) out.print("selected"); %>></OPTION>
			<OPTION value="Y" <% if (msg01.getE01RLCI07().equals("Y")) out.print("selected"); %>>Yes</OPTION>
			<OPTION value="N" <% if (msg01.getE01RLCI07().equals("N")) out.print("selected"); %>>No</OPTION>
		</SELECT></DIV>
		</TD>
		<TD nowrap><%	field = "E01APPF" + ( x < 10 ? "0" : "") + x; x++; %>
			<SELECT name="<%=field%>" <%= disabled %>> 
				<OPTION value=" "> </OPTION>
				<OPTION value="I" <% if (msg01.getField(field).getString().equals("I")) out.print("selected"); %>>Opening</OPTION>
				<OPTION value="A" <% if (msg01.getField(field).getString().equals("A")) out.print("selected"); %>>Amendment</OPTION>
				<OPTION value="E" <% if (msg01.getField(field).getString().equals("E")) out.print("selected"); %>>Extension of Validity</OPTION>
				<OPTION value="N" <% if (msg01.getField(field).getString().equals("N")) out.print("selected"); %>>Increase</OPTION>
				<OPTION value="T" <% if (msg01.getField(field).getString().equals("T")) out.print("selected"); %>>Transfer</OPTION>
				<OPTION value="P" <% if (msg01.getField(field).getString().equals("P")) out.print("selected"); %>>Assignment Of Proceeds</OPTION>
				<OPTION value="1" <% if (msg01.getField(field).getString().equals("1")) out.print("selected"); %>>Payment</OPTION>
				<OPTION value="2" <% if (msg01.getField(field).getString().equals("2")) out.print("selected"); %>>Negotiation</OPTION>
				<OPTION value="3" <% if (msg01.getField(field).getString().equals("3")) out.print("selected"); %>>Payment and Negotiation</OPTION>
				<OPTION value="4" <% if (msg01.getField(field).getString().equals("4")) out.print("selected"); %>>Cancellation</OPTION>
				<OPTION value="X" <% if (msg01.getField(field).getString().equals("X")) out.print("selected"); %>>Allways</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id="trdark">
		<TD nowrap>
			<DIV align="right">Sight Payment :</DIV>
		</TD>
		<TD nowrap></TD>
		<TD nowrap>
			<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCSBR" size="12" maxlength="11" value="<%= msg01.getE01RLCSBR().trim()%>" onKeyPress="return enterDecimalNum(event)"></DIV>
		</TD>
		<TD nowrap></TD>
		<TD nowrap>
			<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCSPM" size="12" maxlength="11" value="<%= msg01.getE01RLCSPM().trim()%>" onKeyPress="enterDecimal()"></DIV>
		</TD>
		<TD nowrap></TD>
		<TD nowrap>
			<DIV align="center"><SELECT name="E01RLCI08" <%= disabled %>>
				<OPTION value=" " <% if (!(msg01.getE01RLCI08().equals("Y")||msg01.getE01RLCI08().equals("N"))) out.print("selected"); %>></OPTION>
				<OPTION value="Y" <% if (msg01.getE01RLCI08().equals("Y")) out.print("selected"); %>>Yes</OPTION>
				<OPTION value="N" <% if (msg01.getE01RLCI08().equals("N")) out.print("selected"); %>>No</OPTION>
			</SELECT></DIV>
		</TD>
		<TD nowrap><%	field = "E01APPF" + ( x < 10 ? "0" : "") + x; x++; %>
			<SELECT name="<%=field%>" <%= disabled %>> 
				<OPTION value=" "> </OPTION>
				<OPTION value="I" <% if (msg01.getField(field).getString().equals("I")) out.print("selected"); %>>Opening</OPTION>
				<OPTION value="A" <% if (msg01.getField(field).getString().equals("A")) out.print("selected"); %>>Amendment</OPTION>
				<OPTION value="E" <% if (msg01.getField(field).getString().equals("E")) out.print("selected"); %>>Extension of Validity</OPTION>
				<OPTION value="N" <% if (msg01.getField(field).getString().equals("N")) out.print("selected"); %>>Increase</OPTION>
				<OPTION value="T" <% if (msg01.getField(field).getString().equals("T")) out.print("selected"); %>>Transfer</OPTION>
				<OPTION value="P" <% if (msg01.getField(field).getString().equals("P")) out.print("selected"); %>>Assignment Of Proceeds</OPTION>
				<OPTION value="1" <% if (msg01.getField(field).getString().equals("1")) out.print("selected"); %>>Payment</OPTION>
				<OPTION value="2" <% if (msg01.getField(field).getString().equals("2")) out.print("selected"); %>>Negotiation</OPTION>
				<OPTION value="3" <% if (msg01.getField(field).getString().equals("3")) out.print("selected"); %>>Payment and Negotiation</OPTION>
				<OPTION value="4" <% if (msg01.getField(field).getString().equals("4")) out.print("selected"); %>>Cancellation</OPTION>
				<OPTION value="X" <% if (msg01.getField(field).getString().equals("X")) out.print("selected"); %>>Allways</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id="trclear">
		<TD nowrap>
			<DIV align="right">Acceptance :</DIV>
		</TD>
		<TD nowrap></TD>
		<TD nowrap>
			<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCACB" size="12" maxlength="11" value="<%= msg01.getE01RLCACB().trim()%>" onKeyPress="return enterDecimalNum(event)"></DIV>
		</TD>
		<TD nowrap>
			<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCABP" size="5" maxlength="4" value="<%= msg01.getE01RLCABP().trim()%>" onKeyPress="enterInteger()"></DIV>
		</TD>
		<TD nowrap>
			<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCACM" size="12" maxlength="11" value="<%= msg01.getE01RLCACM().trim()%>" onKeyPress="enterDecimal()"></DIV>
		</TD>
		<TD nowrap>
			<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCAMX" size="12" maxlength="11" value="<%= msg01.getE01RLCAMX().trim()%>" onKeyPress="enterDecimal()"></DIV>
		</TD>
		<TD nowrap>
			<DIV align="center"><SELECT name="E01RLCI09" <%= disabled %>>
				<OPTION value=" " <% if (!(msg01.getE01RLCI09().equals("Y")||msg01.getE01RLCI09().equals("N"))) out.print("selected"); %>></OPTION>
				<OPTION value="Y" <% if (msg01.getE01RLCI09().equals("Y")) out.print("selected"); %>>Yes</OPTION>
				<OPTION value="N" <% if (msg01.getE01RLCI09().equals("N")) out.print("selected"); %>>No</OPTION>
			</SELECT></DIV>
		</TD>
		<TD nowrap><%	field = "E01APPF" + ( x < 10 ? "0" : "") + x; x++; %>
			<SELECT name="<%=field%>" <%= disabled %>> 
				<OPTION value=" "> </OPTION>
				<OPTION value="I" <% if (msg01.getField(field).getString().equals("I")) out.print("selected"); %>>Opening</OPTION>
				<OPTION value="A" <% if (msg01.getField(field).getString().equals("A")) out.print("selected"); %>>Amendment</OPTION>
				<OPTION value="E" <% if (msg01.getField(field).getString().equals("E")) out.print("selected"); %>>Extension of Validity</OPTION>
				<OPTION value="N" <% if (msg01.getField(field).getString().equals("N")) out.print("selected"); %>>Increase</OPTION>
				<OPTION value="T" <% if (msg01.getField(field).getString().equals("T")) out.print("selected"); %>>Transfer</OPTION>
				<OPTION value="P" <% if (msg01.getField(field).getString().equals("P")) out.print("selected"); %>>Assignment Of Proceeds</OPTION>
				<OPTION value="1" <% if (msg01.getField(field).getString().equals("1")) out.print("selected"); %>>Payment</OPTION>
				<OPTION value="2" <% if (msg01.getField(field).getString().equals("2")) out.print("selected"); %>>Negotiation</OPTION>
				<OPTION value="3" <% if (msg01.getField(field).getString().equals("3")) out.print("selected"); %>>Payment and Negotiation</OPTION>
				<OPTION value="4" <% if (msg01.getField(field).getString().equals("4")) out.print("selected"); %>>Cancellation</OPTION>
				<OPTION value="X" <% if (msg01.getField(field).getString().equals("X")) out.print("selected"); %>>Allways</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id="trdark">
		<TD nowrap>
			<DIV align="right">Deferred Payment :</DIV>
		</TD>
		<TD nowrap></TD>
		<TD nowrap>
			<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCDPB" size="12" maxlength="11" value="<%= msg01.getE01RLCDPB().trim()%>" onKeyPress="return enterDecimalNum(event)"></DIV>
		</TD>
		<TD nowrap>
			<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCDBP" size="5" maxlength="4" value="<%= msg01.getE01RLCDBP().trim()%>" onKeyPress="enterInteger()"></DIV>
		</TD>
		<TD nowrap>
			<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCDPM" size="12" maxlength="11" value="<%= msg01.getE01RLCDPM().trim()%>" onKeyPress="enterDecimal()"></DIV>
		</TD>
		<TD nowrap>
			<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCDMX" size="12" maxlength="11" value="<%= msg01.getE01RLCDMX().trim()%>" onKeyPress="enterDecimal()"></DIV>
		</TD>
		<TD nowrap>
			<DIV align="center"><SELECT name="E01RLCI10" <%= disabled %>>
				<OPTION value=" " <% if (!(msg01.getE01RLCI10().equals("Y")||msg01.getE01RLCI10().equals("N"))) out.print("selected"); %>></OPTION>
				<OPTION value="Y" <% if (msg01.getE01RLCI10().equals("Y")) out.print("selected"); %>>Yes</OPTION>
				<OPTION value="N" <% if (msg01.getE01RLCI10().equals("N")) out.print("selected"); %>>No</OPTION>
			</SELECT></DIV>
		</TD>
		<TD nowrap><%	field = "E01APPF" + ( x < 10 ? "0" : "") + x; x++; %>
			<SELECT name="<%=field%>" <%= disabled %>> 
				<OPTION value=" "> </OPTION>
				<OPTION value="I" <% if (msg01.getField(field).getString().equals("I")) out.print("selected"); %>>Opening</OPTION>
				<OPTION value="A" <% if (msg01.getField(field).getString().equals("A")) out.print("selected"); %>>Amendment</OPTION>
				<OPTION value="E" <% if (msg01.getField(field).getString().equals("E")) out.print("selected"); %>>Extension of Validity</OPTION>
				<OPTION value="N" <% if (msg01.getField(field).getString().equals("N")) out.print("selected"); %>>Increase</OPTION>
				<OPTION value="T" <% if (msg01.getField(field).getString().equals("T")) out.print("selected"); %>>Transfer</OPTION>
				<OPTION value="P" <% if (msg01.getField(field).getString().equals("P")) out.print("selected"); %>>Assignment Of Proceeds</OPTION>
				<OPTION value="1" <% if (msg01.getField(field).getString().equals("1")) out.print("selected"); %>>Payment</OPTION>
				<OPTION value="2" <% if (msg01.getField(field).getString().equals("2")) out.print("selected"); %>>Negotiation</OPTION>
				<OPTION value="3" <% if (msg01.getField(field).getString().equals("3")) out.print("selected"); %>>Payment and Negotiation</OPTION>
				<OPTION value="4" <% if (msg01.getField(field).getString().equals("4")) out.print("selected"); %>>Cancellation</OPTION>
				<OPTION value="X" <% if (msg01.getField(field).getString().equals("X")) out.print("selected"); %>>Allways</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id="trclear">
		<TD nowrap>
			<DIV align="right">Negotiation :</DIV>
		</TD>
		<TD nowrap></TD>
		<TD nowrap>
			<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCNBR" size="12" maxlength="11" value="<%= msg01.getE01RLCNBR().trim()%>" onKeyPress="return enterDecimalNum(event)"></DIV>
		</TD>
		<TD nowrap></TD>
		<TD nowrap>
			<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCNMF" size="12" maxlength="11" value="<%= msg01.getE01RLCNMF().trim()%>" onKeyPress="enterDecimal()"></DIV>
		</TD>
		<TD nowrap>
			<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCNMX" size="12" maxlength="11" value="<%= msg01.getE01RLCNMX().trim()%>" onKeyPress="enterDecimal()"></DIV>
		</TD>
		<TD nowrap>
			<DIV align="center"><SELECT name="E01RLCI11" <%= disabled %>>
				<OPTION value=" " <% if (!(msg01.getE01RLCI11().equals("Y")||msg01.getE01RLCI11().equals("N"))) out.print("selected"); %>></OPTION>
				<OPTION value="Y" <% if (msg01.getE01RLCI11().equals("Y")) out.print("selected"); %>>Yes</OPTION>
				<OPTION value="N" <% if (msg01.getE01RLCI11().equals("N")) out.print("selected"); %>>No</OPTION>
			</SELECT></DIV>
		</TD>
		<TD nowrap><%	field = "E01APPF" + ( x < 10 ? "0" : "") + x; x++; %>
			<SELECT name="<%=field%>" <%= disabled %>> 
				<OPTION value=" "> </OPTION>
				<OPTION value="I" <% if (msg01.getField(field).getString().equals("I")) out.print("selected"); %>>Opening</OPTION>
				<OPTION value="A" <% if (msg01.getField(field).getString().equals("A")) out.print("selected"); %>>Amendment</OPTION>
				<OPTION value="E" <% if (msg01.getField(field).getString().equals("E")) out.print("selected"); %>>Extension of Validity</OPTION>
				<OPTION value="N" <% if (msg01.getField(field).getString().equals("N")) out.print("selected"); %>>Increase</OPTION>
				<OPTION value="T" <% if (msg01.getField(field).getString().equals("T")) out.print("selected"); %>>Transfer</OPTION>
				<OPTION value="P" <% if (msg01.getField(field).getString().equals("P")) out.print("selected"); %>>Assignment Of Proceeds</OPTION>
				<OPTION value="1" <% if (msg01.getField(field).getString().equals("1")) out.print("selected"); %>>Payment</OPTION>
				<OPTION value="2" <% if (msg01.getField(field).getString().equals("2")) out.print("selected"); %>>Negotiation</OPTION>
				<OPTION value="3" <% if (msg01.getField(field).getString().equals("3")) out.print("selected"); %>>Payment and Negotiation</OPTION>
				<OPTION value="4" <% if (msg01.getField(field).getString().equals("4")) out.print("selected"); %>>Cancellation</OPTION>
				<OPTION value="X" <% if (msg01.getField(field).getString().equals("X")) out.print("selected"); %>>Allways</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id="trdark">
		<TD nowrap>
			<DIV align="right">Assignment of Proceeds :</DIV>
		</TD>
		<TD nowrap></TD>
		<TD nowrap>
			<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCAPB" size="12" maxlength="11" value="<%= msg01.getE01RLCAPB().trim()%>" onKeyPress="return enterDecimalNum(event)"></DIV>
		</TD>
		<TD nowrap></TD>
		<TD nowrap>
			<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCAPM" size="12" maxlength="11" value="<%= msg01.getE01RLCAPM().trim()%>" onKeyPress="enterDecimal()"></DIV>
		</TD>
		<TD nowrap>
			<DIV align="center"></DIV>
		</TD>
		<TD nowrap>
			<DIV align="center"><SELECT name="E01RLCI12" <%= disabled %>>
				<OPTION value=" " <% if (!(msg01.getE01RLCI12().equals("Y")||msg01.getE01RLCI12().equals("N"))) out.print("selected"); %>></OPTION>
				<OPTION value="Y" <% if (msg01.getE01RLCI12().equals("Y")) out.print("selected"); %>>Yes</OPTION>
				<OPTION value="N" <% if (msg01.getE01RLCI12().equals("N")) out.print("selected"); %>>No</OPTION>
			</SELECT></DIV>
		</TD>
		<TD nowrap><%	field = "E01APPF" + ( x < 10 ? "0" : "") + x; x++; %>
			<SELECT name="<%=field%>" <%= disabled %>> 
				<OPTION value=" "> </OPTION>
				<OPTION value="I" <% if (msg01.getField(field).getString().equals("I")) out.print("selected"); %>>Opening</OPTION>
				<OPTION value="A" <% if (msg01.getField(field).getString().equals("A")) out.print("selected"); %>>Amendment</OPTION>
				<OPTION value="E" <% if (msg01.getField(field).getString().equals("E")) out.print("selected"); %>>Extension of Validity</OPTION>
				<OPTION value="N" <% if (msg01.getField(field).getString().equals("N")) out.print("selected"); %>>Increase</OPTION>
				<OPTION value="T" <% if (msg01.getField(field).getString().equals("T")) out.print("selected"); %>>Transfer</OPTION>
				<OPTION value="P" <% if (msg01.getField(field).getString().equals("P")) out.print("selected"); %>>Assignment Of Proceeds</OPTION>
				<OPTION value="1" <% if (msg01.getField(field).getString().equals("1")) out.print("selected"); %>>Payment</OPTION>
				<OPTION value="2" <% if (msg01.getField(field).getString().equals("2")) out.print("selected"); %>>Negotiation</OPTION>
				<OPTION value="3" <% if (msg01.getField(field).getString().equals("3")) out.print("selected"); %>>Payment and Negotiation</OPTION>
				<OPTION value="4" <% if (msg01.getField(field).getString().equals("4")) out.print("selected"); %>>Cancellation</OPTION>
				<OPTION value="X" <% if (msg01.getField(field).getString().equals("X")) out.print("selected"); %>>Allways</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id="trclear">
		<TD nowrap>
			<DIV align="right">Transfer :</DIV>
		</TD>
		<TD nowrap></TD>
		<TD nowrap>
			<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCTBR" size="12" maxlength="11" value="<%= msg01.getE01RLCTBR().trim()%>" onKeyPress="return enterDecimalNum(event)"></DIV>
		</TD>
		<TD nowrap></TD>
		<TD nowrap>
			<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCTMF" size="12" maxlength="11" value="<%= msg01.getE01RLCTMF().trim()%>" onKeyPress="enterDecimal()"></DIV>
		</TD>
		<TD nowrap>
			<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCTMX" size="12" maxlength="11" value="<%= msg01.getE01RLCTMX().trim()%>" onKeyPress="enterDecimal()"></DIV>
		</TD>
		<TD nowrap>
			<DIV align="center"><SELECT name="E01RLCI13" <%= disabled %>>
				<OPTION value=" " <% if (!(msg01.getE01RLCI13().equals("Y")||msg01.getE01RLCI13().equals("N"))) out.print("selected"); %>></OPTION>
				<OPTION value="Y" <% if (msg01.getE01RLCI13().equals("Y")) out.print("selected"); %>>Yes</OPTION>
				<OPTION value="N" <% if (msg01.getE01RLCI13().equals("N")) out.print("selected"); %>>No</OPTION>
			</SELECT></DIV>
		</TD>
		<TD nowrap><%	field = "E01APPF" + ( x < 10 ? "0" : "") + x; x++; %>
			<SELECT name="<%=field%>" <%= disabled %>> 
				<OPTION value=" "> </OPTION>
				<OPTION value="I" <% if (msg01.getField(field).getString().equals("I")) out.print("selected"); %>>Opening</OPTION>
				<OPTION value="A" <% if (msg01.getField(field).getString().equals("A")) out.print("selected"); %>>Amendment</OPTION>
				<OPTION value="E" <% if (msg01.getField(field).getString().equals("E")) out.print("selected"); %>>Extension of Validity</OPTION>
				<OPTION value="N" <% if (msg01.getField(field).getString().equals("N")) out.print("selected"); %>>Increase</OPTION>
				<OPTION value="T" <% if (msg01.getField(field).getString().equals("T")) out.print("selected"); %>>Transfer</OPTION>
				<OPTION value="P" <% if (msg01.getField(field).getString().equals("P")) out.print("selected"); %>>Assignment Of Proceeds</OPTION>
				<OPTION value="1" <% if (msg01.getField(field).getString().equals("1")) out.print("selected"); %>>Payment</OPTION>
				<OPTION value="2" <% if (msg01.getField(field).getString().equals("2")) out.print("selected"); %>>Negotiation</OPTION>
				<OPTION value="3" <% if (msg01.getField(field).getString().equals("3")) out.print("selected"); %>>Payment and Negotiation</OPTION>
				<OPTION value="4" <% if (msg01.getField(field).getString().equals("4")) out.print("selected"); %>>Cancellation</OPTION>
				<OPTION value="X" <% if (msg01.getField(field).getString().equals("X")) out.print("selected"); %>>Allways</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id="trdark">
		<TD nowrap>
			<DIV align="right">Postage :</DIV>
		</TD>
		<TD nowrap>
			<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCPST" size="12" maxlength="11" value="<%= msg01.getE01RLCPST().trim()%>" onKeyPress="enterDecimal()"></DIV>
		</TD>
		<TD nowrap></TD>
		<TD nowrap></TD>
		<TD nowrap></TD>
		<TD nowrap></TD>
		<TD nowrap>
			<DIV align="center"><SELECT name="E01RLCI14" <%= disabled %>>
				<OPTION value=" " <% if (!(msg01.getE01RLCI14().equals("Y")||msg01.getE01RLCI14().equals("N"))) out.print("selected"); %>></OPTION>
				<OPTION value="Y" <% if (msg01.getE01RLCI14().equals("Y")) out.print("selected"); %>>Yes</OPTION>
				<OPTION value="N" <% if (msg01.getE01RLCI14().equals("N")) out.print("selected"); %>>No</OPTION>
			</SELECT></DIV>
		</TD>
		<TD nowrap><%	field = "E01APPF" + ( x < 10 ? "0" : "") + x; x++; %>
			<SELECT name="<%=field%>" <%= disabled %>> 
				<OPTION value=" "> </OPTION>
				<OPTION value="I" <% if (msg01.getField(field).getString().equals("I")) out.print("selected"); %>>Opening</OPTION>
				<OPTION value="A" <% if (msg01.getField(field).getString().equals("A")) out.print("selected"); %>>Amendment</OPTION>
				<OPTION value="E" <% if (msg01.getField(field).getString().equals("E")) out.print("selected"); %>>Extension of Validity</OPTION>
				<OPTION value="N" <% if (msg01.getField(field).getString().equals("N")) out.print("selected"); %>>Increase</OPTION>
				<OPTION value="T" <% if (msg01.getField(field).getString().equals("T")) out.print("selected"); %>>Transfer</OPTION>
				<OPTION value="P" <% if (msg01.getField(field).getString().equals("P")) out.print("selected"); %>>Assignment Of Proceeds</OPTION>
				<OPTION value="1" <% if (msg01.getField(field).getString().equals("1")) out.print("selected"); %>>Payment</OPTION>
				<OPTION value="2" <% if (msg01.getField(field).getString().equals("2")) out.print("selected"); %>>Negotiation</OPTION>
				<OPTION value="3" <% if (msg01.getField(field).getString().equals("3")) out.print("selected"); %>>Payment and Negotiation</OPTION>
				<OPTION value="4" <% if (msg01.getField(field).getString().equals("4")) out.print("selected"); %>>Cancellation</OPTION>
				<OPTION value="X" <% if (msg01.getField(field).getString().equals("X")) out.print("selected"); %>>Allways</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id="trclear">
		<TD nowrap>
			<DIV align="right">Courier :</DIV>
		</TD>
		<TD nowrap>
			<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCCOU" size="12" maxlength="11" value="<%= msg01.getE01RLCCOU().trim()%>" onKeyPress="enterDecimal()"></DIV>
		</TD>
		<TD nowrap></TD>
		<TD nowrap></TD>
		<TD nowrap></TD>
		<TD nowrap></TD>
		<TD nowrap>
			<DIV align="center"><SELECT name="E01RLCI15" <%= disabled %>>
				<OPTION value=" " <% if (!(msg01.getE01RLCI15().equals("Y")||msg01.getE01RLCI15().equals("N"))) out.print("selected"); %>></OPTION>
				<OPTION value="Y" <% if (msg01.getE01RLCI15().equals("Y")) out.print("selected"); %>>Yes</OPTION>
				<OPTION value="N" <% if (msg01.getE01RLCI15().equals("N")) out.print("selected"); %>>No</OPTION>
			</SELECT></DIV>
		</TD>
		<TD nowrap><%	field = "E01APPF" + ( x < 10 ? "0" : "") + x; x++; %>
			<SELECT name="<%=field%>" <%= disabled %>> 
				<OPTION value=" "> </OPTION>
				<OPTION value="I" <% if (msg01.getField(field).getString().equals("I")) out.print("selected"); %>>Opening</OPTION>
				<OPTION value="A" <% if (msg01.getField(field).getString().equals("A")) out.print("selected"); %>>Amendment</OPTION>
				<OPTION value="E" <% if (msg01.getField(field).getString().equals("E")) out.print("selected"); %>>Extension of Validity</OPTION>
				<OPTION value="N" <% if (msg01.getField(field).getString().equals("N")) out.print("selected"); %>>Increase</OPTION>
				<OPTION value="T" <% if (msg01.getField(field).getString().equals("T")) out.print("selected"); %>>Transfer</OPTION>
				<OPTION value="P" <% if (msg01.getField(field).getString().equals("P")) out.print("selected"); %>>Assignment Of Proceeds</OPTION>
				<OPTION value="1" <% if (msg01.getField(field).getString().equals("1")) out.print("selected"); %>>Payment</OPTION>
				<OPTION value="2" <% if (msg01.getField(field).getString().equals("2")) out.print("selected"); %>>Negotiation</OPTION>
				<OPTION value="3" <% if (msg01.getField(field).getString().equals("3")) out.print("selected"); %>>Payment and Negotiation</OPTION>
				<OPTION value="4" <% if (msg01.getField(field).getString().equals("4")) out.print("selected"); %>>Cancellation</OPTION>
				<OPTION value="X" <% if (msg01.getField(field).getString().equals("X")) out.print("selected"); %>>Allways</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id="trdark">
		<TD nowrap>
			<DIV align="right">Cancellation :</DIV>
		</TD>
		<TD nowrap>
			<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCCAN" size="12" maxlength="11" value="<%= msg01.getE01RLCCAN().trim()%>" onKeyPress="enterDecimal()"></DIV>
		</TD>
		<TD nowrap></TD>
		<TD nowrap></TD>
		<TD nowrap></TD>
		<TD nowrap></TD>
		<TD nowrap>
			<DIV align="center"><SELECT name="E01RLCI16" <%= disabled %>>
				<OPTION value=" " <% if (!(msg01.getE01RLCI16().equals("Y")||msg01.getE01RLCI16().equals("N"))) out.print("selected"); %>></OPTION>
				<OPTION value="Y" <% if (msg01.getE01RLCI16().equals("Y")) out.print("selected"); %>>Yes</OPTION>
				<OPTION value="N" <% if (msg01.getE01RLCI16().equals("N")) out.print("selected"); %>>No</OPTION>
			</SELECT></DIV>
		</TD>
		<TD nowrap><%	field = "E01APPF" + ( x < 10 ? "0" : "") + x; x++; %>
			<SELECT name="<%=field%>" <%= disabled %>> 
				<OPTION value=" "> </OPTION>
				<OPTION value="I" <% if (msg01.getField(field).getString().equals("I")) out.print("selected"); %>>Opening</OPTION>
				<OPTION value="A" <% if (msg01.getField(field).getString().equals("A")) out.print("selected"); %>>Amendment</OPTION>
				<OPTION value="E" <% if (msg01.getField(field).getString().equals("E")) out.print("selected"); %>>Extension of Validity</OPTION>
				<OPTION value="N" <% if (msg01.getField(field).getString().equals("N")) out.print("selected"); %>>Increase</OPTION>
				<OPTION value="T" <% if (msg01.getField(field).getString().equals("T")) out.print("selected"); %>>Transfer</OPTION>
				<OPTION value="P" <% if (msg01.getField(field).getString().equals("P")) out.print("selected"); %>>Assignment Of Proceeds</OPTION>
				<OPTION value="1" <% if (msg01.getField(field).getString().equals("1")) out.print("selected"); %>>Payment</OPTION>
				<OPTION value="2" <% if (msg01.getField(field).getString().equals("2")) out.print("selected"); %>>Negotiation</OPTION>
				<OPTION value="3" <% if (msg01.getField(field).getString().equals("3")) out.print("selected"); %>>Payment and Negotiation</OPTION>
				<OPTION value="4" <% if (msg01.getField(field).getString().equals("4")) out.print("selected"); %>>Cancellation</OPTION>
				<OPTION value="X" <% if (msg01.getField(field).getString().equals("X")) out.print("selected"); %>>Allways</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id="trclear">
		<TD nowrap>
			<DIV align="right">Funds Transfer :</DIV>
		</TD>
		<TD nowrap>
			<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCWTF" size="12" maxlength="11" value="<%= msg01.getE01RLCWTF().trim()%>" onKeyPress="enterDecimal()"></DIV>
		</TD>
		<TD nowrap></TD>
		<TD nowrap></TD>
		<TD nowrap></TD>
		<TD nowrap></TD>
		<TD nowrap>
			<DIV align="center"><SELECT name="E01RLCI18" <%= disabled %>>
				<OPTION value=" " <% if (!(msg01.getE01RLCI18().equals("Y")||msg01.getE01RLCI18().equals("N"))) out.print("selected"); %>></OPTION>
				<OPTION value="Y" <% if (msg01.getE01RLCI18().equals("Y")) out.print("selected"); %>>Yes</OPTION>
				<OPTION value="N" <% if (msg01.getE01RLCI18().equals("N")) out.print("selected"); %>>No</OPTION>
			</SELECT></DIV>
		</TD>
		<TD nowrap><%	field = "E01APPF" + ( x < 10 ? "0" : "") + x; x++; %>
			<SELECT name="<%=field%>" <%= disabled %>> 
				<OPTION value=" "> </OPTION>
				<OPTION value="I" <% if (msg01.getField(field).getString().equals("I")) out.print("selected"); %>>Opening</OPTION>
				<OPTION value="A" <% if (msg01.getField(field).getString().equals("A")) out.print("selected"); %>>Amendment</OPTION>
				<OPTION value="E" <% if (msg01.getField(field).getString().equals("E")) out.print("selected"); %>>Extension of Validity</OPTION>
				<OPTION value="N" <% if (msg01.getField(field).getString().equals("N")) out.print("selected"); %>>Increase</OPTION>
				<OPTION value="T" <% if (msg01.getField(field).getString().equals("T")) out.print("selected"); %>>Transfer</OPTION>
				<OPTION value="P" <% if (msg01.getField(field).getString().equals("P")) out.print("selected"); %>>Assignment Of Proceeds</OPTION>
				<OPTION value="1" <% if (msg01.getField(field).getString().equals("1")) out.print("selected"); %>>Payment</OPTION>
				<OPTION value="2" <% if (msg01.getField(field).getString().equals("2")) out.print("selected"); %>>Negotiation</OPTION>
				<OPTION value="3" <% if (msg01.getField(field).getString().equals("3")) out.print("selected"); %>>Payment and Negotiation</OPTION>
				<OPTION value="4" <% if (msg01.getField(field).getString().equals("4")) out.print("selected"); %>>Cancellation</OPTION>
				<OPTION value="X" <% if (msg01.getField(field).getString().equals("X")) out.print("selected"); %>>Allways</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id="trdark">
		<TD nowrap>
			<DIV align="right">Issuance Swift :</DIV>
		</TD>
		<TD nowrap>
			<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCCTF" size="12" maxlength="11" value="<%= msg01.getE01RLCCTF().trim()%>" onKeyPress="enterDecimal()"></DIV>
		</TD>
		<TD nowrap></TD>
		<TD nowrap></TD>
		<TD nowrap></TD>
		<TD nowrap></TD>
		<TD nowrap>
			<DIV align="center"><SELECT name="E01RLCI19" <%= disabled %>>
				<OPTION value=" " <% if (!(msg01.getE01RLCI19().equals("Y")||msg01.getE01RLCI19().equals("N"))) out.print("selected"); %>></OPTION>
				<OPTION value="Y" <% if (msg01.getE01RLCI19().equals("Y")) out.print("selected"); %>>Yes</OPTION>
				<OPTION value="N" <% if (msg01.getE01RLCI19().equals("N")) out.print("selected"); %>>No</OPTION>
			</SELECT></DIV>
		</TD>
		<TD nowrap><%	field = "E01APPF" + ( x < 10 ? "0" : "") + x; x++; %>
			<SELECT name="<%=field%>" <%= disabled %>> 
				<OPTION value=" "> </OPTION>
				<OPTION value="I" <% if (msg01.getField(field).getString().equals("I")) out.print("selected"); %>>Opening</OPTION>
				<OPTION value="A" <% if (msg01.getField(field).getString().equals("A")) out.print("selected"); %>>Amendment</OPTION>
				<OPTION value="E" <% if (msg01.getField(field).getString().equals("E")) out.print("selected"); %>>Extension of Validity</OPTION>
				<OPTION value="N" <% if (msg01.getField(field).getString().equals("N")) out.print("selected"); %>>Increase</OPTION>
				<OPTION value="T" <% if (msg01.getField(field).getString().equals("T")) out.print("selected"); %>>Transfer</OPTION>
				<OPTION value="P" <% if (msg01.getField(field).getString().equals("P")) out.print("selected"); %>>Assignment Of Proceeds</OPTION>
				<OPTION value="1" <% if (msg01.getField(field).getString().equals("1")) out.print("selected"); %>>Payment</OPTION>
				<OPTION value="2" <% if (msg01.getField(field).getString().equals("2")) out.print("selected"); %>>Negotiation</OPTION>
				<OPTION value="3" <% if (msg01.getField(field).getString().equals("3")) out.print("selected"); %>>Payment and Negotiation</OPTION>
				<OPTION value="4" <% if (msg01.getField(field).getString().equals("4")) out.print("selected"); %>>Cancellation</OPTION>
				<OPTION value="X" <% if (msg01.getField(field).getString().equals("X")) out.print("selected"); %>>Allways</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id="trclear">
		<TD nowrap>
			<DIV align="right">Additional Swift :</DIV>
		</TD>
		<TD nowrap>
			<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCCTM" size="12" maxlength="11" value="<%= msg01.getE01RLCCTM().trim()%>" onKeyPress="enterDecimal()"></DIV>
		</TD>
		<TD nowrap></TD>
		<TD nowrap></TD>
		<TD nowrap></TD>
		<TD nowrap></TD>
		<TD nowrap>
			<DIV align="center"><SELECT name="E01RLCI20" <%= disabled %>>
				<OPTION value=" " <% if (!(msg01.getE01RLCI20().equals("Y")||msg01.getE01RLCI20().equals("N"))) out.print("selected"); %>></OPTION>
				<OPTION value="Y" <% if (msg01.getE01RLCI20().equals("Y")) out.print("selected"); %>>Yes</OPTION>
				<OPTION value="N" <% if (msg01.getE01RLCI20().equals("N")) out.print("selected"); %>>No</OPTION>
			</SELECT></DIV>
		</TD>
		<TD nowrap><%	field = "E01APPF" + ( x < 10 ? "0" : "") + x; x++; %>
			<SELECT name="<%=field%>" <%= disabled %>> 
				<OPTION value=" "> </OPTION>
				<OPTION value="I" <% if (msg01.getField(field).getString().equals("I")) out.print("selected"); %>>Opening</OPTION>
				<OPTION value="A" <% if (msg01.getField(field).getString().equals("A")) out.print("selected"); %>>Amendment</OPTION>
				<OPTION value="E" <% if (msg01.getField(field).getString().equals("E")) out.print("selected"); %>>Extension of Validity</OPTION>
				<OPTION value="N" <% if (msg01.getField(field).getString().equals("N")) out.print("selected"); %>>Increase</OPTION>
				<OPTION value="T" <% if (msg01.getField(field).getString().equals("T")) out.print("selected"); %>>Transfer</OPTION>
				<OPTION value="P" <% if (msg01.getField(field).getString().equals("P")) out.print("selected"); %>>Assignment Of Proceeds</OPTION>
				<OPTION value="1" <% if (msg01.getField(field).getString().equals("1")) out.print("selected"); %>>Payment</OPTION>
				<OPTION value="2" <% if (msg01.getField(field).getString().equals("2")) out.print("selected"); %>>Negotiation</OPTION>
				<OPTION value="3" <% if (msg01.getField(field).getString().equals("3")) out.print("selected"); %>>Payment and Negotiation</OPTION>
				<OPTION value="4" <% if (msg01.getField(field).getString().equals("4")) out.print("selected"); %>>Cancellation</OPTION>
				<OPTION value="X" <% if (msg01.getField(field).getString().equals("X")) out.print("selected"); %>>Allways</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR id="trdark">
		<TD nowrap>
			<DIV align="right">Reimbursement :</DIV>
		</TD>
		<TD nowrap>
			<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCCA2" size="12" maxlength="11" value="<%= msg01.getE01RLCCA2().trim()%>" onKeyPress="enterDecimal()"></DIV>
		</TD>
		<TD nowrap></TD>
		<TD nowrap></TD>
		<TD nowrap></TD>
		<TD nowrap></TD>
		<TD nowrap>
			<DIV align="center"><SELECT name="E01RLCCI2" <%= disabled %>>
				<OPTION value=" " <% if (!(msg01.getE01RLCCI1().equals("Y")||msg01.getE01RLCCI2().equals("N"))) out.print("selected"); %>></OPTION>
				<OPTION value="Y" <% if (msg01.getE01RLCCI2().equals("Y")) out.print("selected"); %>>Yes</OPTION>
				<OPTION value="N" <% if (msg01.getE01RLCCI2().equals("N")) out.print("selected"); %>>No</OPTION>
			</SELECT></DIV>
		</TD>
		<TD nowrap><%	field = "E01RLCAF2"; %>
			<SELECT name="<%=field%>" <%= disabled %>> 
				<OPTION value=" "> </OPTION>
				<OPTION value="I" <% if (msg01.getField(field).getString().equals("I")) out.print("selected"); %>>Opening</OPTION>
				<OPTION value="A" <% if (msg01.getField(field).getString().equals("A")) out.print("selected"); %>>Amendment</OPTION>
				<OPTION value="E" <% if (msg01.getField(field).getString().equals("E")) out.print("selected"); %>>Extension of Validity</OPTION>
				<OPTION value="N" <% if (msg01.getField(field).getString().equals("N")) out.print("selected"); %>>Increase</OPTION>
				<OPTION value="T" <% if (msg01.getField(field).getString().equals("T")) out.print("selected"); %>>Transfer</OPTION>
				<OPTION value="P" <% if (msg01.getField(field).getString().equals("P")) out.print("selected"); %>>Assignment Of Proceeds</OPTION>
				<OPTION value="1" <% if (msg01.getField(field).getString().equals("1")) out.print("selected"); %>>Payment</OPTION>
				<OPTION value="2" <% if (msg01.getField(field).getString().equals("2")) out.print("selected"); %>>Negotiation</OPTION>
				<OPTION value="3" <% if (msg01.getField(field).getString().equals("3")) out.print("selected"); %>>Payment and Negotiation</OPTION>
				<OPTION value="4" <% if (msg01.getField(field).getString().equals("4")) out.print("selected"); %>>Cancellation</OPTION>
				<OPTION value="X" <% if (msg01.getField(field).getString().equals("X")) out.print("selected"); %>>Allways</OPTION>
			</SELECT>
		</TD>
	</TR>
</TBODY>
</TABLE>

<BR>
<H4>Accounting</H4>
<TABLE class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
			<TR id="trdark">
				<TD nowrap align="right" width="178"><B>Concept </B></TD>
				<TD nowrap align="center" width="199"><B>G/L Account</B></TD>
				<TD nowrap align="center" width="260"><B>Description</B></TD>
			</TR>
			<TR id="trclear">
				<TD nowrap width="178">
				<DIV align="right">Issuance :</DIV>
				</TD>
				<TD nowrap width="212">
				<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCGIS" size="19" maxlength="16" value="<%= msg01.getE01RLCGIS().trim()%>" onkeypress="enterInteger()"> 
				<% if (readonly.equals("")) { %>
					<A href="javascript:GetLedger('E01RLCGIS',document.forms[0].E01RLCBNK.value,document.forms[0].E01RLCACY.value,'')">
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="help"  border="0"></A>
				<% } %>	
				</DIV>
				</TD>
				<TD nowrap width="234">
				<DIV align="center"><INPUT type="text" name="E01DSCGIS" size="40" maxlength="35" value="<%= msg01.getE01DSCGIS().trim()%>" readonly></DIV>
				</TD>
			</TR>
			<TR id="trdark">
				<TD nowrap width="178">
				<DIV align="right">Advising :</DIV>
				</TD>
				<TD nowrap width="212">
				<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCGAD" size="19" maxlength="16" value="<%= msg01.getE01RLCGAD().trim()%>"	onkeypress="enterInteger()"> 
				<% if (readonly.equals("")) { %>
					<A href="javascript:GetLedger('E01RLCGAD',document.forms[0].E01RLCBNK.value,document.forms[0].E01RLCACY.value,'')">
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="help"  border="0"></A>
				<% } %>	
				</DIV>
				</TD>
				<TD nowrap width="234">
				<DIV align="center"><INPUT type="text" name="E01DSCGAD" size="40" maxlength="35" value="<%= msg01.getE01DSCGAD().trim()%>" readonly></DIV>
				</TD>
			</TR>
			<TR id="trclear">
				<TD nowrap width="178">
				<DIV align="right">Confirmation :</DIV>
				</TD>
				<TD nowrap width="212">
				<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCGCO" size="19" maxlength="16" value="<%= msg01.getE01RLCGCO().trim()%>" onkeypress="enterInteger()"> 
				<% if (readonly.equals("")) { %>
					<A href="javascript:GetLedger('E01RLCGCO',document.forms[0].E01RLCBNK.value,document.forms[0].E01RLCACY.value,'')">
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="help"  border="0"></A>
				<% } %>	
				</DIV>
				</TD>
				<TD nowrap width="234">
				<DIV align="center"><INPUT type="text" name="E01DSCGCO" size="40" maxlength="35" value="<%= msg01.getE01DSCGCO().trim()%>" readonly></DIV>
				</TD>
			</TR>
			<TR id="trdark">
				<TD nowrap width="178">
				<DIV align="right">Extension Of Validity :</DIV>
				</TD>
				<TD nowrap width="212">

				<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCGEV" size="19" maxlength="16" value="<%= msg01.getE01RLCGEV().trim()%>" onkeypress="enterInteger()"> 
				<% if (readonly.equals("")) { %>
					<A href="javascript:GetLedger('E01RLCGEV',document.forms[0].E01RLCBNK.value,document.forms[0].E01RLCACY.value,'')">
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="help"  border="0"></A>
				<% } %>	
				</DIV>
				</TD>
				<TD nowrap width="234">
				<DIV align="center"><INPUT type="text" name="E01DSCGEV" size="40" maxlength="35" value="<%= msg01.getE01DSCGEV().trim()%>" readonly></DIV>
				</TD>
			</TR>
			<TR id="trclear">
				<TD nowrap width="178">
				<DIV align="right">Amendment :</DIV>
				</TD>
				<TD nowrap width="212">
				<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCGAM" size="19" maxlength="16" value="<%= msg01.getE01RLCGAM().trim()%>" onkeypress="enterInteger()"> 
				<% if (readonly.equals("")) { %>
					<A href="javascript:GetLedger('E01RLCGAM',document.forms[0].E01RLCBNK.value,document.forms[0].E01RLCACY.value,'')">
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="help"  border="0"></A>
				<% } %>	
				</DIV>
				</TD>
				<TD nowrap width="234">
				<DIV align="center"><INPUT type="text" name="E01DSCGAM" size="40" maxlength="35" value="<%= msg01.getE01DSCGAM().trim()%>" readonly></DIV>
				</TD>
			</TR>
			<TR id="trdark">
				<TD nowrap width="178">
				<DIV align="right">Advising Amendment :</DIV>
				</TD>
				<TD nowrap width="212">
				<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCGAA" size="19" maxlength="16" value="<%= msg01.getE01RLCGAA().trim()%>" onkeypress="enterInteger()"> 
				<% if (readonly.equals("")) { %>
					<A href="javascript:GetLedger('E01RLCGAA',document.forms[0].E01RLCBNK.value,document.forms[0].E01RLCACY.value,'')">
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="help"  border="0"></A>
				<% } %>	
				</DIV>
				</TD>
				<TD nowrap width="234">
				<DIV align="center"><INPUT type="text" name="E01DSCGAA" size="40" maxlength="35" value="<%= msg01.getE01DSCGAA().trim()%>" readonly></DIV>
				</TD>
			</TR>
			<TR id="trclear">
				<TD nowrap width="178">
				<DIV align="right">Discrepancy :</DIV>
				</TD>
				<TD nowrap width="212">
				<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCGDI" size="19" maxlength="16" value="<%= msg01.getE01RLCGDI().trim()%>" onkeypress="enterInteger()"> 
				<% if (readonly.equals("")) { %>
					<A href="javascript:GetLedger('E01RLCGDI',document.forms[0].E01RLCBNK.value,document.forms[0].E01RLCACY.value,'')">
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="help"  border="0"></A>
				<% } %>	
				</DIV>
				</TD>
				<TD nowrap width="234">
				<DIV align="center"><INPUT type="text" name="E01DSCGDI" size="40" maxlength="35" value="<%= msg01.getE01DSCGDI().trim()%>" readonly></DIV>
				</TD>
			</TR>
			<TR id="trdark">
				<TD nowrap width="178">
				<DIV align="right">Sight Payment :</DIV>
				</TD>
				<TD nowrap width="212">
				<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCGPM" size="19" maxlength="16" value="<%= msg01.getE01RLCGPM().trim()%>"	onkeypress="enterInteger()"> 
				<% if (readonly.equals("")) { %>
					<A href="javascript:GetLedger('E01RLCGPM',document.forms[0].E01RLCBNK.value,document.forms[0].E01RLCACY.value,'')">
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="help"  border="0"></A>
				<% } %>	
				</DIV>
				</TD>
				<TD nowrap width="234">
				<DIV align="center"><INPUT type="text" name="E01DSCGPM" size="40" maxlength="35" value="<%= msg01.getE01DSCGPM().trim()%>" readonly></DIV>
				</TD>
			</TR>
			<TR id="trclear">
				<TD nowrap width="178">
				<DIV align="right">Acceptance :</DIV>
				</TD>
				<TD nowrap width="212">
				<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCGAC" size="19" maxlength="16" value="<%= msg01.getE01RLCGAC().trim()%>"	onkeypress="enterInteger()"> 
				<% if (readonly.equals("")) { %>
					<A href="javascript:GetLedger('E01RLCGAC',document.forms[0].E01RLCBNK.value,document.forms[0].E01RLCACY.value,'')">
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="help"  border="0"></A>
				<% } %>	
				</DIV>
				</TD>
				<TD nowrap width="234">
				<DIV align="center"><INPUT type="text" name="E01DSCGAC" size="40" maxlength="35" value="<%= msg01.getE01DSCGAC().trim()%>" readonly></DIV>
				</TD>
			</TR>
			<TR id="trdark">
				<TD nowrap width="178">
				<DIV align="right">Deferred Payment :</DIV>
				</TD>
				<TD nowrap width="212">
				<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCGDP" size="19" maxlength="16" value="<%= msg01.getE01RLCGDP().trim()%>"	onkeypress="enterInteger()"> 
				<% if (readonly.equals("")) { %>
					<A href="javascript:GetLedger('E01RLCGDP',document.forms[0].E01RLCBNK.value,document.forms[0].E01RLCACY.value,'')">
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="help"  border="0"></A>
				<% } %>	
				</DIV>
				</TD>
				<TD nowrap width="234">
				<DIV align="center"><INPUT type="text" name="E01DSCGDP" size="40" maxlength="35" value="<%= msg01.getE01DSCGDP().trim()%>" readonly></DIV>
				</TD>
			</TR>
			<TR id="trclear">
				<TD nowrap width="178">
				<DIV align="right">Negotiation :</DIV>
				</TD>
				<TD nowrap width="212">
				<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCGNE" size="19" maxlength="16" value="<%= msg01.getE01RLCGNE().trim()%>"	onkeypress="enterInteger()"> 
				<% if (readonly.equals("")) { %>
					<A href="javascript:GetLedger('E01RLCGNE',document.forms[0].E01RLCBNK.value,document.forms[0].E01RLCACY.value,'')">
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="help"  border="0"></A>
				<% } %>	
				</DIV>
				</TD>
				<TD nowrap width="234">
				<DIV align="center"><INPUT type="text" name="E01DSCGNE" size="40" maxlength="35" value="<%= msg01.getE01DSCGNE().trim()%>" readonly></DIV>
				</TD>
			</TR>
			<TR id="trdark">
				<TD nowrap width="178">
				<DIV align="right">Assignment of Proceeds :</DIV>
				</TD>
				<TD nowrap width="212">
				<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCGAS" size="19" maxlength="16" value="<%= msg01.getE01RLCGAS().trim()%>"	onkeypress="enterInteger()"> 
				<% if (readonly.equals("")) { %>
					<A href="javascript:GetLedger('E01RLCGAS',document.forms[0].E01RLCBNK.value,document.forms[0].E01RLCACY.value,'')">
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="help"  border="0"></A>
				<% } %>	
				</DIV>
				</TD>
				<TD nowrap width="234">
				<DIV align="center"><INPUT type="text" name="E01DSCGAS" size="40" maxlength="35" value="<%= msg01.getE01DSCGAS().trim()%>" readonly></DIV>
				</TD>
			</TR>
			<TR id="trclear">
				<TD nowrap width="178">
				<DIV align="right">Transfer :</DIV>
				</TD>
				<TD nowrap width="212">
				<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCGTR" size="19" maxlength="16" value="<%= msg01.getE01RLCGTR().trim()%>"	onkeypress="enterInteger()"> 
				<% if (readonly.equals("")) { %>
					<A href="javascript:GetLedger('E01RLCGTR',document.forms[0].E01RLCBNK.value,document.forms[0].E01RLCACY.value,'')">
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="help"  border="0"></A>
				<% } %>	
				</DIV>
				</TD>
				<TD nowrap width="234">
				<DIV align="center"><INPUT type="text" name="E01DSCGTR" size="40" maxlength="35" value="<%= msg01.getE01DSCGTR().trim()%>" readonly></DIV>
				</TD>
			</TR>
			<TR id="trdark">
				<TD nowrap width="178">
				<DIV align="right">Postage :</DIV>
				</TD>
				<TD nowrap width="212">
				<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCGPO" size="19" maxlength="16" value="<%= msg01.getE01RLCGPO().trim()%>"	onkeypress="enterInteger()"> 
				<% if (readonly.equals("")) { %>
					<A href="javascript:GetLedger('E01RLCGPO',document.forms[0].E01RLCBNK.value,document.forms[0].E01RLCACY.value,'')">
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="help"  border="0"></A>
				<% } %>	
				</DIV>
				</TD>
				<TD nowrap width="234">
				<DIV align="center"><INPUT type="text" name="E01DSCGPO" size="40" maxlength="35" value="<%= msg01.getE01DSCGPO().trim()%>" readonly></DIV>
				</TD>
			</TR>
			<TR id="trclear">
				<TD nowrap width="178">
				<DIV align="right">Courier :</DIV>
				</TD>
				<TD nowrap width="212">
				<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCGCR" size="19" maxlength="16" value="<%= msg01.getE01RLCGCR().trim()%>" onkeypress="enterInteger()"> 
				<% if (readonly.equals("")) { %>
					<A href="javascript:GetLedger('E01RLCGCR',document.forms[0].E01RLCBNK.value,document.forms[0].E01RLCACY.value,'')">
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="help"  border="0"></A>
				<% } %>	
				</DIV>
				</TD>
				<TD nowrap width="234">
				<DIV align="center"><INPUT type="text" name="E01DSCGCR" size="40" maxlength="35" value="<%= msg01.getE01DSCGCR().trim()%>" readonly></DIV>
				</TD>
			</TR>
			<TR id="trdark">
				<TD nowrap width="178">
				<DIV align="right">Cancellation :</DIV>
				</TD>
				<TD nowrap width="212">
				<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCGCA" size="19" maxlength="16" value="<%= msg01.getE01RLCGCA().trim()%>"	onkeypress="enterInteger()"> 
				<% if (readonly.equals("")) { %>
					<A href="javascript:GetLedger('E01RLCGCA',document.forms[0].E01RLCBNK.value,document.forms[0].E01RLCACY.value,'')">
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="help"  border="0"></A>
				<% } %>	
				</DIV>
				</TD>
				<TD nowrap width="234">
				<DIV align="center"><INPUT type="text" name="E01DSCGCA" size="40" maxlength="35" value="<%= msg01.getE01DSCGCA().trim()%>" readonly></DIV>
				</TD>
			</TR>
			<TR id="trclear">
				<TD nowrap width="178">
				<DIV align="right">Funds Transfer :</DIV>
				</TD>
				<TD nowrap width="212">
				<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCGWT" size="19" maxlength="16" value="<%= msg01.getE01RLCGWT().trim()%>"	onkeypress="enterInteger()"> 
				<% if (readonly.equals("")) { %>
					<A href="javascript:GetLedger('E01RLCGWT',document.forms[0].E01RLCBNK.value,document.forms[0].E01RLCACY.value,'')">
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="help"  border="0"></A>
				<% } %>	
				</DIV>
				</TD>
				<TD nowrap width="234">
				<DIV align="center"><INPUT type="text" name="E01DSCGWT" size="40" maxlength="35" value="<%= msg01.getE01DSCGWT().trim()%>" readonly></DIV>
				</TD>
			</TR>
			<TR id="trdark">
				<TD nowrap width="178">
				<DIV align="right">Issuance Swift :</DIV>
				</TD>
				<TD nowrap width="212">
				<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCGTF" size="19" maxlength="16" value="<%= msg01.getE01RLCGTF().trim()%>" onkeypress="enterInteger()"> 
				<% if (readonly.equals("")) { %>
					<A href="javascript:GetLedger('E01RLCGTF',document.forms[0].E01RLCBNK.value,document.forms[0].E01RLCACY.value,'')">
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="help"  border="0"></A>
				<% } %>	
				</DIV>
				</TD>
				<TD nowrap width="234">
				<DIV align="center"><INPUT type="text" name="E01DSCGTF" size="40" maxlength="35" value="<%= msg01.getE01DSCGTF().trim()%>" readonly></DIV>
				</TD>
			</TR>
			<TR id="trclear">
				<TD nowrap width="178">
				<DIV align="right">Additional Swift :</DIV>
				</TD>
				<TD nowrap width="212">
				<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCGTM" size="19" maxlength="16" value="<%= msg01.getE01RLCGTM().trim()%>" onKeyPress="enterInteger()"> 
				<% if (readonly.equals("")) { %>
					<A href="javascript:GetLedger('E01RLCGTM',document.forms[0].E01RLCBNK.value,document.forms[0].E01RLCACY.value,'')">
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="help"  border="0"></A>
				<% } %>	
				</DIV> 
				</TD>
				<TD nowrap width="234">
				<DIV align="center"><INPUT type="text" name="E01DSCGTM" size="40" maxlength="35" value="<%= msg01.getE01DSCGTM().trim()%>" readonly></DIV>
				</TD>
			</TR>
			<TR id="trdark">
				<TD nowrap width="178">
				<DIV align="right">Reimbursement :</DIV>
				</TD>
				<TD nowrap width="212">
				<DIV align="center"><INPUT type="text" <%= readonly %> name="E01RLCCG2" size="19" maxlength="16" value="<%= msg01.getE01RLCCG2().trim()%>" onKeyPress="enterInteger()"> 
				<% if (readonly.equals("")) { %>
					<A href="javascript:GetLedger('E01RLCCG2',document.forms[0].E01RLCBNK.value,document.forms[0].E01RLCACY.value,'')">
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="help"  border="0"></A>
				<% } %>	
				</DIV>
				</TD>
				<TD nowrap width="234">
				<DIV align="center"><INPUT type="text" name="E01RLCCD2" size="40" maxlength="35" value="<%= msg01.getE01RLCCD2().trim()%>" readonly></DIV>
				</TD>
			</TR>
</TABLE>

<% 
	if (error.getERWRNG().equals("Y")) { 
			error.setERWRNG(" ");
%>
<H4 style="text-align: center"><INPUT type="checkbox" name="H01FLGWK2" value="A"> Accept with Warnings</H4>
<% } %> 
<BR>
<DIV align="center"><INPUT id="EIBSBTN" type=submit name="Submit" value="Submit"></DIV>
</FORM>
<!--
<TABLE border="1">
<TR><TD>
<H5 align="left">
  <%
String s = userPO.getHeader18();
for(int i = 0; i < s.length(); i++)
{
	if(s.charAt(i) == ':')	out.print("<BR>");
	else if (s.charAt(i) == '<') out.print("{");
		else if (s.charAt(i) == '>') out.print("}");
	else 					out.print(s.charAt(i));

}%>
</H5>
</TD>
<TD>
<H5 align="left">
  <%
 s = userPO.getHeader20();
for(int i = 0; i < s.length(); i++)
{
	if(s.charAt(i) == ':')	out.print("<BR>");
	else if (s.charAt(i) == '<') out.print("{");
		else if (s.charAt(i) == '>') out.print("}");
	else 					out.print(s.charAt(i));

}%>
</H5>
</TD>
<TD>
<H5 align="left">
  <%
 s = userPO.getHeader19();
for(int i = 0; i < s.length(); i++)
{
	if(s.charAt(i) == ':')	out.print("<BR>");
	else if (s.charAt(i) == '<') out.print("{");
		else if (s.charAt(i) == '>') out.print("}");
	else 					out.print(s.charAt(i));

}%>
</H5>
</TD>
</TR></TABLE> -->
</BODY>
</HTML>
