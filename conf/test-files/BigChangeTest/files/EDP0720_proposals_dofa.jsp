<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>
Análisis DOFA
</TITLE>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/etyle.css" rel="stylesheet">

<jsp:useBean id="msgL0724" class="datapro.eibs.beans.EDP072401Message"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

</HEAD>


<script language="JavaScript">
function init()
{
 // texto comentarios 
 if (document.forms[0].E01DPAM21 != null) {
	document.forms[0].E01DPAM21.value = "<%=msgL0724.getE01DPAM21().trim()%>";
 }
 if (document.forms[0].E01DPAM22 != null) {
	document.forms[0].E01DPAM22.value = "<%=msgL0724.getE01DPAM22().trim()%>";
 }
 if (document.forms[0].E01DPAM23 != null) {
	document.forms[0].E01DPAM23.value = "<%=msgL0724.getE01DPAM23().trim()%>";
 }
 if (document.forms[0].E01DPAM24 != null) {
	document.forms[0].E01DPAM24.value = "<%=msgL0724.getE01DPAM24().trim()%>";
 }
 if (document.forms[0].E01DPAM25 != null) {
	document.forms[0].E01DPAM25.value = "<%=msgL0724.getE01DPAM25().trim()%>";
 }
 if (document.forms[0].E01DPAM26 != null) {
	document.forms[0].E01DPAM26.value = "<%=msgL0724.getE01DPAM26().trim()%>";
 }
 if (document.forms[0].E01DPAM27 != null) {
	document.forms[0].E01DPAM27.value = "<%=msgL0724.getE01DPAM27().trim()%>";
 }
}

function limitText(limitField, limitNum) {

	if (limitField.value.length > limitNum + 1) { 
		if (document.forms[0].LAN.value == 'S') {
			alert('Límite de texto excedido');
		} else {
			alert('Your input has been truncated');
		}	
	}	
	if (limitField.value.length > limitNum) {
		limitField.value = limitField.value.substring(0, limitNum);
	}
}


function goConfirm() {

      ok = confirm("Confirm create/modify this record");
      
	  if (ok) 
     {
		document.forms[0].SCREEN.value="810";
		document.forms[0].submit();

       }  
}

function closeit() {
	close();
}

</script>
<body onload=javascript:init() onunload="closeit()">
		<% if(msgL0724.getE01DPATIP().trim().equals("1")){; %>

<h3 align="center">Analisys DOFA - Qualitative Aspects</h3>
		<% } else {;%>
<h3 align="center">Financial Analisis - Cualitative Aspects</h3>
		<% }%>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.creditproposal.JSEDP0720">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="810">
<INPUT TYPE=HIDDEN NAME="ROW" VALUE="">
<INPUT TYPE=HIDDEN NAME="opt" VALUE="<%= msgL0724.getE01DPATIP().trim()%>">
<table class="tableinfo">    
 <TR > 
  <TD NOWRAP >
   <TABLE id="headTable" width="100%" cellpading=0 cellspacing=0>
    <tr id="trdark"> 
      <td align="right"  >
         <b>Customer :</b>
      </td>
      <td nowrap > 
         <input type="text" name="Header1" size="12" readonly value="<%= userPO.getCusNum()%>">
      </td>
      <td align="right"  >
         <b>Name :</b>
      </td>
      <td nowrap colspan=3> 
         <input type="text" name="NAMECUM" size="45" readonly value="<%=userPO.getHeader3()%>">
      </td>         
    </tr> 
    <tr id="trdark"> 
      <td align="right"  >
         <b> Proposal # :</b>
      </td>
      <td nowrap > 
         <input type="text" name="Identifier" size="15" readonly value="<%=userPO.getIdentifier()%>">
      </td>
      <td nowrap > 
      </td>
    </tr>  

  </table> 
 </td>        
 </tr>  
