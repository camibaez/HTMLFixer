<html>
<head>
<title>Bills Detail</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="EBP0130Record" class="datapro.eibs.beans.EBP013001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
 
<script src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/e/javascripts/eIBSBillsP.jsp"> </SCRIPT>

<script language="JavaScript">

builtHPopUp();

function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
	init(opth,field,bank,ccy,field1,field2,opcod);
   		showPopupHelp();
}

function goAction(op) {
	document.forms[0].SCREEN.value = op;
    
	if (op == 4) {
		if (!confirm("Do you want to delete this record?")) {
			return;
		}
	}
	document.forms[0].submit();
}
</SCRIPT>

</head>

<body >

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
	String read = "";
 	String disabled = "";
	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) 
		{ read = " readonly ";
		  disabled = " disabled"; }	
	if (userPO.getHeader3().equals ("A") && (userPO.getPurpose().equals("MAINTENANCE"))) {
	        read = " readonly ";
		    disabled = " disabled"; 
		  }		  
%>

<h3 align="center"><% if (userPO.getHeader1().equals("V")) { 
										out.println("Vendor "); 
					  } 
					  else if (userPO.getHeader1().equals("C")) {
					                                     out.println("Customer "); 
					  }			  
					  else { out.println("Purchase Order ");
					  } 
				   %>   Bill 
				   <% if (userPO.getPurpose().equals("NEW")) { 
										out.println("  - New "); 
					   } 
					   else if (userPO.getPurpose().equals("MAINTENANCE")) {
					                               out.println(" - Maintenance "); 
					   }			  
					   else { out.println(" - Inquiry ");
					   } 
				   %>				
    <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" ALT="bills_detail.jsp, EBP0130">
</h3>

<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0130" >
	<input TYPE=HIDDEN name="SCREEN" value="5">
	<input TYPE=HIDDEN name="E01BPBNUM" value="<%= EBP0130Record.getE01BPBNUM().trim()%>">
	<input TYPE=HIDDEN name="E01BPBTYP" value="<%= EBP0130Record.getE01BPBTYP().trim()%>">
	<input TYPE=HIDDEN name="E01BPBSTS" value="<%= EBP0130Record.getE01BPBSTS().trim()%>">
	<input TYPE=HIDDEN name="E01BPGSEQ1" value="<%= EBP0130Record.getE01BPGSEQ1().trim()%>">
	<input TYPE=HIDDEN name="E01BPGSEQ2" value="<%= EBP0130Record.getE01BPGSEQ2().trim()%>">
	<input TYPE=HIDDEN name="E01BPGSEQ3" value="<%= EBP0130Record.getE01BPGSEQ3().trim()%>">
	<input TYPE=HIDDEN name="E01BPBPMD" value="<%= EBP0130Record.getE01BPBPMD().trim()%>">
	<input TYPE=HIDDEN name="userpox" value="<%= userPO.getPurpose()%>"> 
	<INPUT TYPE=HIDDEN name="E01REQTYP" value="<%= userPO.getHeader1().trim() %>">
	<INPUT TYPE=HIDDEN name="E01REQORD" value="<%= userPO.getHeader2().trim() %>">
	<INPUT TYPE=HIDDEN name="E01REQSTS" value="<%= userPO.getHeader3().trim() %>">
	<INPUT TYPE=HIDDEN name="E01REQFRM" value="<%= userPO.getHeader4().trim() %>">
	<INPUT TYPE=HIDDEN name="E01REQPDM" value="<%= userPO.getHeader5().trim() %>">
	<INPUT TYPE=HIDDEN name="E01REQPDD" value="<%= userPO.getHeader6().trim() %>">
	<INPUT TYPE=HIDDEN name="E01REQPDY" value="<%= userPO.getHeader7().trim() %>">
