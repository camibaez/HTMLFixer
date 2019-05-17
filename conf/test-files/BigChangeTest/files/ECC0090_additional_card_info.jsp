<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Asignaci�n de Tarjetas de D�bito</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "msgCD" class= "datapro.eibs.beans.ECC009003Message"  scope="session" />
<jsp:useBean id= "accList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="JavaScript">
<!--
function goAction() {
	document.getElementById("SCREEN").value = 400;
	document.forms[0].submit();
}
//-->
</script>

</head>
<body>
<h3 align="center">Debit Card Assignment<BR>Additional Card Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="additional_card_info.jsp, ECC0090"></h3>
<hr size="4">
<% 
if (!error.getERRNUM().equals("0")) {
	error.setERRNUM("0");
    out.println("<SCRIPT Language=\"Javascript\">");
    out.println("       showErrors()");
    out.println("</SCRIPT>");
}
%>
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC0090">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E04TARTYP" VALUE="<%= msgCD.getE03TARTYPA().trim()%>">
  <INPUT TYPE=HIDDEN NAME="special" VALUE="">

  <h4> Main Customer Information</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><B>Customer ID  :</B></div>
            </td>
            <td nowrap width="16%"> 
              	<input type="text" name="E03CCRCID" size="16" maxlength="15" value="<%= msgCD.getE03CCRCID().trim()%>" readonly>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Customer Name :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E03PRINA1" size="36" maxlength="35" value="<%= msgCD.getE03PRINA1().trim()%>" readonly>
              </div>
            </td>
          </tr>    
          <tr id="trclear"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Customer Number  :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E03PRICUN" size="10" maxlength="10" value="<%= msgCD.getE03PRICUN().trim()%>" readonly>
			  </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Customer Type :</b></div>
            </td>
            <td nowrap colspan="3"> 
              <div align="left"> 
                <input type="text" name="E03CCRTYP" size="5" maxlength="4" value="<%= msgCD.getE03CCRTYP().trim()%>" readonly>
              </div>
            </td>
          </tr>            
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><B>Primary    Card :</B></div>
            </td>
            <td nowrap width="16%">
              <div align="left"> 
            	<INPUT type="text" name="E03CCRNUM" size="21" maxlength="20" value="<%= msgCD.getE03CCRNUM().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"></td>
            <td nowrap width="20%"></td>
          </tr>    
        </table>
      </td>
    </tr>
  </table>
  <h4> Additional Customer Information</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><B>Custmer ID  :</B></div>
            </td>
            <td nowrap width="16%"> 
              	<input type="text" name="E03CCRCIDA" size="16" maxlength="15" value="<%= msgCD.getE03CCRCIDA().trim()%>" readonly>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Customer Name :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E03PRINA1A" size="36" maxlength="35" value="<%= msgCD.getE03PRINA1A().trim()%>" readonly>
              </div>
            </td>
          </tr>    
          <tr id="trclear"> 
            <td nowrap width="16%" > 
              <div align="right"><b>  Customer Number :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E03PRICUNA" size="10" maxlength="10" value="<%= msgCD.getE03PRICUNA().trim()%>" readonly>
			  </div>
            </td>
            <td nowrap width="16%" ></td>
            <td nowrap colspan="3"></td>
          </tr>            
        </table>
      </td>
    </tr>
  </table>
  <h4> Additional Card Information</h4>
