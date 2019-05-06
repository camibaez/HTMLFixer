<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Cuentas Corrientes</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<%@ page import = "java.io.*,java.net.*,datapro.eibs.beans.*,com.datapro.eibs.security.dto.*,java.math.*" %>

<jsp:useBean id="userInfo" class="com.datapro.eibs.security.dto.USERDto"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

</head>
<body>
<SCRIPT Language="Javascript">
  function showTab(index){
  	for(var i=0;i<3;i++){
   		document.all["Tab"+i].className="tabnormal";
   		document.all["dataTab"+i].style.display="none";
   	}

    document.all["Tab"+index].className="tabhighlight";
  	document.all["dataTab"+index].style.display="";
  }

</SCRIPT>

<%
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }


%>
<H3 align="center">Mantenimiento de Usuarios<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="UserProfile_maint"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/com.datapro.eibs.security.servlet.JSUserProfile" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="20">

  <table class="tableinfo">
    <tr>
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="20%">
              <b>Codigo Usuario :</b>
            </td>
            <td nowrap >
               <input type="text" name="EUPUSR" size="10" maxlength="10" value="<%= userInfo.getEupusr()%>">
               <input type="hidden" name="BTHKEY" size="10" maxlength="10" value="<%= userInfo.getBthkey()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <H4>Perfil e-IBS</H4>
  <table  class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap >
              <div align="right">Clave de Acceso :</div>
            </td>
            <td nowrap >
              <INPUT TYPE=password  name="EUPACP" size="10" maxlength="10"	value="<%= userInfo.getEupacp() %>">
            </td>

          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right">Requiere Clave Acceso :</div>
            </td>
            <td nowrap >
              <input type="radio" name="EUPOPR" value="Y" <%if(userInfo.getEupopr().equals("1")) out.print("checked");%>>
              S&iacute;
              <input type="radio" name="EUPOPR" value="N" <%if(userInfo.getEupopr().equals("0")) out.print("checked");%>>
              No </td>
          </tr>
          <tr id="trdark">
            <td nowrap>
              <div align="right">Frecuencia Cambio Clave :</div>
            </td>
            <td nowrap>
            	<INPUT type="text"	name="E01ACMMLA" size="2" maxlength="1"	value="">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap>
              <div align="right">Status :</div>
            </td>
            <td nowrap>
              <select name="EUPSTS">
                <option value="1 " <% if (!(userInfo.getEupsts().equals("2") ||userInfo.getEupsts().equals("3")||userInfo.getEupsts().equals("4"))) out.print("selected"); %>>Activo</option>
                <option value="2" <% if (userInfo.getEupsts().equals("2")) out.print("selected"); %>>Inactivado</option>
                <option value="3" <% if (userInfo.getEupsts().equals("3")) out.print("selected"); %>>Suspendido</option>
                <option value="4" <% if (userInfo.getEupsts().equals("4")) out.print("selected"); %>>Pendiente Activacion</option>
              </select>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap>
              <div align="right">Identificacion :</div>
            </td>
            <td nowrap>
 	          	<INPUT type="text" name="EUPIDN" size="15" maxlength="15"	value="<%= userInfo.getEupidn()%>">
 	        </td>
          </tr>
          <tr id="trdark">
            <td nowrap>
              <div align="right">Nombre :</div>
            </td>
            <td nowrap>
            	<INPUT type="text" name="EUPNME" size="45" maxlength="45" value="<%= userInfo.getEupnme()%>">
			</td>
          </tr>
          <tr id="trdark">
            <td nowrap>
              <div align="right">Direccion Internet :</div>
            </td>
            <td nowrap>

            </td>
          </tr>
          <tr id="trclear">
            <td nowrap>
              <div align="right">Telefono :</div>
            </td>
            <td nowrap>
              <input type="text" name="EUPPHN" size="11" maxlength="11" value="<%= userInfo.getEupphn()%>">
            </td>
          </tr>
          <tr>
            <td nowrap width="26%">
              <div align="right">Tel. Extension :</div>
            </td>
            <td nowrap width="26%">
              <input type="text" name="EUPPXT" size="4" maxlength="4" value="<%= userInfo.getEuppxt()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap>
              <div align="right">Oficina Adimistrativa :</div>
            </td>
            <td nowrap>
              <input type="text" name="E01ACMBNK" size="2" maxlength="2" value="">
              <input type="text" name="E01ACMBRN" size="2" maxlength="3" value="">
              <a href="javascript:GetBranch('E01ACMBRN','')"><img src="/eIBS_R04M07/images/1b.gif" alt="Help" border="0"></a>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap>
              <div align="right">Usario Nivel Superior :</div>
            </td>
            <td nowrap>

            </td>
          </tr>
          <tr id="trdark">
            <td nowrap>
              <div align="right">Unidad de Negocio :</div>
            </td>
            <td nowrap>

            </td>
          </tr>
          <tr id="trdark">
            <td nowrap>
              <div align="right">Area de trabajo (C/R) :</div>
            </td>
            <td nowrap>

            </td>
          </tr>
          <tr id="trdark">
            <td nowrap>
              <div align="right">Tipo Usuario :</div>
            </td>
            <td nowrap>

            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <H4>Perfil IBS</H4>
  <table class="tbenter" width="100%" border="0" cellspacing=0 cellpadding=0>
    <tr>
       <td nowrap>
           <table id="TableTab" cellspacing=0 cellpadding=2 border="0">
                <tr>
                    <td nowrap id="Tab0" class="tabhighlight" onClick="showTab(0)">
                            <div nowrap>Mnto. a Cuentas</div>
                    </td>
                    <td nowrap id="Tab1" class="tabnormal" onClick="showTab(1)">
                            <div nowrap>Rango Lotes</div>
                    </td>
                    <td nowrap id="Tab2" class="tabnormal" onClick="showTab(2)">
                            <div nowrap>Otras Autorizaciones</div>
                    </td>
                    <td class="tabempty" width="100%">empty
                    </td>
                 </tr>
            </table>
       </td>
    </tr>
  </table>
  <table class="tabdata" width="100%">
    <tr>
     <td nowrap>
  		<div id="dataTab0">
  			<table width="100%" border="0" cellspacing="0" cellpadding="0">
  				<tr>
  				    <td nowrap>
              			<div align="right">Banco/Sucursal/C.Costo :</div>
            		</td>
            		<td nowrap>

            		</td>
  				</tr>
  				<tr>
  				    <td nowrap>
              			<div align="right">Contraseña IBS :</div>
            		</td>
            		<td nowrap>

            		</td>
  				</tr>
  				<tr>
  				    <td nowrap>
              			<div align="right">Id. Usuario Grupo :</div>
            		</td>
            		<td nowrap>

            		</td>
  				</tr>
  				<tr>
  				    <td nowrap>
              			<div align="right">No. Cliente :</div>
            		</td>
            		<td nowrap>

            		</td>
  				</tr>
  				<tr>
  				    <td nowrap>
              			<div align="right">Oficial :</div>
            		</td>
            		<td nowrap>

            		</td>
  				</tr>
  				<tr>
  				    <td nowrap>
              			<div align="right">Moneda/Monto x Aproba. :</div>
            		</td>
            		<td nowrap>

            		</td>
  				</tr>
  				<tr>
  				    <td nowrap>
              			<div align="right">Pto Tolerancia/Tipo :</div>
            		</td>
            		<td nowrap>

            		</td>
  				</tr>
  				<tr>
  				    <td nowrap>
              			<div align="right">Tipo Usuario :</div>
            		</td>
            		<td nowrap>

            		</td>
  				</tr>
  				<tr>
  				    <td nowrap>
              			<div align="right">Idioma :</div>
            		</td>
            		<td nowrap>

            		</td>
  				</tr>
  				<tr>
  				    <td nowrap>
              			<div align="right">Nivel de Consulta :</div>
            		</td>
            		<td nowrap>

            		</td>
  				</tr>
  				<tr>
  				    <td nowrap>
              			<div align="right">Nivel Contabilización :</div>
            		</td>
            		<td nowrap>

            		</td>
  				</tr>
  				<tr>
  				    <td nowrap>
              			<div align="right">Nivel Aprob. Clientes :</div>
            		</td>
            		<td nowrap>

            		</td>
  				</tr>
  			</table>
  		</div>
        <div id="dataTab1" style="display: none">
        	<table width="100%" border="0" cellspacing="0" cellpadding="0">
        		<tr>
  				    <td nowrap>
              			<div align="center">Rango de Lote</div>
            		</td>
            		<td nowrap>
              			<div align="center">Inicial</div>
            		</td>
            		<td nowrap>
              			<div align="center">Final</div>
            		</td>
  				</tr>
  				<tr>
  				    <td nowrap>
              			<div align="right">Lotes 1 :</div>
            		</td>
            		<td nowrap>

            		</td>
            		<td nowrap>

            		</td>
  				</tr>
  				<tr>
  				    <td nowrap>
              			<div align="right">Lotes 2 :</div>
            		</td>
            		<td nowrap>

            		</td>
            		<td nowrap>

            		</td>
  				</tr>
  				<tr>
  				    <td nowrap>
              			<div align="right">Negociacion L/C :</div>
            		</td>
            		<td nowrap>

            		</td>
            		<td nowrap>

            		</td>
  				</tr>
  				<tr>
  				    <td nowrap>
              			<div align="right">Lote para P & R :</div>
            		</td>
            		<td nowrap>

            		</td>
            		<td nowrap>

            		</td>
  				</tr>
  				<tr>
  				    <td nowrap>
              			<div align="right">Lote x Omision :</div>
            		</td>
            		<td nowrap>

            		</td>
            		<td nowrap>

            		</td>
  				</tr>
  			</table>
  		</div>
        <div id="dataTab2" style="display: none">
        	<table id="headTable" >
    			<TR id="trdark">
      				<TH ALIGN=CENTER nowrap>Autorizacion a</TH>
      				<TH ALIGN=CENTER nowrap>SI</TH>
      				<TH ALIGN=CENTER nowrap>NO</TH>
    			</TR>
   			</table>
   			<div id="dataDiv1" height="280" class="scbarcolor" style="padding:0" NOWRAP>
    			<table id="dataTable">
    				<tr>
  				    	<td nowrap>
              				<div align="right">Cambiar Nro. de Clientes :</div>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="Y" <%if(userInfo.getEupopr().equals("Y")) out.print("checked");%>>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="N" <%if(userInfo.getEupopr().equals("N")) out.print("checked");%>>
            			</td>
  					</tr>
  					<tr>
  				    	<td nowrap>
              				<div align="right">Cambiar Estado de la Cuenta :</div>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="Y" <%if(userInfo.getEupopr().equals("Y")) out.print("checked");%>>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="N" <%if(userInfo.getEupopr().equals("N")) out.print("checked");%>>
            			</td>
  					</tr>
  					<tr>
  				    	<td nowrap>
              				<div align="right">Cambiar Retenciones y Garantias :</div>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="Y" <%if(userInfo.getEupopr().equals("Y")) out.print("checked");%>>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="N" <%if(userInfo.getEupopr().equals("N")) out.print("checked");%>>
            			</td>
  					</tr>
  					<tr>
  				    	<td nowrap>
              				<div align="right">Aprobar Nuevos Prestamos (Activo) :</div>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="Y" <%if(userInfo.getEupopr().equals("Y")) out.print("checked");%>>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="N" <%if(userInfo.getEupopr().equals("N")) out.print("checked");%>>
            			</td>
  					</tr>
  					<tr>
  				    	<td nowrap>
              				<div align="right">Aprobar Nuevos Cert.Depos. (Pasivo) :</div>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="Y" <%if(userInfo.getEupopr().equals("Y")) out.print("checked");%>>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="N" <%if(userInfo.getEupopr().equals("N")) out.print("checked");%>>
            			</td>
  					</tr>
  					<tr>
  				    	<td nowrap>
              				<div align="right">Aprobar Sobregiro Pagos y Recibo :</div>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="Y" <%if(userInfo.getEupopr().equals("Y")) out.print("checked");%>>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="N" <%if(userInfo.getEupopr().equals("N")) out.print("checked");%>>
            			</td>
  					</tr>
  					<tr>
  				    	<td nowrap>
              				<div align="right">Aprobar S/giro x Oper.Comerc.Exter. :</div>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="Y" <%if(userInfo.getEupopr().equals("Y")) out.print("checked");%>>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="N" <%if(userInfo.getEupopr().equals("N")) out.print("checked");%>>
            			</td>
  					</tr>
  					<tr>
  				    	<td nowrap>
              				<div align="right">Aprobar Cartas de Credito :</div>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="Y" <%if(userInfo.getEupopr().equals("Y")) out.print("checked");%>>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="N" <%if(userInfo.getEupopr().equals("N")) out.print("checked");%>>
            			</td>
  					</tr>
  					<tr>
  				    	<td nowrap>
              				<div align="right">Aprobar Lineas de Credito:</div>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="Y" <%if(userInfo.getEupopr().equals("Y")) out.print("checked");%>>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="N" <%if(userInfo.getEupopr().equals("N")) out.print("checked");%>>
            			</td>
  					</tr>
  					<tr>
  				    	<td nowrap>
              				<div align="right">Aprobar S/Giro Lineas/Ocacional :</div>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="Y" <%if(userInfo.getEupopr().equals("Y")) out.print("checked");%>>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="N" <%if(userInfo.getEupopr().equals("N")) out.print("checked");%>>
            			</td>
  					</tr>
  					<tr>
  				    	<td nowrap>
              				<div align="right">Aprobar Contabilidad Mda. Ext. :</div>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="Y" <%if(userInfo.getEupopr().equals("Y")) out.print("checked");%>>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="N" <%if(userInfo.getEupopr().equals("N")) out.print("checked");%>>
            			</td>
  					</tr>
  					<tr>
  				    	<td nowrap>
              				<div align="right">Trabajar con Inversiones :</div>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="Y" <%if(userInfo.getEupopr().equals("Y")) out.print("checked");%>>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="N" <%if(userInfo.getEupopr().equals("N")) out.print("checked");%>>
            			</td>
  					</tr>
  					<tr>
  				    	<td nowrap>
              				<div align="right">Asientos Contables :</div>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="Y" <%if(userInfo.getEupopr().equals("Y")) out.print("checked");%>>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="N" <%if(userInfo.getEupopr().equals("N")) out.print("checked");%>>
            			</td>
  					</tr>
  					<tr>
  				    	<td nowrap>
              				<div align="right">Asientos Ctas. Detalles :</div>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="Y" <%if(userInfo.getEupopr().equals("Y")) out.print("checked");%>>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="N" <%if(userInfo.getEupopr().equals("N")) out.print("checked");%>>
            			</td>
  					</tr>
  					<tr>
  				    	<td nowrap>
              				<div align="right">Asientos Contratos Activos :</div>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="Y" <%if(userInfo.getEupopr().equals("Y")) out.print("checked");%>>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="N" <%if(userInfo.getEupopr().equals("N")) out.print("checked");%>>
            			</td>
  					</tr>
  					<tr>
  				    	<td nowrap>
              				<div align="right">Asientos Contratos Pasivos :</div>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="Y" <%if(userInfo.getEupopr().equals("Y")) out.print("checked");%>>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="N" <%if(userInfo.getEupopr().equals("N")) out.print("checked");%>>
            			</td>
  					</tr>
  					<tr>
  				    	<td nowrap>
              				<div align="right">Asientos Cartas Credito :</div>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="Y" <%if(userInfo.getEupopr().equals("Y")) out.print("checked");%>>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="N" <%if(userInfo.getEupopr().equals("N")) out.print("checked");%>>
            			</td>
  					</tr>
  					<tr>
  				    	<td nowrap>
              				<div align="right">Asientos Reembolsos :</div>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="Y" <%if(userInfo.getEupopr().equals("Y")) out.print("checked");%>>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="N" <%if(userInfo.getEupopr().equals("N")) out.print("checked");%>>
            			</td>
  					</tr>
  					<tr>
  				    	<td nowrap>
              				<div align="right">Asientos Hipotecas :</div>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="Y" <%if(userInfo.getEupopr().equals("Y")) out.print("checked");%>>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="N" <%if(userInfo.getEupopr().equals("N")) out.print("checked");%>>
            			</td>
  					</tr>
  					<tr>
  				    	<td nowrap>
              				<div align="right">Asientos Varios :</div>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="Y" <%if(userInfo.getEupopr().equals("Y")) out.print("checked");%>>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="N" <%if(userInfo.getEupopr().equals("N")) out.print("checked");%>>
            			</td>
  					</tr>
  					<tr>
  				    	<td nowrap>
              				<div align="right">Asientos Ptmos a Plazo :</div>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="Y" <%if(userInfo.getEupopr().equals("Y")) out.print("checked");%>>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="N" <%if(userInfo.getEupopr().equals("N")) out.print("checked");%>>
            			</td>
  					</tr>
  					<tr>
  				    	<td nowrap>
              				<div align="right">Aprobar Garant&iacute;as :</div>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="Y" <%if(userInfo.getEupopr().equals("Y")) out.print("checked");%>>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="N" <%if(userInfo.getEupopr().equals("N")) out.print("checked");%>>
            			</td>
  					</tr>
  					<tr>
  				    	<td nowrap>
              				<div align="right">Propuesta Cr. S/Aproba. :</div>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="Y" <%if(userInfo.getEupopr().equals("Y")) out.print("checked");%>>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="N" <%if(userInfo.getEupopr().equals("N")) out.print("checked");%>>
            			</td>
  					</tr>
  					<tr>
  				    	<td nowrap>
              				<div align="right">Aprobar Excede Tasa Int. :</div>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="Y" <%if(userInfo.getEupopr().equals("Y")) out.print("checked");%>>
            			</td>
            			<td nowrap>
              				<input type="radio" name="EUPOPR" value="N" <%if(userInfo.getEupopr().equals("N")) out.print("checked");%>>
            			</td>
  					</tr>
    			</table>
   			</div>
        </div>
     </td>
    </tr>
  </table>
  <p align="center">
        <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </p>
  <SCRIPT language="JavaScript">
  	function resizeDoc() {
       adjustEquTables(headTable, dataTable, dataDiv1,0,false);
  	}
  	resizeDoc();
  	window.onresize=resizeDoc;
  </SCRIPT>
  </form>
</body>
</html>
