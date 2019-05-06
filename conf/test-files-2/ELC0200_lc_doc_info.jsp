<HTML>
<HEAD>
<TITLE>Documents Received Information</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<LINK HREF="<%=request.getContextPath()%>/pages/style.css" REL="stylesheet">

<SCRIPT LANGUAGE="Javascript1.1" SRC="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<jsp:useBean id="msg01" class="datapro.eibs.beans.ELC020001Message" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />


<%if (!error.getERRNUM().equals("0"))
{
	error.setERRNUM("0");
	out.println("<SCRIPT Language=\"Javascript\">");
	out.println("       showErrors()");
	out.println("</SCRIPT>");
}
%>

</HEAD>

<BODY BGCOLOR="#FFFFFF">

<H3 ALIGN="center">Letters Of Credit Documents Received<IMG SRC="<%=request.getContextPath()%>/images/e_ibs.gif" ALIGN="left"
	NAME="EIBS_GIF" ALT="lc_doc_info.jsp, ELC0200"></H3>
<HR SIZE="4">
<BR>


<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0200">
<INPUT TYPE="HIDDEN" NAME="SCREEN" VALUE="5">
<INPUT TYPE="HIDDEN" NAME="E01LCIDNO" VALUE="<%=msg01.getE01LCIDNO().trim()%>">

<TABLE width="100%" border="0" class="tableinfo" id="trdark" align="center">
  <TR>
    <TD align="right" nowrap>Bank: </TD>
    <TD nowrap><INPUT name="E01LCMBNK" value="<%=msg01.getE01LCMBNK()%>" size="4" maxlength="4" readonly></TD>
    <TD colspan="2" align="right" nowrap>Letter of Credit Number: </TD>
    <TD nowrap><INPUT name="E01LCMACC" value="<%=msg01.getE01LCMACC()%>" size="15" readonly></TD>
  </TR>
  <TR>
    <TD align="right" nowrap>Our Reference: </TD>
    <TD colspan="2" nowrap><INPUT name="E01LCMORF" value="<%=msg01.getE01LCMORF()%>" size="18" maxlength="18" readonly></TD>
    <TD align="right" nowrap>Customer Name: </TD>
    <TD nowrap><INPUT name="E01CUSNA1" value="<%=msg01.getE01CUSNA1()%>" size="46" maxlength="46" readonly></TD>
  </TR>
  <TR>
    <TD align="right" nowrap>Their Reference: </TD>
    <TD colspan="2" nowrap><INPUT name="E01LCMTRF" value="<%=msg01.getE01LCMTRF()%>" size="18" maxlength="18" readonly></TD>
    <TD align="right" nowrap>Beneficiary Name: </TD>
    <TD nowrap><INPUT name="E01LCMBN1" value="<%=msg01.getE01LCMBN1()%>" size="46" maxlength="40" readonly></TD>
  </TR>
</TABLE>