<TABLE class="tableinfo">
	<TBODY>
		<TR>
			<TD nowrap>
			<TABLE cellspacing="0" cellpadding="2" width="100%" border="0"
				class="tbhead">
				<TBODY>
					<TR id="trdark">
						<TD nowrap width="16%">
							<DIV align="right"><B>Card   Number:</B></DIV>
						</TD>
						<TD nowrap width="20%">
							<DIV align="left">
								<INPUT type="text" name="E04CCRNUMA" size="21" maxlength="20" value="<%= msgCD.getE03CCRNUMA().trim()%>" readonly>
						        <a href="javascript:GetPlastic3('E02CCRNUM', '', '', '', '')"></a>     
							</DIV>
						</TD>
						<% if (!accList.getNoResult()) { %>
						<TD nowrap width="16%">
							<DIV align="right"><B>Delivery   Branch:</B></DIV>
						</TD>
						<TD nowrap width="16%">
							<DIV align="left">
								<INPUT type="text" name="E04CCRBRN" size="5" maxlength="4" value="<%= userPO.getHeader3().trim()%>" readonly>
							</DIV>
						</TD>
						<% } %>
					</TR>
					<% if (!accList.getNoResult()) { %>
					<TR id="trclear">
						<TD nowrap width="16%">
							<DIV align="right"><B>Status :</B></DIV>
						</TD>
						<TD nowrap width="20%">
							<DIV align="left">
								<INPUT type="text" name="E04CCRSTS" size="3" maxlength="2" value="<%= userPO.getHeader4().trim()%>" readonly>
								<INPUT type="text" name="E04CCRDSC" size="16" maxlength="15" value="<%= userPO.getHeader5().trim()%>" readonly>
							</DIV>
						</TD>
						<TD nowrap width="16%">
							<DIV align="right"><B>  Assignment Date:</B></DIV>
						</TD>
						<TD nowrap colspan="3">
							<DIV align="left">
								<INPUT type="text" name="E04CCRASD" size="3" maxlength="2" value="<%= userPO.getHeader6().trim()%>" readonly>
								<INPUT type="text" name="E04CCRASM" size="3" maxlength="2" value="<%= userPO.getHeader7().trim()%>" readonly>
								<INPUT type="text" name="E04CCRASY" size="5" maxlength="4" value="<%= userPO.getHeader8().trim()%>" readonly>
							</DIV>
						</TD>
					</TR>
					<% } %>
				</TBODY>
			</TABLE>
			</TD>
		</TR>
	</TBODY>
