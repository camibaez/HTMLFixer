<HTML>
<HEAD>
<TITLE>Negociación de Cartas de Crédito</TITLE>
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

<H3 ALIGN="center">Documents Received  Control<IMG SRC="<%=request.getContextPath()%>/images/e_ibs.gif" ALIGN="left"
	NAME="EIBS_GIF" ALT="lc_doc_info_readonly.jsp, ELC0200"></H3>
<HR SIZE="4">
<BR>


<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0200">
<INPUT TYPE="HIDDEN" NAME="SCREEN" VALUE="5">
<INPUT TYPE="HIDDEN" NAME="E01LCIDNO" VALUE="<%=msg01.getE01LCIDNO().trim()%>">

<TABLE width="100%" border="0" class="tableinfo" id="trdark" align="center">
  <TR>
    <TD nowrap align="right"><B>Bank : </B></TD>
    <TD nowrap width="188"><INPUT name="E01LCMBNK" value="<%=msg01.getE01LCMBNK()%>" size="4" maxlength="4" readonly></TD>
    <TD nowrap colspan="2" align="right" width="271"><B>Letter Of Credit Number: </B></TD>
    <TD nowrap><INPUT name="E01LCMACC" value="<%=msg01.getE01LCMACC()%>" size="15" readonly></TD>
  </TR>
  <TR>
    <TD nowrap align="right"><B>Our Reference : </B></TD>
    <TD nowrap colspan="2" width="271"><INPUT name="E01LCMORF" value="<%=msg01.getE01LCMORF()%>" size="18" maxlength="18" readonly></TD>
    <TD nowrap align="right"><B> Customer Name: </B></TD>
    <TD nowrap><INPUT name="E01CUSNA1" value="<%=msg01.getE01CUSNA1()%>" size="46" maxlength="46" readonly></TD>
  </TR>
  <TR>
    <TD nowrap align="right"><B>Their Reference : </B></TD>
    <TD nowrap colspan="2" width="271"><INPUT name="E01LCMTRF" value="<%=msg01.getE01LCMTRF()%>" size="18" maxlength="18" readonly></TD>
    <TD nowrap align="right"><B> Beneficiary Name: </B></TD>
    <TD nowrap><INPUT name="E01LCMBN1" value="<%=msg01.getE01LCMBN1()%>" size="46" maxlength="40" readonly></TD>
  </TR>
</TABLE>

