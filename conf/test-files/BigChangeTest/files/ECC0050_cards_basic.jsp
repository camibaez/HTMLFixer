<html>
<head>
<title>Debit Card Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<%@ page import = "datapro.eibs.master.Util" %>

<jsp:useBean id= "rtCC" class= "datapro.eibs.beans.ECC004001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

	function goBack() {
     	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC0050?SCREEN=10";
     	window.location = page
	}

</SCRIPT>

</head>

<body bgcolor="#FFFFFF">


<%
	String title = "";
	if (userPO.getOption().trim().equals("CC")) {
		title = "Credit ";
	} else {
		title = "Debit ";
	}
	
 	if ( !error.getERRNUM().equals("0")  ) {
     	out.println("<SCRIPT Language=\"Javascript\">");
	 	error.setERRNUM("0");
     	out.println("       showErrors()");
     	out.println("</SCRIPT>");
 	}
 	if (userPO.getOption().equals("RT") || userPO.getOption().equals("SV")) {
    	out.println("<SCRIPT> initMenu();  </SCRIPT>");
    }
%>

<h3 align="center"><%= title %>Card Activation<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cards_basic, ECC0050" ></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC0050">
<p><INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="13"></p>
	
	<table class="tableinfo">
    	<tr > 
      		<td nowrap> 
        		<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          			<tr id="trdark"> 
            			<td nowrap width="20%" ><div align="right"><b>Customer / Portfolio :</b></div></td>
            			<td nowrap width="20%" > 
              				<div align="left"> 
                				<input type="text" name="E01ACMCUN" size="9" maxlength="9" value="<%= userPO.getCusNum().trim()%>" readonly>
							</div>
            			</td>
            			<td nowrap width="30%" ><div align="right"><b>Name :</b></div></td>
            			<td nowrap width="30%" colspan="3" > 
              				<div align="left"> 
                				<input type="text" name="E01CUSNA1" size="50" maxlength="45" readonly value="<%= userPO.getHeader3().trim()%>" readonly>
              				</div>
            			</td>
          			</tr>
          			<tr id="trdark"> 
			   			<td nowrap width="20%"><div align="right"><b>Account :</b></div></td>
		       			<td nowrap width="20%"> 
		       				<div align="left"> 
		           				<input type="text" name="E01ACMACC" size="12" maxlength="9" value="<%= userPO.getAccNum().trim()%>" readonly>
		       				</div>
		       			</td>
		       			<td nowrap width="30%"><div align="right"><b>Available Amount :</b></div></td>
		       			<td nowrap width="30%"> 
		       				<div align="left">
               					<input type="text" name="E01AVALBL" size="20" maxlength="15" value="<%= Util.formatCCY(userPO.getHeader12()) %>" readonly>
	               				<input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
	               			</div>
	           			</td>
          			</tr>
          			<TR id="trdark">
            			<td nowrap width="20%"><div align="right"><b>Product : </b></div></td>
            			<td nowrap width="20%"> 
              				<div align="left">
                				<input type="text" name="E01ACMPRO" size="4" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>" readonly>
                			</div>
            			</td>
						<TD nowrap width="30%"><div align="right"><b>Officer : </b></div></TD>
						<TD nowrap width="30%">
							<div align="left">
								<INPUT type="text" name="E01CUSCCL" size="15" value='<%= userPO.getOfficer().trim() %>' readonly> 
                     		</div>
						</TD>
					</TR>
        		</table>
      		</td>
    	</tr>
  	</table>
  
  	<h4>Basic Information</h4>
  	<table class="tableinfo">
    	<tr >
      		<td nowrap >
        		<table cellspacing=0 cellpadding=2 width="100%" border="0" >
          			<tr id="trdark">
            			<td nowrap width="20%"><div align="right">Card Product : </div></td>
            			<td nowrap width="30%">
              				<div align="left">
                				<input type="text" name="E01CCMPRO" size="5" maxlength="4" readonly value="<%= rtCC.getE01CCMPRO().trim() %>">
                			</div>
            			</td>
						<TD nowrap width="20%"><div align="right">Card  :</div></TD>
						<TD nowrap width="30%">
							<div align="left">
								<select  name="E01CCMFLG" disabled="disabled">
									<option value="P" <% if (rtCC.getE01CCMFLG().equals("P")) out.print("selected"); %>>PRIMARY</option> 
									<option value="A" <% if (rtCC.getE01CCMFLG().equals("A")) out.print("selected"); %>>ADDITIONAL</option> 
              					</select>
                     		</div>
						</TD>
          			</tr>
        			<tr id="trclear">
            			<td nowrap width="20%"><div align="right">Card Number :</div></td>
            			<td nowrap width="30%">
              				<input type="text" name="E01CCMPCN" size="18" maxlength="16" value="<%= rtCC.getE01CCMPCN().trim()%>" readonly>
            			</td>
            			<td nowrap width="20%"><div align="right">Status :</div></td>
            			<td nowrap width="30%">
              				<select name="E01CCMAST" disabled="disabled">
                				<option value=" " <% if (!(rtCC.getE01CCMAST().equals("0") || rtCC.getE01CCMAST().equals("1")
                										|| rtCC.getE01CCMAST().equals("2") || rtCC.getE01CCMAST().equals("3")
                										|| rtCC.getE01CCMAST().equals("4") || rtCC.getE01CCMAST().equals("5")
                										|| rtCC.getE01CCMAST().equals("6") || rtCC.getE01CCMAST().equals("7")
                										|| rtCC.getE01CCMAST().equals("8") || rtCC.getE01CCMAST().equals("9"))) out.print("selected"); %>></option>
				                <option value="0" <% if (rtCC.getE01CCMAST().equals("0")) out.print("selected"); %>>REQUESTED BY CLIENT</option>
				                <option value="A" <% if (rtCC.getE01CCMAST().equals("A")) out.print("selected"); %>>REQUESTED TO PROVIDER</option>
				                <option value="B" <% if (rtCC.getE01CCMAST().equals("B")) out.print("selected"); %>>PREACTIVATED</option>
				                <option value="C" <% if (rtCC.getE01CCMAST().equals("C")) out.print("selected"); %>>EMBOSSED</option>
				                <option value="D" <% if (rtCC.getE01CCMAST().equals("D")) out.print("selected"); %>>SENT TO PROVIDER</option>
				                <option value="E" <% if (rtCC.getE01CCMAST().equals("E")) out.print("selected"); %>>RECEIVED AT BANK</option>
				                <option value="F" <% if (rtCC.getE01CCMAST().equals("F")) out.print("selected"); %>>SENT TO REGIONAL OFFICE</option>
				                <option value="G" <% if (rtCC.getE01CCMAST().equals("G")) out.print("selected"); %>>SENT TO CLIENT</option>
								<option value="1" <% if (rtCC.getE01CCMAST().equals("1")) out.print("selected"); %>>ACTIVE</option>
				                <option value="2" <% if (rtCC.getE01CCMAST().equals("2")) out.print("selected"); %>>LOST</option>
				                <option value="3" <% if (rtCC.getE01CCMAST().equals("3")) out.print("selected"); %>>BLOCKED PREVENTIVE</option>
				                <option value="H" <% if (rtCC.getE01CCMAST().equals("H")) out.print("selected"); %>>BLOCKED BY CLIENT</option>
				                <option value="I" <% if (rtCC.getE01CCMAST().equals("I")) out.print("selected"); %>>BLOCKED BY BANK</option>
				                <option value="4" <% if (rtCC.getE01CCMAST().equals("4")) out.print("selected"); %>>STOLEN</option>
				                <option value="5" <% if (rtCC.getE01CCMAST().equals("5")) out.print("selected"); %>>EXPIRED</option>
				                <option value="6" <% if (rtCC.getE01CCMAST().equals("6")) out.print("selected"); %>>DESTROYED</option>                
				                <option value="7" <% if (rtCC.getE01CCMAST().equals("7")) out.print("selected"); %>>NULIFIED</option>
				                <option value="8" <% if (rtCC.getE01CCMAST().equals("8")) out.print("selected"); %>>DENIED</option>
              				</select>
            			</td>
          			</tr>
					<tr id="trdark">
            			<td nowrap width="20%"><div align="right">Issue Country :</div></td>
            			<td nowrap width="30%">
              				<input type="text" name="E01CCMICC" size="4" maxlength="3" value="<%= rtCC.getE01CCMICC().trim()%>" readonly>
            			</td>
            			<td nowrap width="20%" ><div align="right">Card Type :</div></td>
            			<td nowrap width="30%" >
							<input type="text" name="E01CCMATY" size="3" maxlength="2" value="<%= rtCC.getE01CCMATY().trim()%>" readonly>
            			</td>
          			</tr>
					<tr id="trclear">
            			<td nowrap width="20%"><div align="right">Issue Date :</div></td>
            			<td nowrap width="30%">
              				<input type="text" name="E01CCMOPM" size="3" maxlength="2" value="<%= rtCC.getE01CCMOPM().trim()%>" onkeypress="enterInteger()" readonly>
			  				<input type="text" name="E01CCMOPD" size="3" maxlength="2" value="<%= rtCC.getE01CCMOPD().trim()%>" onkeypress="enterInteger()" readonly>
			  				<input type="text" name="E01CCMOPY" size="3" maxlength="2" value="<%= rtCC.getE01CCMOPY().trim()%>" onkeypress="enterInteger()" readonly>
            			</td>
            			<td nowrap width="20%"><div align="right">Expiration Date :</div></td>
            			<td nowrap width="30%" >
							<input type="text" name="E01CCMEXM" size="3" maxlength="2" value="<%= rtCC.getE01CCMEXM().trim()%>" onkeypress="enterInteger()" readonly>
							<input type="text" name="E01CCMEXD" size="3" maxlength="2" value="<%= rtCC.getE01CCMEXD().trim()%>" onkeypress="enterInteger()" readonly>
							<input type="text" name="E01CCMEXY" size="3" maxlength="2" value="<%= rtCC.getE01CCMEXY().trim()%>" onkeypress="enterInteger()" readonly>
            			</td>
          			</tr>
           			<tr id="trdark">
            			<td nowrap width="20%"><div align="right">Customer Number :</div></td>
            			<td nowrap width="30%" >
              				<div align="left">
                				<input type="text" name="E01CCMCUN" size="9" maxlength="9" value="<%= rtCC.getE01CCMCUN().trim()%>" readonly>
			  				</div>
            			</td>
            			<td nowrap width="20%"><div align="right">Contact eMail :</div></td>
           				<td nowrap width="30%" >
							<input type="text" name="E01CCMMAI" size="45" maxlength="40" value="<%= rtCC.getE01CCMMAI().trim()%>" readonly>
            			</td>
          			</tr>
           			<tr id="trclear">
            			<td nowrap width="20%"><div align="right">Customer First Name :</div></td>
            			<td nowrap width="30%">
              				<input type="text" name="E01CCMFNA" size="21" maxlength="20" value="<%= rtCC.getE01CCMFNA().trim()%>" readonly>
            			</td>
            			<td nowrap width="20%"><div align="right">Customer Last Name :</div></td>
            			<td nowrap width="30%" >
							<input type="text" name="E01CCMLN1" size="21" maxlength="20" value="<%= rtCC.getE01CCMLN1().trim()%>" readonly>
            			</td>
          			</tr>
          			<tr id="trdark">
            			<td nowrap width="20%"><div align="right">Second Line Embossing :</div></td>
            			<td nowrap width="30%">
              				<input type="text" name="E01CCMCNM" size="28" maxlength="26" value="<%= rtCC.getE01CCMCNM().trim()%>" readonly>
            			</td>
            			<td nowrap width="20%"><div align="right">Home Telephone Number :</div></td>
            			<td nowrap width="30%">
              				<input type="text" name="E01CCMHPN" size="12" maxlength="11" value="<%= rtCC.getE01CCMHPN().trim()%>" readonly>
            			</td>
          			</tr>
           			<tr id="trclear">
            			<td nowrap width="20%"><div align="right">Cellular Number :</div></td>
            			<td nowrap width="30%">
              				<input type="text" name="E01CCMHPA" size="12" maxlength="11" value="<%= rtCC.getE01CCMHPA().trim()%>" readonly>
            			</td>
            			<td nowrap width="20%"><div align="right">Business Telephone Number :</div></td>
            			<td nowrap width="25%" >
							<input type="text" name="E01CCMPHN" size="12" maxlength="11" value="<%= rtCC.getE01CCMPHN().trim()%>" readonly>
            			</td>
          			</tr>
        		</table>
      		</td>
    	</tr>
  	</table>
  	
<br>

<table width="100%">
	<tr>
		<td width="50%"><div align="center"><input id="EIBSBTN" type=submit name="Submit" value="Submit"></div></td>
		<td width="50%"><div align="center"><input id="EIBSBTN" type=button name="Cancel" value="Cancel" onclick="goBack()"></div></td>
	</tr>	
</table>


</form>
</body>
</html>

