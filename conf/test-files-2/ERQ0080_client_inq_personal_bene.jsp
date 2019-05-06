<html>
<head>
<title>Beneficiarios</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

	     builtNewMenu(erq_client_inq_personal_opt);


</SCRIPT>

</head>

<%
response.setHeader("Pragma", "No-cache");
response.setDateHeader ("Expires", 0);
response.setHeader("Cache-Control", "no-cache");
%>

<jsp:useBean id= "bene" class= "datapro.eibs.beans.ERQ000004Message"  scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<body onbeforeprint="showOpt(true)" onafterprint="showOpt(false)">

 

 <% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
  if ( !userPO.getPurpose().equals("NEW") ) {
    out.println("<SCRIPT> initMenu();</SCRIPT>");
 }
%>

<h3 align="center">Beneficiarios <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="client_inq_personal_bene, ERQ0080"></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERQ0080" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
  
<p>
<table class="tableinfo" >
  <tr > 
    <td> 
      <table cellspacing="0" cellpadding="2" width="100%" class="tbhead" bgcolor="#FFFFFF" bordercolor="#FFFFFF" bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF"  align="center">
        <tr>
             
            <td nowrap width="10%" align="right"> Cliente : </td>
          <td nowrap width="12%" align="left">
      			<%= userPO.getHeader1()%>
          </td>
            <td nowrap width="6%" align="right">ID :  
            </td>
          <td nowrap width="14%" align="left">
      			<%= userPO.getHeader2()%>
          </td>
            <td nowrap width="8%" align="right"> Nombre : </td>
          <td nowrap width="50%"align="left">
      			<%= userPO.getHeader3()%>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</p>
