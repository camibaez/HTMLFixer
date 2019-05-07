<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Draft Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT> 
 <script src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"></script>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>


<jsp:useBean id="dftBasic" class="datapro.eibs.beans.EDL080001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "lstAcceptors" class= "datapro.eibs.beans.JBListRec"  scope="session" />

<SCRIPT Language="Javascript">

function goAction(opt) {
	var exists = false;
    if (document.forms[0].E01DEAACC.value != "999999999999") {
   		if (opt == 'N') { //New
        	if (document.forms[0].ideacc.value == "") {
    			page = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0800?SCREEN=600&ACTION=G"
            } else {
              	var formLength = document.forms[0].elements.length;
	   			for (var n=0; n<formLength; n++) {
      	  	  		var elementName = document.forms[0].elements[n].name;
      	  	  		if (elementName == "IDACC1" && document.forms[0].ideacc.value == document.forms[0].elements[n].value) {
      	  	  	  		exists = true;
      	  	  	  		break;
      	  	  		}
		   		}
		   		if (exists) {
		   			alert("Acceptants Exist!");
		   		} else {
			        page = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0800?SCREEN=600&ACTION=G&E01DEAACC=" + document.forms[0].ideacc.value;
			    }
           	}
       	}
       	if (opt == 'M') {
       	   	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0800?SCREEN=600&ACTION=G&E01DEAACC=" + document.forms[0].IDACC1.value;
       	}
		if (opt == 'D') { //Documents
		   	var formLength= document.forms[0].elements.length;
		   	var ideacc = "";
		   	for (var n=0; n<formLength; n++) {
   	  			var elementName = document.forms[0].elements[n].name;
      	  	  	if (elementName == "IDACC1" && document.forms[0].elements[n].checked){
      	  	  		ideacc = document.forms[0].elements[n].value;
      	  	  	  	break;
      	  	  	}
		   	}
		   
		   	if (ideacc == "") {
		    	alert("Please, before view documents, select an acceptance.");
		      	exists = true;
		   	} else {
       	      	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0800?SCREEN=800&ACTION=G&E01DEAACC=" + document.forms[0].E01DEAACC.value +"&IDEACC="+ideacc+"&GRP=4";
       	   }
       	}
        if (exists == false) {
			CenterWindow(page, 650, 550, 2);
		}	
	} else {
    	alert("Generate account number first.");
    }
}

<% 	if (userPO.getPurpose().equals("MAINTENANCE") ){%>
   		builtNewMenu(dft_m_opt);
<% 	} %>

	builtHPopUp();

	function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   		init(opth,field,bank,ccy,field1,field2,opcod);
   		showPopupHelp();
	}

	function closeHiddenDivNew(){
		setVisibility(document.getElementById("hiddenDivNew"), "hidden");
	}

	function showHiddenDivNew(evt) {
		evt = (evt) ? evt : ((window.event) ? window.event : "");
		var hiddenDivNew = document.getElementById("hiddenDivNew");
		var y = evt.clientY + document.body.scrollTop;
		var x = evt.clientX + document.body.scrollLeft;
     
		cancelBub(evt);

		moveElement(hiddenDivNew, y, x);
		setVisibility(hiddenDivNew, "visible");
	
    	document.forms[0].ideacc.focus();
	}

	function goNew(evt){
		if (document.forms[0].E01DEAACC.value != "999999999999"){
			showHiddenDivNew(evt);
		} else {
			alert("First, you must generate Account Number...");
		}
	}

	document.onclick = closeHiddenDivNew;

</SCRIPT>
</head>
<body>

<% 
	if ( !error.getERRNUM().equals("0")  ) {
    	error.setERRNUM("0");
     	out.println("<SCRIPT Language=\"Javascript\">");
     	out.println("       showErrors()");
     	out.println("</SCRIPT>");
    }

	if (userPO.getPurpose().equals("MAINTENANCE")) {
		out.println("<SCRIPT>  initMenu(); </SCRIPT>");
	}

  	String genFlag = request.getParameter("generic") == null ? "" : request.getParameter("generic").trim();
	
