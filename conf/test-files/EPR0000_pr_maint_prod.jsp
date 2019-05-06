<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Financial Transaction</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import = "datapro.eibs.master.Util" %>

<jsp:useBean id="prMant" class="datapro.eibs.beans.EPR010001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<%!
boolean isOptionFSeq(String value, String selected) {
	return (value.startsWith("/"+selected) || value.startsWith(selected+"/"));
}
boolean isNotOptionFSeq(String value) {
	return  !( isOptionFSeq(value, "1") || isOptionFSeq(value, "2") || isOptionFSeq(value, "3") || isOptionFSeq(value, "4") 
			|| isOptionFSeq(value, "5") || isOptionFSeq(value, "6") || isOptionFSeq(value, "7") || isOptionFSeq(value, "8") );
}
boolean isOptionFAccount(String value) {
	return  !( value.startsWith("ARNU") || value.startsWith("CCPT") || value.startsWith("CUST") || value.startsWith("DRLC")
			|| value.startsWith("EMPL") || value.startsWith("NIDN") || value.startsWith("SOSE") || value.startsWith("TXID") );
}
%>
<script language="Javascript" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT> 
 <script src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"></script>
<script language="Javascript" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>
<script language="Javascript" src="<%=request.getContextPath()%>/pages/e/javascripts/jquery.jsp"></script>
<script language="Javascript" src="<%=request.getContextPath()%>/pages/e/javascripts/wireTransfers.js"> </SCRIPT>

<SCRIPT Language="Javascript">
	
	builtHPopUp();

  	function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   		init(opth,field,bank,ccy,field1,field2,opcod);
   		showPopupHelp();
  	}

	function GetHelp() {
 		var code = document.forms[0].E01PRIPVI.value;
 		if( code == "1") {
  			GetFedIdDesc('E01PRIRID','E01PRIRSH');
 		} else {
  			GetSwiftIdDesc('E01PRIRID','E01PRIRSH');
 		}
	}

	function GetHelp1() {
		var code = document.forms[0].E01PRIPVI.value;
 		if( code == "1") {
   			GetFedIdDesc('E01PRISID','E01PRISSH');
 		} else {
  			GetSwiftIdDesc('E01PRISID','E01PRISSH');
 		}
	}

  	function goSubmit() {
  		document.forms[0]["Submit"].disabled = true;
		document.forms[0].submit();
  	}
  
  	function showTab(index, name) {

  		for (var i=0; i<9; i++) {
   			document.all["Tab"+i].className = "tabnormalv";
   			document.all["dataTab"+i].style.display = "none";
   		}
  		if (index < 4) {
    		document.all["Tab"+index].className = "tabhighlightl";
			colTab.className = "tabdataleft";
  		} else {
			document.all["Tab"+index].className = "tabhighlightr";
			colTab.className="tabdataright";
  		}
  		document.all["dataTab"+index].style.display = "";
  		document.all[name].focus();
  	}

  	function UpdateCodes(fname, code4, code5, code6){
   		if (fname == "E01PRIDPD") {
      		document.forms[0].E01DEBSOU.value = code4;
      		document.forms[0].E01DEBDIB.value = code5;
	  		document.forms[0].E01PRIHDY.value = code6;
   		} else {
      		document.forms[0].E01CRESOU.value = code4;
      		document.forms[0].E01CREDIB.value = code5;
	  		document.forms[0].E01CREDAY.value = code6;
   		}

  	}

	function ChangePayment(){
		document.forms[0].SCREEN.value = 8;
		document.forms[0].submit();
	}

function SetTransferType(value){
  	  var pVia = getElement('paymentVia').value;
  	  if (value=="IT") {
  	  	if(pVia == '' || !(pVia == 'R' || pVia == 'G' || pVia == '6')){
  	  		getElement("paymentVia").value = 'R';
  	  	}
  	  } else {
  	    if(pVia == '' || (pVia == 'R' || pVia == 'G' || pVia == '6')){
  	  		getElement('paymentVia').value = '3';
  	  	}
  	  }
	  SetVia(value, getElement("paymentVia").value);
}

function setOrderingAccount(){
  	var option = getElement('E01PRIORO').value;
	if(getElement('E01PRITTP').value != 'IW'){
  		getElement('E01PRIDAC').value = getElement('accountOriginator').value;
	}
	setAccountField(getElement('E11PRIORC'), '50', option);
}

function setBeneficiaryAccount(){
  	var option = document.getElementById('E01PRIBCO').value;
	if(getElement('E01PRITTP').value != 'OW'){
  		getElement('E01PRICAC').value = getElement('accountBeneficiary').value;
	}
	setAccountField(getElement('E11PRIBCU'), '59', option);
}

function setCustomer(){
  	var type = getElement('E01PRITTP').value;
  	if(type == 'IW'){
  		getElement('E21PRIBCU').value = getElement('customerName').value;
  	}  else {
  		getElement('E21PRIORC').value = getElement('customerName').value;
  	} 
}

</SCRIPT>

<%
	int row = 0;
	boolean isNew = userPO.getPurpose().equals("NEW");
	boolean isEditable=true;

	String READ_ONLY_TAG = "";
	String DISABLED_TAG = "";
	// Determina campos de solo lectura incoming Swift and FED
	if (prMant.getE01PRITTP().equals("IW")) {
		if (prMant.getE01PRIUSC().equals("SAI") 
			|| prMant.getE01PRIUSC().equals("FAI")){
    		READ_ONLY_TAG = "readonly";
    		DISABLED_TAG = "disabled";
    		isEditable = false;
		}
	} else if (prMant.getE01PRITTP().equals("OW")){
		if(prMant.getE01PRISOR().equals("I")) {
	 		READ_ONLY_TAG = "readonly";
     		DISABLED_TAG = "disabled";
    		isEditable = false;
     	}
	}
%>

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

<h3 align="center">Financial Transaction<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="pr_maint.jsp, EPR0000"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPR0000" >
    <input type=HIDDEN name="E01PRIORO" id="origOption" value="<%= prMant.getE01PRIORO().trim() %>">
    <input type=HIDDEN name="E01PRIBCO" id="beneOption" value="<%= prMant.getE01PRIBCO().trim() %>">
    
<% if (isNew) { %> 
	  <input type=HIDDEN name="SCREEN" value="2">
<% } else { %>
	<input type=HIDDEN name="SCREEN" value="4">
   	<SCRIPT Language="Javascript">
    	builtNewMenu(pr_m_opt);
		initMenu();
  	</SCRIPT>
<% } %>

<table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap > 
                  <div align="right">Type :</div>
            </td>
              <td nowrap align="left">
                <%
                	if (!(prMant.getE01PRITTP().equals("IT")) && !(prMant.getE01PRITTP().equals("IW")) && !(prMant.getE01PRITTP().equals("OW"))) {
                		prMant.setE01PRITTP("OW");
                	}
                %>  
                  <select id="tranferType" name="E01PRITTP" <% if (!isNew) out.print("disabled"); %> onchange="SetTransferType(this.value)">
                    <option value="IT" <% if(prMant.getE01PRITTP().equals("IT")){ out.print("selected");} %> >Internal Transfer</option>
                    <option value="IW" <% if(prMant.getE01PRITTP().equals("IW")){ out.print("selected");} %> >External Incoming </option>
                    <option value="OW" <% if(prMant.getE01PRITTP().equals("OW")){ out.print("selected");} %> >External Outgoing </option>
                  </select>
				<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0">
              </td>
              <td nowrap> 
                <div align="right">Payment Via :</div>
              </td>
              <td nowrap > 
                    <select id="paymentVia" name="E01PRIPVI" onchange="SetVia(getElement('tranferType').value, this.value)">
                      <option value="" <% if (!(prMant.getE01PRIPVI().equals("1") || prMant.getE01PRIPVI().equals("2") || prMant.getE01PRIPVI().equals("3") ||
										prMant.getE01PRIPVI().equals("R") || prMant.getE01PRIPVI().equals("D") || prMant.getE01PRIPVI().equals("G") || prMant.getE01PRIPVI().equals("C")
										|| prMant.getE01PRIPVI().equals("4")|| prMant.getE01PRIPVI().equals("5")|| prMant.getE01PRIPVI().equals("6") || prMant.getE01PRIPVI().equals("7")))
									 out.print("selected"); %>></option>
                      <option value="R" <% if (prMant.getE01PRIPVI().equals("R")) out.print("selected"); %>>Retail Account</option>
                      <option value="G" <% if (prMant.getE01PRIPVI().equals("G")) out.print("selected"); %>>G/L Account</option>
                      <option value="1" <% if (prMant.getE01PRIPVI().equals("1")) out.print("selected"); %>>FED</option>
                      <option value="3" <% if (prMant.getE01PRIPVI().equals("3")) out.print("selected"); %>>Swift MT-103</option>
                      <option value="4" <% if (prMant.getE01PRIPVI().equals("4")) out.print("selected"); %>>Swift MT-200</option>
                      <option value="5" <% if (prMant.getE01PRIPVI().equals("5")) out.print("selected"); %>>Swift MT-202</option>
                      <option value="7" <% if (prMant.getE01PRIPVI().equals("7")) out.print("selected"); %>>Swift MT-202 COV</option>
                      <option value="6" <% if (prMant.getE01PRIPVI().equals("6")) out.print("selected"); %>>Official Check</option>
                    </select>
					<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0">
              </td>
 		<%
  			if (isNew) {
  		%>
            <td nowrap width="18%" align="right"> 
	              <input type="checkbox" name="H01FLGWK3" <% if(prMant.getH01FLGWK3().equals("1"))  out.print("checked");%>
				  onClick="document.forms[0].H01FLGWK3.value='1'">
             Take information from : 
            </td>
            <td>
	              <input type="text" name="E01CPYNUM" size="10" maxlength="9" onKeyPress="enterInteger()"
				  value="<%= prMant.getE01CPYNUM().trim()%>">
	              <a href="javascript:GetCloneTransfer('E01CPYNUM')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
		<%
            	} else {
		%>      
            <td nowrap colspan="3"> 
            </td>
		<%
            	}
		%>
          </tr>
          <tr id="externalType" class="trdark">
            	<td nowrap align="right">Reference No.:
                </td>
                <td nowrap align="left">
                  <input type="text" id="E01PRINUM" name="E01PRINUM" size="15" maxlength="12" value="<%=prMant.getE01PRINUM().trim()%>" readonly>
                </td>
             <td nowrap align="right">
					<% if (prMant.getE01PRITTP().equals("IW")){ %>
             	              New Payment Via :
             	    <% } %>
             </td>
              <td nowrap align="left">
              		<% if (prMant.getE01PRITTP().equals("IW")){ %>
                  <div align="left">
                    <select name="E01PRIWPC" >
                      <option value=" " ></option>
                      <option value="R" >Retail Account</option>
                      <option value="G" >G/L Account</option>
                      <option value="1" selected >FED</option>
                      <option value="3" >Swift MT-103</option>
                      <option value="4" >Swift MT-200</option>
                      <option value="5" >Swift MT-202</option>
                      <option value="7" >Swift MT-202 COV</option>
                      <option value="6" >Official Check</option>
                    </select>
                    <a href="javascript:ChangePayment()">Forward</a>
                  </div>
					<% } %>
                </td>                
            	<td nowrap align="right">Channel :
                </td>
                <td nowrap align="left">
                <input type="text" name="E01PRIDSQ" size="6" maxlength="4" value="<%= prMant.getE01PRIDSQ().trim()%>" >
                  <a href="javascript:GetCodeTChannel('E01PRIDSQ','','')">
                  <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"  border="0" ></a>       
                </td>
		  </tr>
        </table>
      </td>
    </tr>
   </table>
