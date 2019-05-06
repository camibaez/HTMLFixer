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

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT> 
 <script src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"></script>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">
  builtHPopUp();
  
  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
  }

function GetHelp(){
 var code = document.forms[0].E01PRIPVI.value;
 if( code == "1"){
  GetFedIdDesc('E01PRIRID','E01PRIRSH');
 }
 else {
  GetSwiftIdDesc('E01PRIRID','E01PRIRSH');
 }
}

function GetHelp1(){
 var code = document.forms[0].E01PRIPVI.value;
 if( code == "1"){
   GetFedIdDesc('E01PRISID','E01PRISSH');
 }
 else {
  
  GetSwiftIdDesc('E01PRISID','E01PRISSH');
 }
}

</SCRIPT>

<SCRIPT Language="Javascript">
  
  function showTab(index,name){
  
  for(var i=0;i<9;i++){
   document.all["Tab"+i].className="tabnormalv";
   document.all["dataTab"+i].style.display="none";
   }
  if(index < 4) {
    document.all["Tab"+index].className="tabhighlightl";
	colTab.className="tabdataleft";
  }else {
	document.all["Tab"+index].className="tabhighlightr";
	colTab.className="tabdataright";
  }
  document.all["dataTab"+index].style.display="";
  document.all[name].focus();
  }
 
  function UpdateCodes(fname,code4,code5,code6){
   if (fname=="E01PRIDPD") {
      document.forms[0].E01DEBSOU.value= code4;
      document.forms[0].E01DEBDIB.value= code5;
	  document.forms[0].E01PRIHDY.value= code6;          
   } else {
      document.forms[0].E01CRESOU.value= code4;
      document.forms[0].E01CREDIB.value= code5;
	  document.forms[0].E01CREDAY.value= code6;
   }
  
  }

function textCounter(field, maxlimit ) {
  
  if ( field.value.length >= maxlimit )
  {
    field.value = field.value.substring( 0, (maxlimit-1) );
    alert( 'Value can only be ' + maxlimit + ' characters in length.' );
    return false;
  }
  else
  {
    return true;
  }
}
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
%>

<h3 align="center">Payments<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="pr_incoming_maint.jsp,EPR0000"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPR0000">
  <p> 
    <input type=HIDDEN name="SCREEN" value="6">
    <% 
  if (userPO.getPurpose().equals("NEW")) { 
%> </p>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trclear"> 
            <td nowrap width="18%"> 
              <input type="checkbox" name="H01FLGWK3" <% if(prMant.getH01FLGWK3().equals("1"))  out.print("checked");%>
			  onClick="document.forms[0].H01FLGWK3.value='1'">
              Take information from : 
              <input type="text" name="E01CPYNUM" size="10" maxlength="9" onKeyPress="enterInteger()"
			  value="<%= prMant.getE01CPYNUM().trim()%>">
              <a href="javascript:GetCloneTransfer('E01CPYNUM')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0" ></a> 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

<% } %>

  <div id="OtherOpt"> <% 
  if (userPO.getPurpose().equals("NEW")) { 
%> <% } else{ %> 
    <SCRIPT Language="Javascript">
    builtNewMenu(pr_m_opt);
	initMenu();
  </SCRIPT>
    <% } %> 
    <div id="DivHead">
