<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<%@ page import = "datapro.eibs.master.Util" %>
<head>
<title>Cliente Personal</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="client" class="datapro.eibs.beans.ERQ008001Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>


   <SCRIPT Language="Javascript">
       
      builtNewMenu(erq_client_inq_personal_opt);

	   function checkDel(obj){
	     if (obj.checked) obj.value="X"; else obj.value="";
	   }

		function checkYearFormat(s,lng){
			if (!isYearFormat(s,lng)) {
				alert("El a�o tiene que ser de 4 d�gitos");
				event.srcElement.focus();
			}
		}
        
   </SCRIPT>


</head>

<body bgcolor="#FFFFFF">

 <% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0") ;
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 if ( !userPO.getPurpose().equals("NEW") ) {
    out.println("<SCRIPT> initMenu();  </SCRIPT>");
 }
%>

<h3 align="center">Consulta de Clientes Individuales<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="client_inq_personal_basic, ESD0080" ></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.request.JSERQ0080" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
    <INPUT TYPE=HIDDEN NAME="E01STS" VALUE="<%= client.getE01STS()%>">
    <INPUT TYPE=HIDDEN NAME="E01LGT" VALUE="<%= client.getE01LGT()%>">
    
  </p>
  <h4>Identificaci&oacute;n</h4>
    
  <table  class="tableinfo">
    <tr> 
      <td nowrap > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right">N&uacute;mero Solicitud :</div>
            </td>
            <td nowrap colspan="5"> 
              <input type="text" name="E01RQN" size="16" maxlength="9" value="<%= client.getE01RQN().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="16%"> 
              <div align="right">No. Ident. :</div>
            </td>
            <td nowrap width="24%"> 
              <input type="text" name="E01IDN" size="16" maxlength="15" value="<%= client.getE01IDN().trim()%>" readonly>
            </td>
            <td nowrap width="7%"> 
              <div align="right">Tipo :</div>
            </td>
            <td nowrap width="19%"> 
              <input type="text" name="E01TID" size="8" maxlength="4" value="<%= client.getE01TID().trim()%>" readonly>
            </td>
            <td nowrap width="10%"> 
              <div align="right">Pa&iacute;s :</div>
            </td>
            <td nowrap width="24%"> 
              <input type="text" name="E01PID" size="8" maxlength="4" value="<%= client.getE01PID().trim()%>" readonly>
            </td>
          </tr>
         <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right">Fecha de Expedici&oacute;n :</div>
            </td>
            <td nowrap width="24%"> 
				<input type="text" name="E01I11" size="2" maxlength="2" value="<%= client.getE01I11().trim()%>" readonly>            
				<input type="text" name="E01I12" size="2" maxlength="2" value="<%= client.getE01I12().trim()%>" readonly>
				<input type="text" name="E01I13" size="2" maxlength="2" value="<%= client.getE01I13().trim()%>" readonly>
             </td>
            <td nowrap width="7%"> 
              <div align="right">Fecha de Expiraci&oacute;n :</div>
            </td>
            <td nowrap width="19%"> 
				<input type="text" name="E01E11" size="2" maxlength="2" value="<%= client.getE01E11().trim()%>" readonly>            
				<input type="text" name="E01E12" size="2" maxlength="2" value="<%= client.getE01E12().trim()%>" readonly>
				<input type="text" name="E01E13" size="2" maxlength="2" value="<%= client.getE01E13().trim()%>" readonly>
             </td>
            <td nowrap width="10%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="24%"> 
             </td>
          </tr>          
        </table>
      </td>
    </tr>
  </table>  
  <h4>Informaci&oacute;n B&aacute;sica </h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
			
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">No Cliente :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E01CUN" size="15" maxlength="10" value="<%= client.getE01CUN().trim()%>" readonly>
             </td>  
          </tr>
		 <% if(datapro.eibs.master.JSEIBSProp.getCustomerInfoInputFormat().equals("short")) { %> 
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Nombre :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E01NA1" size="35" maxlength="45" value="<%= client.getE01NA1().trim()%>" readonly>
            </td>
          </tr>
		<%}%>	
		 <% if(datapro.eibs.master.JSEIBSProp.getCustomerInfoInputFormat().equals("long")) { %> 
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Primer Nombre :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E01FNA" size="25" maxlength="20" value="<%= client.getE01FNA().trim()%>" readonly>

            </td>
          </tr>
		<%}%>	
		 <% if(datapro.eibs.master.JSEIBSProp.getCustomerInfoInputFormat().equals("long")) { %> 
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Segundo Nombre :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E01FN2" size="25" maxlength="20" value="<%= client.getE01FN2().trim()%>" readonly>
              
            </td>
          </tr>
		<%}%>	
		 <% if(datapro.eibs.master.JSEIBSProp.getCustomerInfoInputFormat().equals("long")) { %> 
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Apellido :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E01LN1" size="35" maxlength="30" value="<%= client.getE01LN1().trim()%>" readonly>
            </td>
          </tr>
		<%}%>	

			
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Nombre Corto :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E01SHN" size="25" maxlength="15" value="<%= client.getE01SHN().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Sexo :</div>
            </td>
            <td nowrap> 
              <input disabled type="radio" name="E01SEX" value="F" <%if (client.getE01SEX().equals("F")) out.print("checked"); %>>
              Femenino 
              <input disabled type="radio" name="E01SEX" value="M" <%if (!client.getE01SEX().equals("F")) out.print("checked"); %>>
              Masculino </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Estado Civil :</div>
            </td>
            <td nowrap> 
			  <input type="text" readonly name="E01MST" size="13" maxlength="13"
                  value="<% if (client.getE01MST().equals("1")) { out.print("Soltero(a)"); }
							else if (client.getE01MST().equals("2")) { out.print("Casado(a)"); }
	                    	else if (client.getE01MST().equals("3")) { out.print("Divorciado(a)"); }
							else if (client.getE01MST().equals("4")) { out.print("Viudo(a)"); }
							else if (client.getE01MST().equals("5")) { out.print("Cohabitante"); }
							else { out.print(""); } %>" >              
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Nationalidad :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E01CCS" size="6" maxlength="4" value="<%= client.getE01CCS().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Dependientes :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E01NSO" size="4" maxlength="2" value="<%= client.getE01NSO().trim()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Direcci&oacute;n</h4>
    
  <table  class="tableinfo">
    <tr > 
        <td nowrap >

        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="32%" > 
              <div align="right">Direcci&oacute;n :</div>
            </td>
				<td nowrap width="68%" colspan="3">
					<input type="text" name="E01NA2" size="45" maxlength="35" value="<%= client.getE01NA2().trim()%>" readonly>
				</td>
			</tr>
          <tr id="trclear"> 
            <td nowrap width="32%"> 
              <div align="right"></div>
            </td>
				<td nowrap width="68%" colspan="3"><input type="text" name="E01NA3"
					size="45" maxlength="35" value="<%= client.getE01NA3().trim()%>" readonly></td>
			</tr>
          <tr id="trdark"> 
            <td nowrap width="32%"> 
              <div align="right"></div>
            </td>
				<td nowrap width="68%" colspan="3"><input type="text" name="E01NA4"
					size="45" maxlength="35" value="<%= client.getE01NA4().trim()%>" readonly></td>
			</tr>
          <tr id="trclear"> 
            <td nowrap width="32%"> 
              <div align="right">Ciudad :</div>
            </td>
				<td nowrap width="68%" colspan="3"><input type="text" name="E01CTY"
					size="30" maxlength="30" value="<%= client.getE01CTY().trim()%>" readonly> </td>
			</tr>
 		 <tr id="trdark"> 
		    <td nowrap width="32%"> 
              <div align="right">Pa&iacute;s :</div>
            </td>
            <td nowrap width="68%" colspan="3"> 
              <input type="text" name="E01CTR" size="21" maxlength="20" value="<%= client.getE01CTR().trim()%>" readonly>
            </td>
			</tr>          
          <tr id="trclear"> 
            <td nowrap width="32%"> 
              <div align="right">Apartado Postal :</div>
            </td>
				<td nowrap width="68%" colspan="3"><input type="text" name="E01POB"
					size="15" maxlength="10" value="<%= client.getE01POB().trim()%>"
					readonly></td>
			</tr>
          <tr id="trclear"> 
            <td nowrap width="32%"> 
              <div align="right">C&oacute;digo de Correo :</div>
            </td>
				<td nowrap width="68%" colspan="3"><input type="text" name="E01MLC" size="6" maxlength="4"
					value="<%= client.getE01MLC().trim()%>" readonly></td>
			</tr>
          <tr id="trdark"> 
            <td nowrap width="32%"> 
              <div align="right">E-mail :</div>
            </td>
				<td nowrap width="68%" colspan="3"><input type="text" name="E01IAD"	size="30" maxlength="40" value="<%= client.getE01IAD().trim()%>" readonly>
				Niega Informaci&oacute;n<input type="checkbox" name="E01FLA" disabled value="<%= client.getE01FLA().trim()%>" <%if (client.getE01FLA().equals("X")) out.print("checked");%>
					></td>
			</tr>
        </table></td>
      </tr>
    </table>
    

  <h4>Fechas</h4>
    
  <table  class="tableinfo">
    <tr > 
        <td nowrap > 
          
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">
          <tr id="trdark"> 
            <td nowrap height="15" width="11%"> 
              <div align="right"></div>
            </td>
            <td nowrap height="15"> 
              <div align="center"><font size="1">Mes</font> </div>
            </td>
            <td nowrap height="15"> 
              <div align="center">D&iacute;a</div>
            </td>
            <td nowrap height="15"> 
              <div align="center">A&ntilde;o</div>
            </td>
            <td nowrap height="15">&nbsp;</td>
            <td nowrap height="15" width="25%"> 
              <div align="right"></div>
            </td>
            <td nowrap height="15" width="27%">&nbsp; </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="11%"> 
              <div align="right">Fecha de Nacimiento :</div>
            </td>
            <td nowrap width="3%"> 
              <input type="text" name="E01BDM" size="3" maxlength="2" value="<%= client.getE01BDM().trim()%>" readonly>
            </td>
            <td nowrap width="3%"> 
              <input type="text" name="E01BDD" size="3" maxlength="2" value="<%= client.getE01BDD().trim()%>" readonly>
            </td>
            <td nowrap width="3%"> 
              <input type="text" name="E01BDY" size="5" maxlength="4" value="<%= client.getE01BDY().trim()%>" readonly onChange="checkYearFormat(this.value,'4')">
            </td>
            <td nowrap width="28%"> 
            </td>
            <td nowrap width="25%">
              <div align="right">Fecha 1er Contacto :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" name="E01IDM" size="3" maxlength="2" value="<%= client.getE01IDM().trim()%>" readonly>
              <input type="text" name="E01IDD" size="3" maxlength="2" value="<%= client.getE01IDD().trim()%>" readonly>
              <input type="text" name="E01IDY" size="3" maxlength="2" value="<%= client.getE01IDY().trim()%>" readonly>
            </td>
          </tr>
        </table>
          
        </td>
      </tr>
    </table>
    
  <h4>Tel&eacute;fonos</h4>
    
  <table  class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">
          <tr id="trdark"> 
            <td nowrap width="27%"> 
              <div align="right">Casa :</div>
            </td>
            <td nowrap width="21%"> 
              <input type="text" name="E01HPN" size="12" maxlength="11" value="<%= client.getE01HPN().trim()%>" readonly>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Oficina :</div>
            </td>
            <td nowrap width="23%"> 
              <input type="text" name="E01PHN" size="12" maxlength="11" value="<%= client.getE01PHN().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="27%" > 
              <div align="right">Fax :</div>
            </td>
            <td nowrap width="21%" > 
              <input type="text" name="E01FAX" size="12" maxlength="11" value="<%= client.getE01FAX().trim()%>" readonly>
            </td>
            <td nowrap width="29%" > 
              <div align="right">Celular :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01PH1" size="12" maxlength="11" value="<%= client.getE01PH1().trim()%>" readonly>
            </td>
          </tr>
        </table>
        </td>
    </tr>
  </table>
    
  <h4>C&oacute;digos de Clasificaci&oacute;n Codes</h4>
    
  <table  class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0"  align="center">
          <tr id="trclear"> 
            <td nowrap width="29%"> 
              <div align="right">C&oacute;digo de Industria :</div>
            </td>
            <td nowrap width="17%"> 
              <input type="text" name="E01INC" size="5" maxlength="3" value="<%= client.getE01INC().trim()%>" readonly>
            </td>
            <td nowrap width="33%"> 
              <div align="right">C&oacute;digo de Negocio :</div>
            </td>
            <td nowrap width="21%"> 
              <input type="text" name="E01BUC" size="5" maxlength="3" value="<%= client.getE01BUC().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="29%"> 
              <div align="right">Pa&iacute;s de Residencia :</div>
            </td>
            <td nowrap width="17%"> 
              <input type="text" name="E01GEC" size="5" maxlength="3" value="<%= client.getE01GEC().trim()%>" readonly>
            </td>
            <td nowrap width="33%"> 
              <div align="right">Promotor :</div>
            </td>
            <td nowrap width="21%"> 
              <input type="text" name="E01UC1" size="5" maxlength="3" value="<%= client.getE01UC1().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%"> 
              <div align="right">Gerente :</div>
            </td>
            <td nowrap width="17%"> 
              <input type="text" name="E01UC2" size="5" maxlength="3" value="<%= client.getE01UC2().trim()%>" readonly>
            </td>
            <td nowrap width="33%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="21%"> 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Informaci&oacute;n Adicional</h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="28%"> 
              <div align="right">Nivel de Educaci&oacute;n :</div>
            </td>
            <td nowrap width="21%"> 
              <input type="text" name="E01EDL" size="5" maxlength="4" value="<%= client.getE01EDL().trim()%>" readonly>
            </td>
            <td nowrap width="30%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="21%"> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="28%"> 
              <div align="right">Nivel de Ingreso :</div>
            </td>
            <td nowrap width="21%">     
              <input type="text" readonly  name="E01INL" size="21" maxlength="20" 
              value="<% if (client.getE01INL().equals("1")) { out.print("0 - 50.000"); }
							else if (client.getE01INL().equals("2")) { out.print("50.000 - 100.000"); }
							else if (client.getE01INL().equals("3")) { out.print("100.000 - 250.000"); }
							else if (client.getE01INL().equals("4")) { out.print("Sobre 250.000"); }
							else { out.print(""); } %>">
            </td>
            <td nowrap width="30%"> 
              <div align="right">Fuente de Ingreso :</div>
            </td>
            <td nowrap width="21%"> 
              <input type="text" name="E01SOI" size="5" maxlength="4" value="<%= client.getE01SOI().trim()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Datos Operativos</h4>
    
  <table  class="tableinfo">
    <tr > 
        <td nowrap >
          
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">
 
            <tr id="trclear"> 
              
            <td nowrap width="23%" > 
              <div align="right">Tipo de Cliente :</div>
              </td>
              
            <td nowrap width="36%" > 
              <input disabled type="radio" name="E01TYP" value="R" <%if (!(client.getE01TYP().equals("M") || client.getE01TYP().equals("G"))) out.print("checked"); %>>
              Regular 
              <input disabled type="radio" name="E01TYP" value="M" <%if (client.getE01TYP().equals("M")) out.print("checked"); %>>
              Master 
              <input disabled type="radio" name="E01TYP" value="G" <%if (client.getE01TYP().equals("G")) out.print("checked"); %>>
              Grupo  
            </td>
              
            <td nowrap width="25%" > 
              <div align="right">No. de Grupo :</div>
              </td>
              
            <td nowrap width="16%" > 
              <input type="text" name="E01GRP" size="10" maxlength="9" value="<%= client.getE01GRP().trim()%>" readonly>
              </td>
            </tr>
            <tr id="trdark"> 
              
            <td nowrap width="23%"> 
              <div align="right">Idioma :</div>
              </td>
              
            <td nowrap width="36%"> 
              <input disabled type="radio" name="E01LIF" value="S" <%if (client.getE01LIF().equals("S")) out.print("checked"); %>>
              Espa&ntilde;ol 
              <input disabled type="radio" name="E01LIF" value="E" <%if (!client.getE01LIF().equals("S")) out.print("checked"); %>>
              Ingl&eacute;s 
            </td>
              
            <td nowrap width="25%"> 
              <div align="right"></div>
              </td>
              
            <td nowrap width="16%"> 
            </td>
            </tr>


          </table>
        </td>
      </tr>
    </table>
    
  <h4>Miscelaneos</h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap  > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">
          <tr id="trclear"> 
            <td nowrap   width="20%"> 
              <div align="right">Tarjeta ATM :</div>
            </td>
            <td nowrap  width="37%"> 
             <input disabled type="radio" name="E01ATM" value="1"  <%if (client.getE01ATM().equals("1")) out.print("checked"); %>>
              Standard 
              <input disabled type="radio" name="E01ATM" value="2"  <%if (client.getE01ATM().equals("2")) out.print("checked"); %>>
              Platinum
              <input disabled type="radio" name="E01ATM" value="N"  <%if (client.getE01ATM().equals("N")) out.print("checked"); %>>
              Ninguno
            </td>
            <td nowrap   width="17%"> 
              <div align="right">Tipo Rel. Familiar :</div>
            </td>
            <td nowrap   width="26%"> 
			 <input type="text" readonly name="E01FL3" size="15" maxlength="15"
              value="<% if (client.getE01FL3().equals("1")) { out.print("Ninguno"); }
						else if (client.getE01FL3().equals("2")) { out.print("Primo"); }
						else if (client.getE01FL3().equals("3")) { out.print("Padre"); }
						else if (client.getE01FL3().equals("4")) { out.print("Madre"); }
               			else if (client.getE01FL3().equals("5")) { out.print("Hermano(a)"); }
						else if (client.getE01FL3().equals("6")) { out.print("Esposo(a)"); }
               			else if (client.getE01FL3().equals("7")) { out.print("Abuelos"); }
						else { out.print(""); } %>" >              
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>

 
</form>
</body>
</html>