<BR>
<TABLE class="tableinfo" id="trclear" cellspacing="0" cellpadding="2" width="100%" border="0" >
				  <TR  id="trdark">
				    <TD align="right" nowrap>Date and Time of Receipt: </TD>
					<TD nowrap><INPUT name="E01LCIRDM" value="<%=msg01.getE01LCIRDM()%>" size="2" maxlength="2"> / 
						<INPUT name="E01LCIRDD" value="<%=msg01.getE01LCIRDD()%>" size="2" maxlength="2"> / 
						<INPUT name="E01LCIRDY" value="<%=msg01.getE01LCIRDY()%>" size="2" maxlength="2"> 
						<A href="javascript:DatePicker(document.forms[0].E01LCIRDM,document.forms[0].E01LCIRDD,document.forms[0].E01LCIRDY)">
						<IMG src="<%=request.getContextPath()%>/images/calendar.gif" alt="Help" align="middle" border="0"></A>
					    <INPUT name="E01LCITIM" value="<%=msg01.getE01LCITIM()%>" size="8" maxlength="8">	 <IMG
						src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" border="0"></TD>
					<TD align="right" nowrap>Currency and Amount: </TD>
					<TD nowrap><INPUT name="E01LCICCY" value="<%=msg01.getE01LCICCY()%>" size="3" maxlength="3">
					<A href="javascript:GetCurrency('E01LCICCY',document.forms[0].E01LCMBNK.value)">
					 <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></A> 
					  <INPUT name="E01LCIAMN" value="<%=msg01.getE01LCIAMN()%>" size="15" maxlength="15">
					  <IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" border="0"></TD>
				  </TR>
				  <TR>
				    <TD align="right" nowrap>Transaction Type: </TD>
				    <TD nowrap>
					<SELECT name="E01LCINTY">
						<OPTION>&nbsp;</OPTION>
						<OPTION value="1" <%if(msg01.getE01LCINTY().equals("1")) out.print("selected");%>>Sight Payment</OPTION>
						<OPTION value="2" <%if(msg01.getE01LCINTY().equals("2")) out.print("selected");%>>Acceptance</OPTION>
						<OPTION value="3" <%if(msg01.getE01LCINTY().equals("3")) out.print("selected");%>>Acceptance Discount</OPTION>
						<OPTION value="4" <%if(msg01.getE01LCINTY().equals("4")) out.print("selected");%>>Deferred Payment</OPTION>
						<OPTION value="5" <%if(msg01.getE01LCINTY().equals("5")) out.print("selected");%>>Refinancing</OPTION>
						<OPTION value="M" <%if(msg01.getE01LCINTY().equals("M")) out.print("selected");%>>Mixed Payment</OPTION>
						<OPTION value="N" <%if(msg01.getE01LCINTY().equals("N")) out.print("selected");%>>Negotiation</OPTION>
					</SELECT>
					<IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Manadatory Field" border="0"></TD>
				    <TD align="right" nowrap>Beneficiary's Reference: </TD>
				    <TD nowrap><INPUT name="E01LCIBRE" value="<%=msg01.getE01LCIBRE()%>" size="16, 18"></TD>
				  </TR>
				  <TR id="trdark">
				    <TD align="right" nowrap>Documents Assigned To: </TD>
				    <TD nowrap><INPUT name="E01LCIAST" value="<%=msg01.getE01LCIAST()%>" size="40" maxlength="30"></TD>
		            <TD align="right" nowrap>Status: </TD>
		            <TD nowrap><SELECT name="E01LCISTA">
                      <OPTION value=" "></OPTION>
                      <OPTION value="D" <% if(msg01.getE01LCISTA().equals("D")) out.print("selected");%>>Documents in Discrepancies</OPTION>
                      <OPTION value="A" <% if(msg01.getE01LCISTA().equals("A")) out.print("selected");%>>Discrepancies Authorized</OPTION>
                      <OPTION value="R" <% if(msg01.getE01LCISTA().equals("R")) out.print("selected");%>>Discrepancies Refused</OPTION>
                      <OPTION value="O" <% if(msg01.getE01LCISTA().equals("O")) out.print("selected");%>>Documents in Order</OPTION>
                    </SELECT></TD>
			  </TR>
				  <TR id="trdark">
				    <TD align="right" nowrap>Notice Without Documents: </TD>
				    <TD colspan="3" nowrap><SELECT name="E01LCINDF">
                      <OPTION value=" "></OPTION>
                      <OPTION value="D" <% if(msg01.getE01LCINDF().equals("D")) out.print("selected");%>>Notice of Discrepancies</OPTION>
                      <OPTION value="A" <% if(msg01.getE01LCINDF().equals("A")) out.print("selected");%>>Notice of Negotiation</OPTION>
                    </SELECT></TD>
			      </TR>
			  </TABLE>
		

<BR>

