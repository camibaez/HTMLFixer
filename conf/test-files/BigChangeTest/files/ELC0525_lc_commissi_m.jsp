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

<jsp:useBean id="msg" class="datapro.eibs.beans.ELC051004Message" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />

<SCRIPT LANGUAGE="javascript">
	builtNewMenu(lc_apr_cc_maint);
	initMenu(); 
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
<H3 align="center">Letter Of Credit Approval Inquiry [Commissions]
	<IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="lc_commissi_m.jsp, ELC0525"></H3>
<HR size="4">


<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0510" >
<INPUT NAME="SCREEN" TYPE=HIDDEN VALUE="8" readonly="readonly">
<INPUT NAME="MSG" TYPE=HIDDEN VALUE="ELC051004" readonly="readonly">
<TABLE class="tableinfo">
	<TR>
		<TD nowrap>
		<TABLE cellspacing="0" cellpadding="2" width="100%" border="0"
			class="tbhead">
			<TR id="trdark">
				<TD nowrap width="16%">
				<DIV align="right"><B>Bank :</B></DIV>
				</TD>
				<TD nowrap width="20%">
				<DIV align="left"><INPUT type="text" name="E04LCMBNK" readonly
					size="4" maxlength="2" value="<%=msg.getE04LCMBNK().trim()%>"></DIV></TD>
				<TD nowrap width="16%">
				<DIV align="right"><B>Product : </B></DIV>
				</TD>
				<TD nowrap width="16%">
				<DIV align="left"><B> <INPUT type="text" name="E01LCMPRO" size="4"
					maxlength="4" value="<%=msg.getE04LCMPRO().trim()%>" readonly> </B>
				</DIV>
				</TD>
				<TD nowrap width="16%">
				<DIV align="right"><B>Letter Of Credit Number :</B></DIV>
				</TD>
				<TD nowrap width="16%">
				<DIV align="left"><B><INPUT type="text" name="E04LCMACC" size="12"
					maxlength="12" value="<%=msg.getE04LCMACC().trim()%>" readonly> </B>
				</DIV>
				</TD>
			</TR>
			<TR id="trclear">
				<TD nowrap width="16%">
				<DIV align="right"><B>Issuing Date :</B></DIV>
				</TD>
				<TD nowrap width="20%" colspan=3>
				<DIV align="left"><INPUT type="text" name="E04LCMBNK0" readonly
					size="10" maxlength="10" value=
					"<%=msg.getE04LCMID1() + "/" + msg.getE04LCMID2() +
					"/"+(msg.getE04LCMID3().length() == 1 ? "0"+msg.getE04LCMID3() : msg.getE04LCMID3())%>"></DIV></TD>
				<TD nowrap width="16%">
				<DIV align="right"><B>Tariff and Currency :</B></DIV>
				</TD>
				<TD nowrap width="16%" align="left">
					<INPUT type="text" name="E04LCMTAR" size="2"
					maxlength="2" value= "<%=msg.getE04LCMTAR()%>" readonly>
					<INPUT type="text" name="E04LCMTCY" size="3"
					maxlength="3" value= "<%=msg.getE04LCMTCY()%>" readonly>
				</TD>
			</TR>
			<TR id="trclear">
				<TD nowrap width="16%">
				<DIV align="right"><B>Expiration Date :</B></DIV>
				</TD>
				<TD nowrap width="20%" colspan=3>
				<DIV align="left"><INPUT type="text" name="E04LCMBNK0" readonly
					size="10" maxlength="10" value=
					"<%=msg.getE04LCMEX1()+"/"+msg.getE04LCMEX2()+"/"
					+(msg.getE04LCMEX3().length() == 1 ? "0"+msg.getE04LCMEX3() : msg.getE04LCMEX3())%>"></DIV></TD>
				<TD nowrap width="16%">
				<DIV align="right"><B>Amount (L/C Currency) :</B></DIV>
				</TD>
				<TD nowrap width="16%">
				<DIV align="left"><B><INPUT type="text" name="E04LCMOAM" size="12"
					maxlength="12" value="<%=msg.getE04LCMOAM()%>" readonly> </B></DIV>
				</TD>
			</TR>
		</TABLE>
		</TD>
	</TR>