<table width="100%"> <tr> <td nowrap>
	<table width="100%" > <tr bordercolor="#FFFFFF"> <td width="100%" nowrap> 		
		<table class="tableinfo" cellspacing="0" width="100%" border="0" >
		<tr id="trdark"> 
			<td nowrap width="5%" align="right">Internal Number: </td>
			<td nowrap width="5%" align="left"> <%= EBP0130Record.getE01BPBNUM().trim()%></td>
			<td nowrap width="5%" align="right">Vendor : </td>
			<td nowrap width="60%" align="left"> 
				<input type="text" name="E01BPBCOD" maxlength="9" size="10" value="<%= EBP0130Record.getE01BPBCOD().trim()%>" <%= read %>  onkeypress="enterInteger()">
				<input type="text" name="E01BPBVCN" size="45"  maxlength="46" value="<%= EBP0130Record.getE01BPBVCN().trim()%>"  readonly>
					<a href="javascript:GetVendorBP('E01BPBCOD','E01BPBVCN')">
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></a>	
					<IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatoy Field" align="bottom">
			</td>
			<td nowrap width="25%">Record Date : <%= datapro.eibs.master.Util.formatDate(EBP0130Record.getE01BPBRDM(),EBP0130Record.getE01BPBRDD(),EBP0130Record.getE01BPBRDY())%></td>
		</tr>
	</table>
	</td></tr></table>
	<h4><B>Basic Information</B></h4>  
	<table width="100%" > <tr bordercolor="#FFFFFF"> <td width="100%" nowrap> 		  
		<table class="tableinfo" cellspacing="0" width="100%" border="0">
		<tr id="trdark"> 
			<td nowrap width="10%" align="right">Bill Reference:</td>
			<td nowrap width="40%" align="left">
				<input type="text" name="E01BPBBIL" maxlength="25" size="26" <%= read %> value="<%= EBP0130Record.getE01BPBBIL().trim()%>">
					<img src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" align="bottom">
			</td>
			<td nowrap width="10%" align="right">Type : </td>
			<td nowrap width="20%" align="left"> <%= EBP0130Record.getE01BPBTYPD().trim()%> 
			  <% if (userPO.getHeader1().equals("C") )  { %>	
				<INPUT type="text" name="E01BPBCUN" maxlength="9" size="10" <%= read %> value="<%= EBP0130Record.getE01BPBCUN().trim()%>" onkeypress="enterDecimal()">
			    	<A href="javascript:GetCustomerDescId('E01BPBCUN','E01BPBRM1','')" > 
			    	<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0">
			    	</A> 
			  <%} %>  	
			</td>
		</tr>
		<tr id="trclear"> 
			<td nowrap width="10%" align="right">Bank :</td>
			<td nowrap width="40%" align="left">
				<input type="text" name="E01BPBBNK" size="3" maxlength="2" <%= read %> value="<%= EBP0130Record.getE01BPBBNK().trim()%>" >
					<img src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" align="bottom">
				Branch :       
				<input type="text" name="E01BPBBRN" size="4" maxlength="3" <%= read %> value="<%= EBP0130Record.getE01BPBBRN().trim()%>">
					<img src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" align="bottom">
				Currency :
				<input type="text" name="E01BPBCCY" size="4" maxlength="3" <%= read %> value="<%= EBP0130Record.getE01BPBCCY().trim()%>">
					<a href="javascript:GetCurrency('E01BPBCCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
					<img src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" align="bottom">
			</td>
			<td nowrap width="10%" align="right"><% if (userPO.getHeader1().equals("P") )  { %> Purchase Order: <% }%></td>
			<td nowrap width="40%" align="left" ><% if (userPO.getHeader1().equals("P") )  { %> 
				<input type="text" name="E01BPBORD" maxlength="9" size="10" <%= read %> value="<%= EBP0130Record.getE01BPBORD().trim()%>"> <% }%>
			</td>	
		</tr>
		<tr id="trdark"> 
			<td nowrap width="10%" align="right">Invoice Date: </td>
			<td nowrap width="40%" align="left">
				<input type="text" size="2" maxlength="2" name="E01BPBIVM" onKeypress="enterInteger()" value="<%= EBP0130Record.getE01BPBIVM().trim()%>" <%= read %>>
				<input type="text" size="2" maxlength="2" name="E01BPBIVD" onKeyPress="enterInteger()" value="<%= EBP0130Record.getE01BPBIVD().trim()%>" <%= read %>>
				<input type="text" size="2" maxlength="2" name="E01BPBIVY" onKeyPress="enterInteger()" value="<%= EBP0130Record.getE01BPBIVY().trim()%>" <%= read %>>
					<a href="javascript:DatePicker(document.forms[0].E01BPBIVM,document.forms[0].E01BPBIVD,document.forms[0].E01BPBIVY)">
					<img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></a>
					<img src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" align="bottom" border="0">
					<B><%=currUser.getE01DTF()%></B>
			</td>    
			<td nowrap width="10%" align="right"></td>
			<td nowrap width="40%" align="left"></td>
		</tr>
		<tr id="trclear" align="left"> 
			<td nowrap width="10%" align="right">Bill Description: </td>
			<td nowrap width="40%" align="left" >
				<input type="text" name="E01BPBDSC" size="30" maxlength="25" <%= read %> value="<%= EBP0130Record.getE01BPBDSC().trim()%>">
					<img src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" align="bottom"></td>
			<td nowrap width="10%" align="right"> Total Amount:</td>
			<td nowrap width="40%" align="left">
				<input type="text" name="E01BPBBAM" size="20" maxlength="19" <%= read %> value="<%= EBP0130Record.getE01BPBBAM().trim()%>" onkeypress="enterDecimal()">
					<img src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" align="bottom">
			</td>
		</tr>
		<tr id="trdark"> 
			<td nowrap width="10%" align="right">Remarks : </td>
			<td nowrap width="40%" align="left"> 
				<input type="text" name="E01BPBRM1" maxlength="50" size="60" <%= read %> value="<%= EBP0130Record.getE01BPBRM1().trim()%>">
                <BR>
				<input type="text" name="E01BPBRM2" maxlength="50" size="60" <%= read %> value="<%= EBP0130Record.getE01BPBRM2().trim()%>">
			</td>
			<td nowrap width="10%" align="left"> </td>
			<td nowrap width="40%" align="left"> </td>
		</tr>
	</table> 
      
	<h4><B>Payment Information</B></h4>  
	<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
		<tr> <th nowrap colspan="4" width="100%"> </th> </tr>
		<tr id="trdark"> 
			<td nowrap width="10%" align="right">Payment Due/Date : </td>
			<td nowrap width="40%" align="left"> 
				<input type="text" size="2" maxlength="2" name="E01BPBPDM" onKeypress="enterInteger()" value="<%= EBP0130Record.getE01BPBPDM().trim()%>" <%= read %>>
				<input type="text" size="2" maxlength="2" name="E01BPBPDD" onKeyPress="enterInteger()" value="<%= EBP0130Record.getE01BPBPDD().trim()%>" <%= read %>>
				<input type="text" size="2" maxlength="2" name="E01BPBPDY" onKeyPress="enterInteger()" value="<%= EBP0130Record.getE01BPBPDY().trim()%>" <%= read %>>
					<a href="javascript:DatePicker(document.forms[0].E01BPBPDM,document.forms[0].E01BPBPDD,document.forms[0].E01BPBPDY)">
					<img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></a>
					<img src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" align="bottom" border="0">
					<B><%=currUser.getE01DTF()%></B>
			</td>
			<td nowrap width="10%" align="right">Payment Via : </td>
			<td nowrap width="40%" align="left"> 
				<select name="E01BPBPVI" <%= read %>>
					<option <%= EBP0130Record.getE01BPBPVI().trim().equals("")?"selected":"" %> value="">                   </option>
					<option <%= EBP0130Record.getE01BPBPVI().trim().equals("A")?"selected":"" %> value="A">ACH              </option>
					<option <%= EBP0130Record.getE01BPBPVI().trim().equals("R")?"selected":"" %> value="R">Retail Account   </option>
					<option <%= EBP0130Record.getE01BPBPVI().trim().equals("G")?"selected":"" %> value="G">GL Account       </option>
					<option <%= EBP0130Record.getE01BPBPVI().trim().equals("C")?"selected":"" %> value="C">Official Check   </option>
					<option <%= EBP0130Record.getE01BPBPVI().trim().equals("S")?"selected":"" %> value="S">Swift            </option>
					<option <%= EBP0130Record.getE01BPBPVI().trim().equals("P")?"selected":"" %> value="P">Petty Cash       </option>
				</select>
			</td>
		</tr> 
		<tr id="trclear"> 
			<td nowrap width="10%" align="right">Payment Type : </td>
			<td nowrap width="40%" align="left"> 
				<select name="E01BPBPTY" <%= read %>>
					<option <%= EBP0130Record.getE01BPBPTY().trim().equals("F")?"selected":"" %> value="F">Fixed Amount      </option>
					<option <%= EBP0130Record.getE01BPBPTY().trim().equals("V")?"selected":"" %> value="V">Variable Amount   </option>
				</select>
					<img src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" align="bottom">
			</td>	
			<td nowrap width="10%" align="right">Frequency : </td>
			<td nowrap width="40%" align="left"> 
				<select name="E01BPBPFR" <%= read %>>
					<option <%= EBP0130Record.getE01BPBPFR().trim().equals("O")?"selected":"" %> value="O">One Time     </option>
					<option <%= EBP0130Record.getE01BPBPFR().trim().equals("W")?"selected":"" %> value="W">Weekly       </option>
					<option <%= EBP0130Record.getE01BPBPFR().trim().equals("B")?"selected":"" %> value="B">Bi-Weekly    </option>
					<option <%= EBP0130Record.getE01BPBPFR().trim().equals("M")?"selected":"" %> value="M">Monthly      </option>
					<option <%= EBP0130Record.getE01BPBPFR().trim().equals("Q")?"selected":"" %> value="Q">Quarterly    </option>
					<option <%= EBP0130Record.getE01BPBPFR().trim().equals("Y")?"selected":"" %> value="Y">Yearly       </option>
				</select>
					<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" border="0" ></td>
		</tr>	
		<tr id="trdark">
			<td nowrap width="10%" align="left"> <b>If Frequency is different than "One Time" : </b></td>
			<td nowrap width="40%" align="left"> </td>
			<td nowrap width="10%" align="left"> </td>
			<td nowrap width="40%" align="left"> </td>
		</tr>
			<tr id="trdark">
			<td nowrap width="10%" align="right"> Payment Day : </td> 
			<td nowrap width="40%" align="left"> 
				<input type="text" size="3" maxlength="2" name="E01BPBDAY" onKeypress="enterInteger()" value="<%= EBP0130Record.getE01BPBDAY().trim()%>" <%= read %>>
					<a href="javascript:GetCode('E01BPBDAY','STATIC_rt_ciclo.jsp')">
					<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Day Help" border="0" ></a>
			</td> 
			<td nowrap width="10%" align="right">Start Pay Date : </td>
			<td nowrap width="40%" align="left">
				<input type="text" size="2" maxlength="2" name="E01BPBIDM" onKeypress="enterInteger()" value="<%= EBP0130Record.getE01BPBIDM().trim()%>" <%= read %>>
				<input type="text" size="2" maxlength="2" name="E01BPBIDD" onKeyPress="enterInteger()" value="<%= EBP0130Record.getE01BPBIDD().trim()%>" <%= read %>>
				<input type="text" size="2" maxlength="2" name="E01BPBIDY" onKeyPress="enterInteger()" value="<%= EBP0130Record.getE01BPBIDY().trim()%>" <%= read %>>
					<a href="javascript:DatePicker(document.forms[0].E01BPBIDM,document.forms[0].E01BPBIDD,document.forms[0].E01BPBIDY)">
					<img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></a>
					<B><%=currUser.getE01DTF()%></B>
			</td>
		</tr>
		<tr id="trclear"> 
			<td nowrap width="10%" align="right">Payment Limits : </td> 
			<td nowrap width="40%" align="left"> 
				<select name="E01BPBPLI" <%= read %>>
					<option <%= EBP0130Record.getE01BPBPLI().trim().equals("T")?"selected":"" %> value="T">Total Bill</option>
					<option <%= EBP0130Record.getE01BPBPLI().trim().equals("F")?"selected":"" %> value="F">Fixed Amount</option>
					<option <%= EBP0130Record.getE01BPBPLI().trim().equals("P")?"selected":"" %> value="P">Percentage</option>
				</select>
			</td>
			<td nowrap width="10%" align="right"> % Tolerance : </td> 
			<td nowrap width="40%" align="left"> 
				<input type="text" name="E01BPBPER" maxlength="9" size="10" <%= read %> value="<%= EBP0130Record.getE01BPBPER().trim()%>" onkeypress="enterDecimal()">
			<b>(Only if Payment Limits is "Percentage")</b></td>
		</tr>	
		<tr id="trdark">
			<td nowrap width="10%" align="left"> <b>If Payment Type is "Variable" : </b></td>
			<td nowrap width="40%" align="left"> </td>
			<td nowrap width="10%" align="left"> </td>
			<td nowrap width="40%" align="left"> </td>
		</tr>
		<tr id="trdark">
			<td nowrap width="10%" align="right">Number of Payments : </td>
			<td nowrap width="40%" align="left">
				<input type="text" name="E01BPBNOP" maxlength="3" size="4" <%= read %> value="<%= EBP0130Record.getE01BPBNOP().trim()%>" onkeypress="enterInteger()">
			</td> 
			<td nowrap width="10%" align="right">Minimum Payment Amount : </td> 
			<td nowrap width="40%" align="left"> 
				<input type="text" name="E01BPBMAM" maxlength="15" size="20" <%= read %> value="<%= EBP0130Record.getE01BPBMAM().trim()%>" onkeypress="enterDecimal()">
			</td>
		</tr>
	</table>  
	</td></tr></table>
	<% if (userPO.getHeader1().equals("C") )  { %>
	<h5></h5>
	<table width="100%" > <tr bordercolor="#FFFFFF"> <td width="100%" nowrap> 
		<table class="tableinfo" cellspacing="0" width="100%" border="0">
		<tr id="trdark"> 
			<td nowrap width="10%" align="right">Fee Table: </td>
			<td nowrap width="40%" align="left">  
				<input type="text" name="E01BPBFCO" maxlength="2" size="3" <%= read %> value="<%= EBP0130Record.getE01BPBFCO().trim()%>" onkeypress="enterInteger()">        
					<a href="javascript:GetCNTRLPRF('E01BPBFCO','E01BPBFAM')">
					<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="middle" border="0"></a>
			</td>
			<td nowrap width="10%" align="right">Fee Amount : </td> 
			<td nowrap width="40%" align="left">
				<input type="text" name="E01BPBFAM" maxlength="17" size="20" <%= read %> value="<%= EBP0130Record.getE01BPBFAM().trim()%>" onKeyPress="enterDecimal()">
			</td>
		</tr>
		</table>
	</td></tr></table>
	<% } %>

	<h4><B>GL Information</B> </h4>
	<table width="100%" > <tr bordercolor="#FFFFFF"> <td width="100%" nowrap> 
		<table class="tableinfo" cellspacing="0" width="100%" border="0">
		<tr id="trdark"> 
			<td nowrap width="10%" align="right">Amortization : </td>
			<td nowrap width="40%" align="left"> 
				<input type="radio" name="E01BPBAMC" <%= read %> value="Y" <% if (EBP0130Record.getE01BPBAMC().equals("Y")) out.print("checked"); %>>
				Yes 
				<input type="radio" name="E01BPBAMC" <%= read %> value="N" <% if (EBP0130Record.getE01BPBAMC().equals("N")) out.print("checked"); %>>
				No          
				<img src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" align="bottom"></td>
			<td nowrap width="10%" align="right">Amortization Number of Months : </td> 
			<td nowrap width="40%" align="left">
				<input type="text" name="E01BPBAMS" maxlength="3" size="4" <%= read %> value="<%= EBP0130Record.getE01BPBAMS().trim()%>">
			</td>
		</tr>
		<tr id="trclear"> 
			<td nowrap width="10%" align="right">Start Amortization on  </td>
			<td nowrap width="40%"align="left"> Year: <input type="text" name="E01BPBAYY" maxlength="2" size="3" <%= read %> value="<%= EBP0130Record.getE01BPBAYY().trim()%>">
                  								Month: <input type="text" name="E01BPBAMM" maxlength="2" size="3" <%= read %> value="<%= EBP0130Record.getE01BPBAMM().trim()%>">
			</td>	
			<td nowrap width="10%" align="right"> </td>
			<td nowrap width="40%" align="left">
			</td>   
		</tr>
	</table>
	</td></tr></table>
	<h6></h6>
	<table width="100%" > <tr bordercolor="#FFFFFF"> <td width="100%" nowrap> 
		<table class="tableinfo" cellspacing="0" width="100%" border="0">
		<tr id="trdark">
			<td nowrap width="10%" align="center"> </td>          
			<td nowrap width="10%" align="center">Bank</td>
			<td nowrap width="10%" align="center">Branch</td>
			<td nowrap width="10%" align="center">Currency</td>
			<td nowrap width="10%" align="center">Gl Account</td>
			<td nowrap width="10%" align="center">Custom/Account</td>
			<td nowrap width="10%" align="center">Cost Center</td>
			<td nowrap width="10%" align="center">DB/CR</td>
			<td nowrap width="20%" align="center">Amount </td>
		</tr>
		<tr id="trclear" align="center"> 
			<td nowrap width="10%" align="right">Base</td>           
			<td nowrap width="10%" align="center">
				<input type="text" name="E01BPGBNK1" size="3" maxlength="2" <%= read %> value="<%= EBP0130Record.getE01BPGBNK1().trim()%>" >
			</td>
			<td nowrap width="10%" align="center" >
				<input type="text" name="E01BPGBRN1" maxlength="3" size="4" <%= read %> value="<%= EBP0130Record.getE01BPGBRN1().trim()%>" onkeypress="enterInteger()"
					oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E01BPGBNK1.value,'','','','')" value="<%= EBP0130Record.getE01BPGBRN1()%>">
			</td>	
			<td nowrap width="10%" align="center">
				<input type="text" name="E01BPGCCY1" maxlength="3" size="4" <%= read %> value="<%= EBP0130Record.getE01BPGCCY1().trim()%>"
					oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E01BPGBNK1.value,'','','','')">
			</td>
			<td nowrap width="10%" align="center"> 
				<input type="text" name="E01BPGGLN1" maxlength="13" size="12" <%= read %> value="<%= EBP0130Record.getE01BPGGLN1().trim()%>" onkeypress="enterInteger()"
					oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01BPGBNK1.value,document.forms[0].E01BPGCCY1.value,'','','')">
			</td>
			<td nowrap width="10%" align="center"> 
				<input type="text" name="E01BPGACC1" maxlength="10" size="9" <%= read %> value="<%= EBP0130Record.getE01BPGACC1().trim()%>" onkeypress="enterInteger()"
					oncontextmenu="showPopUp(accountHelp,this.name,document.forms[0].E01BPGBNK1.value,'document.forms[0].E01BPBCUN.value','','','RT')">
			</td>
			<td nowrap width="10%" align="center">  
				<input type="text" name="E01BPGCCN1" maxlength="7" size="6" <%= read %> value="<%= EBP0130Record.getE01BPGCCN1().trim()%>" onkeypress="enterInteger()"
					oncontextmenu="showPopUp(costcenterHelp,this.name,document.forms[0].E01BPGBNK1.value,'','','','')">
			</td>
			<td nowrap width="10%" align="center">
				<input type="text" name="E01BPGDC1" maxlength="3" size="2"  readonly value="<%= EBP0130Record.getE01BPGDC1().trim()%>">
			</td> 
			<td nowrap width="20%" align="center"> 
				<input type="text" name="E01BPGAMT1" maxlength="17" size="20" <%= read %> value="<%= EBP0130Record.getE01BPGAMT1().trim()%>" onkeypress="enterDecimal()">
			</td>
		</tr>
		<tr id="trdark" align="center"> 
			<td nowrap width="10%" align="right">Tax</td> 
			<td nowrap width="10%" align="center">
				<input type="text" name="E01BPGBNK2" size="3" maxlength="2" <%= read %> value="<%= EBP0130Record.getE01BPGBNK2().trim()%>" >
			</td>
			<td nowrap width="10%" align="center" >
				<input type="text" name="E01BPGBRN2" maxlength="3" size="4" <%= read %> value="<%= EBP0130Record.getE01BPGBRN2().trim()%>" onkeypress="enterInteger()"
					oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E01BPGBNK2.value,'','','','')" value="<%= EBP0130Record.getE01BPGBRN2()%>">	      
			</td>	
			<td nowrap width="10%" align="center">
				<input type="text" name="E01BPGCCY2" maxlength="3" size="4" <%= read %> value="<%= EBP0130Record.getE01BPGCCY2().trim()%>"
					oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E01BPGBNK2.value,'','','','')">
			</td>
			<td nowrap width="10%" align="center"> 
				<input type="text" name="E01BPGGLN2" maxlength="13" size="12" <%= read %> value="<%= EBP0130Record.getE01BPGGLN2().trim()%>" onkeypress="enterInteger()"
					oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01BPGBNK2.value,document.forms[0].E01BPGCCY2.value,'','','')">
			</td>
			<td nowrap width="10%" align="center"> 
				<input type="text" name="E01BPGACC2" maxlength="10" size="9" <%= read %> value="<%= EBP0130Record.getE01BPGACC2().trim()%>" onkeypress="enterInteger()"
					oncontextmenu="showPopUp(accountHelp,this.name,document.forms[0].E01BPGBNK2.value,'','','','RT')">
			</td>
			<td nowrap width="10%" align="center">  
				<input type="text" name="E01BPGCCN2" maxlength="7" size="6" <%= read %> value="<%= EBP0130Record.getE01BPGCCN2().trim()%>" onkeypress="enterInteger()"
					oncontextmenu="showPopUp(costcenterHelp,this.name,document.forms[0].E01BPGBNK2.value,'','','','')">
			</td> 
			<td nowrap width="10%" align="center">
				<input type="text" name="E01BPGDC2"  maxlength="3" size="2" readonly  value="<%= EBP0130Record.getE01BPGDC2().trim()%>">
			</td>
			<td nowrap width="20%" align="center"> 
				<input type="text" name="E01BPGAMT2" maxlength="17" size="20" <%= read %> value="<%= EBP0130Record.getE01BPGAMT2().trim()%>" onkeypress="enterDecimal()">
			</td>
		</tr>
		<tr id="trclear" align="center">
			<td nowrap width="10%" align="right">Other</td>  
			<td nowrap width="10%" align="center">
				<input type="text" name="E01BPGBNK3" maxlength="2" size="3" <%= read %> value="<%= EBP0130Record.getE01BPGBNK3().trim()%>" >
			</td>
			<td nowrap width="10%" align="center" >
				<input type="text" name="E01BPGBRN3" maxlength="3" size="4" <%= read %> value="<%= EBP0130Record.getE01BPGBRN3().trim()%>" onkeypress="enterInteger()"
					oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E01BPGBNK3.value,'','','','')" value="<%= EBP0130Record.getE01BPGBRN3()%>">
			</td>	
			<td nowrap width="10%" align="center">
				<input type="text" name="E01BPGCCY3" maxlength="3" size="4" <%= read %> value="<%= EBP0130Record.getE01BPGCCY3().trim()%>"
					oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E01BPGBNK3.value,'','','','')">
			</td>
			<td nowrap width="10%" align="center"> 
				<input type="text" name="E01BPGGLN3" maxlength="13" size="12" <%= read %> value="<%= EBP0130Record.getE01BPGGLN3().trim()%>" onkeypress="enterInteger()"
					oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01BPGBNK3.value,document.forms[0].E01BPGCCY3.value,'','','')" >
			</td>
			<td nowrap width="10%" align="center"> 
				<input type="text" name="E01BPGACC3" maxlength="10" size="9" <%= read %> value="<%= EBP0130Record.getE01BPGACC3().trim()%>" onkeypress="enterInteger()"
					oncontextmenu="showPopUp(accountHelp,this.name,document.forms[0].E01BPGBNK3.value,'','','','RT')">
			</td>
			<td nowrap width="10%" align="center">  
				<input type="text" name="E01BPGCCN3" maxlength="7" size="6" <%= read %> value="<%= EBP0130Record.getE01BPGCCN3().trim()%>" onkeypress="enterInteger()"
					oncontextmenu="showPopUp(costcenterHelp,this.name,document.forms[0].E01BPGBNK3.value,'','','','')">
			</td> 
			<td nowrap width="10%" align="center">
				<SELECT name="E01BPGDC3" <%= read %>>
					<OPTION <%= EBP0130Record.getE01BPGDC3().trim().equals("DB")?"selected":"" %> value="DB">DB</OPTION>
					<OPTION <%= EBP0130Record.getE01BPGDC3().trim().equals("CR")?"selected":"" %> value="CR">CR</OPTION>
				</SELECT>
			</td>
			<td nowrap width="20%" align="center">
				<input type="text" name="E01BPGAMT3" maxlength="17" size="20" <%= read %> value="<%= EBP0130Record.getE01BPGAMT3().trim()%>" onkeypress="enterDecimal()">               
			</td>
		</tr>
	</table>
	</td></tr></table>
	<% if (userPO.getHeader3().equals("A")) { 
		if (!EBP0130Record.getE01BPBPMD().equals("0")) {%>
	<h4><B>Suspend Information</B></h4> 
	<table width="100%" > <tr bordercolor="#FFFFFF"> <td width="100%" nowrap> 
		<table class="tableinfo" cellspacing="0" width="100%" border="0">
		<tr id="trdark"> 
			<td nowrap width="10%" align="right">Suspend on Date : </td>
			<td nowrap width="40%" align="left">
				<input type="text" size="2" maxlength="2" name="E01BPBSDM" onKeypress="enterInteger()" value="<%= EBP0130Record.getE01BPBSDM().trim()%> " >
				<input type="text" size="2" maxlength="2" name="E01BPBSDD" onKeyPress="enterInteger()" value="<%= EBP0130Record.getE01BPBSDD().trim()%>" >
				<input type="text" size="2" maxlength="2" name="E01BPBSDY" onKeyPress="enterInteger()" value="<%= EBP0130Record.getE01BPBSDY().trim()%>" >
					<a href="javascript:DatePicker(document.forms[0].E01BPBSDM,document.forms[0].E01BPBSDD,document.forms[0].E01BPBSDY)">
					<img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></a>
			</td>
			<td nowrap width="10%" align="right">Suspend Reason : </td> 
			<td nowrap width="40%" align="left">
				<input type="text" name="E01BPBSDS" size="55" maxlength="50" value="<%= EBP0130Record.getE01BPBSDS().trim()%>" >
			</td>
		</tr>
	</table>
	</td></tr></table>
	<% }
    } %>
    <h5></h5>
	<table width="100%" > <tr bordercolor="#FFFFFF"> <td width="100%" nowrap> 
		<table class="tableinfo" cellspacing="0" width="100%" border="0">
		<tr id="trdark"> 
			<td nowrap width="10%" align="right">Status : </td>
			<td nowrap width="40%" align="left"><%= EBP0130Record.getE01BPBSTD().trim()%></td>
			<td nowrap width="10%" align="right"> </td> 
			<td nowrap width="40%">Approval/Reject Date : <%= datapro.eibs.master.Util.formatDate(EBP0130Record.getE01BPBADM(),EBP0130Record.getE01BPBADD(),EBP0130Record.getE01BPBADY())%></td>
		</tr>
	</table>
	</td></tr></table>
	<% if (userPO.getPurpose().equals("VOID") || userPO.getPurpose().equals("INQUIRY")) {%>
	<h5></h5>
	<table width="100%" > <tr bordercolor="#FFFFFF"> <td width="100%" nowrap> 
		<table width="100%">
			<tr>
				<td width="100%" align="center"> 
					<input id="EIBSBTN" type=submit name="Exit" value="Exit" onClick="goAction(2);" >
				</td>
			</tr>	
		</table>
	</td></tr></table>	
	<% } else {%>
	<% if (!userPO.getPurpose().equals("INQUIRY")) {%>
	<h5></h5>
	<table width="100%" > <tr bordercolor="#FFFFFF"> <td width="100%" nowrap> 
	  <table width="100%">
		<tr> <th nowrap colspan="3" width="100%"> </th> </tr>		
		<tr>
			<td width="33%">
				<div align="center"> 
					<input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="goAction(6);" >
				</div>	
			</td>
			<td width="33%"> 
				<div align="center"> 
					<input id="EIBSBTN" type=button name="Delete" value="Delete" onClick="goAction(4);" <%= disabled %>>
				</div>	
			</td>
			<td width="34%">
				<div align="center"> 
					<input id="EIBSBTN" type=submit name="Exit" value="Exit"
							onClick="goAction(2);" >
				</div>	
			</td>
		</tr>	
	</table>
	</td></tr></table>	
	<% } }%>

