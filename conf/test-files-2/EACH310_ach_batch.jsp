<%@ page import = "datapro.eibs.master.Util" %>
<html> 
<head>
<title>ACH Batch Header</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="EACH310Record" class="datapro.eibs.beans.EACH31001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="JavaScript">

function goAction(op) { 
	document.forms[0].SCREEN.value = op;
	if (op == 4) {
		if (!confirm("Do you want to delete this record??")) {
			return;
		}
	}
	document.forms[0].submit();
}

</SCRIPT>  
 

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    String read = "";
	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) read = " readonly ";
%>

<H3 align="center">
ACH Outgoing Batch <% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")) out.print("Mantenance ");
   else if (userPO.getPurpose().equals("APPROVAL")) out.print("Approval ");
	else out.print("Inquiry ");%><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="ach_batch.jsp, EACH310"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.ach.JSEACH310" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  <INPUT TYPE=HIDDEN NAME="TYPE" VALUE="O">

  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
        <tr id="trdark"> 
            <td nowrap width="15%" align="right">  Batch Number: </td>
            <td nowrap width="35%" align="left"> 
                <INPUT type="text" name="E01ACBBTH" size="5"  maxlength="4" value="<%= EACH310Record.getE01ACBBTH().trim()%>"
				<% if (!(userPO.getPurpose().equals("NEW"))) out.print(" readonly"); %>>
				<B><IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" align="bottom"></B>
			</td>
            <td nowrap width="15%" align="right">Description :</td>
			<td nowrap width="35%" align="left">
				<INPUT type="text" name="E01ACBDSC" size="40" value="<%= EACH310Record.getE01ACBDSC().trim()%>" <%= read %>>
				<B><IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" align="bottom"></B>
			</td>
		</tr>
        </table>
      </td>
    </tr>
  </table>

  <h4> Basic Information</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Entry Class  : </td>
            <td nowrap align="left" width="35%">
				<INPUT type="text" name="E01ACBECD" size="5"  maxlength="4" value="<%= EACH310Record.getE01ACBECD().trim()%>" <%= read %>>
				<A href="javascript:GetAchClass('E01ACBECD','E01ECDDSC')">
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0">
				</A> 
		        <B><IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" align="bottom"></B></td>
            <TD nowrap width="15%" align="right">Value Date  : </TD>
			<TD nowrap width="35%" align="left">
		 		<INPUT type="text" name="E01ACBVDM" size="3" maxlength="2" value="<%= EACH310Record.getE01ACBVDM().trim()%>" onkeypress="enterInteger()" <%= read %>>
				<INPUT type="text" name="E01ACBVDD" size="3" maxlength="2" value="<%= EACH310Record.getE01ACBVDD().trim()%>" onkeypress="enterInteger()" <%= read %>>
				<INPUT type="text" name="E01ACBVDY" size="3" maxlength="2" value="<%= EACH310Record.getE01ACBVDY().trim()%>" onkeypress="enterInteger()" <%= read %>>
              <A href="javascript:DatePicker(document.forms[0].E01ACBVDM,document.forms[0].E01ACBVDD,document.forms[0].E01ACBVDY)">
				<IMG src="<%=request.getContextPath()%>/images/calendar.gif" alt="Help" align="middle" border="0">
			  </A><B><IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" align="bottom"></B>
            </TD>
            
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right"></td>
			<td nowrap width="35%" align="left">
				<INPUT type="text" name="E01ECDDSC" size="40" value="<%= EACH310Record.getE01ECDDSC().trim()%>" readonly >
			</td>
            <td nowrap width="15%" align="right">Total Debit : </td>
			<td nowrap width="35%" align="left"><%= EACH310Record.getE01ACBDEB() %></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Number of Entries :  </td>
			<td nowrap width="35%" align="left"><%= EACH310Record.getE01ACBTRN() %></td>
            <td nowrap width="15%" align="right">Total Credit : </td>
			<td nowrap width="35%" align="left"><%= EACH310Record.getE01ACBCRE() %></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Status : </td>
			<td nowrap width="35%" align="left">
				<INPUT type="HIDDEN" name="E01ACBSTS" size="1" value="<%= EACH310Record.getE01ACBSTS().trim()%>">
				<% if (EACH310Record.getE01ACBSTS().equals("P")) out.print("Pending");
			    else if (EACH310Record.getE01ACBSTS().equals("A")) out.print("Approved");
			    else if (EACH310Record.getE01ACBSTS().equals("*")) out.print("Processed"); %>
	 		</td>
            <td nowrap width="15%" align="right">Date : </td>
            <td nowrap height="19">
				<%= Util.formatDateTime("DMY", EACH310Record.getE01ACBRTS())%>
			</td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%" align="right"></td>
			<td nowrap width="35%" align="left"></td>
            <td nowrap width="15%" align="right"></td> 
            <td nowrap width="35%" align="left"></td>
          </tr>
        </table> 
      </td>  
    </tr>
  </table>
  
    <table width="100%">		
<% 
 if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
%>
  	<tr>
  		<td width="33%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type=submit name="Submit" value="Submit" onClick="goAction(5);">
     	  </div>	
  		</td>
  		<td width="33%"> 
  		  <div align="center"> 
     		<input id="EIBSBTN" type=button name="Delete" value="Delete" onClick="goAction(4);"
			<% if (userPO.getPurpose().equals("NEW")) out.print(" disabled"); %>
			>
     	  </div>	
  		</td>
		<td width="34%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type=submit name="Submit" value="Exit" onClick="goAction(1);">
     	  </div>	
  		</td>
  	</tr>	
<%      
  } else {
%>
	<tr>
		<td width="100%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type=submit name="Submit" value="Exit" 
			<% if (userPO.getPurpose().equals("APPROVAL")) out.print("onClick=\"goAction(10)\""); 
			 	else out.print("onClick=\"goAction(11)\""); %>
			>
     	  </div>	
  		</td>
  	</tr>	
<% } %>
  </table>	

  </form>
</body>
</html>
