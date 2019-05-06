<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Módulo de Solicitudes</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>


<SCRIPT Language="Javascript">
  function goAction(){

      var formLength = document.forms[0].elements.length;
      for (var n=0;n<formLength;n++){
        var elemt = document.forms[0].elements[n];
        if ( elemt.checked ) {
              opt=elemt.value;
			  document.forms[0].OPTION.value = opt;
			  document.forms[0]["Submit"].disabled = true; 
			  document.forms[0].submit();
              break;
        }
      }      
      
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

<H3 align="center">Módulo de Solicitudes<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="opt_new, ERQ0000"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.request.JSERQMain" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="100">
  <INPUT TYPE=HIDDEN NAME="OPTION" value="1">

  <H4>Creación</H4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="100%" colspan="2"> 
              <div ><b>Apertura</b></div>
            </td>
          </tr>
          <tr id="trclear">
          	<td nowrap width="15%">
            </td>
            <td nowrap width="85%">
          	  <input type="radio" name="OPTION" value="1"  checked>Clientes
          	  <select name="CLITYPE">
                <option value="PERSONAL" selected>Personal</option>
                <option value="CORPORATIVO" >Corporativo</option>
              </select>
          	</td>
          </tr>   
          <tr id="trclear">
          	<td nowrap width="15%">
            </td>
            <td nowrap width="85%">
          	  <input type="radio" name="OPTION" value="2">Cuentas
          	</td>
          </tr>   
          <tr id="trclear">
          	<td nowrap width="15%">
            </td>
            <td nowrap width="85%">
          	  <input type="radio" name="OPTION" value="3">Certificados de Depósitos
          	</td>
          </tr>   
          <tr id="trdark"> 
            <td nowrap width="100%" colspan="2"> 
              <div><b>Servicios</b></div>
            </td>
          </tr>
          <tr id="trclear">
          	<td nowrap width="15%">
            </td>
            <td nowrap width="85%">
          	  <input type="radio" name="OPTION" value="4">Transferencias
          	</td>
          </tr>   
          <tr id="trclear">
          	<td nowrap width="15%">
            </td>
            <td nowrap width="85%">
          	  <input type="radio" name="OPTION" value="5">Solicitud de Chequeras
          	</td>
          </tr>   
          <tr id="trclear">
          	<td nowrap width="15%">
            </td>
            <td nowrap width="85%">
          	  <input type="radio" name="OPTION" value="6">Suspensión de Chequeras
          	</td>
          </tr>   
          <tr id="trclear">
          	<td nowrap width="15%">
            </td>
            <td nowrap width="85%">
          	  <input type="radio" name="OPTION" value="7">Solicitud Cheque Oficial
          	</td>
          </tr>   
          <tr id="trclear">
          	<td nowrap width="15%">
            </td>
            <td nowrap width="85%">
          	  <input type="radio" name="OPTION" value="8">Retención de Correspondencias
          	</td>
          </tr>   
          <tr id="trclear">
          	<td nowrap width="15%">
            </td>
            <td nowrap width="85%">
          	  <input type="radio" name="OPTION" value="9">Pago a Terceros
          	</td>
          </tr>   
          <tr id="trclear">
          	<td nowrap width="15%">
            </td>
            <td nowrap width="85%">
          	  <input type="radio" name="OPTION" value="10">Copia Estado de Cuenta o Cheque
          	</td>
          </tr>   
          <tr id="trdark"> 
            <td nowrap width="100%" colspan="2"> 
              <div ><b>Mantenimiento</b></div>
            </td>
          </tr>
          <tr id="trclear">
          	<td nowrap width="15%">
            </td>
            <td nowrap width="85%">
          	  <input type="radio" name="OPTION" value="11">Cambio Condición CD
          	</td>
          </tr>   
          <tr id="trclear">
          	<td nowrap width="15%">
            </td>
            <td nowrap width="85%">
          	  <input type="radio" name="OPTION" value="12">Precancelación CD
          	</td>
          </tr>   
          <tr id="trclear">
          	<td nowrap width="15%">
            </td>
            <td nowrap width="85%">
          	  <input type="radio" name="OPTION" value="13">Inclusión Cotitular
          	</td>
          </tr>   
          <tr id="trclear">
          	<td nowrap width="15%">
            </td>
            <td nowrap width="85%">
          	  <input type="radio" name="OPTION" value="14">Exclusión Cotitular
          	</td>
          </tr>   
           <tr id="trclear">
          	<td nowrap width="15%">
            </td>
            <td nowrap width="85%">
          	  <input type="radio" name="OPTION" value="15">Inclusión Beneficiario
          	</td>
          </tr>   
          <tr id="trclear">
          	<td nowrap width="15%">
            </td>
            <td nowrap width="85%">
          	  <input type="radio" name="OPTION" value="16">Cancelación Cuenta
          	</td>
          </tr>   
          <tr id="trclear">
          	<td nowrap width="15%">
            </td>
            <td nowrap width="85%">
          	  <input type="radio" name="OPTION" value="17">Notificación Fallecimiento Titular
          	</td>
          </tr>   
        </table>
      </td>
    </tr>
  </table>

 <div align="center"> 
	   <input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="goAction();">
  </div>
  </form>
</body>
</html>
