<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>
PIN Change
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<body >
<% 
 if ( !error.getERRNUM().equals("0")  ) {
 
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
%> 
<h3 align="center">PIN Change<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="change_pin.jsp, ECC010001"></h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC010001" id="form1" name="form1" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="30">
<INPUT TYPE=HIDDEN NAME="OPT" VALUE="1">
<INPUT TYPE=HIDDEN NAME="E01CCRPIO" VALUE="">
<INPUT TYPE=HIDDEN NAME="E01CCRPIN" VALUE="">

	  <table class="tableinfo">
         <tr > 
           <td nowrap> 
             <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
               <tr id="trdark"> 
                 <td nowrap width="16%" > 
                   <div align="right"><b>Customer Number :</b></div>
                 </td>
                 <td nowrap width="20%" > 
                   <div align="left"><b> 
                     <input type="text" readonly name="E01PRICUN" size="10" maxlength="9" value="<%= userPO.getCusNum().trim()%>">
                     </b> </div>
                 </td>
                 <td nowrap width="16%" >
                   <div align="right"><b>Customer Name :</b> </div>
                 </td>
                 <td nowrap width="20%" > 
                   <div align="left"> 
                     <input type="text" readonly name="E01PRINA1" size="36" maxlength="35" value="<%= userPO.getCusName().trim()%>">
                   </div>
                 </td>
               </tr>
               <%-- 
               <tr id="trdark"> 
                 <td nowrap width="16%" > 
                   <div align="right">Estado</div>
                 </td>
                 <td nowrap width="20%" > 
           <input type="text" readonly name="E01CCRSTA" size="12" maxlength="10" 
           	value="<% 
           	if 		(userPO.getHeader2().equals("I")) out.print("Inactiva");
			else if	(userPO.getHeader2().equals("A")) out.print("Activa");
           	else out.print("");	%>" >	
                 </td>
                 <td nowrap width="16%" > 
                   <div align="right">Causal de Estado :</div>
                 </td>
                 <td nowrap > 
                   <div align="left">
                   	<input type="text" readonly name="E01CCRDSC" size="17" maxlength="15" value="<%= userPO.getHeader3()%>" >
                   </div>
                 </td>
               </tr>         
               --%>
               <tr id="trdark"> 
                 <td nowrap width="16%" > 
                   <div align="right"></div>
                 </td>
                 <td nowrap width="20%" > 
                   <div align="left">
                   </div>
                 </td>
                 <td nowrap width="16%" > 
                   <div align="right"><B>Card Number :</B></div>
                 </td>
                 <td nowrap width="20%" > 
                   <div align="left">
                   	<input type="text" readonly name="E01CCRNUM" size="21" maxlength="20" value="<%= userPO.getHeader1().trim()%>" >
                   </div>
                 </td>
               </tr>                             
             </table>
           </td>
         </tr>
       </table>
	<h4>Pinpad</h4>
	<!--
	<select id='selectType' onchange="actualizarParametro();">
		<option value='1'>Opci�n 1 - New Pin</option>
		<option value='2'>Opci�n 2 - Reset Pin</option>
		<option value='3'>Opci�n 3 - Change Pin</option>
	</select>
	-->
	<applet code="com.app.class" archive="<%=request.getContextPath()%>/pages/e/appletPinpad8.jar" name="KSNCuatro" id="KSNCuatro" width="800" height="100" MAYSCRIPT>
		<PARAM name="parametro" value="3"/>
	</applet>
	<!--
	<br>
	<div align="center"> 
		<input id="EIBSBTN" type="submit" name="submit" value="Change">
	</div>
	-->

</FORM>

<script type="text/javascript">
function actualizarParametro(){
	document.applets[0].setValores(document.getElementById('selectType').value);
}
</script>
</BODY>
</HTML>

