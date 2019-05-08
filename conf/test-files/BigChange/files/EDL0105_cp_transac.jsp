<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Commercial Paper Transactions Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<%@ page import = "datapro.eibs.master.Util" %>

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
     else bfval=parseFloat(replaceAll(document.forms[0][bfield].value,","));}
    catch(e){
     bfval=0.00;
    }
    if (document.forms[0][sfield][0].checked) afval=bfval+trval;
    else if (document.forms[0][sfield][1].checked) afval=bfval-trval;
    else afval=bfval;
    document.forms[0][afield].value = formatCCY(""+afval);
  } 

 function Recalculate(){
    UpdateField('E03DEAMEP','E03TRNPRI','AFTERPRI','E03TRNPRF',false);
    UpdateField('E03DEAMEI','E03TRNINT','AFTERINT','E03TRNINF',false);
    UpdateField('E03DEAMEI','E03TRNADJ','AFTERINT','E03TRNADF',true);
    UpdateTotal();
	if (event.srcElement.name=="E03TRNPRF" && !document.forms[0].E03DEARCL.value=="")
		visibility_cy();
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
    
   document.forms[0].AFTERTOT.value=formatCCY(""+total);
   
  }

  function myGetCodeCNOFC(name, code){
  	if (document.forms[0][name].disabled==false){
  		GetCodeCNOFC(name, code)
  	}
  }

  function  checkContYear(){
	document.forms[0].E03DEARRT.disabled=false;
	if (document.forms[0].CHKDEARRT[0].checked) {
  		document.forms[0].E03DEARRT.value="C";
  	} else if (document.forms[0].CHKDEARRT[1].checked) {
  		document.forms[0].E03DEARRT.value="";
	}
	document.forms[0].E03DEARRT.disabled=true;
  }
  
    function visibility_cy(){
		if (document.forms[0].E03TRNPRF[0].checked){
  			document.forms[0].E03TRNSOU.disabled=false;
  			document.forms[0].E03TRNDIB.disabled=true;  			
	  	} else if (document.forms[0].E03TRNPRF[1].checked) {
  			document.forms[0].E03TRNSOU.disabled=true;
  			document.forms[0].E03TRNDIB.disabled=false;
	  	}
  }
  
</SCRIPT>

<SCRIPT Language="Javascript">

   //builtNewMenu(cd_t_m_opt);
   //initMenu();


</SCRIPT>

<SCRIPT Language="Javascript">

	builtHPopUp();

  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }

</SCRIPT>


</head>


