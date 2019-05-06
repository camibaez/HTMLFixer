<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page  import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Retail Cancellation</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="rtCancel" class="datapro.eibs.beans.EDD115001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   builtHPopUp();

  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }	

</SCRIPT>

<SCRIPT Language="Javascript">
function CalculateAvail(){

  var myForm = document.forms[0];

  var PAGAMT = 0;
  var GRSBAL = parseFloat(replaceAll(myForm.E01GRSBAL.value,","));
  	  if (isNaN(GRSBAL)) GRSBAL=0.00;
  var INTAMT = parseFloat(replaceAll(myForm.E01INTAMT.value,","));
  	  if (isNaN(INTAMT)) INTAMT=0.00;
  var OVDAMT = parseFloat(replaceAll(myForm.E01OVDAMT.value,","));
      if (isNaN(OVDAMT)) OVDAMT=0.00;
  var COMAMT = parseFloat(replaceAll(myForm.E01COMAMT.value,","));
      if (isNaN(COMAMT)) COMAMT=0.00;

  PAGAMT = GRSBAL - COMAMT;

  if(myForm.E01NPGINT.value=='Y'){
    PAGAMT = PAGAMT + INTAMT;
  }
  if(myForm.E01NPGOVD.value != 'Y'){
    PAGAMT = PAGAMT - OVDAMT;
  }

  myForm.E01PAGAMT.value = formatCCY(""+PAGAMT);
  
}

function loadInitial(){

var myForm = document.forms[0];

myForm.E01NPGOVD.value = myForm.CE01NPGOVD.value;
myForm.E01NPGINT.value = myForm.CE01NPGINT.value;

}

</SCRIPT>

<SCRIPT Language="Javascript">
function CheckAcc(){
if(confirm("Are you sure you want to cancel the account number: " + document.forms[0].E01ACMACC.value )){
document.forms[0].submit();
}
}

</SCRIPT>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
  

