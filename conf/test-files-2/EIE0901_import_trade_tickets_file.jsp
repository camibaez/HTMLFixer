<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Payments</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="process" class="datapro.eibs.beans.EIE0901DSMessage"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>


<SCRIPT Language="javascript">

function CheckNum(){
	if(document.forms[0].E01FLR.value.length < 1){
		alert("Please, enter valid Folder");
		document.forms[0].E01FLR.value='';
		document.forms[0].E01FLR.focus();
	}
	else {
		if(document.forms[0].E01FILE.value.length < 1){
			alert("Please, enter valid File");
			document.forms[0].E01FILE.value='';
			document.forms[0].E01FILE.focus();
		}
		else {		
	  		document.forms[0].submit();
	  	}
	}
}

</SCRIPT>



</head>
<body nowrap>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%> 

<h3 align="center">Import Trade Tickets File<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="import_trade_tickets_file.jsp, EIE0901"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEIE0901" >
 <input type=HIDDEN name="SCREEN" value="2">
 
  <table  class="tableinfo" width="545">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Folder : </div>
            </td>
            <td nowrap > 
              <input type="text" name="E01FLR" size="15" maxlength="12" value="<%= process.getE01FLR()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">File :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01FILE" size="15" maxlength="12" value="<%= process.getE01FILE()%>">
            </td>
          </tr>
         </table>
	</table>
        <div align="center"> 
          <input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="CheckNum();">
        </div>

  <BR>
  <script language="JavaScript">
  document.forms[0].E01FLR.focus();
  document.forms[0].E01FLR.select();
</script>
  </form>  
</body>
</html>
