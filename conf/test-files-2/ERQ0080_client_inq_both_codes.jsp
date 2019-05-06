<html>
<head>
<title>Codigos de Clasificacion</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</head>

<jsp:useBean id="codes" class="datapro.eibs.beans.ERQ008003Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   <% 
   if ( userPO.getOption().equals("CLIENT_P") ) {
   %>
		builtNewMenu(erq_client_inq_personal_opt);
  <%      
   }
   else
   {
   %>
		builtNewMenu(erq_client_inq_corp_opt);
   <%
   }
   %>
	
</SCRIPT>

<body bgcolor="#FFFFFF">

 
 <% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
  if ( !userPO.getPurpose().equals("NEW") ) {
    out.println("<SCRIPT> initMenu();  </SCRIPT>");
 }
%>

<h3 align="center">C&oacute;digos de Clasificaci&oacute;n<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="client_inq_both_codes, ERQ0080"></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERQ0080" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="32">
  
<table class="tableinfo">
  <tr> 
      <td nowrap > 
        <table class=tbhead cellspacing="0" cellpadding="2" width="100%"   align="center">
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
    <table class="tableinfo">
      <tr > 
        <td nowrap>
          <table cellspacing="0" cellpadding="2" width="100%" border="0">
            <tr  id=trdark> 
              <td nowrap width="30%"> 
                <div align="right">Oficial Principal :</div>
              </td>
              <td nowrap width="70%"> 
                <input type="text" name="E03OFC" size="5" maxlength="3" value="<%= codes.getE03OFC().trim()%>" readonly>
                <input type="text" name="D03OFC" size="36" maxlength="35" value="<%= codes.getD03OFC().trim()%>" readonly>
               </td>
            </tr>
            <tr id=trclear> 
              <td nowrap width="30%"> 
                <div align="right">Oficial Secundario :</div>
              </td>
              <td nowrap width="70%"> 
                <input type="text" name="E03OF2" size="5" maxlength="3" value="<%= codes.getE03OF2().trim()%>" readonly>
                <input type="text" name="D03OF2" size="36" maxlength="35" value="<%= codes.getD03OF2().trim()%>" readonly>
              </td>
            </tr>
            <tr id=trdark> 
              <td nowrap width="30%"> 
                <div align="right">C&oacute;digo de Industria :</div>
              </td>
              <td nowrap width="70%"> 
                <input type="text" name="E03INC" size="5" maxlength="3" value="<%= codes.getE03INC().trim()%>" readonly>
              </td>
            </tr>
            <tr id=trclear> 
              <td nowrap width="3%"> 
                <div align="right">C&oacute;digo de Negocio :</div>
              </td>
              <td nowrap width="70%"> 
                <input type="text" name="E03BUC" size="5" maxlength="3" value="<%= codes.getE03BUC().trim()%>" readonly>
                <input type="text" name="D03BUC" size="36" maxlength="35" value="<%= codes.getD03BUC().trim()%>" readonly>
            </td>
            </tr>
            <tr id=trdark> 
              <td nowrap width="30%"> 
                <div align="right">Pa&iacute;s de Residencia :</div>
              </td>
              <td nowrap width="70%"> 
                <input type="text" name="E03GEC" size="5" maxlength="3" value="<%= codes.getE03GEC().trim()%>" readonly>
                <input type="text" name="D03GEC" size="36" maxlength="35" value="<%= codes.getD03GEC().trim()%>" readonly>
              </td>
            </tr>
            <tr id=trclear> 
              <td nowrap width="30%"> 
                <div align="right">Promotor :</div>
              </td>
              <td nowrap width="70%"> 
                <input type="text" name="E03UC1" size="5" maxlength="3" value="<%= codes.getE03UC1().trim()%>" readonly>
              </td>
            </tr>
            <tr id=trdark> 
              <td nowrap width="30%"> 
                <div align="right">Gerente :</div>
              </td>
              <td nowrap width="70%"> 
                <input type="text" name="E03UC2" size="5" maxlength="3" value="<%= codes.getE03UC2().trim()%>" readonly>
                <input type="text" name="D03UC2" size="36" maxlength="35" value="<%= codes.getD03UC2().trim()%>" readonly>
              </td>
            </tr>
            <tr id=trclear> 
              <td nowrap width="30%"> 
                <div align="right">User Code 3 :</div>
              </td>
              <td nowrap width="70%"> 
                <input type="text" name="E03UC3" size="5" maxlength="3" value="<%= codes.getE03UC3().trim()%>" readonly>
                <input type="text" name="D03UC3" size="36" maxlength="35" value="<%= codes.getD03UC3().trim()%>" readonly>
              	(Regulation "O" Flag)
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>

</form>
</body>
</html>