<BR>
<TABLE class="tableinfo" id="trclear" cellspacing="0" cellpadding="2" width="100%" border="0" > 
    <TR id="trdark">
	    <TD nowrap align="right">Date &amp; Time Received: </TD>
		<TD nowrap align="left">
			<INPUT name="E01LCIRDM" value="<%=msg01.getE01LCIRDM()%>" size="2" maxlength="2" readonly="readonly"> 
			<INPUT name="E01LCIRDD" value="<%=msg01.getE01LCIRDD()%>" size="2" maxlength="2" readonly="readonly"> 
			<INPUT name="E01LCIRDY" value="<%=msg01.getE01LCIRDY()%>" size="2" maxlength="2" readonly="readonly"> 
			<INPUT name="E01LCITIM" value="<%=msg01.getE01LCITIM()%>" size="8" maxlength="8" readonly="readonly"></TD>
		<TD align="right" nowrap>Currency &amp; Amount: </TD>
		<TD nowrap><INPUT name="E01LCICCY" value="<%=msg01.getE01LCICCY()%>" size="3" maxlength="3" readonly="readonly">
			<INPUT name="E01LCIAMN" value="<%=msg01.getE01LCIAMN()%>" size="15" maxlength="15" readonly="readonly">
			<IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="campo obligatorio" border="0"></TD>
	</TR>
	<TR>
		<TD align="right" nowrap>Transaction Type: </TD>
		<TD nowrap align="left">
		    <SELECT name="E01LCINTY" disabled>
			   	<OPTION>&nbsp;</OPTION>
				<OPTION value="1" <%if(msg01.getE01LCINTY().equals("1")) out.print("selected");%>>Sight Payment</OPTION>
				<OPTION value="2" <%if(msg01.getE01LCINTY().equals("2")) out.print("selected");%>>Acceptance</OPTION>
				<OPTION value="3" <%if(msg01.getE01LCINTY().equals("3")) out.print("selected");%>>Acceptance Discounted</OPTION>
				<OPTION value="4" <%if(msg01.getE01LCINTY().equals("4")) out.print("selected");%>>Diferred Payment</OPTION>
				<OPTION value="5" <%if(msg01.getE01LCINTY().equals("5")) out.print("selected");%>>Financing</OPTION>
				<OPTION value="M" <%if(msg01.getE01LCINTY().equals("M")) out.print("selected");%>>Mixed Payment</OPTION>
				<OPTION value="N" <%if(msg01.getE01LCINTY().equals("N")) out.print("selected");%>>Negotiation</OPTION>
			</SELECT>
				<IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="campo obligatorio" border="0"></TD>
		<TD nowrap align="right">Presenting Bank Reference: </TD>
		<TD nowrap><INPUT name="E01LCIBRE" value="<%=msg01.getE01LCIBRE()%>" size="16, 18" readonly="readonly"></TD>
	</TR>
	<TR id="trdark">
		<TD nowrap align="right">Documents Assigned to: </TD>
		<TD nowrap><INPUT name="E01LCIAST" value="<%=msg01.getE01LCIAST()%>" size="40" maxlength="30" readonly="readonly"></TD>
		<TD nowrap align="right">Status: </TD>
		<TD nowrap>
		    <SELECT name="E01LCISTA" disabled>
                <OPTION value=" "></OPTION>
                <OPTION value="D" <% if(msg01.getE01LCISTA().equals("D")) out.print("selected");%>>Discrepancy</OPTION>
                <OPTION value="A" <% if(msg01.getE01LCISTA().equals("A")) out.print("selected");%>>Discrepancy Accepted</OPTION>
                <OPTION value="R" <% if(msg01.getE01LCISTA().equals("R")) out.print("selected");%>>Discrepancy Refused</OPTION>
                <OPTION value="O" <% if(msg01.getE01LCISTA().equals("O")) out.print("selected");%>>Documents OK</OPTION>
            </SELECT></TD>
	</TR>
	<TR id="trclear">
		<TD nowrap align="right">Avdice Without Documents: </TD>
		<TD nowrap colspan="3">
		    <SELECT name="E01LCINDF" disabled>
                <OPTION value=" "></OPTION>
                <OPTION value="D" <% if(msg01.getE01LCINDF().equals("D")) out.print("selected");%>>Advice of Disrepancy without Documents</OPTION>
                <OPTION value="A" <% if(msg01.getE01LCINDF().equals("A")) out.print("selected");%>>Advice of Negotiation without Documents</OPTION>
            </SELECT></TD>
	</TR>
</TABLE>

