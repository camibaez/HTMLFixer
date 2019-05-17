<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Contract Transactions Approval</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<%@ page import = "datapro.eibs.master.Util" %>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>
<SCRIPT LANGUAGE="JavaScript">

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
  
   
  function UpdateField(bfield,trfield,afield,sfield,rep){
   var trval;
   var bfval;
   var afval=0.00;
    try{
     trval= parseFloat(replaceAll(document.forms[0][trfield].value,","));}
    catch(e){
     trval=0.00;
    }
    try{
     if (rep) bfval=parseFloat(replaceAll(document.forms[0][afield].value,","));
     else bfval=parseFloat(replaceAll(document.forms[0][bfield].value,","));}
    catch(e){
     bfval=0.00;
    }
    if (document.forms[0][sfield].value=="0") afval=bfval+trval;
    else if (document.forms[0][sfield].value=="5") afval=bfval-trval;
    else afval=bfval;
    document.forms[0][afield].value = formatCCY(""+afval);
  }
  
 
</SCRIPT>
<SCRIPT Language="Javascript">

   builtNewMenu(cd_t_a_opt);
   initMenu();
</SCRIPT>

</head>


<jsp:useBean id= "cdTransac" class= "datapro.eibs.beans.EDL013003Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<body nowrap>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("   showErrors()");
     out.println("</SCRIPT >" );
 }
%>

<h3 align="center">Contract Transactions Approval<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cd_transac.jsp, EDL0130"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="6">
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
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E03CUSNA1" size="45" maxlength="45" value="<%= cdTransac.getE03CUSNA1().trim()%>" readonly>
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
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b><input type="text" name="E03DEACCY" size="3" maxlength="3" value="<%= cdTransac.getE03DEACCY().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b><input type="text" name="E03DEAPRO" size="4" maxlength="4" value="<%= cdTransac.getE03DEAPRO().trim()%>" readonly>
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
            <TD nowrap align="center"><INPUT type="text" id="txtright" name="E03DEAMEP" size="15" maxlength="13" value="<%= Util.formatCCY(cdTransac.getE03DEAMEP())%>" readonly></TD>
            <TD nowrap align="center"> 
              <INPUT id="txtright" type="text" readonly name="AFTERPRI" size="15" maxlength="13" value="" onkeypress="enterDecimal()">
            </TD>
          </TR>
          <TR> 
            <TD nowrap id="trdark"> 
              <DIV align="right">Interest Balance :</DIV>
            </TD>
            <TD nowrap align="center"><INPUT type="text" id="txtright" name="E03DEAMEI" size="15" maxlength="13" value="<%= Util.formatCCY(cdTransac.getE03DEAMEI())%>" readonly></TD>
            <TD nowrap align="center"> 
              <INPUT id="txtright" type="text" readonly name="AFTERINT" size="15" maxlength="13" value="" onkeypress="enterDecimal()">
            </TD>
          </TR>
          <TR> 
            <TD nowrap id="trdark"> 
              <DIV align="right">WithHolding :</DIV>
            </TD>
            <TD nowrap align="center"><INPUT type="text" id="txtright" name="E03DEAWHL" size="15" maxlength="13" value="<%= Util.formatCCY(cdTransac.getE03DEAWHL())%>" readonly></TD>
            <TD nowrap align="center"></TD>
          </TR>
          <TR> 
            <TD nowrap id="trdark"> 
              <DIV align="right">Sales Tax :</DIV>
            </TD>
            <TD nowrap align="center"><INPUT type="text" id="txtright" name="E03DEATAX" size="15" maxlength="13" value="<%= Util.formatCCY(cdTransac.getE03DEATAX())%>" readonly></TD>
            <TD nowrap align="center"></TD>
          </TR>
          <TR> 
            <TD nowrap id="trdark"> 
              <DIV align="right">Total :</DIV>
            </TD>
            <TD nowrap align="center"><INPUT type="text" id="txtright" name="E03DEATOT" size="15" maxlength="13" value="<%= Util.formatCCY(cdTransac.getE03DEATOT())%>" readonly></TD>
            <TD nowrap align="center"> 
              <INPUT id="txtright" type="text" readonly name="AFTERTOT" size="15" maxlength="13" value="" onkeypress="enterDecimal()">
            </TD>
          </TR>
          <TR>
          	<TD nowrap colspan="3"> 
              <DIV align="center">Last Calculation Date: <INPUT type="text" name="E03DEALC1" size="2" maxlength="2" value="<%= cdTransac.getE03DEALC1().trim()%>" readonly><INPUT type="text" name="E03DEALC2" size="2" maxlength="2" value="<%= cdTransac.getE03DEALC2().trim()%>" readonly><INPUT type="text" name="E03DEALC3" size="2" maxlength="2" value="<%= cdTransac.getE03DEALC3().trim()%>" readonly></DIV>
            </TD>
           </TR>
        	</TBODY>
            </TABLE>
      	</TD>
    </TR>
  </TBODY>