<br>
<div id="DivHead">
    <table class="tableinfo">
    <tr > 
      <td nowrap height="132"> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
      	<tr id="trdark"> 
            <td nowrap colspan="2" align="center"> 
                <b>Ordering Customer</b>
					<SELECT id="SWF_50" name="SWF_50" class="swf_field_50" <%= DISABLED_TAG %> onchange="setHelp(this)">
						<OPTION value="K" <% if (!(prMant.getE01PRIORO().equals("A") || prMant.getE01PRIORO().equals("F"))) out.print("selected"); %>>K</OPTION>
						<OPTION value="A" <% if(prMant.getE01PRIORO().equals("A")) out.print("selected");%>>A</OPTION>
						<OPTION value="F" <% if(prMant.getE01PRIORO().equals("F")) out.print("selected");%>>F</OPTION>
					</SELECT> 
				<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0">
            </td>
            <td nowrap> 
                <div align="center"><b>Customer Number</b></div>
            </td>
            <td nowrap colspan="2" align="center">  
                <b>Beneficiary </b>
             		<select id="SWF_59" name="SWF_59" class="swf_field_59" <%=DISABLED_TAG%> onchange="setHelp(this)">
                    	<option value="" <% if (!(prMant.getE01PRIBCO().equals("A") ||prMant.getE01PRIBCO().equals("B") ||prMant.getE01PRIBCO().equals("D") ||prMant.getE01PRIBCO().equals("F"))) out.print("selected"); %>></option>
                        <option value="A" <% if(prMant.getE01PRIBCO().equals("A")) out.print("selected");%>>A</option>
					</select>
            </td>
		</tr>
		<tr id="trclear">
			<% 
			int cpos1 = prMant.getE11PRIORC().indexOf('/');
			int cpos2 = 0;
			if(cpos1 != -1){
				cpos2 = prMant.getE11PRIORC().indexOf('/', cpos1+1) + 1;
			} 
			%>
			<td nowrap width="15%" align="right"> 
				<span id="LBL_50A_1" class="swf_field_50" style="display:<%=prMant.getE01PRIORO().equals("A") ? "inline" : "none"%>">Identifier :</span>
				<span id="LBL_50K_1" class="swf_field_50" style="display:<%=!prMant.getE01PRIORO().equals("A") && !prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>">Account :</span>
				<span id="LBL_50F_1" class="swf_field_50" style="display:<%=prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>">
	          		<select name="SWF_50F_1_1" id="SWF_50F_1_1" class="swf_field_50" <%=DISABLED_TAG%> dir="rtl" onchange="setOrderingAccount()"
	             			style="border: 0; text-align: right; text-transform: none; min-width: 30px; width: 130px; background-color: blank">
	                	<option value="" <% if(isOptionFAccount(prMant.getE11PRIORC())) out.print("selected"); %>>Account</option>
						<option value="ARNU" <% if(isOptionFSeq(prMant.getE11PRIORC(), "ARNU")) out.print("selected");%>>Alien Number</option>
						<option value="CCPT" <% if(isOptionFSeq(prMant.getE11PRIORC(), "CCPT")) out.print("selected");%>>Passport</option>
						<option value="CUST" <% if(isOptionFSeq(prMant.getE11PRIORC(), "CUST")) out.print("selected");%>>Customer Id</option>
						<option value="DRLC" <% if(isOptionFSeq(prMant.getE11PRIORC(), "DRLC")) out.print("selected");%>>Driver License</option>
						<option value="EMPL" <% if(isOptionFSeq(prMant.getE11PRIORC(), "EMPL")) out.print("selected");%>>Employer Number</option>
						<option value="NIDN" <% if(isOptionFSeq(prMant.getE11PRIORC(), "NIDN")) out.print("selected");%>>National Id</option>
						<option value="SOSE" <% if(isOptionFSeq(prMant.getE11PRIORC(), "SOSE")) out.print("selected");%>>Social Security</option>
						<option value="TXID" <% if(isOptionFSeq(prMant.getE11PRIORC(), "TXID")) out.print("selected");%>>Tax Id</option>
					</select> :
				</span>
			</td>
			<td nowrap width="40%">
                <input type="hidden" id="E11PRIORC" name="E11PRIORC" value="<%= prMant.getE11PRIORC() %>">
				<span id="SWB_50F" class="swf_field_50" align="left" style="display:<%=isOptionFAccount(prMant.getE11PRIORC()) ? "none" : "inline"%>">
                <input <%=READ_ONLY_TAG%> type="text" id="SWF_50F_1_2" name="SWF_50F_1_2" size="6" maxlength="5" 
                	value="<%= cpos1 > -1 && cpos2 > cpos1 ? prMant.getE11PRIORC().substring(cpos1+1, cpos2-1) :  "" %>"  
					onchange="setOrderingAccount();">
 				<span id="SWH_50F_1_2" class="swf_field_50" align="left" style="display:<%=isOptionFAccount(prMant.getE11PRIORC()) ? "none" : "inline"%>">
              	<a href="javascript:GetCodeCNOFC('SWF_50F_1_2','03')">
              	<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="top" border="0"></a>
              	</span>
              	</span>
                <input <%=READ_ONLY_TAG%> type="text" id="SWF_50_1" name="accountOriginator" class="swf_field_50" 
                	size="<%=prMant.getE01PRIORO().equals("F") ? "30" : "45"%>" 
                	maxlength="<%=prMant.getE01PRIORO().equals("F") ? "27" : "35"%>" 
                	value="<%= prMant.getE11PRIORC().substring(cpos2) %>" 
					onchange="setOrderingAccount();">
                <span align="left" id="SWH_50_1" class="swf_field_50">
				<a href="javascript:GetAccount('accountOriginator','','RT','')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title="Account Help" align="bottom" border="0" ></a>
                </span>
				<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0">
			</td>
            <td nowrap width="5%"> 
              <div align="center">
              	<input type="hidden" id="customerName" name="customerName" onchange="setCustomer()">
                <input type="text" id="E01PRIOCU" name="E01PRIOCU" size="12" maxlength="10" value="<%= prMant.getE01PRIOCU().trim()%>" <%=READ_ONLY_TAG%>>
				<%if (isEditable) {%>
				<a href="javascript:GetCustomerDescId('E01PRIOCU','customerName','')">
				<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
				<%}%>
              </div>
            </td>
			<td nowrap width="10%"> 
                <div align="right">Account :</div>
			</td>
			<td nowrap width="35%"> 
				<input type="hidden" id="E11PRIBCU" name="E11PRIBCU" value="<%= prMant.getE11PRIBCU() %>">				
                <input <%=READ_ONLY_TAG%> type="text" id="SWF_59_1" name="accountBeneficiary" class="swf_field_59" size="45" maxlength="35" 
                	value="<%= prMant.getE11PRIBCU() %>" onchange="setBeneficiaryAccount();"
                	style="display:<%=!prMant.getE01PRIBCO().equals("F") ? "inline" : "none"%>">
                <span id="SWH_59_1_1" class="swf_field_59" style="display: <%=prMant.getE01PRITTP().equals("OW") ? "none" : "inline"%>">
				<a href="javascript:GetAccount('accountBeneficiary','','RT','','E01PRIOCU','E21PRIBCU')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title="Account Help" align="bottom" border="0" ></a>
                </span>
				<img id="beneAccountCheck" src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0">
			</td>
            </tr>  
      	<tr id="trclear"> 
            <td nowrap> 
                <div align="right">
                	<span id="LBL_50K_2" class="swf_field_50" style="display:<%=!prMant.getE01PRIORO().equals("A") && !prMant.getE01PRIORO().equals("D") && !prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>">Name :</span>
					<span id="LBL_50A_2" class="swf_field_50" style="display:<%=prMant.getE01PRIORO().equals("A") ? "inline" : "none"%>">BIC/BEI :</span>
                	<span id="LBL_50D_2" class="swf_field_50" style="display:<%=prMant.getE01PRIORO().equals("D") ? "inline" : "none"%>">Name :</span>
					<span id="LBL_50F_2" class="swf_field_50" style="display:<%=prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>">
               		<select name="SWF_50F_2_1" id="SWF_50F_2_1" class="swf_field_50" <%=DISABLED_TAG%> dir="rtl" onchange="setField(getElement('E21PRIORC'), 'SWF_50', 'F', 2)"
             			style="border: 0; text-align: right; text-transform: none; min-width: 30px; width: 130px; background-color: blank; display:<%=prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>">
                    	<option value="1" <% if(isNotOptionFSeq(prMant.getE21PRIORC())) out.print("selected"); %>>Name</option>
						<option value="2" <% if(isOptionFSeq(prMant.getE21PRIORC(), "2")) out.print("selected");%>>Address</option>
						<option value="3" <% if(isOptionFSeq(prMant.getE21PRIORC(), "3")) out.print("selected");%>>Country and Town</option>
						<option value="4" <% if(isOptionFSeq(prMant.getE21PRIORC(), "4")) out.print("selected");%>>Date of Birth</option>
						<option value="5" <% if(isOptionFSeq(prMant.getE21PRIORC(), "5")) out.print("selected");%>>Place of Birth</option>
						<option value="6" <% if(isOptionFSeq(prMant.getE21PRIORC(), "6")) out.print("selected");%>>Customer Id</option>
						<option value="7" <% if(isOptionFSeq(prMant.getE21PRIORC(), "7")) out.print("selected");%>>National Id</option>
						<option value="8" <% if(isOptionFSeq(prMant.getE21PRIORC(), "8")) out.print("selected");%>>Additional Info</option>
					</select> :
					</span>
                </div>
            </td>
            <td nowrap colspan="2"> 
              <div align="left">
              	<input type="hidden" <%=READ_ONLY_TAG%> name="E21PRIORC" size="45" maxlength="35" value="<%= prMant.getE21PRIORC().trim()%>">

                <span id="SWH_50A_2_1" class="swf_field_50" align="left" style="display: <%=prMant.getE01PRIORO().equals("A") ? "inline" : "none"%>">
				<input type="text" <%=READ_ONLY_TAG%> id="SWF_50A_2_1" name="SWF_50A_2_1" class="swf_field_50" onchange="setField(getElement('E21PRIORC'), 'SWF_50', 'A', 2)" 
					size="45" maxlength="35" value="<%= prMant.getE21PRIORC() %>">
				<a href="javascript:GetSwiftIdDesc('SWF_50A_2_1','')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title="SWIFT Help" align="bottom" border="0" ></a>
                </span>

				<input type="text" <%=READ_ONLY_TAG%> id="SWF_50K_2_1" name="E21PRIORC_1" class="swf_field_50" onchange="setField(getElement('E21PRIORC'), 'SWF_50', 'K', 2)" 
					size="45" maxlength="35" value="<%= prMant.getE21PRIORC() %>">                
                <span id="SWH_50K_2_1" class="swf_field_50" align="left" style="display: <%=!prMant.getE01PRIORO().equals("A") ? "inline" : "none"%>">
				<a href="javascript:GetSwiftIdDesc('','SWF_50K_2_1','E31PRIORC','E41PRIORC','E51PRIORC')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title="SWIFT Help" align="bottom" border="0" ></a>
                </span>
                
				<input type="text" <%=READ_ONLY_TAG%> id="SWF_50F_2_2" name="SWF_50F_2_2" class="swf_field_50" onchange="setField(getElement('E21PRIORC'), 'SWF_50', 'F', 2)" 
					size="45" maxlength="35" value="<%= isNotOptionFSeq(prMant.getE21PRIORC()) ? prMant.getE21PRIORC() : prMant.getE21PRIORC().substring(prMant.getE21PRIORC().indexOf("/")) %>">
              </div>
            </td>
            <td nowrap align="right">
                	<span id="LBL_59_2" class="swf_field_59" style="display:<%=!prMant.getE01PRIBCO().equals("A") && !prMant.getE01PRIBCO().equals("F") ? "inline" : "none"%>">Name :</span>
                	<span id="LBL_59A_2" class="swf_field_59" style="display:<%=prMant.getE01PRIBCO().equals("A") ? "inline" : "none"%>">BIC/BEI :</span>
					<span id="LBL_59F_2" class="swf_field_59" style="display:<%=prMant.getE01PRIBCO().equals("F") ? "inline" : "none"%>"></span>
            </td>
            <td nowrap> 
              <div align="left"> 
              	<input type="text" id="E21PRIBCU" name="E21PRIBCU" size="45" maxlength="35" value="<%=prMant.getE21PRIBCU().trim()%>" <%=READ_ONLY_TAG%>>
				<% if (isEditable) {  %>
                <span id="SWH_59_2_1" class="swf_field_59" style="display: <%=prMant.getE01PRIBCO().trim().equals("") ? "inline" : "none"%>">
				<a href="javascript:GetSwiftIdDesc('','E21PRIBCU','E31PRIBCU','E41PRIBCU','E51PRIBCU')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda de SWIFT" align="bottom" border="0" ></a>
                </span>
                <span id="SWH_59A_2_1" class="swf_field_59" style="display: <%=prMant.getE01PRIBCO().equals("A") ? "inline" : "none"%>">
				<a href="javascript:GetSwiftIdDesc('E21PRIBCU','','','','')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda de SWIFT" align="bottom" border="0" ></a>
                </span>
				<% } %>
				<img id="beneNameCheck" src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory" align="bottom" border="0">
              </div>
            </td>
		</tr>
          <tr id="trclear">
      		<td nowrap valign="top" align="right"> 
      		<div> 
				<span id="LBL_50K_3" class="swf_field_50" style="display:<%=!prMant.getE01PRIORO().equals("A") && !prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>">Address :</span>
				<span id="LBL_50F_3" class="swf_field_50" style="display:<%=prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>">
               		<select name="SWF_50F_3_1" id="SWF_50F_3_1" class="swf_field_50" <%=DISABLED_TAG%> dir="rtl" onchange="setField(getElement('E31PRIORC'), 'SWF_50', 'F', 3)"
             			style="border: 0; text-align: right; text-transform: none; min-width: 30px; width: 130px; background-color: blank">
						<option value="1" <% if(isOptionFSeq(prMant.getE31PRIORC(), "1")) out.print("selected");%>>Name</option>
                    	<option value="2" <% if(isNotOptionFSeq(prMant.getE31PRIORC())) out.print("selected"); %>>Address</option>
						<option value="3" <% if(isOptionFSeq(prMant.getE31PRIORC(), "3")) out.print("selected");%>>Country and Town</option>
						<option value="4" <% if(isOptionFSeq(prMant.getE31PRIORC(), "4")) out.print("selected");%>>Date of Birth</option>
						<option value="5" <% if(isOptionFSeq(prMant.getE31PRIORC(), "5")) out.print("selected");%>>Place of Birth</option>
						<option value="6" <% if(isOptionFSeq(prMant.getE31PRIORC(), "6")) out.print("selected");%>>Customer Id</option>
						<option value="7" <% if(isOptionFSeq(prMant.getE31PRIORC(), "7")) out.print("selected");%>>National Id</option>
						<option value="8" <% if(isOptionFSeq(prMant.getE31PRIORC(), "8")) out.print("selected");%>>Additional Info</option>
					</select> :
					</span>
			</div>
      		<div> 
				<span id="LBL_50F_4" class="swf_field_50" style="display:<%=prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>">
               		<select name="SWF_50F_4_1" id="SWF_50F_4_1" class="swf_field_50" <%=DISABLED_TAG%> dir="rtl" onchange="setField(getElement('E41PRIORC'), 'SWF_50', 'F', 4)"
             			style="border: none; text-align: right; text-transform: none; min-width: 30px; width: 130px; background-color: blank">
						<option value="1" <% if(isOptionFSeq(prMant.getE41PRIORC(), "1")) out.print("selected");%>>Name</option>
                    	<option value="2" <% if(isNotOptionFSeq(prMant.getE41PRIORC())) out.print("selected"); %>>Address</option>
						<option value="3" <% if(isOptionFSeq(prMant.getE41PRIORC(), "3")) out.print("selected");%>>Country and Town</option>
						<option value="4" <% if(isOptionFSeq(prMant.getE41PRIORC(), "4")) out.print("selected");%>>Date of Birth</option>
						<option value="5" <% if(isOptionFSeq(prMant.getE41PRIORC(), "5")) out.print("selected");%>>Place of Birth</option>
						<option value="6" <% if(isOptionFSeq(prMant.getE41PRIORC(), "6")) out.print("selected");%>>Customer Id</option>
						<option value="7" <% if(isOptionFSeq(prMant.getE41PRIORC(), "7")) out.print("selected");%>>National Id</option>
						<option value="8" <% if(isOptionFSeq(prMant.getE41PRIORC(), "8")) out.print("selected");%>>Additional Info</option>
					</select> :
				</span>
			</div>
      		<div> 
				<span id="LBL_50F_5" class="swf_field_50" style="display:<%=prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>">
               		<select name="SWF_50F_5_1" id="SWF_50F_5_1" class="swf_field_50" <%=DISABLED_TAG%> dir="rtl"
             			style="border: 0; text-align: right; text-transform: none; min-width: 30px; width: 130px; background-color: blank">
						<option value="1" <% if(isOptionFSeq(prMant.getE51PRIORC(), "1")) out.print("selected");%>>Name</option>
                    	<option value="2" <% if(isNotOptionFSeq(prMant.getE51PRIORC())) out.print("selected"); %>>Address</option>
						<option value="3" <% if(isOptionFSeq(prMant.getE51PRIORC(), "3")) out.print("selected");%>>Country and Town</option>
						<option value="4" <% if(isOptionFSeq(prMant.getE51PRIORC(), "4")) out.print("selected");%>>Date of Birth</option>
						<option value="5" <% if(isOptionFSeq(prMant.getE51PRIORC(), "5")) out.print("selected");%>>Place of Birth</option>
						<option value="6" <% if(isOptionFSeq(prMant.getE51PRIORC(), "6")) out.print("selected");%>>Customer Id</option>
						<option value="7" <% if(isOptionFSeq(prMant.getE51PRIORC(), "7")) out.print("selected");%>>National Id</option>
						<option value="8" <% if(isOptionFSeq(prMant.getE51PRIORC(), "8")) out.print("selected");%>>Additional Info</option>
					</select> :
					</span>
			</div>
			</td> 
            <td nowrap colspan="2"> 
              <div align="left"> 
              	<input type="hidden" <%=READ_ONLY_TAG%> name="E31PRIORC" size="45" maxlength="35" value="<%= prMant.getE31PRIORC().trim()%>">
				<input type="text" <%=READ_ONLY_TAG%> id="SWF_50K_3_2" name="E31PRIORC_3" class="swf_field_50" onchange="setField(getElement('E31PRIORC'), 'SWF_50', 'K', 3)" 
					size="45" maxlength="35" value="<%= prMant.getE31PRIORC() %>">
				<input type="text" <%=READ_ONLY_TAG%> id="SWF_50F_3_2" name="SWF_50F_3_2" class="swf_field_50" onchange="setField(getElement('E31PRIORC'), 'SWF_50', 'F', 3)" 
					size="45" maxlength="35" value="<%= prMant.getE31PRIORC().indexOf('/', 1) != -1 ? prMant.getE31PRIORC().substring(2) : prMant.getE31PRIORC() %>">
              </div>
              <div align="left"> 
              	<input type="hidden" <%=READ_ONLY_TAG%> name="E41PRIORC" size="45" maxlength="35" value="<%= prMant.getE41PRIORC().trim()%>">
				<input type="text" <%=READ_ONLY_TAG%> id="SWF_50K_4_2" name="E41PRIORC_4" class="swf_field_50" onchange="setField(getElement('E41PRIORC'), 'SWF_50', 'K', 4)" 
					size="45" maxlength="35" value="<%= prMant.getE41PRIORC() %>">
				<input type="text" <%=READ_ONLY_TAG%> id="SWF_50F_4_2" name="SWF_50F_4_2" class="swf_field_50" onchange="setField(getElement('E41PRIORC'), 'SWF_50', 'F', 4)" 
					size="45" maxlength="35" value="<%= prMant.getE41PRIORC().indexOf('/', 1) != -1 ? prMant.getE41PRIORC().substring(2) : prMant.getE41PRIORC() %>">
              </div>
              <div align="left"> 
              	<input type="hidden" <%=READ_ONLY_TAG%> name="E51PRIORC" size="45" maxlength="35" value="<%= prMant.getE51PRIORC().trim()%>">
				<input type="text" <%=READ_ONLY_TAG%> id="SWF_50K_5_2" name="E51PRIORC_5" class="swf_field_50" onchange="setField(getElement('E51PRIORC'), 'SWF_50', 'K', 5)" 
					size="45" maxlength="35" value="<%= prMant.getE51PRIORC() %>">
				<input type="text" <%=READ_ONLY_TAG%> id="SWF_50F_5_2" name="SWF_50F_5_2" class="swf_field_50" onchange="setField(getElement('E51PRIORC'), 'SWF_50', 'F', 5)" 
					size="45" maxlength="35" value="<%= prMant.getE51PRIORC().indexOf('/', 1) != -1 ? prMant.getE51PRIORC().substring(2) : prMant.getE51PRIORC() %>">
              </div>
            </td>
      		<td nowrap valign="top" align="right">
				<span id="LBL_59_3" class="swf_field_59" style="display:<%=!prMant.getE01PRIBCO().equals("A") && !prMant.getE01PRIBCO().equals("F") ? "inline" : "none"%>">Address :</span>
				<span id="LBL_59A_3" class="swf_field_59" style="display:<%=prMant.getE01PRIBCO().equals("A") ? "inline" : "none"%>"></span>
				<span id="LBL_59F_3" class="swf_field_59" style="display:<%=prMant.getE01PRIBCO().equals("F") ? "inline" : "none"%>"></span>
			</td> 
            <td nowrap > 
              <div align="left"> 
                <input <%=READ_ONLY_TAG%> type="text" id="E31PRIBCU" name="E31PRIBCU" size="45" maxlength="35" value="<%=prMant.getE31PRIBCU().trim()%>"><br>
              </div>
              <div align="left"> 
                <input <%=READ_ONLY_TAG%> type="text" id="E41PRIBCU" name="E41PRIBCU" size="45" maxlength="35" value="<%=prMant.getE41PRIBCU().trim()%>"><br>
              </div>
              <div align="left"> 
                <input <%=READ_ONLY_TAG%> type="text" id="E51PRIBCU" name="E51PRIBCU" size="45" maxlength="35" value="<%=prMant.getE51PRIBCU().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear">
      		<td nowrap align="right"> 
                  Country :
			</td> 
            <td nowrap colspan="2"> 
              <div align="left"> 
              	<input type="text" name="E01PRIDPT" size="6" maxlength="4" value="<%= prMant.getE01PRIDPT().trim()%>" >
              	<a href="javascript:GetCodeCNOFC('E01PRIDPT','03')">
              	<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="top" border="0"></a>
				<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0">
              </div>
            </td>
      		<td nowrap align="right"> 
                  Country :
			</td> 
            <td nowrap > 
              <div align="left"> 
              	<input type="text" name="E01COUNT1" size="6" maxlength="4" value="<%= prMant.getE01COUNT1().trim()%>" >
              	<a href="javascript:GetCodeCNOFC('E01COUNT1','03')">
              	<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="top" border="0"></a>
				<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0">
              </div>
            </td>
          </tr>
         </table>
      </td>
    </tr>
    
  </table>
 </div>

