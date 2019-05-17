<HTML>
<HEAD>
<TITLE>Negociación de Cartas de Crédito</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<LINK HREF="<%=request.getContextPath()%>/pages/style.css" REL="stylesheet">

<SCRIPT LANGUAGE="Javascript1.1" SRC="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<jsp:useBean id= "msg01" class= "datapro.eibs.beans.ELC056001Message" scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />


<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 } 

userPO.setPrevPage("ELC0560_lc_nego_enter.jsp");

%>

</HEAD>

<BODY BGCOLOR="#FFFFFF">

<H3 ALIGN="center">Letter of Credit New Negotiation/Payment
	<IMG SRC="<%=request.getContextPath()%>/images/e_ibs.gif" ALIGN="left" NAME="EIBS_GIF" ALT="lc_nego_enter.jsp, ELC0560"></H3>
<HR SIZE="4">

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0560">
<INPUT TYPE="HIDDEN" NAME="SCREEN" VALUE="2">
<INPUT TYPE="HIDDEN" NAME="H01OPECOD" VALUE="0001">

<DIV ALIGN="center">
<TABLE CLASS="tbenter" WIDTH="100%" BORDER="0">
	
		<TR>
			<TD HEIGHT="139">
			<TABLE CLASS="tbenter" ALIGN="center">
				
					<TR>
						<TD><DIV ALIGN="right">Letter of Credti ID :</DIV></TD>
						<TD>
							<DIV><INPUT TYPE="text" NAME="E01LCRNUM" SIZE="13" MAXLENGTH="12" value="" ONKEYPRESS="enterInteger()">
							<A HREF="javascript:GetAccount('E01LCRNUM','','40','')"> <IMG SRC="<%=request.getContextPath()%>/images/1b.gif" ALT="Help" BORDER="0"></A></DIV>
						</TD>
					</TR>
					<TR>
						<TD><DIV ALIGN="right">Type of Negotiation :</DIV></TD>
						<TD>
							<DIV><SELECT NAME="E01OPCODE">
									<OPTION VALUE="1">Sight Payment</OPTION>
									<OPTION VALUE="2">Acceptance</OPTION>
									<OPTION VALUE="3">Discount Acceptance</OPTION>
									<OPTION VALUE="4">Deferred Payment</OPTION>
									<OPTION VALUE="5">Refinancing</OPTION>
									<OPTION VALUE="6">Cancellation</OPTION>
									<OPTION VALUE="9">Commission Only</OPTION>
								</SELECT></DIV>
						</TD>
					</TR>
					<TR>
						<TD><DIV ALIGN="right">Amount :</DIV></TD>
						<TD>
							<DIV><INPUT TYPE="text" NAME="E01DRWAMN" SIZE="20" MAXLENGTH="15" value="" ONKEYPRESS="enterDecimal()">
							<IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" border="0"></DIV>
						</TD>
					</TR>
					<TR>
						<TD COLSPAN="2"><DIV ALIGN="center"><BR><INPUT ID="EIBSBTN" TYPE="submit" NAME="Submit" VALUE="Submit"></DIV></TD>
					</TR>
				
			</TABLE>
			</TD>
		</TR>
	
</TABLE>

</DIV>

</FORM>

</BODY>
</HTML>
