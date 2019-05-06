<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Loan Rates</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="lnParam" class="datapro.eibs.beans.EDD066002Message"  scope="session" />
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

function showFixPerField(elem, index){
  if (elem.value == 'F'){
	document.getElementById('E02PRFFA'+index).style.display="";
	document.getElementById('E02PRFRT'+index).style.display="none";
  } else if (elem.value == '%'){
	document.getElementById('E02PRFFA'+index).style.display="none";
	document.getElementById('E02PRFRT'+index).style.display="";
  }
  elem.focus();  
}
</SCRIPT>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors();");
     out.println("</SCRIPT>");
 }       
%>

</head>
<body>
<h3 align="center">Paying and Receiving Fee  Structure<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="fee_maint.jsp, EDD0660"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDD0660" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="200">
  <INPUT TYPE=HIDDEN NAME="OPT" value="<%= request.getParameter("OPT") %>">
  
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
           	<td nowrap width="10%" align=right> 
              <b>Fee Structure :</b>
            </td>
            <td nowrap  width="20%"> 
               <input type="text" name="E02PRFTBL" size="4" maxlength="3" value="<%= lnParam.getE02PRFTBL()%>" readonly>
            </td>
            <td nowrap  width="10%" align=right> 
              <b>Bank :</b>
            </td>
            <td nowrap  width="20%"> 
              <input type="text" name="E02PRFBNK" size="3" maxlength="2" value="<%= lnParam.getE02PRFBNK()%>" readonly>
            </td>
            <td nowrap  width="10%" align=right> 
              <b>Fee Currency :</b>
            </td>
            <td nowrap  width="20%"> 
               <input type="text" name="E02PRFFCY" size="4" maxlength="3" value="<%= lnParam.getE02PRFFCY()%>" >
			   <a href="javascript:GetCurrency('E02PRFFCY','')">
			   <img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0"></a>
			   <img src="<%=request.getContextPath()%>/images/Check.gif" alt="campo mandatorio" align="bottom" border="0"> 
            </td>            
          </tr>
          <tr id="trdark"> 
            <td nowrap align=right> 
              <b>Description :</b>
            </td>
            <td nowrap>  
               <input type="text" name="E02PRFDSC" size="35" maxlength="35" value="<%= lnParam.getE02PRFDSC()%>" >
            </td>
            <td nowrap align=right> 
              <b>Fee Type :</b>
            </td>
            <td nowrap > 
               <input type="text" name="E02PRFTYP" size="3" maxlength="2" value="<%= lnParam.getE02PRFTYP()%>" >
				<a href="javascript:GetCodeCNOFC('E02PRFTYP','68')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" alt="ayuda" align="bottom" border="0" ></a>
            </td>  
            <td nowrap align=right> 
              <b>Customer :</b>
            </td>
            <td nowrap > 
               <input type="text" name="E02PRFCUN" size="11" maxlength="9" value="<%= lnParam.getE02PRFCUN()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <th nowrap >Fee<br>Type</th>
            <th nowrap >Fee<br>Amount</th>
            <th nowrap >Inicial<br>Range</th>
            <th nowrap >Final<br>Range</th>
            <th nowrap >Maximum<br>Amount</th>
            <th nowrap >Minimum<br>Amount</th>
            <th nowrap >Currency</th>
            <th nowrap >Account</th>
            <th nowrap >Description</th>
          </tr>
          <% for(int i=1; i < 10; i++){ %>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="center"> 
	              <select name="E02PRFFT<%= i %>" onchange="showFixPerField(this, <%= i %>);">
	                <option value=" " <% if (!(lnParam.getField("E02PRFFT"+i).getString().equals("F") || lnParam.getField("E02PRFFT"+i).getString().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (lnParam.getField("E02PRFFT"+i).getString().equals("F")) out.print("selected"); %>>Flat Fee</option>
	                <option value="%" <% if (lnParam.getField("E02PRFFT"+i).getString().equals("%")) out.print("selected"); %>>Percentage</option>        
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="left"> 
              	<input type="text" name="E02PRFFA<%= i %>" id="E02PRFFA<%= i %>" value="<%= lnParam.getField("E02PRFFA"+i).getString() %>" size="15" maxlength="13" onkeypress="enterDecimal()"
              		style="display: <%= lnParam.getField("E02PRFFT"+i).getString().equals("%") ? "none" : "" %>;" >
              </div>
              <div align="left" > 
              	<input type="text" name="E02PRFRT<%= i %>" id="E02PRFRT<%= i %>" value="<%= lnParam.getField("E02PRFRT"+i).getString() %>" size="15" maxlength="10" onkeypress="enterDecimal(6)"
              		style="display: <%= lnParam.getField("E02PRFFT"+i).getString().equals("%") ? "" : "none" %>;" >
              </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02PRFRI<%= i %>" id="E02PRFRI<%= i %>" value="<%= lnParam.getField("E02PRFRI"+i).getString() %>" size="16" maxlength="15" onkeypress="enterDecimal()">
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02PRFRF<%= i %>" id="E02PRFRF<%= i %>" value="<%= lnParam.getField("E02PRFRF"+i).getString() %>" size="16" maxlength="15" onkeypress="enterDecimal()">
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02PRFFX<%= i %>" value="<%= lnParam.getField("E02PRFFX"+i).getString() %>" size="15" maxlength="13" onkeypress="enterDecimal()">
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02PRFFM<%= i %>" value="<%= lnParam.getField("E02PRFFM"+i).getString() %>" size="15" maxlength="13" onkeypress="enterDecimal()">
 			  </div>
            </td>
            <td nowrap > 
              <div align="center"> 
 				<input type="text" name="E02PRFAC<%= i %>" value="<%= lnParam.getField("E02PRFAC"+i).getString() %>" size="4" maxlength="3" oncontextmenu="showPopUp(currencyHelp,this.name,'','','','','')">              
 			  </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02PRFGL<%= i %>" size="18" maxlength="17" value="<%= lnParam.getField("E02PRFGL"+i).getString()%>" oncontextmenu="showPopUp(ledgerHelp,this.name,'','','','','')">
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="D02GL1DSC" size="35" maxlength="35" value="<%= lnParam.getField("D02GL"+i+"DSC").getString()%>" >
              </div>
            </td>
          </tr>
		<% } %>
         <tr id="trclear"> 
            <td nowrap colspan="7"> Flat Fee (integer), Percentage (3 decimals) 
            </td>
          </tr>
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