<BR>
 <div id="divAccounting">
<table class="tableinfo">

    <tr >
      <td nowrap>
          <table cellspacing=0 cellpadding=2 width="100%" border="0">
            <tr id="trdark">
              <td nowrap >
                <div align="right">Transfer Currency / Amount :</div>
              </td>
              <td nowrap >
                <input type="text" name="E01PRITCY" size="4" maxlength="3" value="<%= prMant.getE01PRITCY().trim()%>" <%=READ_ONLY_TAG%>>
				<%if (!READ_ONLY_TAG.equals("readonly")) {%>
                <a href="javascript:GetCurrency('E01PRITCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
				<%}%>
                <input type="text" name="E01PRIAMT" size="15" maxlength="13" value="<%= prMant.getE01PRIAMT().trim()%>" <%=READ_ONLY_TAG%>
				onKeyPress="enterDecimal()">
				<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0">
              </td>
	            <td nowrap >
	              <div align="right"></div>
	            </td>
	            <td nowrap colspan="3" >
	            </td>
              <td nowrap >
                <div align="right">Exch. Rate :</div>
              </td>
              <td nowrap >
                <input type="text" name="E01PRICXR" size="13" maxlength="13" value="<%= prMant.getE01PRICXR().trim()%>">
              </td>
              <td nowrap >
                <div align="right">Value Date :</div>
              </td>
              <td nowrap >
                <div align="left">
                  <input type="text" name="E01PRIVDM" size="2" maxlength="2" value="<%= prMant.getE01PRIVDM().trim()%>" >
                  <input type="text" name="E01PRIVDD" size="2" maxlength="2" value="<%= prMant.getE01PRIVDD().trim()%>" >
                  <input type="text" name="E01PRIVDY" size="2" maxlength="2" value="<%= prMant.getE01PRIVDY().trim()%>" >
                  <a href="javascript:DatePicker(document.forms[0].E01PRIVDM,document.forms[0].E01PRIVDD,document.forms[0].E01PRIVDY)">
                  <img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></a>
                </div>
              </td>
            </tr>
          </table>
      </td>
    </tr>

