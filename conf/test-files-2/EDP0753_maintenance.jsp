<html>
<head>
<title>Mantenimiento Usuario Liquidador Propuesta de Crédito</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="brnDetails" class="datapro.eibs.beans.EDP075301Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
%>

<script language="JavaScript">

function goConfirm() {

		
	
      ok = confirm("Esta seguro que desea crear/modificar este registro?");
      
	  if (ok) 
	       {

	       document.forms[0].SCREEN.value="600";
	       document.forms[0].submit();
	        
	       }  
}

function goCancel() {

document.forms[0].SCREEN.value="100";
document.forms[0].submit(); 
	  		  
}

</script>

<H3 align="center">Mantenimiento Usuario Liquidador de Productos Propuesta de Crédito<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="maintenance.jsp, EDP0753"></H3>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.creditproposal.JSEDP0753" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
      </td>
    </tr>
  </table>
  
  
  <h4>Usuario:</h4>  
  
   
  
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          
          <tr id="trdark"> 
            <td nowrap width="20%"> 
              <div align="right">Código de Ruta:</div>
            </td>
            <td nowrap width="10%">  
             <INPUT type="text" name="E01DPURUT" maxlength="5" size="4" value="<%= brnDetails.getE01DPURUT().trim()%>" ;
					<% if(userPO.getHeader16().equals("2")){out.print("readonly");} %> >					
					<% if(!userPO.getHeader16().equals("2")) {; %>
					      <a href="javascript:GetCodeCNOFC('E01DPURUT','48')">
			              <img src="<%=request.getContextPath()%>/images/1b.gif" alt="ayuda" align="absbottom" border="0" ></a> 
					<% }; %>
			</td>
            <td nowrap width="40%" height="23"> 
              <div align="left">
              <INPUT type="text" name="E01DPUDRU" size="35" maxlength="35" value="<%= brnDetails.getE01DPUDRU().trim()%>" readonly >
			  </div>
            </td>
          </tr>
          
          <tr id="trclear"> 
            <td nowrap width="20%"> 
              <div align="right">Código Gerencia Regional:</div>
            </td>
            <td nowrap width="10%">  
             <INPUT type="text" name="E01DPUGRG" maxlength="5" size="4" value="<%= brnDetails.getE01DPUGRG().trim()%>" ;
					<% if(userPO.getHeader16().equals("2")){out.print("readonly");} %> >					
					<% if(!userPO.getHeader16().equals("2")){; %>
					      <a href="javascript:GetCodeCNOFC('E01DPUGRG','PE')">
			              <img src="<%=request.getContextPath()%>/images/1b.gif" alt="ayuda" align="absbottom" border="0" ></a> 
					<% }; %>
			</td>
            <td nowrap width="40%" height="23"> 
              <div align="left">
              <INPUT type="text" name="E01DPUDGR" size="35" maxlength="35" value="<%= brnDetails.getE01DPUDGR().trim()%>" readonly >
			  </div>
            </td>
          </tr>

          <tr id="trdark"> 
            <td nowrap width="20%"> 
              <div align="right">Usuario Liquidador Productos:</div>
            </td>
            <td nowrap width="10%">  
             <INPUT type="text" name="E01DPUUSL" maxlength="10" size="12" value="<%= brnDetails.getE01DPUUSL().trim()%>" ;>					
			           <a href="javascript:GetUser('E01DPUUSL','E01DPUNUS',document.forms[0].E01DPUUSL.value)">
			           <img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0"></a> 
			</td>
            <td nowrap width="40%" height="23"> 
              <div align="left">
              <INPUT type="text" name="E01DPUNUS" size="35" maxlength="35" value="<%= brnDetails.getE01DPUNUS().trim()%>" readonly >
			  </div>
            </td>
          </tr>
			
  </table>
          <div align="center"> 
	        <input id="EIBSBTN" type="button" name="Submit" value="Enviar" onclick="goConfirm()"> 
            <INPUT id="EIBSBTN" type="button" name="Cancel" value="Cancelar" onclick="goCancel()">
	</div>
          
          <script language="JavaScript">
  		  
 		  
  		  </script>
          
  </form>
</body>
</html>