<jsp:useBean id= "cdTransac" class= "datapro.eibs.beans.EDL013003Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
	 error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center">Commercial Paper Transactions Maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cd_transac.jsp, EDL0130"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2300">
  <INPUT TYPE=HIDDEN NAME="E03DEARCL" VALUE="<%= cdTransac.getE03DEARCL().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E03DEABNK" VALUE="<%= cdTransac.getE03DEABNK().trim()%>">
  <input type=HIDDEN name="E03DEAACD" value="<%= cdTransac.getE03DEAACD().trim()%>">
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
                <input type="text" name="E03DEACUN" size="9" maxlength="9" value="<%= cdTransac.getE03DEACUN().trim()%>" readonly>
                <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" > 
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E03CUSNA1" size="45" maxlength="45" value="<%= cdTransac.getE03CUSNA1().trim()%>" readonly>
                <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" > 
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E03DEAACC" size="12" maxlength="9" value="<%= cdTransac.getE03DEAACC().trim()%>" readonly>
                <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" > 
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E03DEACCY" size="3" maxlength="3" value="<%= cdTransac.getE03DEACCY().trim()%>" readonly>
                <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" > 
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E03DEAPRO" size="4" maxlength="4" value="<%= cdTransac.getE03DEAPRO().trim()%>" readonly>
                <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" > 
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Financial Information</h4>
<TABLE class="tableinfo">
     <TBODY>
        <TR> 
      <TD nowrap> 
        <TABLE cellspacing="2" cellpadding="2" width="100%" border="0">
          <TBODY>
                    <TR> 
            <TD nowrap width="20%" id="trdark"> 
              <DIV align="center"></DIV>
            </TD>
            <TD nowrap width="40%" id="trdark"> 
              <DIV align="center"><B>Before Transaction</B></DIV>
            </TD>
            <TD nowrap width="40%" id="trdark"> 
              <DIV align="center"><B>After Transaction</B></DIV>
            </TD>
          </TR>
          <TR> 
            <TD nowrap id="trdark"> 
              <DIV align="right">Principal Balance :</DIV>
            </TD>
            <TD nowrap align="center">
             <INPUT type="text" name="E03DEAMEP" id="txtright" size="15" maxlength="13" value="<%= Util.formatCCY(cdTransac.getE03DEAMEP())%>" readonly></TD>
            <TD nowrap align="center"> 
              <INPUT type="text" id="txtright" readonly name="AFTERPRI" size="15" maxlength="13" value="" onkeypress="enterDecimal()">
            </TD>
          </TR>
          
          <TR> 
            <TD nowrap id="trdark"> 
              <DIV align="right">Interest Balance :</DIV>
            </TD>
            <TD nowrap align="center">
            <INPUT type="text" name="E03DEAMEI" id="txtright" size="15" maxlength="13" value="<%= Util.formatCCY(cdTransac.getE03DEAMEI())%>" readonly></TD>
            <TD nowrap align="center"> 
              <INPUT id="txtright" type="text" readonly name="AFTERINT" size="15" maxlength="13" value="" onkeypress="enterDecimal()">
            </TD>
          </TR>
          <TR> 
            <TD nowrap id="trdark"> 
              <DIV align="right">Withholding :</DIV>
            </TD>
            <TD nowrap align="center"><INPUT type="text" name="E03DEAWHL" id="txtright" size="15" maxlength="13" value="<%= Util.formatCCY(cdTransac.getE03DEAWHL())%>" readonly></TD>
            <TD nowrap align="center"></TD>
          </TR>
          <TR> 
            <TD nowrap id="trdark"> 
              <DIV align="right">Sales Tax :</DIV>
            </TD>
            <TD nowrap align="center"><INPUT type="text" name="E03DEATAX" id="txtright" size="15" maxlength="13" value="<%= Util.formatCCY(cdTransac.getE03DEATAX())%>" readonly></TD>
            <TD nowrap align="center"></TD>
          </TR>
          <TR> 
            <TD nowrap id="trdark"> 
              <DIV align="right">Total :</DIV>
            </TD>
            <TD nowrap align="center"><INPUT type="text" name="E03DEATOT" id="txtright" size="15" maxlength="13" value="<%= Util.formatCCY(cdTransac.getE03DEATOT())%>" readonly></TD>
            <TD nowrap align="center"> 
              <INPUT id="txtright" type="text" readonly name="AFTERTOT" size="15" maxlength="13" value="" onkeypress="enterDecimal()">
            </TD>
          </TR>
          <TR>
          	<TD nowrap colspan="3"> 
              <DIV align="center">Last Calculation Date:
                <input type="text" name="E03DEALC1" size="2" maxlength="2" value="<%= cdTransac.getE03DEALC1().trim()%>" readonly>
                <INPUT type="text" name="E03DEALC2" size="2" maxlength="2" value="<%= cdTransac.getE03DEALC2().trim()%>" readonly>
                <INPUT type="text" name="E03DEALC3" size="2" maxlength="2" value="<%= cdTransac.getE03DEALC3().trim()%>" readonly>
                <a href="javascript:DatePicker(document.forms[0].E03DEALC1,document.forms[0].E03DEALC2,document.forms[0].E03DEALC3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
              </DIV>
            </TD>
           </TR>
        	</TBODY>
            </TABLE>
      	</TD>
    </TR>
  </TBODY>
</TABLE>

