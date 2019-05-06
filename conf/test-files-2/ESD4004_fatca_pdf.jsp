<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Informacion Basica</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<LINK href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">


<SCRIPT language="Javascript1.1"
	src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> 
</SCRIPT>
<SCRIPT language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>
                                                  
<jsp:useBean id="report" class="datapro.eibs.beans.ESD400402Message" 	scope="session" />

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" 	scope="session" />

<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" 	scope="session" />

<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage"
	scope="session" />



</HEAD>

<BODY bgcolor="#FFFFFF">

<%if (!error.getERRNUM().equals("0")) {
	error.setERRNUM("0");
	out.println("<SCRIPT Language=\"Javascript\">");
	out.println("       showErrors()");
	out.println("</SCRIPT>");
}
 
%>

<script language="JavaScript">
function valMax(fld, max){
	if(fld.value > max)
		fld.value = max;
 }
 
 function showReport() {
 
   var h01wk1 = document.getElementById('H01WK1').value;
   var h01wk2 = getRadioButtonSelectedValue(document.getElementsByName('H01WK2'));
   CenterWindow('<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD4004?SCREEN=3001&H01WK1='+h01wk1+'&H01WK2='+h01wk2,600,470,2);
   
 }
 
  function getRadioButtonSelectedValue(ctrl)
    {
      for(i=0;i<ctrl.length;i++)
        if(ctrl[i].checked){
                return ctrl[i].value;
       }
       return '';
     }
</SCRIPT> 

<H3 align="center">Reportes de Excepciones - FATCA<IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" ALT="fatca_pdf, ESD4004"></H3>
<HR size="4">
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD4004">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="3001">  

<DIV align="left">

<TABLE class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">

           
            <tr id="trdark">
             <td nowrap width="40%"> 
                  <div align="right">Seleccione Reporte : </div>
             </td>
             <td nowrap width="60%" colspan="3"> 
                 <select name="H01WK1"  >
                    <option value="3">Clientes No Estadounidenses con Direccion en los EEUU </option>
                    <option value="6">Clientes NO - FATCA con Teléfonos en EUA </option> 
                    <option value="14">Clients Nuevos NO - FATCA con Telefono/Direccion en U.S.A. </option> 
                  
                                     
                  </select>
             </td>
           </tr>
           
           <tr id="clear">
           <td>
           </td>
           <td>
           <p align="left"> 
                <INPUT type="radio" name="H01WK2" value="P" checked> PDF
                <INPUT type="radio" name="H01WK2" value="X" > Excel
                </p>
           </td>
           </tr>
           
          
	
</TABLE>

<P>
<DIV align="center"><INPUT id="EIBSBTN" type="button" name="Submit" onclick="showReport();"
	value="Enviar"></DIV>
</p>
</FORM>
</BODY>
</HTML>