%> 

<h3 align="center"> <%= dftBasic.getE01DSCPRO().trim() %><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="dft_basic.jsp, EDL0800"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0800" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="502">
  <INPUT TYPE=HIDDEN NAME="ACTION" VALUE="F">
  <input type=HIDDEN name="E01DEATYP" value="<%= dftBasic.getE01DEATYP() %>">
  <INPUT type="hidden" name="E01DEACLF" size="2" maxlength="1" value="<%= dftBasic.getE01DEACLF() %>">
  <input type=hidden name="GRP" value="0">

  <div id="hiddenDivNew" class="hiddenDiv">
  		<TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
			border-color: #0b23b5;
			border-style : solid solid solid solid;
			filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
			<TR>
	  			<TD ALIGN=right nowrap>Enter Acceptance ID. : 
					<input type="text" maxlength=15 size=15 name="ideacc" value="">
					<a href="javascript:GetAcceptantId('ideacc')">
					<img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="bottom" border="0" ></a>
      			</TD>
      			<TD ALIGN=Left nowrap>
	     			<a href="javascript:goAction('N')">
	     			<img name="Image1" border="0" src="<%=request.getContextPath()%>/images/e/apply_on.gif"></a> 
	  			</TD>
   			</TR>
 		</TABLE>
	</div>

  	<table class="tableinfo">
    	<tr> 
      		<td nowrap> 
        		<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
        			<tr id="trdark"> 
           				<td nowrap width="10%" ><div align="right"><b>Customer :</b></div></td>
           				<td nowrap width="20%" > 
           					<div align="left">
               					<input type="text" name="E01DEACUN" size="9" maxlength="9" value="<%= dftBasic.getE01DEACUN() %>">
               					<a href="javascript:GetCustomerDescId('E01DEACUN','E01CUSNA1','')">
               					<img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absbottom" border="0" ></a>
               				</div>
           				</td>
           				<td nowrap width="10%" ><div align="right"><b>Name :</b> </div></td>
           				<td nowrap width="60%" colspan="3" > 
           					<div align="left">
        	   					<input type="text" name="E01CUSNA1" size="75" maxlength="45" value="<%= dftBasic.getE01CUSNA1() %>">
               				</div>
           				</td>
        			</tr>
        			<tr id="trdark">
        				<td nowrap width="10%"><div align="right"><b>Account :</b></div></td>
           				<td nowrap width="20%"> 
           					<div align="left">
							<% String strNroAcc = dftBasic.getE01DEAACC().equals("999999999999") ? "NEW ACCOUNT" : dftBasic.getE01DEAACC(); %>
               					<input type="hidden" name="E01DEAACC" size="12" maxlength="12" value="<%= dftBasic.getE01DEAACC()  %>">
               					<input type="text" name="E01DEAACCDSC" size="16" maxlength="12" value="<%= strNroAcc  %>">              
           					</div>
           				</td>
           				<td nowrap width="10%"><div align="right"><b>Currency : </b></div></td>
           				<td nowrap width="20%"> 
           					<div align="left">
               					<input type="text" name="E01DEACCY" size="4" maxlength="3" value="<%= dftBasic.getE01DEACCY() %>" readonly >
               				</div>
           				</td>
           				<td nowrap width="16%"><div align="right"><b>Product : </b></div></td>
           				<td nowrap width="16%"> 
           					<div align="left">
               					<input type="text" name="E01DEAPRO" size="4" maxlength="4" value="<%= dftBasic.getE01DEAPRO() %>" readonly >
               				</div>
           				</td>
        			</tr>
        		</table>
      		</td>
    	</tr>
  	</table>
  	
  <h4>Basic Information</h4> 
  <table class="tableinfo">
  	<tr > 
    	<td nowrap> 
        	<table cellpadding=2 cellspacing=0 width="100%" border="0">
         		 <tr id="trdark"> 
            		<td nowrap width="25%"><div align="right">Opening Date:</div></td>
            		<td nowrap width="25%"> 
		            	<input type="text" name="E01DEAOD1" size="2" maxlength="2" value="<%= dftBasic.getE01DEAOD1() %>" onkeypress="enterInteger()">
		              	<input type="text" name="E01DEAOD2" size="2" maxlength="2" value="<%= dftBasic.getE01DEAOD2() %>" onkeypress="enterInteger()">
		              	<input type="text" name="E01DEAOD3" size="2" maxlength="2" value="<%= dftBasic.getE01DEAOD3() %>" onkeypress="enterInteger()">
              			<a href="javascript:DOBPicker(document.forms[0].E01DEAOD1,document.forms[0].E01DEAOD2,document.forms[0].E01DEAOD3)">
              			<img src="<%=request.getContextPath()%>/images/calendar.gif" alt="Help" border="0" ></a>
            		</td>
            		<td nowrap width="25%"><div align="right">Original Amount:</div></td>
            		<td nowrap width="25%">
						<input type="text" name="E01DEAOAM" size="20" maxlength="15" value="<%= dftBasic.getE01DEAOAM() %>">
              			<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  > 
              		</td>
          		</tr>
          		<tr id="trclear"> 
            		<td nowrap width="25%" ><div align="right">Floating Rate Type:</div></td>
            		<td nowrap width="25%" > 
              			<input type="text" name="E01DEAFTB" size="2" maxlength="2" value="<%= dftBasic.getE01DEAFTB() %>">
              			<a href="javascript:GetFloatingRate('E01DEAFTB',document.forms[0].E01DEATYP.value)">
              			<img src="<%=request.getContextPath()%>/images/1b.gif" alt="ayuda" align="middle" border="0" ></a>
              			<select name="E01DEAFTY">
		  					<option value=" " <% if (!(dftBasic.getE01DEAFTY().equals("FP") ||dftBasic.getE01DEAFTY().equals("FS"))) out.print("selected"); %>></option>
                			<option value="FP" <% if (dftBasic.getE01DEAFTY().equals("FP")) out.print("selected"); %>>FP</option>
                			<option value="FS" <% if (dftBasic.getE01DEAFTY().equals("FS")) out.print("selected"); %>>FS</option>
              			</select>
              			<input type="text" name="E01FLTRTE" size="9" maxlength="9" value="<%= dftBasic.getE01FLTRTE() %>" readonly>
            		</td>
            		<td nowrap width="25%" ><div align="right">Interest Rate/Spread :</div></td>
            		<td nowrap width="27%" > 
              			<input type="text" name="E01DEARTE" size="10" maxlength="9" value="<%= dftBasic.getE01DEARTE() %>" onKeypress="enterSignDecimal()">
              			<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  > 
            		</td>
          		</tr>
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Penalty Rate/Charges:</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEAPEI" size="8" maxlength="7" value="<%= dftBasic.getE01DEAPEI() %>" >
              <input type="text" name="E01DEAPIF" size="2" maxlength="1" value="<%= dftBasic.getE01DEAPIF() %>" >
              <a href="javascript:lnGetFact('E01DEAPIF','STATIC_ln_fact.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absbottom" border="0"  ></a> 
            </td>
            <td nowrap width="25%" > 
              <div align="right">Reference Number:</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DEAREF" size="12" maxlength="12" value="<%= dftBasic.getE01DEAREF() %>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Line of Credit :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEACMC" size="9" maxlength="9" value="<%= dftBasic.getE01DEACMC() %>" >
              <input type="text" name="E01DEACMN" size="4" maxlength="4" value="<%= dftBasic.getE01DEACMN() %>" >
              <a href="javascript:GetCreditLine('E01DEACMN',document.forms[0].E01DEACMC.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  > 
            </td>
            <td nowrap width="25%" > 
              <div align="right">Cost Center : </div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DEACCN" size="8" maxlength="8" value="<%= dftBasic.getE01DEACCN() %>">
              <a href="javascript:GetCostCenter('E01DEACCN',document.forms[0].E01DEABNK.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a> 
            </td>
          </tr>
          
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Taxes and Withholding:</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEAWHF" size="2" maxlength="1" value="<%= dftBasic.getE01DEAWHF() %>">
              <a href="javascript:GetCode('E01DEAWHF','STATIC_cd_taxes.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absbottom" border="0" ></a> 
            </td>
            <td nowrap width="25%" > 
              <div align="right">Mailing Address:</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DEAMLA" size="2" maxlength="1" value="<%= dftBasic.getE01DEAMLA() %>">
              <a href="javascript:GetMailing('E01DEAMLA',document.forms[0].E01DEACUN.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0"></a> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Broker Code :</div>
           </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEABRK" size="4" maxlength="3" value="<%= dftBasic.getE01DEABRK() %>">
              <a href="javascript:GetBroker('E01DEABRK')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0"></a> 
            </td>
            <td nowrap width="25%" > 
              <div align="right">Comission Percentage:</div>
            </td>
            <td nowrap width="27%" > 
		<input type="text" name="E01DEABCP" size="10" maxlength="9" value="<%= dftBasic.getE01DEABCP() %>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Document Type:</div>
            </td>
            <td nowrap width="23%" >
		<select name="E01DEARET">
		  <option value=" "<% if (dftBasic.getE01DEARET().trim().equals(""))  out.print("selected"); %>></option>
		  <option value="1"<% if (dftBasic.getE01DEARET().equals("1"))  out.print("selected"); %>>Draft</option>
                <option value="2" <% if (dftBasic.getE01DEARET().equals("2")) out.print("selected"); %>>Conformes</option>
                <option value="3" <% if (dftBasic.getE01DEARET().equals("3")) out.print("selected"); %>>Invoices</option>
		        <option value="4" <% if (dftBasic.getE01DEARET().equals("4")) out.print("selected"); %>>Checks</option>
		        <option value="5" <% if (dftBasic.getE01DEARET().equals("5")) out.print("selected"); %>>MasterCard Coupons</option>
        </select>
			<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  > 
              </td>
            <td nowrap width="25%" >
              <div align="right">Bank/Office</div>
            </td>
            <td nowrap width="27%" > 
            <%if (userPO.getPurpose().equals("MAINTENANCE")){%> 
            <input readonly type="text" name="E01DEABNK" size="3" maxlength="2" value="<%= dftBasic.getE01DEABNK() %>" >
            <input readonly type="text" name="E01DEABRN" size="4" maxlength="3" value="<%= dftBasic.getE01DEABRN() %>" >
            <%} else {%>
            <input type="text" name="E01DEABNK" size="3" maxlength="2" value="<%= dftBasic.getE01DEABNK() %>" onKeypress="enterInteger()">
            <input type="text" name="E01DEABRN" size="4" maxlength="3" value="<%= dftBasic.getE01DEABRN() %>" onKeypress="enterInteger()">
            <a href="javascript:GetBranch('E01DEABRN','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="bottom" border="0"  ></a>
            <%}%>
            </td>
          </tr>
          
          
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Interest Type:</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEAICT" size="2" maxlength="1" readonly value="<%= dftBasic.getE01DEAICT() %>">
              <a href="javascript:GetCode('E01DEAICT','STATIC_cd_formula.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absbottom" border="0" ></a></td>
            <td nowrap width="25%" > 
              <div align="right">Base Period :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DEABAS" size="4" maxlength="3" readonly value="<%= dftBasic.getE01DEABAS() %>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Interest Calculation Method:</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEAIFL" size="2" maxlength="1" readonly value="<%= dftBasic.getE01DEAIFL() %>">
              <a href="javascript:lnGetOver('E01DEAIFL','STATIC_ln_prov.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absbottom" border="0" ></a> 
            </td>
            <td nowrap width="25%" > 
              <div align="right">Penalty Rate/Late Fees:</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DEAPCL" size="2" maxlength="1" readonly value="<%= dftBasic.getE01DEAPCL() %>" >
              <a href="javascript:lnGetOver('E01DEAPCL','STATIC_ln_mor.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absbottom" border="0"  ></a></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Charges Table :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEATLN" size="2" maxlength="2" readonly value="<%= dftBasic.getE01DEATLN() %>">
              <a href="javascript:GetLoanTable('E01DEATLN',document.forms[0].E01DEATYP.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0"></a> 
            </td>
            <td nowrap width="25%" > 
              <div align="right">Grace Period:</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DEAGPD" size="3" maxlength="2" readonly value="<%= dftBasic.getE01DEAGPD() %>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Rate Table:</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEARTB" size="2" maxlength="1" readonly value="<%= dftBasic.getE01DEARTB() %>">
              <a href="javascript:GetRateTable('E01DEARTB')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0"></a> 
            </td>
            <td nowrap width="25%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="27%" >
              </td>
          </tr>
           
        </table>
      </td>
    </tr>
  </table>