%> 
<H3 align="center">Retail Accounts Cancellation<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cancel_basic.jsp, EDD1150"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD1150" onLoad="">
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="2">
  <INPUT TYPE=HIDDEN NAME="ACMACD" value="<%= rtCancel.getE01ACMACD().trim()%>">
  <table class="tableinfo">
    <tr > 
      <td nowrap height="69"> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E01ACMCUN" size="9" maxlength="9" value="<%= rtCancel.getE01ACMCUN().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text"  name="E01CUSNA1" size="45" maxlength="45" readonly value="<%= rtCancel.getE01CUSNA1().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account : </b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text"  name="E01ACMACC" size="12" maxlength="9" value="<%= rtCancel.getE01ACMACC().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency :</b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text"  name="E01ACMCCY" size="3" maxlength="3" value="<%= rtCancel.getE01ACMCCY().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text"  name="E01ACMPRO" size="4" maxlength="4" readonly value="<%= rtCancel.getE01ACMPRO().trim()%>">
                </b> </div>
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
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="28%"> 
              <div align="right">Gross Balance :</div>
            </td>
            <td nowrap width="20%"> 
              <input type="text" readonly name="E01GRSBAL" size="15" maxlength="13" value="<%= rtCancel.getE01GRSBAL().trim()%>" onkeypress="enterInteger()">
            </td>
            <td nowrap width="24%"> 
              <div align="right">Uncollected Balance :</div>
            </td>
            <td nowrap width="28%"> 
              <input type="text" readonly name="E01UNCBAL" size="15" maxlength="13" value="<%= rtCancel.getE01UNCBAL().trim()%>" onKeyPress="enterInteger()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="28%"> 
              <div align="right">Net to Customer :</div>
            </td>
            <td nowrap width="20%"> 
              <input type="text" readonly name="E01NETBAL" size="15" maxlength="13" value="<%= rtCancel.getE01NETBAL().trim()%>" onKeyPress="enterInteger()">
            </td>
            <td nowrap width="24%"> 
              <div align="right">Hold Amount :</div>
            </td>
            <td nowrap width="28%"> 
              <input type="text" readonly name="E01HLDAMT" size="15" maxlength="13" value="<%= rtCancel.getE01HLDAMT().trim()%>" onKeyPress="enterInteger()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="28%" height="23"> 
              <div align="right">Opening Date :</div>
            </td>
            <td nowrap width="20%" height="23"> 
              <input type="text" readonly name="E01OPNDT1" size="2" maxlength="2" value="<%= rtCancel.getE01OPNDT1().trim()%>" onKeyPress="enterInteger()">
              <input type="text" readonly name="E01OPNDT2" size="2" maxlength="2" value="<%= rtCancel.getE01OPNDT2().trim()%>" onKeyPress="enterInteger()">
              <input type="text" readonly name="E01OPNDT3" size="2" maxlength="2" value="<%= rtCancel.getE01OPNDT3().trim()%>" onKeyPress="enterInteger()">
            </td>
            <td nowrap width="24%" height="23"> 
              <div align="right">Cancellation Date :</div>
            </td>
            <td nowrap width="28%" height="23"> 
              <input type="text" readonly name="E01RUNDT1" size="2" maxlength="2" value="<%= rtCancel.getE01RUNDT1().trim()%>" onKeyPress="enterInteger()">
              <input type="text" readonly name="E01RUNDT2" size="2" maxlength="2" value="<%= rtCancel.getE01RUNDT2().trim()%>" onKeyPress="enterInteger()">
              <input type="text" readonly name="E01RUNDT3" size="2" maxlength="2" value="<%= rtCancel.getE01RUNDT3().trim()%>" onKeyPress="enterInteger()">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Cancellation Information</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="29%" height="19"> 
              <div align="right">Interest Payable :</div>
            </td>
            <td nowrap width="20%" height="19"> 
              <input type="text" name="E01INTAMT" size="15" maxlength="13" 
			  onBlur="javascript:CalculateAvail();"
			  value="<%= rtCancel.getE01INTAMT().trim()%>" onKeyPress="enterDecimal()">
            </td>
            <td nowrap width="25%" height="19"> 
              <div align="right">Interest Receivable :</div>
            </td>
            <td nowrap width="26%" height="19"> 
              <input type="text" name="E01OVDAMT" size="15" maxlength="13" 
			  onBlur="javascript:CalculateAvail();"
			  value="<%= rtCancel.getE01OVDAMT().trim()%>" onKeyPress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%" height="19"> 
              <div align="right">Commission Amount :</div>
            </td>
            <td nowrap width="20%" height="19"> 
              <input type="text" name="E01COMAMT" size="15" maxlength="13" 
			 onBlur="javascript:CalculateAvail();" 
			 value="<%= rtCancel.getE01COMAMT().trim()%>" onKeyPress="enterDecimal()">
            </td>
            <td nowrap width="25%" height="19">
              <div align="right"><b>Available Balance :</b></div>
            </td>
            <td nowrap width="26%" height="19">
              <% String color = rtCancel.getE01PAGAMT().trim().startsWith("-") ? "red" : ""; %>
           	  <input style="color: <%= color %>;" type="text" readonly name="E01PAGAMT" size="15" maxlength="13" value="<%= rtCancel.getE01PAGAMT().trim() %>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Additional Information</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trclear"> 
            <td nowrap width="15%" height="19"> 
              <div align="right"></div>
            </td>
            <td nowrap width="12%" height="19"> 
              <div align="right">Pay Interest Accrued :</div>
            </td>
            <td nowrap width="22%" height="38"> 
              <input type="hidden" name="E01NPGINT" value="<%= rtCancel.getE01NPGINT()%>">
              <input type="radio" name="CE01NPGINT" value="Y"
			  onClick="javascript:document.forms[0].E01NPGINT.value = 'Y';CalculateAvail();"
			  <%if(rtCancel.getE01NPGINT().equals("Y")) out.print("checked");%> >
              Yes 
              <input type="radio" name="CE01NPGINT" value="N" 
			  onClick="javascript:document.forms[0].E01NPGINT.value = 'N';CalculateAvail();"
			  <%if(rtCancel.getE01NPGINT().equals("N")) out.print("checked");%>>
              No </td>
            <td nowrap width="25%" height="38"> 
              <div align="right">Waive O/D Interest :</div>
            </td>
            <td nowrap width="26%" height="38"> 
              <input type="hidden" name="E01NPGOVD" value="<%= rtCancel.getE01NPGOVD()%>">
              <input type="radio" name="CE01NPGOVD" value="Y" 
			  onClick="javascript:document.forms[0].E01NPGOVD.value = 'Y';CalculateAvail();"
			  <%if(rtCancel.getE01NPGOVD().equals("Y")) out.print("checked");%> >
              Yes 
              <input type="radio" name="CE01NPGOVD" value="N" 
			  onClick="javascript:document.forms[0].E01NPGOVD.value = 'N';CalculateAvail();"
			  <%if(rtCancel.getE01NPGOVD().equals("N")) out.print("checked");%>>
              No </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap height="19" colspan="2"> 
              <div align="right">Remarks :</div>
            </td>
            <td nowrap width="22%" height="19"> 
              <input type="text" name="E01NARRAT" size="35" maxlength="30" value="<%= rtCancel.getE01NARRAT().trim()%>">
            </td>
            <td nowrap width="25%" height="19">&nbsp;</td>
            <td nowrap width="26%" height="19">&nbsp;</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap height="19" colspan="2"> 
              <div align="right">Officer :</div>
            </td>
            <td nowrap width="22%" height="19"> 
              <input type="text" name="E01ACMOFC" size="5" maxlength="3" value="<%= rtCancel.getE01ACMOFC().trim()%>">
              <input type="text" name="E01DSCOFC" size="36" maxlength="35" value="<%= rtCancel.getE01DSCOFC().trim()%>" readonly>
              <a href="javascript:GetCodeDescCNOFC('E01ACMOFC','E01DSCOFC','15')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0"></a></td>
            <td nowrap width="25%" height="19">&nbsp;</td>
            <td nowrap width="26%" height="19">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Offset Account</h4>
  <TABLE class="tableinfo" >
  <TR>
      <TD>
        <table style="filter:''" width="100%">
          <tr id="trdark"> 
            <td nowrap  > 
              <div align="center">Concept</div>
            </td>
            <td nowrap  > 
              <div align="center">Bank</div>
            </td>
            <td nowrap  > 
              <div align="center">Branch</div>
            </td>
            <td nowrap  > 
              <div align="center">Currency</div>
            </td>
            <td nowrap  > 
              <div align="center">Reference</div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap  > 
              <div align="center"> 
                <input type="text" size="3" maxlength="2" readonly name="E01PAGOPC" value="<%= rtCancel.getE01PAGOPC().trim()%>"
                   oncontextmenu="showPopUp(conceptHelp,this.name,document.forms[0].E01PAGOBK.value,'','E01PAGOGL','E01PAGOPC',document.forms[0].ACMACD.value)">
                <input type=HIDDEN name="E01PAGOGL" value="<%= rtCancel.getE01PAGOGL().trim()%>">
                <input type="text" size="25" maxlength="25" readonly name="E01PAGCON" value="<%= rtCancel.getE01PAGCON().trim()%>"
                   oncontextmenu="showPopUp(conceptHelp,this.name,document.forms[0].E01PAGOBK.value,'','E01PAGOGL','E01PAGOPC',document.forms[0].ACMACD.value)">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" size="2" maxlength="2" value="<%= rtCancel.getE01PAGOBK().trim()%>" name="E01PAGOBK" onKeyPress="enterInteger()">
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" size="3" maxlength="3" value="<%= rtCancel.getE01PAGOBR().trim()%>" name="E01PAGOBR" 
                 oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E01PAGOBK.value,'','','','')" onKeyPress="enterInteger()">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" size="3" maxlength="3" name="E01PAGOCY" value="<%= rtCancel.getE01PAGOCY().trim()%>"
                oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E01PAGOBK.value,'','','','')">
              </div>
            </td>
            <td nowrap  > 
              <div align="center"> 
                <input type="text" size="16" maxlength="16" value="<%= rtCancel.getE01PAGOAC().trim()%>" name="E01PAGOAC" 
                 oncontextmenu="showPopUp(accountHelp,this.name,document.forms[0].E01PAGOBK.value,'','','','RT')"  onKeyPress="enterInteger()">
              </div>
            </td>
          </tr>
        </table>
      </TD>  
</TR>	
</TABLE>    

  <br>
 <div align="center"> 
	   <input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="CheckAcc();">
  </div>
  </form>
<SCRIPT>
      CalculateAvail();
</SCRIPT>
</body>
</html>
