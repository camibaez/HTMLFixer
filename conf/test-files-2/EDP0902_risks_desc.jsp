<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>
Mantenimiento Descripcion Riesgos por Modulo
</TITLE>

<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="Edp0902" class="datapro.eibs.beans.EDP090201Message"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

</HEAD>


<script language="JavaScript">
function init()
{
 // texto comentarios 
 if (document.forms[0].E01QADCO1 != null) {
	document.forms[0].E01QADCO1.value = "<%=Edp0902.getE01QADCO1().trim()%>";
 }
 if (document.forms[0].E01QADCO2 != null) {
	document.forms[0].E01QADCO2.value = "<%=Edp0902.getE01QADCO2().trim()%>";
 }
 if (document.forms[0].E01QADCO3 != null) {
	document.forms[0].E01QADCO3.value = "<%=Edp0902.getE01QADCO3().trim()%>";
 }
 if (document.forms[0].E01QADCO4 != null) {
	document.forms[0].E01QADCO4.value = "<%=Edp0902.getE01QADCO4().trim()%>";
 }
 if (document.forms[0].E01QADCO5 != null) {
	document.forms[0].E01QADCO5.value = "<%=Edp0902.getE01QADCO5().trim()%>";
 }
 if (document.forms[0].E01QADCO6 != null) {
	document.forms[0].E01QADCO6.value = "<%=Edp0902.getE01QADCO6().trim()%>";
 }
 if (document.forms[0].E01QADCO7 != null) {
	document.forms[0].E01QADCO7.value = "<%=Edp0902.getE01QADCO7().trim()%>";
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

      ok = confirm("Esta seguro que desea crear/modificar este registro?");
      
	  if (ok) 
	       {
		  document.forms[0].SCREEN.value="600";
	       document.forms[0].submit();
	       }  
}

function goCancel() {
	document.forms[0].SCREEN.value="300"; 
	document.forms[0].submit(); 
}
</script>
<body onload=javascript:init()>
<h3 align="center">Mantenimiento Descripcion Riesgos por Modulo<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="EDP0902_risks_desc,EDP0902"></h3>

<h3 align="center"><%= Edp0902.getE01CNORCD().trim()%>-<%= Edp0902.getE01CNODSC().trim()%><br>
<%= Edp0902.getE01QADCD2().trim()%>-<%= Edp0902.getE01QADDC1().trim()%></h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.creditproposal.JSEDP0902">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="400">
<INPUT TYPE=HIDDEN NAME="ROW" VALUE="">
<INPUT TYPE=HIDDEN NAME="E01QADCO7" VALUE="">
<INPUT TYPE=HIDDEN NAME="E01QADCD1" VALUE="<%= Edp0902.getE01QADCD1().trim()%>">
<INPUT TYPE=HIDDEN NAME="E01QADCD2" VALUE="<%= Edp0902.getE01QADCD2().trim()%>">
<table class="tableinfo">    

</table>

<TABLE  class="tableinfo"> 
		<TR id=trclear> 
			<TD ALIGN="left" NOWRAP width="60%">
			<b></b>1. Minimo Riesgo 
			</TD>
		</TR>
		
		<TR id=trdark> 
			<TD ALIGN="center" NOWRAP width="60%">
		<TEXTAREA name="E01QADCO1" maxlength="800" rows="4" cols="80" value="<%= Edp0902.getE01QADCO1().trim()%>"
		onKeyDown="limitText(this.form.E01QADCO1,800);" onKeyUp="limitText(this.form.E01QADCO1,800);"
		<% if(userPO.getHeader16().equals("5")){out.print("readonly");}%>
		>
		</TEXTAREA>

			</TD>
		</TR>
		<TR id=trclear> 
			<TD ALIGN="left" NOWRAP width="60%">
			<b></b>2. Bajo Riesgo
			</TD>
		</TR>
		<TR id=trdark> 
			<TD ALIGN="center" NOWRAP width="60%">
		<TEXTAREA name="E01QADCO2" maxlength="800" rows="4" cols="80" value="<%= Edp0902.getE01QADCO2().trim()%>"
		onKeyDown="limitText(this.form.E01QADCO2,800);" onKeyUp="limitText(this.form.E01QADCO2,800);"
		<% if(userPO.getHeader16().equals("5")){out.print("readonly");}%>
		>
		</TEXTAREA>

			</TD>
		</TR>
		<TR id=trclear> 
			<TD ALIGN="left" NOWRAP width="60%">
			<b></b>3. Riesgo Medio
			</TD>
		</TR>
		<TR id=trdark> 
			<TD ALIGN="center" NOWRAP width="60%">
		<TEXTAREA name="E01QADCO3" maxlength="800" rows="4" cols="80" value="<%= Edp0902.getE01QADCO3().trim()%>"
		onKeyDown="limitText(this.form.E01QADCO3,800);" onKeyUp="limitText(this.form.E01QADCO3,800);"
		<% if(userPO.getHeader16().equals("5")){out.print("readonly");}%>
		>
		</TEXTAREA>

			</TD>
		</TR>
		<TR id=trclear> 
			<TD ALIGN="left" NOWRAP width="60%">
			<b></b>4. Alto Riesgo
			</TD>
		</TR>
		<TR id=trdark> 
			<TD ALIGN="center" NOWRAP width="60%">
		<TEXTAREA name="E01QADCO4" maxlength="800" rows="4" cols="80" value="<%= Edp0902.getE01QADCO4().trim()%>"
		onKeyDown="limitText(this.form.E01QADCO4,800);" onKeyUp="limitText(this.form.E01QADCO4,800);"
		<% if(userPO.getHeader16().equals("5")){out.print("readonly");}%>
		>
		</TEXTAREA>

			</TD>
		</TR>
		<TR id=trclear> 
			<TD ALIGN="left" NOWRAP width="60%">
			<b></b>5. Maximo Riesgo
			</TD>
		</TR>
		<TR id=trdark> 
			<TD ALIGN="center" NOWRAP width="60%">
		<TEXTAREA name="E01QADCO5" maxlength="800" rows="4" cols="80" value="<%= Edp0902.getE01QADCO5().trim()%>"
		onKeyDown="limitText(this.form.E01QADCO5,800);" onKeyUp="limitText(this.form.E01QADCO5,800);"
		<% if(userPO.getHeader16().equals("5")){out.print("readonly");}%>
		>
		</TEXTAREA>

			</TD>
		</TR>
		<TR id=trclear> 
			<TD ALIGN="left" NOWRAP width="60%">
			<b></b>Fuente de Informacion
			</TD>
		</TR>
		<TR id=trdark> 
			<TD ALIGN="center" NOWRAP width="60%">
		<TEXTAREA name="E01QADCO6" maxlength="800" rows="4" cols="80" value="<%= Edp0902.getE01QADCO6().trim()%>"
		onKeyDown="limitText(this.form.E01QADCO6,800);" onKeyUp="limitText(this.form.E01QADCO6,800);"
		<% if(userPO.getHeader16().equals("5")){out.print("readonly");}%>
		>
		</TEXTAREA>

			</TD>
		</TR>

	</TABLE>
  
	<div align="center"> 		
		<% if(!userPO.getOption().equals("4")){%> 		
       <input id="EIBSBTN" type="button" name="Submit" value="Enviar" onclick="goConfirm()"> 
	    <% }; %> 
	<INPUT id="EIBSBTN" type="button" name="Cancel" value="Cancelar" onclick="goCancel()">
	</div>

</FORM>

</BODY>
</HTML>