<SCRIPT language="JavaScript">

    <% if (currUser.getE01DTF().equals("MDY")) { %>
			document.getElementById("E01BPBIVM").value = '<%=currUser.getE01RDM()%>';
    		document.getElementById("E01BPBIVD").value = '<%=currUser.getE01RDD()%>';
    		document.getElementById("E01BPBIVY").value = '<%=currUser.getE01RDY()%>';
    		document.getElementById("E01BPBIDM").value = '<%=currUser.getE01RDM()%>';
    		document.getElementById("E01BPBIDD").value = '<%=currUser.getE01RDD()%>';
    		document.getElementById("E01BPBIDY").value = '<%=currUser.getE01RDY()%>';
			document.getElementById("E01BPBPDM").value = '<%=currUser.getE01RDM()%>';
    		document.getElementById("E01BPBPDD").value = '<%=currUser.getE01RDD()%>';
    		document.getElementById("E01BPBPDY").value = '<%=currUser.getE01RDY()%>';

    		
    <% } else if (currUser.getE01DTF().equals("DMY")) { %>    
    		document.getElementById("E01BPBIVM").value = '<%=currUser.getE01RDD()%>';
    		document.getElementById("E01BPBIVD").value = '<%=currUser.getE01RDM()%>';
    	   	document.getElementById("E01BPBIVY").value = '<%=currUser.getE01RDY()%>';
    		document.getElementById("E01BPBIDM").value = '<%=currUser.getE01RDD()%>';
    		document.getElementById("E01BPBIDD").value = '<%=currUser.getE01RDM()%>';
    	   	document.getElementById("E01BPBIDY").value = '<%=currUser.getE01RDY()%>';
    		document.getElementById("E01BPBPDM").value = '<%=currUser.getE01RDD()%>';
    		document.getElementById("E01BPBPDD").value = '<%=currUser.getE01RDM()%>';
    	   	document.getElementById("E01BPBPDY").value = '<%=currUser.getE01RDY()%>';
    			
    <% } else { %>
    		document.getElementById("E01BPBIVD").value = '<%=currUser.getE01RDY()%>';
    		document.getElementById("E01BPBIVM").value = '<%=currUser.getE01RDM()%>';
    	   	document.getElementById("E01BPBIVY").value = '<%=currUser.getE01RDD()%>'; 
    		document.getElementById("E01BPBIDD").value = '<%=currUser.getE01RDY()%>';
    		document.getElementById("E01BPBIDM").value = '<%=currUser.getE01RDM()%>';
    	   	document.getElementById("E01BPBIDY").value = '<%=currUser.getE01RDD()%>'; 
    		document.getElementById("E01BPBPDD").value = '<%=currUser.getE01RDY()%>';
    		document.getElementById("E01BPBPDM").value = '<%=currUser.getE01RDM()%>';
    	   	document.getElementById("E01BPBPDY").value = '<%=currUser.getE01RDD()%>'; 
    	   	
    <% } %>	
</SCRIPT>
</td>	</tr>	</table>
</form>
</body>
</html>