</table>
  <h4>Debit Information</h4>

    <TABLE class="tableinfo">
      <tr id="trdark">
        <td nowrap align="center" >Concept</td>
        <td nowrap align="center" >Bank</td>
        <td nowrap align="center" >Branch</td>
        <td nowrap align="center" >Currency</td>
        <td nowrap align="center" >General Ledger</td>
        <td nowrap align="center" >Account</td>
        <td nowrap align="center" >Pay/Thru Number</td>
        <td nowrap align="center" >Cost Center</td>
        <td nowrap align="center" >Amount</td>
      </tr>
      <tr id="trclear">
        <td nowrap >
          <div align="left">
            <input type="text" name="E01PRIDRS" size="2" maxlength="2"  value="<%= prMant.getE01PRIDRS().trim()%>" onkeypress="enterInteger()" <%if (prMant.getE01PRITTP().equals("OW") && prMant.getE01PRISOR().equals("I")) out.print("readonly");%>>
            <input type="text" name="E01PRIDPD" size="18" maxlength="15"  value="<%= prMant.getE01PRIDPD().trim()%>" readonly
			 oncontextmenu="showPopUp(conceptTransacHelp,this.name,document.forms[0].E01PRIDBK.value,'','E01PRIDGL','E01PRIDRS','93')">
            <input type="hidden" name="E01DEBSOU"  value="<%= prMant.getE01DEBSOU().trim()%>">
            <input type="hidden" name="E01DEBDIB"  value="<%= prMant.getE01DEBDIB().trim()%>">
            <!--<input type="hidden" name="E01PRIHDY"  value="<%= prMant.getE01PRIHDY().trim()%>">-->
          </div>
        </td>
        <td nowrap >
          <div align="left">
            <input type="text" name="E01PRIDBK" size="2" maxlength="2" value="<%= prMant.getE01PRIDBK().trim()%>" <%if (prMant.getE01PRITTP().equals("OW") && prMant.getE01PRISOR().equals("I")) out.print("readonly");%>>
          </div>
        </td>
        <td nowrap >
          <div align="left">
            <input type="text" name="E01PRIDBR" size="4" maxlength="3"  value="<%= prMant.getE01PRIDBR().trim()%>"
           oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E01PRIDBK.value,'','','','')" onkeypress="enterInteger()" <%if (prMant.getE01PRITTP().equals("OW") && prMant.getE01PRISOR().equals("I")) out.print("readonly");%>>
          </div>
        </td>
        <td nowrap >
          <div align="left">
            <input type="text" name="E01PRIDCY" size="3" maxlength="3" value="<%= prMant.getE01PRIDCY().trim()%>" <%if (prMant.getE01PRITTP().equals("OW") && prMant.getE01PRISOR().equals("I")) out.print("readonly");%>
			oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E01PRIDBK.value,'','','','')">
          </div>
        </td>
        <td nowrap >
          <div align="left">
            <input type="text" name="E01PRIDGL" size="13" maxlength="12" value="<%= prMant.getE01PRIDGL().trim()%>" onkeypress="enterInteger()" <%if (prMant.getE01PRITTP().equals("OW") && prMant.getE01PRISOR().equals("I")) out.print("readonly");%>
			oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01PRIDBK.value,document.forms[0].E01PRIDCY.value,'','','')">
          </div>
        </td>
        <td nowrap  >
          <div align="left">
            <input type="text" id="E01PRIDAC" name="E01PRIDAC" size="13" maxlength="12" value="<%= prMant.getE01PRIDAC().trim()%>" <%if (prMant.getE01PRITTP().equals("OW") && prMant.getE01PRISOR().equals("I")) out.print("readonly");%>
			oncontextmenu="showPopUp(accountCustomerHelp,this.name,document.forms[0].E01PRIDBK.value,'','E01DRANME','','RT')"  onKeyPress="enterInteger()">
          </div>
        </td>
		<td nowrap  >
          <div align="left">
            <input type="text" name="E01PRIDSA" size="6" maxlength="5" value="<%= prMant.getE01PRIDSA().trim()%>" <%if (prMant.getE01PRITTP().equals("OW") && prMant.getE01PRISOR().equals("I")) out.print("readonly");%>
			oncontextmenu="showPopUp(subaccountCustomerHelp,this.name,'','',document.forms[0].document.forms[0].E01PRIDAC.value,'E01DRANME','')"  onKeyPress="enterInteger()">
          </div>
        </td>
        <td nowrap >
          <div align="left">
            <input type="text" id="E01PRIDCC" name="E01PRIDCC" size="7" maxlength="6"  value="<%= prMant.getE01PRIDCC().trim()%>"  <%if (prMant.getE01PRITTP().equals("OW") && prMant.getE01PRISOR().equals("I")) out.print("readonly");%>
			oncontextmenu="showPopUp(costcenterHelp,this.name,document.forms[0].E01PRIDBK.value,'','','','')">
          </div>
        </td>
        <td nowrap >
          <div align="left">
            <input type="text" name="E01PRIDAM" size="15" maxlength="13" value="<%= prMant.getE01PRIDAM().trim()%>" readonly>
          </div>
        </td>
      </tr>
      <tr id="trdark">
        <td nowrap colspan="2">
           <div align="right">W/T Security Code :</div>
        </td>
        <td nowrap>
			<input type="text" name="E01PRIWRN" size="4" maxlength="3" value="<%= prMant.getE01PRIWRN().trim()%>">
        </td>
        <td nowrap colspan="2">
           <div align="right">Customer :</div>
        </td>
        <td nowrap  colspan="4">
			<input type="text" name="E01DRANME" size="45" maxlength="45" value="<%= prMant.getE01DRANME().trim()%>" >
        </td>
      </tr>
    </table>
  <h4>Credit Information</h4>
    <table class="tableinfo" >
      <tr id="trdark">
        <td nowrap align="center" >Concept</td>
        <td nowrap align="center" >Bank </td>
        <td nowrap align="center" >Branch</td>
        <td nowrap align="center" >Currency</td>
        <td nowrap align="center" >General Ledger</td>
        <td nowrap align="center" >Account</td>
        <td nowrap align="center" >Pay/Thru Number</td>
        <td nowrap align="center" >Cost Center</td>
        <td nowrap align="center" >Amount</td>
      </tr>
      <tr id="trclear">
        <td nowrap >
          <div align="left">
            <input type="text" name="E01PRICRS" size="2" maxlength="2"  value="<%= prMant.getE01PRICRS().trim()%>" onKeyPress="enterInteger()">
            <input type="text" name="E01PRICPD" size="18" maxlength="15"  value="<%= prMant.getE01PRICPD().trim()%>" readonly
			 oncontextmenu="showPopUp(conceptTransacHelp,this.name,document.forms[0].E01PRICBK.value,'','E01PRICGL','E01PRICRS','93')">
            <input type="hidden" name="E01CRESOU"  value="<%= prMant.getE01CRESOU().trim()%>">
            <input type="hidden" name="E01CREDIB"  value="<%= prMant.getE01CREDIB().trim()%>">
            <input type="hidden" name="E01CREDAY">
          </div>
        </td>
        <td nowrap >
          <div align="left">
            <input type="text" name="E01PRICBK" size="2" maxlength="2" value="<%= prMant.getE01PRICBK().trim()%>" >
          </div>
        </td>
        <td nowrap >
          <div align="left">
            <input type="text" name="E01PRICBR" size="4" maxlength="3"  value="<%= prMant.getE01PRICBR().trim()%>"
			oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E01PRICBK.value,'','','','')" onkeypress="enterInteger()">
          </div>
        </td>
        <td nowrap >
          <div align="left">
            <input type="text" name="E01PRICCY" size="3" maxlength="3" value="<%= prMant.getE01PRICCY().trim()%>"
			oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E01PRICBK.value,'','','','')">
          </div>
        </td>
        <td nowrap >
          <div align="left">
            <input type="text" name="E01PRICGL" size="13" maxlength="12" value="<%= prMant.getE01PRICGL().trim()%>" onkeypress="enterInteger()"
			oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01PRICBK.value,document.forms[0].E01PRICCY.value,'','','')">
          </div>
        </td>
        <td nowrap  >
          <div align="left">
            <input type="text" name="E01PRICAC" size="13" maxlength="12" value="<%= prMant.getE01PRICAC().trim()%>"
		  oncontextmenu="showPopUp(accountCustomerHelp,this.name,document.forms[0].E01PRICBK.value,'','E01CRANME','','RT')"  onkeypress="enterInteger()">
          </div>
        </td>
		<td nowrap  >
          <div align="left">
            <input type="text" name="E01PRICSA" size="6" maxlength="5" value="<%= prMant.getE01PRICSA().trim()%>"
		  oncontextmenu="showPopUp(subaccountHelp,this.name,'','',document.forms[0].E01PRICAC.value,'E01CRANME','')"  onkeypress="enterInteger()">
          </div>
        </td>
        <td nowrap >
          <div align="left">
            <input type="text" name="E01PRICCC" size="7" maxlength="6"  value="<%= prMant.getE01PRICCC().trim()%>"
			oncontextmenu="showPopUp(costcenterHelp,this.name,document.forms[0].E01PRICBK.value,'','','','')">
          </div>
        </td>
        <td nowrap >
          <div align="left">
            <input type="text" name="E01PRICAM" size="15" maxlength="13" value="<%= prMant.getE01PRICAM().trim()%>" readonly>
          </div>
        </td>
      </tr>
      <tr id="trdark">
        <td nowrap colspan="5">
           <div align="right">Customer :</div>
        </td>
        <td nowrap  colspan="3">
			<input type="text" name="E01CRANME" size="45" maxlength="45" value="<%= prMant.getE01CRANME().trim()%>" >
        </td>
		<td nowrap >
                <div align="right"></div>
                <div align="right">Days Hold :
                  <input type="text" name="E01PRIHDY" size="3" maxlength="3" value="<%= prMant.getE01PRIHDY().trim()%>" onKeyPress="enterInteger()">
                </div>
        </td>
      </tr>
    </table>
