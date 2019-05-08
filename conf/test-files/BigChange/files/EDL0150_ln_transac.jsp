<html>
<head>
<title>Loans Transactions</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import = "java.math.*" %>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>
<SCRIPT Language="Javascript">

 function UpdateField(bfield,trfield,afield,sfield,rep){
   var trval;
   var bfval;
   var afval=0.00;
    try{
     trval= parseFloat(replaceAll(document.forms[0][trfield].value,","));
     if (isNaN(trval)) trval=0.00;}
    catch(e){
     trval=0.00;
    }
    try{
     if (rep) bfval=parseFloat(replaceAll(document.forms[0][afield].value,","));
     else bfval=parseFloat(replaceAll(document.forms[0][bfield].value,","));
     if (isNaN(bfval)) bfval=0.00;}
    catch(e){
     bfval=0.00;
    }
    if (document.forms[0][sfield].value=="0") afval=bfval+trval;
    else if (document.forms[0][sfield].value=="5") afval=bfval-trval;
    else afval=bfval;
    afval = Math.round(afval*100)/100;
    document.forms[0][afield].value = formatCCY(""+afval);
  } 

 function Recalculate(){
    UpdateField('E03DEAPRI','E03TRNPRI','AFTERPRI','E03TRNPRF',false);
    UpdateField('E03DEAINT','E03TRNINT','AFTERINT','E03TRNINF',false);
    UpdateField('E03DEAINT','E03TRNAIN','AFTERINT','E03TRNAIF',true);
    UpdateField('E03DEAMOR','E03TRNMOR','AFTERMOR','E03TRNMOF',false);
    UpdateField('E03DEAINT','E03TRNAMO','AFTERMOR','E03TRNAMF',true);
    UpdateField('E03DEADED','E03TRNDED','AFTERDED','E03TRNDEF',true);
    UpdateTotal();
 }
 
 function changeField(radio){
   var numval;
   var total;
   var newval; 
    if (!document.forms[0][radio][0].checked && !document.forms[0][radio][1].checked) {
      
      return;
    }
    Recalculate();     
  }
  
    
  function verifyNum(elem){
   if (trim(elem.value)=="") elem.value="0.00";
  }
  
  function UpdateTotal(){
   
   var total;  
    try{
     total= parseFloat(replaceAll(document.forms[0].AFTERPRI.value,","));}
    catch(e){
     total=0.00;
    }
    try{
     total=total+parseFloat(replaceAll(document.forms[0].AFTERINT.value,","));}
    catch(e){
    }
    try{
     total=total+parseFloat(replaceAll(document.forms[0].AFTERMOR.value,","));}
    catch(e){
    }
    try{
     total=total+parseFloat(replaceAll(document.forms[0].AFTERDED.value,","));}
    catch(e){
    }
 
   total = Math.round(total*100)/100;  
   document.forms[0].AFTERTOT.value=formatCCY(""+total);  
  }
</SCRIPT>
</head>


<jsp:useBean id= "lnTransac" class= "datapro.eibs.beans.EDL015203Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<body nowrap>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>
<SCRIPT Language="Javascript">

   builtNewMenu(ln_t_m_opt);
   initMenu();


</SCRIPT>
<SCRIPT Language="Javascript">

	builtHPopUp();

  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }

