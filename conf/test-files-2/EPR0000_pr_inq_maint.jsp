<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Internal/External Transfers</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import = "datapro.eibs.master.*" %>

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
<script language="Javascript" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>
<script language="Javascript" src="<%=request.getContextPath()%>/pages/e/javascripts/jquery.jsp"></script>
<script language="Javascript" src="<%=request.getContextPath()%>/pages/e/javascripts/wireTransfers.js"> </SCRIPT>

<SCRIPT Language="Javascript">
  
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
 
	function showPdf() {
		CenterWindow('<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPR0000?SCREEN=7',600,500,4);
	}

	<% if (!userPO.getPurpose().equals("INQTRANSF")) {%>
    builtNewMenu(pr_inq_opt);
	initMenu();
    <%}%>
 
</SCRIPT>
</head>

<body>


<% 
	int row = 0;
	
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center">Financial Transaction<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="pr_inq_maint.jsp,EPR0000"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPR0000" >

  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap > 
                  <div align="right">Type :</div>
            </td>
              <td nowrap align="left">
			  <div align="left"> 
                <input type="hidden" name="E01PRITTP" size="2" maxlength="2" value="<%= prMant.getE01PRITTP().trim()%>">
                  
                <input type="text" readonly    name="TypeDesc" size="35" maxlength="35" value="<% if(prMant.getE01PRITTP().trim().equals("IW")){out.print("External Incoming");}
				   else if(prMant.getE01PRITTP().trim().equals("OW")){out.print("External Outgoing"); }
				   else if(prMant.getE01PRITTP().trim().equals("IT")){out.print("Internal Transfer"); }
				   else if(prMant.getE01PRITTP().trim().equals("IA")){out.print("Interest Adjustment"); }
                   else if(prMant.getE01PRITTP().trim().equals("IP")){out.print("Interest Payment"); }
                   else if(prMant.getE01PRITTP().trim().equals("RP")){out.print("Reversal of Penalty"); }
                   else if(prMant.getE01PRITTP().trim().equals("LP")){out.print("Loan Payment"); }
                   else if(prMant.getE01PRITTP().trim().equals("MR")){out.print("Miscellaneus Reversal"); }
                   else if(prMant.getE01PRITTP().trim().equals("MP")){out.print("Miscellaneus Adjustment"); }
				   else {out.print(" ");}%>" >
              </div>
            </td>
              <td nowrap> 
                <div align="right">Payment Via :</div>
              </td>
              <td nowrap > 
                    <select id="paymentVia" name="E01PRIPVI" disabled>
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
            <td nowrap colspan="3"> 
            </td>
          </tr>
          <tr id="externalType" class="trdark">
            	<td nowrap align="right">Reference No.:
                </td>
                <td nowrap align="left">
                <input type="text" readonly    name="E01PRINUM" size="11" maxlength="10" value="<%= prMant.getE01PRINUM().trim()%>" >
                </td>
            	<td nowrap align="right">Channel :
                </td>
                <td nowrap align="left">
                <input type="text" readonly  name="E01PRIDSQ" size="11" maxlength="10" value="<%= prMant.getE01PRIDSQ().trim()%>" >
                </td>
		  </tr>
		  <% if(!("".equals(prMant.getE01TAG121().trim()))){ %>
		  <tr class="trdark">
		  	<td nowrap align="right"> UETR : </td>
		  	<td colspan="3">
		  		<input type="text" size="50" readonly="readonly" value="<%=prMant.getE01TAG121().trim() %>" style="text-transform:none !important"  />
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
                <b>Originator</b>
					<SELECT id="SWF_50" name="SWF_50" class="swf_field_50" disabled="disabled">
						<OPTION value="K" <% if (!(prMant.getE01PRIORO().equals("A") || prMant.getE01PRIORO().equals("F"))) out.print("selected"); %>>K</OPTION>
						<OPTION value="A" <% if(prMant.getE01PRIORO().equals("A")) out.print("selected");%>>A</OPTION>
						<OPTION value="F" <% if(prMant.getE01PRIORO().equals("F")) out.print("selected");%>>F</OPTION>
					</SELECT> 
            </td>
            <td nowrap> 
                <div align="center"><b>Customer Number</b></div>
            </td>
            <td nowrap colspan="2" align="center">  
                <b>Beneficiary </b>
             		<select id="SWF_59" name="SWF_59" class="swf_field_59" disabled="disabled">
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
	          		<select name="SWF_50F_1_1" id="SWF_50F_1_1" class="swf_field_50" disabled="disabled" dir="rtl"
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
                <input readonly="readonly" type="text" id="SWF_50F_1_2" name="SWF_50F_1_2" size="6" maxlength="5" 
                	value="<%= cpos1 > -1 && cpos2 > cpos1 ? prMant.getE11PRIORC().substring(cpos1+1, cpos2-1) :  "" %>">
                <input readonly="readonly" type="text" id="SWF_50F_1_3" name="SWF_50F_1_3" class="swf_field_50" size="30" maxlength="27" 
                	value="<%= prMant.getE11PRIORC().substring(cpos2) %>" style="display:<%=prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>">
             	</span>
                <input readonly="readonly" type="text" id="SWF_50K_1_1" name="E11PRIORC_1" class="swf_field_50" size="45" maxlength="35" 
                	value="<%= prMant.getE11PRIORC() %>" style="display:<%=!prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>">
				<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0">
			</td>
            <td nowrap width="5%"> 
              <div align="center">
                <input type="text" id="E01PRIOCU" name="E01PRIOCU" size="10" maxlength="10" value="<%= prMant.getE01PRIOCU().trim()%>" readonly="readonly">
              </div>
            </td>
			<td nowrap width="10%"> 
                <span id="LBL_59_1" class="swf_field_59" style="display:<%=!prMant.getE01PRIBCO().equals("F") ? "inline" : "none"%>">Account :</span>
                <span id="LBL_59F_1" class="swf_field_59" style="display:<%=prMant.getE01PRIBCO().equals("F") ? "inline" : "none"%>">
	          		<select name="SWF_59F_1_1" id="SWF_59F_1_1" class="swf_field_59" disabled dir="rtl" onchange="setBeneficiaryAccount()"
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
			<td nowrap width="30%"> 
                <input readonly="readonly" type="text" id="E11PRIBCU" name="E11PRIBCU" size="40" maxlength="35" value="<%= prMant.getE11PRIBCU() %>">
			</td>
            </tr>  
      	<tr id="trclear"> 
            <td nowrap> 
                <div align="right">
                	<span id="LBL_50K_2" class="swf_field_50" style="display:<%=!prMant.getE01PRIORO().equals("A") && !prMant.getE01PRIORO().equals("D") && !prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>">Name :</span>
					<span id="LBL_50A_2" class="swf_field_50" style="display:<%=prMant.getE01PRIORO().equals("A") ? "inline" : "none"%>">BIC/BEI :</span>
                	<span id="LBL_50D_2" class="swf_field_50" style="display:<%=prMant.getE01PRIORO().equals("D") ? "inline" : "none"%>">Name :</span>
					<span id="LBL_50F_2" class="swf_field_50" style="display:<%=prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>">
               		<select name="SWF_50F_2_1" id="SWF_50F_2_1" class="swf_field_50" disabled="disabled" dir="rtl" 
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
              	<input type="hidden" readonly="readonly" name="E21PRIORC" size="45" maxlength="35" value="<%= prMant.getE21PRIORC().trim()%>">
				<input type="text" readonly="readonly" id="SWF_50K_2_2" name="E21PRIORC_2" class="swf_field_50" style="display: <%=!prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>"
					size="45" maxlength="35" value="<%= prMant.getE21PRIORC() %>">
				<input type="text" readonly="readonly" id="SWF_50F_2_2" name="SWF_50F_2_2" class="swf_field_50" style="display: <%=prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>"
					size="45" maxlength="35" value="<%= prMant.getE21PRIORC().indexOf('/', 1) != -1 ? prMant.getE21PRIORC().substring(2) : prMant.getE21PRIORC() %>">
              </div>
            </td>
            <td nowrap align="right">
               	<span id="LBL_59_2" class="swf_field_59" style="display:<%=!prMant.getE01PRIBCO().equals("A") && !prMant.getE01PRIBCO().equals("F") ? "inline" : "none"%>">Name :</span>
               	<span id="LBL_59A_2" class="swf_field_59" style="display:<%=prMant.getE01PRIBCO().equals("A") ? "inline" : "none"%>">BIC/BEI :</span>
				<span id="LBL_59F_2" class="swf_field_59" style="display:<%=prMant.getE01PRIBCO().equals("F") ? "inline" : "none"%>">
					<select name="SWF_59F_2_1" id="SWF_59F_2_1" class="swf_field_59" disabled="disabled" dir="rtl" onchange="setField(getElement('E21PRIORC'), 'SWF_59', 'F', 2)"
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
              	<input type="text" id="E21PRIBCU" name="E21PRIBCU" size="45" maxlength="35" readonly="readonly"
              		value="<%=("F".equals(prMant.getE01PRIBCO()) && prMant.getE21PRIBCU().indexOf('/', 1) != -1) ? prMant.getE21PRIBCU().substring(2) : prMant.getE21PRIBCU()%>" >
              </div>
            </td>
		</tr>
          <tr id="trclear">
      		<td nowrap valign="top" align="right"> 
      		<div> 
				<span id="LBL_50K_3" class="swf_field_50" style="display:<%=!prMant.getE01PRIORO().equals("A") && !prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>">Address :</span>
				<span id="LBL_50F_3" class="swf_field_50" style="display:<%=prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>">
               		<select name="SWF_50F_3_1" id="SWF_50F_3_1" class="swf_field_50" disabled="disabled" dir="rtl" 
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
               		<select name="SWF_50F_4_1" id="SWF_50F_4_1" class="swf_field_50" disabled="disabled" dir="rtl" 
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
               		<select name="SWF_50F_5_1" id="SWF_50F_5_1" class="swf_field_50" disabled="disabled" dir="rtl"
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
              	<input type="hidden" readonly="readonly" name="E31PRIORC" size="45" maxlength="35" value="<%= prMant.getE31PRIORC().trim()%>">
				<input type="text" readonly="readonly" id="SWF_50K_3_2" name="E31PRIORC_3" class="swf_field_50" style="display: <%=!prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>"
					size="45" maxlength="35" value="<%= prMant.getE31PRIORC() %>">
				<input type="text" readonly="readonly" id="SWF_50F_3_2" name="SWF_50F_3_2" class="swf_field_50" style="display: <%=prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>"
					size="45" maxlength="35" value="<%= prMant.getE31PRIORC().indexOf('/', 1) != -1 ? prMant.getE31PRIORC().substring(2) : prMant.getE31PRIORC() %>">
              </div>
              <div align="left"> 
              	<input type="hidden" readonly="readonly" name="E41PRIORC" size="45" maxlength="35" value="<%= prMant.getE41PRIORC().trim()%>">
				<input type="text" readonly="readonly" id="SWF_50K_4_2" name="E41PRIORC_4" class="swf_field_50" style="display: <%=!prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>"
					size="45" maxlength="35" value="<%= prMant.getE41PRIORC() %>">
				<input type="text" readonly="readonly" id="SWF_50F_4_2" name="SWF_50F_4_2" class="swf_field_50" style="display: <%=prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>"
					size="45" maxlength="35" value="<%= prMant.getE41PRIORC().indexOf('/', 1) != -1 ? prMant.getE41PRIORC().substring(2) : prMant.getE41PRIORC() %>">
              </div>
              <div align="left"> 
              	<input type="hidden" readonly="readonly" name="E51PRIORC" size="45" maxlength="35" value="<%= prMant.getE51PRIORC().trim()%>">
				<input type="text" readonly="readonly" id="SWF_50K_5_2" name="E51PRIORC_5" class="swf_field_50" style="display: <%=!prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>"
					size="45" maxlength="35" value="<%= prMant.getE51PRIORC() %>">
				<input type="text" readonly="readonly" id="SWF_50F_5_2" name="SWF_50F_5_2" class="swf_field_50" style="display: <%=prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>" 
					size="45" maxlength="35" value="<%= prMant.getE51PRIORC().indexOf('/', 1) != -1 ? prMant.getE51PRIORC().substring(2) : prMant.getE51PRIORC() %>">
              </div>
            </td>
      		<td nowrap valign="top" align="right">
      		   <div>
				<span id="LBL_59_3" class="swf_field_59" style="display:<%=!prMant.getE01PRIBCO().equals("A") && !prMant.getE01PRIBCO().equals("F") ? "inline" : "none"%>">Address :</span>
				<span id="LBL_59A_3" class="swf_field_59" style="display:<%=prMant.getE01PRIBCO().equals("A") ? "inline" : "none"%>"></span>
				<span id="LBL_59F_3" class="swf_field_59" style="display:<%=prMant.getE01PRIBCO().equals("F") ? "inline" : "none"%>">
					<select name="SWF_59F_3_1" id="SWF_59F_3_1" class="swf_field_59" disabled="disabled" dir="rtl" onchange="setField(getElement('E31PRIBCU'), 'SWF_59', 'F', 3)"
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
					<select name="SWF_59F_4_1" id="SWF_59F_4_1" class="swf_field_59" disabled dir="rtl" onchange="setField(getElement('E41PRIBCU'), 'SWF_59', 'F', 4)"
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
					<select name="SWF_59F_5_1" id="SWF_59F_5_1" class="swf_field_59" disabled dir="rtl" onchange="setField(getElement('E51PRIBCU'), 'SWF_59', 'F', 5)"
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
                <input readonly="readonly" type="text" id="E31PRIBCU" name="E31PRIBCU" size="45" maxlength="35" 
                		value="<%=("F".equals(prMant.getE01PRIBCO()) && prMant.getE31PRIBCU().indexOf('/', 1) != -1) ? prMant.getE31PRIBCU().substring(2) : prMant.getE31PRIBCU()%>"><br>
              </div>
              <div align="left"> 
                <input readonly="readonly" type="text" id="E41PRIBCU" name="E41PRIBCU" size="45" maxlength="35" 
                		value="<%=("F".equals(prMant.getE01PRIBCO()) && prMant.getE41PRIBCU().indexOf('/', 1) != -1) ? prMant.getE41PRIBCU().substring(2) : prMant.getE41PRIBCU()%>"><br>
              </div>
              <div align="left"> 
                <input readonly="readonly" type="text" id="E51PRIBCU" name="E51PRIBCU" size="45" maxlength="35" 
                		value="<%=("F".equals(prMant.getE01PRIBCO()) && prMant.getE51PRIBCU().indexOf('/', 1) != -1) ? prMant.getE51PRIBCU().substring(2) : prMant.getE51PRIBCU()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear">
      		<td nowrap align="right"> 
                  Country :
			</td> 
            <td nowrap colspan="2"> 
              <div align="left"> 
              	<input type="text" name="E01PRIDPT" size="6" maxlength="4" value="<%= prMant.getE01PRIDPT().trim()%>" readonly="readonly">
              </div>
            </td>
      		<td nowrap align="right"> 
                  Country :
			</td> 
            <td nowrap > 
              <div align="left"> 
              	<input type="text" name="E01COUNT1" size="6" maxlength="4" value="<%= prMant.getE01COUNT1().trim()%>" readonly="readonly">
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
	              <div align="right">Transfer Currency /Amount :</div>
	            </td>
	            <td nowrap > 
	              <input type="text" readonly    name="E01PRITCY" size="3" maxlength="3" value="<%= prMant.getE01PRITCY().trim()%>" >
	              <input type="text" readonly    name="E01PRIAMT" size="15" maxlength="13" value="<%= prMant.getE01PRIAMT().trim()%>" >
	            </td>

            <td nowrap >Exch. Rate :</td>
            <td nowrap >
              <input type="text" readonly    name="E01PRICXR" size="13" maxlength="13" value="<%= prMant.getE01PRICXR().trim()%>" onKeyPress="enterDecimal()" >
            </td>
            <td nowrap > 
              <div align="right">Value Date :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly    name="E01PRIVDM" size="2" maxlength="2" value="<%= prMant.getE01PRIVDM().trim()%>" >
              <input type="text" readonly    name="E01PRIVDD" size="2" maxlength="2" value="<%= prMant.getE01PRIVDD().trim()%>" >
              <input type="text" readonly    name="E01PRIVDY" size="2" maxlength="2" value="<%= prMant.getE01PRIVDY().trim()%>" >
            </td>
          </tr>
        </table>
      </td>
    </tr>

</table>
  <h4>Debit Information</h4>
  <TABLE class="tableinfo" >
    <tr id="trdark"> 
      <td nowrap align="center" >Bank</td>
      <td nowrap align="center" >Branch</td>
      <td nowrap align="center" >Currency</td>
      <td nowrap align="center" >General Ledger</td>
      <td nowrap align="center" >Account</td>
      <td nowrap align="center" >Pay/Thru Number</td>
      <td nowrap align="center" >Cost Center</td>
      <td nowrap align="center" >Amount</td>
      <td nowrap align="center" >Product Description </td>
    </tr>
    <tr id="trclear"> 
      <td nowrap > 
        <div align="left"> 
          <input type="text" readonly    name="E01PRIDBK" size="2" maxlength="2" value="<%= prMant.getE01PRIDBK().trim()%>" >
        </div>
      </td>
      <td nowrap > 
        <div align="left"> 
          <input type="text" readonly    name="E01PRIDBR" size="4" maxlength="4"  value="<%= prMant.getE01PRIDBR().trim()%>" >
        </div>
      </td>
      <td nowrap > 
        <div align="left"> 
          <input type="text" readonly    name="E01PRIDCY" size="3" maxlength="3" value="<%= prMant.getE01PRIDCY().trim()%>" >
        </div>
      </td>
      <td nowrap > 
        <div align="left"> 
          <input type="text" readonly    name="E01PRIDGL" size="13" maxlength="12" value="<%= prMant.getE01PRIDGL().trim()%>" >
        </div>
      </td>
      <td nowrap  > 
        <div align="left"> 
          <input type="text" readonly    name="E01PRIDAC" size="13" maxlength="12" value="<%= prMant.getE01PRIDAC().trim()%>" >
        </div>
      </td>
	  <td nowrap  > 
        <div align="left"> 
          <input type="text" readonly    name="E01PRIDSA" size="6" maxlength="5" value="<%= prMant.getE01PRIDSA().trim()%>" >
        </div>
      </td>      
      <td nowrap > 
        <div align="left"> 
          <input type="text" readonly    name="E01PRIDCC" size="9" maxlength="9"  value="<%= prMant.getE01PRIDCC().trim()%>" >
        </div>
      </td>
      <td nowrap > 
        <div align="left"> 
          <input type="text" readonly    name="E01PRIDAM" size="15" maxlength="13" value="<%= prMant.getE01PRIDAM().trim()%>">
        </div>
      </td>
      <td nowrap > 
        <div align="left"> 
          <input type="text" readonly    name="E01PRIDPD" size="15" maxlength="15"  value="<%= prMant.getE01PRIDPD().trim()%>" >
        </div>
      </td>
    </tr>
      <tr id="trdark"> 
        <td nowrap colspan="5"> 
           <div align="right">Customer :</div>
        </td>  
        <td nowrap  colspan="4"> 
			<input type="text" readonly name="E01DRANME" size="45" maxlength="45" value="<%= prMant.getE01DRANME().trim()%>" >
        </td>            
      </tr>  
  </table>
  <h4>Credit Information</h4>
  <table class="tableinfo" >
    <tr id="trdark"> 
      <td nowrap align="center" >Bank </td>
      <td nowrap align="center" >Branch</td>
      <td nowrap align="center" >Currency</td>
      <td nowrap align="center" >General Ledger</td>
      <td nowrap align="center" >Account</td>
      <td nowrap align="center" >Pay/Thru Number</td>
      <td nowrap align="center" >Cost Center</td>
      <td nowrap align="center" >Amount</td>
      <td nowrap align="center" > Product Description</td>
    </tr>
    <tr id="trclear"> 
      <td nowrap > 
        <div align="left"> 
          <input type="text" readonly    name="E01PRICBK" size="2" maxlength="2" value="<%= prMant.getE01PRICBK().trim()%>" >
        </div>
      </td>
      <td nowrap > 
        <div align="left"> 
          <input type="text" readonly    name="E01PRICBR" size="4" maxlength="4"  value="<%= prMant.getE01PRICBR().trim()%>" >
        </div>
      </td>
      <td nowrap > 
        <div align="left"> 
          <input type="text" readonly    name="E01PRICCY" size="3" maxlength="3" value="<%= prMant.getE01PRICCY().trim()%>" >
        </div>
      </td>
      <td nowrap > 
        <div align="left"> 
          <input type="text" readonly    name="E01PRICGL" size="13" maxlength="12" value="<%= prMant.getE01PRICGL().trim()%>" >
        </div>
      </td>
      <td nowrap  > 
        <div align="left"> 
          <input type="text" readonly    name="E01PRICAC" size="13" maxlength="12" value="<%= prMant.getE01PRICAC().trim()%>" >
        </div>
      </td>
      <td nowrap  > 
        <div align="left"> 
          <input type="text" readonly    name="E01PRICSA" size="6" maxlength="5" value="<%= prMant.getE01PRICSA().trim()%>" >
        </div>
      </td>
      <td nowrap > 
        <div align="left"> 
          <input type="text" readonly    name="E01PRICCC" size="9" maxlength="9"  value="<%= prMant.getE01PRICCC().trim()%>" >
        </div>
      </td>
      <td nowrap >
        <div align="left">
          <input type="text" readonly    name="E01PRICAM" size="15" maxlength="13" value="<%= prMant.getE01PRICAM().trim()%>">
        </div>
      </td>
      <td nowrap > 
        <div align="left"> 
          <input type="text" readonly    name="E01PRICPD" size="15" maxlength="15"  value="<%= prMant.getE01PRICPD().trim()%>" >
        </div>
      </td>
    </tr>
       <tr id="trdark"> 
        <td nowrap colspan="5"> 
           <div align="right">Customer :</div>
        </td>  
        <td nowrap  colspan="3"> 
			<input type="text" readonly  name="E01CRANME" size="45" maxlength="45" value="<%= prMant.getE01CRANME().trim()%>" >
        </td> 
		<td nowrap > 
                <div align="right"></div>
                <div align="right">Days Hold : 
                  <input type="text" readonly name="E01PRIHDY" size="3" maxlength="3" value="<%= prMant.getE01PRIHDY().trim()%>">
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
            <td nowrap width="24%" > 
              <div align="right">Table/ Amount :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" readonly    name="E01PRICOT" size="2" maxlength="2" value="<%= prMant.getE01PRICOT().trim()%>" >
              <input type="text" readonly    name="E01PRICOM" size="15" maxlength="13" value="<%= prMant.getE01PRICOM().trim()%>" >
            </td>
            <td nowrap width="17%" > 
              <div align="right">Charges by :</div>
            </td>
            <td nowrap width="29%" > 
              <input type="text" readonly    name="E01PRICHG" value="<% if (prMant.getE01PRICHG().equals("A")) {out.print("Applicant");} 
                else if (prMant.getE01PRICHG().equals("B")) { out.print("Beneficiary");} 
                else if (prMant.getE01PRICHG().equals("N")) {out.print("None");} 
                else if (prMant.getE01PRICHG().equals("O")) {out.print("Ours");}
				else if (prMant.getE01PRICHG().equals("S")) {out.print("Share");}
				else out.print(" ");%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="24%" >&nbsp;</td>
            <td nowrap width="30%" >&nbsp;</td>
            <td nowrap width="17%" >Currency/Amount :</td>
            <td nowrap width="29%" > 
              <div align="left"> 
                <input type="text" readonly  name="E01PRIRCC"  size="4" maxlength="3" value="<%= prMant.getE01PRIRCC().trim()%>">
                <input type="text" readonly  name="E01PRIRRA"  size="15" maxlength="13" value="<%= prMant.getE01PRIRRA().trim()%>"
				onKeyPress="enterDecimal()">
              </div>
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
                  <input type="text" name="E01PRISRF" size="20" maxlength="19" value="<%= prMant.getE01PRISRF().trim()%>" readonly="readonly">
                </div>
              </td>
              <td nowrap >
                <div align="right">Their Reference :</div>
              </td>
              <td nowrap >
                <div align="left">
                  <input type="text" name="E01PRITHF" size="17" maxlength="16" value="<%= prMant.getE01PRITHF().trim()%>" readonly="readonly">
                </div>
              </td>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap  >
                <div align="right">Source of Funds :</div>
              </td>
              <td nowrap >
                <div align="left">
                  <input type="text" name="E01PRISOU" size="2" maxlength="2" value="<%= prMant.getE01PRISOU().trim()%>" readonly="readonly">
                  </div>
              </td>
              <td nowrap >
                <div align="right">Disbursement of Funds :</div>
              </td>
              <td nowrap >
                <input type="text" name="E01PRIDIB" size="2" maxlength="2" value="<%= prMant.getE01PRIDIB().trim()%>" readonly="readonly">
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap >
                <div align="right">Instructions Received Via :</div>
              </td>
              <td nowrap >
                <div align="left">
                  <input type="text" name="E01PRIIRV" size="3" maxlength="1" value="<%= prMant.getE01PRIIRV().trim()%>" readonly="readonly">
                  </td>
              <td nowrap  >
                <div align="right">Check Format :</div>
              </td>
              <td nowrap >
                <input type="text" name="E01PRIFL3" size="2" maxlength="1" value="<%= prMant.getE01PRIFL3().trim()%>" readonly="readonly">
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
   				<select name="E01M13COD" class="timeInd" disabled >
		             <option value="" <% if (!(prMant.getE01M13COD().equals("CLSTIME") || prMant.getE01M13COD().equals("RNCTIME") || prMant.getE01M13COD().equals("SNDTIME")))
		 										out.print("selected"); %>> </option>
		             <option value="CLSTIME" <% if (prMant.getE01M13COD().equals("CLSTIME")) out.print("selected"); %>>CLS Time</option>
		             <option value="RNCTIME" <% if (prMant.getE01M13COD().equals("RNCTIME")) out.print("selected"); %>>Receive Time</option>
		             <option value="SNDTIME" <% if (prMant.getE01M13COD().equals("SNDTIME")) out.print("selected"); %>>Send Time</option>                   
		           </select>
   			</td>    
   			<td align="right">Time : </td>
   			<td>
   				<input type="text" name="E01M13TIM" value="<%= prMant.getE01M13TIM() %>" maxlength="4" size="6" onkeypress="enterInteger()" disabled>
   				<select name="E01M13SIG" class="timeInd" disabled>
		             <option value="" <% if (!(prMant.getE01M13SIG().equals("+") || prMant.getE01M13SIG().equals("-")))
		 										out.print("selected"); %>> </option>
		             <option value="+" <% if (prMant.getE01M13SIG().equals("+")) out.print("selected"); %>> Plus </option>
		             <option value="-" <% if (prMant.getE01M13SIG().equals("-")) out.print("selected"); %>> Minus </option>                
		        </select>  
		        <input type="text" name="E01M13TOF" value="<%= prMant.getE01M13TOF() %>" maxlength="4" size="6" onkeypress="enterInteger()" disabled> (Hours)  
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
                  <input type="text" name="E01PRISID" size="15" maxlength="15" value="<%= prMant.getE01PRISID().trim()%>" readonly="readonly">
				</div>
              </td>
              <td nowrap >
                <div align="right">Receiver ID :</div>
              </td>
              <td nowrap >
                <input type="text" name="E01PRIRID" size="15" maxlength="15" value="<%= prMant.getE01PRIRID().trim()%>" readonly="readonly">
			  </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap  >
                <div align="right">Sender Short Name :</div>
              </td>
              <td nowrap >
                <div align="left">
                  <input type="text" name="E01PRISSH" size="25" maxlength="18" value="<%= prMant.getE01PRISSH().trim()%>" readonly="readonly">
                </div>
              <td nowrap >
                <div align="right">Receiver Short Name :</div>
              </td>
              <td nowrap >
                <input type="text" name="E01PRIRSH" size="25" maxlength="18" value="<%= prMant.getE01PRIRSH().trim()%>" readonly="readonly">
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap  >
                <div align="right">Bank Operation Code :</div>
              </td>
              <td nowrap >
                <div align="left">
                  <input type="text" name="E01PRIBKO" size="6" maxlength="4" value="<%= prMant.getE01PRIBKO()%>" readonly="readonly">
                  </div>
              </td>
              <td nowrap >
                <div align="right">Instructions Code :</div>
              </td>
              <td nowrap >
                <div align="left">
                  <input type="text" name="E01PRIITC" size="6" maxlength="4" value="<%= prMant.getE01PRIITC()%>" readonly="readonly">
                  <input type="text" name="E01PRIITA" size="11" maxlength="10" value="<%= prMant.getE01PRIITA()%>" readonly="readonly">
                </div>
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap  >
                <div align="right">Fed Type / Sub Type :</div>
              </td>
              <td nowrap >
                <input type="text" name="E01FEDTYP" size="3" maxlength="2" value="<%= prMant.getE01FEDTYP().trim()%>" readonly="readonly">
                <input type="text" name="E01FEDSTY" size="3" maxlength="2" value="<%= prMant.getE01FEDSTY().trim()%>" readonly="readonly">
              </td>
              <td nowrap >
                <div align="right">Fed Product Code :</div>
              </td>
              <td nowrap >
                <input type="text" name="E01PRIPRC" size="3" maxlength="3" value="<%= prMant.getE01PRIPRC().trim()%>" readonly="readonly">
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap  >
                <div align="right">Regulatory Report :</div>
              </td>
              <td nowrap colspan="3" >
                <input type="text" name="E11PRIRTR" size="36" maxlength="35" value="<%= prMant.getE11PRIRTR().trim()%>" readonly="readonly">
              </td>
            </tr>
            <tr id="trclear">
              <td nowrap  >&nbsp;</td>
              <td nowrap colspan="3" >
                <input type="text" name="E21PRIRTR" size="36" maxlength="35" value="<%= prMant.getE21PRIRTR().trim()%>" readonly="readonly">
              </td>
            </tr>
            <tr id="trclear">
              <td nowrap  >&nbsp;</td>
              <td nowrap colspan="3" >
                <input type="text" name="E31PRIRTR" size="36" maxlength="35" value="<%= prMant.getE31PRIRTR().trim()%>" readonly="readonly">
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
                                  <select name="E01PRIOBO" id="OB" disabled="disabled">
                                    <option value=" " <% if (!(prMant.getE01PRIOBO().equals("F") ||prMant.getE01PRIOBO().equals("D") ||prMant.getE01PRIOBO().equals("A"))) out.print("selected"); %>></option>
                                    <option value="A" <% if(prMant.getE01PRIOBO().equals("A")) out.print("selected");%>>A</option>
                                    <option value="D" <% if(prMant.getE01PRIOBO().equals("D")) out.print("selected");%>>D</option>
                                    <option value="F" <% if(prMant.getE01PRIOBO().equals("F")) out.print("selected");%>>F</option>
                                  </select>
                                  <input type="text" name="E11PRIOBK" size="36" maxlength="35" value="<%= prMant.getE11PRIOBK().trim()%>" readonly="readonly">
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td align="right">
                                <input type="text" name="E21PRIOBK" size="36" maxlength="35" value="<%= prMant.getE21PRIOBK().trim()%>" readonly="readonly">
                              </td>
                            </tr>
                            <tr>
                              <td align="right">
                                <input type="text" name="E31PRIOBK" size="36" maxlength="35" value="<%= prMant.getE31PRIOBK().trim()%>" readonly="readonly">
                              </td>
                            </tr>
                            <tr>
                              <td align="right">
                                <input type="text" name="E41PRIOBK" size="36" maxlength="35" value="<%= prMant.getE41PRIOBK().trim()%>" readonly="readonly">
                              </td>
                            </tr>
                            <tr>
                              <td align="right">
                                <input type="text" name="E51PRIOBK" size="36" maxlength="35" value="<%= prMant.getE51PRIOBK().trim()%>" readonly="readonly">
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
                                  <select name="E01PRIBBO" disabled="disabled" id="BB">
                                    <option value=" " <% if (!(prMant.getE01PRIBBO().equals("A") ||prMant.getE01PRIBBO().equals("B") ||prMant.getE01PRIBBO().equals("C") ||prMant.getE01PRIBBO().equals("D") ||prMant.getE01PRIBBO().equals("F"))) out.print("selected"); %>></option>
                                    <option value="A" <% if(prMant.getE01PRIBBO().equals("A")) out.print("selected");%>>A</option>
                                    <option value="B" <% if(prMant.getE01PRIBBO().equals("B")) out.print("selected");%>>B</option>
                                    <option value="C" <% if(prMant.getE01PRIBBO().equals("C")) out.print("selected");%>>C</option>
                                    <option value="D" <% if(prMant.getE01PRIBBO().equals("D")) out.print("selected");%>>D</option>
                                    <option value="F" <% if(prMant.getE01PRIBBO().equals("F")) out.print("selected");%>>F</option>
                                  </select>
                                  <input type="text" name="E11PRIBBK" size="36" maxlength="35" value="<%= prMant.getE11PRIBBK().trim()%>" readonly="readonly">
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <div align="right">
                                  <input type="text" name="E21PRIBBK" size="36" maxlength="35" value="<%= prMant.getE21PRIBBK().trim()%>" readonly="readonly">
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <div align="right">
                                  <input type="text" name="E31PRIBBK" size="36" maxlength="35" value="<%= prMant.getE31PRIBBK().trim()%>" readonly="readonly">
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <div align="right">
                                  <input type="text" name="E41PRIBBK" size="36" maxlength="35" value="<%= prMant.getE41PRIBBK().trim()%>" readonly="readonly">
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <div align="right">
                                  <input type="text" name="E51PRIBBK" size="36" maxlength="35" value="<%= prMant.getE51PRIBBK().trim()%>" readonly="readonly">
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
                                  <select name="E01PRIINO" disabled="disabled" id="IB">
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
                                  <input type="text" name="E11PRIINB" size="36" maxlength="35" value="<%= prMant.getE11PRIINB().trim()%>" readonly="readonly">
                                </div>
                              </td>
                            </tr>
                            <tr>
                            <td>
                            </td>
                              <td>
                                <div align="left">
                                  <input type="text" name="E21PRIINB" size="36" maxlength="35" value="<%= prMant.getE21PRIINB().trim()%>" readonly="readonly">
                                </div>
                              </td>
                            </tr>
                            <tr>
                            <td>
                            </td>
                              <td>
                                <div align="left">
                                  <input type="text" name="E31PRIINB" size="36" maxlength="35" value="<%= prMant.getE31PRIINB().trim()%>" readonly="readonly">
                                </div>
                              </td>
                            </tr>
                            <tr>
                            <td>
                            </td>
                              <td>
                                <div align="left">
                                  <input type="text" name="E41PRIINB" size="36" maxlength="35" value="<%= prMant.getE41PRIINB().trim()%>" readonly="readonly">
                                </div>
                              </td>
                            </tr>
                            <tr>
                            <td>
                            </td>
                              <td>
                                <div align="left">
                                  <input type="text" name="E51PRIINB" size="36" maxlength="35" value="<%= prMant.getE51PRIINB().trim()%>" readonly="readonly">
                                </div>
                              </td>
                            </tr>
                            <tr>
                            <td align="right">
                            	Country: 
                            </td>
                              <td align="left">
                                <div align="left">
                                <input type="text" name="E01COUNT2" size="6" maxlength="4" value="<%= prMant.getE01COUNT2().trim()%>" readonly="readonly">
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
                                  <select name="E01PRISCO" disabled="disabled" id="SCB">
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
                                  <input type="text" name="E11PRISCB" size="36" maxlength="35" value="<%= prMant.getE11PRISCB().trim()%>" readonly="readonly">
                                </div>
                              </td>
                            </tr>
                            <tr>
                            <td>
                            </td>
                              <td>
                                <div align="left">
                                  <input type="text" name="E21PRISCB" size="36" maxlength="35" value="<%= prMant.getE21PRISCB().trim()%>" readonly="readonly">
                                </div>
                              </td>
                            </tr>
                            <tr>
                            <td>
                            </td>
                              <td>
                                <div align="left">
                                  <input type="text" name="E31PRISCB" size="36" maxlength="35" value="<%= prMant.getE31PRISCB().trim()%>" readonly="readonly">
                                </div>
                              </td>
                            </tr>
                            <tr>
                            <td>
                            </td>
                              <td>
                                <div align="left">
                                  <input type="text" name="E41PRISCB" size="36" maxlength="35" value="<%= prMant.getE41PRISCB().trim()%>" readonly="readonly">
                                </div>
                              </td>
                            </tr>
                            <tr>
                            <td>
                            </td>
                              <td>
                                <div align="left">
                                  <input type="text" name="E51PRISCB" size="36" maxlength="35" value="<%= prMant.getE51PRISCB().trim()%>" readonly="readonly">
                                </div>
                              </td>
                            </tr>
                            <tr>
                            <td>
                            	Country :
                            </td>
                              <td>
                                <div align="left">
                                <input type="text" name="E01COUNT3" size="6" maxlength="4" value="<%= prMant.getE01COUNT3().trim()%>" readonly="readonly">
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
                                  <select name="E01PRIRBO" disabled="disabled" id="RCB">
                                    <option value=" " <% if (!(prMant.getE01PRIRBO().equals("A") ||prMant.getE01PRIRBO().equals("B") ||prMant.getE01PRIRBO().equals("D") ||prMant.getE01PRIRBO().equals("F"))) out.print("selected"); %>></option>
                                    <option value="A" <% if(prMant.getE01PRIRBO().equals("A")) out.print("selected");%>>A</option>
                                    <option value="B" <% if(prMant.getE01PRIRBO().equals("B")) out.print("selected");%>>B</option>
                                    <option value="D" <% if(prMant.getE01PRIRBO().equals("D")) out.print("selected");%>>D</option>
                                    <option value="F" <% if(prMant.getE01PRIRBO().equals("F")) out.print("selected");%>>F</option>
                                  </select>
                                  <input type="text" name="E11PRIRCB" size="36" maxlength="35" value="<%= prMant.getE11PRIRCB().trim()%>" readonly="readonly">
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <div align="right">
                                  <input type="text" name="E21PRIRCB" size="36" maxlength="35" value="<%= prMant.getE21PRIRCB().trim()%>" readonly="readonly">
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <div align="right">
                                  <input type="text" name="E31PRIRCB" size="36" maxlength="35" value="<%= prMant.getE31PRIRCB().trim()%>" readonly="readonly">
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <div align="right">
                                  <input type="text" name="E41PRIRCB" size="36" maxlength="35" value="<%= prMant.getE41PRIRCB().trim()%>" readonly="readonly">
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <div align="right">
                                  <input type="text" name="E51PRIRCB" size="36" maxlength="35" value="<%= prMant.getE51PRIRCB().trim()%>" readonly="readonly">
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
 								<input type="text" name="E11PRIDTP" size="36" maxlength="35" value="<%= prMant.getE11PRIDTP().trim()%>" readonly="readonly">
                              </td>
                            </tr>
                            <tr>
                              <td>
                                  <input type="text" name="E21PRIDTP" size="36" maxlength="35" value="<%= prMant.getE21PRIDTP().trim()%>" readonly="readonly">
                              </td>
                            </tr>
                            <tr>
                              <td>
                                  <input type="text" name="E31PRIDTP" size="36" maxlength="35" value="<%= prMant.getE31PRIDTP().trim()%>" readonly="readonly">
                              </td>
                            </tr>
                            <tr>
                              <td>
                                  <input type="text" name="E41PRIDTP" size="36" maxlength="35" value="<%= prMant.getE41PRIDTP().trim()%>" readonly="readonly">
                              </td>
                            </tr>
                            <tr>
                              <td>
                                  <input type="text" name="E51PRIDTP" size="36" maxlength="35" value="<%= prMant.getE51PRIDTP().trim()%>" readonly="readonly">
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
                                <input type="text" name="E11PRIDTO" size="36" maxlength="35" value="<%= prMant.getE11PRIDTO().trim()%>" readonly="readonly">
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <input type="text" name="E21PRIDTO" size="36" maxlength="35" value="<%= prMant.getE21PRIDTO().trim()%>" readonly="readonly">
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <input type="text" name="E31PRIDTO" size="36" maxlength="35" value="<%= prMant.getE31PRIDTO().trim()%>" readonly="readonly">
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <input type="text" name="E41PRIDTO" size="36" maxlength="35" value="<%= prMant.getE41PRIDTO().trim()%>" readonly="readonly">
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <input type="text" name="E51PRIDTO" size="36" maxlength="35" value="<%= prMant.getE51PRIDTO().trim()%>" readonly="readonly">
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
                                  <input type="text" name="E11PRIBKB" size="36" maxlength="35" value="<%= prMant.getE11PRIBKB().trim()%>" readonly="readonly">
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <div align="right">
                                  <input type="text" name="E21PRIBKB" size="36" maxlength="35" value="<%= prMant.getE21PRIBKB().trim()%>" readonly="readonly">
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <div align="right">
                                  <input type="text" name="E31PRIBKB" size="36" maxlength="35" value="<%= prMant.getE31PRIBKB().trim()%>" readonly="readonly">
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <div align="right">
                                  <input type="text" name="E41PRIBKB" size="36" maxlength="35" value="<%= prMant.getE41PRIBKB().trim()%>" readonly="readonly">
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <div align="right">
                                  <input type="text" name="E51PRIBKB" size="36" maxlength="35" value="<%= prMant.getE51PRIBKB().trim()%>" readonly="readonly">
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <div align="right">
                                  <input type="text" name="E61PRIBKB" size="36" maxlength="35" value="<%= prMant.getE61PRIBKB().trim()%>" readonly="readonly">
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
			<INPUT type="text" name="E01PRAOP<%= i %>" size="2" maxlength="1" value="<%= prMant.getField("E01PRAOP"+i).getString().trim()%>" readonly>
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
				  vl = prMant.getField("E01PRAFL"+i).getString().substring(posi);;
				}
	          }
			%>
			  <INPUT type="text" name="E01PRAFL0_<%=ix%>" size="40" maxlength="35" value="<%= vl %>"  readonly="readonly"><BR> 
			<%}%>   
		</td>
	</TR>
	<% }
	} %>

  </TABLE>
