<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META NAME="Author" CONTENT="Datapro">
<META NAME="Generator" CONTENT="Microsoft FrontPage 5.0">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="../style.css" rel="stylesheet">
<TITLE>Transacciones Históricas</TITLE>

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT LANGUAGE="JavaScript"> 
<!--- hide script from old browsers
function Validar() {
if(confirm("Are you sure to assign this cards to Entity ? ")){
    return true;
  } 
  return false;
}

function GetDCIBSUsers(name){
	page = "<%=request.getContextPath()%>/servlet/com.datapro.eibs.internet.JSLogTransSearch?SCREEN=" + 3;	
	//page = "<%=request.getContextPath()%>/servlet/com.datapro.eibs.internet.JSESS0005?SCREEN=1";
	fieldName=name;
	fieldAux1=name;
	CenterWindow(page,250,300,1);

}
// end hiding from old browsers -->
</SCRIPT>

</HEAD>

<BODY>
 <% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0") ;
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 %> 
<form method="post" action="../../servlet/com.datapro.eibs.internet.JSESS2071" onsubmit="return Validar();"> 
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
<h3 align="center">Assign Security Cards to Corporate Entity</h3>
<hr size="4">
<h4 align="center">Select Entity and Range to assign</h4>

<table class="tableinfo">
  <TR class="rowlight" > 
    <TD align=right>Entity&nbsp;:&nbsp; </TD>
    <TD align="left">
      <input type="text" id="ENT" name="ENTITYID" size="16" maxlength="10" value="">
      <a href="javascript:GetDCIBSUsers('ENTITYID')">
              		<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a>
      </TD>
	<TR>
	  <TD align="RIGHT">Cards Range to Assign :  </TD>
	  <TD><INPUT TYPE="TEXT" NAME="CARDI" size="10" maxlength="6">&nbsp;&nbsp;-&nbsp;&nbsp;
   	      <INPUT TYPE="TEXT" NAME="CARDF" size="10" maxlength="6">
	  </TD>
	</TR>
</TABLE>  

<BR>

  <p align="center"> <input id="EIBSBTN" type=submit name="Submit" value="Submit"> </p>

</FORM>
</BODY>
</HTML>