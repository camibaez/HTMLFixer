<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Loan Rates</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="lnParam" class="datapro.eibs.beans.EDL051002Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

builtHPopUp();

function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
	init(opth,field,bank,ccy,field1,field2,opcod);
	showPopupHelp();
}

function checkValues() {
	return true;
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

</head>
<body>
<h3 align="center">Loan Table Structure<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="ln_table_maint.jsp, EDL0510"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0510" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="200">
  <INPUT TYPE=HIDDEN NAME="OPT" value="<%= request.getParameter("OPT") %>">
  <INPUT TYPE=HIDDEN NAME="SELTYP" value="<%= request.getParameter("SELTYP") %>">

  <table class="tableinfo">
    <tr>
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="20%" align=right>
              <b>Bank :</b>
            </td>
            <td nowrap >
              <input type="text" name="E02SELBNK" size="4" maxlength="2" value="<%= lnParam.getE02DLSBNK()%>" readonly>
            </td>
            <td nowrap width="20%" align=right>
              <b>Product :</b>
            </td>
            <td nowrap >
               <input type="text" name="E02SELPRD" size="5" maxlength="4" value="<%= lnParam.getE02DLSTYP()%>" readonly>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="20%" align=right>
              <b>Table :</b>
            </td>
            <td nowrap colspan=3>
               <input type="text" name="E02SELTBL" size="4" maxlength="2" value="<%= lnParam.getE02DLSTLN()%>" readonly>
               <input type="text" name="E02DLSDSC" size="35" maxlength="35" value="<%= lnParam.getE02DLSDSC()%>" >
            </td>
          </tr>
		  <%if(!lnParam.getE02DLSCUN().equals("0")){%>
          <tr id="trdark">
            <td nowrap width="20%" align=right>
              <b>Client :</b>
            </td>
            <td nowrap colspan=3>
               <input type="text" name="E02SELCUN" size="4" maxlength="2" value="<%= lnParam.getE02DLSCUN()%>">
               <input type="text" name="E02DSCCUN" size="35" maxlength="35" value="<%= lnParam.getE02CUSNA1()%>">
            </td>
          </tr>
          <%}%>
        </table>
      </td>
    </tr>
  </table>

  <H4>Basic Data</H4>
  <table  class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap>
            </td>
            <td nowrap>
            </td>
            <td nowrap>
            </td>
            <td nowrap colspan=4>
            </td>
            <td nowrap colspan=2>
              Factor
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap>
              <div align="right">Accrual Base (360/65/66) :</div>
            </td>
            <td nowrap>
              <input type="text" name="E02DLSDAB" size="4" maxlength="3" value="<%= lnParam.getE02DLSDAB()%>" onkeypress="enterInteger()">
            </td>
            <td nowrap>
              <div align="right">Rate Base/Spread:</div>
            </td>
            <td nowrap colspan=4>
              <input type="text" name="E02DLSRTF" size="10" maxlength="10"	value="<%= lnParam.getE02DLSRTF()%>" onkeypress="enterInteger()">
            </td>
            <td nowrap colspan=2>
              <input type="text" name="E02DLSRFT" size="2" maxlength="1"	value="<%= lnParam.getE02DLSRFT()%>" onkeypress="enterInteger()">
              <a href="javascript:GetCode('E02DLSRFT','STATIC_ln_tables_factor.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap>
              <div align="right">Minimun Rate Allowed :</div>
            </td>
            <td nowrap>
 	          <input type="text" name="E02DLSMIN" size="10" maxlength="10"	value="<%= lnParam.getE02DLSMIN()%>">
 	        </td>
 	        <td nowrap>
              <div align="right">Maximum Rate Allowed :</div>
            </td>
            <td nowrap colspan=4>
 	          <input type="text" name="E02DLSMAX" size="10" maxlength="10"	value="<%= lnParam.getE02DLSMAX()%>">
 	        </td>
 	        <td nowrap colspan=2>
              <input type="text" name="E02DLSMMT" size="2" maxlength="1"	value="<%= lnParam.getE02DLSMMT()%>" onkeypress="enterInteger()">
              <a href="javascript:GetCode('E02DLSMMT','STATIC_ln_tables_max_rate.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap>
              <div align="right">Interest Type :</div>
            </td>
            <td nowrap>
            	<input type="text" name="E02DLSICT" size="2" maxlength="1"	value="<%= lnParam.getE02DLSICT()%>">
              <a href="javascript:GetCode('E02DLSICT','STATIC_cd_formula.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
            </td>
            <td nowrap>
              <div align="right">Custody Period Days :</div>
            </td>
            <td nowrap colspan=4>
  				<input type="text" name="E02DLSCUP" size="3" maxlength="2" value="<%=lnParam.getE02DLSCUP()%>">
 	        </td>
            <td nowrap colspan=2>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap>
              <div align="right">Partial Payment Allowed :</div>
            </td>
            <td nowrap>
              <input type="text" name="E02DLSPPR" size="2" maxlength="1"	value="<%= lnParam.getE02DLSPPR()%>">
              <a href="javascript:GetCode('E02DLSPPR','STATIC_ln_tables_partial_payment.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
            </td>
            <td nowrap>
              <div align="right">Maximum Penalty Interest :<BR>(When Loan is Transferred to <BR>Contingency Accounts)
				</div>
            </td>
            <td nowrap colspan=6>
 	          <input type="text" name="E02DLSWPR" size="15" maxlength="15"	value="<%= lnParam.getE02DLSWPR()%>">
 	        </td>
          </tr>
          <tr id="trdark">
            <td nowrap>
              <div align="right">Pre-Payment Principal :</div>
            </td>
			<td nowrap>
  				<input type="radio" name="E02DLSFL1" value="Y" <%if(lnParam.getE02DLSFL1().equals("Y")) out.print("checked");%>>Yes
  				<input type="radio" name="E02DLSFL1" value="N" <%if(lnParam.getE02DLSFL1().equals("N")) out.print("checked");%>>No
			</td>
  			<td nowrap>
              <div align="right">Priority of Payment :</div>
            </td>
            <td nowrap>
  				<input type="text" name="E02DLSPP1" size="2" maxlength="1" value="<%=lnParam.getE02DLSPP1()%>" onkeypress="enterInteger()"
				oncontextmenu="showPopUp(documentsPriority,this.name,'','','','','')">
  			</td>
  			<td nowrap>
  				<input type="text" name="E02DLSPP2" size="2" maxlength="1" value="<%=lnParam.getE02DLSPP2()%>" onkeypress="enterInteger()"
				oncontextmenu="showPopUp(documentsPriority,this.name,'','','','','')">
  			</td>
  			<td nowrap>
  				<input type="text" name="E02DLSPP3" size="2" maxlength="1" value="<%=lnParam.getE02DLSPP3()%>" onkeypress="enterInteger()"
				oncontextmenu="showPopUp(documentsPriority,this.name,'','','','','')">
  			</td>
  			<td nowrap>
  				<input type="text" name="E02DLSPP4" size="2" maxlength="1" value="<%=lnParam.getE02DLSPP4()%>" onkeypress="enterInteger()"
				oncontextmenu="showPopUp(documentsPriority,this.name,'','','','','')">
  			</td>
  			<td nowrap>
  				<input type="text" name="E02DLSPP5" size="2" maxlength="1" value="<%=lnParam.getE02DLSPP5()%>" onkeypress="enterInteger()"
				oncontextmenu="showPopUp(documentsPriority,this.name,'','','','','')">
  			</td>
  			<td nowrap>
  				<input type="text" name="E02DLSPP6" size="2" maxlength="1" value="<%=lnParam.getE02DLSPP6()%>" onkeypress="enterInteger()">
  			</td>
          </tr>
          <tr id="trdark">
			<td nowrap>
            </td>
			<td nowrap>
  			</td>
  			<td nowrap>
            </td>
            <td nowrap>
  				<div align="center">P</div>
  			</td>
  			<td nowrap>
  				<div align="center">I</div>
  			</td>
  			<td nowrap>
  				<div align="center">M</div>
  			</td>
  			<td nowrap>
  				<div align="center">T</div>
  			</td>
  			<td nowrap>
  				<div align="center">C</div>
  			</td>
  			<td nowrap>
  				<div align="center">D</div>
  			</td>
          </tr>
          <tr id="trclear">
			<td nowrap>
              <div align="right">G/L Reclassification :</div>
            </td>
			<td nowrap>
  				<input type="text" name="E02DLSTCG" size="2" maxlength="1" value="<%=lnParam.getE02DLSTCG()%>">
              <a href="javascript:GetCodeGL('E02DLSTCG','STATIC_ln_tables_accounting_changes.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a></td>
  			<td nowrap>
              <div align="right">Minimum Late Fee Amount :</div>
            </td>
			<td nowrap colspan=6>
 	          <input type="text" name="E02DLSMPA" size="15" maxlength="15"	value="<%= lnParam.getE02DLSMPA()%>">
  			</td>
          </tr>
          <tr id="trdark">
			<td nowrap colspan=9>
			   <table cellspacing="0" cellpadding="2" width="100%" border="0">
		          <tr id="trdark">
		            <td nowrap>
		            	<div align="right">Days of Change G/L :</div>
		            </td>
		            <td nowrap>
		                (1)<input type="text" name="E02DLSPL1" size="4" maxlength="4" value="<%=lnParam.getE02DLSPL1()%>">
		            </td>
		            <td nowrap>
		            	(2)<input type="text" name="E02DLSPL2" size="4" maxlength="4" value="<%=lnParam.getE02DLSPL2()%>">
		            </td>
		            <td nowrap>
		            	(3)<input type="text" name="E02DLSPL3" size="4" maxlength="4" value="<%=lnParam.getE02DLSPL3()%>">
		            </td>
		            <td nowrap>
		              	(4)<input type="text" name="E02DLSPL4" size="4" maxlength="4" value="<%=lnParam.getE02DLSPL4()%>">
		            </td>
		            <td nowrap>
		              	(5)<input type="text" name="E02DLSPL5" size="4" maxlength="4" value="<%=lnParam.getE02DLSPL5()%>">
		            </td>
		          </tr>
			   </table>
            </td>
          </tr>
         </table>
       </td>
    </tr>
  </table>
  <H4>Comissions / Taxes</H4>
  <table  class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <th nowrap >Description</th>
            <th nowrap >Fac</th>
            <th nowrap >Amount</th>
            <th nowrap >Feq</th>
            <th nowrap >Minimum</th>
            <th nowrap >Maximum</th>
            <th nowrap >Ccy</th>
            <th nowrap >GL/Number</th>
            <th nowrap >Tax</th>
          </tr>
          <%
          int amount = 9;
		  String name;
		  for ( int i=1; i<=amount; i++ ) {
		  	  name = i + "";
		  %>
          <tr id="trclear">
            <td nowrap >
              <div align="center" nowrap>
                <input type="text" name="E02DLSDE<%= name %>" value="<%= lnParam.getField("E02DLSDE"+name).getString() %>" size="30" maxlength="30">
              </div>
            </td>
            <td nowrap >
              <div align="left">
                <input type="text" name="E02DLSFA<%= name %>" size="2" maxlength="1"
				 oncontextmenu="showPopUp(documentsFeeCharges,this.name,'','','','','')"
				 value="<%= lnParam.getField("E02DLSFA"+name).getString()%>">
              </div>
            </td>
            <td nowrap >
              <div align="left">
                <input type="text" name="E02DLSAM<%= name %>" size="15" maxlength="15" value="<%= lnParam.getField("E02DLSAM"+name).getString()%>">
              </div>
            </td>
            <td nowrap>
              <div align="center">
                <input type="text" name="E02DLSAP<%= name %>" size="2" maxlength="1"
			    oncontextmenu="showPopUp(documentsFrecCharges,this.name,'','','','','')"
				value="<%= lnParam.getField("E02DLSAP"+name).getString()%>" onKeypress="enterDecimal()">
              </div>
            </td>
            <td nowrap >
              <div align="center">
                <input type="text" name="E02DLSMN<%= name %>" size="15" maxlength="15" value="<%= lnParam.getField("E02DLSMN"+name).getString()%>">
              </div>
            </td>
            <td nowrap >
              <div align="center">
                <input type="text" name="E02DLSMX<%= name %>" size="15" maxlength="15"  value="<%= lnParam.getField("E02DLSMX"+name).getString()%>">
              </div>
            </td>
            <td nowrap>
              <div align="center">
                <input type="text" name="E02DLSGB<%= name %>" size="2" maxlength="1"
				 oncontextmenu="showPopUp(documentsCurrency,this.name,'','','','','')"
				value="<%= lnParam.getField("E02DLSGB"+name).getString()%>" >
              </div>
            </td>
            <td nowrap>
              <div align="center">
                <input type="text" name="E02DLSGL<%= name %>" size="13" maxlength="12"
			    oncontextmenu="showPopUp(ledgerHelp,this.name,'','','','','')"
				value="<%= lnParam.getField("E02DLSGL"+name).getString()%>" >
              </div>
            </td>

            <td nowrap>
              <div align="center">
                <input type="text" name="E02DLSWH<%= name %>" size="2" maxlength="1"  value="<%= lnParam.getField("E02DLSWH"+name).getString()%>">
              </div>
            </td>
          </tr>
          <%}%>
    </table>
    </td>
    </tr>
  </table>
  <p align="center">
        <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </p>

  </form>
</body>
</html>