<br>  
  
  <table class="tableinfo">
    <tr>
      <td>Entered by : <%= prMant.getE01PRIUSR().trim()%></td>
      <td>Date : <%= Util.formatDate(prMant.getE01PRITDM().trim(),prMant.getE01PRITDD().trim(),prMant.getE01PRITDY().trim())%></td>
      <td>Time : <%= Util.formatTime(prMant.getE01PRITTM().trim())%></td>
    </tr>
        <tr>
      <td>OFAC/Verified by : <%= prMant.getE01PRIRB2().trim()%></td>
      <td>Date : <%= Util.formatDate(prMant.getE01PRIR2M().trim(),prMant.getE01PRIR2D().trim(),prMant.getE01PRIR2Y().trim())%></td>
      <td>Time : <%= Util.formatTime(prMant.getE01PRIR2T().trim())%></td>
    </tr>
    
    <tr>
      <td>Released by : <%= prMant.getE01PRIRBY().trim()%></td>
      <td>Date : <%= Util.formatDate(prMant.getE01PRIRDM().trim(),prMant.getE01PRIRDD().trim(),prMant.getE01PRIRDY().trim()) %>
	  </td>
      <td>Time : <%= Util.formatTime(prMant.getE01PRIRTM().trim())%></td>
    </tr>
  </table>