<TABLE width="100%" border="0" class="tableinfo">
  <TR id="trdark">
    <TD colspan="2" align="center"><B><FONT size="-1">Bank Authorized to Pay / Negotiate</FONT> </B></TD>
    </TR>
  <TR>
    <TD width="40%" align="right">Swift BIC :</TD>
    <TD width="60%"><INPUT name="E01LCINBI" value="<%=msg01.getE01LCINBI()%>" size="12">
              <A href="javascript: GetCustomerDetailsLC('E01LCINBI','E01LCIMB1','E01LCIMB2','E01LCIMB3','E01LCIMB4','E01LCIMB5','E01LCIMB6','E01LCIMB7','C')">
              <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></A></TD>
  </TR>
  <TR>
    <TD align="right">Name :</TD>
    <TD><INPUT name="E01LCINB1" value="<%=msg01.getE01LCINB1()%>" maxlength="35" size="37"></TD>
  </TR>
  <TR>
    <TD align="right">Address :</TD>
    <TD><INPUT name="E01LCINB2" value="<%=msg01.getE01LCINB2()%>" maxlength="35" size="37"></TD>
  </TR>
  <TR>
    <TD align="right">&nbsp;</TD>
    <TD><INPUT name="E01LCINB3" value="<%=msg01.getE01LCINB3()%>" maxlength="35" size="37"></TD>
  </TR>
  <TR>
    <TD align="right">&nbsp;</TD>
    <TD><INPUT name="E01LCINB4" value="<%=msg01.getE01LCINB4()%>" size="37" maxlength="25"></TD>
  </TR>
  <TR>
    <TD align="right">State :</TD>
    <TD><INPUT name="E01LCINB5" value="<%=msg01.getE01LCINB5()%>" maxlength="2" size="2"> 
    Zip Code :
	  <INPUT name="E01LCINB6" value="<%=msg01.getE01LCINB6()%>" size="10" maxlength="10"> 
	Country :<INPUT name="E01LCINB7" value="<%=msg01.getE01LCINB7()%>" maxlength="4" size="4"> <A href="javascript:GetCodeCNOFC('E01LCINB7','03')"><IMG
			src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></A></TD>
  </TR>
</TABLE>

<BR>
<TABLE width="100%" border="0" class="tableinfo" id="trclear">
  <TR id="trdark">
    <TD colspan="2" align="center"><FONT size="-1"><B>Reimbursements Bank</B></FONT></TD>
  </TR>
  
<TR>
    <TD width="40%" align="right">Swift BIC :</TD>
    <TD width="60%"><INPUT name="E01LCIRBI" value="<%=msg01.getE01LCIRBI()%>" size="12">
		<A href="javascript: GetCustomerDetailsLC('E01LCIRBI','E01LCMIB1','E01LCMIB2','E01LCMIB3','E01LCMIB4','E01LCMIB5','E01LCMIB6','E01LCMIB7','5')">
		<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></A></TD>
  </TR>
  <TR>
    <TD align="right">Name :</TD>
    <TD><INPUT name="E01LCIRB1" value="<%=msg01.getE01LCIRB1()%>" maxlength="35" size="37"></TD>
  </TR>
  <TR>
    <TD align="right">Address :</TD>
    <TD><INPUT name="E01LCIRB2" value="<%=msg01.getE01LCIRB2()%>" maxlength="35" size="37"></TD>
  </TR>
  <TR>
    <TD align="right">&nbsp;</TD>
    <TD><INPUT name="E01LCIRB3" value="<%=msg01.getE01LCIRB3()%>" maxlength="35" size="37"></TD>
  </TR>
  <TR>
    <TD align="right">&nbsp;</TD>
    <TD><INPUT name="E01LCIRB4" value="<%=msg01.getE01LCIRB4()%>" size="25, 37"></TD>
  </TR>
  <TR>
    <TD align="right">State :</TD>
    <TD><INPUT name="E01LCIRB5" value="<%=msg01.getE01LCIRB5()%>" maxlength="2" size="2"> 
    Zip Code :<INPUT name="E01LCIRB6" value="<%=msg01.getE01LCIRB6()%>" size="10">&nbsp;
    Country :<INPUT name="E01LCIRB7" value="<%=msg01.getE01LCIRB7()%>" size="4"> <A
			href="javascript:GetCodeCNOFC('E01LCIRB7','03')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom"
			border="0"></A></TD>
  </TR>