<h4>Payment Account</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="33%"><div align="center">Concept</div></td>
            <td nowrap width="15%"><div align="center">Bank</div></td>
            <td nowrap width="22%"><div align="center">Branch</div></td>
            <td nowrap><div align="center">Currency </div></td>
            <td nowrap><div align="center">Reference</div></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="33%" > 
              <div align="center" nowrap> 
                <input type="text" name="E01PAGOPE" value="<%= dftBasic.getE01PAGOPE() %>" size="3" maxlength="3">
                <input type="hidden" name="E01PAGGLN" value="<%= dftBasic.getE01PAGGLN() %>">
                <input type="text" name="E01PAGCON" size="25" maxlength="25" readonly value="<%= dftBasic.getE01PAGCON() %>"
                  oncontextmenu="showPopUp(conceptHelp,this.name,document.forms[0].E01DEABNK.value,'','E01PAGGLN','E01PAGOPE','10')">
			  </div>
            </td>
            <td nowrap width="15%" > 
              <div align="center"> 
                <input type="text" name="E01PAGBNK" size="2" maxlength="2" value="<%= dftBasic.getE01PAGBNK() %>">
              </div>
            </td>
            <td nowrap width="22%" > 
              <div align="center"> 
                <input type="text" name="E01PAGBRN" size="3" maxlength="3" value="<%= dftBasic.getE01PAGBRN() %>"
                oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E01DEABNK.value,'','','','')">
			  </div>
            </td>
            <td nowrap width="14%" > 
              <div align="center"> 
                <input type="text" name="E01PAGCCY" size="3" maxlength="3" value="<%= dftBasic.getE01PAGCCY() %>"
                oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E01DEABNK.value,'','','','')">
			</div>
            </td>
            <td nowrap width="16%" > 
              <div align="center"> 
                <input type="text" name="E01PAGACC" size="12" maxlength="12"  value="<%= dftBasic.getE01PAGACC() %>"
                oncontextmenu="showPopUp(lnreferHelp,this.name,document.forms[0].E01DEABNK.value,'',document.forms[0].E01DEACUN.value,'','RT')">
			  </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="33%" >&nbsp;</td>
            <td nowrap width="15%" >&nbsp;</td>
            <td nowrap width="22%" >&nbsp;</td>
            <td nowrap width="14%" >&nbsp;</td>
            <td nowrap width="16%" >&nbsp;</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="33%" >Overdraft Authorization : <input type="text" name="E01DEAODA" size="2" maxlength="1" value="<%= dftBasic.getE01DEAODA() %>">
				<a href="javascript:lnGetOver('E01DEAODA','STATIC_ln_over.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absbottom" border="0"></a> 
            </td>
            <td nowrap width="15%" > 
              <div align="center"> </div>
            </td>
            <td nowrap width="22%" > 
              <div align="right">Allow Payments in Holidays: </div>
            </td>
            <td nowrap colspan="2" > 
              <div align="left">
                <input type="hidden" name="E01DEAHFQ" value="<%= dftBasic.getE01DEAHFQ() %>">
                <input type="radio" name="CE01DEAHFQ" value="1" onClick="document.forms[0].E01DEAHFQ.value='1'"
                <%if(dftBasic.getE01DEAHFQ().equals("1")) out.print("checked");%>> Yes 
                <input type="radio" name="CE01DEAHFQ" value="2" onClick="document.forms[0].E01DEAHFQ.value='2'"
			  	  <%if(dftBasic.getE01DEAHFQ().equals("2")) out.print("checked");%>> No 
			  </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

