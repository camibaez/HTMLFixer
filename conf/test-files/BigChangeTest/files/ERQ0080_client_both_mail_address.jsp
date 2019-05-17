<html>
<head>
<title>Direcciones de Correo</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</head>

<jsp:useBean id= "mailA" class= "datapro.eibs.beans.ERQ000004Message"  scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

     <%
   if ( userPO.getOption().equals("CLIENT_P") ) {
   %>
		builtNewMenu(erq_client_personal_opt);
  <%
   }
   else
   {
   %>
		builtNewMenu(erq_client_corp_opt);
   <%
   }
   %>

 </SCRIPT>

 <SCRIPT Language="Javascript">
 function FormatDate(){

document.forms[0].E14NST.value = '' + document.forms[0].E14DMF.value + document.forms[0].E14DDF.value + document.forms[0].E14DMT.value + document.forms[0].E14DDT.value;
document.forms[0].E24NST.value = document.forms[0].E24DMF.value + document.forms[0].E24DDF.value + document.forms[0].E24DMT.value + document.forms[0].E24DDT.value;
document.forms[0].E34NST.value = document.forms[0].E34DMF.value + document.forms[0].E34DDF.value + document.forms[0].E34DMT.value + document.forms[0].E34DDT.value;
document.forms[0].E44NST.value = document.forms[0].E44DMF.value + document.forms[0].E44DDF.value + document.forms[0].E44DMT.value + document.forms[0].E44DDT.value;
document.forms[0].E54NST.value = document.forms[0].E54DMF.value + document.forms[0].E54DDF.value + document.forms[0].E54DMT.value + document.forms[0].E54DDT.value;
document.forms[0].E64NST.value = document.forms[0].E64DMF.value + document.forms[0].E64DDF.value + document.forms[0].E64DMT.value + document.forms[0].E64DDT.value;
document.forms[0].E74NST.value = document.forms[0].E74DMF.value + document.forms[0].E74DDF.value + document.forms[0].E74DMT.value + document.forms[0].E74DDT.value;
document.forms[0].E84NST.value = document.forms[0].E84DMF.value + document.forms[0].E84DDF.value + document.forms[0].E84DMT.value + document.forms[0].E84DDT.value;
document.forms[0].submit();

 }
 </SCRIPT>
<body onbeforeprint="showOpt(true)" onafterprint="showOpt(false)">



 <%
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
  if ( !userPO.getPurpose().equals("NEW") ) {
    out.println("<SCRIPT> initMenu();</SCRIPT>");
 }
%>

<h3 align="center">Direcciones de Correo<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="client_both_mail_address, ERQ0080" ></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERQ0080" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="34">

<table class="tableinfo">
  <tr >
    <td nowrap>
      <table cellspacing="0" cellpadding="2" width="100%" class="tbhead" bgcolor="#FFFFFF" bordercolor="#FFFFFF" bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF"  align="center">
        <tr>

            <td nowrap width="10%" align="right"> Cliente: </td>
          <td nowrap width="12%" align="left">
      			<%= userPO.getHeader1()%>
          </td>
            <td nowrap width="6%" align="right">ID:
            </td>
          <td nowrap width="14%" align="left">
      			<%= userPO.getHeader2()%>
          </td>
            <td nowrap width="8%" align="right"> Nombre: </td>
          <td nowrap width="50%"align="left">
      			<%= userPO.getHeader3()%>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<BR>
<div id="dataDiv" align="center" style="width:90%; padding-left:50; padding-right:10" class="scbarcolor">
<%
  int bene_amount = 8;
  String name;
  String mf;
  String df;
  String mt;
  String dt;
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
  out.print("<A href=\"javascript:go(6)\">6</A>,<A href=\"javascript:go(7)\">7</A>,<A href=\"javascript:go(8)\">8</A>");
   out.println("</h4>");
  out.println("</td>");
  out.println("</tr>");
  out.println("</table>");