</TABLE>
<BR>
<TABLE class="tableinfo" width="100%">
	<TR id="trdark">
    <TD  align="center"><FONT size="-1"><B>Discrepancies</B></FONT></TD>
  </TR>
    <TR > 
      <TD nowrap align="center"> 
      <DIV style="height:220px; overflow-y: scroll">
          <INPUT type="text" name="E01LCID01" size="50" maxlength="35" value="<%= msg01.getE01LCID01().trim()%>"><BR>
          <INPUT type="text" name="E01LCID02" size="50" maxlength="35" value="<%= msg01.getE01LCID02().trim()%>"><BR>
          <INPUT type="text" name="E01LCID03" size="50" maxlength="35" value="<%= msg01.getE01LCID03().trim()%>"><BR>
          <INPUT type="text" name="E01LCID04" size="50" maxlength="35" value="<%= msg01.getE01LCID04().trim()%>"><BR>
          <INPUT type="text" name="E01LCID05" size="50" maxlength="35" value="<%= msg01.getE01LCID05().trim()%>"><BR>
          <INPUT type="text" name="E01LCID06" size="50" maxlength="35" value="<%= msg01.getE01LCID06().trim()%>"><BR>
          <INPUT type="text" name="E01LCID07" size="50" maxlength="35" value="<%= msg01.getE01LCID07().trim()%>"><BR>
          <INPUT type="text" name="E01LCID08" size="50" maxlength="35" value="<%= msg01.getE01LCID08().trim()%>"><BR>
          <INPUT type="text" name="E01LCID09" size="50" maxlength="35" value="<%= msg01.getE01LCID09().trim()%>"><BR>
          <INPUT type="text" name="E01LCID10" size="50" maxlength="35" value="<%= msg01.getE01LCID10().trim()%>"><BR>
          <INPUT type="text" name="E01LCID11" size="50" maxlength="35" value="<%= msg01.getE01LCID11().trim()%>"><BR>
          <INPUT type="text" name="E01LCID12" size="50" maxlength="35" value="<%= msg01.getE01LCID12().trim()%>"><BR>
          <INPUT type="text" name="E01LCID13" size="50" maxlength="35" value="<%= msg01.getE01LCID13().trim()%>"><BR>
          <INPUT type="text" name="E01LCID14" size="50" maxlength="35" value="<%= msg01.getE01LCID14().trim()%>"><BR>
          <INPUT type="text" name="E01LCID15" size="50" maxlength="35" value="<%= msg01.getE01LCID15().trim()%>"><BR>
          <INPUT type="text" name="E01LCID16" size="50" maxlength="35" value="<%= msg01.getE01LCID16().trim()%>"><BR>
          <INPUT type="text" name="E01LCID17" size="50" maxlength="35" value="<%= msg01.getE01LCID17().trim()%>"><BR>
          <INPUT type="text" name="E01LCID18" size="50" maxlength="35" value="<%= msg01.getE01LCID18().trim()%>"><BR>
          <INPUT type="text" name="E01LCID19" size="50" maxlength="35" value="<%= msg01.getE01LCID19().trim()%>"><BR>
          <INPUT type="text" name="E01LCID20" size="50" maxlength="35" value="<%= msg01.getE01LCID20().trim()%>"><BR>
          <INPUT type="text" name="E01LCID21" size="50" maxlength="35" value="<%= msg01.getE01LCID21().trim()%>"><BR>
          <INPUT type="text" name="E01LCID22" size="50" maxlength="35" value="<%= msg01.getE01LCID22().trim()%>"><BR>
          <INPUT type="text" name="E01LCID23" size="50" maxlength="35" value="<%= msg01.getE01LCID23().trim()%>"><BR>
          <INPUT type="text" name="E01LCID24" size="50" maxlength="35" value="<%= msg01.getE01LCID24().trim()%>"><BR>
          <INPUT type="text" name="E01LCID25" size="50" maxlength="35" value="<%= msg01.getE01LCID25().trim()%>"><BR>
          <INPUT type="text" name="E01LCID26" size="50" maxlength="35" value="<%= msg01.getE01LCID26().trim()%>"><BR>
          <INPUT type="text" name="E01LCID27" size="50" maxlength="35" value="<%= msg01.getE01LCID27().trim()%>"><BR>
          <INPUT type="text" name="E01LCID28" size="50" maxlength="35" value="<%= msg01.getE01LCID28().trim()%>"><BR>
          <INPUT type="text" name="E01LCID29" size="50" maxlength="35" value="<%= msg01.getE01LCID29().trim()%>"><BR>
          <INPUT type="text" name="E01LCID30" size="50" maxlength="35" value="<%= msg01.getE01LCID30().trim()%>"><BR>
          <INPUT type="text" name="E01LCID31" size="50" maxlength="35" value="<%= msg01.getE01LCID31().trim()%>"><BR>
          <INPUT type="text" name="E01LCID32" size="50" maxlength="35" value="<%= msg01.getE01LCID32().trim()%>"><BR>
          <INPUT type="text" name="E01LCID33" size="50" maxlength="35" value="<%= msg01.getE01LCID33().trim()%>"><BR>
          <INPUT type="text" name="E01LCID34" size="50" maxlength="35" value="<%= msg01.getE01LCID34().trim()%>"><BR>
          <INPUT type="text" name="E01LCID35" size="50" maxlength="35" value="<%= msg01.getE01LCID35().trim()%>"><BR>
          <INPUT type="text" name="E01LCID36" size="50" maxlength="35" value="<%= msg01.getE01LCID36().trim()%>"><BR>
          <INPUT type="text" name="E01LCID37" size="50" maxlength="35" value="<%= msg01.getE01LCID37().trim()%>"><BR>
          <INPUT type="text" name="E01LCID38" size="50" maxlength="35" value="<%= msg01.getE01LCID38().trim()%>"><BR>
          <INPUT type="text" name="E01LCID39" size="50" maxlength="35" value="<%= msg01.getE01LCID39().trim()%>"><BR>
          <INPUT type="text" name="E01LCID40" size="50" maxlength="35" value="<%= msg01.getE01LCID40().trim()%>"><BR>
        </DIV></TD>
    </TR>
  </TABLE>