<BR>
<TABLE width="100%" border="0" class="tableinfo" id="trclear">
	<TR id="trdark">
    	<TD colspan="4" align="center"><FONT size="medium"><B>Swift Message Generation</B></FONT></TD>
  	</TR>
	<tr id="trclear">
	  	<TD align="right" nowrap>Swift Message Type: </TD>
		<TD align="left" nowrap>
		  	<SELECT name="E01LCISMT" disabled>
		  		<OPTION value="" <%= msg01.getE01LCISMT().equals("")?"selected":"" %>>NO</OPTION>
		  		<OPTION value="732" <%= msg01.getE01LCISMT().equals("732")?"selected":"" %>>MT732</OPTION>
               	<OPTION value="734" <%= msg01.getE01LCISMT().equals("734")?"selected":"" %>>MT734</OPTION>
               	<OPTION value="750" <%= msg01.getE01LCISMT().equals("750")?"selected":"" %>>MT750</OPTION>
               	<OPTION value="752" <%= msg01.getE01LCISMT().equals("752")?"selected":"" %>>MT752</OPTION>
           	</SELECT>
    	</TD>
	    <TD align="right" nowrap>Receiver ID: </TD>
	    <TD align="left" nowrap>
	    	<INPUT type="text" name="E01LCIRID" size="14" maxlength="12" value="<%= msg01.getE01LCIRID()%>" readonly="readonly">
      		 
   		</TD>
	</Tr>	
	<tr id="trclear">
	    <TD align="right" nowrap>Date of Advice of Discrepancy: </TD>
		<TD nowrap>
			<INPUT name="E01LCIDAM" value="<%=msg01.getE01LCIDAM()%>" size="2" maxlength="2" readonly="readonly">  
			<INPUT name="E01LCIDAD" value="<%=msg01.getE01LCIDAD()%>" size="2" maxlength="2" readonly="readonly">  
			<INPUT name="E01LCIDAY" value="<%=msg01.getE01LCIDAY()%>" size="2" maxlength="2" readonly="readonly"> 
			
		</TD>
	    <TD align="right" nowrap> Amount of Payment: </TD>
		<TD nowrap>
		  	<INPUT name="E01LCIPAM" value="<%=msg01.getE01LCIPAM()%>" size="15" maxlength="15" readonly="readonly">
		</TD>
	</Tr>	
	<tr id="trclear">
	    <TD align="right" nowrap>Value Date: </TD>
		<TD nowrap>
			<INPUT name="E01LCIVDM" value="<%=msg01.getE01LCIVDM()%>" size="2" maxlength="2" readonly="readonly">  
			<INPUT name="E01LCIVDD" value="<%=msg01.getE01LCIVDD()%>" size="2" maxlength="2" readonly="readonly">  
			<INPUT name="E01LCIVDY" value="<%=msg01.getE01LCIVDY()%>" size="2" maxlength="2" readonly="readonly"> 
			
		</TD>
	  	<TD align="right" nowrap>Disposal of Documents: </TD>
		<TD align="left" nowrap>
		  	<SELECT name="E01LCIDDF" disabled>
		  		<OPTION value="" <%= msg01.getE01LCIDDF().equals("")?"selected":"" %>></OPTION>
               	<OPTION value="H" <%= msg01.getE01LCIDDF().equals("H")?"selected":"" %>>Held at your Disposal</OPTION>
               	<OPTION value="N" <%= msg01.getE01LCIDDF().equals("N")?"selected":"" %>>Held waiting Instructions</OPTION>
               	<OPTION value="P" <%= msg01.getE01LCIDDF().equals("P")?"selected":"" %>>In Accordance with Previous Instructions</OPTION>
               	<OPTION value="R" <%= msg01.getE01LCIDDF().equals("R")?"selected":"" %>>Returned to You</OPTION>
           	</SELECT>
    	</TD>
	</Tr>	
	<tr id="trclear">
	  	<TD align="right" nowrap>Further Identification: </TD>
		<TD align="left" nowrap>
		  	<SELECT name="E01LCIAUF" disabled>
		  		<OPTION value="" <%= msg01.getE01LCIAUF().equals("")?"selected":"" %>></OPTION>
               	<OPTION value="A" <%= msg01.getE01LCIAUF().equals("A")?"selected":"" %>>Accept</OPTION>
               	<OPTION value="D" <%= msg01.getE01LCIAUF().equals("D")?"selected":"" %>>Debit Our Account</OPTION>
               	<OPTION value="N" <%= msg01.getE01LCIAUF().equals("N")?"selected":"" %>>Negotiate</OPTION>
               	<OPTION value="R" <%= msg01.getE01LCIAUF().equals("R")?"selected":"" %>>Request Reimbursement</OPTION>
               	<OPTION value="P" <%= msg01.getE01LCIAUF().equals("P")?"selected":"" %>>Funds Remitted</OPTION>
               	<OPTION value="S" <%= msg01.getE01LCIAUF().equals("S")?"selected":"" %>>See72</OPTION>
           	</SELECT>
    	</TD>
	    <TD align="right" nowrap></TD>
	    <TD align="right" nowrap></TD>
	</Tr>	
