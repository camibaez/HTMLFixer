<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Investment Custodian Change</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" 	class= "datapro.eibs.beans.ELEERRMessage"  		scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos" 			scope="session" />
<jsp:useBean id= "invTrade" 	class= "datapro.eibs.beans.EIE026001Message"  	scope="session" />

<SCRIPT Language="javascript">
function CheckACC(){
	if(document.forms[0].E01OLDCUN.value.length < 1){
		alert("A valid old custodian must be entered");
		document.forms[0].E01OLDCUN.value='';
		document.forms[0].E01OLDCUN.focus();
	} else {
  		document.forms[0].submit();
	}
}

</SCRIPT>

<%
if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
%>
<SCRIPT Language="Javascript">
        showErrors();
</SCRIPT>
<%}%>

</head>
<body>

<h3 align="center">Investment Custodian Change<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="EIE0260_inv_custodian_change.jsp"></h3>
<hr size="4">

<form method="post" name="product_change" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0260">
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="300">
    <INPUT TYPE=HIDDEN NAME="H01FLGWK1" VALUE="3">
    <INPUT TYPE=HIDDEN NAME="Type" VALUE="<%= userPO.getType()%>">

  <table  class="tbenter" width="100%" border="0" cellspacing=0 cellpadding=2>
	
	
	<tr>
    	<td align="right">
              Old Custodian Code :
        </td>
    	 <td nowrap width="80%" > 
              <div align="left"></div>
              <div align="right"></div>
              <div align="left">
                <input type="text" name="E01OLDCUN" size="5" maxlength="3" value="<%= invTrade.getE01OLDCUN()%>" >
                <input type="text" name="E01OLDNM1" size="35" maxlength="30" value="<%= invTrade.getE01OLDNM1()%>" onchange="">
                <a href="javascript:GetCustodian('E01OLDCUN','E01OLDNM1')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0"></a> 
                <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  > 
              </div>
            </td>
    </tr>
	<tr>
    	<td align="right">
              New Custodian Code :
        </td>
    	 <td nowrap width="80%" > 
              <div align="left"></div>
              <div align="right"></div>
              <div align="left">
                <input type="text" name="E01NEWCUN" size="5" maxlength="3" value="<%= invTrade.getE01NEWCUN()%>" >
                <input type="text" name="E01NEWNM1" size="35" maxlength="30" value="<%= invTrade.getE01NEWNM1()%>" onchange="">
                <a href="javascript:GetCustodian('E01NEWCUN','E01NEWNM1')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0"></a> 
                <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  > 
              </div>
            </td>
    </tr>
    
    <tr>
    	<td align="right">
            Instrument Code :
        </td>
    	<td align="left">             
        	<input type="text" name="E01ISIIIC" size="10" maxlength="9" onkeypress="enterInteger()" value="<%= invTrade.getE01ISIIIC()%>">               
              <a href="javascript:GetInstrumentParams('E01ISIIIC',' ',' ',' ',' ',' ',' ')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0"></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  > 
    	</td>
    </tr>
    
    <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Portfolio :</div>
            </td>
            <td nowrap colspan="2" > 
              <div align="left"> 
                <input type="text" name="E01ORDPRF" size="9" maxlength="9" value="<%= invTrade.getE01ORDPRF()%>" >
                <INPUT type="text" name="E01PRFDSC" size="35" maxlength="35" value="<%= invTrade.getE01PRFDSC().trim()%>">
                 <a href="javascript:GetPortfolioDescIdInvest('E01ORDPRF','E01PRFDSC','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absbottom" border="0" ></a> 
                 
                 
              </div>
            </td>
	                
          </tr>
	<tr>
    	<td align="center" colspan="2">
			<input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="CheckACC()">
    	</td>
    </tr>
   </table>

<script language="JavaScript">
  document.forms[0].E01ISIIIC.focus();
  document.forms[0].E01ISIIIC.select();
</script>

<%if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
%>
     <SCRIPT Language="Javascript">
            showErrors();
     </SCRIPT>
<%}%>
</form>
</body>
</html>
