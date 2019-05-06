<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>

<script language="JavaScript">
function enter(){
	  document.forms[0].submit();
	 }
</script>

<META name="GENERATOR" content="IBM WebSphere Studio">
</head>
<body>

 
 <% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
    }
%>
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.request.JSERQMain" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
  <INPUT TYPE=HIDDEN NAME="Pos" VALUE="0">
  
  <table id="tbenter" align="center" style="width:85%" border="1">
    <tr> 
      <td> 
        <table id="tbenter" width="100%" border="0" cellspacing="1" cellpadding="0">
          <tr> 
            <td valign="middle" align="center" colspan="3" height=33> <b>M&oacute;dulo de Solicitudes - Consulta</b> </td>
          </tr>
          <tr> 
            <td>&nbsp;</td>
            <td width="20%" nowrap> 
              <div align="right">No. Solicitud:</div>
            </td>
            <td width="70%" nowrap> 
            	<input type="text" name="SWDRQN"  size=10 maxlength="10" onKeyPress="enterInteger()">
             </td>
          </tr>
          <tr>
            <td width="10%" align="center">&nbsp;</td>
            <td width="20%" nowrap>
              <div align="right">Tipo Solicitud: </div>
            </td>
            <td width="70%" nowrap>
              <select name="SWDTYP">
                <option value=" "> </option>
                <option value="01">Clientes</option>
                <option value="02">Cuentas</option>
                <option value="03">Cds</option>
                <option value="04">Transferencias</option>
               </select>            
          </tr>
         <tr>
            <td width="10%" align="center">&nbsp;</td>
            <td width="20%" nowrap>
              <div align="right">Estado: </div>
            </td>
            <td width="70%" nowrap>
              <select name="SWDSTS">
                <option value=" "> </option>
                <option value="1">Ingreso</option>
                <option value="2">Revisada Oficina Extranjera</option>
                <option value="3">Enviada a Reparo</option>
                <option value="4">Rechazada</option>
                <option value="5">Revisada Oficina Local</option>
                <option value="6">Aprobada</option>
               </select>            
          </tr>          
         <tr> 
            <td>&nbsp;</td>
            <td width="20%" nowrap> 
              <div align="right">Oficial:</div>
            </td>
            <td width="70%" nowrap> 
            	<input type="text" name="SWDOF1"  size="4" maxlength="3" >
             </td>
          </tr>
         <tr> 
            <td>&nbsp;</td>
            <td width="20%" nowrap> 
              <div align="right">Oficina:</div>
            </td>
            <td width="70%" nowrap> 
            	<input type="text" name="SWDOBR"  size="5" maxlength="4" >
             </td>
          </tr>
          <tr> 
            <td width="10%" align="center">&nbsp;</td>
            <td width="20%" nowrap> 
              <div align="right"> Fecha Ingreso: </div>
            </td>
            <td width="70%" nowrap> 
              <input type="text" size="2" maxlength="2" name="RWDFRM" onKeypress="enterInteger()">
              <input type="text" size="2" maxlength="2" name="RWDFRD" onKeyPress="enterInteger()">
              <input type="text" size="2" maxlength="2" name="RWDFRY" onKeyPress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].RWDFRM,document.forms[0].RWDFRD,document.forms[0].RWDFRY)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
              Hasta: 
              <input type="text" size="2" maxlength="2" name="RWDTOM" onKeypress="enterInteger()">
              <input type="text" size="2" maxlength="2" name="RWDTOD" onKeyPress="enterInteger()">
              <input type="text" size="2" maxlength="2" name="RWDTOY" onKeyPress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].RWDTOM,document.forms[0].RWDTOD,document.forms[0].RWDTOY)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>


          <p align="center"> 
            <input id="EIBSBTN" type=submit name="Submit" value="Submit">
          </p>
      
</form>
</body>
</html>
