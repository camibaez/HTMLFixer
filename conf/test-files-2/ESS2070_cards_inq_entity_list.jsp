<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META NAME="Author" CONTENT="Datapro">
<META NAME="Generator" CONTENT="Microsoft FrontPage 5.0">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<TITLE>Transacciones Históricas</TITLE>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT LANGUAGE="JavaScript"> 
<!--- hide script from old browsers
function FSubmitValidation() {
if(document.forms[0].ENTITYID.value == ""){
    alert("Please enter USer/Entity");
    document.forms[0].ENTITYID.focus();
    return false;
  } 
}
function GetDCIBSUsers(name){
	page = "<%=request.getContextPath()%>/servlet/com.datapro.eibs.internet.JSLogTransSearch?SCREEN=" + 3;
	fieldName=name;
	CenterWindow(page,250,200,1);

}
// end hiding from old browsers -->
</SCRIPT>

</HEAD>

<BODY>
 
<form method="post" action="<%=request.getContextPath()%>/servlet/com.datapro.eibs.internet.JSESS2070" > 
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="21">
<INPUT TYPE=HIDDEN NAME="TYPE" VALUE="2"> 
<input type=HIDDEN name="PB" value="2">
<h3 align="center">Secure Card Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="cards_inq_entity_list, ESS2070"></h3>
<hr size="4">
<h4 align="center">Select Entity to show Secure Cards&nbsp; </h4>


<table class="tableinfo">
  <TR class="rowlight" > 
    <TD align=right>User/Entity&nbsp;:&nbsp; </TD>
    <TD align="left">
      <input type="text" id="ENT" name="ENTITYID" size="16" maxlength="10" value="">
      <a href="javascript:GetDCIBSUsers('ENTITYID')">
              		<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a>
      </TD>
</TABLE>  

<BR>

  <p align="center"> <input id="EIBSBTN" type=submit name="Submit" value="Process"> </p>

</FORM>
</BODY>
</HTML>