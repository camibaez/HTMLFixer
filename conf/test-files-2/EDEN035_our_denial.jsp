<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>
 
<html>
<head>
<title>Lista de C�digos de Negaci�n</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

</head>

<jsp:useBean id="EDEN035Record" class="datapro.eibs.beans.EDEN03501Message"  scope="session" /> 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
 
<body>

<script language="Javascript" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="JavaScript">

function goAction(op) {
	document.forms[0].SCREEN.value = op;
	if (op == 4) {
		if (!confirm("Desea borrar este registro?")) {
			return;
		}
		document.forms[0].Delete.disabled = true;
	}
	if (op == 5) {
		document.forms[0].Submit.disabled = true;
	}
	document.forms[0].submit();
}

</SCRIPT>  
 

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
	String read = "";
	String title = "New";
	if (!userPO.getPurpose().equals("NEW")) { 
		read = " readonly=\"readonly\" ";
		title = "Maintenance";
	}		
	
%>


<H3 align="center"><%=title %> - State   Code<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="our_denial.jsp, EDEN035"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.ofac.JSEDEN035" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">

<%int row = 0; %>
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="15%" align="right">Code :</td>
            <td nowrap width="35%" align="left">
				<INPUT type="text" name="E01DSTCDE" size="11" maxlength="11" value="<%= EDEN035Record.getE01DSTCDE().trim()%>" <%=read%> >            	
			</td>
            <td nowrap width="15%" align="right">Description :</td>
			<td nowrap width="35%" align="left"> 
				<INPUT type="text" name="E01DSTDSC" id="E01DSTDSC" size="60" value="<%= EDEN035Record.getE01DSTDSC().trim()%>"> 
			</td>
		</tr>		
        </table>
      </td>
    </tr>
  </table>
 <br> 
	<table width="100%">		
  	<tr>
  		<td width="33%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="goAction(6);">
     	  </div>	
  		</td>
  		<td width="33%"> 
  		  <div align="center"> 
     		<input id="EIBSBTN" type=button name="Delete" value="Delete" onClick="goAction(5);">
     	  </div>	
  		</td>
  		<td width="34%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type=submit name="Exit" value="Exit" onClick="goAction(2);">
     	  </div>	
  		</td>
  	</tr>	
  </table>	

  </form>
</body>
</html>