<br>  
  
  <table class="tableinfo">
    <tr>
      <td>Entered by : <%= prMant.getE01PRIUSR().trim()%></td>
      <td>Date : <%= Util.formatDate(prMant.getE01PRITDM().trim(),prMant.getE01PRITDD().trim(),prMant.getE01PRITDY().trim())%></td>
      <td>Time : <%= Util.formatTime(prMant.getE01PRITTM().trim())%></td>
    </tr>
        <tr>
      <td>OFAC/Verified by : <%= prMant.getE01PRIRB2().trim()%></td>
      <td>Date : <%= Util.formatDate(prMant.getE01PRIR2M().trim(),prMant.getE01PRIR2D().trim(),prMant.getE01PRIR2Y().trim())%></td>
      <td>Time : <%= Util.formatTime(prMant.getE01PRIR2T().trim())%></td>
    </tr>
    
    <tr>
      <td>Released by : <%= prMant.getE01PRIRBY().trim()%></td>
      <td>Date : <%= Util.formatDate(prMant.getE01PRIRDM().trim(),prMant.getE01PRIRDD().trim(),prMant.getE01PRIRDY().trim()) %>
	  </td>
      <td>Time : <%= Util.formatTime(prMant.getE01PRIRTM().trim())%></td>
    </tr>
  </table>
<p align="center"> 
	
	<input id="EIBSBTN" type=button name="Pdf" value="Pdf" OnClick="showPdf();" >

  </p>
</form>

</body>
</html>