<table class="tableinfo">
    <tr > 
      <td nowrap> 
            <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
              <tr id="trdark">
	            <td nowrap  > 
	                <div align="right">Queues :</div>
	              </td>
	            <td nowrap > 
	                <div align="left"> 
	                  <input type="text" name="E01PRIDSQ" size="4" maxlength="3" value="<%= prMant.getE01PRIDSQ().trim()%>">
	                  <a href="javascript:GetCodeCNOFC('E01PRIDSQ','59')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="middle" border="0"></a> 
	                </div>
                </td>              
                <td nowrap >
                  <div align="right">Payment Via :</div>
                </td>
                <td nowrap > 
                  <div align="left">
                    <select name="E01PRIPVI">
                      <option value=" " <% if (!(prMant.getE01PRIPVI().equals("1") || prMant.getE01PRIPVI().equals("2") || prMant.getE01PRIPVI().equals("3") || 
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
                  </div>
                </td>
                <td nowrap > 
                  <div align="right">Type :</div>
                </td>
                <td nowrap align="left"> 
                  <select name="E01PRITTP">
                    <option value=" "> </option>
                    <option value="IT" <% if(prMant.getE01PRITTP().equals("IT")){ out.print("selected");} %> >Internal 
                    Transfer</option>
                    <option value="IW" <% if(prMant.getE01PRITTP().equals("IW")){ out.print("selected");} %> > 
                    External Incoming </option>
                    <option value="OW" <% if(prMant.getE01PRITTP().equals("OW")){ out.print("selected");} %> > 
                    External Outgoing </option>
                  </select>
                </td>
                <td nowrap align="right"> Reference No.: </td>
                <td nowrap align="left"> 
                  <input type="text" name="E01PRINUM" size="11" maxlength="10" value="<%= prMant.getE01PRINUM().trim()%>" readonly>
                </td>
              </tr>
            </table>
      </td>
    </tr>
   </table>
      <BR>
 </div>
    <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap VALIGN="TOP"> 
              <div align="right">Ordering Customer :<br> (FED Originator)</div>
            </td>
            <td nowrap VALIGN="TOP"> 
              <div align="left"> 
                <input type="text" name="E01PRIOCU" size="10" maxlength="10" value="<%= prMant.getE01PRIOCU().trim()%>">
                <a href="javascript:GetCustomerDescId('E01PRIOCU','','')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0"></a></div>
            </td>
            <td nowrap VALIGN="TOP"> 
              <div align="right">Identifier /Account : <BR>
				Name and Address : </div>
            </td>
            <td nowrap >
				<div align="right">
				  <SELECT name="E01PRIORO" >
					<OPTION value=" " <% if (!(prMant.getE01PRIORO().equals("A") ||prMant.getE01PRIORO().equals("D") ||prMant.getE01PRIORO().equals("F")||prMant.getE01PRIORO().equals("K"))) out.print("selected"); %>></OPTION>
					<OPTION value="A" <% if(prMant.getE01PRIORO().equals("A")) out.print("selected");%>>A</OPTION>
					<OPTION value="D" <% if(prMant.getE01PRIORO().equals("D")) out.print("selected");%>>D</OPTION>
					<OPTION value="F" <% if(prMant.getE01PRIORO().equals("F")) out.print("selected");%>>F</OPTION>
					<OPTION value="K" <% if(prMant.getE01PRIORO().equals("K")) out.print("selected");%>>K</OPTION>
				  </SELECT>
				<input type="text" name="E11PRIORC" size="36" maxlength="35" value="<%= prMant.getE11PRIORC().trim()%>"><br>
				<input type="text" name="E21PRIORC" size="36" maxlength="35" value="<%= prMant.getE21PRIORC().trim()%>"><br>
				<input type="text" name="E31PRIORC" size="36" maxlength="35" value="<%= prMant.getE31PRIORC().trim()%>"><br>
				<input type="text" name="E41PRIORC" size="36" maxlength="35" value="<%= prMant.getE41PRIORC().trim()%>"><br>
				<input type="text" name="E51PRIORC" size="36" maxlength="35" value="<%= prMant.getE51PRIORC().trim()%>"></div>
			</td>
          </tr>
         </table>
      </td>
    </tr>
  </table>
<BR>
<table class="tableinfo">
    
    <tr > 
      <td nowrap> 
          <table cellspacing=0 cellpadding=2 width="100%" border="0">
            <tr id="trdark"> 
              <td nowrap > 
                <div align="right">Transfer Currency / Amount :</div>
              </td>
              <td nowrap > 
                <input type="text" name="E01PRITCY" size="4" maxlength="3" value="<%= prMant.getE01PRITCY().trim()%>">
                <a href="javascript:GetCurrency('E01PRITCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0"></a> 
                <input type="text" name="E01PRIAMT" size="15" maxlength="13" value="<%= prMant.getE01PRIAMT().trim()%>"
				onKeyPress="enterDecimal()">
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
                  <a href="javascript:DatePicker(document.forms[0].E01PRIVDM,document.forms[0].E01PRIVDD,document.forms[0].E01PRIVDY)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></a> 
                </div>
              </td>
            </tr>
		    <tr id="trdark"> 
	            <td nowrap colspan="3" > 
	              <div align="right"></div>
	            </td>
	            <td nowrap colspan="3" > 
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
          <div align="center"> 
            <input type="text" name="E01PRIDRS" size="2" maxlength="2"  value="<%= prMant.getE01PRIDRS().trim()%>" onkeypress="enterInteger()">
            <input type="text" name="E01PRIDPD" size="15" maxlength="15"  value="<%= prMant.getE01PRIDPD().trim()%>" readonly
			 oncontextmenu="showPopUp(conceptTransacHelp,this.name,document.forms[0].E01PRIDBK.value,'','E01PRIDGL','E01PRIDRS','93')">
            <input type="hidden" name="E01DEBSOU"  value="<%= prMant.getE01DEBSOU().trim()%>">
            <input type="hidden" name="E01DEBDIB"  value="<%= prMant.getE01DEBDIB().trim()%>">
            <!--<input type="hidden" name="E01PRIHDY"  value="<%= prMant.getE01PRIHDY().trim()%>">--> 
          </div>
        </td>
        <td nowrap > 
          <div align="left"> 
            <input type="text" name="E01PRIDBK" size="2" maxlength="2" value="<%= prMant.getE01PRIDBK().trim()%>" >
          </div>
        </td>
        <td nowrap > 
          <div align="left"> 
            <input type="text" name="E01PRIDBR" size="4" maxlength="3"  value="<%= prMant.getE01PRIDBR().trim()%>"
           oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E01PRIDBK.value,'','','','')" onkeypress="enterInteger()">
          </div>
        </td>
        <td nowrap > 
          <div align="left"> 
            <input type="text" name="E01PRIDCY" size="3" maxlength="3" value="<%= prMant.getE01PRIDCY().trim()%>" 
			oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E01PRIDBK.value,'','','','')">
          </div>
        </td>
        <td nowrap > 
          <div align="left"> 
            <input type="text" name="E01PRIDGL" size="13" maxlength="12" value="<%= prMant.getE01PRIDGL().trim()%>" onkeypress="enterInteger()"
			oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01PRIDBK.value,document.forms[0].E01PRIDCY.value,'','','')">
          </div>
        </td>
        <td nowrap  > 
          <div align="left"> 
            <input type="text" name="E01PRIDAC" size="13" maxlength="12" value="<%= prMant.getE01PRIDAC().trim()%>"
			oncontextmenu="showPopUp(accountCustomerHelp,this.name,document.forms[0].E01PRIDBK.value,'','E01DRANME','','RT')"  onKeyPress="enterInteger()">
          </div>
        </td>
		<td nowrap  > 
          <div align="left"> 
            <input type="text" name="E01PRIDSA" size="6" maxlength="5" value="<%= prMant.getE01PRIDSA().trim()%>"
			oncontextmenu="showPopUp(subaccountCustomerHelp,this.name,'','',document.forms[0].document.forms[0].E01PRIDAC.value,'E01DRANME','')"  onKeyPress="enterInteger()">
          </div>
        </td>          
        <td nowrap > 
          <div align="left"> 
            <input type="text" name="E01PRIDCC" size="7" maxlength="6"  value="<%= prMant.getE01PRIDCC().trim()%>" 
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
            <input type="text" name="E01PRICPD" size="15" maxlength="15"  value="<%= prMant.getE01PRICPD().trim()%>" readonly
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
              <td nowrap width="24%" > 
                <div align="right">Table/ Amount :</div>
              </td>
              <td nowrap width="30%" > 
                <input type="text" name="E01PRICOT" size="2" maxlength="2" value="<%= prMant.getE01PRICOT().trim()%>" onKeyPress="enterInteger()">
                <a href="javascript:GetCNTRLPRF('E01PRICOT','E01PRICOM')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="middle" border="0"></a> 
                <input type="text" name="E01PRICOM" size="15" maxlength="13" value="<%= prMant.getE01PRICOM().trim()%>" onKeyPress="enterDecimal()">
              </td>
              <td nowrap width="17%" > 
                <div align="right">Charges by :</div>
              </td>
              <td nowrap width="29%" > 
                <select name="E01PRICHG">
                  <option value="A" <% if (prMant.getE01PRICHG().equals("A")) out.print("selected"); %>>Applicant</option>
                  <option value="B" <% if (prMant.getE01PRICHG().equals("B")) out.print("selected"); %>>Beneficiary</option>
                  <option value="S" <% if (prMant.getE01PRICHG().equals("S")) out.print("selected"); %>>Share</option>
                  <option value="N" <% if (prMant.getE01PRICHG().equals("N")) out.print("selected"); %>>None</option>
                  <option value="O" <% if (!(prMant.getE01PRICHG().equals("A") || prMant.getE01PRICHG().equals("B") || prMant.getE01PRICHG().equals("N")))
									 out.print("selected"); %>>Ours</option>
                </select>
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="24%" >&nbsp;</td>
              <td nowrap width="30%" >&nbsp;</td>
              <td nowrap width="17%" > 
                <div align="right">Currency/ Amount :</div>
              </td>
              <td nowrap width="29%" > 
                <input type="text" name="E01PRIRCC" size="4" maxlength="3" value="<%= prMant.getE01PRIRCC().trim()%>">
                <a href="javascript:GetCurrency('E01PRIRCC','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0"></a> 
                <input type="text" name="E01PRIRRA" size="15" maxlength="13" value="<%= prMant.getE01PRIRRA().trim()%>"
				onKeyPress="enterDecimal()">
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
   
    <h4>Additional Information</h4>
    <table class="tableinfo">
      <tr > 
        <td > 
          <table cellspacing=0 cellpadding=2 width="100%" border="0">
            <tr id="trdark"> 
              <td nowrap> 
                <div align="right">Sender ID :</div>
              </td>
              <td nowrap > 
                <div align="left"> 
                  <input type="text" name="E01PRISID" size="15" maxlength="15" value="<%= prMant.getE01PRISID().trim()%>">
                  <a href="javascript:GetHelp1()"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="middle" border="0"></a></div>
              </td>
              <td nowrap > 
                <div align="right">Receiver ID :</div>
              </td>
              <td nowrap > 
                <input type="text" name="E01PRIRID" size="15" maxlength="15" value="<%= prMant.getE01PRIRID().trim()%>">
                <a href="javascript:GetHelp()"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="middle" border="0"></a></td>
            </tr>
            <tr id="trclear"> 
              <td nowrap  > 
                <div align="right">Sender Short Name :</div>
              </td>
              <td nowrap > 
                <div align="left"> 
                  <input type="text" name="E01PRISSH" size="15" maxlength="15" value="<%= prMant.getE01PRISSH().trim()%>">
                </div>
              <td nowrap > 
                <div align="right">Receiver Short Name :</div>
              </td>
              <td nowrap > 
                <input type="text" name="E01PRIRSH" size="15" maxlength="15" value="<%= prMant.getE01PRIRSH().trim()%>">
            </tr>
            <tr id="trdark"> 
              <td nowrap > 
                <div align="right">Check Format :</div>
              </td>
              <td nowrap > 
                <input type="text" name="E01PRIFL3" size="2" maxlength="1" value="<%= prMant.getE01PRIFL3().trim()%>">
			  </td>
              <td nowrap > 
                <div align="right"></div>
              </td>
              <td nowrap > 
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap  > 
                <div align="right">Fed Type / Sub Type :</div>
              </td>
              <td nowrap > 
                <input type="text" name="E01FEDTYP" size="3" maxlength="2" value="<%= prMant.getE01FEDTYP().trim()%>">
                <a href="javascript:GetCode('E01FEDTYP','STATIC_pr_types.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a> 
                <input type="text" name="E01FEDSTY" size="3" maxlength="2" value="<%= prMant.getE01FEDSTY().trim()%>">
                <a href="javascript:GetCode('E01FEDSTY','STATIC_pr_subtypes.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a> 
              </td>
              <td nowrap > 
                <div align="right">Fed Product Code :</div>
              </td>
              <td nowrap > 
                <input type="text" name="E01PRIPRC" size="3" maxlength="3" value="<%= prMant.getE01PRIPRC().trim()%>">
                <a href="javascript:GetCode('E01PRIPRC','STATIC_pr_fed.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a> 
              </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap  > 
                <div align="right">Regulatory Report :</div>
              </td>
              <td nowrap colspan="3" > 
                <input type="text" name="E11PRIRTR" size="36" maxlength="35" value="<%= prMant.getE11PRIRTR().trim()%>">
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap  >&nbsp;</td>
              <td nowrap colspan="3" > 
                <input type="text" name="E21PRIRTR" size="36" maxlength="35" value="<%= prMant.getE21PRIRTR().trim()%>">
              </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap  >&nbsp;</td>
              <td nowrap colspan="3" > 
                <input type="text" name="E31PRIRTR" size="36" maxlength="35" value="<%= prMant.getE31PRIRTR().trim()%>">
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap  > 
                <div align="right">Source of Funds :</div>
              </td>
              <td nowrap > 
                <div align="left"> 
                  <input type="text" name="E01PRISOU" size="2" maxlength="2" value="<%= prMant.getE01PRISOU().trim()%>">
                  <A href="javascript:GetSpecUsrTab('E01PRISOU','14')"><IMG
					src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"
					align="middle" border="0"></A><a href="javascript:GetCodeUSFL('SOURCE OF FUNDS','14')"></a></div>
              </td>
              <td nowrap > 
                <div align="right">Disbursement of Funds :</div>
              </td>
              <td nowrap > 
                <input type="text" name="E01PRIDIB" size="2" maxlength="2" value="<%= prMant.getE01PRIDIB().trim()%>">
                <A href="javascript:GetSpecUsrTab('E01PRIDIB','14')"><IMG
					src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"
					align="middle" border="0"></A><a href="javascript:GetCodeUSFL('DISBURSEMENT OF FUNDS','14')"></a></td>
            </tr>
            <tr id="trdark"> 
              <td nowrap  > 
                <div align="right">Swift Reference :</div>
              </td>
              <td nowrap > 
                <input type="text" name="E01PRISRF" size="17" maxlength="16" value="<%= prMant.getE01PRISRF().trim()%>">
              </td>
              <td nowrap > 
                <div align="right">Their Reference :</div>
              </td>
              <td nowrap > 
                <div align="left"> 
                  <input type="text" name="E01PRITHF" size="17" maxlength="16" value="<%= prMant.getE01PRITHF().trim()%>">
                </div>
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap  > 
                <div align="right">Bank Operation Code :</div>
              </td>
              <td nowrap > 
                <div align="left"> 
                  <input type="text" name="E01PRIBKO" size="6" maxlength="4" value="<%= prMant.getE01PRIBKO()%>">
                  <a href="javascript:GetCode('E01PRIBKO','STATIC_tr_operations.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a> 
                </div>
              </td>
              <td nowrap > 
                <div align="right">Instructions Code :</div>
              </td>
              <td nowrap > 
                <div align="left"> 
                  <input type="text" name="E01PRIITC" size="6" maxlength="4" value="<%= prMant.getE01PRIITC()%>">
                  <a href="javascript:GetCode('E01PRIITC','STATIC_tr_instructions.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a> 
                  <input type="text" name="E01PRIITA" size="11" maxlength="10" value="<%= prMant.getE01PRIITA()%>">
                </div>
              </td>
            </tr>
            <tr id="trdark">
              <td nowrap  >
                <div align="right">Instructions Received Via :</div>
              </td>
              <td nowrap >
                <div align="left">
                  <input type="text" name="E01PRIIRV" size="3" maxlength="1" value="<%= prMant.getE01PRIIRV().trim()%>">
                  <a href="javascript:GetCode('E01PRIIRV','STATIC_pr_via.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a></div>
              </td>
              <td nowrap >&nbsp;</td>
              <td nowrap >&nbsp;</td>
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
    			<td nowrap width="50%" align="center"><b>Detail of Payment</b>
    			</td>
    		</tr>  
    		<tr id="trclear">
    			<td nowrap width="50%">
				<div align="center">
							<table >
                            <tr> 
                              <td> 
                                <input type="text" name="E11PRIDTO" size="36" maxlength="35" value="<%= prMant.getE11PRIDTO().trim()%>">
                              </td>
                            </tr>
                            <tr> 
                              <td> 
                                <input type="text" name="E21PRIDTO" size="36" maxlength="35" value="<%= prMant.getE21PRIDTO().trim()%>">
                              </td>
                            </tr>
                            <tr> 
                              <td> 
                                <input type="text" name="E31PRIDTO" size="36" maxlength="35" value="<%= prMant.getE31PRIDTO().trim()%>">
                              </td>
                            </tr>
                            <tr> 
                              <td> 
                                <input type="text" name="E41PRIDTO" size="36" maxlength="35" value="<%= prMant.getE41PRIDTO().trim()%>">
                              </td>
                            </tr>
                            <tr> 
                              <td> 
                                <input type="text" name="E51PRIDTO" size="36" maxlength="35" value="<%= prMant.getE51PRIDTO().trim()%>">
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
                                <input type="text" name="E11PRIDTP" size="36" maxlength="35" value="<%= prMant.getE11PRIDTP().trim()%>">
                              </td>
                            </tr>
                            <tr> 
                              <td> 
                                <input type="text" name="E21PRIDTP" size="36" maxlength="35" value="<%= prMant.getE21PRIDTP().trim()%>">
                              </td>
                            </tr>
                            <tr> 
                              <td> 
                                <input type="text" name="E31PRIDTP" size="36" maxlength="35" value="<%= prMant.getE31PRIDTP().trim()%>">
                              </td>
                            </tr>
                            <tr> 
                              <td> 
                                <input type="text" name="E41PRIDTP" size="36" maxlength="35" value="<%= prMant.getE41PRIDTP().trim()%>">
                              </td>
                            </tr>
                            <tr> 
                              <td> 
                                <input type="text" name="E51PRIDTP" size="36" maxlength="35" value="<%= prMant.getE51PRIDTP().trim()%>">
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
    		<td nowrap width="50%" align="center"><b>Beneficiary</b>
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
                                  <select name="E01PRIBCO">
                                    <option value=" " <% if (!(prMant.getE01PRIBCO().equals("A") ||prMant.getE01PRIBCO().equals("B") ||prMant.getE01PRIBCO().equals("D") ||prMant.getE01PRIBCO().equals("F"))) out.print("selected"); %>></option>
                                    <option value="A" <% if(prMant.getE01PRIBCO().equals("A")) out.print("selected");%>>A</option>
                                    <option value="B" <% if(prMant.getE01PRIBCO().equals("B")) out.print("selected");%>>B</option>
                                    <option value="D" <% if(prMant.getE01PRIBCO().equals("D")) out.print("selected");%>>D</option>
                                    <option value="F" <% if(prMant.getE01PRIBCO().equals("F")) out.print("selected");%>>F</option>
                                  </select>
                                  <input type="text" name="E11PRIBCU" size="36" maxlength="35" value="<%= prMant.getE11PRIBCU().trim()%>">
                                </div>
                              </td>
                            </tr>
                            <tr> 
                              <td> 
                                <div align="right"> 
                                  <input type="text" name="E21PRIBCU" size="36" maxlength="35" value="<%= prMant.getE21PRIBCU().trim()%>">
                                </div>
                              </td>
                            </tr>
                            <tr> 
                              <td> 
                                <div align="right"> 
                                  <input type="text" name="E31PRIBCU" size="36" maxlength="35" value="<%= prMant.getE31PRIBCU().trim()%>">
                                </div>
                              </td>
                            </tr>
                            <tr> 
                              <td> 
                                <div align="right"> 
                                  <input type="text" name="E41PRIBCU" size="36" maxlength="35" value="<%= prMant.getE41PRIBCU().trim()%>">
                                </div>
                              </td>
                            </tr>
                            <tr> 
                              <td> 
                                <div align="right"> 
                                  <input type="text" name="E51PRIBCU" size="36" maxlength="35" value="<%= prMant.getE51PRIBCU().trim()%>">
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
                                  <select name="E01PRIBBO">
                                    <option value=" " <% if (!(prMant.getE01PRIBBO().equals("A") ||prMant.getE01PRIBBO().equals("B") ||prMant.getE01PRIBBO().equals("D") ||prMant.getE01PRIBBO().equals("F"))) out.print("selected"); %>></option>
                                    <option value="A" <% if(prMant.getE01PRIBBO().equals("A")) out.print("selected");%>>A</option>
                                    <option value="B" <% if(prMant.getE01PRIBBO().equals("B")) out.print("selected");%>>B</option>
                                    <option value="D" <% if(prMant.getE01PRIBBO().equals("D")) out.print("selected");%>>D</option>
                                    <option value="F" <% if(prMant.getE01PRIBBO().equals("F")) out.print("selected");%>>F</option>
                                  </select>
                                  <input type="text" name="E11PRIBBK" size="36" maxlength="35" value="<%= prMant.getE11PRIBBK().trim()%>">
                                </div>
                              </td>
                            </tr>
                            <tr> 
                              <td> 
                                <div align="right"> 
                                  <input type="text" name="E21PRIBBK" size="36" maxlength="35" value="<%= prMant.getE21PRIBBK().trim()%>">
                                </div>
                              </td>
                            </tr>
                            <tr> 
                              <td> 
                                <div align="right"> 
                                  <input type="text" name="E31PRIBBK" size="36" maxlength="35" value="<%= prMant.getE31PRIBBK().trim()%>">
                                </div>
                              </td>
                            </tr>
                            <tr> 
                              <td> 
                                <div align="right"> 
                                  <input type="text" name="E41PRIBBK" size="36" maxlength="35" value="<%= prMant.getE41PRIBBK().trim()%>">
                                </div>
                              </td>
                            </tr>
                            <tr> 
                              <td> 
                                <div align="right"> 
                                  <input type="text" name="E51PRIBBK" size="36" maxlength="35" value="<%= prMant.getE51PRIBBK().trim()%>">
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
    			<td nowrap width="50%" align="center"><b>Bank to Bank Info</b>
    			</td>
    			<td nowrap width="50%" align="center"><b>Intermediary Bank</b>
    			</td>
    		</tr>  
    		<tr id="trclear">
    			<td nowrap width="50%">
				<div align="center">
							<table >
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
				<td nowrap width="50%">
					<div align="center">
                          <table>
                            <tr> 
                              <td> 
                                <div align="right"> 
                                  <select name="E01PRIINO">
                                    <option value=" " <% if (!(prMant.getE01PRIINO().equals("A") ||prMant.getE01PRIINO().equals("B") ||prMant.getE01PRIINO().equals("D") ||prMant.getE01PRIINO().equals("F"))) out.print("selected"); %>></option>
                                    <option value="A" <% if(prMant.getE01PRIINO().equals("A")) out.print("selected");%>>A</option>
                                    <option value="B" <% if(prMant.getE01PRIINO().equals("B")) out.print("selected");%>>B</option>
                                    <option value="D" <% if(prMant.getE01PRIINO().equals("D")) out.print("selected");%>>D</option>
                                    <option value="F" <% if(prMant.getE01PRIINO().equals("F")) out.print("selected");%>>F</option>
                                  </select>
                                  <input type="text" name="E11PRIINB" size="36" maxlength="35" value="<%= prMant.getE11PRIINB().trim()%>">
                                </div>
                              </td>
                            </tr>
                            <tr> 
                              <td> 
                                <div align="right"> 
                                  <input type="text" name="E21PRIINB" size="36" maxlength="35" value="<%= prMant.getE21PRIINB().trim()%>">
                                </div>
                              </td>
                            </tr>
                            <tr> 
                              <td> 
                                <div align="right"> 
                                  <input type="text" name="E31PRIINB" size="36" maxlength="35" value="<%= prMant.getE31PRIINB().trim()%>">
                                </div>
                              </td>
                            </tr>
                            <tr> 
                              <td> 
                                <div align="right"> 
                                  <input type="text" name="E41PRIINB" size="36" maxlength="35" value="<%= prMant.getE41PRIINB().trim()%>">
                                </div>
                              </td>
                            </tr>
                            <tr> 
                              <td> 
                                <div align="right"> 
                                  <input type="text" name="E51PRIINB" size="36" maxlength="35" value="<%= prMant.getE51PRIINB().trim()%>">
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
    		<td nowrap width="50%" align="center"><b>Sender Correspondent Bank</b>
    		</td>
    		<td nowrap width="50%" align="center"><b>Receiver Correspondent Bank<BR>
				(FED Instructing Bank)</b>
    		</td>
    	</tr>     
		<tr id="trclear">
			<td>
				<div align="center">
					<table >
                            <tr> 
                              <td> 
                                <div align="right"> 
                                  <select name="E01PRISCO">
                                    <option value=" " <% if (!(prMant.getE01PRISCO().equals("A") ||prMant.getE01PRISCO().equals("B") ||prMant.getE01PRISCO().equals("D") ||prMant.getE01PRISCO().equals("F"))) out.print("selected"); %>></option>
                                    <option value="A" <% if(prMant.getE01PRISCO().equals("A")) out.print("selected");%>>A</option>
                                    <option value="B" <% if(prMant.getE01PRISCO().equals("B")) out.print("selected");%>>B</option>
                                    <option value="D" <% if(prMant.getE01PRISCO().equals("D")) out.print("selected");%>>D</option>
                                    <option value="F" <% if(prMant.getE01PRISCO().equals("F")) out.print("selected");%>>F</option>
                                  </select>
                                  <input type="text" name="E11PRISCB" size="36" maxlength="35" value="<%= prMant.getE11PRISCB().trim()%>">
                                </div>
                              </td>
                            </tr>
                            <tr> 
                              <td> 
                                <div align="right"> 
                                  <input type="text" name="E21PRISCB" size="36" maxlength="35" value="<%= prMant.getE21PRISCB().trim()%>">
                                </div>
                              </td>
                            </tr>
                            <tr> 
                              <td> 
                                <div align="right"> 
                                  <input type="text" name="E31PRISCB" size="36" maxlength="35" value="<%= prMant.getE31PRISCB().trim()%>">
                                </div>
                              </td>
                            </tr>
                            <tr> 
                              <td> 
                                <div align="right"> 
                                  <input type="text" name="E41PRISCB" size="36" maxlength="35" value="<%= prMant.getE41PRISCB().trim()%>">
                                </div>
                              </td>
                            </tr>
                            <tr> 
                              <td> 
                                <div align="right"> 
                                  <input type="text" name="E51PRISCB" size="36" maxlength="35" value="<%= prMant.getE51PRISCB().trim()%>">
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
                                  <select name="E01PRIRBO">
                                    <option value=" " <% if (!(prMant.getE01PRIRBO().equals("A") ||prMant.getE01PRIRBO().equals("B") ||prMant.getE01PRIRBO().equals("D") ||prMant.getE01PRIRBO().equals("F"))) out.print("selected"); %>></option>
                                    <option value="A" <% if(prMant.getE01PRIRBO().equals("A")) out.print("selected");%>>A</option>
                                    <option value="B" <% if(prMant.getE01PRIRBO().equals("B")) out.print("selected");%>>B</option>
                                    <option value="D" <% if(prMant.getE01PRIRBO().equals("D")) out.print("selected");%>>D</option>
                                    <option value="F" <% if(prMant.getE01PRIRBO().equals("F")) out.print("selected");%>>F</option>
                                  </select>
                                  <input type="text" name="E11PRIRCB" size="36" maxlength="35" value="<%= prMant.getE11PRIRCB().trim()%>">
                                </div>
                              </td>
                            </tr>
                            <tr> 
                              <td> 
                                <div align="right"> 
                                  <input type="text" name="E21PRIRCB" size="36" maxlength="35" value="<%= prMant.getE21PRIRCB().trim()%>">
                                </div>
                              </td>
                            </tr>
                            <tr> 
                              <td> 
                                <div align="right"> 
                                  <input type="text" name="E31PRIRCB" size="36" maxlength="35" value="<%= prMant.getE31PRIRCB().trim()%>">
                                </div>
                              </td>
                            </tr>
                            <tr> 
                              <td> 
                                <div align="right"> 
                                  <input type="text" name="E41PRIRCB" size="36" maxlength="35" value="<%= prMant.getE41PRIRCB().trim()%>">
                                </div>
                              </td>
                            </tr>
                            <tr> 
                              <td> 
                                <div align="right"> 
                                  <input type="text" name="E51PRIRCB" size="36" maxlength="35" value="<%= prMant.getE51PRIRCB().trim()%>">
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
    		<td nowrap width="50%" align="center"><b>Originator Bank</b>
    		</td>
    		<td nowrap width="50%">
    		</td>
    	</tr>     
		<tr id="trclear">
			<td>
				<div align="center">
					<table >
                            <tr> 
                              <td> 
                                <div align="right"> 
                                  <select name="E01PRIOBO">
                                    <option value=" " <% if (!(prMant.getE01PRIOBO().equals("A") ||prMant.getE01PRIOBO().equals("D") ||prMant.getE01PRIOBO().equals("F"))) out.print("selected"); %>></option>
                                    <option value="A" <% if(prMant.getE01PRIOBO().equals("A")) out.print("selected");%>>A</option>
                                    <option value="D" <% if(prMant.getE01PRIOBO().equals("D")) out.print("selected");%>>D</option>
                                    <option value="F" <% if(prMant.getE01PRIOBO().equals("F")) out.print("selected");%>>F</option>
                                  </select>
                                  <input type="text" name="E11PRIOBK" size="36" maxlength="35" value="<%= prMant.getE11PRIOBK().trim()%>">
                                </div>
                              </td>
                            </tr>
                            <tr> 
                              <td> 
                                <div align="right"> 
                                  <input type="text" name="E21PRIOBK" size="36" maxlength="35" value="<%= prMant.getE21PRIOBK().trim()%>">
                                </div>
                              </td>
                            </tr>
                            <tr> 
                              <td> 
                                <div align="right"> 
                                  <input type="text" name="E31PRIOBK" size="36" maxlength="35" value="<%= prMant.getE31PRIOBK().trim()%>">
                                </div>
                              </td>
                            </tr>
                            <tr> 
                              <td> 
                                <div align="right"> 
                                  <input type="text" name="E41PRIOBK" size="36" maxlength="35" value="<%= prMant.getE41PRIOBK().trim()%>">
                                </div>
                              </td>
                            </tr>
                            <tr> 
                              <td> 
                                <div align="right"> 
                                  <input type="text" name="E51PRIOBK" size="36" maxlength="35" value="<%= prMant.getE51PRIOBK().trim()%>">
                                </div>
                              </td>
                            </tr>
                          </table>
				</div>
			</td>
			<td>
				<div align="center">
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
	  if (!prMant.getE01PRATG0().trim().equals("")) { 
	%>
    <TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" name="E01PRASQ0" size="2" maxlength="1" value="<%= prMant.getE01PRASQ0().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" name="E01PRATG0" size="5" maxlength="4" value="<%= prMant.getE01PRATG0().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="20%" valign="top">
			<INPUT type="text" name="E01TAGDS0" size="31" maxlength="30" value="<%= prMant.getE01TAGDS0().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" name="E01PRAOP0" size="2" maxlength="1" value="<%= prMant.getE01PRAOP0().trim()%>" >
		</td>
		<td NOWRAP align="left" width="65%" valign="top">
	        <%
	        int row = 1;
	        int col = 42;
	        int ln = Integer.parseInt(prMant.getE01TAGLE0().trim());
	        if (ln <= 35) {
	          col = ln + 7;
	        } else {
	          row = ln / 35;
	        }  	
	        %>
			<TEXTAREA name="E01PRAFL0" cols="<%=col%>" rows="<%=row%>" style="overflow:hidden"
			 onkeypress="textCounter(this,<%=prMant.getE01TAGLE0().trim()%>)"
			 ><%= prMant.getE01PRAFL0().trim()%></TEXTAREA>  
		</td>
	</TR>
	<% } %>
	<% 
	  if (!prMant.getE01PRATG1().trim().equals("")) { 
	%>
    <TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" name="E01PRASQ1" size="2" maxlength="1" value="<%= prMant.getE01PRASQ1().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" name="E01PRATG1" size="5" maxlength="4" value="<%= prMant.getE01PRATG1().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="20%" valign="top">
			<INPUT type="text" name="E01TAGDS1" size="31" maxlength="30" value="<%= prMant.getE01TAGDS1().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" name="E01PRAOP1" size="2" maxlength="1" value="<%= prMant.getE01PRAOP1().trim()%>" >
		</td>
		<td NOWRAP align="left" width="65%" valign="top">
			<%
	        int row = 1;
	        int col = 42;
	        int ln = Integer.parseInt(prMant.getE01TAGLE1().trim());
	        if (ln <= 35) {
	          col = ln + 7;
	        } else {
	          row = ln / 35;
	        }  	
	        %>
			<TEXTAREA name="E01PRAFL1" cols="<%=col%>" rows="<%=row%>" style="overflow:hidden"
			 onkeypress="textCounter(this,<%=prMant.getE01TAGLE1().trim()%>)"
			 ><%= prMant.getE01PRAFL1().trim()%></TEXTAREA>  
		</td>
	</TR>
	<% } %>  
	<% 
	  if (!prMant.getE01PRATG2().trim().equals("")) { 
	%>
    <TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" name="E01PRASQ2" size="2" maxlength="1" value="<%= prMant.getE01PRASQ2().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" name="E01PRATG2" size="5" maxlength="4" value="<%= prMant.getE01PRATG2().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="20%" valign="top">
			<INPUT type="text" name="E01TAGDS2" size="31" maxlength="30" value="<%= prMant.getE01TAGDS2().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" name="E01PRAOP2" size="2" maxlength="1" value="<%= prMant.getE01PRAOP2().trim()%>" >
		</td>
		<td NOWRAP align="left" width="65%" valign="top">
			<%
	        int row = 1;
	        int col = 42;
	        int ln = Integer.parseInt(prMant.getE01TAGLE2().trim());
	        if (ln <= 35) {
	          col = ln + 7;
	        } else {
	          row = ln / 35;
	        }  	
	        %>
			<TEXTAREA name="E01PRAFL2" cols="<%=col%>" rows="<%=row%>" style="overflow:hidden"
			 onkeypress="textCounter(this,<%=prMant.getE01TAGLE2().trim()%>)"
			 ><%= prMant.getE01PRAFL2().trim()%></TEXTAREA>  
		</td>
	</TR>
	<% } %>  
	<% 
	  if (!prMant.getE01PRATG3().trim().equals("")) { 
	%>
    <TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" name="E01PRASQ3" size="2" maxlength="1" value="<%= prMant.getE01PRASQ3().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" name="E01PRATG3" size="5" maxlength="4" value="<%= prMant.getE01PRATG3().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="20%" valign="top">
			<INPUT type="text" name="E01TAGDS3" size="31" maxlength="30" value="<%= prMant.getE01TAGDS3().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" name="E01PRAOP3" size="2" maxlength="1" value="<%= prMant.getE01PRAOP3().trim()%>" >
		</td>
		<td NOWRAP align="left" width="65%" valign="top">
			<%
	        int row = 1;
	        int col = 42;
	        int ln = Integer.parseInt(prMant.getE01TAGLE3().trim());
	        if (ln <= 35) {
	          col = ln + 7;
	        } else {
	          row = ln / 35;
	        }  	
	        %>
			<TEXTAREA name="E01PRAFL3" cols="<%=col%>" rows="<%=row%>" style="overflow:hidden"
			 onkeypress="textCounter(this,<%=prMant.getE01TAGLE3().trim()%>)"
			 ><%= prMant.getE01PRAFL3().trim()%></TEXTAREA>  
		</td>
	</TR>
	<% } %>  
	<% 
	  if (!prMant.getE01PRATG4().trim().equals("")) { 
	%>
    <TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" name="E01PRASQ4" size="2" maxlength="1" value="<%= prMant.getE01PRASQ4().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" name="E01PRATG4" size="5" maxlength="4" value="<%= prMant.getE01PRATG4().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="20%" valign="top">
			<INPUT type="text" name="E01TAGDS4" size="31" maxlength="30" value="<%= prMant.getE01TAGDS4().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" name="E01PRAOP4" size="2" maxlength="1" value="<%= prMant.getE01PRAOP4().trim()%>" >
		</td>
		<td NOWRAP align="left" width="65%" valign="top">
			<%
	        int row = 1;
	        int col = 42;
	        int ln = Integer.parseInt(prMant.getE01TAGLE4().trim());
	        if (ln <= 35) {
	          col = ln + 7;
	        } else {
	          row = ln / 35;
	        }  	
	        %>
			<TEXTAREA name="E01PRAFL4" cols="<%=col%>" rows="<%=row%>" style="overflow:hidden" 
			 onkeypress="textCounter(this,<%=prMant.getE01TAGLE4().trim()%>)" 
			 ><%= prMant.getE01PRAFL4().trim()%></TEXTAREA>  
		</td>
	</TR>
	<% } %>  
	<% 
	  if (!prMant.getE01PRATG5().trim().equals("")) { 
	%>
    <TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" name="E01PRASQ5" size="2" maxlength="1" value="<%= prMant.getE01PRASQ5().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" name="E01PRATG5" size="5" maxlength="4" value="<%= prMant.getE01PRATG5().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="20%" valign="top">
			<INPUT type="text" name="E01TAGDS5" size="31" maxlength="30" value="<%= prMant.getE01TAGDS5().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" name="E01PRAOP5" size="2" maxlength="1" value="<%= prMant.getE01PRAOP5().trim()%>" >
		</td>
		<td NOWRAP align="left" width="65%" valign="top">
			<%
	        int row = 1;
	        int col = 42;
	        int ln = Integer.parseInt(prMant.getE01TAGLE5().trim());
	        if (ln <= 35) {
	          col = ln + 7;
	        } else {
	          row = ln / 35;
	        }  	
	        %>
			<TEXTAREA name="E01PRAFL5" cols="<%=col%>" rows="<%=row%>" style="overflow:hidden"
			 onkeypress="textCounter(this,<%=prMant.getE01TAGLE5().trim()%>)"
			 ><%= prMant.getE01PRAFL5().trim()%></TEXTAREA>  
		</td>
	</TR>
	<% } %>  
	<% 
	  if (!prMant.getE01PRATG6().trim().equals("")) { 
	%>
    <TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" name="E01PRASQ6" size="2" maxlength="1" value="<%= prMant.getE01PRASQ6().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" name="E01PRATG6" size="5" maxlength="4" value="<%= prMant.getE01PRATG6().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="20%" valign="top">
			<INPUT type="text" name="E01TAGDS6" size="31" maxlength="30" value="<%= prMant.getE01TAGDS6().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" name="E01PRAOP6" size="2" maxlength="1" value="<%= prMant.getE01PRAOP6().trim()%>" >
		</td>
		<td NOWRAP align="left" width="65%" valign="top">
			<%
	        int row = 1;
	        int col = 42;
	        int ln = Integer.parseInt(prMant.getE01TAGLE6().trim());
	        if (ln <= 35) {
	          col = ln + 7;
	        } else {
	          row = ln / 35;
	        }  	
	        %>
			<TEXTAREA name="E01PRAFL6" cols="<%=col%>" rows="<%=row%>" style="overflow:hidden"
			 onkeypress="textCounter(this,<%=prMant.getE01TAGLE6().trim()%>)"
			 ><%= prMant.getE01PRAFL6().trim()%></TEXTAREA>  
		</td>
	</TR>
	<% } %>  
	<% 
	  if (!prMant.getE01PRATG7().trim().equals("")) { 
	%>
    <TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" name="E01PRASQ7" size="2" maxlength="1" value="<%= prMant.getE01PRASQ7().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" name="E01PRATG7" size="5" maxlength="4" value="<%= prMant.getE01PRATG7().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="20%" valign="top">
			<INPUT type="text" name="E01TAGDS7" size="31" maxlength="30" value="<%= prMant.getE01TAGDS7().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" name="E01PRAOP7" size="2" maxlength="1" value="<%= prMant.getE01PRAOP7().trim()%>" >
		</td>
		<td NOWRAP align="left" width="65%" valign="top">
			<%
	        int row = 1;
	        int col = 42;
	        int ln = Integer.parseInt(prMant.getE01TAGLE7().trim());
	        if (ln <= 35) {
	          col = ln + 7;
	        } else {
	          row = ln / 35;
	        }  	
	        %>
			<TEXTAREA name="E01PRAFL7" cols="<%=col%>" rows="<%=row%>" style="overflow:hidden"
			 onkeypress="textCounter(this,<%=prMant.getE01TAGLE7().trim()%>)"
			 ><%= prMant.getE01PRAFL7().trim()%></TEXTAREA>  
		</td>
	</TR>
	<% } %>  
	<% 
	  if (!prMant.getE01PRATG8().trim().equals("")) { 
	%>
    <TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" name="E01PRASQ8" size="2" maxlength="1" value="<%= prMant.getE01PRASQ8().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" name="E01PRATG8" size="5" maxlength="4" value="<%= prMant.getE01PRATG8().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="20%" valign="top">
			<INPUT type="text" name="E01TAGDS8" size="31" maxlength="30" value="<%= prMant.getE01TAGDS8().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" name="E01PRAOP8" size="2" maxlength="1" value="<%= prMant.getE01PRAOP8().trim()%>" >
		</td>
		<td NOWRAP align="left" width="65%" valign="top">
			<%
	        int row = 1;
	        int col = 42;
	        int ln = Integer.parseInt(prMant.getE01TAGLE8().trim());
	        if (ln <= 35) {
	          col = ln + 7;
	        } else {
	          row = ln / 35;
	        }  	
	        %>
			<TEXTAREA name="E01PRAFL8" cols="<%=col%>" rows="<%=row%>" style="overflow:hidden"
			 onkeypress="textCounter(this,<%=prMant.getE01TAGLE8().trim()%>)"
			 ><%= prMant.getE01PRAFL8().trim()%></TEXTAREA>  
		</td>
	</TR>
	<% } %>  
	<% 
	  if (!prMant.getE01PRATG9().trim().equals("")) { 
	%>
    <TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" name="E01PRASQ9" size="2" maxlength="1" value="<%= prMant.getE01PRASQ9().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" name="E01PRATG9" size="5" maxlength="4" value="<%= prMant.getE01PRATG9().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="20%" valign="top">
			<INPUT type="text" name="E01TAGDS9" size="31" maxlength="30" value="<%= prMant.getE01TAGDS9().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" name="E01PRAOP9" size="2" maxlength="1" value="<%= prMant.getE01PRAOP9().trim()%>" >
		</td>
		<td NOWRAP align="left" width="65%" valign="top">
			<%
	        int row = 1;
	        int col = 42;
	        int ln = Integer.parseInt(prMant.getE01TAGLE9().trim());
	        if (ln <= 35) {
	          col = ln + 7;
	        } else {
	          row = ln / 35;
	        }  	
	        %>
			<TEXTAREA name="E01PRAFL9" cols="<%=col%>" rows="<%=row%>" style="overflow:hidden"
			 onkeypress="textCounter(this,<%=prMant.getE01TAGLE9().trim()%>)"
			 ><%= prMant.getE01PRAFL9().trim()%></TEXTAREA>  
		</td>
	</TR>
	<% } %>  

  </TABLE>
    
    
    <table width="102%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
      <tr bgcolor="#FFFFFF"> 
        <td width="33%"> 
          <div align="center"> 
            <input type="checkbox" name="H01FLGWK2" value="A" <% if(prMant.getH01FLGWK2().equals("A")){ out.print("checked");} %>>
            Accept with Warnings</div>
        </td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
      <tr bgcolor="#FFFFFF"> 
        <td width="33%"> 
          <div align="center"> 
            <input id="EIBSBTN" type=submit name="Submit2" value="Submit">
          </div>
        </td>
      </tr>
    </table>
    
  </div>

 
 
    
  </form>
  

</body>
</html>