<%	if (!cdTransac.getE03DEARCL().equals("")){ %>  

  <h4>IRA Information</h4>
  <table class="tableinfo" width="582">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          
          <tr id="trclear"> 
           
            	<td nowrap width="20%"> 
              		<div align="right">TAX Year : </div>
            	</td>
	         <td width="15%" nowrap> 
              <select name="E03DEARRT" <%if (cdTransac.getE03TRNPRF().equals("5")) { out.print("disabled"); }%>>
                <option value="C" <%if (cdTransac.getE03DEARRT().equals("C")) { out.print("selected"); }%>>Current Year</option>
                <option value="P" <%if (cdTransac.getE03DEARRT().equals("P")) { out.print("selected"); }%>>Previous Year</option>
                
			  </select>
             <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" > 
            </td>
			<td width="35%" nowrap colspan="2">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Contribution Type : </div>
            </td>
             <td nowrap> 
              <input type="text" name="E03TRNSOU" size="3" maxlength="2" value="<%= cdTransac.getE03TRNSOU().trim() %>"
              		<%if (cdTransac.getE03TRNPRF().equals("5")) { out.print("disabled"); }%>>
              <a href="javascript:myGetCodeCNOFC('E03TRNSOU','18')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" > 
            </td>
            <td nowrap> 
              <div align="right">OR </div>
            </td>
            <td nowrap> 
              <div align="right">Distribution Code : </div>
            </td>
			<TD nowrap>
				<div align="left">
					 <INPUT type="text" name="E03TRNDIB" size="3" maxlength="2"
							value="<%= cdTransac.getE03TRNDIB().trim()%>">
            <A href="javascript:myGetCodeCNOFC('E03TRNDIB','38')"> <IMG
							src="<%=request.getContextPath()%>/images/1b.gif" alt="help"
							align="absmiddle" border="0"></A>
					<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" > 
		         </div> 
			</TD>
          </tr>          
        </table>
      </td>
    </tr>
  </table>
  
  <%}%>