</TABLE>
<BR>

<TABLE width="70%" border="0" class="tableinfo">
  <TR id="trdark">
		<TD colspan="6" align="center"><B><FONT size="medium">Documents Received</FONT>
		</B></TD>
	</TR>
  <TR id="trclear">
    <TD align="center">
    <TABLE border="0" class="tableinfo">
    <TR align="center">
    <TD width="8%" align="center"></TD>
		<TD align="center" width="320"></TD>
		<TD colspan="2" align="center">Required</TD><TD colspan="2" align="center">Received</TD></TR>
	<TR align="center">
		<TD align="center">Document</TD>
		<TD align="center" width="320">Description</TD>
		<TD align="center" width="84">Originals</TD>
		<TD align="center" width="85">Copies</TD>
		<TD align="center" width="82">Originals</TD>
		<TD align="center" width="85">Copies</TD>
	</TR>
	<TR align="center">
      <TD align="center"><INPUT type="text" name="E01LCMDD1" value="<%=msg01.getE01LCMDD1()%>" size="4" maxlength="5" readonly></TD>
	  <TD align="center" width="320"><INPUT type="text" name="E01LCMDS1" value="<%=msg01.getE01LCMDS1()%>" size="35" maxlength="35" readonly></TD>
	  <TD align="center" width="84"><INPUT type="text" name="E01LCMDO1" value="<%=msg01.getE01LCMDO1()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01LCMDC1" value="<%=msg01.getE01LCMDC1()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="82"><INPUT type="text" name="E01RCVDO1" value="<%=msg01.getE01RCVDO1()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01RCVDC1" value="<%=msg01.getE01RCVDC1()%>" size="2" maxlength="1" readonly></TD>
	</TR>
	<TR align="center">
      <TD align="center"><INPUT type="text" name="E01LCMDD2" value="<%=msg01.getE01LCMDD2()%>" size="4" maxlength="5" readonly></TD>
	  <TD align="center" width="320"><INPUT type="text" name="E01LCMDS2" value="<%=msg01.getE01LCMDS2()%>" size="35" maxlength="35" readonly></TD>
	  <TD align="center" width="84"><INPUT type="text" name="E01LCMDO2" value="<%=msg01.getE01LCMDO2()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01LCMDC2" value="<%=msg01.getE01LCMDC2()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="82"><INPUT type="text" name="E01RCVDO2" value="<%=msg01.getE01RCVDO2()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01RCVDC2" value="<%=msg01.getE01RCVDC2()%>" size="2" maxlength="1" readonly></TD>
	</TR>
	<TR align="center">
      <TD align="center"><INPUT type="text" name="E01LCMDD3" value="<%=msg01.getE01LCMDD3()%>" size="4" maxlength="5" readonly></TD>
	  <TD align="center" width="320"><INPUT type="text" name="E01LCMDS3" value="<%=msg01.getE01LCMDS3()%>" size="35" maxlength="35" readonly></TD>
	  <TD align="center" width="84"><INPUT type="text" name="E01LCMDO3" value="<%=msg01.getE01LCMDO3()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01LCMDC3" value="<%=msg01.getE01LCMDC3()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="82"><INPUT type="text" name="E01RCVDO3" value="<%=msg01.getE01RCVDO3()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01RCVDC3" value="<%=msg01.getE01RCVDC3()%>" size="2" maxlength="1" readonly></TD>
	</TR>
	<TR align="center">
      <TD align="center"><INPUT type="text" name="E01LCMDD4" value="<%=msg01.getE01LCMDD4()%>" size="4" maxlength="5" readonly></TD>
	  <TD align="center" width="320"><INPUT type="text" name="E01LCMDS4" value="<%=msg01.getE01LCMDS4()%>" size="35" maxlength="35" readonly></TD>
	  <TD align="center" width="84"><INPUT type="text" name="E01LCMDO4" value="<%=msg01.getE01LCMDO4()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01LCMDC4" value="<%=msg01.getE01LCMDC4()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="82"><INPUT type="text" name="E01RCVDO4" value="<%=msg01.getE01RCVDO4()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01RCVDC4" value="<%=msg01.getE01RCVDC4()%>" size="2" maxlength="1" readonly></TD>
	</TR>
	<TR align="center">
      <TD align="center"><INPUT type="text" name="E01LCMDD5" value="<%=msg01.getE01LCMDD5()%>" size="4" maxlength="5" readonly></TD>
	  <TD align="center" width="320"><INPUT type="text" name="E01LCMDS5" value="<%=msg01.getE01LCMDS5()%>" size="35" maxlength="35" readonly></TD>
	  <TD align="center" width="84"><INPUT type="text" name="E01LCMDO5" value="<%=msg01.getE01LCMDO5()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01LCMDC5" value="<%=msg01.getE01LCMDC5()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="82"><INPUT type="text" name="E01RCVDO5" value="<%=msg01.getE01RCVDO5()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01RCVDC5" value="<%=msg01.getE01RCVDC5()%>" size="2" maxlength="1" readonly></TD>
	</TR>
	<TR align="center">
      <TD align="center"><INPUT type="text" name="E01LCMDD6" value="<%=msg01.getE01LCMDD6()%>" size="4" maxlength="5" readonly></TD>
	  <TD align="center" width="320"><INPUT type="text" name="E01LCMDS6" value="<%=msg01.getE01LCMDS6()%>" size="35" maxlength="35" readonly></TD>
	  <TD align="center" width="84"><INPUT type="text" name="E01LCMDO6" value="<%=msg01.getE01LCMDO6()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01LCMDC6" value="<%=msg01.getE01LCMDC6()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="82"><INPUT type="text" name="E01RCVDO6" value="<%=msg01.getE01RCVDO6()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01RCVDC6" value="<%=msg01.getE01RCVDC6()%>" size="2" maxlength="1" readonly></TD>	  
	</TR>
	<TR align="center">
      <TD align="center"><INPUT type="text" name="E01LCMDD7" value="<%=msg01.getE01LCMDD7()%>" size="4" maxlength="5" readonly></TD>
	  <TD align="center" width="320"><INPUT type="text" name="E01LCMDS7" value="<%=msg01.getE01LCMDS7()%>" size="35" maxlength="35" readonly></TD>
	  <TD align="center" width="84"><INPUT type="text" name="E01LCMDO7" value="<%=msg01.getE01LCMDO7()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01LCMDC7" value="<%=msg01.getE01LCMDC7()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="82"><INPUT type="text" name="E01RCVDO7" value="<%=msg01.getE01RCVDO7()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01RCVDC7" value="<%=msg01.getE01RCVDC7()%>" size="2" maxlength="1" readonly></TD>	  
	</TR>
	<TR align="center">
      <TD align="center"><INPUT type="text" name="E01LCMDD8" value="<%=msg01.getE01LCMDD8()%>" size="4" maxlength="5" readonly></TD>
	  <TD align="center" width="320"><INPUT type="text" name="E01LCMDS8" value="<%=msg01.getE01LCMDS8()%>" size="35" maxlength="35" readonly></TD>
	  <TD align="center" width="84"><INPUT type="text" name="E01LCMDO8" value="<%=msg01.getE01LCMDO8()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01LCMDC8" value="<%=msg01.getE01LCMDC8()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="82"><INPUT type="text" name="E01RCVDO8" value="<%=msg01.getE01RCVDO8()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01RCVDC8" value="<%=msg01.getE01RCVDC8()%>" size="2" maxlength="1" readonly></TD>	  
	</TR>
	<TR align="center">
      <TD align="center"><INPUT type="text" name="E01LCMDD9" value="<%=msg01.getE01LCMDD9()%>" size="4" maxlength="5" readonly></TD>
	  <TD align="center" width="320"><INPUT type="text" name="E01LCMDS9" value="<%=msg01.getE01LCMDS9()%>" size="35" maxlength="35" readonly></TD>
	  <TD align="center" width="84"><INPUT type="text" name="E01LCMDO9" value="<%=msg01.getE01LCMDO9()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01LCMDC9" value="<%=msg01.getE01LCMDC9()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="82"><INPUT type="text" name="E01RCVDO9" value="<%=msg01.getE01RCVDO9()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01RCVDC9" value="<%=msg01.getE01RCVDC9()%>" size="2" maxlength="1" readonly></TD>	  
	</TR>
	</TABLE>
	</TD>
	</TR>					
