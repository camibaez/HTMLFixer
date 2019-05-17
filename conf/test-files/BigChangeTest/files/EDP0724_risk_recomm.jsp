<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>
Risk Recommendations
</TITLE>

<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="Edp0724" class="datapro.eibs.beans.EDP072401Message"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

</HEAD>


<script language="JavaScript">
function init()
{
 // texto comentarios 
 if (document.forms[0].E01DPAM21 != null) {
	document.forms[0].E01DPAM21.value = "<%=Edp0724.getE01DPAM21().trim()%>";
 }
 if (document.forms[0].E01DPAM22 != null) {
	document.forms[0].E01DPAM22.value = "<%=Edp0724.getE01DPAM22().trim()%>";
 }
 if (document.forms[0].E01DPAM23 != null) {
	document.forms[0].E01DPAM23.value = "<%=Edp0724.getE01DPAM23().trim()%>";
 }
 if (document.forms[0].E01DPAM24 != null) {
	document.forms[0].E01DPAM24.value = "<%=Edp0724.getE01DPAM24().trim()%>";
 }
 if (document.forms[0].E01DPAM25 != null) {
	document.forms[0].E01DPAM25.value = "<%=Edp0724.getE01DPAM25().trim()%>";
 }
 if (document.forms[0].E01DPAM26 != null) {
	document.forms[0].E01DPAM26.value = "<%=Edp0724.getE01DPAM26().trim()%>";
 }
 if (document.forms[0].E01DPAM27 != null) {
	document.forms[0].E01DPAM27.value = "<%=Edp0724.getE01DPAM27().trim()%>";
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
		  document.forms[0].SCREEN.value="800";
	       document.forms[0].submit();
	       }  
}

function goCancel(opt) {
	var op = opt;  	  
	document.forms[0].opt.value = op;
	document.forms[0].SCREEN.value="470"; 
	document.forms[0].submit(); 
}
</script>
<body onload=javascript:init()>
<% if(Edp0724.getE01DPATIP().trim().equals("3")){; %>
	<h3 align="center">Customer Description
<% }; %>
<% if(Edp0724.getE01DPATIP().trim().equals("2")){; %>
	<h3 align="center">Financial Analisys
<% }%>
<% if(Edp0724.getE01DPATIP().trim().equals("4")){; %>
	<h3 align="center">Recommendations
<% }%>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="risk_recomm.jsp, EDP0724">
</h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.creditproposal.JSEDP0724">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="800">
<INPUT TYPE=HIDDEN NAME="ROW" VALUE="">
<INPUT TYPE=HIDDEN NAME="opt" VALUE="<%= Edp0724.getE01DPATIP().trim()%>">
<INPUT TYPE=HIDDEN NAME="NPR" VALUE="<%= Edp0724.getE01DPANPR().trim()%>">

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
         <b>Proposal Number:</b>
      </td>
      <td nowrap > 
         <input type="text" name="Identifier" size="15" readonly value="<%=userPO.getIdentifier()%>">
      </td>
      <td align="right"  >
         <b></b>
      </td>
      <td align="right"  >
         <b></b>
      </td>
    </tr>  

  </table> 
 </td>        
 </tr>  
</table>

  <table class="tbenter" width=100% align=center>
    <tr> 
      <td class=TDBKG width="20%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
      </td>
    </tr>
  </table>