</TABLE>
<h4>Related Accounts (Main Customer)</h4>
<%
	if ( accList.getNoResult() ) {
%>
	<TABLE class="tbenter" width=100% height=25%>
	<TR>
      <TD> 
	      <div align="center"> <font size="3"><b>Customer don't have related accounts</b></font></div>
      </TD>
     </TR>
   	</TABLE>
<%
	} else {
%>
  <table class="tableinfo">
    <tr>
      <td rowspan="2" align="center">
  		<INPUT TYPE=HIDDEN NAME="E04CCRCRA" ID="E04CCRCRA" VALUE="">
  		<INPUT TYPE=HIDDEN NAME="E04CCRAPC" ID="E04CCRAPC" VALUE="">
  		<INPUT TYPE=HIDDEN NAME="E04CCRTYP" ID="E04CCRTYP" VALUE="">
  		<INPUT TYPE=HIDDEN NAME="E04CCRSTP" ID="E04CCRSTP" VALUE=""><B> Accounts List</B><BR>
      <SELECT size="10" name="AccList" id="AccList" onClick="document.forms[0].AccList.multiple = false" onBlur="document.forms[0].AccList.multiple = true">
   	  <%
   	  	int aux1 = 0;
		int rt = 0;
		int sv = 0;
		int fal = 0;
      	accList.initRow();               
      	while (accList.getNextRow()) {
      		ECC009004Message msgAcc = (ECC009004Message) accList.getRecord();
        	if (msgAcc.getE04CCRAPC().equals("01") ||
        		msgAcc.getE04CCRAPC().equals("02") ||
        		msgAcc.getE04CCRAPC().equals("03")) {
        		rt++;
        	}
        	if (msgAcc.getE04CCRAPC().equals("04")) {
        		sv++;
        	}
        	if (msgAcc.getE04CCRTYP().equals("CFAL")) {
        		fal++;
        	}
      %>
		<% if (msgAcc.getE04CCRASG().equals("")) { %>
		<OPTION value="<%= msgAcc.getE04CCRCRA() %>-<%= msgAcc.getE04CCRAPC()%>-<%= msgAcc.getE04CCRTYP()%>-<%= msgAcc.getE04CCRSTP()%>" label="<%= msgAcc.getE04CCRCRA() %> (<%= msgAcc.getE04CCRTYP() %>/<%= msgAcc.getE04CCRSTP() %>)"><%= msgAcc.getE04CCRCRA() %> (<%= msgAcc.getE04CCRTYP() %>/<%= msgAcc.getE04CCRSTP() %>)</OPTION>
	  	<%
	  		aux1++;
	  	} %>
	  <% } %>
	  <% if (aux1 == 0) { %>
		<OPTION value="X">There are not unassigned accounts</OPTION>
	  <% } %>
	  </SELECT>
	  </td>
	<td>
      	<table width="100%" border="1" cellspacing="0" bordercolor="#0b23b5">
    		<tr>
    		  <td nowrap> 
       			  <table width="100%" border="0" cellpadding="2" cellspacing="0" class="tbhead">
		           	  <%
						int accmain = 0;
						String ccpapcode = "";
						String capapcode = "";
						String cfpapcode = "";
						String ccp = "";
						String cap = "";
						String cfp = "";
						String ccptype = "";
						String captype = "";
						String cfptype = "";
						String ccpsubtype = "";
						String capsubtype = "";
						String cfpsubtype = "";
						accList.initRow();               
						while (accList.getNextRow()) {
						ECC009004Message msgAcc = (ECC009004Message) accList.getRecord();
						    if (msgAcc.getE04CCRASG().equals("P")) {
						        if (msgAcc.getE04CCRAPC().equals("01") ||
						        	msgAcc.getE04CCRAPC().equals("02") ||
						        	msgAcc.getE04CCRAPC().equals("03")) {
						        	ccpapcode = msgAcc.getE04CCRAPC().trim();
						        	ccp = msgAcc.getE04CCRCRA().trim();
						        	ccptype = msgAcc.getE04CCRTYP().trim();
						        	ccpsubtype = msgAcc.getE04CCRSTP().trim();
						        	if (msgAcc.getE04CCRPRI().equals("*"))
						        		accmain = 1;
						        }
				        		if (msgAcc.getE04CCRAPC().equals("04")) {
						        	capapcode = msgAcc.getE04CCRAPC().trim();
						        	cap = msgAcc.getE04CCRCRA().trim();
						        	captype = msgAcc.getE04CCRTYP().trim();
						        	capsubtype = msgAcc.getE04CCRSTP().trim();
						        	if (msgAcc.getE04CCRPRI().equals("*"))
				        				accmain = 2;
				        		}
				        		if (msgAcc.getE04CCRTYP().equals("CFAL")) {
						        	cfpapcode = msgAcc.getE04CCRAPC().trim();
						        	cfp = msgAcc.getE04CCRCRA().trim();
						        	cfptype = msgAcc.getE04CCRTYP().trim();
						        	cfpsubtype = msgAcc.getE04CCRSTP().trim();
						        	if (msgAcc.getE04CCRPRI().equals("*"))
				        				accmain = 3;
				        		}
				        	}
				        }
				        %>
		      		  <tr id="trdark">
		        		  <th colspan="2">Primary Accounts</th>
						<TH>Default</TH>
					</tr>
		      		  <tr id="trclear">
		        		<td nowrap align="right">
		          			<div align="right"><B>Checking   :</B></div>
		          		</td>
		        		<td nowrap>
		          			<input type="hidden" name="CCP_Apcode" value="<%= ccpapcode%>">
		          			<input type="text" name="CCP" size="21" maxlength="20" value="<%= ccp%>" readonly>
		          			<input type="text" name="CCP_Type" size="5" maxlength="4" value="<%= ccptype%>" readonly>
		        			<input type="text" name="CCP_Subtype" size="5" maxlength="4" value="<%= ccpsubtype%>" readonly>
		        		</td>
						<TD nowrap align="left">
							<INPUT type="radio" name="CC_Main" value="<%= ccp%>" <% if (accmain == 1) { %> checked <% } %> disabled>
		          			<% if (accmain == 1) {%>
		          			<img src="<%=request.getContextPath()%>/images/cone.gif" alt="main" align="absbottom" border="0">
		          			<%}%>
						</TD>
					</tr>
		      		  <tr id="trdark">
		        		<td nowrap align="right">
		          			<div align="right"><B>Saving    :</B></div>
		          		</td>
		        		<td nowrap>
		          			<input type="hidden" name="CAP_Apcode" value="<%= capapcode%>">
		          			<input type="text" name="CAP" size="21" maxlength="20" value="<%= cap%>" readonly>
		          			<input type="text" name="CAP_Type" size="5" maxlength="4" value="<%= captype%>" readonly>
		        			<input type="text" name="CAP_Subtype" size="5" maxlength="4" value="<%= capsubtype%>" readonly>
		        		</td>
						<TD nowrap align="left">
							<INPUT type="radio" name="CC_Main" value="<%= cap%>" <% if (accmain == 2) { %> checked <% } %> disabled>
	          			    <% if (accmain == 2) {%>
	          			    <img src="<%=request.getContextPath()%>/images/cone.gif" alt="main" align="absbottom" border="0">
	          			    <%}%>
						</TD>
					</tr>
		      		  <tr id="trclear">
		        		<td nowrap align="right">
						<div align="right"><B> F.A.L.  :</B></div>
						</td>
		        		<td nowrap>
		          			<input type="hidden" name="CFP_Apcode" value="<%= cfpapcode%>">
		          			<input type="text" name="CFP" size="21" maxlength="20" value="<%= cfp%>" readonly>
		          			<input type="text" name="CFP_Type" size="5" maxlength="4" value="<%= cfptype%>" readonly>
		        			<input type="text" name="CFP_Subtype" size="5" maxlength="4" value="<%= cfpsubtype%>" readonly>
		        		</td>
						<TD nowrap align="left">  
							<INPUT type="radio" name="CC_Main" value="<%= cfp%>" <% if (accmain == 3) { %> checked <% } %> disabled>
	          			    <% if (accmain == 3) {%>
	          			    <img src="<%=request.getContextPath()%>/images/cone.gif" alt="main" align="absbottom" border="0">
	          			    <%}%>
					  		<INPUT TYPE=HIDDEN NAME="CCORS" ID="CCORS" VALUE="<% if (rt >= 2) { %>X<% } %><% if (rt <= 0) { %>O<% } %>">
					  		<INPUT TYPE=HIDDEN NAME="CAHOS" ID="CAHOS" VALUE="<% if (sv >= 2) { %>X<% } %><% if (sv <= 0) { %>O<% } %>">
					  		<INPUT TYPE=HIDDEN NAME="CFALS" ID="CFALS" VALUE="<% if (fal >= 2) { %>X<% } %><% if (fal <= 0) { %>O<% } %>">  		
						</TD>
					</tr>
	      	    </table>
	      	  </td>
			</tr>
      	</table>
      </td>
    </tr>
    <tr>
      <td align="center">      
      	<B>Secondary Accounts</B><BR>
		<SELECT size="5" name="AccSList" id="AccSList" onClick="document.forms[0].AccSList.multiple = false" onBlur="document.forms[0].AccSList.multiple = true">
			<%
			int aux2 = 0;
      		accList.initRow();               
      		while (accList.getNextRow()) {
      			ECC009004Message msgAcc = (ECC009004Message) accList.getRecord();
      		%>
				<% if (msgAcc.getE04CCRASG().equals("S")) { %>
				<OPTION value="<%= msgAcc.getE04CCRCRA() %>-<%= msgAcc.getE04CCRAPC()%>-<%= msgAcc.getE04CCRTYP()%>-<%= msgAcc.getE04CCRSTP()%>" label="<%= msgAcc.getE04CCRCRA() %> (<%= msgAcc.getE04CCRTYP() %>/<%= msgAcc.getE04CCRSTP() %>)"><%= msgAcc.getE04CCRCRA() %> (<%= msgAcc.getE04CCRTYP() %>/<%= msgAcc.getE04CCRSTP() %>)</OPTION>
				<% 
					aux2++;
				} %>
			<% } %>
			<% if (aux2 == 0) { %>
				<OPTION value="X">There are not assigned accounts</OPTION>
			<% } %>
		</SELECT>
	  </td>
    </tr>
  </table>
  <%      
  }
%>

<br>
  <div align="center"> 
	   <INPUT type="button" name="EIBSBTN" id="EIBSBTN" value="Submit" onclick="javascript:goAction()">
  </div>
</form>
</body>
</html>