</TABLE>

<BR>

<TABLE width="100%" border="0" class="tableinfo">
  <TR id="trdark">
    <TD colspan="2" align="center"><B><FONT size="medium">Bank Authorised to Pay / Negotiate</FONT> </B></TD>
  </TR>
  <TR>
    <TD width="40%" align="right">Swift ID: </TD>
    <TD width="60%"><INPUT name="E01LCINBI" value="<%=msg01.getE01LCINBI()%>" size="12" readonly="readonly"></TD>
  </TR>
  <TR>
    <TD align="right">Name: </TD>
    <TD><INPUT name="E01LCINB1" value="<%=msg01.getE01LCINB1()%>" maxlength="35" size="37" readonly="readonly"></TD>
  </TR>
  <TR>
    <TD align="right">Address: </TD>
    <TD><INPUT name="E01LCINB2" value="<%=msg01.getE01LCINB2()%>" maxlength="35" size="37" readonly="readonly"></TD>
  </TR>
  <TR>
    <TD align="right">&nbsp;</TD>
    <TD><INPUT name="E01LCINB3" value="<%=msg01.getE01LCINB3()%>" maxlength="35" size="37" readonly="readonly"></TD>
  </TR>
  <TR>
    <TD align="right">&nbsp;</TD>
    <TD><INPUT name="E01LCINB4" value="<%=msg01.getE01LCINB4()%>" size="37" maxlength="25" readonly="readonly"></TD>
  </TR>
  <TR>
    <TD align="right">State: </TD>
    <TD><INPUT name="E01LCINB5" value="<%=msg01.getE01LCINB5()%>" maxlength="2" size="2" readonly="readonly"> 
    Zip Code 
	    <INPUT name="E01LCINB6" value="<%=msg01.getE01LCINB6()%>" size="10" maxlength="10" readonly="readonly">&nbsp; 
	Country  
	    <INPUT name="E01LCINB7" value="<%=msg01.getE01LCINB7()%>" maxlength="4" size="4" readonly="readonly"></TD>
  </TR>
