<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<title>Cliente Jurídico</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id="client" class="datapro.eibs.beans.ERQ008002Message" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

   <SCRIPT Language="Javascript">

      builtNewMenu(erq_client_corp_opt);

	   function checkDel(obj){
	     if (obj.checked) obj.value="X"; else obj.value="";
	   }

 		function checkYearFormat(s,lng){
			if (!isYearFormat(s,lng)) {
				alert("El año debe ser de 4 dígitos");
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


<h3 align="center">Información Básica de Clientes Corporativos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="client_corp_basic, ERQ0080" ></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.request.JSERQ0080">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="12">
  <h4>Raz&oacute;n Social</h4>
  <table class="tableinfo">
      <tr >
        <td nowrap>

        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
          <tr id="trdark">
            <td nowrap width="39%" >
              <div align="right">No. Cliente Local :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" name="E02CUN" size="10" maxlength="9" value="<%= client.getE02CUN()%>">

             </td>
            <td width="38%">&nbsp; </td>
          </tr>
          <tr id="teclear">
            <td nowrap width="39%">
              <div align="right">Nombre Legal :</div>
            </td>
            <td nowrap colspan="2">
              <input type="text" name="E02NA1" size="35" maxlength="45" value="<%= client.getE02NA1().trim()%>">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="39%">
              <div align="right">Nombre Anterior :</div>
            </td>
            <td nowrap colspan="2">
              <input type="text"   name="E02CP1" size="31" maxlength="30" value="<%= client.getE02CP1().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="39%">
              <p align="right">Nombre Corto :</p>
            </td>
            <td nowrap colspan="2">
              <input type="text" name="E02SHN" size="16" maxlength="15" value="<%= client.getE02SHN().trim()%>">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="39%">
              <div align="right">Identificaci&oacute;n de Central de Riesgo : </div>
            </td>
            <td nowrap colspan="2">
              <input type="text"   name="E02FN2" size="31" maxlength="30" value="<%= client.getE02FN2().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="39%">&nbsp;</td>
            <td nowrap colspan="2">
              <div align="left">
                <input type="text"  name="E02LN1" size="31" maxlength="30" value="<%= client.getE02LN1().trim()%>">
              </div>
            </td>
          </tr>
        </table>
        </td>
      </tr>
    </table>

  <h4>Direcci&oacute;n</h4>


  <table class="tableinfo">
      <tr >
        <td nowrap>
          <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
            <tr id="trdark">
              <td nowrap width="39%">

              <div align="right">Direcci&oacute;n Principal :</div>
              </td>
              <td nowrap width="61%">
                <input type="text" name="E02NA2" size="36" maxlength="35" value="<%= client.getE02NA2().trim()%>">
                <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" > </td>
            </tr>
            <tr id="trclear">
              <td nowrap width="39%">
                <div align="right"></div>
              </td>
              <td nowrap width="61%">
                <input type="text" name="E02NA3" size="36" maxlength="35" value="<%= client.getE02NA3().trim()%>">
                </td>
            </tr>
            <tr id="trdark">
              <td nowrap width="39%">
                <div align="right"></div>
              </td>
              <td nowrap width="61%">
                <input type="text" name="E02NA4" size="36" maxlength="35" value="<%= client.getE02NA4().trim()%>">
                </td>
            </tr>
            <tr id="trclear">
              <td nowrap width="39%">

              <div align="right">Ciudad :</div>
              </td>
              <td nowrap width="61%">
                <input type="text" name="E02CTY" size="31" maxlength="30" value="<%= client.getE02CTY().trim()%>">
                <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" ></td>
            </tr>
            <tr id="trdark">
              <td nowrap width="39%">
              <div align="right">Pa&iacute;s :</div>
              </td>
              <td nowrap width="61%">
                <input type="text" name="E02CTR" size="21" maxlength="20" value="<%= client.getE02CTR().trim()%>">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom">
            </td>
            </tr>
             <tr id="trclear">
              <td nowrap width="39%">
              <div align="right">Tipo de Correo :</div>
              </td>
              <td nowrap width="61%">
                <input type="text" name="E02MLC" size="5" maxlength="4" value="<%= client.getE02MLC().trim()%>">
                </td>
            </tr>
            <tr id="trdark">
              <td nowrap width="39%">
              <div align="right">E-Mail :</div>
              </td>
              <td nowrap width="61%">
                <input type="text" name="E02IAD" size="41" maxlength="40" value="<%= client.getE02IAD().trim()%>">
                Denies Information<input type="checkbox" name="E02FLA" value="<%= client.getE02FLA().trim()%>" onClick="checkDel(this)" <%if (client.getE02FLA().equals("X")) out.print("checked"); %>>
                </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>

  <h4>Identificaci&oacute;n </h4>
  <table class="tableinfo">
      <tr >
        <td nowrap>

        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
          <tr id="trdark">
            <td nowrap width="21%">
              <div align="right">Tax ID Number :</div>
            </td>
            <td nowrap colspan="5">
              <input type="text" name="E02IDF" size="16" maxlength="9" value="<%= client.getE02IDF().trim()%>" onkeypress="enterInteger()">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="21%">
              <div align="right">No. Identificaci&oacute;n :</div>
            </td>
            <td nowrap width="21%">
              <input type="text" name="E02IDN" size="16" maxlength="15" value="<%= client.getE02IDN().trim()%>">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom">
            </td>
            <td nowrap width="9%">
              <div align="right">Tipo :</div>
            </td>
            <td nowrap width="17%">
              <input type="text" name="E02TID" size="5" maxlength="4" value="<%= client.getE02TID().trim()%>">
              <a href="javascript:GetCodeCNOFC('E02TID','34')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
            <td nowrap width="12%">
              <div align="right">Pa&iacute;s :</div>
            </td>
            <td nowrap width="20%">
              <input type="text" name="E02PID" size="5" maxlength="4" value="<%= client.getE02PID().trim()%>">
              <a href="javascript:GetCodeCNOFC('E02PID','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="21%">
              <div align="right">Fecha de Edici&oacute;n :</div>
            </td>
            <td nowrap width="21%">
				<input type="text" name="E02I11" size="2" maxlength="2" value="<%= client.getE02I11().trim()%>" onKeyPress="enterInteger()">
				<input type="text" name="E02I12" size="2" maxlength="2" value="<%= client.getE02I12().trim()%>" onKeyPress="enterInteger()">
				<input type="text" name="E02I13" size="2" maxlength="2" value="<%= client.getE02I13().trim()%>" onKeyPress="enterInteger()">
				<a href="javascript:DatePicker(document.forms[0].E02I11,document.forms[0].E02I12,document.forms[0].E02I13)">
				<img src="<%=request.getContextPath()%>/images/calendar.gif" alt="Help" border="0" ></a>
 			</td>
            <td nowrap width="9%">
              <div align="right">Fecha de Expiraci&oacute;n :</div>
            </td>
            <td nowrap width="17%">
				<input type="text" name="E02E11" size="2" maxlength="2" value="<%= client.getE02E11().trim()%>" onKeyPress="enterInteger()">
				<input type="text" name="E02E12" size="2" maxlength="2" value="<%= client.getE02E12().trim()%>" onKeyPress="enterInteger()">
				<input type="text" name="E02E13" size="2" maxlength="2" value="<%= client.getE02E13().trim()%>" onKeyPress="enterInteger()">
				<a href="javascript:DatePicker(document.forms[0].E02E11,document.forms[0].E02E12,document.forms[0].E02E13)">
				<img src="<%=request.getContextPath()%>/images/calendar.gif" alt="Help" border="0" ></a>
            </td>
            <td nowrap width="12%">
              <div align="right">Estado :</div>
            </td>
            <td nowrap width="20%">
                <input type="text" name="E02SI1" size="5" maxlength="4" value="<%= client.getE02SI1().trim()%>">
                <a href="javascript:GetCodeCNOFC('E02SI1','27')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
            </td>
          </tr>
        </table>
        </td>
      </tr>
    </table>

  <h4>Fechas</h4>
  <table class="tableinfo">
      <tr >
        <td nowrap>

        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
          <tr id="trdark">
            <td nowrap width="39%">
              <div align="right"></div>
            </td>
            <td nowrap width="3%">
              <div align="center"><font size="1">Mes</font> </div>
            </td>
            <td nowrap width="2%">
              <div align="center">D&iacute;a</div>
            </td>
            <td nowrap width="4%">
              <div align="center">A&ntilde;o</div>
            </td>
            <td nowrap width="52%">&nbsp;</td>
          </tr>
          <tr id="trdark">
            <td nowrap width="39%">
              <div align="right">Fecha de Fundaci&oacute;n :</div>
            </td>
            <td nowrap width="3%">
              <input type="text" name="E02BDM" size="2" maxlength="2" value="<%= client.getE02BDM().trim()%>" onKeyPress="enterInteger()">
            </td>
            <td nowrap width="2%">
              <input type="text" name="E02BDD" size="2" maxlength="2" value="<%= client.getE02BDD().trim()%>" onKeyPress="enterInteger()">
            </td>
            <td nowrap width="4%">
              <input type="text" name="E02BDY" size="4" maxlength="4" value="<%= client.getE02BDY().trim()%>" onKeyPress="enterInteger()" onChange="checkYearFormat(this.value,'4')">
            </td>
            <td nowrap width="52%"> <a href="javascript:DOBPicker(document.forms[0].E02BDM,document.forms[0].E02BDD,document.forms[0].E02BDY)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="Help" border="0" ></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom">
            </td>
          </tr>
          <tr id="teclear">
            <td nowrap width="39%">
              <div align="right">Fecha del Primer Contacto :</div>
            </td>
            <td nowrap colspan="4">
              <input type="text" name="E02IDM" size="2" maxlength="2" value="<%= client.getE02IDM().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E02IDD" size="2" maxlength="2" value="<%= client.getE02IDD().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E02IDY" size="2" maxlength="2" value="<%= client.getE02IDY().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E02IDM,document.forms[0].E02IDD,document.forms[0].E02IDY)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="Help" border="0" ></a>
            </td>
          </tr>
        </table>
        </td>
      </tr>
    </table>

  <h4>Tel&eacute;lefonos</h4>
  <table class="tableinfo">
      <tr >
        <td nowrap>
          <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
            <tr id="trdark">
              <td nowrap width="44%">

              <div align="right">Tel&eacute;lefono Oficina 1 :</div>
              </td>
              <td nowrap width="56%">
                <input type="text" name="E02HPN" size="12" maxlength="11" value="<%= client.getE02HPN().trim()%>" onkeypress="enterInteger()">
                </td>
            </tr>
            <tr id="teclear">
              <td nowrap width="44%">

              <div align="right">Tel&eacute;lefono Oficina 2 :</div>
              </td>
              <td nowrap width="56%">
                <input type="text" name="E02PHN" size="12" maxlength="11" value="<%= client.getE02PHN().trim()%>" onkeypress="enterInteger()">
                </td>
            </tr>
            <tr id="trdark">
              <td nowrap width="44%">

              <div align="right">Fax :</div>
              </td>
              <td nowrap width="56%">
                <input type="text" name="E02FAX" size="12" maxlength="11" value="<%= client.getE02FAX().trim()%>" onkeypress="enterInteger()">
                </td>
            </tr>
            <tr id="teclear">
              <td nowrap width="44%">

              <div align="right">Celular :</div>
              </td>
              <td nowrap width="56%">
                <input type="text" name="E02PH1" size="12" maxlength="11" value="<%= client.getE02PH1().trim()%>" onkeypress="enterInteger()">
                </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>

  <h4>C&oacute;digo de Clasificaci&oacute;n</h4>
  <table class="tableinfo">
      <tr >
        <td nowrap>

        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left" bordercolor="#FFFFFF" bgcolor="#FFFFFF">
          <tr id="trdark">
            <td nowrap width="22%">
              <div align="right">Oficial Primario :</div>
            </td>
            <td nowrap width="18%">
              <input type="text" name="E02OFC" size="5" maxlength="3" value="<%= client.getE02OFC().trim()%>">
              <a href="javascript:GetCodeCNOFC('E02OFC','15')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" >
            </td>
            <td nowrap width="29%">
              <div align="right">Oficial Sustituto :</div>
            </td>
            <td nowrap width="31%" >
              <input type="text" name="E02OF2" size="5" maxlength="3" value="<%= client.getE02OF2().trim()%>">
              <a href="javascript:GetCodeCNOFC('E02OF2','15')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom"></td>
          </tr>
          <tr id="teclear">
            <td nowrap width="22%">
              <div align="right">C&oacute;digo de Industria :</div>
            </td>
            <td nowrap width="18%">
              <input type="text" name="E02INC" size="5" maxlength="3" value="<%= client.getE02INC().trim()%>">
              <a href="javascript:GetCodeCNOFC('E02INC','09')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"  ></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" ></td>
            <td nowrap width="29%">
              <div align="right">C&oacute;digo de Negocio :</div>
            </td>
            <td nowrap width="31%">
              <input type="text" name="E02BUC" size="5" maxlength="3" value="<%= client.getE02BUC().trim()%>">
              <a href="javascript:GetCodeCNOFC('E02BUC','12')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a><img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom"></td>
          </tr>
          <tr id="trdark">
            <td nowrap width="22%">
              <div align="right">Pa&iacute;s de Residencia :</div>
            </td>
            <td nowrap width="18%">
              <input type="text" name="E02GEC" size="5" maxlength="3" value="<%= client.getE02GEC().trim()%>">
              <a href="javascript:GetCodeCNOFC('E02GEC','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"  ></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" ></td>
            <td nowrap width="29%">
              <div align="right">Promotor :</div>
            </td>
            <td nowrap width="31%" >
              <input type="text" name="E02UC1" size="5" maxlength="3" value="<%= client.getE02UC1().trim()%>">
              <a href="javascript:GetCodeCNOFC('E02UC1','2A')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"  ></a></td>
          </tr>
          <tr id="teclear">
            <td nowrap width="22%">
              <div align="right">Gerente :</div>
            </td>
            <td nowrap width="18%">
              <input type="text" name="E02UC2" size="5" maxlength="3" value="<%= client.getE02UC2().trim()%>">
              <a href="javascript:GetCodeCNOFC('E02UC2','2B')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
            <td nowrap width="29%">
              <div align="right"></div>
            </td>
            <td nowrap width="31%" >
            </td>
          </tr>
        </table>
        </td>
      </tr>
    </table>

  <h4 align="left">Datos Adicionales</h4>
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
          <tr id="trdark">
            <td nowrap n width="22%">
               <div align="right">Tipo de Corporación :</div>
            </td>
            <td nowrap  width="22%">
               <select name="E02SPF">
				<option value=" " <%if (!(client.getE02SPF().equals("4") || client.getE02SPF().equals("5") || client.getE02SPF().equals("6")
				|| client.getE02SPF().equals("7") || client.getE02SPF().equals("8") || client.getE02SPF().equals("9")))	out.print("selected"); %>></option>
                <option value="4" <%if (client.getE02SPF().equals("4")) out.print("selected"); %>>Corporation - For Profit</option>
                <option value="5" <%if (client.getE02SPF().equals("5")) out.print("selected"); %>>Corporation - Nonprofit</option>
                <option value="6" <%if (client.getE02SPF().equals("6")) out.print("selected"); %>>Partnership</option>
                <option value="7" <%if (client.getE02SPF().equals("7")) out.print("selected"); %>>Sole Proprietorship</option>
                <option value="8" <%if (client.getE02SPF().equals("8")) out.print("selected"); %>>Limited Liability Company</option>
                <option value="9" <%if (client.getE02SPF().equals("9")) out.print("selected"); %>>Trust-Separate Agreement</option>
               </select>
             </td>
            <td nowrap width="25%">
              <div align="right"></div>
            </td>
            <td nowrap  width="31%">

            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Datos Operativos</h4>
  <table class="tableinfo">
      <tr >
        <td nowrap>

        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
          <tr id="teclear">
            <td nowrap width="22%">
              <div align="right">Tipo de Cliente :</div>
            </td>
            <td nowrap width="41%" bordercolor="#FFFFFF">
              <input type="radio" name="E02TYP" value="R" <% if (!(client.getE02TYP().equals("M") || client.getE02TYP().equals("G"))) out.print("checked"); %>>
              Regular
              <input type="radio" name="E02TYP" value="M" <% if (client.getE02TYP().equals("M")) out.print("checked"); %>>
              Master
              <input type="radio" name="E02TYP" value="G" <% if (client.getE02TYP().equals("G")) out.print("checked"); %>>
              Grupo <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom"></td>
            <td nowrap width="20%">
              <div align="right">No. Grupo :</div>
            </td>
            <td nowrap width="17%">
              <input type="text" name="E02GRP" size="10" maxlength="9" value="<%= client.getE02GRP().trim()%>" onkeypress="enterInteger()">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="22%">
              <div align="right">Lenguaje :</div>
            </td>
            <td nowrap width="41%" bordercolor="#FFFFFF">
             <input type="radio" name="E02LIF" value="E"  <%if (!client.getE02LIF().equals("S")) out.print("checked"); %>>
              Ingl&eacute;s
              <input type="radio" name="E02LIF" value="S"  <%if (client.getE02LIF().equals("S")) out.print("checked"); %>>
              Espa&ntilde;ol <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom">
			</td>
            <td nowrap width="20%">
              <div align="right">Area de Negocio :</div>
            </td>
            <td nowrap width="17%">
              <input type="text" name="E02FL3" size="2" maxlength="1" value="<%= client.getE02FL3().trim()%>">
            </td>
          </tr>

        </table>
        </td>
      </tr>
    </table>

  <h4>Miscelaneos</h4>
  <table class="tableinfo">
      <tr >
        <td nowrap >

        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
          <tr id="trclear">
            <td nowrap width="18%" >
              <div align="right">Cliente de Tesorer&iacute;a :</div>
            </td>
            <td nowrap width="39%" >
              <input type="radio" name="E02FL5" value="Y"  <%if (client.getE02FL5().equals("Y")) out.print("checked"); %>>
              S&iacute;
              <input type="radio" name="E02FL5" value="N"  <%if (client.getE02FL5().equals("N")) out.print("checked"); %>>
              No <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom"></td>
            <td nowrap width="23%">

            </td>
            <td nowrap width="20%">
            </td>
          </tr>
        </table>
        </td>
      </tr>
    </table>
  <br>

  <p align="center">
   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </p>
</form>
</body>
</html>
