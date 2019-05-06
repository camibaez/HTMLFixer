<%@ page import = "datapro.eibs.master.Util" %>
<html> 
<head>
<title>ACH Batch Header</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="EACH315Record" class="datapro.eibs.beans.EACH31501Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="JavaScript">

function goAction(op) { 
	document.forms[0].SCREEN.value = op;
	if (op == 4) {
		if (!confirm("Desea borrar este registro?")) {
			return;
		}
	}
	document.forms[0].submit();
}

function showOfac(fieldValue){
	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0092?shrAcc=" + fieldValue + "&shrCategory=ALL" + "&FromRecord=0&shrAction=INQ";
	CenterWindow(page,600,500,2);
 }

</SCRIPT>  
 

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
	boolean display=userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE");
    String read = "";
	if (!display) read = " readonly ";
%>


<H3 align="center">Transaction <%= EACH315Record.getE01ACUNUM().trim()%>   with ACH batch number <%= userPO.getIdentifier().trim() %>
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ach_batch_detail.jsp, EACH315"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.ach.JSEACH315" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  <INPUT TYPE=HIDDEN NAME="E01ACUBTH" VALUE="<%= userPO.getIdentifier().trim()%>">
  <INPUT TYPE=HIDDEN NAME="BATCH" VALUE="<%= userPO.getIdentifier().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01ACUNUM" VALUE="<%= EACH315Record.getE01ACUNUM().trim()%>">
  <INPUT TYPE=HIDDEN NAME="TYPE" VALUE="O">
  <INPUT TYPE=HIDDEN NAME="OPEDSC" VALUE="">
  
  <%int row = 1; %>
  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
        <tr id="trdark"> 
            <td nowrap width="15%" align="right">Entry Class : </td>
            <td nowrap width="35%" align="left"> 
                <INPUT type="text" name="E01ACUECD" size="4"  value="<%= EACH315Record.getE01ACUECD().trim()%>" readonly> 
				<INPUT type="text" name="E01ECDDSC" size="40" value="<%= EACH315Record.getE01ECDDSC().trim()%>" readonly>
			</td>
            <TD nowrap width="15%" align="right">Value Date : </TD><TD nowrap width="35%" align="left">
		 		<INPUT type="text" name="E01ACUVDM" size="3" value="<%= EACH315Record.getE01ACUVDM().trim()%>" readonly>
				<INPUT type="text" name="E01ACUVDD" size="3" value="<%= EACH315Record.getE01ACUVDD().trim()%>" readonly>
				<INPUT type="text" name="E01ACUVDY" size="3" value="<%= EACH315Record.getE01ACUVDY().trim()%>" readonly>
            </TD>
			
		</tr>
        </table>
      </td>
    </tr>
  </table>

  <h4>Transaction Information </h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <TD nowrap width="15%" align="right">ACH Transaction : </TD>
			<TD nowrap width="35%" align="left">
				<INPUT type="text" name="E01ACUCDE" size="3"  maxlength="2" value="<%= EACH315Record.getE01ACUCDE().trim()%> <%= read %>">
				<A href="javascript:GetAchTransaction('E01ACUCDE','E01CDEDSC')"> 
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Help" align="bottom" border="0">
				</A><IMG src="<%=request.getContextPath()%>/images/Check.gif" title="Mandatoy Field" align="bottom">
				<INPUT type="text" name="E01CDEDSC" value="<%= EACH315Record.getE01CDEDSC().trim()%>" size="35" readonly>
			</TD>
				<TD nowrap width="15%" align="right">Amount : </TD>
				<TD nowrap width="35%" align="left">
					<INPUT type="text" name="E01ACUAMT" size="16" maxlength="15" value="<%= EACH315Record.getE01ACUAMT().trim()%>" onkeypress="enterDecimal()" <%= read %>> 	
				 	<INPUT type="text" name="E01ACUCCY" size="4" maxlength="3" value="<%= EACH315Record.getE01ACUCCY().trim()%>" readonly>
				 	<A href="javascript:GetCurrency('E01ACUCCY',document.forms[0].E01ACUBNK.value)">
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Help" align="bottom" border="0"> 	
				</TD>
          </tr>
		  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
			<TD nowrap width="15%" align="right">Routing : </TD>
			<TD nowrap align="left" width="35%">
				<INPUT type="text" name="E01ACUROU" size="15" maxlength="10" value="<%= EACH315Record.getE01ACUROU().trim()%> <%= read %>">
				<A href="javascript:GetAchOperator('E01ACUROU','TYPE','OPEDSC','D')">
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Help" border="0" align="top">
				</A>
			</TD>
				<TD nowrap width="15%" align="right">Reference : </TD>
				<TD nowrap width="35%" align="left">
					<INPUT type="text" name="E01ACUIDN" size="20" maxlength="15" value="<%= EACH315Record.getE01ACUIDN().trim()%>" <%= read %>> 
				</TD>
			</TR>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="15%" align="right"> Addenda : </td>
			<td nowrap width="35%" align="left">
				<INPUT type="text" name="E01ACUADD" size="40" maxlength="80" value="<%= EACH315Record.getE01ACUADD().trim()%>" <%= read %>> 
			</td>
            <td nowrap width="15%" align="right">Commissions Table : </td>
			<td nowrap width="35%" align="left">
				<INPUT type="text" name="E01ACUCTP" size="5" maxlength="3" value="<%= EACH315Record.getE01ACUCTP().trim()%>" <%= read %>>
				<a href="javascript:GetCNTRLPRF('E01ACUCTP','','AC')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="middle" border="0"></a>
			</td>
          </tr>
        </table> 
      </td>  
    </tr>
  </table>


  <h4>Parties Information </h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
        <%row=1;%>
      	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap colspan="2" align="center"> 
                <b>Ordering</b>&nbsp;
				<select id="E01ACRTYR" name="E01ACRTYR" <%=display ? "" : "disabled" %>>
                   	<option value="1" <% if (!(EACH315Record.getE01ACRTYR().equals("2"))) out.print("selected"); %>>Person</option>
                	<option value="2" <% if(EACH315Record.getE01ACRTYR().equals("2")) out.print("selected");%>>Corporation</option>
				</select>
            </td>
            <td nowrap colspan="2" align="center">  
                <b>Beneficiary</b>&nbsp;
				<select id="E01ACRTYB" name="E01ACRTYB" <%=display ? "" : "disabled" %>>
                   	<option value="1" <% if (!(EACH315Record.getE01ACRTYB().equals("2"))) out.print("selected"); %>>Person</option>
                	<option value="2" <% if(EACH315Record.getE01ACRTYB().equals("2")) out.print("selected");%>>Corporation</option>
				</select>
            </td>
		</tr>
		
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="15%" align="right">IBS Account: </td>
            <td nowrap align="left" width="35%">
            	<INPUT type="text" name="E01ACUBNK" size="5"  maxlength="2" value="<%= EACH315Record.getE01ACUBNK().trim()%>" <%= read %>>
            	<INPUT type="text" name="E01ACUBRN" size="5"  maxlength="3" value="<%= EACH315Record.getE01ACUBRN().trim()%>" <%= read %>>
            	<A href="javascript:GetBranch('E01ACUBRN',document.forms[0].E01ACUBNK.value)">
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Help" align="bottom" border="0">
				</A>
				<INPUT type="text" name="E01ACUACC" size="15"  maxlength="12" value="<%= EACH315Record.getE01ACUACC().trim()%>" <%= read %>>
				<A href="javascript:GetAccount('E01ACUACC','','RT','')">
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Help" align="bottom" border="0">
				</A>
				<A href="javascript:GetLedger('E01ACUACC',document.forms[0].E01ACUBNK.value,document.forms[0].E01ACUCCY.value,'')">
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Help" align="bottom" border="0">
				</A>
				<IMG src="<%=request.getContextPath()%>/images/Check.gif" title="Mandatory Field" align="bottom">
			</td>
			<TD nowrap width="15%" align="right">Account : </TD>
			<TD nowrap width="35%" align="left">
				<INPUT type="text" name="E01ACUDAC" size="21" maxlength="20" value="<%= EACH315Record.getE01ACUDAC().trim()%>" <%= read %>> 
				<SELECT name="E01ACUACT">
					<OPTION <%= EACH315Record.getE01ACUACT().trim().equals("C")?"Selected":"" %> value="C">Checks</OPTION>
					<OPTION <%= EACH315Record.getE01ACUACT().trim().equals("S")?"Selected":"" %> value="S">Saving</OPTION>
					<OPTION <%= EACH315Record.getE01ACUACT().trim().equals("L")?"Selected":"" %> value="L">Loans</OPTION>
					<OPTION <%= EACH315Record.getE01ACUACT().trim().equals("R")?"Selected":"" %> value="R">Credit Card</OPTION>
				</SELECT> 
			</TD>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
          	<td nowrap width="15%" align="right">Name: </td>
          	<td align="left">
          		<INPUT type="text" name="E01CUNDSC" value="<%= EACH315Record.getE01CUNDSC().trim()%>" size="35" readonly>
          	</td>
            <td nowrap width="15%" align="right">Name : </td>
			<td nowrap width="35%" align="left">
				<INPUT type="text" name="E01ACUNME" size="46" maxlength="45" value="<%= EACH315Record.getE01ACUNME().trim()%>" <%= read %>> 
				<% if (EACH315Record.getH01FLGWK3().trim().equals("3")) { %>
					<IMG border="0" src="<%=request.getContextPath()%>/images/warning_16.jpg" title="OFAC Match List" onClick="showOfac('<%= EACH315Record.getE01ACUNUM()%>')">
				<% } %>
			</td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="15%" align="right">
			</td>
			<td nowrap width="35%" align="left">
			</td>          
            <td nowrap width="15%" align="right">Address :  </td>
			<td nowrap width="35%" align="left">
				<INPUT type="text" name="E01ACUADR" size="46" maxlength="45" value="<%= EACH315Record.getE01ACUADR().trim()%>" <%= read %>> 
			</td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="15%" align="right">
			</td>
			<td nowrap width="35%" align="left">
			</td>
            <td nowrap width="15%" align="right">City : </td>
			<td nowrap width="35%" align="left">
				<INPUT type="text" name="E01ACUCSZ" size="46" maxlength="45" value="<%= EACH315Record.getE01ACUCSZ().trim()%>" <%= read %>> 
			</td>
            <td nowrap width="15%" align="right"></td>
			<td nowrap width="35%" align="left">
			</td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="15%" align="right">
			</td>
			<td nowrap width="35%" align="left">
			</td>
            <td nowrap width="15%" align="right">Country : </td>
			<td nowrap width="35%" align="left">
				<INPUT type="text" name="E01ACRCTR" size="5" maxlength="3" value="<%= EACH315Record.getE01ACRCTR().trim()%>" <%= read %>>
				<a href="javascript:GetCodeCNOFC('E01ACRCTR','03')">
              	<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="top" border="0"></a>
				<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0">
			</td>
            <td nowrap width="15%" align="right"></td>
			<td nowrap width="35%" align="left">
			</td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="15%" align="right">
			</td>
			<td nowrap width="35%" align="left">
			</td>
            <td nowrap width="15%" align="right">State : </td>
			<td nowrap width="35%" align="left">
				<INPUT type="text" name="E01ACRSTE" size="5" maxlength="3" value="<%= EACH315Record.getE01ACRSTE().trim()%>" <%= read %>>
                <a href="javascript:GetCodeCNOFC('E01ACRSTE','27')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
			</td>
            <td nowrap width="15%" align="right"></td> 
            <td nowrap width="35%" align="left"></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="15%" align="right">
			</td>
			<td nowrap width="35%" align="left">
			</td>
            <td nowrap width="15%" align="right">Zip code: </td>
			<td nowrap width="35%" align="left">
				<INPUT type="text" name="E01ACRZPC" size="12" maxlength="10" value="<%= EACH315Record.getE01ACRZPC().trim()%>" <%= read %>></td>
            <td nowrap width="15%" align="right"></td> 
            <td nowrap width="35%" align="left"></td>
          </tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="15%" align="right">
			</td>
			<td nowrap width="35%" align="left">
			</td>
            <td nowrap width="15%" align="right">Mail Address : </td>
			<td nowrap width="35%" align="left">
				<INPUT type="text" name="E01ACUEMA" size="61" maxlength="60" value="<%= EACH315Record.getE01ACUEMA().trim()%>" <%= read %>> 
			</td>
			</tr>
        </table> 
      </td>  
    </tr>
  </table>
  
  <table width="100%">		
