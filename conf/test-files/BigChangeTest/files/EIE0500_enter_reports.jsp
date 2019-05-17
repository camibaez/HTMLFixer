<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "msgPart" class= "datapro.eibs.beans.EIE050001Message"  scope="session"/>

<script language="JavaScript">

  function visibility_cy()
  {
	  	elem = event.srcElement
		document.forms[0].E01PGMCAL.value = elem.value;

		document.forms[0].SCREEN.value=1;
		document.forms[0].E01DTEFR1.value="";
  		document.forms[0].E01DTEFR2.value="";
  		document.forms[0].E01DTEFR3.value="";
  		document.forms[0].E01DTETO1.value="";
  		document.forms[0].E01DTETO2.value="";
  		document.forms[0].E01DTETO3.value="";
  		document.forms[0].E01USRFL0.value="";
  		document.forms[0].E01USRFL1.value="";
		document.forms[0].E01USRF33.value="";
						  
  		
		enterPeriod.style.visibility="hidden";
		enterParam.style.visibility="hidden";
		enterComplex.style.visibility="hidden";
		enterInstrument.style.visibility="hidden";

		if (document.forms[0].E01PGMCAL[3].checked)
		{
				enterPeriod.style.visibility="visible";
				enterParam.style.visibility="visible";	
		}
		else if (document.forms[0].E01PGMCAL[4].checked)
		{
				enterPeriod.style.visibility="visible";
		}
		else if (document.forms[0].E01PGMCAL[7].checked)
		{
				enterPeriod.style.visibility="visible";
				enterInstrument.style.visibility="visible";
		}
		else if (document.forms[0].E01PGMCAL[10].checked)
		{
				document.forms[0].SCREEN.value=3;
				document.forms[0].REPNAME.value='ibsstmt_en.rpt';
				//document.forms[0].REPNAME.value='ibsstmt_es.rpt';
		}else if(document.forms[0].E01PGMCAL[2].checked){
		        enterComplex.style.visibility="visible";
		}else if(document.forms[0].E01PGMCAL[8].checked){
		        enterComplex.style.visibility="visible";
		}
  }

</SCRIPT>  


<META name="GENERATOR" content="IBM WebSphere Studio">
</head>
<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }


%>
<h3 align="center">Portfolio Reports<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="enter_reports.jsp, EIE0500"> 
</h3>
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0500">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1">
  <INPUT TYPE=HIDDEN NAME="REPTYP" VALUE="1">
  <INPUT TYPE=HIDDEN NAME="REPNAME" VALUE="">
 
  <h3 align="center">Private Banking Reports</h3>