</TABLE>

<BR>
<TABLE width="100%" border="0" class="tableinfo" id="trclear">
  <TR id="trdark">
    <TD colspan="2" align="center"><FONT size="medium"><B>Reimbursing Bank</B></FONT></TD>
  </TR>
  <TR>
    <TD width="40%" align="right">Swift ID: </TD>
    <TD width="60%"><INPUT name="E01LCIRBI" value="<%=msg01.getE01LCIRBI()%>" size="12" readonly="readonly"></TD>
  </TR>
  <TR>
    <TD align="right">Name: </TD>
    <TD><INPUT name="E01LCIRB1" value="<%=msg01.getE01LCIRB1()%>" maxlength="35" size="37" readonly="readonly"></TD>
  </TR>
  <TR>
    <TD align="right">Address: </TD>
    <TD><INPUT name="E01LCIRB2" value="<%=msg01.getE01LCIRB2()%>" maxlength="35" size="37" readonly="readonly"></TD>
  </TR>
  <TR>
    <TD align="right">&nbsp;</TD>
    <TD><INPUT name="E01LCIRB3" value="<%=msg01.getE01LCIRB3()%>" maxlength="35" size="37" readonly="readonly"></TD>
  </TR>
  <TR>
    <TD align="right">&nbsp;</TD>
    <TD><INPUT name="E01LCIRB4" value="<%=msg01.getE01LCIRB4()%>" size="25" maxlength="37" readonly="readonly"></TD>
  </TR>
  <TR>
    <TD align="right">State: </TD>
    <TD><INPUT name="E01LCIRB5" value="<%=msg01.getE01LCIRB5()%>" maxlength="2" size="2" readonly="readonly"> 
    Zip Code  
        <INPUT name="E01LCIRB6" value="<%=msg01.getE01LCIRB6()%>" size="10" readonly="readonly">&nbsp;
    Country 
        <INPUT name="E01LCIRB7" value="<%=msg01.getE01LCIRB7()%>" size="4" readonly="readonly"></TD>
  </TR>
