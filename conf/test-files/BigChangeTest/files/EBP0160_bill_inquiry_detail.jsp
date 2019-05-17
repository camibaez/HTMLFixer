<%@ page import = "datapro.eibs.master.Util" %>

<html>
<head>
<title>Bills Inquiry</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="EBP0160Record" class="datapro.eibs.beans.EBP016001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
 
<script src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/e/javascripts/eIBSBillsP.jsp"> </SCRIPT>

<script language="JavaScript">

</SCRIPT>

</head>

<body>

<h3 align="center">
	<% 
	if (userPO.getType().equals("V")) { 
		out.println("Vendor "); 
	} 
	else if (userPO.getType().equals("C")) {
			out.println("Customer "); 
			}			  
	else { out.println("Purchase Order ");
	} 
	%>Bills - Inquiry
    <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="bills_inquiry_detail.jsp, EBP0160">
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0160" >
	<input TYPE=HIDDEN name="SCREEN" value="5">
 	<input TYPE=HIDDEN name="E01BPBNUM" value="<%= EBP0160Record.getE01BPBNUM()%>">
	<input TYPE=HIDDEN name="E01BPBTYP" value="<%= EBP0160Record.getE01BPBTYP()%>">
	<input TYPE=HIDDEN name="E01BPBSTS" value="<%= EBP0160Record.getE01BPBSTS()%>">
	<input TYPE=HIDDEN name="userpox" value="<%= userPO.getPurpose()%>"> 

	<table  class="tableinfo" width="100%">
		<tr bordercolor="#FFFFFF"> 
			<td nowrap> 
				<H5>Bill Information</H5>  
				<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0" >
        			<tr id="trdark"> 
						<td nowrap width="25%" align="left"> <B>Internal Number : </B><%= EBP0160Record.getE01BPBNUM()%></td>
						<td nowrap width="35%" align="left"> <B>Vendor : </B><%= EBP0160Record.getE01BPBCOD()%>  <%= EBP0160Record.getE01BPBVCN()%> </td>
						<td nowrap width="20%" align="left"> <B>Type : </B><%= EBP0160Record.getE01BPBTYPD()%> 
							<% if (userPO.getType().equals("C") )  { 	
								out.println(EBP0160Record.getE01BPBCUN().trim());
			  				}%>  
						</td>
							<% if (userPO.getType().equals("V") )  { %>
						<td nowrap width="25%" align="left"></td>
							<% } else { %>
						<td nowrap width="25%" align="left"><B>Purchase Order : </B><%= EBP0160Record.getE01BPBORD()%></td>
							<% } %>
					</tr>	
					<tr id="trclear">
						<td nowrap width="25%" align="left"><B><U>Basic Information</U> </B></td>
						<td nowrap width="25%" align="left"></td>
						<td nowrap width="25%" align="left"></td>
						<td nowrap width="25%" align="left"></td>
					</tr>
					<tr id="trdark"> 
						<td nowrap width="25%" align="left"><B>Bill Reference :</B> <%= EBP0160Record.getE01BPBBIL()%></td>
						<td nowrap width="25%" align="Left"><B>Bill Description :</B> <%= EBP0160Record.getE01BPBDSC()%></td>
						<td nowrap width="30%" align="left"><B>Total Amount : </B><%= EBP0160Record.getE01BPBBAM()%></td>
						<td nowrap width="20%" align="left"></td>
					</tr>
					<tr id="trclear"> 
						<td nowrap width="25%" align="left"><B>Bank : </B><%= EBP0160Record.getE01BPBBNK()%> 
															<B>Branch : </B><%= EBP0160Record.getE01BPBBRN()%>
															<B>Currency : </B><%= EBP0160Record.getE01BPBCCY()%>
						</td>
						<td nowrap width="20%" align="left"><B>Invoice Date :</B> <%= datapro.eibs.master.Util.formatDate(EBP0160Record.getE01BPBIVM(),EBP0160Record.getE01BPBIVD(),EBP0160Record.getE01BPBIVY())%></td>    
						<td nowrap width="55%" align="left"><B>Remarks : </B><%= EBP0160Record.getE01BPBRM1()%><br><%= EBP0160Record.getE01BPBRM2()%></td>
					</tr>
					<tr id="trdark">
						<td nowrap width="25%" align="left"><B><U>Payment Information</U></B></td>
						<td nowrap width="25%" align="left"></td>
						<td nowrap width="25%" align="left"></td>
						<td nowrap width="25%" align="left"></td>
					</tr>
					<tr  id="trclear"> 
						<td nowrap width="25%" align="left"><B>Payment Due Date : </B><%= datapro.eibs.master.Util.formatDate(EBP0160Record.getE01BPBPDM(),EBP0160Record.getE01BPBPDD(),EBP0160Record.getE01BPBPDY())%></td>
						<td nowrap width="25%" align="left"><B>Payment Type : </B>
							<% if (EBP0160Record.getE01BPBPTY().equals("F")) out.print("Fixed Amount");%>		              
							<% if (EBP0160Record.getE01BPBPTY().equals("V")) out.print("Variable Amount");%>
						</td>
						<td nowrap width="25%" align="left"><B>Minimum Payment Amount : </B><%= EBP0160Record.getE01BPBMAM()%></td>
						<td nowrap width="25%" align="left"></td>
					</tr> 
					<tr id="trdark"> 
						<td nowrap width="25%" align="left"><B>Frequency : </B>
							<% if (EBP0160Record.getE01BPBPFR().equals("O")) out.print("One Time");%>
							<% if (EBP0160Record.getE01BPBPFR().equals("W")) out.print("Weekly");%>
							<% if (EBP0160Record.getE01BPBPFR().equals("B")) out.print("Bi-Weekly");%>
							<% if (EBP0160Record.getE01BPBPFR().equals("M")) out.print("Monthly");%>
							<% if (EBP0160Record.getE01BPBPFR().equals("Q")) out.print("Quarterly");%>
							<% if (EBP0160Record.getE01BPBPFR().equals("Y")) out.print("Yearly");%></td> 
						<td nowrap width="25%" align="left"><B>Payment Day : </B><%= EBP0160Record.getE01BPBDAY()%></td>
						<td nowrap width="25%" align="left"><B>Number of Payments : </B><%= EBP0160Record.getE01BPBNOP()%></td>
						<td nowrap width="25%" align="left"><B>Start Pay Date : </B><%= datapro.eibs.master.Util.formatDate(EBP0160Record.getE01BPBIDM(),EBP0160Record.getE01BPBIDD(),EBP0160Record.getE01BPBIDY())%></td>
					</tr>	
					<tr id="trclear"> 
						<td nowrap width="25%" align="left"><B>Payment Limits : </B> 
							<% if (EBP0160Record.getE01BPBPLI().equals("T")) out.print("Total Bill");%>
							<% if (EBP0160Record.getE01BPBPLI().equals("F")) out.print("Fixed Amount");%>
							<% if (EBP0160Record.getE01BPBPLI().equals("P")) out.print("Percentage");%>
						</td>
						<td nowrap width="25%" align="left"><B>Tolerance % : </B><%= EBP0160Record.getE01BPBPER()%></td>
						<td nowrap width="25%" align="left"><B>Payment Via : </B> 
							<% if (EBP0160Record.getE01BPBPVI().equals("A")) out.print("ACH");%>
							<% if (EBP0160Record.getE01BPBPVI().equals("R")) out.print("Retail Account");%>
							<% if (EBP0160Record.getE01BPBPVI().equals("G")) out.print("GL Account");%>
							<% if (EBP0160Record.getE01BPBPVI().equals("C")) out.print("Official Check");%>
							<% if (EBP0160Record.getE01BPBPVI().equals("S")) out.print("Swift");%>
							<% if (EBP0160Record.getE01BPBPVI().equals("P")) out.print("Petty Cash");%>
						</td>
						<td nowrap width="25%" align="left"></td>
					</tr>	
						<tr id="trdark">
						<td nowrap width="25%" align="left"><B><U>GL Information</U></B></td> 
						<td nowrap width="25%" align="left"></td>
						<td nowrap width="25%" align="left"></td>
						<td nowrap width="25%" align="left"></td>
					</tr>
					<tr id="trclear" > 
						<td nowrap width="10%" align="left"><B>Amortization : </B> 
							<% if (EBP0160Record.getE01BPBAMC().equals("Y")) out.print("Yes"); %>
							<% if (EBP0160Record.getE01BPBAMC().equals("N")) out.print("No"); %>
						</td>
						<% if (EBP0160Record.getE01BPBAMC().equals("Y")) { %>    
						<td nowrap width="25%" align="left"><B>Start Amortization	on: Year : </B> <%= EBP0160Record.getE01BPBAYY()%>
															<B>Month : </B><%= EBP0160Record.getE01BPBAMM()%></td>
						<td nowrap width="25%" align="left"><B>Number of Months : </B><%= EBP0160Record.getE01BPBAMS()%> </td>
						<td nowrap width="40%" align="left"></td>
						<% } else { %>
						<td nowrap width="90%" align="left"></td>
						<% }; %>
					</tr>
					<% if (EBP0160Record.getE01BPBSTS().equals("S")) { %>
					<tr id="trdark">
						<td nowrap width="25%" align="left"><B><U>Suspend Information </U></B></td>
						<td nowrap width="25%" align="left"></td>
						<td nowrap width="25%" align="left"></td>
						<td nowrap width="25%" align="left"></td>
					</tr>
					<tr id="trclear" >
						<td nowrap width="25%" align="left"><B>Suspend on Date:</B> <%= datapro.eibs.master.Util.formatDate(EBP0160Record.getE01BPBSDM(),EBP0160Record.getE01BPBSDD(),EBP0160Record.getE01BPBSDY())%></td>
						<td nowrap width="25%" align="left"><B>Suspend Reason :</B> <%= EBP0160Record.getE01BPBSDS()%></td>
						<td nowrap width="50%" align="left"></td>
					</tr>
					<% } %>
				</table>
	<BR>	
    			<h5>Statistic Information</h5> 
				<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
					<tr id="trdark"> 
						<td nowrap width="25%" align="left"><B>Last Pay Date : </B><%= datapro.eibs.master.Util.formatDate(EBP0160Record.getE01BPBLPM(),EBP0160Record.getE01BPBLPD(),EBP0160Record.getE01BPBLPY())%></td>
						<td nowrap width="25%" align="left"><B>Payments Made : </B><%= EBP0160Record.getE01BPBPMD()%> </td>
						<td nowrap width="25%" align="left"><B>Holding Amount : </B><%= EBP0160Record.getE01BPBWAM()%> </td>
						<% if (EBP0160Record.getE01BPBTYP().equals("C")) { %>    
						<td nowrap width="25%" align="left"><B>Total Fees Payments : </B><%= EBP0160Record.getE01BPBTFE()%></td>
						<% } else { %>
						<td nowrap width="25%" align="left"></td>
						<% }; %>
					</tr>
					<tr id="trclear"> 
						<td nowrap width="25%" align="left"><B>Paid Year : </B><%= EBP0160Record.getE01BPBPYT()%></td>
						<td nowrap width="25%" align="left"><B>Paid Last Year : </B><%= EBP0160Record.getE01BPBPLT()%></td>
						<td nowrap width="50%" align="left"></td>
					</tr>	
					<% if (userPO.getHeader1().equals("C") )  { %>
					<tr id="trdark">
						<td nowrap width="25%" align="left"><B><U>Commission Information</U></B></td>
						<td nowrap width="25%" align="left"></td>
						<td nowrap width="25%" align="left"></td>
						<td nowrap width="25%" align="left"></td>
					</tr>
					<tr id="trclear"> 
						<td nowrap width="25%" align="left"><B>Fee Table : </B><%= EBP0160Record.getE01BPBFCO()%></td>
						<td nowrap width="25%" align="left"><B>Fee Amount : </B><%= EBP0160Record.getE01BPBFAM()%></td>
						<td nowrap width="50%" align="left"></td>
					</tr>
					<% } %>
				</table>
	<BR>
	
				<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
					<tr id="trdark"> 
						<td nowrap width="25%" align="left"><B>Status : </B>
							<% if (EBP0160Record.getE01BPBSTS().equals("W")) out.print("Pending for Approval");%>
							<% if (EBP0160Record.getE01BPBSTS().equals("A")) out.print("Active (Approved)");%>
							<% if (EBP0160Record.getE01BPBSTS().equals("P")) out.print("Paid-Off");%>
							<% if (EBP0160Record.getE01BPBSTS().equals("S")) out.print("Suspended");%>
							<% if (EBP0160Record.getE01BPBSTS().equals("R")) out.print("Rejected");%>	          	          	          
						</td>
						<td nowrap width="25%" align="left"><B>Approval/Rejected Date : </B><%= datapro.eibs.master.Util.formatDate(EBP0160Record.getE01BPBADM(),EBP0160Record.getE01BPBADD(),EBP0160Record.getE01BPBADY())%></td>
						<td nowrap width="25%" align="left"></td>
						<td nowrap width="25%" align="left"><B>Record Date : </B><%= datapro.eibs.master.Util.formatDate(EBP0160Record.getE01BPBRDM(),EBP0160Record.getE01BPBRDD(),EBP0160Record.getE01BPBRDY())%></td>			
					</tr>
				</table>
			</td>
		</tr>
	</table>
</form>
</body>
</html>
