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

<jsp:useBean id="prMant02" class="datapro.eibs.beans.EPR010002Message"  scope="session" />
<jsp:useBean id="prMant03" class="datapro.eibs.beans.EPR010003Message"  scope="session" />
<jsp:useBean id="prMant04" class="datapro.eibs.beans.EPR010004Message"  scope="session" />
<jsp:useBean id="prMant05" class="datapro.eibs.beans.EPR010005Message"  scope="session" />
<jsp:useBean id="prMant06" class="datapro.eibs.beans.EPR010006Message"  scope="session" />
<jsp:useBean id="E01PRIRR42DSC" class="java.lang.String"  scope="session" />


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
<script language="Javascript" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>
<script language="Javascript" src="<%=request.getContextPath()%>/pages/e/javascripts/jquery.jsp"></script>
<script language="Javascript" src="<%=request.getContextPath()%>/pages/e/javascripts/wireTransfers.js"> </SCRIPT>

<jsp:useBean id="showSect02" class="java.lang.String"  scope="session" />
<jsp:useBean id="showSect03" class="java.lang.String"  scope="session" />
<jsp:useBean id="showSect04" class="java.lang.String"  scope="session" />
<jsp:useBean id="showSect05" class="java.lang.String"  scope="session" />
<jsp:useBean id="showSect06" class="java.lang.String"  scope="session" />

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
  	var option = getElement('E01PRIBCO').value;
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

function show(divName) {
  		document.all[divName].style.display="block";
}

function hide(divName) {
	document.all[divName].style.display="none";
}