</TABLE>
<BR>
<TABLE width="100%" border="0" class="tableinfo" id="trclear">
  <TR id="trdark">
    <TD colspan="2" align="center"><FONT size="medium"><B>Beneficiary Bank</B></FONT></TD>
  </TR>
  <TR>
    <TD width="40%" align="right">Swift ID: </TD>
    <TD width="60%"><INPUT name="E01LCIBBI" value="<%=msg01.getE01LCIBBI()%>" size="12" readonly="readonly"></TD>
  </TR>
  <TR>
    <TD align="right">Name: </TD>
    <TD><INPUT name="E01LCIBB1" value="<%=msg01.getE01LCIBB1()%>" maxlength="35" size="37" readonly="readonly"></TD>
  </TR>
  <TR>
    <TD align="right">Address: </TD>
    <TD><INPUT name="E01LCIBB2" value="<%=msg01.getE01LCIBB2()%>" maxlength="35" size="37" readonly="readonly"></TD>
  </TR>
  <TR>
    <TD align="right">&nbsp;</TD>
    <TD><INPUT name="E01LCIBB3" value="<%=msg01.getE01LCIBB3()%>" maxlength="35" size="37" readonly="readonly"></TD>
  </TR>
  <TR>
    <TD align="right">&nbsp;</TD>
    <TD><INPUT name="E01LCIBB4" value="<%=msg01.getE01LCIBB4()%>" size="25" maxlength="37" readonly="readonly"></TD>
  </TR>
  <TR>
    <TD align="right">State: </TD>
    <TD><INPUT name="E01LCIBB5" value="<%=msg01.getE01LCIBB5()%>" maxlength="2" size="2" readonly="readonly"> 
    Zip Code  
        <INPUT name="E01LCIBB6" value="<%=msg01.getE01LCIBB6()%>" size="10" readonly="readonly">&nbsp;
    Country  
        <INPUT name="E01LCIBB7" value="<%=msg01.getE01LCIBB7()%>" size="4" readonly="readonly"></TD>
  </TR>