<h4>Commissions</h4>
    <table class="tableinfo">
      <tr >
        <td nowrap>
          <table cellspacing=0 cellpadding=2 width="100%" border="0">
            <tr id="trdark">
              <td nowrap width="10%" >
                <div align="right">Table/ Amount :</div>
              </td>
              <td nowrap width="20%" >
                <input type="text" name="E01PRICOT" size="2" maxlength="2" value="<%= prMant.getE01PRICOT().trim()%>" onKeyPress="enterInteger()">
                <a href="javascript:GetCNTRLPRF('E01PRICOT','E01PRICOM','',document.forms[0].E01PRIOCU.value)">
                <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="middle" border="0"></a>
                <input type="text" name="E01PRICOM" size="15" maxlength="13" value="<%= prMant.getE01PRICOM().trim()%>" onKeyPress="enterDecimal()">
              </td>
              <td nowrap width="10%" >
                <div align="right">Currency/ Amount :</div>
              </td>
              <td nowrap width="20%" >
                <input type="text" name="E01PRIRCC" size="4" maxlength="3" value="<%= prMant.getE01PRIRCC().trim()%>">
                <a href="javascript:GetCurrency('E01PRIRCC','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
                <input type="text" name="E01PRIRRA" size="15" maxlength="13" value="<%= prMant.getE01PRIRRA().trim()%>"
				onKeyPress="enterDecimal()">
              </td>
              <td nowrap width="10%" >
                <div align="right">Charges by :</div>
              </td>
              <td nowrap width="20%" >
                <select name="E01PRICHG">
                  <option value="A" <% if (prMant.getE01PRICHG().equals("A")) out.print("selected"); %>>Applicant</option>
                  <option value="B" <% if (prMant.getE01PRICHG().equals("B")) out.print("selected"); %>>Beneficiary</option>
                  <option value="S" <% if (prMant.getE01PRICHG().equals("S")) out.print("selected"); %>>Share</option>
                  <option value="N" <% if (prMant.getE01PRICHG().equals("N") || prMant.getE01PRICHG().equals("")) out.print("selected"); %>>None</option>
                  <option value="O" <% if (prMant.getE01PRICHG().equals("O")) out.print("selected"); %>>Ours</option>
                </select>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
</div>

<div id="basicInfo">
    <h4>Basic Information</h4>
    <table class="tableinfo">
 <tr >
      <td >
          <table cellspacing=0 cellpadding=2 width="100%" border="0">
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap  >
                <div align="right">Reference :</div>
              </td>
              <td nowrap >
                <div align="left">
                  <input type="text" name="E01PRISRF" size="20" maxlength="19" value="<%= prMant.getE01PRISRF().trim()%>" <%= READ_ONLY_TAG %>>
                </div>
              </td>
              <td nowrap >
                <div align="right">Their Reference :</div>
              </td>
              <td nowrap >
                <div align="left">
                  <input type="text" name="E01PRITHF" size="17" maxlength="16" value="<%= prMant.getE01PRITHF().trim()%>" <%= READ_ONLY_TAG %>>
                </div>
              </td>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap  >
                <div align="right">Source of Funds :</div>
              </td>
              <td nowrap >
                <div align="left">
                  <input type="text" name="E01PRISOU" size="2" maxlength="2" value="<%= prMant.getE01PRISOU().trim()%>">
                  <a href="javascript:GetCodeCNOFC('E01PRISOU','18')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="middle" border="0"></a></div>
              </td>
              <td nowrap >
                <div align="right">Disbursement of Funds :</div>
              </td>
              <td nowrap >
                <input type="text" name="E01PRIDIB" size="2" maxlength="2" value="<%= prMant.getE01PRIDIB().trim()%>">
                <a href="javascript:GetCodeCNOFC('E01PRIDIB','38')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="middle" border="0"></a></td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap >
                <div align="right">Instructions Received Via :</div>
              </td>
              <td nowrap >
                <div align="left">
                  <input type="text" name="E01PRIIRV" size="3" maxlength="1" value="<%= prMant.getE01PRIIRV().trim()%>" <%= READ_ONLY_TAG %>>
                  <% if (READ_ONLY_TAG.equals("")) { %>
                  <a href="javascript:GetCode('E01PRIIRV','STATIC_pr_via.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a></div>
                  <% }  %>
                  </td>
              <td nowrap  >
                <div align="right">Check Format :</div>
              </td>
              <td nowrap >
                <input type="text" name="E01PRIFL3" size="2" maxlength="1" value="<%= prMant.getE01PRIFL3().trim()%>">
                </td>
              </tr>
          </table>
      </TD>
 </tr>