<% 
 if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
	if (EACH315Record.getH01FLGWK2().trim().equals("W") || EACH315Record.getH01FLGWK2().trim().equals("A") ){%>
	<tr>
		<td width="100%" align="center" colspan="3">
			<input type="checkbox" name="H01FLGWK2" value="A" <% if (EACH315Record.getH01FLGWK2().trim().equals("A")) out.print(" checked"); %>>
			Accept with Warnings
		</td>
	</tr>
	<% } %>
  	<tr>
  		<td width="33%" align="center">
  			<input id="EIBSBTN" type=submit name="Submit" value="Submit" onClick="goAction(5);">
     	 </td>
  		<td width="33%" align="center"> 
     		<input id="EIBSBTN" type=button name="Delete" value="Delete" onClick="goAction(4);"
			<% if (userPO.getPurpose().equals("NEW")) out.print(" disabled"); %>>
  		</td>
  		<td width="34%" align="center">
     		<input id="EIBSBTN" type=submit name="Submit" value="Exit" onClick="goAction(1);">
  		</td>
  	</tr>	
<% } else { %>
  	<tr>
  		<td width="100%" align="center">
     		<input id="EIBSBTN" type=submit name="Submit" value="Exit" onClick="goAction(1);">
  		</td>
  	</tr>	

<% } %>
  </table>	

  </form>
</body>
</html>
