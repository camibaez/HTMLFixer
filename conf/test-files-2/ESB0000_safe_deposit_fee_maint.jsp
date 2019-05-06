<html>
<head>
<title>Safe Deposit Fee Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import ="datapro.eibs.master.Util" %>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "msgPart" 	class= "datapro.eibs.beans.ESB000001Message"  	scope="session" />
<jsp:useBean id= "error" 	class= "datapro.eibs.beans.ELEERRMessage"  		scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos"  			scope="session"/>

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

<H3 align="center">Safe Deposit Box Fees Maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="safe_deposit_fee_maint, ESB0000"></H3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.safedeposit.JSESB0000">
 
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="500">
  
  <table class="tableinfo">
   <tr> 
   <td>
    <table cellspacing=0 cellpadding=2 width="100%" border="0">    
     	<tr id=trclear> 
	      <td nowrap width="40%"> 
	        <div align="right">Table : </div>
	      </td>
				<td nowrap width="60%" colspan="5">
					<div align="left">
					<input type="text"	name="E01SBFCOD" size="3" maxlength="2"	value="<%= userPO.getHeader1() %>" readonly>
										<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" > 
					</div>
				</td>
			</tr>
     	<tr id=trdark> 
	      <td nowrap> 
	        <div align="right">Description : </div>
	      </td>
				<td nowrap colspan="5">
				<div align="left">
				<input type="text" name="E01SBFDSC" size="35" maxlength="30" value="<%= msgPart.getE01SBFDSC() %>">
					<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" > 
				</div>
				</td>
			</tr>
     	<tr id=trclear>
	      <TD nowrap></TD>
				<td nowrap colspan="5"></td>
			</tr>
     	<tr id=trdark>
	      <TD nowrap>
	      Type</TD>
	      <td nowrap>Fee</td>
	      <TD>Freq.</TD>
	      <TD nowrap>BNK</td>
	      <TD nowrap>CCY</td>
	      <TD nowrap>GL Number</TD>
     	</tr>
     	<tr id=trclear> 
		  <td nowrap valign="bottom"> 
		     <div align="left"><INPUT type="text" name="E01SBFFD1" size="30"
					maxlength="30" value="<%= msgPart.getE01SBFFD1() %>" readonly> </div>        
		  </td>
      	  <td nowrap valign="bottom"><div align="left">
      	    <input type="text" name="E01SBFAM1" size="16" maxlength="15" value="<%= msgPart.getE01SBFAM1() %>">
      	    					<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" > 
      	    </div>
      	  </td>
				<TD nowrap valign="bottom">
				<div align="left">
				<SELECT name="E01SBFFR1">
					<OPTION value="D"
						<%if (msgPart.getE01SBFFR1().equals("D")) { out.print("selected"); }%>>Daily</OPTION>
					<OPTION value="M"
						<%if (msgPart.getE01SBFFR1().equals("M")) { out.print("selected"); }%>>Monthly</OPTION>
					<OPTION value="S"
						<%if (msgPart.getE01SBFFR1().equals("S")) { out.print("selected"); }%>>Semi-Annually</OPTION>
					<OPTION value="Y"
						<%if (msgPart.getE01SBFFR1().equals("Y")) { out.print("selected"); }%>>Annually</OPTION>
					<OPTION value="O"
						<%if (msgPart.getE01SBFFR1().equals("O")) { out.print("selected"); }%>>At Opening</OPTION>
				</SELECT>
				<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" > 
				</div>
				</TD>
      	  <TD nowrap valign="bottom"><input type="text" name="E01SBFBK1" size="3" maxlength="2" value="<%= msgPart.getE01SBFBK1() %>">
      	  	  
      	  </TD>
      	  <TD nowrap valign="bottom"><INPUT type="text" name="E01SBFCY1" size="4"
					maxlength="3" value="<%= msgPart.getE01SBFCY1() %>"></TD>
    		<TD nowrap valign="bottom"> 
    		<div align="left"> 
    			<INPUT type="text" name="E01SBFGL1" size="14"	maxlength="13" value="<%= msgPart.getE01SBFGL1() %>">
    			<a href="javascript:GetLedger('E01SBFGL1',document.forms[0].E01SBFBK1.value,document.forms[0].E01SBFCY1.value,'')">
    			<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a>
    			<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" > 
    		</div>
			</TD>
	
     	</tr>
      	<tr id=trdark>
		  <td nowrap valign="bottom">
				<div align="left"><INPUT type="text" name="E01SBFFD2" size="30"
					maxlength="30" value="<%= msgPart.getE01SBFFD2() %>" readonly></div>
				</td>
      	  <td nowrap valign="bottom"> 
      	    <input type="text" name="E01SBFAM2" size="16" maxlength="15" value="<%= msgPart.getE01SBFAM2() %>">
      	  </td>
				<TD nowrap valign="bottom">
				<div align="left">
				<SELECT name="E01SBFFR2">
					<OPTION value="D"
						<%if (msgPart.getE01SBFFR2().equals("D")) { out.print("selected"); }%>>Daily</OPTION>
					<OPTION value="M"
						<%if (msgPart.getE01SBFFR2().equals("M")) { out.print("selected"); }%>>Monthly</OPTION>
					<OPTION value="S"
						<%if (msgPart.getE01SBFFR2().equals("S")) { out.print("selected"); }%>>Semi-Annually</OPTION>
					<OPTION value="Y"
						<%if (msgPart.getE01SBFFR2().equals("Y")) { out.print("selected"); }%>>Annually</OPTION>
					<OPTION value="O"
						<%if (msgPart.getE01SBFFR2().equals("O")) { out.print("selected"); }%>>At Opening</OPTION>
				</SELECT>
				</div>
				</TD>
      	  <TD nowrap valign="bottom"><input type="text" name="E01SBFBK2" size="3" maxlength="2" value="<%= msgPart.getE01SBFBK2() %>"> 
      	  </TD>
      	  <TD nowrap valign="bottom"><INPUT type="text" name="E01SBFCY2" size="4"
					maxlength="3" value="<%= msgPart.getE01SBFCY2() %>"></TD>
    		<TD nowrap valign="bottom"> 
    		<div align="left"> 
    			<INPUT type="text" name="E01SBFGL2" size="14"	maxlength="13" value="<%= msgPart.getE01SBFGL2() %>">
    			<a href="javascript:GetLedger('E01SBFGL2',document.forms[0].E01SBFBK2.value,document.forms[0].E01SBFCY2.value,'')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a>
    		</div>
			</TD>
      	</tr>
     </table>
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