function showSections(){

	hide('sect02');
	hide('sect03');
	hide('sect04');
	hide('sect05');
	hide('sect06');
	
	if (document.forms[0].E01PRIPVI.value == '1'){//if transfer type = FED

		var fedProdCode = document.forms[0].E01PRIPRC.value;
		var localInstCode = document.forms[0].E01PRIRR42DSC.value;

		if (fedProdCode == 'CTP'){
			if (localInstCode == 'COVS'){//COVS,2
				show('sect02');
			}else if (localInstCode == 'RMTS'){//RMTS,7
				show('sect03');
			}else if (localInstCode == 'RRMT'){//RRMT,8
				show('sect04');
			}else if (localInstCode == 'ANSI' ||
					  localInstCode == 'GXML' ||
					  localInstCode == 'IXML' ||
					  localInstCode == 'NARR' ||
					  localInstCode == 'S820' ||
					  localInstCode == 'SWIF' ||
					  localInstCode == 'UEDI'){//ANSI-1, GXML-3, IXML-4, NARR-5, S820-9, SWIF-A or UEDI-B
				show('sect05');				
			}
			show('sect06');	
		}
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

<h3 align="center">Financial Transaction<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="pr_maint.jsp, EPR0000"></h3>
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
                    <select id="paymentVia" name="E01PRIPVI" onchange="SetVia(getElement('tranferType').value, this.value);showSections()">
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
            <td >
	              <input type="text" name="E01CPYNUM" size="10" maxlength="9" onKeyPress="enterInteger()"
				  value="<%= prMant.getE01CPYNUM().trim()%>">
	              <a href="javascript:GetCloneTransfer('E01CPYNUM')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" border="0" ></a>
            </td>
		<%
            	} else {
		%>      
            <td nowrap colspan="2"> 
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
			  <a href="javascript:GetCodeCNOFC('E01PRIDSQ','CX')">
			  <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"  border="0" ></a>       
			</td>    
		  </tr>
		  <% if(!("".equals(prMant.getE01TAG121().trim()))){ %>
		  <tr class="trdark">
		  	<td nowrap align="right"> UETR : </td>
		  	<td colspan="5">
		  		<input type="text" size="50" readonly="readonly" value="<%=prMant.getE01TAG121().trim() %>" style="text-transform:none !important" />
		  	</td>
		  </tr>		  
		  <% }%>
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
                        <option value="F" <% if(prMant.getE01PRIBCO().equals("F")) out.print("selected");%>>F</option>
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
              	<img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" align="top" border="0"></a>
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
				<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Help" border="0"></a>
				<%}%>
              </div>
            </td>
			<td nowrap width="10%" align="right"> 
                <span id="LBL_59_1" class="swf_field_59" style="display:<%=!prMant.getE01PRIBCO().equals("F") ? "inline" : "none"%>">Account :</span>
                <span id="LBL_59F_1" class="swf_field_59" style="display:<%=prMant.getE01PRIBCO().equals("F") ? "inline" : "none"%>">
	          		<select name="SWF_59F_1_1" id="SWF_59F_1_1" class="swf_field_59" <%=DISABLED_TAG%> dir="rtl" onchange="setBeneficiaryAccount()"
	             			style="border: 0; text-align: right; text-transform: none; min-width: 30px; width: 130px; background-color: blank">
	                	<option value="" <% if(isOptionFAccount(prMant.getE11PRIBCU())) out.print("selected"); %>>Account</option>
						<option value="ARNU" <% if(isOptionFSeq(prMant.getE11PRIBCU(), "ARNU")) out.print("selected");%>>Alien Number</option>
						<option value="CCPT" <% if(isOptionFSeq(prMant.getE11PRIBCU(), "CCPT")) out.print("selected");%>>Passport</option>
						<option value="CUST" <% if(isOptionFSeq(prMant.getE11PRIBCU(), "CUST")) out.print("selected");%>>Customer Id</option>
						<option value="DRLC" <% if(isOptionFSeq(prMant.getE11PRIBCU(), "DRLC")) out.print("selected");%>>Driver License</option>
						<option value="EMPL" <% if(isOptionFSeq(prMant.getE11PRIBCU(), "EMPL")) out.print("selected");%>>Employer Number</option>
						<option value="NIDN" <% if(isOptionFSeq(prMant.getE11PRIBCU(), "NIDN")) out.print("selected");%>>National Id</option>
						<option value="SOSE" <% if(isOptionFSeq(prMant.getE11PRIBCU(), "SOSE")) out.print("selected");%>>Social Security</option>
						<option value="TXID" <% if(isOptionFSeq(prMant.getE11PRIBCU(), "TXID")) out.print("selected");%>>Tax Id</option>
					</select> :
				</span>
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
					<span id="LBL_59F_2" class="swf_field_59" style="display:<%=prMant.getE01PRIBCO().equals("F") ? "inline" : "none"%>">
						<select name="SWF_59F_2_1" id="SWF_59F_2_1" class="swf_field_59" <%=DISABLED_TAG%> dir="rtl" onchange="setField(getElement('E21PRIORC'), 'SWF_59', 'F', 2)"
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
            </td>
            <td nowrap> 
              <div align="left">     
                <input type="hidden" name="E21PRIBCU" size="45" maxlength="35" value="<%=prMant.getE21PRIBCU().trim()%>">
				
              	<input type="text" id="SWF_59_2_1" name="E21PRIBCU_1"  class="swf_field_59" size="45" maxlength="35" value="<%=prMant.getE21PRIBCU().trim()%>" <%=READ_ONLY_TAG%> 
              			onchange="setField(getElement('E21PRIBCU'), 'SWF_59', '', 2)" >
            
              	<input type="text" id="SWF_59A_2_1" name="E21PRIBCU_A"  class="swf_field_59" size="45" maxlength="35" value="<%=prMant.getE21PRIBCU().trim()%>" <%=READ_ONLY_TAG%> 
              			onchange="setField(getElement('E21PRIBCU'), 'SWF_59', 'A', 2)"  >
                       	
				<% if (isEditable) {  %>
                <span id="SWH_59_2_1" class="swf_field_59" style="display: <%=prMant.getE01PRIBCO().trim().equals("") ? "inline" : "none"%>">
				<a href="javascript:GetSwiftIdDesc('E21PRIBCU_1','E31PRIBCU_3','E41PRIBCU_4','E51PRIBCU_5')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title="Help de SWIFT" align="bottom" border="0" ></a>
                </span>
                <span id="SWH_59A_2_1" class="swf_field_59" style="display: <%=prMant.getE01PRIBCO().equals("A") ? "inline" : "none"%>">
				<a href="javascript:GetSwiftIdDesc('E21PRIBCU_A', 'E31PRIBCU_A','','','')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title="Help de SWIFT" align="bottom" border="0" ></a>
                </span>
				<% } %>
				
				<input type="text" <%=READ_ONLY_TAG%> id="SWF_59F_2_2" name="SWF_59F_2_2" class="swf_field_59" onchange="setField(getElement('E21PRIBCU'), 'SWF_59', 'F', 2)" 
					size="45" maxlength="35" value="<%= isNotOptionFSeq(prMant.getE21PRIBCU()) ? prMant.getE21PRIORC() : prMant.getE21PRIBCU().substring(prMant.getE21PRIBCU().indexOf("/")) %>">
					              
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
      		  <div>
				<span id="LBL_59_3" class="swf_field_59" style="display:<%=!prMant.getE01PRIBCO().equals("A") && !prMant.getE01PRIBCO().equals("F") ? "inline" : "none"%>">Address :</span>
				<span id="LBL_59A_3" class="swf_field_59" style="display:<%=prMant.getE01PRIBCO().equals("A") ? "inline" : "none"%>"></span>
				<span id="LBL_59F_3" class="swf_field_59" style="display:<%=prMant.getE01PRIBCO().equals("F") ? "inline" : "none"%>">
					<select name="SWF_59F_3_1" id="SWF_59F_3_1" class="swf_field_59" <%=DISABLED_TAG%> dir="rtl" onchange="setField(getElement('E31PRIBCU'), 'SWF_59', 'F', 3)"
             			style="border: 0; text-align: right; text-transform: none; min-width: 30px; width: 130px; background-color: blank">
						<option value="1" <% if(isOptionFSeq(prMant.getE31PRIBCU(), "1")) out.print("selected");%>>Name</option>
                    	<option value="2" <% if(isNotOptionFSeq(prMant.getE31PRIBCU())) out.print("selected"); %>>Address</option>
						<option value="3" <% if(isOptionFSeq(prMant.getE31PRIBCU(), "3")) out.print("selected");%>>Country and Town</option>
						<option value="4" <% if(isOptionFSeq(prMant.getE31PRIBCU(), "4")) out.print("selected");%>>Date of Birth</option>
						<option value="5" <% if(isOptionFSeq(prMant.getE31PRIBCU(), "5")) out.print("selected");%>>Place of Birth</option>
						<option value="6" <% if(isOptionFSeq(prMant.getE31PRIBCU(), "6")) out.print("selected");%>>Customer Id</option>
						<option value="7" <% if(isOptionFSeq(prMant.getE31PRIBCU(), "7")) out.print("selected");%>>National Id</option>
						<option value="8" <% if(isOptionFSeq(prMant.getE31PRIBCU(), "8")) out.print("selected");%>>Additional Info</option>
					</select> :
				</span>
			  </div>
			  <div>
			  	<span id="LBL_59F_4" class="swf_field_59" style="display:<%=prMant.getE01PRIBCO().equals("F") ? "inline" : "none"%>">
					<select name="SWF_59F_4_1" id="SWF_59F_4_1" class="swf_field_59" <%=DISABLED_TAG%> dir="rtl" onchange="setField(getElement('E41PRIBCU'), 'SWF_59', 'F', 4)"
             			style="border: 0; text-align: right; text-transform: none; min-width: 30px; width: 130px; background-color: blank">
						<option value="1" <% if(isOptionFSeq(prMant.getE41PRIBCU(), "1")) out.print("selected");%>>Name</option>
                    	<option value="2" <% if(isNotOptionFSeq(prMant.getE41PRIBCU())) out.print("selected"); %>>Address</option>
						<option value="3" <% if(isOptionFSeq(prMant.getE41PRIBCU(), "3")) out.print("selected");%>>Country and Town</option>
						<option value="4" <% if(isOptionFSeq(prMant.getE41PRIBCU(), "4")) out.print("selected");%>>Date of Birth</option>
						<option value="5" <% if(isOptionFSeq(prMant.getE41PRIBCU(), "5")) out.print("selected");%>>Place of Birth</option>
						<option value="6" <% if(isOptionFSeq(prMant.getE41PRIBCU(), "6")) out.print("selected");%>>Customer Id</option>
						<option value="7" <% if(isOptionFSeq(prMant.getE41PRIBCU(), "7")) out.print("selected");%>>National Id</option>
						<option value="8" <% if(isOptionFSeq(prMant.getE41PRIBCU(), "8")) out.print("selected");%>>Additional Info</option>
					</select> :
				</span>
			  </div>
			  <div>
			  	<span id="LBL_59F_5" class="swf_field_59" style="display:<%=prMant.getE01PRIBCO().equals("F") ? "inline" : "none"%>">
					<select name="SWF_59F_5_1" id="SWF_59F_5_1" class="swf_field_59" <%=DISABLED_TAG%> dir="rtl" onchange="setField(getElement('E51PRIBCU'), 'SWF_59', 'F', 5)"
             			style="border: 0; text-align: right; text-transform: none; min-width: 30px; width: 130px; background-color: blank">
						<option value="1" <% if(isOptionFSeq(prMant.getE51PRIBCU(), "1")) out.print("selected");%>>Name</option>
                    	<option value="2" <% if(isNotOptionFSeq(prMant.getE51PRIBCU())) out.print("selected"); %>>Address</option>
						<option value="3" <% if(isOptionFSeq(prMant.getE51PRIBCU(), "3")) out.print("selected");%>>Country and Town</option>
						<option value="4" <% if(isOptionFSeq(prMant.getE51PRIBCU(), "4")) out.print("selected");%>>Date of Birth</option>
						<option value="5" <% if(isOptionFSeq(prMant.getE51PRIBCU(), "5")) out.print("selected");%>>Place of Birth</option>
						<option value="6" <% if(isOptionFSeq(prMant.getE51PRIBCU(), "6")) out.print("selected");%>>Customer Id</option>
						<option value="7" <% if(isOptionFSeq(prMant.getE51PRIBCU(), "7")) out.print("selected");%>>National Id</option>
						<option value="8" <% if(isOptionFSeq(prMant.getE51PRIBCU(), "8")) out.print("selected");%>>Additional Info</option>
					</select> :
				</span>
			  </div>
			</td> 
            <td nowrap > 
              <div align="left"> 
              	<input type="hidden" name="E31PRIBCU" size="45" maxlength="35" value="<%= prMant.getE31PRIBCU().trim()%>">
                <input <%=READ_ONLY_TAG%> type="text" id="SWF_59_3_2" name="E31PRIBCU_3" class="swf_field_59" onchange="setField(getElement('E31PRIBCU'), 'SWF_59', '', 3)" 
                	size="45" maxlength="35" value="<%=prMant.getE31PRIBCU().trim()%>">
                <input <%=READ_ONLY_TAG%> type="text" id="SWF_59A_3_2" name="E31PRIBCU_A" class="swf_field_59" onchange="setField(getElement('E31PRIBCU'), 'SWF_59', 'A', 3)" 
                	size="45" maxlength="35" value="<%=prMant.getE31PRIBCU().trim()%>">
                <input <%=READ_ONLY_TAG%> type="text" id="SWF_59F_3_2" name="E31PRIBCU_F" class="swf_field_59" onchange="setField(getElement('E31PRIBCU'), 'SWF_59', 'F', 3)" 
                	size="45" maxlength="35" value="<%=prMant.getE31PRIBCU().trim()%>"><br>
              </div>
              <div align="left"> 
                <input type="hidden" id="E41PRIBCU" name="E41PRIBCU" size="45" maxlength="35" value="<%=prMant.getE41PRIBCU().trim()%>">
                <input <%=READ_ONLY_TAG%> type="text" id="SWF_59_4_2" name="E41PRIBCU_4" class="swf_field_59" onchange="setField(getElement('E41PRIBCU'), 'SWF_59', '', 4)" 
                	size="45" maxlength="35" value="<%=prMant.getE41PRIBCU().trim()%>">
                <input <%=READ_ONLY_TAG%> type="text" id="SWF_59A_4_2" name="E41PRIBCU_A" class="swf_field_59" onchange="setField(getElement('E41PRIBCU'), 'SWF_59', 'A', 4)" 
                	size="45" maxlength="35" value="<%=prMant.getE41PRIBCU().trim()%>">
                <input <%=READ_ONLY_TAG%> type="text" id="SWF_59F_4_2" name="E41PRIBCU_F" class="swf_field_59" onchange="setField(getElement('E41PRIBCU'), 'SWF_59', 'F', 4)" 
                	size="45" maxlength="35" value="<%=prMant.getE41PRIBCU().trim()%>"><br>
              </div>
              <div align="left"> 
                <input type="hidden" id="E51PRIBCU" name="E51PRIBCU" size="45" maxlength="35" value="<%=prMant.getE51PRIBCU().trim()%>">
                <input <%=READ_ONLY_TAG%> type="text" id="SWF_59_5_2" name="E51PRIBCU_5" class="swf_field_59" onchange="setField(getElement('E51PRIBCU'), 'SWF_59', '', 5)" 
                	size="45" maxlength="35" value="<%=prMant.getE51PRIBCU().trim()%>">
                <input <%=READ_ONLY_TAG%> type="text" id="SWF_59A_5_2" name="E51PRIBCU_A" class="swf_field_59" onchange="setField(getElement('E51PRIBCU'), 'SWF_59', 'A', 5)" 
                	size="45" maxlength="35" value="<%=prMant.getE51PRIBCU().trim()%>">
                <input <%=READ_ONLY_TAG%> type="text" id="SWF_59F_5_2" name="E51PRIBCU_F" class="swf_field_59" onchange="setField(getElement('E51PRIBCU'), 'SWF_59', 'F', 5)" 
                	size="45" maxlength="35" value="<%=prMant.getE51PRIBCU().trim()%>"><br>
              </div>
            </td>
          </tr>
          <tr id="trclear">
      		<td nowrap align="right"> 
                  Country :
			</td> 
            <td nowrap colspan="2"> 
              <div align="left"> 
              	<input type="text" name="E01PRIUC2" size="6" maxlength="4" <%=READ_ONLY_TAG%> value="<%= prMant.getE01PRIUC2().trim()%>" >
           
              	<a href="javascript:GetCodeCNOFC('E01PRIUC2','03')">
              	<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="top" border="0"></a>
				<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0">
            
              </div>
            </td>
      		<td nowrap align="right"> 
                  Country :
			</td> 
            <td nowrap > 
              <div align="left"> 
              	<input type="text" name="E01COUNT1" size="6" maxlength="4" <%=READ_ONLY_TAG%> value="<%= prMant.getE01COUNT1().trim()%>" >
           
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
                <a href="javascript:GetCurrency('E01PRITCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" border="0"></a>
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
                  <img src="<%=request.getContextPath()%>/images/calendar.gif" title="help" align="middle" border="0"></a>
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
        <td nowrap align="center" >Cost Center
					<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory" align="bottom" border="0">
        </td>
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
          <!--  <div align="right">W/T Security Code :</div> !-->
        </td>
        <td nowrap>
		<!--	<input type="text" name="E01PRIWRN" size="4" maxlength="3" value="<%= prMant.getE01PRIWRN().trim()%>"> !-->
        </td>
        <td nowrap colspan="2">
           <div align="right">Customer :</div>
        </td>
        <td nowrap  colspan="4">
			<input type="text" name="E01DRANME" size="45" maxlength="45" value="<%= prMant.getE01DRANME().trim()%>" >
        </td>
      </tr>
       <tr id="trclear">
        <td nowrap colspan="2">
           
        </td>
        <td nowrap>
			
        </td>
        <td nowrap colspan="2">
            <div align="right">
			<div align="right">Description Debit :</div>
			</div>
        </td>
        <td nowrap colspan="4">
        <input type="text" name="E11PRITRD" size="31" maxlength="22"
						value="<%= prMant.getE11PRITRD().trim()%>">
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
        <td nowrap align="center" >Cost Center
					<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory" align="bottom" border="0">
        </td>
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
         <td nowrap colspan="2" >
             <!--     <div align="right">Days Hold :</div> -->
          </td>
          <td colspan="2">
          	<div>
                 <!--  <input type="text" name="E01PRIHDY" size="3" maxlength="3" value="<%= prMant.getE01PRIHDY().trim()%>" onKeyPress="enterInteger()"> -->
        	</div>
        </td>
        <td nowrap colspan="1">
           <div align="right">Customer :</div>
        </td>
        <td nowrap colspan="5">
			<input type="text" name="E01CRANME" size="45" maxlength="45" value="<%= prMant.getE01CRANME().trim()%>" >
        </td>
      </tr>
      <tr id="trclear">
      <td colspan="5" >
           <div align="right">Description Credit :</div>
        </td>
        <td nowrap  colspan ="4">
			<input type="text" name="E21PRITRD" size="31" maxlength="22" value="<%= prMant.getE21PRITRD().trim()%>">
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
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" align="middle" border="0"></a>
                <input type="text" name="E01PRICOM" size="15" maxlength="13" value="<%= prMant.getE01PRICOM().trim()%>" onKeyPress="enterDecimal()">
              </td>
              <td nowrap width="10%" >
                <div align="right">Currency/ Amount :</div>
              </td>
              <td nowrap width="20%" >
                <input type="text" name="E01PRIRCC" size="4" maxlength="3" value="<%= prMant.getE01PRIRCC().trim()%>">
                <a href="javascript:GetCurrency('E01PRIRCC','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" border="0"></a>
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
                  <a href="javascript:GetCodeCNOFC('E01PRISOU','18')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" align="middle" border="0"></a></div>
              </td>
              <td nowrap >
                <div align="right">Disbursement of Funds :</div>
              </td>
              <td nowrap >
                <input type="text" name="E01PRIDIB" size="2" maxlength="2" value="<%= prMant.getE01PRIDIB().trim()%>">
                <a href="javascript:GetCodeCNOFC('E01PRIDIB','38')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" align="middle" border="0"></a></td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap >
                <div align="right">Instructions Received Via :</div>
              </td>
              <td nowrap >
                <div align="left">
                  <input type="text" name="E01PRIIRV" size="3" maxlength="1" value="<%= prMant.getE01PRIIRV().trim()%>" <%= READ_ONLY_TAG %>>
                  <% if (READ_ONLY_TAG.equals("")) { %>
                  <a href="javascript:GetCode('E01PRIIRV','STATIC_pr_via.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a></div>
                  <% }  %>
                  </td>
              <td nowrap  >
                <div align="right">Check Number  :</div>
              </td>
              <td nowrap >
                <input type="text" name="E01PRICKN"  size="10" maxlength="9"  value="<%= prMant.getE01PRICKN().trim()%>" onkeypress="enterInteger()">
                </td>
              </tr>
<%--             <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap >
                <div align="right">Country Origin :</div>
              </td>
              <td nowrap >
                <div align="left">         
                  <input type="text" name="E01PRIUC2" size="4" maxlength="3" value="<%= prMant.getE01PRIUC2().trim()%>" <%= READ_ONLY_TAG %>>
                  <% if (READ_ONLY_TAG.equals("")) { %>
                  <a href="javascript:GetCodeCNOFC('E01PRIUC2','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" >
                   <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="middle" border="0"></a></div>
                  <% }  %>
                 
              </td>
              <td nowrap  >
                <div align="right">Country Destination :</div>
              </td>
              <td nowrap >
                 <input type="text" name="E01PRIDSQ" size="4" maxlength="3" value="<%= prMant.getE01PRIDSQ().trim()%>" <%= READ_ONLY_TAG %>>
                  
                  <% if (READ_ONLY_TAG.equals("")) { %>
                  <a href="javascript:GetCodeCNOFC('E01PRIDSQ','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" >
                  	<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="middle" border="0">
                  </a></div>
                  <% }  %>
                 
              </td>
              </tr>  --%> 
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap >
                <div align="right">Our Reference :</div>
              </td>
              <td nowrap >
                <div align="left">
                  <input type="text" name="E31PRITRD" readonly size="13" maxlength="12" value="<%= prMant.getE31PRITRD().trim()%>" >
                </div> 	
              </td>
              <td nowrap  >
                
              </td>
              <td nowrap >
                
              </td>
              </tr>  
          </table>
      </TD>
 </tr>
</table>
</div>
<div id="swiftTimeIndicator">
<h4> Time Indication </h4>
   	<table class="tableinfo" cellspacing=0 cellpadding=2 width="100%" border="0">
   		<tr id="trdark">
   			<td nowrap align="right"> Code : </td>
   			<td align="left">
   				<select name="E01M13COD" class="timeInd" <% if(prMant.getE01PRITTP().equals("IW")){ out.print("disabled");} %> >
		             <option value="" <% if (!(prMant.getE01M13COD().equals("CLSTIME") || prMant.getE01M13COD().equals("RNCTIME") || prMant.getE01M13COD().equals("SNDTIME")))
		 										out.print("selected"); %>> </option>
		             <option value="CLSTIME" <% if (prMant.getE01M13COD().equals("CLSTIME")) out.print("selected"); %>>CLS Time</option>
		             <option value="RNCTIME" <% if (prMant.getE01M13COD().equals("RNCTIME")) out.print("selected"); %>>Receive Time</option>
		             <option value="SNDTIME" <% if (prMant.getE01M13COD().equals("SNDTIME")) out.print("selected"); %>>Send Time</option>                   
		           </select>
   			</td>    
   			<td align="right">Time : </td>
   			<td>
   				<input type="text" name="E01M13TIM" value="<%= prMant.getE01M13TIM() %>" maxlength="4" size="6" onkeypress="enterInteger()"
   					<% if(prMant.getE01PRITTP().equals("IW")){ out.print("disabled");} %>>
   				<select name="E01M13SIG" class="timeInd" <% if(prMant.getE01PRITTP().equals("IW")){ out.print("disabled");} %> >
		             <option value="" <% if (!(prMant.getE01M13SIG().equals("+") || prMant.getE01M13SIG().equals("-")))
		 										out.print("selected"); %>> </option>
		             <option value="+" <% if (prMant.getE01M13SIG().equals("+")) out.print("selected"); %>> Plus </option>
		             <option value="-" <% if (prMant.getE01M13SIG().equals("-")) out.print("selected"); %>> Minus </option>                
		        </select>  
		        <input type="text" name="E01M13TOF" value="<%= prMant.getE01M13TOF() %>" maxlength="4" size="6" onkeypress="enterInteger()"
		        	<% if(prMant.getE01PRITTP().equals("IW")){ out.print("disabled");} %>> (Hours)  
   			</td>        			
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
                  <a href="javascript:GetHelp1()"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" align="middle" border="0"></a>
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
                <a href="javascript:GetHelp()"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" align="middle" border="0"></a>
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
                  <a href="javascript:GetCode('E01PRIBKO','STATIC_tr_operations.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a></div>
              </td>
              <td nowrap >
                <div align="right">Instructions Code :</div>
              </td>
              <td nowrap >
                <div align="left">
                  <input type="text" name="E01PRIITC" size="6" maxlength="4" value="<%= prMant.getE01PRIITC()%>" <%= READ_ONLY_TAG %>>
                  <% if (READ_ONLY_TAG.equals("")) { %>
                  <a href="javascript:GetCode('E01PRIITC','STATIC_tr_instructions.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a>
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
                <a href="javascript:GetCode('E01FEDTYP','STATIC_pr_types.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a>
                <% }  %>
                <input type="text" name="E01FEDSTY" size="3" maxlength="2" value="<%= prMant.getE01FEDSTY().trim()%>" <%= READ_ONLY_TAG %>>
                <% if (READ_ONLY_TAG.equals("")) { %>
                <a href="javascript:GetCode('E01FEDSTY','STATIC_pr_subtypes.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a>
                <% }  %>
              </td>
              <td nowrap="nowrap" valign="top">
                <div align="right">Fed Product Code :</div>
              </td>
              <td nowrap="nowrap" >
                <input type="text" name="E01PRIPRC" size="3" maxlength="3" value="<%= prMant.getE01PRIPRC().trim()%>" <%= READ_ONLY_TAG %> onchange="showSections()">
                <% if (READ_ONLY_TAG.equals("")) { %>
                <a href="javascript:GetCode('E01PRIPRC','STATIC_pr_fed.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a>
                <% }  %>
				<span align="right" style="position: relative;">Local Inst. Code :</span>
				<% if (READ_ONLY_TAG.equals("")) { %>
				<a href="javascript:GetCode('E01PRIRR42DSC','STATIC_pr_local_inst_code.jsp');">
				<input type="text" name="E01PRIRR42DSC" size="5" maxlength="4" value="<%= E01PRIRR42DSC%>" onfocus="showSections()" readonly>
				<img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
				<% }else{ %>
				<input type="text" name="E01PRIRR42DSC" size="5" maxlength="4" value="<%= E01PRIRR42DSC%>" readonly>
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
                                  </div>
                              </td>   
                              <td>
                                <div align="left">
                                  <input type="text" name="E11PRIOBK" size="36" maxlength="35" value="<%= prMant.getE11PRIOBK().trim()%>" <%=READ_ONLY_TAG%> >
                                  <span style="display:none" id="OB1">
                                	<a href="javascript:GetCode('E11PRIOBK','STATIC_pr_fed_5010_party_identifier.jsp')" ><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a>
                                </span>
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td></td>
                              <td align="left">
                                <input type="text" name="E21PRIOBK" size="36" maxlength="35" value="<%= prMant.getE21PRIOBK().trim()%>" <%=READ_ONLY_TAG%>>
                                <span style="display:none" id="OB2">
                                <a href="javascript:GetCode('E21PRIOBK','STATIC_pr_fed_5010_line.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a>
                                </span>
                              </td>
                            </tr>
                            <tr>
                              <td></td>
                              <td align="left">
                                <input type="text" name="E31PRIOBK" size="36" maxlength="35" value="<%= prMant.getE31PRIOBK().trim()%>" <%=READ_ONLY_TAG%>>
                                  <span style="display:none" id="OB3">
                                <a href="javascript:GetCode('E31PRIOBK','STATIC_pr_fed_5010_line.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a>
                                </span>
                              </td>
                            </tr>
                            <tr>
                              <td></td>
                              <td align="left">
                                <input type="text" name="E41PRIOBK" size="36" maxlength="35" value="<%= prMant.getE41PRIOBK().trim()%>" <%=READ_ONLY_TAG%>>
                                    <span style="display:none" id="OB4">
                                <a href="javascript:GetCode('E41PRIOBK','STATIC_pr_fed_5010_line.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a>
                                </span>
                              </td>
                            </tr>
                            <tr>
                              <td></td>
                              <td align="left">
                                <input type="text" name="E51PRIOBK" size="36" maxlength="35" value="<%= prMant.getE51PRIOBK().trim()%>" <%=READ_ONLY_TAG%>>
                                      <span style="display:none" id="OB5">
                                <a href="javascript:GetCode('E51PRIOBK','STATIC_pr_fed_5010_line.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a>
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
                                    <option value=" " <% if (!(prMant.getE01PRIBBO().equals("A") || prMant.getE01PRIBBO().equals("B") || prMant.getE01PRIBBO().equals("C") ||prMant.getE01PRIBBO().equals("D") ||prMant.getE01PRIBBO().equals("F"))) out.print("selected"); %>></option>
                                    <option value="A" <% if(prMant.getE01PRIBBO().equals("A")) out.print("selected");%>>A</option>
                                    <option value="B" <% if(prMant.getE01PRIBBO().equals("B")) out.print("selected");%>>B</option>
                                    <option value="C" <% if(prMant.getE01PRIBBO().equals("C")) out.print("selected");%>>C</option>
                                    <option value="D" <% if(prMant.getE01PRIBBO().equals("D")) out.print("selected");%>>D</option>
                                    <option value="F" <% if(prMant.getE01PRIBBO().equals("F")) out.print("selected");%>>F</option>
                                  </select>
                                  </div>
                                </td>
                                <td>  
                                <div align="left">
                                  <input type="text" name="E11PRIBBK" size="36" maxlength="35" value="<%= prMant.getE11PRIBBK().trim()%>" <%=READ_ONLY_TAG%>>
                                   <span style="display:none" id="BB1">
                                	<a href="javascript:GetCode('E11PRIBBK','STATIC_pr_fed_5010_party_identifier.jsp')" ><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a>
                                </span>
                                </div>
                              </td>
                            </tr>
                            <tr>
                                <td></td>
                              <td>
                                <div align="right">
                                  <input type="text" name="E21PRIBBK" size="36" maxlength="35" value="<%= prMant.getE21PRIBBK().trim()%>" <%=READ_ONLY_TAG%>>
                                  <span style="display:none" id="BB2">
                                <a href="javascript:GetCode('E21PRIBBK','STATIC_pr_fed_5010_line.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a>
                                </span>
                                </div>
                              </td>
                            </tr>
                            <tr>
                                <td></td>
                              <td>
                                <div align="right">
                                  <input type="text" name="E31PRIBBK" size="36" maxlength="35" value="<%= prMant.getE31PRIBBK().trim()%>" <%=READ_ONLY_TAG%>>
                                  <span style="display:none" id="BB3">
                                <a href="javascript:GetCode('E31PRIBBK','STATIC_pr_fed_5010_line.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a>
                                </span>
                                </div>
                              </td>
                            </tr>
                            <tr>
                                <td></td>
                              <td>
                                <div align="right">
                                  <input type="text" name="E41PRIBBK" size="36" maxlength="35" value="<%= prMant.getE41PRIBBK().trim()%>" <%=READ_ONLY_TAG%>>
                                  <span style="display:none" id="BB4">
                                <a href="javascript:GetCode('E41PRIBBK','STATIC_pr_fed_5010_line.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a>
                                </span>
                                </div>
                              </td>
                            </tr>
                            <tr>
                                <td></td>
                              <td>
                                <div align="right">
                                  <input type="text" name="E51PRIBBK" size="36" maxlength="35" value="<%= prMant.getE51PRIBBK().trim()%>" <%=READ_ONLY_TAG%>>
                                  <span style="display:none" id="BB5">
                                <a href="javascript:GetCode('E51PRIBBK','STATIC_pr_fed_5010_line.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a>
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
                                	<a href="javascript:GetCode('E11PRIINB','STATIC_pr_fed_5010_party_identifier.jsp')" ><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a>
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
                                <a href="javascript:GetCode('E21PRIINB','STATIC_pr_fed_5010_line.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a>
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
                                <a href="javascript:GetCode('E31PRIINB','STATIC_pr_fed_5010_line.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a>
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
                                <a href="javascript:GetCode('E41PRIINB','STATIC_pr_fed_5010_line.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a>
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
                                <a href="javascript:GetCode('E51PRIINB','STATIC_pr_fed_5010_line.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a>
                                </span>
                                </div>
                              </td>
                            </tr>
                            
                            <tr>
                             <td align="right">
                             		Country :
                             </td>		
                              <td align="left">
                                   	<input type="text" name="E01COUNT2" size="6" maxlength="4" value="<%= prMant.getE01COUNT2().trim()%>" <%=READ_ONLY_TAG%>>
                                   
					              	<a href="javascript:GetCodeCNOFC('E01COUNT2','03')">
					              	<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="top" border="0"></a>
									<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0">
                               
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
                                	<a href="javascript:GetCode('E11PRISCB','STATIC_pr_fed_5010_party_identifier.jsp')" ><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a>
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
                                <a href="javascript:GetCode('E21PRISCB','STATIC_pr_fed_5010_line.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a>
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
                                <a href="javascript:GetCode('E31PRISCB','STATIC_pr_fed_5010_line.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a>
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
                                <a href="javascript:GetCode('E41PRISCB','STATIC_pr_fed_5010_line.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a>
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
                                <a href="javascript:GetCode('E51PRISCB','STATIC_pr_fed_5010_line.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a>
                                </span>
                                </div>
                              </td>
                            </tr>                            
                            <tr>
                             <td align="right"> Country :</td>
                             <td align="left">
                                   	<input type="text" name="E01COUNT3" size="6" maxlength="4" value="<%= prMant.getE01COUNT3().trim()%>" <%=READ_ONLY_TAG%>>
                                   
					              	<a href="javascript:GetCodeCNOFC('E01COUNT3','03')">
					              	<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="top" border="0"></a>
									<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0">
	                               
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
                                	<a href="javascript:GetCode('E11PRIRCB','STATIC_pr_fed_5010_party_identifier.jsp')" ><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a>
                                </span>
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <div align="right">
                                  <input type="text" name="E21PRIRCB" size="36" maxlength="35" value="<%= prMant.getE21PRIRCB().trim()%>">
                                  <span style="display:none" id="RCB2">
                                <a href="javascript:GetCode('E21PRIRCB','STATIC_pr_fed_5010_line.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a>
                                </span>
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <div align="right">
                                  <input type="text" name="E31PRIRCB" size="36" maxlength="35" value="<%= prMant.getE31PRIRCB().trim()%>">
                                  <span style="display:none" id="RCB3">
                                <a href="javascript:GetCode('E31PRIRCB','STATIC_pr_fed_5010_line.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a>
                                </span>
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <div align="right">
                                  <input type="text" name="E41PRIRCB" size="36" maxlength="35" value="<%= prMant.getE41PRIRCB().trim()%>">
                                  <span style="display:none" id="RCB4">
                                <a href="javascript:GetCode('E41PRIRCB','STATIC_pr_fed_5010_line.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a>
                                </span>
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <div align="right">
                                  <input type="text" name="E51PRIRCB" size="36" maxlength="35" value="<%= prMant.getE51PRIRCB().trim()%>">
                                  <span style="display:none" id="RCB5">
                                <a href="javascript:GetCode('E51PRIRCB','STATIC_pr_fed_5010_line.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a>
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

<div id="sect02" <%="Y".equals(showSect02)?"":"style=\"display:none\""%>>
<h4>Cover Payment Information (CTP-COVS)</h4>

<TABLE class="tableinfo" id="dataTable">
    
    <TR id=trdark>
		<td NOWRAP align="center" width="5%"><b>Seq</b></td>
		<td NOWRAP align="center" width="5%"><b>TAG</b></td>
		<td NOWRAP align="center" width="20%"><b>Description</b></td>
		<td NOWRAP align="center" width="5%"><b>Option</b></td>
		<td NOWRAP align="left" width="65%"><b>Field</b></td>
	</TR> 
	
    <TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="2" maxlength="1" value="B" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="5" maxlength="4" value="7033" readonly >
		</td>
		<td NOWRAP align="center" width="20%" valign="top">
			<INPUT type="text" size="31" maxlength="30" value="Currency/Instructed Amount" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="2" maxlength="1" value="" >
		</td>
		<td NOWRAP align="left" width="65%" valign="top">     
			  <table>
			  	<tr>
			  		<td width="100"></td>
			 	 	<td>
			 	 	<INPUT type="text" name="E02F70331" size="4" maxlength="3" value="33B" readonly>
			 	 	<BR></td>
			 	</tr>
			 	<tr>
			 		<td>Currency :</td>
			  		<td><INPUT type="text" name="E02F70332" size="4" maxlength="3" value="<%=prMant02.getE02F70332()%>">
			  		<a href="javascript:GetCurrency('E02F70332','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0"></a>
			  		<BR></td>
			  	</tr>
			  	<tr>
			  		<td>Amount :</td>
					<td><INPUT type="text" name="E02F70333" size="40" maxlength="20" value="<%=prMant02.getE02F70333()%>" onKeyPress="enterDecimal()"><BR></td>    
			 	</tr>
			  </table>
		</td>
	</TR>
	    <TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="2" maxlength="1" value="B" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="5" maxlength="4" value="7050" readonly >
		</td>
		<td NOWRAP align="center" width="20%" valign="top">
			<INPUT type="text" size="31" maxlength="30" value="Ordering Customer " readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="2" maxlength="1" value="" >
		</td>
		<td NOWRAP align="left" width="65%" valign="top">     
			  <table>
			  	<tr>
			  		<td width="100"></td>
			 	 	<td>
			 	 	<select name="E02F70501">
                    			<option value="50A" <% if(prMant02.getE02F70501().equals("50A")){ out.print("selected");} %> >50A</option>
                    			<option value="50F" <% if(prMant02.getE02F70501().equals("50F")){ out.print("selected");} %> >50F</option>
                    			<option value="50K" <% if(prMant02.getE02F70501().equals("50K")){ out.print("selected");} %> >50K</option>
                  	</select>
                  	<BR> 
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E02F70502" size="40" maxlength="35" value="<%=prMant02.getE02F70502()%>"><img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"><BR></td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E02F70503" size="40" maxlength="35" value="<%=prMant02.getE02F70503()%>"><BR>   
			  
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E02F70504" size="40" maxlength="35" value="<%=prMant02.getE02F70504()%>"><BR> 
			
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E02F70505" size="40" maxlength="35" value="<%=prMant02.getE02F70505()%>"><BR>   
			  			  
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E02F70506" size="40" maxlength="35" value="<%=prMant02.getE02F70506()%>"><BR></td>    
			 	</tr>
			  </table> 
		</td>
	</TR>
	    <TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="2" maxlength="1" value="B" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="5" maxlength="4" value="7052" readonly >
		</td>
		<td NOWRAP align="center" width="20%" valign="top">
			<INPUT type="text" size="31" maxlength="30" value="Ordering Institution " readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="2" maxlength="1" value="" >
		</td>
		<td NOWRAP align="left" width="65%" valign="top">     
			  <table>
			  	<tr>
			  		<td width="100"></td>
			 	 	<td>
					<select name="E02F70521">
                    			<option value="52A" <% if(prMant02.getE02F70521().equals("52A")){ out.print("selected");} %> >52A</option>
                    			<option value="52D" <% if(prMant02.getE02F70521().equals("52D")){ out.print("selected");} %> >52D</option>
                  	</select><BR> 			
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E02F70522" size="40" maxlength="35" value="<%=prMant02.getE02F70522()%>"><BR> 
			
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E02F70523" size="40" maxlength="35" value="<%=prMant02.getE02F70523()%>"><BR>  
			  
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E02F70524" size="40" maxlength="35" value="<%=prMant02.getE02F70524()%>"><BR> 
			
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E02F70525" size="40" maxlength="35" value="<%=prMant02.getE02F70525()%>"><BR> 
			
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E02F70526" size="40" maxlength="35" value="<%=prMant02.getE02F70526()%>"><BR></td>    
			 	</tr>
			  </table>    
		</td>
	</TR>
	    <TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="2" maxlength="1" value="B" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="5" maxlength="4" value="7056" readonly >
		</td>
		<td NOWRAP align="center" width="20%" valign="top">
			<INPUT type="text" size="31" maxlength="30" value="Intermediary Institution " readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="2" maxlength="1" value="" >
		</td>
		<td NOWRAP align="left" width="65%" valign="top">     
			  <table>
			  	<tr>
			  		<td width="100"></td>
			 	 	<td>
			 	 	<select name="E02F70561">
                    			<option value="56A" <% if(prMant02.getE02F70561().equals("56A")){ out.print("selected");} %> >56A</option>
                    			<option value="56D" <% if(prMant02.getE02F70561().equals("56D")){ out.print("selected");} %> >56D</option>
                  	</select><BR> 
			
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E02F70562" size="40" maxlength="35" value="<%=prMant02.getE02F70562()%>"><BR> 
			
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E02F70563" size="40" maxlength="35" value="<%=prMant02.getE02F70563()%>"><BR>  
			  
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E02F70564" size="40" maxlength="35" value="<%=prMant02.getE02F70564()%>"><BR> 
			
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E02F70565" size="40" maxlength="35" value="<%=prMant02.getE02F70565()%>"><BR> 
			
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E02F70566" size="40" maxlength="35" value="<%=prMant02.getE02F70566()%>"><BR></td>    
			 	</tr>
			  </table>    
		</td>
	</TR>
	    <TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="2" maxlength="1" value="B" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="5" maxlength="4" value="7057" readonly >
		</td>
		<td NOWRAP align="center" width="20%" valign="top">
			<INPUT type="text" size="31" maxlength="30" value="Account with Institution " readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="2" maxlength="1" value="" >
		</td>
		<td NOWRAP align="left" width="65%" valign="top">     
			  <table>
			  	<tr>
			  		<td width="100"></td>
			 	 	<td>
			 	 	<select name="E02F70571">
                    			<option value="57A" <% if(prMant02.getE02F70571().equals("57A")){ out.print("selected");} %> >57A</option>
                    			<option value="57D" <% if(prMant02.getE02F70571().equals("57D")){ out.print("selected");} %> >57D</option>
                  	</select><BR> 
			
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E02F70572" size="40" maxlength="35" value="<%=prMant02.getE02F70572()%>"><BR> 
			
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E02F70573" size="40" maxlength="35" value="<%=prMant02.getE02F70573()%>"><BR>  
			  
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E02F70574" size="40" maxlength="35" value="<%=prMant02.getE02F70574()%>"><BR></td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E02F70575" size="40" maxlength="35" value="<%=prMant02.getE02F70575()%>"><BR> 
 
  			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E02F70576" size="40" maxlength="35" value="<%=prMant02.getE02F70576()%>"><BR></td>    
			 	</tr>
			  </table> 
		</td>
	</TR>
	    <TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="2" maxlength="1" value="B" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="5" maxlength="4" value="7059" readonly >
		</td>
		<td NOWRAP align="center" width="20%" valign="top">
			<INPUT type="text" size="31" maxlength="30" value="Beneficiary Customer " readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="2" maxlength="1" value="" >
		</td>
		<td NOWRAP align="left" width="65%" valign="top">     
			  <table>
			  	<tr>
			  		<td width="100"></td>
			 	 	<td>
			 	 	<select name="E02F70591">
                    			<option value="59" <% if(prMant02.getE02F70591().equals("59")){ out.print("selected");} %> >59</option>
                    			<option value="59A" <% if(prMant02.getE02F70591().equals("59A")){ out.print("selected");} %> >59A</option>
                  	</select><BR> 
			
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E02F70592" size="40" maxlength="35" value="<%=prMant02.getE02F70592()%>"><img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"><BR> 
			
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E02F70593" size="40" maxlength="35" value="<%=prMant02.getE02F70593()%>"><BR>  
			  
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E02F70594" size="40" maxlength="35" value="<%=prMant02.getE02F70594()%>"><BR> 
			
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E02F70595" size="40" maxlength="35" value="<%=prMant02.getE02F70595()%>"><BR> 
			
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E02F70596" size="40" maxlength="35" value="<%=prMant02.getE02F70596()%>"><BR></td>    
			 	</tr>
			  </table>  
		</td>
	</TR>
	    <TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="2" maxlength="1" value="B" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="5" maxlength="4" value="7070" readonly >
		</td>
		<td NOWRAP align="center" width="20%" valign="top">
			<INPUT type="text" size="31" maxlength="30" value="Remittance Information " readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="2" maxlength="1" value="" >
		</td>
		<td NOWRAP align="left" width="65%" valign="top">     
			  <table>
			  	<tr>
			  		<td width="100"></td>
			 	 	<td><INPUT type="text" name="E02F70701" size="4" maxlength="3" value="70" readonly><BR> 
			
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E02F70702" size="40" maxlength="35" value="<%=prMant02.getE02F70702()%>"><BR> 
			
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E02F70703" size="40" maxlength="35" value="<%=prMant02.getE02F70703()%>"><BR>  
			  
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E02F70704" size="40" maxlength="35" value="<%=prMant02.getE02F70704()%>"><BR>  
			
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E02F70705" size="40" maxlength="35" value="<%=prMant02.getE02F70705()%>"><BR></td>    
			 	</tr>
			  </table>  
		</td>
	</TR>
	    <TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="2" maxlength="1" value="B" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="5" maxlength="4" value="7072" readonly >
		</td>
		<td NOWRAP align="center" width="20%" valign="top">
			<INPUT type="text" size="31" maxlength="30" value="Sender to Receiver Information " readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="2" maxlength="1" value="" >
		</td>
		<td NOWRAP align="left" width="65%" valign="top">     
			  <table>
			  	<tr>
			  		<td width="100"></td>
			 	 	<td><INPUT type="text" name="E02F70721" size="4" maxlength="3" value="72" readonly><BR> 
			
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E02F70722" size="40" maxlength="35" value="<%=prMant02.getE02F70722()%>"><BR> 
			
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E02F70723" size="40" maxlength="35" value="<%=prMant02.getE02F70723()%>"><BR>  
			  
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E02F70724" size="40" maxlength="35" value="<%=prMant02.getE02F70724()%>"><BR> 
			
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E02F70725" size="40" maxlength="35" value="<%=prMant02.getE02F70725()%>"><BR> 
			
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E02F70726" size="40" maxlength="35" value="<%=prMant02.getE02F70726()%>"><BR>  
			  
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E02F70727" size="40" maxlength="35" value="<%=prMant02.getE02F70727()%>"><BR></td>    
			 	</tr>
			  </table>  
		</td>
	</TR>

  </TABLE>
</div>


<div id="sect03" <%="Y".equals(showSect03)?"":"style=\"display:none\""%>>
<h4>Structured Remittance Information (CTP-RMTS)</h4>

<TABLE class="tableinfo" id="dataTable">
    
    <TR id=trdark>
		<td NOWRAP align="center" width="5%"><b>Seq</b></td>
		<td NOWRAP align="center" width="5%"><b>TAG</b></td>
		<td NOWRAP align="center" width="20%"><b>Description</b></td>
		<td NOWRAP align="center" width="5%"><b>Option</b></td>
		<td NOWRAP align="left" width="65%"><b>Field</b></td>
	</TR> 
	
    <TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="2" maxlength="1" value="B" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="5" maxlength="4" value="8300" readonly >
		</td>
		<td NOWRAP align="center" width="20%" valign="top">
			<INPUT type="text" size="31" maxlength="30" value="Remittance Originator" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="2" maxlength="1" value="" >
		</td>
		<td NOWRAP align="left" width="65%" valign="top">     
			  <table>
			  	<tr>
			  		<td width="150">Identification Type :</td>
			 	 	<td>
			 	 		<select name="E03F830001" onChange="iCode(this.value,'E03F830002')">
                    			<option value=" "> </option>
                    			<option value="OI" <% if(prMant03.getE03F830001().equals("OI")){ out.print("selected");} %> >Organization ID</option>
                    			<option value="PI" <% if(prMant03.getE03F830001().equals("PI")){ out.print("selected");} %> >Private ID</option>

                  		</select>
			 	 	<BR> 		
			  </td>
			 	</tr>
			 	<tr>
			 		<td>Identification Code :</td>
			  		<td>
			  		<%if("OI".equals(prMant03.getE03F830001())){%>
			  			<select name="E03F830002">
                    			<option value="BANK" <% if(prMant03.getE03F830002().equals("BANK")){ out.print("selected");} %> >BANK</option>
                    			<option value="CUST" <% if(prMant03.getE03F830002().equals("CUST")){ out.print("selected");} %> >CUST</option>
                    			<option value="DUNS" <% if(prMant03.getE03F830002().equals("DUNS")){ out.print("selected");} %> >DUNS</option>
                    			<option value="EMPL" <% if(prMant03.getE03F830002().equals("EMPL")){ out.print("selected");} %> >EMPL</option>
                    			<option value="GS1G" <% if(prMant03.getE03F830002().equals("GS1G")){ out.print("selected");} %> >GS1G</option>
                    			<option value="PROP" <% if(prMant03.getE03F830002().equals("PROP")){ out.print("selected");} %> >PROP</option>
                     			<option value="SWBB" <% if(prMant03.getE03F830002().equals("SWBB")){ out.print("selected");} %> >SWBB</option>
                    			<option value="TXID" <% if(prMant03.getE03F830002().equals("TXID")){ out.print("selected");} %> >TXID</option>
                  		</select>
                  	<%}else if("PI".equals(prMant03.getE03F830001())){%>
                  		<select name="E03F830002">
                    			<option value="ARNU" <% if(prMant03.getE03F830002().equals("ARNU")){ out.print("selected");} %> >ARNU</option>
                    			<option value="CCPT" <% if(prMant03.getE03F830002().equals("CCPT")){ out.print("selected");} %> >CCPT</option>
                    			<option value="CUST" <% if(prMant03.getE03F830002().equals("CUST")){ out.print("selected");} %> >CUST</option>
                    			<option value="DPOB" <% if(prMant03.getE03F830002().equals("DPOB")){ out.print("selected");} %> >DPOB</option>
                    			<option value="DRLC" <% if(prMant03.getE03F830002().equals("DRLC")){ out.print("selected");} %> >DRLC</option>
                    			<option value="EMPL" <% if(prMant03.getE03F830002().equals("EMPL")){ out.print("selected");} %> >EMPL</option>
                     			<option value="NIDN" <% if(prMant03.getE03F830002().equals("NIDN")){ out.print("selected");} %> >NIDN</option>
                    			<option value="PROP" <% if(prMant03.getE03F830002().equals("PROP")){ out.print("selected");} %> >PROP</option>
              			        <option value="SOSE" <% if(prMant03.getE03F830002().equals("SOSE")){ out.print("selected");} %> >SOSE</option>
                    			<option value="TXID" <% if(prMant03.getE03F830002().equals("TXID")){ out.print("selected");} %> >TXID</option>
                  		</select>
                  		<%}else{%>
                  		<select name="E03F830002">
                    			<option value=" "> </option>
                  		</select>
                  		<%}%>
			  		<BR>  
			  </td>
			 	</tr>
			 	<tr>
			 		<td>Name :</td>
			  		<td><textarea cols="80" rows="3" name="E03F830003" onkeyup="checkMaxLength(this, 140)" onblur="checkMaxLength(this, 140)"><%=prMant03.getE03F830003()%></textarea><BR>  
			  </td>
			 	</tr>
			 	<tr>
			 		<td>Identification Number :</td>
			  		<td><INPUT type="text" name="E03F830004" size="40" maxlength="35" value="<%=prMant03.getE03F830004()%>"><BR> 
			  </td>
			 	</tr>
			 	<tr>
			 		<td>Identification Number Issuer :</td>
			  		<td><INPUT type="text" name="E03F830005" size="40" maxlength="35" value="<%=prMant03.getE03F830005()%>"><BR> 
			  </td>
			 	</tr>
			 	<tr>
			 		<td>Date &amp; Place of Birth :</td>
			  		<td><INPUT type="text" name="E03F830006" size="40" maxlength="82" value="<%=prMant03.getE03F830006()%>"><BR>    
			  </td>
			 	</tr>
			 	<tr>
			 		<td>Address Type :</td>
			  		<td>
                  		<select name="E03F830007">
                    			<option value="ADDR" <% if(prMant03.getE03F830007().equals("ADDR")){ out.print("selected");} %> >ADDR</option>
                    			<option value="BIZZ" <% if(prMant03.getE03F830007().equals("BIZZ")){ out.print("selected");} %> >BIZZ</option>
                    			<option value="DLVY" <% if(prMant03.getE03F830007().equals("DLVY")){ out.print("selected");} %> >DLVY</option>
                    			<option value="HOME" <% if(prMant03.getE03F830007().equals("HOME")){ out.print("selected");} %> >HOME</option>
                    			<option value="MLTO" <% if(prMant03.getE03F830007().equals("MLTO")){ out.print("selected");} %> >MLTO</option>
                    			<option value="PBOX" <% if(prMant03.getE03F830007().equals("EMPL")){ out.print("selected");} %> >PBOX</option>
                  		</select>
			  </td>
			 	</tr>
			 	<tr>
			 		<td>Department :</td>
			  		<td><INPUT type="text" name="E03F830008" size="40" maxlength="70" value="<%=prMant03.getE03F830008()%>"><BR>  
			  </td>
			 	</tr>
			 	<tr>
			 		<td>Sub-Department :</td>
			  		<td><INPUT type="text" name="E03F830009" size="40" maxlength="70" value="<%=prMant03.getE03F830009()%>"><BR>  
			  </td>
			 	</tr>
			 	<tr>
			 		<td>Street Name :</td>
			  		<td><INPUT type="text" name="E03F830010" size="40" maxlength="70" value="<%=prMant03.getE03F830010()%>"><BR>  
			  </td>
			 	</tr>
			 	<tr>
			 		<td>Building Number :</td>
			  		<td><INPUT type="text" name="E03F830011" size="40" maxlength="16" value="<%=prMant03.getE03F830011()%>"><BR>  
			  </td>
			 	</tr>
			 	<tr>
			 		<td>Post Code :</td>
			  		<td><INPUT type="text" name="E03F830012" size="40" maxlength="16" value="<%=prMant03.getE03F830012()%>"><BR>  
			  </td>
			 	</tr>
			 	<tr>
			 		<td>Town Name :</td>
			  		<td><INPUT type="text" name="E03F830013" size="40" maxlength="35" value="<%=prMant03.getE03F830013()%>"><BR>  
			  </td>
			 	</tr>
			 	<tr>
			 		<td>Contry Sub Division/State :</td>
			  		<td><INPUT type="text" name="E03F830014" size="40" maxlength="35" value="<%=prMant03.getE03F830014()%>"><BR>  
			  </td>
			 	</tr>
			 	<tr>
			 		<td>Country :</td>
			  		<td><INPUT type="text" name="E03F830015" size="40" maxlength="2" value="<%=prMant03.getE03F830015()%>"><BR>  
			  </td>
			 	</tr>
			 	<tr>
			 		<td>Address Line 1 :</td>
			  		<td><INPUT type="text" name="E03F830016" size="40" maxlength="70" value="<%=prMant03.getE03F830016()%>"><BR>  
			  </td>
			 	</tr>
			 	<tr>
			 		<td>Address Line 2 :</td>
			  		<td><INPUT type="text" name="E03F830017" size="40" maxlength="70" value="<%=prMant03.getE03F830017()%>"><BR>  
			  </td>
			 	</tr>
			 	<tr>
			 		<td>Address Line 3 :</td>
			  		<td><INPUT type="text" name="E03F830018" size="40" maxlength="70" value="<%=prMant03.getE03F830018()%>"><BR>  
			  </td>
			 	</tr>
			 	<tr>
			 		<td>Address Line 4 :</td>
			  		<td><INPUT type="text" name="E03F830019" size="40" maxlength="70" value="<%=prMant03.getE03F830019()%>"><BR>  
			  </td>
			 	</tr>
			 	<tr>
			 		<td>Address Line 5 :</td>
			  		<td><INPUT type="text" name="E03F830020" size="40" maxlength="70" value="<%=prMant03.getE03F830020()%>"><BR>  
			  </td>
			 	</tr>
			 	<tr>
			 		<td>Address Line 6 :</td>
			  		<td><INPUT type="text" name="E03F830021" size="40" maxlength="70" value="<%=prMant03.getE03F830021()%>"><BR>  
			  </td>
			 	</tr>
			 	<tr>
			 		<td>Address Line 7 :</td>
			  		<td><INPUT type="text" name="E03F830022" size="40" maxlength="70" value="<%=prMant03.getE03F830022()%>"><BR>  
			  </td>
			 	</tr>
			 	<tr>
			 		<td>Country of Residence :</td>
			  		<td><INPUT type="text" name="E03F830023" size="40" maxlength="2" value="<%=prMant03.getE03F830023()%>"><BR>  
			  </td>
			 	</tr>
			 	<tr>
			 		<td>Contact Name :</td>
			  		<td><textarea cols="80" rows="3" name="E03F830024" onkeyup="checkMaxLength(this, 140)" onblur="checkMaxLength(this, 140)"><%=prMant03.getE03F830024()%></textarea><BR>  
			  </td>
			 	</tr>
			 	<tr>
			 		<td>Contact Phone Number :</td>
			  		<td><INPUT type="text" name="E03F830025" size="40" maxlength="35" value="<%=prMant03.getE03F830025()%>"><BR>  
			  </td>
			 	</tr>
			 	<tr>
			 		<td>Contact Mobile Number :</td>
			  		<td><INPUT type="text" name="E03F830026" size="40" maxlength="35" value="<%=prMant03.getE03F830026()%>"><BR>  
			  </td>
			 	</tr>
			 	<tr>
			 		<td>Contact Fax Number :</td>
			  		<td><INPUT type="text" name="E03F830027" size="40" maxlength="35" value="<%=prMant03.getE03F830027()%>"><BR>  
			  </td>
			 	</tr>
			 	<tr>
			 		<td>Contact Electronic Address :</td>
			  		<td><textarea cols="80" rows="15" name="E03F830028" onkeyup="checkMaxLength(this, 2048);" onblur="checkMaxLength(this, 2048);"><%=prMant03.getE03F830028()%></textarea><BR>  
			  </td>
			 	</tr>
			 	<tr>
			 		<td>Contact other Information :</td>
			  		<td><INPUT type="text" name="E03F830029" size="40" maxlength="35" value="<%=prMant03.getE03F830029()%>"><BR></td>    
			 	</tr>
			  </table>  

		</td>
	</TR>
	    <TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="2" maxlength="1" value="B" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="5" maxlength="4" value="8350" readonly >
		</td>
		<td NOWRAP align="center" width="20%" valign="top">
			<INPUT type="text" size="31" maxlength="30" value="Remittance Beneficiary" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="2" maxlength="1" value="" >
		</td>
		<td NOWRAP align="left" width="65%" valign="top">     
			  <table>
			  	<tr>
			  		<td width="150">Name :</td>
			 	 	<td><textarea cols="80" rows="3" name="E03F835001" onkeyup="checkMaxLength(this, 140)" onblur="checkMaxLength(this, 140)"><%=prMant03.getE03F835001()%></textarea><BR>   		
			 </td>
			 	</tr>
			 	<tr>
			 		<td>Identification Type :</td>
			  		<td>
			  			<select name="E03F835002" onChange="iCode(this.value,'E03F835003')">
                    			<option value=" "> </option>
                    			<option value="OI" <% if(prMant03.getE03F835002().equals("OI")){ out.print("selected");} %> >Organization ID</option>
                    			<option value="PI" <% if(prMant03.getE03F835002().equals("PI")){ out.print("selected");} %> >Private ID</option>
                  		</select>
			  		<BR> 
			 </td>
			 	</tr>
			 	<tr>
			 		<td>Identification Code :</td>
			  		<td>
			  		<%if("OI".equals(prMant03.getE03F835002())){%>
			  			<select name="E03F835003">
                    			<option value="BANK" <% if(prMant03.getE03F835003().equals("BANK")){ out.print("selected");} %> >BANK</option>
                    			<option value="CUST" <% if(prMant03.getE03F835003().equals("CUST")){ out.print("selected");} %> >CUST</option>
                    			<option value="DUNS" <% if(prMant03.getE03F835003().equals("DUNS")){ out.print("selected");} %> >DUNS</option>
                    			<option value="EMPL" <% if(prMant03.getE03F835003().equals("EMPL")){ out.print("selected");} %> >EMPL</option>
                    			<option value="GS1G" <% if(prMant03.getE03F835003().equals("GS1G")){ out.print("selected");} %> >GS1G</option>
                    			<option value="PROP" <% if(prMant03.getE03F835003().equals("PROP")){ out.print("selected");} %> >PROP</option>
                     			<option value="SWBB" <% if(prMant03.getE03F835003().equals("SWBB")){ out.print("selected");} %> >SWBB</option>
                    			<option value="TXID" <% if(prMant03.getE03F835003().equals("TXID")){ out.print("selected");} %> >TXID</option>
                  		</select>
                  	<%}else if("PI".equals(prMant03.getE03F835002())){%>
                  		<select name="E03F835003">
                    			<option value="ARNU" <% if(prMant03.getE03F835003().equals("ARNU")){ out.print("selected");} %> >ARNU</option>
                    			<option value="CCPT" <% if(prMant03.getE03F835003().equals("CCPT")){ out.print("selected");} %> >CCPT</option>
                    			<option value="CUST" <% if(prMant03.getE03F835003().equals("CUST")){ out.print("selected");} %> >CUST</option>
                    			<option value="DPOB" <% if(prMant03.getE03F835003().equals("DPOB")){ out.print("selected");} %> >DPOB</option>
                    			<option value="DRLC" <% if(prMant03.getE03F835003().equals("DRLC")){ out.print("selected");} %> >DRLC</option>
                    			<option value="EMPL" <% if(prMant03.getE03F835003().equals("EMPL")){ out.print("selected");} %> >EMPL</option>
                     			<option value="NIDN" <% if(prMant03.getE03F835003().equals("NIDN")){ out.print("selected");} %> >NIDN</option>
                    			<option value="PROP" <% if(prMant03.getE03F835003().equals("PROP")){ out.print("selected");} %> >PROP</option>
              			        <option value="SOSE" <% if(prMant03.getE03F835003().equals("SOSE")){ out.print("selected");} %> >SOSE</option>
                    			<option value="TXID" <% if(prMant03.getE03F835003().equals("TXID")){ out.print("selected");} %> >TXID</option>
                  		</select>
                  		<%}else{%>
                  		<select name="E03F835003">
                    			<option value=" "> </option>
                  		</select>
                  		<%}%>
			  		<BR>    
			 </td>
			 	</tr>
			 	<tr>
			 		<td>Identification Number :</td>
			  		<td> <INPUT type="text" name="E03F835004" size="40" maxlength="35" value="<%=prMant03.getE03F835004()%>"><BR> 
			 </td>
			 	</tr>
			 	<tr>
			 		<td>Identification Number Issuer :</td>
			  		<td> <INPUT type="text" name="E03F835005" size="40" maxlength="35" value="<%=prMant03.getE03F835005()%>"><BR> 
			 </td>
			 	</tr>
			 	<tr>
			 		<td>Date &amp; Place of Birth :</td>
			  		<td> <INPUT type="text" name="E03F835006" size="40" maxlength="82" value="<%=prMant03.getE03F835006()%>"><BR>    
			 </td>
			 	</tr>
			 	<tr>
			 		<td>Address Type :</td>
			  		<td>
			  		    <select name="E03F835007">
                    			<option value="ADDR" <% if(prMant03.getE03F835007().equals("ADDR")){ out.print("selected");} %> >ADDR</option>
                    			<option value="BIZZ" <% if(prMant03.getE03F835007().equals("BIZZ")){ out.print("selected");} %> >BIZZ</option>
                    			<option value="DLVY" <% if(prMant03.getE03F835007().equals("DLVY")){ out.print("selected");} %> >DLVY</option>
                    			<option value="HOME" <% if(prMant03.getE03F835007().equals("HOME")){ out.print("selected");} %> >HOME</option>
                    			<option value="MLTO" <% if(prMant03.getE03F835007().equals("MLTO")){ out.print("selected");} %> >MLTO</option>
                    			<option value="PBOX" <% if(prMant03.getE03F835007().equals("EMPL")){ out.print("selected");} %> >PBOX</option>
                  		</select>
			  		<BR>  
			 </td>
			 	</tr>
			 	<tr>
			 		<td>Department :</td>
			  		<td> <INPUT type="text" name="E03F835008" size="40" maxlength="70" value="<%=prMant03.getE03F835008()%>"><BR>  
			 </td>
			 	</tr>
			 	<tr>
			 		<td>Sub-Department :</td>
			  		<td> <INPUT type="text" name="E03F835009" size="40" maxlength="70" value="<%=prMant03.getE03F835009()%>"><BR>  
			 </td>
			 	</tr>
			 	<tr>
			 		<td>Street Name :</td>
			  		<td> <INPUT type="text" name="E03F835010" size="40" maxlength="70" value="<%=prMant03.getE03F835010()%>"><BR>  
			 </td>
			 	</tr>
			 	<tr>
			 		<td>Building Number :</td>
			  		<td> <INPUT type="text" name="E03F835011" size="40" maxlength="16" value="<%=prMant03.getE03F835011()%>"><BR>  
			 </td>
			 	</tr>
			 	<tr>
			 		<td>Post Code :</td>
			  		<td> <INPUT type="text" name="E03F835012" size="40" maxlength="16" value="<%=prMant03.getE03F835012()%>"><BR>  
			 </td>
			 	</tr>
			 	<tr>
			 		<td>Town Name :</td>
			  		<td> <INPUT type="text" name="E03F835013" size="40" maxlength="35" value="<%=prMant03.getE03F835013()%>"><BR>  
			 </td>
			 	</tr>
			 	<tr>
			 		<td>Contry Sub Division/State :</td>
			  		<td> <INPUT type="text" name="E03F835014" size="40" maxlength="35" value="<%=prMant03.getE03F835014()%>"><BR>  
			 </td>
			 	</tr>
			 	<tr>
			 		<td>Country :</td>
			  		<td> <INPUT type="text" name="E03F835015" size="40" maxlength="2" value="<%=prMant03.getE03F835015()%>"><BR>  
			 </td>
			 	</tr>
			 	<tr>
			 		<td>Address Line 1 :</td>
			  		<td> <INPUT type="text" name="E03F835016" size="40" maxlength="70" value="<%=prMant03.getE03F835016()%>"><BR>  
			 </td>
			 	</tr>
			 	<tr>
			 		<td>Address Line 2 :</td>
			  		<td> <INPUT type="text" name="E03F835017" size="40" maxlength="70" value="<%=prMant03.getE03F835017()%>"><BR>  
			 </td>
			 	</tr>
			 	<tr>
			 		<td>Address Line 3 :</td>
			  		<td> <INPUT type="text" name="E03F835018" size="40" maxlength="70" value="<%=prMant03.getE03F835018()%>"><BR>  
			 </td>
			 	</tr>
			 	<tr>
			 		<td>Address Line 4 :</td>
			  		<td> <INPUT type="text" name="E03F835019" size="40" maxlength="70" value="<%=prMant03.getE03F835019()%>"><BR>  
			 </td>
			 	</tr>
			 	<tr>
			 		<td>Address Line 5 :</td>
			  		<td> <INPUT type="text" name="E03F835020" size="40" maxlength="70" value="<%=prMant03.getE03F835020()%>"><BR>  
			 </td>
			 	</tr>
			 	<tr>
			 		<td>Address Line 6 :</td>
			  		<td> <INPUT type="text" name="E03F835021" size="40" maxlength="70" value="<%=prMant03.getE03F835021()%>"><BR>  
			 </td>
			 	</tr>
			 	<tr>
			 		<td>Address Line 7 :</td>
			  		<td> <INPUT type="text" name="E03F835022" size="40" maxlength="70" value="<%=prMant03.getE03F835022()%>"><BR>  
			 </td>
			 	</tr>
			 	<tr>
			 		<td>Country of Residence :</td>
			  		<td> <INPUT type="text" name="E03F835023" size="40" maxlength="2" value="<%=prMant03.getE03F835023()%>"><BR></td>    
			 	</tr>
			  </table>  			
		</td>
	</TR>
	
	<TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="2" maxlength="1" value="B" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="5" maxlength="4" value="8400" readonly >
		</td>
		<td NOWRAP align="center" width="20%" valign="top">
			<INPUT type="text" size="31" maxlength="30" value="Primary Remittance Document " readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="2" maxlength="1" value="" >
		</td>
		<td NOWRAP align="left" width="65%" valign="top">     
			  <table>
			  	<tr>
			  		<td width="150">Document Type Code :</td>
			 	 	<td>
			 	 		<select name="E03F840001">
			 	 		        <option value=" " <% if("".equals(prMant03.getE03F840001().trim())){ out.print("selected");} %> > </option>
                    			<option value="AROI" <% if(prMant03.getE03F840001().equals("AROI")){ out.print("selected");} %> >AROI</option>
                    			<option value="BOLD" <% if(prMant03.getE03F840001().equals("BOLD")){ out.print("selected");} %> >BOLD</option>
                    			<option value="CINV" <% if(prMant03.getE03F840001().equals("CINV")){ out.print("selected");} %> >CINV</option>
                    			<option value="CMCN" <% if(prMant03.getE03F840001().equals("CMCN")){ out.print("selected");} %> >CMCN</option>
                    			<option value="CNFA" <% if(prMant03.getE03F840001().equals("CNFA")){ out.print("selected");} %> >CNFA</option>                    			<option value="CREN" <% if(prMant03.getE03F840001().equals("CREN")){ out.print("selected");} %> >CREN</option>
                    			<option value="DEBN" <% if(prMant03.getE03F840001().equals("DEBN")){ out.print("selected");} %> >DEBN</option>
                    			<option value="DISP" <% if(prMant03.getE03F840001().equals("DISP")){ out.print("selected");} %> >DISP</option>
                    			<option value="DNFA" <% if(prMant03.getE03F840001().equals("DNFA")){ out.print("selected");} %> >DNFA</option>
                    			<option value="HIRI" <% if(prMant03.getE03F840001().equals("HIRI")){ out.print("selected");} %> >HIRI</option>
                    			<option value="MSIN" <% if(prMant03.getE03F840001().equals("MSIN")){ out.print("selected");} %> >MSIN</option>
                    			<option value="PROP" <% if(prMant03.getE03F840001().equals("PROP")){ out.print("selected");} %> >PROP</option>
                    			<option value="PUOR" <% if(prMant03.getE03F840001().equals("PUOR")){ out.print("selected");} %> >PUOR</option>
                    			<option value="SBIN" <% if(prMant03.getE03F840001().equals("SBIN")){ out.print("selected");} %> >SBIN</option>
                    			<option value="SOAC" <% if(prMant03.getE03F840001().equals("SOAC")){ out.print("selected");} %> >SOAC</option>
		                    	<option value="TSUT" <% if(prMant03.getE03F840001().equals("TSUT")){ out.print("selected");} %> >TSUT</option>
								<option value="VCHR" <% if(prMant03.getE03F840001().equals("VCHR")){ out.print("selected");} %> >VCHR</option>
                  		</select>
           
			 	 	<BR> 
			 </td>
			 	</tr>
			 	<tr>
			 		<td>Propietary Document Type Code :</td>
			  		<td> <INPUT type="text" name="E03F840002" size="40" maxlength="35" value="<%=prMant03.getE03F840002()%>"><BR> 
			 </td>
			 	</tr>
			 	<tr>
			 		<td>Document Identification Number :</td>
			  		<td> <INPUT type="text" name="E03F840003" size="40" maxlength="35" value="<%=prMant03.getE03F840003()%>"><BR>  
			 </td>
			 	</tr>
			 	<tr>
			 		<td>Issuer :</td>
			  		<td> <INPUT type="text" name="E03F840004" size="40" maxlength="35" value="<%=prMant03.getE03F840004()%>"><BR></td>    
			 	</tr>
			  </table>   
		</td>
	</TR>
	<TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="2" maxlength="1" value="B" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="5" maxlength="4" value="8450" readonly >
		</td>
		<td NOWRAP align="center" width="20%" valign="top">
			<INPUT type="text" size="31" maxlength="30" value="Actual Amount Paid" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="2" maxlength="1" value="" >
		</td>
		<td NOWRAP align="left" width="65%" valign="top">     
			  <table>
			  	<tr>
			  		<td width="150">Currency Code :</td>
			 	 	<td><INPUT type="text" name="E03F845001" size="4" maxlength="3" value="<%=prMant03.getE03F845001()%>">
			 	 	<a href="javascript:GetCurrency('E03F845001','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0"></a>
			 	 	<BR> 
			 </td>
			 	</tr>
			 	<tr>
			 		<td>Amount :</td>
			  		<td> <INPUT type="text" name="E03F845002" size="21" maxlength="21" value="<%=prMant03.getE03F845002()%>" onKeyPress="enterDecimal()"><BR>
			  		</td>
			  	</tr>
			  </table>
		</td>
	</TR>
	
  </TABLE>
</div>


<div id="sect04" <%="Y".equals(showSect04)?"":"style=\"display:none\""%>>
<h4>Related Remittance Information (CTP-RRMT)</h4>

<TABLE class="tableinfo" id="dataTable">
    
    <TR id=trdark>
		<td NOWRAP align="center" width="5%"><b>Seq</b></td>
		<td NOWRAP align="center" width="5%"><b>TAG</b></td>
		<td NOWRAP align="center" width="20%"><b>Description</b></td>
		<td NOWRAP align="center" width="5%"><b>Option</b></td>
		<td NOWRAP align="left" width="65%"><b>Field</b></td>
	</TR> 
	
    <TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="2" maxlength="1" value="B" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="5" maxlength="4" value="8250" readonly >
		</td>
		<td NOWRAP align="center" width="20%" valign="top">
			<INPUT type="text" size="31" maxlength="30" value="Related Remittance Information " readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="2" maxlength="1" value="" >
		</td>
		<td NOWRAP align="left" width="65%" valign="top">     
			  <table>
			  	<tr>
			  		<td width="150">Remittance Identification :</td>
			 	 	<td><INPUT type="text" name="E04F825001" size="40" maxlength="35" value="<%=prMant04.getE04F825001()%>"><BR> 
			 </td>
			 	</tr>
			 	<tr>
			 		<td>Remittance Location Method :</td>
			  		<td>
			  			<select name="E04F825002">
                    			<option value="EDIC" <% if(prMant04.getE04F825002().equals("EDIC")){ out.print("selected");} %> >EDIC</option>
                    			<option value="EMAL" <% if(prMant04.getE04F825002().equals("EMAL")){ out.print("selected");} %> >EMAL</option>
                    			<option value="FAXI" <% if(prMant04.getE04F825002().equals("FAXI")){ out.print("selected");} %> >FAXI</option>
                    			<option value="POST" <% if(prMant04.getE04F825002().equals("POST")){ out.print("selected");} %> >POST</option>
                    			<option value="SMSM" <% if(prMant04.getE04F825002().equals("SMSM")){ out.print("selected");} %> >SMSM</option>
                    			<option value="CNFA" <% if(prMant04.getE04F825002().equals("CNFA")){ out.print("selected");} %> >CNFA</option>
                    			<option value="URID" <% if(prMant04.getE04F825002().equals("URID")){ out.print("selected");} %> >URID</option>
                  		</select>
						<BR>   
			 </td>
			 	</tr>
			 	<tr>
			 		<td>Remittance Location Electronic Address :</td>
			  		<td> <textarea cols="80" rows="15" name="E04F825003" onkeyup="checkMaxLength(this, 2048);" onblur="checkMaxLength(this, 2048);"><%=prMant04.getE04F825003()%></textarea><BR>    
			 </td>
			 	</tr>
			 	<tr>
			 		<td>Name :</td>
			  		<td> <textarea cols="80" rows="3" name="E04F825004" onkeyup="checkMaxLength(this, 140)" onblur="checkMaxLength(this, 140)"><%=prMant04.getE04F825004()%></textarea><BR>   		
			 </td>
			 	</tr>
			 	<tr>
			 		<td>Address Type :</td>
			  		<td> <INPUT type="text" name="E04F825005" size="5" maxlength="4" value="<%=prMant04.getE04F825005()%>"><BR>   
			 </td>
			 	</tr>
			 	<tr>
			 		<td>Department :</td>
			  		<td> <INPUT type="text" name="E04F825006" size="40" maxlength="70" value="<%=prMant04.getE04F825006()%>"><BR>   
			 </td>
			 	</tr>
			 	<tr>
			 		<td>Sub-Department :</td>
			  		<td> <INPUT type="text" name="E04F825007" size="40" maxlength="70" value="<%=prMant04.getE04F825007()%>"><BR>   
			 </td>
			 	</tr>
			 	<tr>
			 		<td>Street Name :</td>
			  		<td> <INPUT type="text" name="E04F825008" size="40" maxlength="70" value="<%=prMant04.getE04F825008()%>"><BR>   
			 </td>
			 	</tr>
			 	<tr>
			 		<td>Building Number :</td>
			  		<td> <INPUT type="text" name="E04F825009" size="40" maxlength="16" value="<%=prMant04.getE04F825009()%>"><BR>   
			 </td>
			 	</tr>
			 	<tr>
			 		<td>Post Code :</td>
			  		<td> <INPUT type="text" name="E04F825010" size="40" maxlength="16" value="<%=prMant04.getE04F825010()%>"><BR>   
			 </td>
			 	</tr>
			 	<tr>
			 		<td>Town Name :</td>
			  		<td> <INPUT type="text" name="E04F825011" size="40" maxlength="35" value="<%=prMant04.getE04F825011()%>"><BR>   
			 </td>
			 	</tr>
			 	<tr>
			 		<td>Country Sub Division/State :</td>
			  		<td> <INPUT type="text" name="E04F825012" size="40" maxlength="35" value="<%=prMant04.getE04F825012()%>"><BR>   
			 </td>
			 	</tr>
			 	<tr>
			 		<td>Country :</td>
			  		<td> <INPUT type="text" name="E04F825013" size="3" maxlength="2" value="<%=prMant04.getE04F825013()%>"><BR>   
			 </td>
			 	</tr>
			 	<tr>
			 		<td>Address Line 1 :</td>
			  		<td> <INPUT type="text" name="E04F825015" size="40" maxlength="70" value="<%=prMant04.getE04F825015()%>"><BR>   
			 </td>
			 	</tr>
			 	<tr>
			 		<td>Address Line 2 :</td>
			  		<td> <INPUT type="text" name="E04F825016" size="40" maxlength="70" value="<%=prMant04.getE04F825016()%>"><BR>   
			  </td>
			 	</tr>
			 	<tr>
			 		<td>Address Line 3 :</td>
			  		<td><INPUT type="text" name="E04F825017" size="40" maxlength="70" value="<%=prMant04.getE04F825017()%>"><BR>   
			  </td>
			 	</tr>
			 	<tr>
			 		<td>Address Line 4 :</td>
			  		<td><INPUT type="text" name="E04F825018" size="40" maxlength="70" value="<%=prMant04.getE04F825018()%>"><BR>   
			  </td>
			 	</tr>
			 	<tr>
			 		<td>Address Line 5 :</td>
			  		<td><INPUT type="text" name="E04F825019" size="40" maxlength="70" value="<%=prMant04.getE04F825019()%>"><BR>   
			  </td>
			 	</tr>
			 	<tr>
			 		<td>Address Line 6 :</td>
			  		<td><INPUT type="text" name="E04F825020" size="40" maxlength="70" value="<%=prMant04.getE04F825020()%>"><BR>   
			  </td>
			 	</tr>
			 	<tr>
			 		<td>Address Line 7 :</td>
			  		<td><INPUT type="text" name="E04F825021" size="40" maxlength="70" value="<%=prMant04.getE04F825021()%>"><BR></td>    
			 	</tr>
			  </table>   
		</td>
	</TR>
  </TABLE>
</div>


<div id="sect05" <%="Y".equals(showSect05)?"":"style=\"display:none\""%>>
<h4>Unstructured Addenda Information (CTP-{ANSI, GXML, IXML, NARR, 
S820, SWIF or UEDI})</h4>

<TABLE class="tableinfo" id="dataTable">
    
    <TR id=trdark>
		<td NOWRAP align="center" width="5%"><b>Seq</b></td>
		<td NOWRAP align="center" width="5%"><b>TAG</b></td>
		<td NOWRAP align="center" width="20%"><b>Description</b></td>
		<td NOWRAP align="center" width="5%"><b>Option</b></td>
		<td NOWRAP align="left" width="65%"><b>Field</b></td>
	</TR> 
	
    <TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="2" maxlength="1" value="B" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="5" maxlength="4" value="8200" readonly >
		</td>
		<td NOWRAP align="center" width="20%" valign="top">
			<INPUT type="text" size="31" maxlength="30" value="Unstructured Addenda Information " readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="2" maxlength="1" value="" >
		</td>
		<td NOWRAP align="left" width="65%" valign="top">     
			  <table>
			  	<tr>
			  	<td>Addenda Length :</td>
			  	<td>
			  	  <INPUT type="text" name="E05F820001" size="5" maxlength="4" value="<%="0".equals(prMant05.getE05F820001().trim()) && !"".equals(prMant05.getE05F820001().trim())?String.valueOf(prMant05.getE05F820001().length()):prMant05.getE05F820001() %>" onKeyPress="enterInteger()" readonly><BR> 
			  	</td></tr>
			  	<tr>
			  		<td>Addenda Information :</td>
			 	 	<td><textarea cols="80" rows="15" name="E05F820002" onkeyup="checkMaxLength(this, 8994);showLength(this,'E05F820001');" onblur="checkMaxLength(this, 8994);showLength(this,'E05F820001');"><%=prMant05.getE05F820002()%></textarea><BR></td>    
			 	</tr>
			  </table>  
		</td>
	</TR>
  </TABLE>
</div>


<div id="sect06" <%="Y".equals(showSect06)?"":"style=\"display:none\""%>>
<h4>Additional Information</h4>

<TABLE class="tableinfo" id="dataTable">
    
    <TR id=trdark>
		<td NOWRAP align="center" width="5%"><b>Seq</b></td>
		<td NOWRAP align="center" width="5%"><b>TAG</b></td>
		<td NOWRAP align="center" width="20%"><b>Description</b></td>
		<td NOWRAP align="center" width="5%"><b>Option</b></td>
		<td NOWRAP align="left" width="65%"><b>Field</b></td>
	</TR> 
    <TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="2" maxlength="1" value="B" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="5" maxlength="4" value="3610" readonly >
		</td>
		<td NOWRAP align="center" width="20%" valign="top">
			<INPUT type="text" size="31" maxlength="30" value="Local Instrument Propietary Code" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="2" maxlength="1" value="" >
		</td>
		<td NOWRAP align="left" width="65%" valign="top">   
		     <table>
			  	<tr>
			  		<td width="150">Propietary Code :</td>
			  		<td>
			  		<INPUT type="text" name="E06F361002" size="40" maxlength="35" value="<%=prMant06.getE06F361002()%>"><BR></td>    
			 	</tr>
			  </table>
		</td>
	</TR>
   <TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="2" maxlength="1" value="B" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="5" maxlength="4" value="3620" readonly >
		</td>
		<td NOWRAP align="center" width="20%" valign="top">
			<INPUT type="text" size="31" maxlength="30" value="Payment Notification" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="2" maxlength="1" value="" >
		</td>
		<td NOWRAP align="left" width="65%" valign="top">     
			  <table>
			  	<tr>
			  		<td width="150">Payment Notification Indicator :</td>
			 	 	<td><INPUT type="text" name="E06F362001" size="2" maxlength="1" value="<%=prMant06.getE06F362001()%>"><BR> 
			  </td>
			 	</tr>
			 	<tr>
			 		<td>Contact Notification Electronic Address :</td>
			  		<td><textarea cols="80" rows="15" name="E06F362002" onkeyup="checkMaxLength(this, 2048);" onblur="checkMaxLength(this, 2048);"><%=prMant06.getE06F362002()%></textarea><BR>  
			  </td>
			 	</tr>
			 	<tr>
			 		<td>Contact Name :</td>
			  		<td><textarea cols="80" rows="3" name="E06F362003" onkeyup="checkMaxLength(this, 140);" onblur="checkMaxLength(this, 140);"><%=prMant06.getE06F362003()%></textarea><BR>  
			  </td>
			 	</tr>
			 	<tr>
			 		<td>Contact Phone Number :</td>
			  		<td><INPUT type="text" name="E06F362004" size="40" maxlength="35" value="<%=prMant06.getE06F362004()%>"><BR> 
			  </td>
			 	</tr>
			 	<tr>
			 		<td>Contact Mobile Number :</td>
			  		<td><INPUT type="text" name="E06F362005" size="40" maxlength="35" value="<%=prMant06.getE06F362005()%>"><BR> 
			  </td>
			 	</tr>
			 	<tr>
			 		<td>Contact Fax Number :</td>
			  		<td><INPUT type="text" name="E06F362006" size="40" maxlength="35" value="<%=prMant06.getE06F362006()%>"><BR> 
			  </td>
			 	</tr>
			 	<tr>
			 		<td>End-to-End Identification :</td>
			  		<td><INPUT type="text" name="E06F362007" size="40" maxlength="35" value="<%=prMant06.getE06F362007()%>"><BR></td>    
			 	</tr>
			  </table> 
		</td>
	</TR>
	<TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="2" maxlength="1" value="B" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="5" maxlength="4" value="5010" readonly >
		</td>
		<td NOWRAP align="center" width="20%" valign="top">
			<INPUT type="text" size="31" maxlength="30" value="Originator Option F" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="2" maxlength="1" value="" >
		</td>
		<td NOWRAP align="left" width="65%" valign="top">   
		     <table>
			  	<tr>
			  		<td width="150">Party Identifier :</td>
			  		<td>
			  		<INPUT type="text" name="E06F501001" size="40" maxlength="35" value="<%=prMant06.getE06F501001()%>"><a href="javascript:GetCode('E06F501001','STATIC_pr_fed_5010_party_identifier.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a><BR></td>    
			 	</tr>
			 	<tr>
			  		<td width="150">Name :</td>
			  		<td>
			  		<INPUT type="text" name="E06F501002" size="40" maxlength="35" value="<%=!"".equals(prMant06.getE06F501001().trim()) && "".equals(prMant06.getE06F501002().trim())?"1/":prMant06.getE06F501002()%>"><BR></td>    
			 	</tr>
			 	<tr>
			  		<td width="150">Line 1 :</td>
			  		<td>
			  		<INPUT type="text" name="E06F501003" size="40" maxlength="35" value="<%=prMant06.getE06F501003()%>"><a href="javascript:GetCode('E06F501003','STATIC_pr_fed_5010_line.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a><BR></td>    
			 	</tr>
			 	<tr>
			  		<td width="150">Line 2 :</td>
			  		<td>
			  		<INPUT type="text" name="E06F501004" size="40" maxlength="35" value="<%=prMant06.getE06F501004()%>"><a href="javascript:GetCode('E06F501004','STATIC_pr_fed_5010_line.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a><BR></td>    
			 	</tr>
			 	<tr>
			  		<td width="150">Line 3 :</td>
			  		<td>
			  		<INPUT type="text" name="E06F501005" size="40" maxlength="35" value="<%=prMant06.getE06F501005()%>"><a href="javascript:GetCode('E06F501005','STATIC_pr_fed_5010_line.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a><BR></td>    
			 	</tr>
			  </table>
		</td>
	</TR>
	<TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="2" maxlength="1" value="B" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="5" maxlength="4" value="6100" readonly >
		</td>
		<td NOWRAP align="center" width="20%" valign="top">
			<INPUT type="text" size="31" maxlength="30" value="Receiver FI Information  " readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="2" maxlength="1" value="" >
		</td>
		<td NOWRAP align="left" width="65%" valign="top">     
			  <table>
			  	<tr>
			  		<td width="150"></td>
			 	 	<td><INPUT type="text" name="E06F610001" size="40" maxlength="30" value="<%=prMant06.getE06F610001()%>"><BR>    
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E06F610002" size="40" maxlength="33" value="<%=prMant06.getE06F610002()%>"><BR>    
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E06F610003" size="40" maxlength="33" value="<%=prMant06.getE06F610003()%>"><BR>    
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E06F610004" size="40" maxlength="33" value="<%=prMant06.getE06F610004()%>"><BR>    
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E06F610005" size="40" maxlength="33" value="<%=prMant06.getE06F610005()%>"><BR>    
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E06F610006" size="40" maxlength="33" value="<%=prMant06.getE06F610006()%>"><BR></td>    
			 	</tr>
			  </table>    
		</td>
	</TR>
	    <TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="2" maxlength="1" value="B" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="5" maxlength="4" value="6200" readonly >
		</td>
		<td NOWRAP align="center" width="20%" valign="top">
			<INPUT type="text" size="31" maxlength="30" value="Intermediary FI Information" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="2" maxlength="1" value="" >
		</td>
		<td NOWRAP align="left" width="65%" valign="top">     
			  <table>
			  	<tr>
			  		<td width="150"></td>
			 	 	<td><INPUT type="text" name="E06F620001" size="40" maxlength="30" value="<%=prMant06.getE06F620001()%>"><BR>   
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E06F620002" size="40" maxlength="33" value="<%=prMant06.getE06F620002()%>"><BR>   
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E06F620003" size="40" maxlength="33" value="<%=prMant06.getE06F620003()%>"><BR>   
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E06F620004" size="40" maxlength="33" value="<%=prMant06.getE06F620004()%>"><BR>   
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E06F620005" size="40" maxlength="33" value="<%=prMant06.getE06F620005()%>"><BR>   
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E06F620006" size="40" maxlength="33" value="<%=prMant06.getE06F620006()%>"><BR></td>    
			 	</tr>
			  </table>   
		</td>
	</TR>	
	<TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="2" maxlength="1" value="B" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="5" maxlength="4" value="6210" readonly >
		</td>
		<td NOWRAP align="center" width="20%" valign="top">
			<INPUT type="text" size="31" maxlength="30" value="Intermediary FI Advice Information  " readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="2" maxlength="1" value="" >
		</td>
		<td NOWRAP align="left" width="65%" valign="top">     
			  <table>
			  	<tr>
			  		<td width="150">Advice Code :</td>
			 	 	<td>
			 	 		<select name="E06F621001">
                    		    <option value=" "> </option> 
                    			<option value="LTR" <% if(prMant06.getE06F621001().equals("LTR")){ out.print("selected");} %> >LTR</option>
                    			<option value="PHN" <% if(prMant06.getE06F621001().equals("PHN")){ out.print("selected");} %> >PHN</option>
                    			<option value="TLX" <% if(prMant06.getE06F621001().equals("TLX")){ out.print("selected");} %> >TLX</option>
                    			<option value="WRE" <% if(prMant06.getE06F621001().equals("WRE")){ out.print("selected");} %> >WRE</option>
                    			<option value="HLD" <% if(prMant06.getE06F621001().equals("HLD")){ out.print("selected");} %> >HLD</option>
                  		</select>
			 	 	<BR>   
			  </td>
			 	</tr>
			 	<tr>
			 		<td>Additional Information :</td>
			  		<td><INPUT type="text" name="E06F621002" size="40" maxlength="26" value="<%=prMant06.getE06F621002()%>"><BR>   
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E06F621003" size="40" maxlength="33" value="<%=prMant06.getE06F621003()%>"><BR>   
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E06F621004" size="40" maxlength="33" value="<%=prMant06.getE06F621004()%>"><BR>   
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E06F621005" size="40" maxlength="33" value="<%=prMant06.getE06F621005()%>"><BR>   
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E06F621006" size="40" maxlength="33" value="<%=prMant06.getE06F621006()%>"><BR>   
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E06F621007" size="40" maxlength="33" value="<%=prMant06.getE06F621007()%>"><BR></td>    
			 	</tr>
			  </table>  
		</td>
	</TR>
	<TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="2" maxlength="1" value="B" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="5" maxlength="4" value="6410" readonly >
		</td>
		<td NOWRAP align="center" width="20%" valign="top">
			<INPUT type="text" size="31" maxlength="30" value="Beneficiary Advice Information" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="2" maxlength="1" value="" >
		</td>
		<td NOWRAP align="left" width="65%" valign="top">     
			  <table>
			  	<tr>
			  		<td width="150">Advice Code :</td>
			 	 	<td>
			 	 		<select name="E06F641001">
                    		    <option value=" "> </option> 
                    			<option value="LTR" <% if(prMant06.getE06F641001().equals("LTR")){ out.print("selected");} %> >LTR</option>
                    			<option value="PHN" <% if(prMant06.getE06F641001().equals("PHN")){ out.print("selected");} %> >PHN</option>
                    			<option value="TLX" <% if(prMant06.getE06F641001().equals("TLX")){ out.print("selected");} %> >TLX</option>
                    			<option value="WRE" <% if(prMant06.getE06F641001().equals("WRE")){ out.print("selected");} %> >WRE</option>
                    			<option value="HLD" <% if(prMant06.getE06F641001().equals("HLD")){ out.print("selected");} %> >HLD</option>
                  		</select>
			 	 	<BR>   
			  </td>
			 	</tr>
			 	<tr>
			 		<td>Additional Information :</td>
			  		<td><INPUT type="text" name="E06F641002" size="40" maxlength="26" value="<%=prMant06.getE06F641002()%>"><BR>  
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E06F641003" size="40" maxlength="33" value="<%=prMant06.getE06F641003()%>"><BR>  
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E06F641004" size="40" maxlength="33" value="<%=prMant06.getE06F641004()%>"><BR>  
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E06F641005" size="40" maxlength="33" value="<%=prMant06.getE06F641005()%>"><BR>  
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E06F641006" size="40" maxlength="33" value="<%=prMant06.getE06F641006()%>"><BR>  
			  </td>
			 	</tr>
			 	<tr>
			 		<td></td>
			  		<td><INPUT type="text" name="E06F641007" size="40" maxlength="33" value="<%=prMant06.getE06F641007()%>"><BR></td>    
			 	</tr>
			  </table>    
		</td>
	</TR>
	<TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="2" maxlength="1" value="B" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="5" maxlength="4" value="6420" readonly >
		</td>
		<td NOWRAP align="center" width="20%" valign="top">
			<INPUT type="text" size="31" maxlength="30" value="Method of Payment to Beneficiary " readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" size="2" maxlength="1" value="" >
		</td>
		<td NOWRAP align="left" width="65%" valign="top">     
			  <table>
			  <tr>
			  		<td width="150">Method of Payment :</td>
			 	 	<td><INPUT type="text" name="E06F642001" size="6" maxlength="5" value="<%=prMant06.getE06F642001()%>"><BR>   
			  </td>
			  </tr>
			  <tr>
			  		<td>Additional Information :</td>
			  		<td><INPUT type="text" name="E06F642002" size="40" maxlength="30" value="<%=prMant06.getE06F642002()%>"><BR></td>    
			  </tr>
			  </table>   
		</td>
	</TR>
  </TABLE>
</div>

<BR>
<h4 style="text-align:center"><input type="checkbox" name="H01FLGWK2" value="A" <% if(prMant.getH01FLGWK2().equals("A")){ out.print("checked");} %>>
      Accept with Warnings</h4>

  <div id="LoanOpt" style="display:none"></div>
<p align="center">
    <input class="EIBSBTN" type=button name="Submit" value="Submit" onClick="javascript:goSubmit();">
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
