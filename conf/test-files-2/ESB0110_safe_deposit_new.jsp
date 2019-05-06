<html>
<head>
<title>Safe Deposit New</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import ="datapro.eibs.master.Util" %>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "msgPart" 	class= "datapro.eibs.beans.ESB011001Message"  	scope="session" />
<jsp:useBean id= "error" 	class= "datapro.eibs.beans.ELEERRMessage"  		scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos"  			scope="session"/>

<SCRIPT Language="Javascript">
function enterAction(code,numc,id,prod,card,apc) {
	
	if (card =="") 
		document.forms[0].fieldName.value = code; 
	else 
		document.forms[0].fieldName.value = card;
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

<H3 align="center">Safe Deposit Box New<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="safe_deposit_new, ESB0110"></H3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.safedeposit.JSESB0110">
 
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="500">
  <INPUT TYPE=HIDDEN NAME="E01SBMBNK" VALUE="<%=msgPart.getE01SBMBNK()%>">
  
  <table class="tableinfo">
   <tr> 
   <td>
    <table cellspacing=0 cellpadding=2 width="100%" border="0">    
     	<tr id=trclear> 
	      <td nowrap width="40%"> 
	        <div align="right">Number : </div>
	      </td>
				<td nowrap width="60%" colspan="3">
				<div align="left"><input type="text" name="E01SBMCOD" size="12"
					maxlength="10" value="<%= userPO.getHeader1() %>" readonly> <img
					src="<%=request.getContextPath()%>/images/Check.gif"
					alt="mandatory field" align="absbottom" border="0"></div>
				</td>
			</tr>
     	<tr id=trdark> 
	      <td nowrap> 
	        <div align="right">Type : </div>
	      </td>
				<td nowrap colspan="3">
				<div align="left"><input type="text" name="E01SBMTYP" size="6"
					maxlength="5" value="<%= msgPart.getE01SBMTYP() %>"> <input
					type="text" name="D01SBTDSC" size="52" maxlength="50"
					value="<%= msgPart.getD01SBTDSC() %>" readonly> <a
					href="javascript:GetDepositType('E01SBMTYP','D01SBTDSC')"> <img
					src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"
					align="bottom" border="0"></a> <img
					src="<%=request.getContextPath()%>/images/Check.gif"
					alt="mandatory field" align="absbottom" border="0"></div>
				</td>
			</tr>
     	<TR id=trclear>
	      <td nowrap> 
	        <div align="right">Location : </div>
	      </td>
				<td nowrap colspan="3">
				<div align="left"><input type="text" name="E01SBMLOC" size="4"
					maxlength="3" value="<%= msgPart.getE01SBMLOC() %>"> <input
					type="text" name="D01LOCNME" size="22" maxlength="20"
					value="<%= msgPart.getD01LOCNME() %>" readonly><A
					href="javascript:GetLocations('E01SBMLOC','D01LOCNME')"><IMG
					src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"
					align="bottom" border="0"></A> <img
					src="<%=request.getContextPath()%>/images/Check.gif"
					alt="mandatory field" align="absbottom" border="0"></div>
				</td>
			</TR>
     	<tr id=trdark> 
	      <td nowrap> 
	        <div align="right">Description : </div>
	      </td>
				<td nowrap colspan="3">
				<div align="left"><input type="text" name="E01SBMDSC" size="32"
					maxlength="30" value="<%= msgPart.getE01SBMDSC() %>"> <img
					src="<%=request.getContextPath()%>/images/Check.gif"
					alt="mandatory field" align="absbottom" border="0"></div>
				</td>
			</tr>
     	<TR id=trclear>
	      <td nowrap> 
	        <div align="right">Customer : </div>
	      </td>
				<td nowrap colspan="3">
				<div align="left"><input type="hidden" name="E01SBMCUN" size="10"
					maxlength="10" value="<%= msgPart.getE01SBMCUN() %>"> <input
					type="text" name="D01CUSNA1" size="47" maxlength="45"
					value="<%= msgPart.getD01CUSNA1() %>" readonly> <a
					href="javascript:GetCustomerDescId('E01SBMCUN', 'D01CUSNA1', '')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"
					align="bottom" border="0"></a> <img
					src="<%=request.getContextPath()%>/images/Check.gif"
					alt="mandatory field" align="absbottom" border="0"></div>
				</td>
     	</TR>
			<TR id=trdark>
		<td nowrap> 
	        <div align="right">Retail Account : </div>
	      </td>
	      <td nowrap colspan="3"><div align="left">
	      	<input type="text" name="E01SBMRAC" size="10" maxlength="10" value="<%= msgPart.getE01SBMRAC() %>">
      	    <a href="javascript:GetAccByClient('E01SBMRAC',document.forms[0].E01SBMBNK.value,'RT','',document.forms[0].E01SBMCUN.value)">
      	    <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a>
      	    </div>
		  </td>
			</TR>
			<TR id=trclear>
     	  <td nowrap> 
	        <div align="right">Fee Table : </div>
	      </td>
	      <td nowrap><div align="left">
	      	<input type="text" name="E01SBMFEE" size="4" maxlength="2" value="<%= msgPart.getE01SBMFEE() %>">
      	    <a href="javascript:GetFeeTable('E01SBMFEE')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a>
      	    </div>
		  </td>
				<TD nowrap>
					        <div align="right">Charge Frequency : </div>
				</TD>
				<TD nowrap>
				<div align="left">
				<SELECT name="E01SBMFRQ">
					<OPTION value="M"
						<%if (msgPart.getE01SBMFRQ().equals("M")) { out.print("selected"); }%>>Monthly</OPTION>
					<OPTION value="Q"
						<%if (msgPart.getE01SBMFRQ().equals("Q")) { out.print("selected"); }%>>Quaterly</OPTION>
					<OPTION value="S"
						<%if (msgPart.getE01SBMFRQ().equals("S")) { out.print("selected"); }%>>Semi-Annually</OPTION>
					<OPTION value="Y"
						<%if (msgPart.getE01SBMFRQ().equals("Y")) { out.print("selected"); }%>>Annually</OPTION>
				</SELECT>
				</div>
				</TD>
			</TR>
			<TR id=trdark>
            <td nowrap width="17%" >
              <div align="right">Openning Date :</div>
            </td>
              <td nowrap > 
                <div align="left"> 
                  <input type="text" name="E01SBMODM" size="2" maxlength="2" value="<%= msgPart.getE01SBMODM().trim()%>" onkeypress="enterInteger()">
                  <input type="text" name="E01SBMODD" size="2" maxlength="2" value="<%= msgPart.getE01SBMODD().trim()%>" onkeypress="enterInteger()">
                  <input type="text" name="E01SBMODY" size="2" maxlength="2" value="<%= msgPart.getE01SBMODY().trim()%>" onkeypress="enterInteger()">
                  <a href="javascript:DatePicker(document.forms[0].E01SBMODM,document.forms[0].E01SBMODD,document.forms[0].E01SBMODY)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
                </div>
              </td>
				<TD nowrap></TD>
				<TD nowrap></TD>
			</TR>
			<tr id=trclear>
            <td nowrap width="17%" >
              <div align="right">Next Collection Date :</div>
            </td>
              <td nowrap > 
                <div align="left"> 
                  <input type="text" name="E01SBMCDM" size="2" maxlength="2" value="<%= msgPart.getE01SBMCDM().trim()%>" onkeypress="enterInteger()">
                  <input type="text" name="E01SMBCDD" size="2" maxlength="2" value="<%= msgPart.getE01SBMCDD().trim()%>" onkeypress="enterInteger()">
                  <input type="text" name="E01SBMCDY" size="2" maxlength="2" value="<%= msgPart.getE01SBMCDY().trim()%>" onkeypress="enterInteger()">
                  <a href="javascript:DatePicker(document.forms[0].E01SBMODM,document.forms[0].E01SBMODD,document.forms[0].E01SBMODY)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
                </div>
              </td>
				<TD nowrap></TD>
				<TD nowrap></TD>
      	</tr>
      	<TR id=trdark>
		  <td nowrap> 
		     <div align="right">Safe Deposit Serial Number : </div>        
		  </td>
      	  <td nowrap> 
      	    <input type="text" name="E01SBMSER" size="16" maxlength="14" value="<%= msgPart.getE01SBMSER() %>">
      	  </td>
				<TD nowrap></TD>
				<TD nowrap></TD>
      	</TR>
			<TR id=trclear>
            <td nowrap width="17%" >
              <div align="right">Key Number :</div>
            </td>
      	  <td nowrap> 
      	    <input type="text" name="E01SBMKEY" size="16" maxlength="14" value="<%= msgPart.getE01SBMKEY() %>">
      	  </td>
				<TD nowrap></TD>
				<TD nowrap></TD>
			</TR>
			<TR id=trdark>
            <td nowrap width="17%" >
              <div align="right">Number of Keys Delivered :</div>
            </td>
      	  <td nowrap> 
      	    <input type="text" name="E01SBMKNU" size="6" maxlength="4" value="<%= msgPart.getE01SBMKNU() %>">
      	  </td>
				<TD nowrap></TD>
				<TD nowrap></TD>
			</TR></table>
    </td>
   </tr>
  </table>
  <br>
  
  <p align="center"> 
    <input id="ESBSBTN" type="submit" name="Submit" value="Submit">
  </p>
</form>
</body>
</html>