</table>
<TABLE  class="tableinfo"> 
		<% if(msgL0724.getE01DPATIP().trim().equals("1")){; %>
		<TR id=trclear> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
			<b></b>Internal Analysis
			</TD>
		</TR>
		<TR id=trclear> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
			<b></b>Strengths
			</TD>
		</TR>
		<% } else {;%>
		<TR id=trclear> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
			<b></b>Financial Indicators
			</TD>
		</TR>
		<TR id=trclear> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
			<b></b>Solvency and Liquidity
			</TD>
		</TR>
		<% };%>
		
		<TR id=trdark> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
		<TEXTAREA name="E01DPAM21" maxlength="800" rows="10" cols="80" value="<%= msgL0724.getE01DPAM21().trim()%>"
		onKeyDown="limitText(this.form.E01DPAM21,800);" onKeyUp="limitText(this.form.E01DPAM21,800);"
		<% if(userPO.getHeader16().equals("5")){out.print("readonly");}%>
		>
		</TEXTAREA>

			</TD>
		</TR>
		<% if(msgL0724.getE01DPATIP().trim().equals("1")){; %>
		<TR id=trclear> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
			<b></b>Weaknesses
			</TD>
		</TR>
		<% } else {;%>
		<TR id=trclear> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
			<b></b>Indebtedness
			</TD>
		</TR>
		<% };%>
		<TR id=trdark> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
		<TEXTAREA name="E01DPAM22" maxlength="800" rows="10" cols="80" value="<%= msgL0724.getE01DPAM22().trim()%>"
		onKeyDown="limitText(this.form.E01DPAM22,800);" onKeyUp="limitText(this.form.E01DPAM22,800);"
		<% if(userPO.getHeader16().equals("5")){out.print("readonly");}%>
		>
		</TEXTAREA>

			</TD>
		</TR>
		<% if(msgL0724.getE01DPATIP().trim().equals("1")){; %>
		<TR id=trclear> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
			<b></b>External Analysis
			</TD>
		</TR>
		<TR id=trclear> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
			<b></b>Opportunities
			</TD>
		</TR>
		<% } else {;%>
		<TR id=trclear> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
			<b></b>Profitability and Coverage
			</TD>
		</TR>
		<% };%>
		<TR id=trdark> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
		<TEXTAREA name="E01DPAM23" maxlength="800" rows="10" cols="80" value="<%= msgL0724.getE01DPAM23().trim()%>"
		onKeyDown="limitText(this.form.E01DPAM23,800);" onKeyUp="limitText(this.form.E01DPAM23,800);"
		<% if(userPO.getHeader16().equals("5")){out.print("readonly");}%>
		>
		</TEXTAREA>

			</TD>
		</TR>
		<% if(msgL0724.getE01DPATIP().trim().equals("1")){; %>
		<TR id=trclear> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
			<b></b>Threats
			</TD>
		</TR>
		<% } else {;%>
		<TR id=trclear> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
			<b></b>Analysis of Projected Cash Flow
			</TD>
		</TR>
		<% };%>
		<TR id=trdark> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
		<TEXTAREA name="E01DPAM24" maxlength="800" rows="10" cols="80" value="<%= msgL0724.getE01DPAM24().trim()%>"
		onKeyDown="limitText(this.form.E01DPAM24,800);" onKeyUp="limitText(this.form.E01DPAM24,800);"
		<% if(userPO.getHeader16().equals("5")){out.print("readonly");}%>
		>
		</TEXTAREA>

			</TD>
		</TR>
		<% if(msgL0724.getE01DPATIP().trim().equals("1")){; %>
		<TR id=trclear> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
			<b></b>Company Description
			</TD>
		</TR>
		<% } else {;%>
		<TR id=trclear> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
			<b></b>Analysis of the Ability to Pay
			</TD>
		</TR>
		<% };%>
		<TR id=trdark> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
		<TEXTAREA name="E01DPAM25" maxlength="800" rows="10" cols="80" value="<%= msgL0724.getE01DPAM25().trim()%>"
		onKeyDown="limitText(this.form.E01DPAM25,800);" onKeyUp="limitText(this.form.E01DPAM25,800);"
		<% if(userPO.getHeader16().equals("5")){out.print("readonly");}%>
		>
		</TEXTAREA>

			</TD>
		</TR>
		<% if(msgL0724.getE01DPATIP().trim().equals("1")){; %>
		<TR id=trclear> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
			<b></b>Economic Sector
			</TD>
		</TR>
		<TR id=trdark> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
		<TEXTAREA name="E01DPAM26" maxlength="800" rows="10" cols="80" value="<%= msgL0724.getE01DPAM26().trim()%>"
		onKeyDown="limitText(this.form.E01DPAM26,800);" onKeyUp="limitText(this.form.E01DPAM26,800);"
		<% if(userPO.getHeader16().equals("5")){out.print("readonly");}%>
		>
		</TEXTAREA>

			</TD>
		</TR>
		<TR id=trclear> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
			<b></b>Reciprocity with the Bank and Other Institutions
			</TD>
		</TR>
		<TR id=trdark> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
		<TEXTAREA name="E01DPAM27" maxlength="800" rows="10" cols="80" value="<%= msgL0724.getE01DPAM27().trim()%>"
		onKeyDown="limitText(this.form.E01DPAM27,800);" onKeyUp="limitText(this.form.E01DPAM27,800);"
		<% if(userPO.getHeader16().equals("5")){out.print("readonly");}%>
		>
		</TEXTAREA>
			</TD>
		</TR>
		<% } else {;%>
			<INPUT TYPE=HIDDEN NAME="E01DPAM26" VALUE="">
			<INPUT TYPE=HIDDEN NAME="E01DPAM27" VALUE="">
		<% };%>

	</TABLE>
  
	<div align="center"> 		
		<% if(!userPO.getHeader16().equals("5")){%> 		
       <input id="EIBSBTN" type="button" name="Submit" value="Submit" onclick="goConfirm()"> 
	    <% }; %> 
	<INPUT id="EIBSBTN" type="button" name="Cancel" value="Cancel" onclick="window.close();">
	</div>

</FORM>

</BODY>
</HTML>