<h4>Transaction Information</h4>
  <table class="tableinfo">
    <tr> 
      <td> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td width="40%"> 
              <div align="right">Principal :</div>
            </td>
            <td width="60%"> 
              <input type="text" name="E03TRNPRI" size="15" maxlength="13" value="<%= cdTransac.getE03TRNPRI().trim()%>" onkeypress="enterDecimal()"
              onChange="changeField('E03TRNPRF')" onblur="verifyNum(this)">
              <input type="radio" name="E03TRNPRF" value="0" onClick="Recalculate()" 
              <%if(cdTransac.getE03TRNPRF().equals("0")) out.print("checked");%> >
              Increase 
              <input type="radio" name="E03TRNPRF" value="5" onClick="Recalculate()"
              <%if(cdTransac.getE03TRNPRF().equals("5")) out.print("checked");%> >
              Decrease</td>
          </tr>
          <tr id="trclear"> 
            <td width="40%"> 
              <div align="right">Interest :</div>
            </td>
            <td width="60%"> 
              <input type="text" name="E03TRNINT" size="15" maxlength="13" value="<%= cdTransac.getE03TRNINT().trim()%>" onkeypress="enterDecimal()"
              onChange="changeField('E03TRNINF')" onblur="verifyNum(this)">
              <input type="radio" name="E03TRNINF" value="0" onClick="Recalculate()"
			  <%if(cdTransac.getE03TRNINF().equals("0")) out.print("checked");%> > Reversal 
			  <input type="radio" name="E03TRNINF" value="5" onClick="Recalculate()"
			   <%if(cdTransac.getE03TRNINF().equals("5")) out.print("checked");%> > Payment </td>
          </tr>
          <tr id="trdark"> 
            <td width="40%" height="27"> 
              <div align="right">Interest Adjustment:</div>
            </td>
            <td width="60%" height="27"> 
              <input type="text" name="E03TRNADJ" size="15" maxlength="13" value="<%= cdTransac.getE03TRNADJ().trim()%>" onkeypress="enterDecimal()"
              onChange="changeField('E03TRNADF')" onblur="verifyNum(this)">
              <input type="radio" name="E03TRNADF" value="0" onClick="Recalculate()"
			   <%if(cdTransac.getE03TRNADF().equals("0")) out.print("checked");%> >
              Increase 
              <input type="radio" name="E03TRNADF" value="5" onClick="Recalculate()"
			   <%if(cdTransac.getE03TRNADF().equals("5")) out.print("checked");%> >
			   Decrease </td>
          </tr>
          <tr id="trclear"> 
            <td width="40%"> 
              <div align="right">Withholding :</div>
            </td>
            <td width="60%"> 
              <input type="text" name="E03TRNWHL" size="15" maxlength="13" value="<%= cdTransac.getE03TRNWHL().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="40%"> 
              <div align="right">Sales Tax:</div>
            </td>
            <td width="60%"> 
              <input type="text" name="E03TRNTAX" size="15" maxlength="13" value="<%= cdTransac.getE03TRNTAX().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="40%"> 
              <div align="right">Value Date :</div>
            </td>
            <td width="60%">
              <input type="text" name="E03TRNVD1" size="2" maxlength="2" value="<%= cdTransac.getE03TRNVD1().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E03TRNVD2" size="2" maxlength="2" value="<%= cdTransac.getE03TRNVD2().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E03TRNVD3" size="2" maxlength="2" value="<%= cdTransac.getE03TRNVD3().trim()%>" onkeypress="enterInteger()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="40%"> 
              <div align="right">Foreign Exchange Rate :</div>
            </td>
            <td width="60%">
              <input type="text" name="E03DEAEXR" size="11" maxlength="11" value="<%= cdTransac.getE03DEAEXR().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="40%"> 
              <div align="right">Transaction Narrative :</div>
            </td>
            <td width="60%">
              <input type="text" name="E03DEANR1" size="30" maxlength="30" value="<%= cdTransac.getE03DEANR1().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="40%"> 
              <div align="right"></div>
            </td>
            <td width="60%">
              <input type="text" name="E03DEANR2" size="30" maxlength="30" value="<%= cdTransac.getE03DEANR2().trim()%>">
            </td>
          </tr>
        </table>
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trclear"> 
            <td align="center"> <b>Repayment Account</b> </td>
          </tr>
        </table>
        <table class="tableinfo" style="filter:''">
          <tr id="trdark"> 
            <td width="31%" > 
              <div align="center">Concept</div>
            </td>
            <td width="5%" > 
              <div align="center">Bank</div>
            </td>
            <td width="13%" > 
              <div align="center">Branch</div>
            </td>
            <td width="12%" > 
              <div align="center">Currency</div>
            </td>
            <td width="21%" > 
              <div align="center">Reference</div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="31%" > 
              <div align="center" nowrap> 
                <input type="text" name="E03TRNOPC" value="<%= cdTransac.getE03TRNOPC().trim()%>" size="3" maxlength="3">
                <input type=HIDDEN name="E03TRNGLN" value="<%= cdTransac.getE03TRNGLN().trim()%>">
                <input type="text" name="E03TRNCON" size="25" maxlength="25" readonly value="<%= cdTransac.getE03TRNCON().trim()%>"
                   oncontextmenu="showPopUp(conceptHelp,this.name,document.forms[0].E03DEABNK.value,'','E03TRNGLN','E03TRNOPC',document.forms[0].E03DEAACD.value)">
              </div>
            </td>
            <td width="5%" > 
              <div align="center"> 
                <input type="text" name="E03TRNBNK" size="2" maxlength="2" value="<%= cdTransac.getE03TRNBNK().trim()%>" onkeypress="enterInteger()">
              </div>
            </td>
            <td width="13%" > 
              <div align="center"> 
                <input type="text" name="E03TRNBRN" size="3" maxlength="3" value="<%= cdTransac.getE03TRNBRN().trim()%>" 
                   oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E03DEABNK.value,'','','','')" onkeypress="enterInteger()">
              </div>
            </td>
            <td width="12%" > 
              <div align="center">
                <input type="text" name="E03TRNCCY" size="3" maxlength="3" value="<%= cdTransac.getE03TRNCCY().trim()%>"
                      oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E03DEABNK.value,'','','','')"> </div>
            </td>
            <td width="21%"  > 
              <div align="center"> 
                <input type="text" name="E03TRNACC" size="16" maxlength="9" value="<%= cdTransac.getE03TRNACC().trim()%>"  
                oncontextmenu="showPopUp(accountHelp,this.name,document.forms[0].E03DEABNK.value,'','','','RT')"  onkeypress="enterInteger()">
              </div>
            </td>
          </tr>
        </table>
        
      </td>
    </tr>
  </table>
  <% 
		if (error.getERWRNG().equals("Y")) { 
				error.setERWRNG(" ");
	%>
			<h4 style="text-align:center"><input type="checkbox" name="H03FLGWK2" value="A">
      		Accept with Warnings</h4>
	<% 
		} 
	%>
   <br>
  <div align="center"> 
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>
  
</form>
</body>
</html>
