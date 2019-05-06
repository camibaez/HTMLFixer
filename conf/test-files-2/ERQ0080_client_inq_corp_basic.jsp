<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Información Básica</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "client" class= "datapro.eibs.beans.ERQ008002Message" scope="session" />

<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />

<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   builtNewMenu(erq_client_inq_corp_opt);

</SCRIPT>
 
</head>

<body bgcolor="#FFFFFF">

<SCRIPT> initMenu();  </SCRIPT>

 
<h3 align="center">Informaci&oacute;n Cliente Jur&iacute;dica<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="client_inq_corp_basic, ERQ0080" ></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERQ0080">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="12">
  <h4>Articles of Incorporation</h4>
  <table  class="tableinfo">
      <tr > 
        <td nowrap> 
          
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
          <tr id="trdark"> 
            <td nowrap  width="23%"> 
              <div align="right">No. Cliente :</div>
            </td>
            <td nowrap  colspan=3> 
              <input type="text" readonly name="E02CUN" size="10" maxlength="9" value="<%= client.getE02CUN()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="44%"> 
              <div align="right">Nombre Legal :</div>
            </td>
            <td nowrap   width="56%"> 
              <input type="text" readonly name="E02NA1" size="50" maxlength="45" value="<%= client.getE02NA1().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap  width="44%"> 
              <p align="right">Nombre Corto :</p>
            </td>
            <td nowrap  width="56%"> 
              <input type="text" readonly name="E02SHN" size="16" maxlength="15" value="<%= client.getE02SHN().trim()%>">
            </td>
          </tr>
        </table>
        </td>
      </tr>
    </table>
    <h4>Direcci&oacute;n</h4>
  <table  class="tableinfo">
      <tr > 
        <td nowrap> 
          <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
            <tr id="trdark"> 
              <td nowrap  width="39%" > 
                <div align="right">Direcci&oacute;n Principal :</div>
              </td>
              <td nowrap  width="61%" > 
                <input type="text" readonly name="E02NA2" size="36" maxlength="35" value="<%= client.getE02NA2().trim()%>">
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap  width="39%" > 
                <div align="right"></div>
              </td>
              <td nowrap width="61%" > 
                <input type="text" readonly name="E02NA3" size="36" maxlength="35" value="<%= client.getE02NA3().trim()%>">
              </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap  width="39%" > 
                <div align="right"></div>
              </td>
              <td nowrap  width="61%" > 
                <input type="text" readonly name="E02NA4" size="36" maxlength="35" value="<%= client.getE02NA4().trim()%>">
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="39%" > 
                <div align="right">Ciudad :</div>
              </td>
              <td nowrap  width="61%" > 
                <input type="text" readonly name="E02CTY" size="31" maxlength="30" value="<%= client.getE02CTY().trim()%>">
              </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap  width="39%"> 
                <div align="right">Pa&iacute;s :</div>
              </td>
              <td nowrap  width="61%"> 
                <input type="text" readonly name="E02CTR" size="21" maxlength="20" value="<%= client.getE02CTR().trim()%>">
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap  width="39%"> 
                <div align="right">Tipo de Correo :</div>
              </td>
              <td nowrap  width="61%"> 
                <input type="text" readonly name="E02MLC" size="5" maxlength="4" value="<%= client.getE02MLC().trim()%>">
              </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap width="39%"> 
                <div align="right">E-Mail :</div>
              </td>
              <td nowrap  width="61%"> 
                <input type="text" readonly name="E02IAD" size="41" maxlength="40" value="<%= client.getE02IAD().trim()%>">
                Niega Informaci&oacute;n<input type="checkbox" name="E02FLA" disabled value="<%= client.getE02FLA().trim()%>" <%if (client.getE02FLA().equals("X")) out.print("checked"); %>> 
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    <h4>Identificati&oacute;n</h4>
    <table  class="tableinfo">
      <tr > 
        <td  nowrap> 
          
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
          <tr id="trdark"> 
            <td nowrap width="23%"> 
              <div align="right">Tax ID Number :</div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" readonly name="E02IDF" size="16" maxlength="15" value="<%= client.getE02IDF().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap  rowspan="2"> 
              <div align="right">No. Identificaci&oacute;n :</div>
            </td>
            <td nowrap  rowspan="2"> 
              <input type="text" readonly name="E02IDN" size="16" maxlength="15" value="<%= client.getE02IDN().trim()%>">
            </td>
            <td nowrap width="10%"> 
              <div align="right">Tipo :</div>
            </td>
            <td nowrap  width="47%"> 
              <input type="text" readonly name="D02TID" size="35" maxlength="35" value="<%= client.getD02TID().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="10%"> 
              <div align="right">Pa&iacute;s :</div>
            </td>
            <td nowrap  width="47%"> 
              <input type="text" readonly name="D02PID" size="35" maxlength="35" value="<%= client.getD02PID().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="21%"> 
              <div align="right">Fecha de Edici&oacute;n :</div>
            </td>
            <td nowrap width="21%"> 
				<input type="text" readonly name="E02I11" size="2" maxlength="2" value="<%= client.getE02I11().trim()%>" >            
				<input type="text" readonly name="E02I12" size="2" maxlength="2" value="<%= client.getE02I12().trim()%>" >
				<input type="text" readonly name="E02I13" size="2" maxlength="2" value="<%= client.getE02I13().trim()%>" >
				 
 			</td>
            <td nowrap width="9%"> 
              <div align="right">Fecha de Expiraci&oacute;n :</div>
            </td>
            <td nowrap colspan="3"> 
				<input type="text" readonly name="E02E11" size="2" maxlength="2" value="<%= client.getE02E11().trim()%>" >            
				<input type="text" readonly name="E02E12" size="2" maxlength="2" value="<%= client.getE02E12().trim()%>" >
				<input type="text" readonly name="E02E13" size="2" maxlength="2" value="<%= client.getE02E13().trim()%>" >
				
            </td>
		</tr>
          <tr id="trclear">            
            <td nowrap width="12%"> 
              <div align="right">Estado :</div>
            </td>
            <td nowrap width="20%"> 
                <input type="text" readonly name="E02SI1" size="5" maxlength="4" value="<%= client.getE02SI1().trim()%>">
                
            </td>
          </tr>         
          
        </table>
        </td>
      </tr>
    </table>
    <h4>Fechas</h4>
    <table  class="tableinfo">
      <tr > 
        <td nowrap> 
          
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
          <tr id="trdark"> 
            <td nowrap width="21%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="3%"> 
              <div align="center"><font size="1">Mes</font> </div>
            </td>
            <td nowrap width="2%"> 
              <div align="center">D&iacute;a</div>
            </td>
            <td nowrap width="4%">A&ntilde;o</td>
            <td nowrap width="70%">&nbsp;</td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="21%"> 
              <div align="right">Fecha de Fundaci&oacute;n :</div>
            </td>
            <td nowrap width="3%"> 
              <input type="text" readonly name="E02BDM" size="2" maxlength="2" value="<%= client.getE02BDM().trim()%>">
            </td>
            <td nowrap width="2%"> 
              <input type="text" readonly name="E02BDD" size="2" maxlength="2" value="<%= client.getE02BDD().trim()%>">
            </td>
            <td nowrap width="4%"> 
              <input type="text" readonly name="E02BDY" size="4" maxlength="4" value="<%= client.getE02BDY().trim()%>">
            </td>
            <td nowrap width="70%">&nbsp;</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%"> 
              <div align="right">Fecha del Primer Contacto :</div>
            </td>
            <td nowrap colspan="4"> 
              <input type="text" readonly name="E02IDM" size="2" maxlength="2" value="<%= client.getE02IDM().trim()%>">
              <input type="text" readonly name="E02IDD" size="2" maxlength="2" value="<%= client.getE02IDD().trim()%>">
              <input type="text" readonly name="E02IDY" size="2" maxlength="2" value="<%= client.getE02IDY().trim()%>">
            </td>
          </tr>
        </table>
        </td>
      </tr>
    </table>
    <h4>Tel&eacute;lefonos</h4>
    <table  class="tableinfo">
      <tr > 
        <td nowrap> 
          <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
            <tr id="trdark"> 
              <td nowrap width="42%"> 
                <div align="right">Tel&eacute;lefono Oficina 1 :</div>
              </td>
              <td nowrap width="58%">  
                <input type="text" readonly name="E02HPN" size="12" maxlength="11" value="<%= client.getE02HPN().trim()%>">
                </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap  width="42%"> 
                <div align="right">Tel&eacute;lefono Oficina 2 :</div>
              </td>
              <td nowrap width="58%">  
                <input type="text" readonly name="E02PHN" size="12" maxlength="11" value="<%= client.getE02PHN().trim()%>">
                </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap width="42%"> 
                <div align="right">Fax :</div>
              </td>
              <td nowrap width="58%">  
                <input type="text" readonly name="E02FAX" size="12" maxlength="11" value="<%= client.getE02FAX().trim()%>">
                </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="42%"> 
                <div align="right">Celular :</div>
              </td>
              <td nowrap width="58%">  
                <input type="text" readonly name="E02PH1" size="12" maxlength="11" value="<%= client.getE02PH1().trim()%>">
                </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    <h4>C&oacute;digo de Clasificaci&oacute;n</h4>
    <table class="tableinfo">
      <tr> 
        <td nowrap> 
          
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left" bordercolor="#FFFFFF" bgcolor="#FFFFFF">
          <tr id="trdark"> 
            <td nowrap width="42%"> 
              <div align="right">Oficial Primario :</div>
            </td>
            <td nowrap width="58%" > 
              <input type="text" readonly name="D02OFC" size="35" maxlength="35" value="<%= client.getD02OFC().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="42%"> 
              <div align="right">Oficial Sustituto :</div>
            </td>
            <td nowrap width="58%" > 
              <input type="text" readonly name="D02OF2" size="35" maxlength="35" value="<%= client.getD02OF2().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="42%"> 
              <div align="right">C&oacute;digo de Industria :</div>
            </td>
            <td nowrap width="58%" > 
              <input type="text" readonly name="D02INC" size="35" maxlength="35" value="<%= client.getD02INC().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="42%"> 
              <div align="right">C&oacute;digo de Negocio :</div>
            </td>
            <td nowrap width="58%" > 
              <input type="text" readonly name="D02BUC" size="35" maxlength="35" value="<%= client.getD02BUC().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="42%"> 
              <div align="right">Pa&iacute;s de Residencia :</div>
            </td>
            <td nowrap width="58%" > 
              <input type="text" readonly name="D02GEC" size="35" maxlength="35" value="<%= client.getD02GEC().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="42%"> 
              <div align="right">Promotor :</div>
            </td>
            <td nowrap  width="58%" > 
              <input type="text" readonly name="D02UC1" size="35" maxlength="35" value="<%= client.getD02UC1().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="42%"> 
              <div align="right">Gerente :</div>
            </td>
            <td nowrap width="58%" > 
              <input type="text" readonly name="D02UC2" size="35" maxlength="35" value="<%= client.getD02UC2().trim()%>">
            </td>
          </tr>
        </table>
        </td>
      </tr>
    </table>
    
  <h4>Datos Operativos</h4>
    <table class="tableinfo">
      <tr > 
        <td  nowrap> 
          
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
          <tr id="trclear"> 
            <td nowrap  width="28%"> 
              <div align="right">Tipo de Cliente :</div>
            </td>
            <td nowrap width="28%" bordercolor="#FFFFFF"> 
              <input type="text" readonly name="E02TYP" size="10" maxlength="10" 
    		  value="<% if (client.getE02TYP().equals("R")) { out.print("Regular"); }
						else if (client.getE02TYP().equals("M")) { out.print("Master"); }
		                else if (client.getE02TYP().equals("G")) { out.print("Grupo"); }
						else { out.print(""); } %>">
            <td nowrap  width="22%"> 
              <div align="right">No. Grupo :</div>
            </td>
            <td nowrap  width="22%"> 
              <input type="text" readonly name="E02GRP" size="10" maxlength="9" value="<%= client.getE02GRP().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="28%"> 
              <div align="right">Tipo de Corporación :</div>
            </td>
            <td nowrap> 
             	  <input type="text" name="E02SPF" readonly value="<% if(client.getE02SPF().equals("4")) out.print("Corporation - For Profit");
              				else if(client.getE02SPF().equals("5")) out.print("Corporation - Nonprofit");
              				else if(client.getE02SPF().equals("6")) out.print("Partnership");
              				else if(client.getE02SPF().equals("7")) out.print("Sole Proprietorship");
              				else if(client.getE02SPF().equals("8")) out.print("Limited Liability Company");
							else if(client.getE02SPF().equals("9")) out.print("Trust-Separate Agreement Dated");%>" size="30"> 
            </td>
            <td nowrap> 
              <div align="right"></div>
            </td>
            <td nowrap> 

            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap  width="28%"> 
              <div align="right">Lenguaje :</div>
            </td>
            <td nowrap width="28%" bordercolor="#FFFFFF"> 
              <input type="text" readonly name="E02LIF" size="10" maxlength="10" 
			  value="<% if (client.getE02LIF().equals("E")) { out.print("Inglés"); } 
                		else if (client.getE02LIF().equals("S")) { out.print("Español"); }
						else { out.print(""); } %>" >
            </td>
            <td nowrap  width="22%"> 
              <div align="right">Area de Negocio</div>
            </td>
            <td nowrap width="22%"> 
              <input type="text" name="E02FL3" size="2" readonly maxlength="1" value="<%= client.getE02FL3().trim()%>">
            </td>
          </tr>
          
        </table>
        </td>
      </tr>
    </table>
    <h4>Miscelaneos</h4>
    <table  class="tableinfo">
      <tr > 
        <td  nowrap> 
          
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
          <tr id="trclear">
            <td nowrap  width="18%" >
              <div align="right">Cliente de Tesorer&iacute;a :</div>
            </td>
            <td nowrap width="39%">
              <input type="text" readonly name="E02FL5" size="4" maxlength="3" 
			value="<% if (client.getE02FL5().trim().equals("Y")) { out.print("Si"); } 
                		   else if (client.getE02FL5().trim().equals("N")) { out.print("No"); }
				   else { out.print("No"); } %>">
            </td>
            <td nowrap> 
              <div align="right"></div>
            </td>
            <td nowrap> 
            
            </td>
          </tr>
        </table>
        </td>
      </tr>
    </table> 
    
  </form>
</body>
</html>