<div id="dataDiv" align="center" style="width:90%; padding-left:50; padding-right:10" class="scbarcolor">
<%
  int bene_amount = 9;
  String name;
  for ( int i=1; i<=bene_amount; i++ ) {
    if ( i == 10 ) {
      name = "A"; 
    }
    else {
      name = i + "";
    }
    
    out.println("<table class=\"tbenter\" border=\"0\" width=\"100%\">");
    out.println("<tr>");
    
    switch ( i ) {
        case 1 :     
%> 
 <td align="left"><h4>Primero</h4></td>
<%          
           break;
        case 2 : 
%> 
 <td align="left"><h4>Segundo</h4></td>
<%          
           break;
        case 3 : 
%> 
<td align="left"><h4>Tercero</h4></td>
<%          
           break;
        case 4 : 
%> 
<td align="left"><h4>Cuarto</h4></td>
<%          
           break;
        case 5 : 
%> 
<td align="left"><h4>Quinto</h4></td>
<%          
           break;
        case 6 : 
%> 
<td align="left"><h4>Sexto</h4></td>
<%          
           break;
        case 7 : 
%> 
<td align="left"><h4>Séptimo</h4></td>
<%          
           break;
        case 8 : 
%> 
<td align="left"><h4>Octavo</h4></td>
<%          
           break;
        case 9 : 
%> 
<td align="left"><h4>Noveno</h4></td>
<%          
           break;
        case 10 : 
%> 
<td align="left"><h4>Décimo</h4></td>
<%          
           break;
     }
  out.println("<td width=\"30%\" align=\"right\">");
  out.println("<h4>");
  out.print("<A href=\"javascript:go(1)\">1</A>,<A href=\"javascript:go(2)\">2</A>,<A href=\"javascript:go(3)\">3</A>,<A href=\"javascript:go(4)\">4</A>,<A href=\"javascript:go(5)\">5</A>,");
  out.print("<A href=\"javascript:go(6)\">6</A>,<A href=\"javascript:go(7)\">7</A>,<A href=\"javascript:go(8)\">8</A>,<A href=\"javascript:go(9)\">9</A>");
   out.println("</h4>"); 
  out.println("</td>");   
  out.println("</tr>");
  out.println("</table>"); 
%>

  <table id="mainTable<%= name %>" class="tableinfo" >
    <tr bgcolor="#FFFFFF" bordercolor="#FFFFFF"> 
      <td> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" name="TB_BENEFICIARY_CORP" bgcolor="#FFFFFF" bordercolor="#FFFFFF" bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF"  align="center">
          <tr id="trdark"> 
            <td width="42%" nowrap> 
              <div align="right">Nombre Legal :</div>
            </td>
            <td nowrap width="58%"> 
              <input type="text" name="E<%= name %>4MA1" maxlength="45" size="46" value="<%= bene.getField("E" + name + "4MA1").getString().trim()%>" readonly>
              </td>
          </tr>
          <tr id="trclear"> 
            <td width="42%" nowrap> 
              <div align="right">Direcci&oacute;n :</div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" name="E<%= name %>4MA2" maxlength="35" size="36" value="<%= bene.getField("E" + name + "4MA2").getString().trim()%>" readonly>
              </td>
          </tr>
          <tr id="trdark"> 
            <td width="42%" nowrap> 
              <div align="right"></div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" name="E<%= name %>4MA3" maxlength="35" size="36" value="<%= bene.getField("E" + name + "4MA3").getString().trim()%>" readonly>
              </td>
          </tr>
          <tr id="trclear"> 
            <td width="42%" nowrap> 
              <div align="right">Ciudad :</div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" name="E<%= name %>4CTY" maxlength="30" size="31" value="<%= bene.getField("E" + name + "4CTY").getString().trim()%>" readonly>
              </td>
          </tr>
          <tr id="trdark"> 
            <td width="42%" nowrap> 
              <div align="right">Estado :</div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" name="E<%= name %>4STE" maxlength="4" size="5" value="<%= bene.getField("E" + name + "4STE").getString().trim()%>" readonly>
              </td>
          </tr>
          <tr id="trclear"> 
            <td width="42%" nowrap> 
              <div align="right">Pa&iacute;s :</div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" name="E<%= name %>4CTR" maxlength="20" size="21" value="<%= bene.getField("E" + name + "4CTR").getString().trim()%>" readonly>
              </td>
          </tr>
          <tr id="trdark"> 
            <td width="42%" nowrap> 
              <div align="right">Apartado Postal :</div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" name="E<%= name %>4POB" maxlength="10" size="11" value="<%= bene.getField("E" + name + "4POB").getString().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="42%" nowrap> 
              <div align="right">C&oacute;digo Postal : </div>
            </td>
            <td width="58%" nowrap>
              <input type="text" name="E<%= name %>4ZPC" maxlength="15" size="16" value="<%= bene.getField("E" + name + "4ZPC").getString().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="42%" nowrap> 
              <div align="right">Ciudadan&iacute;a :</div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" name="E<%= name %>4BNC" maxlength="4" size="5" value="<%= bene.getField("E" + name + "4BNC").getString().trim()%>" readonly>
               </td>
          </tr>
          <tr id="trclear"> 
            <td width="42%" nowrap> 
              <div align="right">Nombramiento :</div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" name="E<%= name %>4MA4" maxlength="35" size="36" value="<%= bene.getField("E" + name + "4MA4").getString().trim()%>" readonly>
              </td>
          </tr>
          <tr id="trdark"> 
            <td width="42%" nowrap> 
              <div align="right">Fecha :</div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" name="E<%= name %>4DT1" maxlength="2" size="2" value="<%= bene.getField("E" + name + "4DT1").getString().trim()%>" readonly>
              <input type="text" name="E<%= name %>4DT2" maxlength="2" size="2" value="<%= bene.getField("E" + name + "4DT2").getString().trim()%>" readonly>
              <input type="text" name="E<%= name %>4DT3" maxlength="2" size="2" value="<%= bene.getField("E" + name + "4DT3").getString().trim()%>" readonly>
              </td>
          </tr>
          <tr id="trclear"> 
            <td width="42%" nowrap > 
              <div align="right">Profesi&oacute;n :</div>
            </td>
            <td width="58%" nowrap > 
              <p> 
                <input type="text" name="E<%= name %>4MLC" value="<%= bene.getField("E" + name + "4MLC").getString().trim()%>" size="5" maxlength="4" readonly>
                </p>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="42%" nowrap> 
              <div align="right">En Calidad de :</div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" name="E<%= name %>4INC" maxlength="4" size="5" value="<%= bene.getField("E" + name + "4INC").getString().trim()%>" readonly>
              </td>
          </tr>
          <tr id="trclear"> 
            <td width="42%" nowrap > 
              <div align="right">Estado Civil :</div>
            </td>
            <td width="58%" nowrap > 
              <select disabled name="E<%= name %>4BMS">
                <option value=1 <% if (bene.getField("E" + name + "4BMS").getString().equals("1")) out.print("selected"); %>>Casado(a)</option>
                <option value=2 <% if (bene.getField("E" + name + "4BMS").getString().equals("2")) out.print("selected"); %>>Soltero(a)</option>
                <option value=3 <% if (bene.getField("E" + name + "4BMS").getString().equals("3")) out.print("selected"); %>>Divorciado(a)</option>
                <option value=4 <% if (bene.getField("E" + name + "4BMS").getString().equals("4")) out.print("selected"); %>>Viudo(a)</option>
                <option value=5 <% if (bene.getField("E" + name + "4BMS").getString().equals("5")) out.print("selected"); %>>Cohabitante</option>
                <option value=0 <% if ( !(bene.getField("E" + name + "4BMS").getString().equals("1") || bene.getField("E" + name + "4BMS").getString().equals("2") || bene.getField("E" + name + "4BMS").getString().equals("3") || bene.getField("E" + name + "4BMS").getString().equals("4") || bene.getField("E" + name + "4BMS").getString().equals("5"))) out.print("selected"); %>></option>
              </select>
              </td>
          </tr>
          <tr id="trdark"> 
            <td width="42%" nowrap> 
              <div align="right">Sexo :</div>
            </td>
            <td width="58%" nowrap> 
              <input disabled type="radio" name="E<%= name %>4BSX" value="F" <% if (bene.getField("E" + name + "4BSX").getString().equals("F")) out.print("checked"); %> checked>
              Femenino 
              <input disabled type="radio" name="E<%= name %>4BSX" value="M" <% if (bene.getField("E" + name + "4BSX").getString().equals("M")) out.print("checked"); %>>
              Masculino </td>
          </tr>
          <tr id="trclear"> 
            <td width="42%" nowrap> 
              <div align="right">Tel&eacute;fono :</div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" name="E<%= name %>4HPN" maxlength="11" size="12" value="<%= bene.getField("E" + name + "4HPN").getString().trim()%>" readonly>
              </td>
          </tr>
          <tr id="trdark"> 
            <td width="42%" nowrap> 
              <div align="right">Identificaci&oacute;n :</div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" name="E<%= name %>4BNI" maxlength="15" size="16" value="<%= bene.getField("E" + name + "4BNI").getString().trim()%>" readonly>
              </td>
          </tr>
          <tr id="trclear"> 
            <td width="42%" > 
              <div align="right">Tipo :</div>
            </td>
            <td width="58%" nowrap > 
              <input type="text" name="E<%= name %>4TID" value="<%= bene.getField("E" + name + "4TID").getString().trim()%>" size="5" maxlength="4" readonly>
              </td>
          </tr>
          <tr id="trdark"> 
            <td width="42%" nowrap> 
              <div align="right">Pa&iacute;s :</div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" name="E<%= name %>4PID" size="5" maxlength="4" value="<%= bene.getField("E" + name + "4PID").getString().trim()%>" readonly>
              </td>
          </tr>
        </table>
        
      </td>
    </tr>
  </table>
  
  <%
  }
%>
</div>
<SCRIPT Language="Javascript">
   showOpt(false);
</SCRIPT>


</form>
</body>
</html>