<TABLE  class="tableinfo"> 
		<% if(Edp0724.getE01DPATIP().trim().equals("3")){; %>
		<TR id=trclear> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
			<b></b>Location: Company addr
			</TD>
		</TR>
		<% } ;%>
		<% if(Edp0724.getE01DPATIP().trim().equals("2")){; %>
		<TR id=trclear> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
			<b></b>Strenghts:
			</TD>
		</TR>
		<% };%>
		<% if(Edp0724.getE01DPATIP().trim().equals("4")){; %>
		<TR id=trclear> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
			<b></b>Relevant Comments:
			</TD>
		</TR>
		<% };%>
		
		<TR id=trdark> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
		<TEXTAREA name="E01DPAM21" maxlength="800" rows="10" cols="80" value="<%= Edp0724.getE01DPAM21().trim()%>"
		onKeyDown="limitText(this.form.E01DPAM21,800);" onKeyUp="limitText(this.form.E01DPAM21,800);"
		<% if(userPO.getOption().equals("5")){out.print("readonly");}%>
		>
		</TEXTAREA>

			</TD>
		</TR>
		<% if(Edp0724.getE01DPATIP().trim().equals("3")){; %>
		<TR id=trclear> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
			<b></b>Clients: Clients and Funding Policy 
			</TD>
		</TR>
		<% } ;%>
		<% if(Edp0724.getE01DPATIP().trim().equals("2")){; %>
		<TR id=trclear> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
			<b></b>Weaknesses :
			</TD>
		</TR>
		<% };%>
		<% if(Edp0724.getE01DPATIP().trim().equals("4")){; %>
		<TR id=trclear> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
			<b></b>Guarantee Description:
			</TD>
		</TR>
		<% };%>
		<TR id=trdark> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
		<TEXTAREA name="E01DPAM22" maxlength="800" rows="10" cols="80" value="<%= Edp0724.getE01DPAM22().trim()%>"
		onKeyDown="limitText(this.form.E01DPAM22,800);" onKeyUp="limitText(this.form.E01DPAM22,800);"
		<% if(userPO.getOption().equals("5")){out.print("readonly");}%>
		>
		</TEXTAREA>

			</TD>
		</TR>
		<% if(Edp0724.getE01DPATIP().trim().equals("3")){; %>
		<TR id=trclear> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
			<b></b>Providers and Financing Policy: 
			</TD>
		</TR>
		<% } ;%>
		<% if(Edp0724.getE01DPATIP().trim().equals("2")){; %>
		<TR id=trclear> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
			<b></b>Projected Cash Flow :
			</TD>
		</TR>
		<% };%>
		<% if(Edp0724.getE01DPATIP().trim().equals("4")){; %>
		<TR id=trclear> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
			<b></b>Experience Credit :
			</TD>
		</TR>
		<% };%>
		<TR id=trdark> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
		<TEXTAREA name="E01DPAM23" maxlength="800" rows="10" cols="80" value="<%= Edp0724.getE01DPAM23().trim()%>"
		onKeyDown="limitText(this.form.E01DPAM23,800);" onKeyUp="limitText(this.form.E01DPAM23,800);"
		<% if(userPO.getOption().equals("5")){out.print("readonly");}%>
		>
		</TEXTAREA>

			</TD>
		</TR>
		<% if(Edp0724.getE01DPATIP().trim().equals("3")){; %>
		<TR id=trclear> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
			<b></b>Related Companies: Related and Main Activity
			</TD>
		</TR>
		<% } ;%>
		<% if(Edp0724.getE01DPATIP().trim().equals("4")){; %>
		<TR id=trclear> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
			<b></b>Conclusion and Recommendation :
			</TD>
		</TR>
		<% };%>

		<%if ((Edp0724.getE01DPATIP().trim().equals("3")) || (Edp0724.getE01DPATIP().equals("4"))) {%>
		<TR id=trdark> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
		<TEXTAREA name="E01DPAM24" maxlength="800" rows="10" cols="80" value="<%= Edp0724.getE01DPAM24().trim()%>"
		onKeyDown="limitText(this.form.E01DPAM24,800);" onKeyUp="limitText(this.form.E01DPAM24,800);"
		<% if(userPO.getOption().equals("5")){out.print("readonly");}%>
		>
		</TEXTAREA>

			</TD>
		</TR>
		<% };%>
		<% if(Edp0724.getE01DPATIP().trim().equals("3")){; %>
		<TR id=trclear> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
			<b></b>Rivalry: Competitors
			</TD>
		</TR>
		<TR id=trdark> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
		<TEXTAREA name="E01DPAM25" maxlength="800" rows="10" cols="80" value="<%= Edp0724.getE01DPAM25().trim()%>"
		onKeyDown="limitText(this.form.E01DPAM25,800);" onKeyUp="limitText(this.form.E01DPAM25,800);"
		<% if(userPO.getOption().equals("5")){out.print("readonly");}%>
		>
		</TEXTAREA>

			</TD>
		</TR>
		<% };%>
		<% if(Edp0724.getE01DPATIP().trim().equals("3")){; %>
		<TR id=trclear> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
			<b></b>Financial Statement :
			</TD>
		</TR>
		<TR id=trdark> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
		<TEXTAREA name="E01DPAM26" maxlength="800" rows="10" cols="80" value="<%= Edp0724.getE01DPAM26().trim()%>"
		onKeyDown="limitText(this.form.E01DPAM26,800);" onKeyUp="limitText(this.form.E01DPAM26,800);"
		<% if(userPO.getOption().equals("5")){out.print("readonly");}%>>
		</TEXTAREA>
			</TD>
		</TR>
			<INPUT TYPE=HIDDEN NAME="E01DPAM27" VALUE="">
		<% };%>
		<% if(Edp0724.getE01DPATIP().trim().equals("2")){; %>
			<INPUT TYPE=HIDDEN NAME="E01DPAM24" VALUE="">
			<INPUT TYPE=HIDDEN NAME="E01DPAM25" VALUE="">
			<INPUT TYPE=HIDDEN NAME="E01DPAM26" VALUE="">
			<INPUT TYPE=HIDDEN NAME="E01DPAM27" VALUE="">
		<% };%>
		<% if(Edp0724.getE01DPATIP().trim().equals("4")){; %>
			<INPUT TYPE=HIDDEN NAME="E01DPAM25" VALUE="">
			<INPUT TYPE=HIDDEN NAME="E01DPAM26" VALUE="">
			<INPUT TYPE=HIDDEN NAME="E01DPAM27" VALUE="">
		<% };%>

	</TABLE>
  
	<div align="center"> 		
		<% if(!userPO.getOption().equals("5")){%> 		
       <input id="EIBSBTN" type="button" name="Submit" value="Submit" onclick="goConfirm()"> 
	    <% }; %> 
	</div>

</FORM>

</BODY>
</HTML>