</TABLE>
<h4>Transaction Information</h4>
  <table class="tableinfo">
    <tr > 
      <td> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td width="40%"> 
              <div align="right">Principal :</div>
            </td>
            <td width="60%"> 
              <input type="text" readonly name="E03TRNPRI" size="15" maxlength="13" value="<%= Util.formatCCY(cdTransac.getE03TRNPRI())%>">
              <input type="hidden" name="E03TRNPRF" value="<%= cdTransac.getE03TRNPRF().trim()%>">
              <input type="radio" readonly name="CE03TRNPFL" value="0" 
              onClick="document.forms[0].E03TRNPRF.value='0'" 
			  <%if(cdTransac.getE03TRNPRF().equals("0")) out.print("checked");%> disabled>
              Increase 
              <input type="radio" readonly name="CE03TRNPFL" value="5" 
              onClick="document.forms[0].E03TRNPRF.value='5'" 
			  <%if(cdTransac.getE03TRNPRF().equals("5")) out.print("checked");%> disabled>
              Decrease</td> 
          </tr>
          <tr id="trclear"> 
            <td width="40%"> 
              <div align="right">Interest :</div>
            </td>
            <td width="60%"> 
              <input type="text" readonly name="E03TRNINT" size="15" maxlength="13" value="<%= Util.formatCCY(cdTransac.getE03TRNINT())%>">
              <input type="hidden" name="E03TRNINF" value="<%= cdTransac.getE03TRNINF().trim()%>">
              <input type="radio" readonly name="CE03TRNINF" value="0"
			   onClick="document.forms[0].E03TRNINF.value='0'"
			   <%if(cdTransac.getE03TRNINF().equals("0")) out.print("checked");%> disabled> Reversal <input type="radio" readonly name="CE03TRNINF" value="5"
			   onClick="document.forms[0].E03TRNINF.value='5'"
			   <%if(cdTransac.getE03TRNINF().equals("5")) out.print("checked");%> disabled> Payment </td>
          </tr>
          <tr id="trdark"> 
            <td width="40%" height="27"> 
              <div align="right">Interest Adjustment :</div>
            </td>
            <td width="60%" height="27"> 
              <input type="text" readonly name="E03TRNADJ" size="15" maxlength="13" value="<%= Util.formatCCY(cdTransac.getE03TRNADJ())%>">
              <input type="hidden" name="E03TRNADF" value="<%= cdTransac.getE03TRNADF().trim()%>">
              <input type="radio" readonly name="CE03TRNIAF" value="0"
			   onClick="document.forms[0].E03TRNADF.value='0'"
			   <%if(cdTransac.getE03TRNADF().equals("0")) out.print("checked");%> disabled>
              Increase 
              <input type="radio" readonly name="CE03TRNIAF" value="5"
			   onClick="document.forms[0].E03TRNADF.value='5'"
			   <%if(cdTransac.getE03TRNADF().equals("5")) out.print("checked");%> disabled>
              Decrease </td>
          </tr>
          <tr id="trclear"> 
            <td width="40%"> 
              <div align="right">Withholding :</div>
            </td>
            <td width="60%"> 
              <input type="text" readonly name="E03TRNWHL" size="15" maxlength="13" value="<%= Util.formatCCY(cdTransac.getE03TRNWHL())%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="40%"> 
              <div align="right">Sales Tax :</div>
            </td>
            <td width="60%"> 
              <input type="text" readonly name="E03TRNTAX" size="15" maxlength="13" value="<%= Util.formatCCY(cdTransac.getE03TRNTAX())%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="40%"> 
              <div align="right">Value Date :</div>
            </td>
            <td width="60%">
              <input type="text" readonly name="E03TRNVD1" size="2" maxlength="2" value="<%= cdTransac.getE03TRNVD1().trim()%>">
              <input type="text" readonly name="E03TRNVD2" size="2" maxlength="2" value="<%= cdTransac.getE03TRNVD2().trim()%>">
              <input type="text" readonly name="E03TRNVD3" size="2" maxlength="2" value="<%= cdTransac.getE03TRNVD3().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="40%"> 
              <div align="right">New Interest Rate :</div>
            </td>
            <td width="60%">
              <input type="text" readonly name="E03DEAEXR" size="11" maxlength="11" value="<%= cdTransac.getE03DEAEXR().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="40%"> 
              <div align="right">Transaction Narrative :</div>
            </td>
            <td width="60%">
              <input type="text" readonly name="E03DEANR1" size="30" maxlength="30" value="<%= cdTransac.getE03DEANR1().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="40%"> 
              <div align="right"></div>
            </td>
            <td width="60%">
              <input type="text" readonly name="E03DEANR2" size="30" maxlength="30" value="<%= cdTransac.getE03DEANR2().trim()%>">
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
                <input type="text" name="E03TRNOPC" size="3" maxlength="3" value="<%= cdTransac.getE03TRNOPC().trim()%>" readonly>
                <input type=HIDDEN name="E03TRNGLN" value="<%= cdTransac.getE03TRNGLN().trim()%>">
                <input type="text" name="E03TRNCON" size="25" maxlength="25" readonly value="<%= cdTransac.getE03TRNCON().trim()%>">
              </div>
            </td>
            <td width="5%" > 
              <div align="center"> 
                <input type="text" readonly name="E03TRNBNK" size="2" maxlength="2" value="<%= cdTransac.getE03TRNBNK().trim()%>">
              </div>
            </td>
            <td width="13%" > 
              <div align="center"> 
                <input type="text" readonly name="E03TRNBRN" size="3" maxlength="3" value="<%= cdTransac.getE03TRNBRN().trim()%>">
              </div>
            </td>
            <td width="12%" > 
              <div align="center">
                <input type="text" readonly name="E03TRNCCY" size="3" maxlength="3" value="<%= cdTransac.getE03TRNCCY().trim()%>">
              </div>
            </td>
            <td width="21%"  > 
              <div align="center"> 
                <input type="text" readonly name="E03TRNACC" size="16" maxlength="12" value="<%= cdTransac.getE03TRNACC().trim()%>">
              </div>
            </td>
          </tr>
        </table>
        
      </td>
    </tr>
  </table>
  <SCRIPT language="JavaScript">
      UpdateField('E03DEAMEP','E03TRNPRI','AFTERPRI','E03TRNPRF',false);
      UpdateField('E03DEAMEI','E03TRNINT','AFTERINT','E03TRNINF',false);
      UpdateField('E03DEAMEI','E03TRNADJ','AFTERINT','E03TRNADF',true);
      UpdateTotal();
  </SCRIPT>
  <p align="center">&nbsp;</p>
</form>
</body>
</html>
