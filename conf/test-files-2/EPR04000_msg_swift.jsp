<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<SCRIPT language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id= "listaswift" class= "datapro.eibs.beans.JBList"   scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"   scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<TITLE>Mensaje Swift</TITLE>

<script language="javascript">
function Imprimir(){

	div1.style.display="none";
	window.print();
	div1.style.display="";
}
</script>

</HEAD>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 String opt = ""; 
%>

<BODY>
<h3 align="center">Swift Message<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="msg_swift.jsp, EPR0400"> 
</h3>

<hr size="4">
<FORM Method="post" name="form1" >
   <table cellspacing="0" cellpadding="2" width="100%" border="1">
    <tr > 
      <td NOWRAP valign="top" width="100%" > 
		   <table cellspacing="0" cellpadding="2" width="100%" border="0">
		    <tr > 
		      <td NOWRAP valign="top" width="100%" > 
            <%
                listaswift.initRow();
                int k=1;
                while (listaswift.getNextRow()) {
                    if (listaswift.getFlag().equals("")) {
                    		out.println(listaswift.getRecord());
                    k++;
                    }        
                }%> 
		      </td>
		    </tr>
		</table>
      </td>
    </tr>
</table>

<center>
 <div align="center" id ="div1">
   	<INPUT id="EIBSBTN" type="button" value="Print"  onClick="Imprimir()">  
 </div>
</center>

<BR>

</FORM>

</BODY>
</HTML>