%>

  <table id="mainTable<%= name %>" class="tableinfo">
   <tr >
      <td nowrap >
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">
         <tr id="trdark">
            <td nowrap width="42%">
              <div align="right">Nombre Legal :</div>
            </td>
            <td nowrap width="58%">
              <input type="text" name="E<%= name %>4MA1" maxlength="45" size="46" value="<%= mailA.getField("E" + name + "4MA1").getString().trim()%>">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom">
            </td>
          </tr>
         <tr>
            <td nowrap width="42%">
              <div align="right">Direcci&oacute;n
                :</div>
            </td>
            <td nowrap width="58%">
              <input type="text" name="E<%= name %>4MA2" maxlength="35" size="36" value="<%= mailA.getField("E" + name + "4MA2").getString().trim()%>">
            </td>
          </tr>
         <tr id="trdark">
            <td nowrap width="42%">
              <div align="right"></div>
            </td>
            <td nowrap width="58%">
              <input type="text" name="E<%= name %>4MA3" maxlength="35" size="36" value="<%= mailA.getField("E" + name + "4MA3").getString().trim()%>">
            </td>
          </tr>
         <tr>
            <td nowrap width="42%">
              <div align="right"></div>
            </td>
            <td nowrap width="58%">
              <input type="text" name="E<%= name %>4MA4" maxlength="35" size="36" value="<%= mailA.getField("E" + name + "4MA4").getString().trim()%>">
            </td>
          </tr>
         <tr id="trdark">
            <td nowrap width="42%">
              <div align="right">Ciudad :</div>
            </td>
            <td nowrap width="58%">
              <input type="text" name="E<%= name %>4CTY" maxlength="30" size="31" value="<%= mailA.getField("E" + name + "4CTY").getString().trim()%>">
            </td>
          </tr>
         <tr>
            <td nowrap width="42%">
              <div align="right">Estado :</div>
            </td>
            <td nowrap width="58%">
              <input type="text" name="E<%= name %>4STE" maxlength="4" size="5" value="<%= mailA.getField("E" + name + "4STE").getString().trim()%>">
              <a href="javascript:GetCodeCNOFC('E<%= name %>4STE','27')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
            </td>
          </tr>
         <tr id="trdark">
            <td nowrap width="42%">
              <div align="right">Pa&iacute;s :</div>
            </td>
            <td nowrap width="58%">
              <input type="text" name="E<%= name %>4CTR" maxlength="20" size="21" value="<%= mailA.getField("E" + name + "4CTR").getString().trim()%>">
            </td>
          </tr>
         <tr>
            <td nowrap width="42%">
              <div align="right">Apartado Postal :</div>
            </td>
            <td nowrap width="58%">
              <input type="text" name="E<%= name %>4POB" maxlength="10" size="11" value="<%= mailA.getField("E" + name + "4POB").getString().trim()%>">
            </td>
          </tr>
         <tr id="trdark">
            <td nowrap width="42%">
              <div align="right">C&oacute;digo Postal :</div>
            </td>
            <td nowrap width="58%">
              <input type="text" name="E<%= name %>4ZPC" maxlength="15" size="16" value="<%= mailA.getField("E" + name + "4ZPC").getString().trim()%>">
            </td>
          </tr>
         <tr id="trclear">
            <td nowrap width="42%">
              <div align="right">Mailing Code :</div>
            </td>
            <td nowrap width="58%">
              <input type="text" name="E<%= name %>4MLC" maxlength="3" size="4" value="<%= mailA.getField("E" + name + "4MLC").getString().trim()%>">
            </td>
          </tr>
         <tr id="trdark">
            <td nowrap width="42%">
              <div align="right">Value Date :</div>
            </td>
            <%
            	try{ mf = mailA.getField("E" + name + "4NST").getString().substring(0,2);} catch (Exception e) {mf = "";}
            	try{ df = mailA.getField("E" + name + "4NST").getString().substring(2,4);} catch (Exception e) {df = "";}
            	try{ mt = mailA.getField("E" + name + "4NST").getString().substring(4,6);} catch (Exception e) {mt = "";}
            	try{ dt = mailA.getField("E" + name + "4NST").getString().substring(6,8);} catch (Exception e) {dt = "";}
            %>
            <td nowrap width="58%">
              <input type="HIDDEN" name="E<%= name %>4NST" maxlength="8" value="<%= mailA.getField("E" + name + "4NST").getString().trim()%>">
              From :
              <input type="text" name="E<%= name %>4DMF" maxlength="2" size="3" value="<%= mf %>">
              <input type="text" name="E<%= name %>4DDF" maxlength="2" size="3" value="<%= df %>">
              To :
              <input type="text" name="E<%= name %>4DMT" maxlength="2" size="3" value="<%= mt %>">
              <input type="text" name="E<%= name %>4DDT" maxlength="2" size="3" value="<%= dt %>">
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

<p align="center">
 <input id="EIBSBTN" type=submit name="Submit" value="Submit" onclick="FormatDate();">
</p>

 </form>
</body>
</html>