</table>
</div>

<% if(!prMant.getE01PRITTP().equals("IT")){ %>
<div id="externalInfo">
    <h4>Additional Information</h4>
    <table class="tableinfo">
 <tr >
      <td >
          <table cellspacing=0 cellpadding=2 width="100%" border="0">
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap>
                <div align="right">Sender ID :</div>
              </td>
              <td nowrap >
                <div align="left">
                  <input type="text" name="E01PRISID" size="15" maxlength="15" value="<%= prMant.getE01PRISID().trim()%>" <%= READ_ONLY_TAG %>>
                  <% if (READ_ONLY_TAG.equals("")) { %>
                  <a href="javascript:GetHelp1()"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="middle" border="0"></a>
                  <% }  %>
					<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory" align="bottom" border="0">
				</div>
              </td>
              <td nowrap >
                <div align="right">Receiver ID :</div>
              </td>
              <td nowrap >
                <input type="text" name="E01PRIRID" size="15" maxlength="15" value="<%= prMant.getE01PRIRID().trim()%>" <%= READ_ONLY_TAG %>>
                <% if (READ_ONLY_TAG.equals("")) { %>
                <a href="javascript:GetHelp()"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="middle" border="0"></a>
                <% }  %>
				<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory" align="bottom" border="0">
			  </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap  >
                <div align="right">Sender Short Name :</div>
              </td>
              <td nowrap >
                <div align="left">
                  <input type="text" name="E01PRISSH" size="25" maxlength="18" value="<%= prMant.getE01PRISSH().trim()%>" <%= READ_ONLY_TAG %>>
                </div>
              <td nowrap >
                <div align="right">Receiver Short Name :</div>
              </td>
              <td nowrap >
                <input type="text" name="E01PRIRSH" size="25" maxlength="18" value="<%= prMant.getE01PRIRSH().trim()%>" <%= READ_ONLY_TAG %>>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap  >
                <div align="right">Bank Operation Code :</div>
              </td>
              <td nowrap >
                <div align="left">
                  <input type="text" name="E01PRIBKO" size="6" maxlength="4" value="<%= prMant.getE01PRIBKO()%>">
                  <a href="javascript:GetCode('E01PRIBKO','STATIC_tr_operations.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a></div>
              </td>
              <td nowrap >
                <div align="right">Instructions Code :</div>
              </td>
              <td nowrap >
                <div align="left">
                  <input type="text" name="E01PRIITC" size="6" maxlength="4" value="<%= prMant.getE01PRIITC()%>" <%= READ_ONLY_TAG %>>
                  <% if (READ_ONLY_TAG.equals("")) { %>
                  <a href="javascript:GetCode('E01PRIITC','STATIC_tr_instructions.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
                  <% }  %>
                  <input type="text" name="E01PRIITA" size="11" maxlength="10" value="<%= prMant.getE01PRIITA()%>" <%= READ_ONLY_TAG %>>
                </div>
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap  >
                <div align="right">Fed Type / Sub Type :</div>
              </td>
              <td nowrap >
                <input type="text" name="E01FEDTYP" size="3" maxlength="2" value="<%= prMant.getE01FEDTYP().trim()%>" <%= READ_ONLY_TAG %>>
                <% if (READ_ONLY_TAG.equals("")) { %>
                <a href="javascript:GetCode('E01FEDTYP','STATIC_pr_types.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
                <% }  %>
                <input type="text" name="E01FEDSTY" size="3" maxlength="2" value="<%= prMant.getE01FEDSTY().trim()%>" <%= READ_ONLY_TAG %>>
                <% if (READ_ONLY_TAG.equals("")) { %>
                <a href="javascript:GetCode('E01FEDSTY','STATIC_pr_subtypes.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
                <% }  %>
              </td>
              <td nowrap >
                <div align="right">Fed Product Code :</div>
              </td>
              <td nowrap >
                <input type="text" name="E01PRIPRC" size="3" maxlength="3" value="<%= prMant.getE01PRIPRC().trim()%>" <%= READ_ONLY_TAG %>>
                <% if (READ_ONLY_TAG.equals("")) { %>
                <a href="javascript:GetCode('E01PRIPRC','STATIC_pr_fed.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
                <% }  %>
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap  >
                <div align="right">Regulatory Report :</div>
              </td>
              <td nowrap colspan="3" >
                <input type="text" name="E11PRIRTR" size="36" maxlength="35" value="<%= prMant.getE11PRIRTR().trim()%>" <%= READ_ONLY_TAG %>>
              </td>
            </tr>
            <tr id="trclear">
              <td nowrap  >&nbsp;</td>
              <td nowrap colspan="3" >
                <input type="text" name="E21PRIRTR" size="36" maxlength="35" value="<%= prMant.getE21PRIRTR().trim()%>" <%= READ_ONLY_TAG %>>
              </td>
            </tr>
            <tr id="trclear">
              <td nowrap  >&nbsp;</td>
              <td nowrap colspan="3" >
                <input type="text" name="E31PRIRTR" size="36" maxlength="35" value="<%= prMant.getE31PRIRTR().trim()%>" <%= READ_ONLY_TAG %>>
              </td>
            </tr>
           </tr>
           </tr>
          </table>
      </TD>
 </tr>
</table>
</div>
<% } %>

<br>
<div id="externalDiv" style="display:<%=!prMant.getE01PRITTP().equals("IT") ? "inline" : "none"%>">
    <table class="tableinfo" width="100%">
      <tr >
        <td nowrap>
          <table cellspacing=0 cellpadding=2 width="100%" border="0">
    	<tr id="trdark">
    		<td nowrap width="50%" align="center"><b>Originator Bank</b>
    		</td>
    		<td nowrap width="50%" align="center"><b>Beneficiary's Bank</b>
    		</td>
    	</tr>
		<tr id="trclear">
			<td>
				<div align="center">
					<table >
                             <tr>
                              <td>
                                <div align="right">
                                  <select name="E01PRIOBO" <%= DISABLED_TAG %> onchange="setHelp(this)" id="OB">
                                    <option value=" " <% if (!(prMant.getE01PRIOBO().equals("F") ||prMant.getE01PRIOBO().equals("D") ||prMant.getE01PRIOBO().equals("A"))) out.print("selected"); %>></option>
                                    <option value="A" <% if(prMant.getE01PRIOBO().equals("A")) out.print("selected");%>>A</option>
                                    <option value="D" <% if(prMant.getE01PRIOBO().equals("D")) out.print("selected");%>>D</option>
                                    <option value="F" <% if(prMant.getE01PRIOBO().equals("F")) out.print("selected");%>>F</option>
                                  </select>
                                  <input type="text" name="E11PRIOBK" size="36" maxlength="35" value="<%= prMant.getE11PRIOBK().trim()%>" >
                                  <span style="display:none" id="OB1">
                                	<a href="javascript:GetCode('E11PRIOBK','STATIC_pr_fed_5010_party_identifier.jsp')" ><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
                                </span>
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td align="right">
                                <input type="text" name="E21PRIOBK" size="36" maxlength="35" value="<%= prMant.getE21PRIOBK().trim()%>" <%=READ_ONLY_TAG%>>
                                <span style="display:none" id="OB2">
                                <a href="javascript:GetCode('E21PRIOBK','STATIC_pr_fed_5010_line.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
                                </span>
                              </td>
                            </tr>
                            <tr>
                              <td align="right">
                                <input type="text" name="E31PRIOBK" size="36" maxlength="35" value="<%= prMant.getE31PRIOBK().trim()%>" <%=READ_ONLY_TAG%>>
                                  <span style="display:none" id="OB3">
                                <a href="javascript:GetCode('E31PRIOBK','STATIC_pr_fed_5010_line.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
                                </span>
                              </td>
                            </tr>
                            <tr>
                              <td align="right">
                                <input type="text" name="E41PRIOBK" size="36" maxlength="35" value="<%= prMant.getE41PRIOBK().trim()%>" <%=READ_ONLY_TAG%>>
                                    <span style="display:none" id="OB4">
                                <a href="javascript:GetCode('E41PRIOBK','STATIC_pr_fed_5010_line.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
                                </span>
                              </td>
                            </tr>
                            <tr>
                              <td align="right">
                                <input type="text" name="E51PRIOBK" size="36" maxlength="35" value="<%= prMant.getE51PRIOBK().trim()%>" <%=READ_ONLY_TAG%>>
                                      <span style="display:none" id="OB5">
                                <a href="javascript:GetCode('E51PRIOBK','STATIC_pr_fed_5010_line.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
                                </span>
                              </td>
                            </tr>
                          </table>
				</div>
			</td>
			<td>
				<div align="center">
                          <table>
                            <tr>
                              <td>
                                <div align="right">
                                  <select name="E01PRIBBO" <%=DISABLED_TAG%> onchange="setHelp(this)" id="BB">
                                    <option value=" " <% if (!(prMant.getE01PRIBBO().equals("A") ||prMant.getE01PRIBBO().equals("B") ||prMant.getE01PRIBBO().equals("D") ||prMant.getE01PRIBBO().equals("F"))) out.print("selected"); %>></option>
                                    <option value="A" <% if(prMant.getE01PRIBBO().equals("A")) out.print("selected");%>>A</option>
                                    <option value="B" <% if(prMant.getE01PRIBBO().equals("B")) out.print("selected");%>>B</option>
                                    <option value="D" <% if(prMant.getE01PRIBBO().equals("D")) out.print("selected");%>>D</option>
                                    <option value="F" <% if(prMant.getE01PRIBBO().equals("F")) out.print("selected");%>>F</option>
                                  </select>
                                  <input type="text" name="E11PRIBBK" size="36" maxlength="35" value="<%= prMant.getE11PRIBBK().trim()%>" <%=READ_ONLY_TAG%>>
                                   <span style="display:none" id="BB1">
                                	<a href="javascript:GetCode('E11PRIBBK','STATIC_pr_fed_5010_party_identifier.jsp')" ><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
                                </span>
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <div align="right">
                                  <input type="text" name="E21PRIBBK" size="36" maxlength="35" value="<%= prMant.getE21PRIBBK().trim()%>" <%=READ_ONLY_TAG%>>
                                  <span style="display:none" id="BB2">
                                <a href="javascript:GetCode('E21PRIBBK','STATIC_pr_fed_5010_line.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
                                </span>
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <div align="right">
                                  <input type="text" name="E31PRIBBK" size="36" maxlength="35" value="<%= prMant.getE31PRIBBK().trim()%>" <%=READ_ONLY_TAG%>>
                                  <span style="display:none" id="BB3">
                                <a href="javascript:GetCode('E31PRIBBK','STATIC_pr_fed_5010_line.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
                                </span>
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <div align="right">
                                  <input type="text" name="E41PRIBBK" size="36" maxlength="35" value="<%= prMant.getE41PRIBBK().trim()%>" <%=READ_ONLY_TAG%>>
                                  <span style="display:none" id="BB4">
                                <a href="javascript:GetCode('E41PRIBBK','STATIC_pr_fed_5010_line.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
                                </span>
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <div align="right">
                                  <input type="text" name="E51PRIBBK" size="36" maxlength="35" value="<%= prMant.getE51PRIBBK().trim()%>" <%=READ_ONLY_TAG%>>
                                  <span style="display:none" id="BB5">
                                <a href="javascript:GetCode('E51PRIBBK','STATIC_pr_fed_5010_line.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
                                </span>
                                </div>
                              </td>
                            </tr>
                          </table>
				</div>
			</td>
		</tr>
          </table>
        </td>
      </tr>
    </table>