<% if (!dftBasic.getE01DEAACC().equals("999999999999")) { %>

<h4>Acceptants</h4>

<TABLE class="tableinfo">
	<tr > 
    	<td nowrap>
        	<table cellpadding="2" cellspacing="0" width="100%" border="0">
    			<TR bgcolor="#FFFFFF">
            		<TD colspan="2" align="center" width="50%">
            			<IMG id="eibsNew" src="<%=request.getContextPath()%>/images/e/accept.gif" align="middle" border="0" style="cursor:pointer" onclick = "goNew()"
            			onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','<%=request.getContextPath()%>/images/e/accept_over.gif',1)"> 
            		</TD>
                	<TD align="center" colspan="2" width="50%">
                		<A href="javascript:goAction('D')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image5','','<%=request.getContextPath()%>/images/e/documents_over.gif',1)">
                		<IMG name="Image5" border="0" src="<%=request.getContextPath()%>/images/e/documents.gif"></A>
    				</TD>
    			</TR>
    			<tr id="trdark">
      				<TD nowrap><div align="center"></div></TD>
            		<TD nowrap><div align="center">Identification</div></TD>
            		<TD nowrap><div align="center">Name</div></TD>
            		<TD nowrap><div align="center">Amount</div></TD>
                    <% 
						lstAcceptors.initRow();
						boolean firstTime = true;
						String chk = "";
     					while (lstAcceptors.getNextRow()) {
         					if (lstAcceptors.getFlag().equals("")) {
     							out.print("<tr id=\"trclear\">");
								out.print("<TD width=\"14\">");
              					if (firstTime) {
                 					chk = "checked"; 
                 					firstTime = false;
              					} else {
                 					chk = "";
								}
								out.print("<div align=\"center\"><INPUT type=\"radio\" name=\"IDACC1\" value=\"" + lstAcceptors.getRecord(0) +"\" " + chk + " ></div>");
								out.print("<TD nowrap width=\"162\">");
								out.print("<div align=\"center\"><INPUT size=\"20\" type=\"text\" name=\"IDACCEPTOR\" value=\"" + lstAcceptors.getRecord(0) + "\" readonly></div>");
								out.print("</TD>");
								out.print("<TD nowrap width=\"151\">");
								out.print("<div align=\"center\"><INPUT size=\"45\" type=\"text\" name=\"NMEACCEPTOR\" value=\"" + lstAcceptors.getRecord(1) + "\" readonly></div>");
								out.print("</TD>");
								out.print("<TD nowrap width=\"232\">");
								out.print("<div align=\"center\"><INPUT size=\"20\" type=\"text\" name=\"TOTACCEPTOR\" value=\"" + lstAcceptors.getRecord(2) + "\" readonly></div>");
								out.print("</TD>");
								out.print("</TD>");
								out.print("</tr>");
         					}
       					}
					%>
   			</tr>
		</table>
	</tr>
</table>

<% } %>

<p align="center">&nbsp;</p>

<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
	<tr bgcolor="#FFFFFF"> 
    	<td width="33%"><div align="center"></div></td>
      	<td width="34%"><div align="center"><input id="EIBSBTN" type=submit name="Submit" value="Submit"></div></td>
      	<td width="33%"><div align="center"></div></td>
    </tr>
</table>

<p align="center">&nbsp; </p>

</form>

<SCRIPT>
	applyTrans(document.getElementById("hiddenDivNew"));
	document.getElementById("hiddenDivNew").onclick = cancelBub;
	//document.getElementById("eibsNew").onclick = goNew;
</SCRIPT>

</body>
</html>