</TABLE>

<BR>

<h4>Commissions Details</h4>
<TABLE class="tableinfo" border="0" cellspacing="0" cellpadding="4" width="100%">
					<TR id="trdark">
						<TD width="37%" align="right"></TD>
						<td nowrap align="center" width="17%"><b>Amount</b></td>
						<td nowrap align="center" width="15%"><b>Charges Paid By</b></td>
						<TD nowrap align="center" width="31%"></TD>
						<TD nowrap align="center" width="12%"></TD>
					</TR>
					
					<%
					int size = 8;
					java.util.ArrayList name = new java.util.ArrayList();
					java.util.ArrayList field1 = new java.util.ArrayList();
					java.util.ArrayList field2 = new java.util.ArrayList();
					
					if(msg.getH04FLGWK3().equals("N"))
						{
						name.add("Issuance");
						field1.add("E04LCMC01");
						field2.add("E04LCMP01");

						name.add("Advising");
						field1.add("E04LCMC02");
						field2.add("E04LCMP02");

						name.add("Confirmation");
						field1.add("E04LCMC03");
						field2.add("E04LCMP03");

						name.add("Stamp Duty");
						field1.add("E04LCMC08");
						field2.add("E04LCMP08");

					}
					else
					{
						name.add("Amendment");
						field1.add("E04LCMC04");
						field2.add("E04LCMP04");

						name.add("Advising Amendment");
						field1.add("E04LCMC05");
						field2.add("E04LCMP05");

						name.add("Discrepancy");
						field1.add("E04LCMC06");
						field2.add("E04LCMP06");

						name.add("Extension of Validity");
						field1.add("E04LCMC07");
						field2.add("E04LCMP07");
					}
					
					name.add("Postage");
					field1.add("E04LCMC08");
					field2.add("E04LCMP08");
					
					name.add("Courier");
					field1.add("E04LCMC09");
					field2.add("E04LCMP09");
					
					name.add("Issuance Swift");
					field1.add("E04LCMC10");
					field2.add("E04LCMP10");
					
					name.add("Addtional Swift");
					field1.add("E04LCMC11");
					field2.add("E04LCMP11");
					
										
					java.util.ArrayList value2 = new java.util.ArrayList();
					for(int i = 0; i < field2.size() -2; i++)
					{
						value2.add(msg.getField((String)field2.get(i)).getString().trim());
					}
					value2.add("");
					value2.add("");

					for (int i = 0; i < name.size(); i++)
					{
						%>
					
						<TR id="<%=( i%2==0 ? "trclear" : "trdark" )%>">
							<TD align="right"><%=(String) name.get(i)%></TD>
							<TD nowrap width="10%" align="center">
								<INPUT name="<%=field1.get(i)%>" type="text"
									value="<%=msg.getField((String) field1.get(i)).getString().trim()%>" size="15" maxlength="15" readonly="readonly">
						  </TD>
							<TD nowrap width="10%">
								<SELECT name="<%=field2.get(i)%>" disabled <%if( i >= name.size()-2) out.print("disabled");%> >
									<OPTION value="A">Applicant</OPTION>
									<%if(i < name.size()-2)
									{%>
										<OPTION value="B" <%=( msg.getField((String) field2.get(i)).getString().trim().equals("B") ? "selected" : "" )%>>
											Beneficiary
										</OPTION>
									<%}
									else{%>
										<OPTION value="">Beneficiary</OPTION>								
									<%}%>
						  </SELECT></TD>
							<TD nowrap width="31%"></TD>
							<TD nowrap width="12%"></TD>
						</TR>
					
					<%}%>
</TABLE>


</FORM>
</BODY>
</HTML>