<br>
    <table class="tableinfo" width="100%">
      <tr >
        <td nowrap>
          <table cellspacing=0 cellpadding=2 width="100%" border="0">
    	<tr id="trdark">
    		<td nowrap width="50%" align="center"><b>Intermediary Bank</b>
    		</td>
    		<td nowrap width="50%" align="center"><b>Sender Correspondent Bank</b>
    		</td>
    	</tr>
		<tr id="trclear">
			<td>
				<div align="center">
					<table >
                            <tr>
                              <td>
								<div align="right">
                                  <select name="E01PRIINO" <%=DISABLED_TAG%>  onchange="setHelp(this)" id="IB">
                                    <option value=" " <% if (!(prMant.getE01PRIINO().equals("A") ||prMant.getE01PRIINO().equals("B") ||prMant.getE01PRIINO().equals("D") ||prMant.getE01PRIINO().equals("F"))) out.print("selected"); %>></option>
                                    <option value="A" <% if(prMant.getE01PRIINO().equals("A")) out.print("selected");%>>A</option>                                   
                                    <option value="B" <% if(prMant.getE01PRIINO().equals("B")) out.print("selected");%>>B</option>
                                    <option value="D" <% if(prMant.getE01PRIINO().equals("D")) out.print("selected");%>>D</option>
                                    <option value="F" <% if(prMant.getE01PRIINO().equals("F")) out.print("selected");%>>F</option>
                                  </select>
                                </div>
                              </td>
                              <td>
								<div align="left">
                                  <input type="text" name="E11PRIINB" size="36" maxlength="35" value="<%= prMant.getE11PRIINB().trim()%>" <%=READ_ONLY_TAG%>>
                                   <span style="display:none" id="IB1">
                                	<a href="javascript:GetCode('E11PRIINB','STATIC_pr_fed_5010_party_identifier.jsp')" ><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
                                </span>
                                </div>
                              </td>
                            </tr>
                            <tr>
                            <td>
                            </td>
                              <td>
                                <div align="left">
                                  <input type="text" name="E21PRIINB" size="36" maxlength="35" value="<%= prMant.getE21PRIINB().trim()%>" <%=READ_ONLY_TAG%>>
                                  <span style="display:none" id="IB2">
                                <a href="javascript:GetCode('E21PRIINB','STATIC_pr_fed_5010_line.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
                                </span>
                                </div>
                              </td>
                            </tr>
                            <tr>
                            <td>
                            </td>
                              <td>
                                <div align="left">
                                  <input type="text" name="E31PRIINB" size="36" maxlength="35" value="<%= prMant.getE31PRIINB().trim()%>" <%=READ_ONLY_TAG%>>
                                  <span style="display:none" id="IB3">
                                <a href="javascript:GetCode('E31PRIINB','STATIC_pr_fed_5010_line.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
                                </span>
                                </div>
                              </td>
                            </tr>
                            <tr>
                            <td>
                            </td>
                              <td>
                                <div align="left">
                                  <input type="text" name="E41PRIINB" size="36" maxlength="35" value="<%= prMant.getE41PRIINB().trim()%>" <%=READ_ONLY_TAG%>>
                                  <span style="display:none" id="IB4">
                                <a href="javascript:GetCode('E41PRIINB','STATIC_pr_fed_5010_line.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
                                </span>
                                </div>
                              </td>
                            </tr>
                            <tr>
                            <td>
                            </td>
                              <td>
                                <div align="left">
                                  <input type="text" name="E51PRIINB" size="36" maxlength="35" value="<%= prMant.getE51PRIINB().trim()%>" <%=READ_ONLY_TAG%>>
                                  <span style="display:none" id="IB5">
                                <a href="javascript:GetCode('E51PRIINB','STATIC_pr_fed_5010_line.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
                                </span>
                                </div>
                              </td>
                            </tr>
                            <tr>
                            <td align="right">
                            	Country: 
                            </td>
                              <td align="left">
                                <div align="left">
                                <input type="text" name="E01COUNT2" size="6" maxlength="4" value="<%= prMant.getE01COUNT2().trim()%>" <%=READ_ONLY_TAG%>>
					             <a href="javascript:GetCodeCNOFC('E01COUNT2','03')">
					             <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="top" border="0"></a>
                                </div>
                              </td>
                            </tr>
                          </table>
				</div>
			</td>
			<td>
				<div align="center">
                          <table>
                            <tr>
                              <td>
								<div align="right">
                                  <select name="E01PRISCO" onchange="setHelp(this)" id="SCB">
                                    <option value=" " <% if (!(prMant.getE01PRISCO().equals("A") ||prMant.getE01PRISCO().equals("B") ||prMant.getE01PRISCO().equals("D") ||prMant.getE01PRISCO().equals("F"))) out.print("selected"); %>></option>
                                    <option value="A" <% if(prMant.getE01PRISCO().equals("A")) out.print("selected");%>>A</option>
                                    <option value="B" <% if(prMant.getE01PRISCO().equals("B")) out.print("selected");%>>B</option>
                                    <option value="D" <% if(prMant.getE01PRISCO().equals("D")) out.print("selected");%>>D</option>
                                    <option value="F" <% if(prMant.getE01PRISCO().equals("F")) out.print("selected");%>>F</option>
                                  </select>
                                </div>
                              </td>
                              <td>
 								<div align="left">
                                  <input type="text" name="E11PRISCB" size="36" maxlength="35" value="<%= prMant.getE11PRISCB().trim()%>" >
                                  <span style="display:none" id="SCB1">
                                	<a href="javascript:GetCode('E11PRISCB','STATIC_pr_fed_5010_party_identifier.jsp')" ><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
                                </span>
                                </div>
                              </td>
                            </tr>
                            <tr>
                            <td>
                            </td>
                              <td>
                                <div align="left">
                                  <input type="text" name="E21PRISCB" size="36" maxlength="35" value="<%= prMant.getE21PRISCB().trim()%>" >
                                  <span style="display:none" id="SCB2">
                                <a href="javascript:GetCode('E21PRISCB','STATIC_pr_fed_5010_line.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
                                </span>
                                </div>
                              </td>
                            </tr>
                            <tr>
                            <td>
                            </td>
                              <td>
                                <div align="left">
                                  <input type="text" name="E31PRISCB" size="36" maxlength="35" value="<%= prMant.getE31PRISCB().trim()%>" >
                                  <span style="display:none" id="SCB3">
                                <a href="javascript:GetCode('E31PRISCB','STATIC_pr_fed_5010_line.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
                                </span>
                                </div>
                              </td>
                            </tr>
                            <tr>
                            <td>
                            </td>
                              <td>
                                <div align="left">
                                  <input type="text" name="E41PRISCB" size="36" maxlength="35" value="<%= prMant.getE41PRISCB().trim()%>" >
                                  <span style="display:none" id="SCB4">
                                <a href="javascript:GetCode('E41PRISCB','STATIC_pr_fed_5010_line.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
                                </span>
                                </div>
                              </td>
                            </tr>
                            <tr>
                            <td>
                            </td>
                              <td>
                                <div align="left">
                                  <input type="text" name="E51PRISCB" size="36" maxlength="35" value="<%= prMant.getE51PRISCB().trim()%>" >
                                  <span style="display:none" id="SCB5">
                                <a href="javascript:GetCode('E51PRISCB','STATIC_pr_fed_5010_line.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
                                </span>
                                </div>
                              </td>
                            </tr>
                            <tr>
                            <td>
                            	Country :
                            </td>
                              <td>
                                <div align="left">
                                <input type="text" name="E01COUNT3" size="6" maxlength="4" value="<%= prMant.getE01COUNT3().trim()%>" <%=READ_ONLY_TAG%>>
					             <a href="javascript:GetCodeCNOFC('E01COUNT3','03')">
					             <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="middle" border="0"></a>
                                </div>
                              </td>
                            </tr>
                          </table>
				</div>
			</td>
		</tr>
          </table>
        </td>
      </tr>
    </table>
 <br>
    <table class="tableinfo" width="100%">
      <tr >
        <td nowrap>
          <table cellspacing=0 cellpadding=2 width="100%" border="0">
    	<tr id="trdark">
    		<td nowrap width="50%" align="center"><b>Receiver Correspondent Bank<BR>
				(FED Instructing Bank)</b>
    		</td>
    		<td nowrap width="50%" align="center"><b>Detail of Payment</b>
    		</td>
    	</tr>
		<tr id="trclear">
			<td>
				<div align="center">
					<table >
                            <tr>
                              <td>
                                <div align="right">
                                  <select name="E01PRIRBO"  onchange="setHelp(this)" id="RCB">
                                    <option value=" " <% if (!(prMant.getE01PRIRBO().equals("A") ||prMant.getE01PRIRBO().equals("B") ||prMant.getE01PRIRBO().equals("D") ||prMant.getE01PRIRBO().equals("F"))) out.print("selected"); %>></option>
                                    <option value="A" <% if(prMant.getE01PRIRBO().equals("A")) out.print("selected");%>>A</option>
                                    <option value="B" <% if(prMant.getE01PRIRBO().equals("B")) out.print("selected");%>>B</option>
                                    <option value="D" <% if(prMant.getE01PRIRBO().equals("D")) out.print("selected");%>>D</option>
                                    <option value="F" <% if(prMant.getE01PRIRBO().equals("F")) out.print("selected");%>>F</option>
                                  </select>
                                  <input type="text" name="E11PRIRCB" size="36" maxlength="35" value="<%= prMant.getE11PRIRCB().trim()%>">
                                   <span style="display:none" id="RCB1">
                                	<a href="javascript:GetCode('E11PRIRCB','STATIC_pr_fed_5010_party_identifier.jsp')" ><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
                                </span>
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <div align="right">
                                  <input type="text" name="E21PRIRCB" size="36" maxlength="35" value="<%= prMant.getE21PRIRCB().trim()%>">
                                  <span style="display:none" id="RCB2">
                                <a href="javascript:GetCode('E21PRIRCB','STATIC_pr_fed_5010_line.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
                                </span>
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <div align="right">
                                  <input type="text" name="E31PRIRCB" size="36" maxlength="35" value="<%= prMant.getE31PRIRCB().trim()%>">
                                  <span style="display:none" id="RCB3">
                                <a href="javascript:GetCode('E31PRIRCB','STATIC_pr_fed_5010_line.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
                                </span>
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <div align="right">
                                  <input type="text" name="E41PRIRCB" size="36" maxlength="35" value="<%= prMant.getE41PRIRCB().trim()%>">
                                  <span style="display:none" id="RCB4">
                                <a href="javascript:GetCode('E41PRIRCB','STATIC_pr_fed_5010_line.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
                                </span>
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <div align="right">
                                  <input type="text" name="E51PRIRCB" size="36" maxlength="35" value="<%= prMant.getE51PRIRCB().trim()%>">
                                  <span style="display:none" id="RCB5">
                                <a href="javascript:GetCode('E51PRIRCB','STATIC_pr_fed_5010_line.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
                                </span>
                                </div>
                              </td>
                            </tr>
                          </table>
				</div>
			</td>
			<td>
				<div align="center">
                          <table>
                            <tr>
                              <td>
 								<input type="text" name="E11PRIDTP" size="36" maxlength="35" value="<%= prMant.getE11PRIDTP().trim()%>" <%=READ_ONLY_TAG%>>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                  <input type="text" name="E21PRIDTP" size="36" maxlength="35" value="<%= prMant.getE21PRIDTP().trim()%>" <%=READ_ONLY_TAG%>>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                  <input type="text" name="E31PRIDTP" size="36" maxlength="35" value="<%= prMant.getE31PRIDTP().trim()%>" <%=READ_ONLY_TAG%>>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                  <input type="text" name="E41PRIDTP" size="36" maxlength="35" value="<%= prMant.getE41PRIDTP().trim()%>" <%=READ_ONLY_TAG%>>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                  <input type="text" name="E51PRIDTP" size="36" maxlength="35" value="<%= prMant.getE51PRIDTP().trim()%>" <%=READ_ONLY_TAG%>>
                              </td>
                            </tr>
                          </table>
				</div>
			</td>
		</tr>
          </table>
        </td>
      </tr>
    </table>