</SCRIPT>
<h3 align="center">Loans Transactions<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="ln_transac.jsp, EDL0150"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0152">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="6">
  <INPUT TYPE=HIDDEN NAME="TMPAMT" VALUE="">
   <INPUT TYPE=HIDDEN NAME="E03DEABNK" VALUE="<%= lnTransac.getE03DEABNK().trim()%>">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E03DEACUN" size="9" maxlength="9" value="<%= lnTransac.getE03DEACUN().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
                <input type="text" name="E03CUSNA1" size="45" maxlength="45" value="<%= lnTransac.getE03CUSNA1().trim()%>" readonly>
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E03DEAACC" size="12" maxlength="12" value="<%= lnTransac.getE03DEAACC().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E03DEACCY" size="3" maxlength="3" value="<%= lnTransac.getE03DEACCY().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E03DEAPRO" size="4" maxlength="4" value="<%= lnTransac.getE03DEAPRO().trim()%>" readonly>
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Financial Information</h4>
  
  <table class="tableinfo" >
     <tr> 
      <td nowrap> 
        <table cellspacing=2 cellpadding=2 width="100%" border="0">
          <tr> 
            <td nowrap width="20%" id="trdark"> 
              <div align="center"></div>
            </td>
            <td nowrap width="40%" id="trdark"> 
              <div align="center"><b>Before Transaction</b></div>
            </td>
            <td nowrap width="40%" id="trdark"> 
              <div align="center"><b>After Transaction</b></div>
            </td>
          </tr>
          <tr > 
            <td nowrap id="trdark"> 
              <div align="right">Principal Balance :</div>
            </td>
            <td nowrap align="center"> 
              <input id="txtright" type="text" readonly  name="E03DEAPRI" size="15" maxlength="13" value="<%= Util.formatCCY(lnTransac.getE03DEAPRI())%>" onkeypress="enterDecimal()">
            </td>
            <td nowrap align="center"> 
              <input id="txtright" type="text" readonly  name="AFTERPRI" size="15" maxlength="13" value="" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr> 
            <td nowrap id="trdark"> 
              <div align="right">Interest Balance :</div>
            </td>
            <td nowrap align="center"> 
              <input id="txtright" type="text" readonly  name="E03DEAINT" size="15" maxlength="13" value="<%= Util.formatCCY(lnTransac.getE03DEAINT())%>" onkeypress="enterDecimal()">
            </td>
            <td nowrap align="center"> 
              <input id="txtright" type="text" readonly  name="AFTERINT" size="15" maxlength="13" value="" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr> 
            <td nowrap id="trdark"> 
              <div align="right">Late Charges :</div>
            </td>
            <td nowrap align="center"> 
              <input id="txtright" type="text" readonly  name="E03DEAMOR" size="15" maxlength="13" value="<%= Util.formatCCY(lnTransac.getE03DEAMOR())%>" onkeypress="enterDecimal()">
            </td>
            <td nowrap align="center"> 
              <input id="txtright" type="text" readonly  name="AFTERMOR" size="15" maxlength="13" value="" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark"> 
          
            <td nowrap > 
              <div align="right">Escrow  :</div>
            </td>
            <td nowrap align="center"> 
              <input id="txtright" type="text" readonly  name="E03DEADED" size="15" maxlength="13" value="<%= Util.formatCCY(lnTransac.getE03DEADED())%>" onkeypress="enterDecimal()">
            </td>
            <td nowrap align="center"> 
              <input id="txtright" type="text" readonly  name="AFTERDED" size="15" maxlength="13" value="" onkeypress="enterDecimal()">
            </td>
          </tr>
          
          <tr> 
            <td nowrap id="trdark"> 
              <div align="right">Total :</div>
            </td>
            <td nowrap align="center"> 
              <input id="txtright" type="text" readonly  name="E03DEATOT" size="15" maxlength="13" value="<%= Util.formatCCY(lnTransac.getE03DEATOT())%>" onkeypress="enterDecimal()">
            </td>
            <td nowrap align="center"> 
              <input id="txtright" type="text" readonly  name="AFTERTOT" size="15" maxlength="13" value="" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr >
          	<td nowrap colspan="3"> 
              <div align="center">Last Calculation Date:
              <input type="text" name="E03DEALC1" size="2" maxlength="2" value="<%= lnTransac.getE03DEALC1().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E03DEALC2" size="2" maxlength="2" value="<%= lnTransac.getE03DEALC2().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E03DEALC3" size="2" maxlength="2" value="<%= lnTransac.getE03DEALC3().trim()%>" onkeypress="enterInteger()">
              </div>
            </td>
           </tr>
        	</table>
      	</td>
    </tr>
  </table>
  
  <h4>Transaction Information </h4>
  <table class="tableinfo">
    <tr > 
      <td> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td width="40%"> 
              <div align="right">Principal :</div>
            </td>
            <td width="60%"> 
              <input type="text" name="E03TRNPRI" size="15" maxlength="13" value="<%= lnTransac.getE03TRNPRI().trim()%>" onkeypress="enterDecimal()"
              onChange="changeField('CE03TRNPRF')" onblur="verifyNum(this)">
              <input type="hidden" name="E03TRNPRF" value="<%= lnTransac.getE03TRNPRF()%>" >
              <input type="radio" name="CE03TRNPRF" value="0" 
              onClick="document.forms[0].E03TRNPRF.value='0';Recalculate();" 
			  <%if(lnTransac.getE03TRNPRF().equals("0")) out.print("checked");%>>
              Increase 
              <input type="radio" name="CE03TRNPRF" value="5" 
              onClick="document.forms[0].E03TRNPRF.value='5';Recalculate();" 
			  <%if(lnTransac.getE03TRNPRF().equals("5")) out.print("checked");%>>
              Decrease</td>
          </tr>
          <tr id="trclear"> 
            <td width="40%" height="27"> 
              <div align="right">Interest Payment :</div>
            </td>
            <td width="60%" height="27"> 
              <input type="text" name="E03TRNINT" size="15" maxlength="13" value="<%= lnTransac.getE03TRNINT().trim()%>" onkeypress="enterDecimal()"
              onChange="changeField('CE03TRNINF')" onblur="verifyNum(this)">
              <input type="hidden" name="E03TRNINF" value="<%= lnTransac.getE03TRNINF()%>">
              <input type="radio" name="CE03TRNINF" value="0"
			   onClick="document.forms[0].E03TRNINF.value='0';Recalculate();"
			   <%if(lnTransac.getE03TRNINF().equals("0")) out.print("checked");%>> Reverse <input type="radio" name="CE03TRNINF" value="5"
			   onClick="document.forms[0].E03TRNINF.value='5';Recalculate();"
			   <%if(lnTransac.getE03TRNINF().equals("5")) out.print("checked");%>> Payment </td>
          </tr>
          <tr id="trdark"> 
            <td width="40%"> 
              <div align="right">Late Charges Payment :</div>
            </td>
            <td width="60%"> 
              <input type="text" name="E03TRNMOR" size="15" maxlength="13" value="<%= lnTransac.getE03TRNMOR().trim()%>" onkeypress="enterDecimal()"
              onChange="changeField('CE03TRNMOF')" onblur="verifyNum(this)">
              <input type="hidden" name="E03TRNMOF" value="<%= lnTransac.getE03TRNMOF()%>">
              <input type="radio" name="CE03TRNMOF" value="0" 
              onClick="document.forms[0].E03TRNMOF.value='0';Recalculate();" 
			  <%if(lnTransac.getE03TRNMOF().equals("0")) out.print("checked");%>> Reverse <input type="radio" name="CE03TRNMOF" value="5" 
              onClick="document.forms[0].E03TRNMOF.value='5';Recalculate();" 
			  <%if(lnTransac.getE03TRNMOF().equals("5")) out.print("checked");%>> Payment </td>
          </tr>
          <tr id="trclear"> 
            <td width="40%"> 
              <div align="right">Interest Adjustment :</div>
            </td>
            <td width="60%"> 
              <input type="text" name="E03TRNAIN" size="15" maxlength="13" value="<%= lnTransac.getE03TRNAIN().trim()%>" onkeypress="enterDecimal()" 
              onChange="changeField('CE03TRNAIF')" onblur="verifyNum(this)">
              <input type="hidden" name="E03TRNAIF" value="<%= lnTransac.getE03TRNAIF()%>">
              <input type="radio" name="CE03TRNAIF" value="0" 
              onClick="document.forms[0].E03TRNAIF.value='0';Recalculate();" 
			  <%if(lnTransac.getE03TRNAIF().equals("0")) out.print("checked");%>>
              Increase 
              <input type="radio" name="CE03TRNAIF" value="5" 
              onClick="document.forms[0].E03TRNAIF.value='5';Recalculate();" 
			  <%if(lnTransac.getE03TRNAIF().equals("5")) out.print("checked");%>>
              Decrease </td>
          </tr>
          <tr id="trdark"> 
            <td width="40%"> 
              <div align="right">Late Charges Adjustment :</div>
            </td>
            <td width="60%"> 
              <input type="text" name="E03TRNAMO" size="15" maxlength="13" value="<%= lnTransac.getE03TRNAMO().trim()%>" onkeypress="enterDecimal()" 
               onChange="changeField('CE03TRNAMF')" onblur="verifyNum(this)">
              <input type="hidden" name="E03TRNAMF" value="<%= lnTransac.getE03TRNAMF()%>">
              <input type="radio" name="CE03TRNAMF" value="0" 
              onClick="document.forms[0].E03TRNAMF.value='0';Recalculate();" 
			  <%if(lnTransac.getE03TRNAMF().equals("0")) out.print("checked");%>>
              Increase 
              <input type="radio" name="CE03TRNAMF" value="5" 
              onClick="document.forms[0].E03TRNAMF.value='5';Recalculate();" 
			  <%if(lnTransac.getE03TRNAMF().equals("5")) out.print("checked");%>>
              Decrease </td>
          </tr>
          <tr id="trclear"> 
            <td width="40%"> 
              <div align="right">Escrow Contribution Adjustment :</div>
            </td>
            <td width="60%"> 
              <input type="text" name="E03TRNDED" size="15" maxlength="13" value="<%= lnTransac.getE03TRNDED().trim()%>" onkeypress="enterDecimal()" 
               onChange="changeField('CE03TRNDEF')" onblur="verifyNum(this)">
              <input type="hidden" name="E03TRNDEF" value="<%= lnTransac.getE03TRNDEF()%>">
              <input type="radio" name="CE03TRNDEF" value="0" 
              onClick="document.forms[0].E03TRNDEF.value='0';Recalculate();" 
			  <%if(lnTransac.getE03TRNDEF().equals("0")) out.print("checked");%>>
              Increase 
              <input type="radio" name="CE03TRNDEF" value="5" 
              onClick="document.forms[0].E03TRNDEF.value='5';Recalculate();" 
			  <%if(lnTransac.getE03TRNDEF().equals("5")) out.print("checked");%>>
              Decrease </td>
          </tr>
          
          <tr id="trdark">
            <td width="40%">
              <div align="right">Federal Taxes :</div>
            </td>
            <td width="60%">
              <input type="text" name="E03TRNIVA" size="15" maxlength="13" value="<%= lnTransac.getE03TRNIVA().trim()%>" onkeypress="enterDecimal()" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="40%"> 
              <div align="right">Total :</div>
            </td>
            <td width="60%"> 
              <input type="text" name="E03TRNTOT" size="15" maxlength="13" value="<%= lnTransac.getE03TRNTOT().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="40%"> 
              <div align="right">Value Date :</div>
            </td>
            <td width="60%"> 
              <input type="text" name="E03TRNVD1" size="2" maxlength="2" value="<%= lnTransac.getE03TRNVD1().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E03TRNVD2" size="2" maxlength="2" value="<%= lnTransac.getE03TRNVD2().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E03TRNVD3" size="2" maxlength="2" value="<%= lnTransac.getE03TRNVD3().trim()%>" onkeypress="enterInteger()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="40%"> 
              <div align="right">Foreing Exchange Rate :</div>
            </td>
            <td width="60%"> 
              <input type="text" name="E03DEAEXR" size="11" maxlength="11" value="<%= lnTransac.getE03DEAEXR().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="40%"> 
              <div align="right">Description :</div>
            </td>
            <td width="60%"> 
              <input type="text" name="E03DEANR1" size="30" maxlength="30" value="<%= lnTransac.getE03DEANR1().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="40%"> 
              <div align="right"></div>
            </td>
            <td width="60%"> 
              <input type="text" name="E03DEANR2" size="30" maxlength="30" value="<%= lnTransac.getE03DEANR2().trim()%>">
            </td>
          </tr>
        </table>
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td align="center"> <b>Payment Via</b></td>
          </tr>
        </table>
        <table class="tableinfo" style="filter:''">
          <tr id="trclear"> 
            <td width="31%"> 
              <div align="center">Concept</div>
            </td>
            <td width="5%" > 
              <div align="center">Bank</div>
            </td>
            <td width="13%"> 
              <div align="center">Branch</div>
            </td>
            <td width="12%" > 
              <div align="center">Currency</div>
            </td>
            <td width="21%"> 
              <div align="center">Reference</div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="31%" > 
              <div align="center" nowrap> 
                <input type=text name="E03TRNOPC" value="<%= lnTransac.getE03TRNOPC().trim()%>" size="2" maxlength="2">
                <input type=HIDDEN name="E03TRNGLN" value="<%= lnTransac.getE03TRNGLN().trim()%>">
                <input type="text" name="E03TRNCON" size="25" maxlength="25" readonly value="<%= lnTransac.getE03TRNCON().trim()%>"
                                   oncontextmenu="showPopUp(conceptHelp,this.name,document.forms[0].E03DEABNK.value,'','E03TRNGLN','E03TRNOPC','10')">
              </div>
            </td>
            <td width="5%"> 
              <div align="center"> 
                <input type="text" name="E03TRNBNK" size="2" maxlength="2" value="<%= lnTransac.getE03TRNBNK().trim()%>" onkeypress="enterInteger()">
              </div>
            </td>
            <td width="13%" > 
              <div align="center"> 
                <input type="text" name="E03TRNBRN" size="3" maxlength="3" value="<%= lnTransac.getE03TRNBRN().trim()%>" 
                 oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E03DEABNK.value,'','','','')" onkeypress="enterInteger()">
              </div>
            </td>
            <td width="12%" > 
              <div align="center">
                <input type="text" name="E03TRNCCY" size="3" maxlength="3" value="<%= lnTransac.getE03TRNCCY().trim()%>"
                oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E03DEABNK.value,'','','','')">
              </div>
            </td>
            <td width="21%" > 
              	<div align="center"> 
                 <input type="text" name="E03TRNACC" size="16" maxlength="9" value="<%= lnTransac.getE03TRNACC().trim()%>" onkeypress="enterInteger()"
                         oncontextmenu="showPopUp(accountHelp,this.name,document.forms[0].E03DEABNK.value,'','','','RT')">
				</div>
            </td>
          </tr>
        </table>
        
      </td>
    </tr>
  </table>
  <SCRIPT language="JavaScript">
      Recalculate();
  </SCRIPT>
 <br>
  <div align="center"> 
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>

</form>
</body>
</html>