<P align="center">
  <INPUT id="EIBSBTN" type="submit" name="Submit" value="Submit">
</P>
</FORM>
<!--<%	if (!userPO.getHeader20().equals("")) {%>

<TABLE border="1">
	<TBODY>
		<TR>
			<TD>
			<%
			String s = userPO.getHeader18();
			for(int i = 0; i < s.length(); i++)
			{
				if(s.charAt(i) == ':')	out.print("<BR>");
				else if (s.charAt(i) == '<') out.print("{");
					else if (s.charAt(i) == '>') out.print("}");
				else 					out.print(s.charAt(i));

			}
			%>
			</TD>
			<TD>
			<%
			s = userPO.getHeader20();
			for(int i = 0; i < s.length(); i++)
			{
				if(s.charAt(i) == ':')	out.print("<BR>");
				else if (s.charAt(i) == '<') out.print("{");
					else if (s.charAt(i) == '>') out.print("}");
				else 					out.print(s.charAt(i));

			}
			%>
			</TD>
			<TD>
			<%
			s = userPO.getHeader19();
			for(int i = 0; i < s.length(); i++)
			{
				if(s.charAt(i) == ':')	out.print("<BR>");
				else if (s.charAt(i) == '<') out.print("{");
					else if (s.charAt(i) == '>') out.print("}");
				else 					out.print(s.charAt(i));

			}
			%>
			</TD>
		</TR>
	</TBODY>
</TABLE>
<%}%>-->
</BODY>
</HTML>