<br>
    <table class="tableinfo" width="100%">
      <tr >
        <td nowrap>
          <table cellspacing=0 cellpadding=2 width="100%" border="0">
    		<tr id="trdark">
    			<td nowrap width="50%" align="center"><b>Detail for Ordering <BR>
					(FED Orig. to Benef. Info)</b>
    			</td>
    			<td nowrap width="50%" align="center"><b>Bank to Bank Info</b>
    			</td>
    		</tr>
    		<tr id="trclear">
    			<td nowrap width="50%">
				<div align="center">
							<table >
                            <tr>
                              <td>
                                <input type="text" name="E11PRIDTO" size="36" maxlength="35" value="<%= prMant.getE11PRIDTO().trim()%>" <%=READ_ONLY_TAG%>>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <input type="text" name="E21PRIDTO" size="36" maxlength="35" value="<%= prMant.getE21PRIDTO().trim()%>" <%=READ_ONLY_TAG%>>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <input type="text" name="E31PRIDTO" size="36" maxlength="35" value="<%= prMant.getE31PRIDTO().trim()%>" <%=READ_ONLY_TAG%>>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <input type="text" name="E41PRIDTO" size="36" maxlength="35" value="<%= prMant.getE41PRIDTO().trim()%>" <%=READ_ONLY_TAG%>>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <input type="text" name="E51PRIDTO" size="36" maxlength="35" value="<%= prMant.getE51PRIDTO().trim()%>" <%=READ_ONLY_TAG%>>
                              </td>
                            </tr>
                          </table>
				</div>
				</td>
				<td nowrap width="50%">
					<div align="center">
                          <table>
                            <tr>
                              <td>
                                <div align="right">
                                  <input type="text" name="E11PRIBKB" size="36" maxlength="35" value="<%= prMant.getE11PRIBKB().trim()%>">
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <div align="right">
                                  <input type="text" name="E21PRIBKB" size="36" maxlength="35" value="<%= prMant.getE21PRIBKB().trim()%>">
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <div align="right">
                                  <input type="text" name="E31PRIBKB" size="36" maxlength="35" value="<%= prMant.getE31PRIBKB().trim()%>">
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <div align="right">
                                  <input type="text" name="E41PRIBKB" size="36" maxlength="35" value="<%= prMant.getE41PRIBKB().trim()%>">
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <div align="right">
                                  <input type="text" name="E51PRIBKB" size="36" maxlength="35" value="<%= prMant.getE51PRIBKB().trim()%>">
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <div align="right">
                                  <input type="text" name="E61PRIBKB" size="36" maxlength="35" value="<%= prMant.getE61PRIBKB().trim()%>">
                                </div>
                              </td>
                            </tr>
                          </table>
					</div>
				</td>
			</tr>
          </table>
        </td>
      </tr>
    </table>

 <br>
<B>Additional Fields</B>
<BR>

<TABLE class="tableinfo" id="dataTable">
    
    <TR id=trdark>
		<td NOWRAP align="center" width="5%"><b>Seq</b></td>
		<td NOWRAP align="center" width="5%"><b>TAG</b></td>
		<td NOWRAP align="center" width="20%"><b>Description</b></td>
		<td NOWRAP align="center" width="5%"><b>Option</b></td>
		<td NOWRAP align="left" width="65%"><b>Field</b></td>
	</TR> 
	<% 
	for (int i = 0; i < 10; i++) {
	  if (!prMant.getField("E01PRATG"+i).getString().trim().equals("")) {
	%>
    <TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" name="E01PRASQ<%= i %>" size="2" maxlength="1" value="<%= prMant.getField("E01PRASQ"+i).getString().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" name="E01PRATG<%= i %>" size="5" maxlength="4" value="<%= prMant.getField("E01PRATG"+i).getString().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="20%" valign="top">
			<INPUT type="text" name="E01TAGDS<%= i %>" size="31" maxlength="30" value="<%= prMant.getField("E01TAGDS"+i).getString().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" name="E01PRAOP<%= i %>" size="2" maxlength="1" value="<%= prMant.getField("E01PRAOP"+i).getString().trim()%>" <%=READ_ONLY_TAG%>>
		</td>
		<td NOWRAP align="left" width="65%" valign="top">
			<INPUT type="hidden" name="E01PRAFL<%= i %>" value="<%= prMant.getField("E01PRAFL"+i).getString().trim()%>">		
	        <%
	        int seq = 1;
	        int lnt = Util.parseInt(prMant.getField("E01TAGLE"+i).getString().trim());
	        int ln = lnt;
	        if (lnt > 35) {
	          seq = lnt / 35;
	          ln = 35;
	        }  	
	        for (int ix = 1; ix <= seq; ix++) {
	          int posi = (ix * ln) - ln;
	          int posf = (ix * ln) - 1;
	          String vl = "";
	          try {
	            vl =  prMant.getField("E01PRAFL"+i).getString().substring(posi,posf);
	          } catch (Exception e) {
	          	if(posi <=  prMant.getField("E01PRAFL"+i).getString().length()) {
				  vl = prMant.getField("E01PRAFL"+i).getString().substring(posi);
				}
	          }
			%>
			  <INPUT type="text" name="E01PRAFL0_<%=ix%>" size="40" maxlength="35" value="<%= vl %>"  
	  			   <%=READ_ONLY_TAG%> onchange="buildField('E01PRAFL<%= i %>',<%=seq%>, <%=lnt%>)"><BR> 
			<%}%>   
		</td>
	</TR>
	<% }
	} %>

  </TABLE>

</div>
<BR>
<h4 style="text-align:center"><input type="checkbox" name="H01FLGWK2" value="A" <% if(prMant.getH01FLGWK2().equals("A")){ out.print("checked");} %>>
      Accept with Warnings</h4>
</div>

  <div id="LoanOpt" style="display:none"></div>
<p align="center">
    <input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="javascript:goSubmit();">
</p>

</form>
<script language="Javascript">
$(document).ready(function(){
		SetVia(getElement('tranferType').value, getElement('E01PRIPVI').value);
		setOrderingAccount();
		setBeneficiaryAccount();
});
</script>
</body>
</html>
