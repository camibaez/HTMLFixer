<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Credit Cards Opening</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id="ccNew" class="datapro.eibs.beans.ECC001001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<SCRIPT LANGUAGE="javascript">
 
<%
	if (!userPO.getPurpose().equals("NEW")){%>
		builtNewMenu(cc_m_opt);
<%	} %>

   	builtHPopUp();

  	function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   		init(opth,field,bank,ccy,field1,field2,opcod);
   		showPopupHelp();
   	}
   	
	function updateName() {
		document.getElementById("CARD_NAME").value = document.getElementById("FULLNAME").value;
		document.getElementById("USER_LINE").value = document.getElementById("CUSTOMER").value;
		document.getElementById("COUNTRY").value = document.getElementById("ISSUE_COUNTRY").value;
	}
   	
   
</SCRIPT>
<% 
 if ( !error.getERRNUM().equals("0") ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
  
 if (!userPO.getPurpose().equals("NEW")) {
   out.println("<SCRIPT> initMenu();  </SCRIPT>");}

%> 

</head>
<body>
<h3 align="center"><% if (userPO.getPurpose().equals("NEW")) out.print("Credit Card Opening");
   else if (userPO.getPurpose().equals("MAINTENANCE")) out.print("Credit Card Maintenance");
   else out.print("");%><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="cc_opening.jsp, ECC0010"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC0010" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="<% if (userPO.getPurpose().equals("NEW")) out.print("2"); else out.print("4");%>">
  <INPUT TYPE=HIDDEN NAME="E01CCMBNK" VALUE="<%= ccNew.getE01CCMBNK().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01CCMATY" VALUE="<%= ccNew.getE01CCMATY().trim()%>">
  
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Customer Number :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" id="CUSTOMER" name="E01CCMCUN" size="9" maxlength="9" value="<%= ccNew.getE01CCMCUN().trim()%>" <%if (!userPO.getPurpose().equals("NEW")) {%> readonly <%}%> onchange="updateName()">
                <%if (userPO.getPurpose().equals("NEW")) {%> 
    				<A href="javascript:GetCustomerDetails('E01CCMCUN', 'E01CUSNA1', '', '', 'E01CCMICC', '', '', '', '', '', 'E01CCMICD', '', '', '', '', '', '', '')">
    				<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="middle" border="0"></A>
				<% } %>	
				<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory" align="bottom" border="0" >
			   </div>		
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" id="FULLNAME" name="E01CUSNA1" size="45" maxlength="45" value="<%= ccNew.getE01CUSNA1().trim()%>" <%if (!userPO.getPurpose().equals("NEW")) {%> readonly <%}%> onchange="updateName()">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account : </b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" readonly name="E01CCMACC" size="20" maxlength="9" value="<% if (ccNew.getE01CCMACC().trim().equals("999999999")) out.print("NEW ACCOUNT"); else out.print(ccNew.getE01CCMACC().trim()); %>">
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency :</b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01CCMCCY" size="3" maxlength="3" value="<%= ccNew.getE01CCMCCY().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01CCMPRO" size="4" maxlength="4" value="<%= ccNew.getE01CCMPRO().trim()%>" readonly>
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4> Basic Information</h4> 
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Primary Card Number :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" name="E01CCMNXN" size="21" maxlength="20" value="<%= ccNew.getE01CCMNXN().trim()%>" readonly> 
 			</td>
    			<td nowrap width="20%" ><div align="right">Card Type :</div></td>
    			<td nowrap width="30%" >
						<input type="text" name="E01CCMTPL" size="5" maxlength="4" value="<%= ccNew.getE01CCMTPL().trim()%>" readonly >
    			</td>
          </tr>    
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Card Number :</div>
            </td>
            <td nowrap width="27%"> 
 				<input type="text" name="E01CCMPCN" size="21" maxlength="20" value="<%= ccNew.getE01CCMPCN().trim()%>" readonly>            
 			</td>
    			<td nowrap width="20%"><div align="right">Customer / Portfolio :</div></td>
    			<td nowrap width="30%" >
      				<div align="left">
        				<input type="text" name="E01CCMRCN" size="9" maxlength="9" value="<%= ccNew.getE01CCMRCN().trim()%>" readonly >
	  				</div>
					<input type="hidden" id="COUNTRY"  name="E01CCMGEC" size="4" maxlength="3" value="">
    			</td>
          </tr>    
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Opening Date :</div>
            </td>
            <td nowrap width="23%"> 
              <input type="text" name="E01CCMOPM" size="3" maxlength="2" value="<%= ccNew.getE01CCMOPM().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01CCMOPD" size="3" maxlength="2" value="<%= ccNew.getE01CCMOPD().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01CCMOPY" size="5" maxlength="4" value="<%= ccNew.getE01CCMOPY().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:DOBPicker(document.forms[0].E01CCMOPM,document.forms[0].E01CCMOPD,document.forms[0].E01CCMOPY)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt=". . ." align="bottom" border="0" ></a> 
            </td>
            <td nowrap width="25%"> 
              <div align="right">Expiration Date :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" name="E01CCMEXM" size="3" maxlength="2" value="<%= ccNew.getE01CCMEXM().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01CCMEXD" size="3" maxlength="2" value="<%= ccNew.getE01CCMEXD().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01CCMEXY" size="5" maxlength="4" value="<%= ccNew.getE01CCMEXY().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:DOBPicker(document.forms[0].E01CCMEXM,document.forms[0].E01CCMEXD,document.forms[0].E01CCMEXY)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt=". . ." align="bottom" border="0" ></a> 
            </td>
          </tr>        
			<tr id="trclear">
    			<td nowrap width="20%"><div align="right">Issue Country :</div></td>
    			<td nowrap width="30%">
      				<input type="text" id="ISSUE_COUNTRY" name="E01CCMICC" size="4" maxlength="3" value="<%= ccNew.getE01CCMICC().trim()%>" >
					<input type="text" name="E01CCMICD" size="30" maxlength="30" value="<%= ccNew.getE01CCMICD().trim()%>" >
					<a href="javascript:GetCodeDescCNOFC('E01CCMICC','E01CCMICD','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a>
					<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory" align="bottom" border="0" >
    			</td>
			<td nowrap width="20%"><div align="right">Status :</div></td>
			<td nowrap width="30%">
  				<select name="E01CCMAST">
    				<option value=" " <% if (!(ccNew.getE01CCMAST().equals("0") || ccNew.getE01CCMAST().equals("1")
    										|| ccNew.getE01CCMAST().equals("2") || ccNew.getE01CCMAST().equals("3")
    										|| ccNew.getE01CCMAST().equals("4") || ccNew.getE01CCMAST().equals("5")
    										|| ccNew.getE01CCMAST().equals("6") || ccNew.getE01CCMAST().equals("7")
    										|| ccNew.getE01CCMAST().equals("8") || ccNew.getE01CCMAST().equals("9"))) out.print("selected"); %>></option>
	                <option value="0" <% if (ccNew.getE01CCMAST().equals("0")) out.print("selected"); %>>REQUESTED BY CLIENT</option>
	                <option value="A" <% if (ccNew.getE01CCMAST().equals("A")) out.print("selected"); %>>REQUESTED TO PROVIDER</option>
	                <option value="B" <% if (ccNew.getE01CCMAST().equals("B")) out.print("selected"); %>>PREACTIVATED</option>
	                <option value="C" <% if (ccNew.getE01CCMAST().equals("C")) out.print("selected"); %>>EMBOSSED</option>
	                <option value="D" <% if (ccNew.getE01CCMAST().equals("D")) out.print("selected"); %>>SENT TO PROVIDER</option>
	                <option value="E" <% if (ccNew.getE01CCMAST().equals("E")) out.print("selected"); %>>RECEIVED AT BANK</option>
	                <option value="F" <% if (ccNew.getE01CCMAST().equals("F")) out.print("selected"); %>>SENT TO REGIONAL OFFICE</option>
	                <option value="G" <% if (ccNew.getE01CCMAST().equals("G")) out.print("selected"); %>>SENT TO CLIENT</option>
					<option value="1" <% if (ccNew.getE01CCMAST().equals("1")) out.print("selected"); %>>ACTIVE</option>
	                <option value="2" <% if (ccNew.getE01CCMAST().equals("2")) out.print("selected"); %>>LOST</option>
	                <option value="3" <% if (ccNew.getE01CCMAST().equals("3")) out.print("selected"); %>>BLOCKED PREVENTIVE</option>
	                <option value="H" <% if (ccNew.getE01CCMAST().equals("H")) out.print("selected"); %>>BLOCKED BY CLIENT</option>
	                <option value="I" <% if (ccNew.getE01CCMAST().equals("I")) out.print("selected"); %>>BLOCKED BY BANK</option>
	                <option value="4" <% if (ccNew.getE01CCMAST().equals("4")) out.print("selected"); %>>STOLEN</option>
	                <option value="5" <% if (ccNew.getE01CCMAST().equals("5")) out.print("selected"); %>>EXPIRED</option>
	                <option value="6" <% if (ccNew.getE01CCMAST().equals("6")) out.print("selected"); %>>DESTROYED</option>                
	                <option value="7" <% if (ccNew.getE01CCMAST().equals("7")) out.print("selected"); %>>NULIFIED</option>
	                <option value="8" <% if (ccNew.getE01CCMAST().equals("8")) out.print("selected"); %>>DENIED</option>
  				</select>
			</td>
  			</tr>
    
          <tr id="trdark"> 
   			<td nowrap width="25%"><div align="right">Customer First Name :</div></td>
			<td nowrap width="27%" >
   				<input type="text" id="FIRST_NAME" name="E01CCMFNA" size="22" maxlength="20" value="<%= ccNew.getE01CCMFNA().trim()%>">
			</td>
   			<td nowrap width="25%"><div align="right">Customer Last Name :</div></td>
    		<td nowrap width="27%" >
				<input type="text" id="LAST_NAME" name="E01CCMLN1" size="22" maxlength="20" value="<%= ccNew.getE01CCMLN1().trim()%>">
    		</td>
          </tr>           
          <tr id="trclear"> 
			<td nowrap width="20%"><div align="right">Customer Embossing Name:</div></td>
			<td nowrap width="30%">
  				<input type="text" id="CARD_NAME" name="E01CCMCNN" size="30" maxlength="26" value="<%= ccNew.getE01CCMCNN().trim()%>">
				<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory" align="bottom" border="0" >
			</td>
			<td nowrap width="20%"><div align="right">Second Line Embossing :</div></td>
			<td nowrap width="30%">
  				<input type="text" name="E01CCMCNM" size="30" maxlength="26" value="<%= ccNew.getE01CCMCNM().trim()%>">
			</td>
          </tr>  
   			<tr id="trdark">
            <td nowrap width="25%"> 
              <div align="right">Card Limit :</div>
            </td>
            <td nowrap width="27%"> 
                <input type="text" name="E01CCMLNL" size="17" maxlength="16" value="<%= ccNew.getE01CCMLNL().trim()%>" onKeypress="enterDecimal()"> 
				<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory" align="bottom" border="0" >
 			</td>
	            <td nowrap width="25%" > 
	              <div align="right">Line of Credit :</div>
	            </td>
	            <td nowrap width="23%" > 
				  <input type="text" id="USER_LINE" name="E01CCMCMC" size="9" maxlength="9" value="<%= ccNew.getE01CCMCMC().trim()%>"  onkeypress="enterInteger()">
	              <input type="text" name="E01CCMCTN" size="4" maxlength="4" value="<%= ccNew.getE01CCMCTN().trim()%>"  onkeypress="enterInteger()">
	              <a href="javascript:GetCreditLine('E01CCMCTN',document.forms[0].E01CCMCMC.value)">
	              <img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a> 
	              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  > 
				</td>
  			</tr>
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Billing Cycle :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" name="E01CCMCFA" size="3" maxlength="2" value="<%= ccNew.getE01CCMCFA().trim()%>">
            </td>
            <td nowrap width="25%"> 
              <div align="right">Minimum Payment Amount :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" name="E01CCMMPA" size="17" maxlength="16" value="<%= ccNew.getE01CCMMPA().trim()%>" onKeypress="enterDecimal()"> 
 			</td>
          </tr>           
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Advances Amount :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" name="E01CCMLAD" size="17" maxlength="16" value="<%= ccNew.getE01CCMLAD().trim()%>" onKeypress="enterDecimal()"> 
            </td>
            <td nowrap width="25%"> 
              <div align="right">Amount of Pmts. :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" name="E01CCMLQT" size="17" maxlength="16" value="<%= ccNew.getE01CCMLQT().trim()%>" onKeypress="enterDecimal()"> 
 			</td>
          </tr>    
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Repayment Account :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" name="E01CCMRPA" size="11" maxlength="10" value="<%= ccNew.getE01CCMRPA().trim()%>" onKeypress="enterInteger()"> 
   				<A href="javascript:GetAccByClient('E01CCMRPA','','RT','', document.forms[0].E01CCMCUN.value)">
   				<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="middle" border="0"></A>
            </td>
            <td nowrap width="25%">
            	<div align="right">Cost Center :</div>
            </td>
            <td nowrap width="27%">
              <input type="text" name="E01CCMCCN" size="8" maxlength="6" value="<%= ccNew.getE01CCMCCN().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:GetCostCenter('E01CCMCCN',document.forms[0].E01CCMBNK.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a>             
            </td>
          </tr>           
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Table Fees :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" name="E01CCMTBL" size="2" maxlength="2" value="<%= ccNew.getE01CCMTBL().trim()%>">
				<a href="javascript:GetTableFeeCod('E01CCMTBL',document.forms[0].E01CCMATY.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="bottom" border="0" ></a>                         
            </td>
            <td nowrap width="25%"> 
            </td>
            <td nowrap width="23%"> 
            </td>
          </tr>           
        </table>
      </td>
    </tr>
  </table>
  <br>
  <div align="center"> 
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>

<SCRIPT Language="Javascript">

	function updateCountry(country) {
		document.getElementById("COUNTRY").value = country;
	}

	function updatePortfolio(port) {
		document.getElementById("USER_LINE").value = port;
	}

</SCRIPT>


</form>
</body>
</html>