<TABLE class="tbenter" height="55%" width="0%" border="0">
	<TBODY>
		<TR>
			<TD nowrap align="center">
			<TABLE class="tableinfo" width="100%">
				<TBODY>
					<TR>
						<TD>
						<TABLE width="100%">
							<TBODY>
								<TR id="trdark">
									<TD width="20%" nowrap>&nbsp;</TD>
									<TD width="40%" nowrap><B>Reports by :</B></TD>
									<TD nowrap width="30%"></TD>
									<TD nowrap width="50%"></TD>
								</TR>
								<TR id="trclear">
									<TD nowrap>
									<DIV align="center">
									<INPUT type="radio" name="E01PGMCAL" value="EIE0400P" onClick="visibility_cy()" checked>
									</DIV>
									</TD>
									<TD nowrap>
									<DIV align="left"><A> Outstanding
									Position by Customers </A></DIV>
									</TD>
									
									<TD rowspan="12" nowrap>
									  <TABLE border="0">
										 <TBODY>
											<TR>
											  <TD nowrap>
				                                <div id="enterPeriod" style="visibility:hidden;">
					                              <TABLE cellspacing="0" cellpadding="2" border="0" width="100%">
		                                          	<tr id="trclear"> 
        		                                       <td width="40%" nowrap> 
		                                                 <div align="right">From Date  :</div>
		                                               </td>
		                                               <td width="60%" nowrap>
                                                         <div  align="left"> 
                                                          <input type="text" name="E01DTEFR1" size="2" maxlength="2" onkeypress="enterInteger()" value="<%= msgPart.getE01DTEFR1()%>">
                                                          <input type="text" name="E01DTEFR2" size="2" maxlength="2" onkeypress="enterInteger()" value="<%= msgPart.getE01DTEFR2()%>">
                                                          <input type="text" name="E01DTEFR3" size="2" maxlength="2" onkeypress="enterInteger()" value="<%= msgPart.getE01DTEFR3()%>">
                                                           <a href="javascript:DatePicker(document.forms[0].E01DTEFR1,document.forms[0].E01DTEFR2,document.forms[0].E01DTEFR3)">
                                                            <img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
                                                            <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" > 
                                                         </div>
		                                              </td>
		          	                                </tr>		
		          	                                <tr id="trdark"> 
        		                                      <td width="40%" nowrap> 
		                                                <div align="right">To Date :</div>
		                                              </td>
		                                              <td width="60%" nowrap>
                                                        <div align="left"> 
                                                          <input type="text" name="E01DTETO1" size="2" maxlength="2" onkeypress="enterInteger()" value="<%= msgPart.getE01DTETO1()%>">
                                                          <input type="text" name="E01DTETO2" size="2" maxlength="2" onkeypress="enterInteger()" value="<%= msgPart.getE01DTETO2()%>">
                                                          <input type="text" name="E01DTETO3" size="2" maxlength="2" onkeypress="enterInteger()" value="<%= msgPart.getE01DTETO3()%>">
                                                           <a href="javascript:DatePicker(document.forms[0].E01DTETO1,document.forms[0].E01DTETO2,document.forms[0].E01DTETO3)">
                                                            <img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
                                                            <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" > 
                                                        </div>
		                                              </td>
		          	                                </tr>
					                              </TABLE>
				                                </div>
			                                  </TD>
			                                </TR>
				<%--   Added by Henry 07/10/08 : Include Instrument Number   --%>
											<tr>
											  <TD nowrap>
				                                <div id="enterInstrument" style="visibility:hidden;">
					                              <TABLE cellspacing="0" cellpadding="2" border="0" width="100%">
		                                          	<tr id="trclear"> 
        		                                       <td width="40%" nowrap> 
		                                                 <div align="right">Instrument Number :</div>
		                                               </td>
		                                               <td width="60%" nowrap>
                                                         <div  align="left"> 
                                                          <input type="text" name="E01USRF33" size="10" maxlength="9" onkeypress="enterInteger()" value="<%= msgPart.getE01USRF33()%>">
                                                         </div>
		                                              </td>
		          	                                </tr>		
					                              </TABLE>
											  	</div>
											  </TD>
											</tr>
				<%-- 	Until here   --%>
			                                <TR>
			                                  <TD nowrap>
			                                    <div id="enterParam" style="visibility:hidden;">
					                              <TABLE cellspacing="0" cellpadding="2" border="0" width="100%">
		          			          			    <TR id="trclear">
						                              <TD width="160" nowrap>
		                                                <div align="right">Event :</div>
						                              </TD>
						                              <td nowrap width="50%"> 
						                                <div align="left">
			                                              <SELECT name="E01USRFL0">
									                          <OPTION value=""
										                          <%if (msgPart.getE01USRFL0().equals("")) { out.print("selected"); }%> >All Events</OPTION>
									                          <OPTION value="1"
										                               <%if (msgPart.getE01USRFL0().equals("1")) { out.print("selected"); }%> >Interest</OPTION>
									                          <OPTION value="2"
									                              	<%if (msgPart.getE01USRFL0().equals("2")) { out.print("selected"); }%> >Maturity</OPTION>
									                          <OPTION value="3"
										                                   <%if (msgPart.getE01USRFL0().equals("3")) { out.print("selected"); }%> >Call</OPTION>
									                          <OPTION value="4"
										                                   <%if (msgPart.getE01USRFL0().equals("4")) { out.print("selected"); }%> >Put</OPTION>
									                          <OPTION value="5"
										                                   <%if (msgPart.getE01USRFL0().equals("5")) { out.print("selected"); }%> >Dividents</OPTION>
								                          </SELECT>
						                                </div>
			                                          </td>
					                                </TR>
					                                <TR id="trdark">
						                              <TD nowrap>
		                                                 <div align="right">Portfolio Type :</div>
						                              </TD>
						                              <TD nowrap>
						                                <div align="left">
			                                               <SELECT name="E01USRFL1">
									                          <OPTION value=""
										                         <%if (msgPart.getE01USRFL1().equals("")) { out.print("selected"); }%> >Both</OPTION>
									                          <OPTION value="D"
										                          <%if (msgPart.getE01USRFL1().equals("D")) { out.print("selected"); }%> >Discretionary</OPTION>
									                          <OPTION value="N"
										                         <%if (msgPart.getE01USRFL1().equals("N")) { out.print("selected"); }%> >Non Discretionary</OPTION>
									                       </SELECT>
						                                </div>
						                              </TD>
					                                </TR>					
					                              </TABLE>
			                                    </div>												
									          </TD>
								            </TR>
								            <TR>
								              <TD>
								                <div id="enterComplex" style="visibility:hidden;">
								                  <TABLE cellspacing="0" cellpadding="2" border="0" width="100%">
								                    <TR id="trdark">
								                      <TD colspan="2" nowrap>
								                       
						                                <div align="left">
			                                               <input type="radio" name="E01USRFL2" value=" " checked > ALL
									                       <input type="radio" name="E01USRFL2" value="Y"> Complex
									                       <input type="radio" name="E01USRFL2" value="N"> Non Complex  
						                                </div>  
								                    </TR>
								                  </TABLE>
								                </div>
								              </TD>
								            </TR>
								         </TBODY>
							          </TABLE>
						            </TD>
						            <TD nowrap rowspan="12"></TD>
					            </TR>
								<TR id="trdark">
								    <TD nowrap>
									  <DIV align="center">
									    <INPUT type="radio" name="E01PGMCAL" value="EIE0410P" onClick="visibility_cy()">
									  </DIV>
									</TD>
									<TD nowrap>
									<DIV align="left"><A> Outstanding
									Position by Custodians </A></DIV>
									</TD></TR>
								<TR id="trclear">
									<TD nowrap>
									<DIV align="center">
									<INPUT type="radio" name="E01PGMCAL" value="EIE0420P" onClick="visibility_cy()">
									</DIV>
									</TD>
									<TD nowrap>
									<DIV align="left"><A>Outstanding
									Position by Instruments</A></DIV>
									</TD></TR>
								<TR id="trdark">
									<TD nowrap>
									<DIV align="center">
									<INPUT type="radio" name="E01PGMCAL" value="IE3201PA" onClick="visibility_cy()">
									</DIV>
									</TD>
									<TD nowrap><A>Next
									Coupon Payments </A></TD></TR>
								<TR id="trclear">
									<TD nowrap>
									<DIV align="center">
									<INPUT type="radio" name="E01PGMCAL" value="IE3260P" onClick="visibility_cy()">
									</DIV>
									</TD>
									<TD nowrap>
									<DIV align="left"><A>Paid Coupons</A>
									</DIV>
									</TD></TR>
								<TR id="trdark">
									<TD nowrap>
									<DIV align="center">
									<INPUT type="radio" name="E01PGMCAL" value="IE3220P" onClick="visibility_cy()">
									</DIV>
									</TD>
									<TD nowrap><A>Issuers
									that does not pay interest </A></TD>
							
								<TR id="trclear">
									<TD nowrap>
									<DIV align="center">
									<INPUT type="radio" name="E01PGMCAL" value="IE3210P" onClick="visibility_cy()">
									</DIV>
									</TD>
									<TD nowrap>
									<DIV align="left"><A>Traders to
									be settled</A></DIV>
									</TD></TR>
								<TR id="trdark">
									<TD nowrap>
									<DIV align="center">
									<INPUT type="radio" name="E01PGMCAL" value="IE3240P" onClick="visibility_cy()">
									</DIV>
									</TD>
									<TD nowrap><A>Settled
									Trades</A></TD></TR>
								<TR id="trclear">
									<TD nowrap>
									<DIV align="center">
									<INPUT type="radio" name="E01PGMCAL" value="IE9285P" onClick="visibility_cy()">
									</DIV>
									</TD>
									<TD nowrap>
									<DIV align="left"><A>Instruments
									Basic Information</A></DIV>
									</TD></TR>
								<TR id="trdark">
									<TD nowrap>
									<DIV align="center">
									<INPUT type="radio" name="E01PGMCAL" value="IE3230" onClick="visibility_cy()">
									</DIV>
									</TD>
									<TD nowrap><A>Collaterals
									Exception Report </A></TD></TR>
								<TR id="trclear">
									<TD nowrap>
									<DIV align="center">
									<INPUT type="radio" name="E01PGMCAL" value="" onClick="visibility_cy()">
									</DIV>
									</TD>
									<TD nowrap>
									<DIV align="left"><A>
									Account	Statements</A></DIV>
									</TD></TR>
								<TR id="trdark">
									<TD nowrap>
									<DIV align="center">
									<INPUT type="radio" name="E01PGMCAL" value="LD0243P" onClick="visibility_cy()">
									</DIV>
									</TD>
									<TD nowrap><A>Money Laundering Activity</A></TD></TR>									
							</TBODY>
						</TABLE>
						</TD>
						
						

				
				</TBODY>
			</TABLE>


			</TD>
		</TR>
	</TBODY>
</TABLE>
  <div align="center"> 
	   <input id="EIBSBTN" type=submit name="Submit" value="Print">
  </div>
</form>
</body>
</html>