</TABLE>
<BR>
<TABLE class="tableinfo" width="100%">
	<TR id="trdark">
    <TD  align="center"><FONT size="medium"><B>Discrepancies</B></FONT></TD>
  </TR>
    <TR > 
      <TD nowrap align="center"> 
      <DIV style="height:220px; overflow-y: scroll">
          <INPUT type="text" name="E01LCID01" size="70" maxlength="50" value="<%= msg01.getE01LCID01().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID02" size="70" maxlength="50" value="<%= msg01.getE01LCID02().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID03" size="70" maxlength="50" value="<%= msg01.getE01LCID03().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID04" size="70" maxlength="50" value="<%= msg01.getE01LCID04().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID05" size="70" maxlength="50" value="<%= msg01.getE01LCID05().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID06" size="70" maxlength="50" value="<%= msg01.getE01LCID06().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID07" size="70" maxlength="50" value="<%= msg01.getE01LCID07().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID08" size="70" maxlength="50" value="<%= msg01.getE01LCID08().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID09" size="70" maxlength="50" value="<%= msg01.getE01LCID09().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID10" size="70" maxlength="50" value="<%= msg01.getE01LCID10().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID11" size="70" maxlength="50" value="<%= msg01.getE01LCID11().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID12" size="70" maxlength="50" value="<%= msg01.getE01LCID12().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID13" size="70" maxlength="50" value="<%= msg01.getE01LCID13().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID14" size="70" maxlength="50" value="<%= msg01.getE01LCID14().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID15" size="70" maxlength="50" value="<%= msg01.getE01LCID15().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID16" size="70" maxlength="50" value="<%= msg01.getE01LCID16().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID17" size="70" maxlength="50" value="<%= msg01.getE01LCID17().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID18" size="70" maxlength="50" value="<%= msg01.getE01LCID18().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID19" size="70" maxlength="50" value="<%= msg01.getE01LCID19().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID20" size="70" maxlength="50" value="<%= msg01.getE01LCID20().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID21" size="70" maxlength="50" value="<%= msg01.getE01LCID21().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID22" size="70" maxlength="50" value="<%= msg01.getE01LCID22().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID23" size="70" maxlength="50" value="<%= msg01.getE01LCID23().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID24" size="70" maxlength="50" value="<%= msg01.getE01LCID24().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID25" size="70" maxlength="50" value="<%= msg01.getE01LCID25().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID26" size="70" maxlength="50" value="<%= msg01.getE01LCID26().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID27" size="70" maxlength="50" value="<%= msg01.getE01LCID27().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID28" size="70" maxlength="50" value="<%= msg01.getE01LCID28().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID29" size="70" maxlength="50" value="<%= msg01.getE01LCID29().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID30" size="70" maxlength="50" value="<%= msg01.getE01LCID30().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID31" size="70" maxlength="50" value="<%= msg01.getE01LCID31().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID32" size="70" maxlength="50" value="<%= msg01.getE01LCID32().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID33" size="70" maxlength="50" value="<%= msg01.getE01LCID33().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID34" size="70" maxlength="50" value="<%= msg01.getE01LCID34().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID35" size="70" maxlength="50" value="<%= msg01.getE01LCID35().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID36" size="70" maxlength="50" value="<%= msg01.getE01LCID36().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID37" size="70" maxlength="50" value="<%= msg01.getE01LCID37().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID38" size="70" maxlength="50" value="<%= msg01.getE01LCID38().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID39" size="70" maxlength="50" value="<%= msg01.getE01LCID39().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID40" size="70" maxlength="50" value="<%= msg01.getE01LCID40().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID41" size="70" maxlength="50" value="<%= msg01.getE01LCID41().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID42" size="70" maxlength="50" value="<%= msg01.getE01LCID42().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID43" size="70" maxlength="50" value="<%= msg01.getE01LCID43().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID44" size="70" maxlength="50" value="<%= msg01.getE01LCID44().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID45" size="70" maxlength="50" value="<%= msg01.getE01LCID45().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID46" size="70" maxlength="50" value="<%= msg01.getE01LCID46().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID47" size="70" maxlength="50" value="<%= msg01.getE01LCID47().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID48" size="70" maxlength="50" value="<%= msg01.getE01LCID48().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID49" size="70" maxlength="50" value="<%= msg01.getE01LCID49().trim()%>" readonly="readonly"><BR>
          <INPUT type="text" name="E01LCID50" size="70" maxlength="50" value="<%= msg01.getE01LCID50().trim()%>" readonly="readonly"><BR>
        </DIV></TD>
    </TR>
  </TABLE>
</FORM>

</BODY>
</HTML>
