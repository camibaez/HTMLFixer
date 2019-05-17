<html>
<head>
<title>Control Documents by Guarantee</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id="EDP073701Help" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="EDP073702" class="datapro.eibs.beans.EDP073702Message" scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">
//       builtNewMenu(pc_optionHeader);  

</SCRIPT>

<%if (!error.getERRNUM().equals("0")) {
	error.setERRNUM("0");
%>
<SCRIPT Language="Javascript">
		showErrors();
		</SCRIPT>
<%}
out.println("<SCRIPT> initMenu(); </SCRIPT>");
%>

<SCRIPT Language="Javascript">
function initdp()
{
 // texto comentarios 
 if (document.forms[0].E02DPACO1 != null) {
	document.forms[0].E02DPACO1.value = "<%=EDP073702.getE02DPACO1().trim()%>";
 }
}

function getParams2(p1,p2,p3,p4,p5) {
	document.forms[0].E01PLPNPR.value=p2;
	document.forms[0].E01CNOACD.value=p3;
	document.forms[0].E01CNORCD.value=p4;
}

function goUpdVal(){
	document.forms[0].SCREEN.value=300;
	document.forms[0].submit();	 
}

// TRABAJA CON CAMPOS CREADOS DINAMICAMENTE
function asigDat(name) {
	var n = name;
	if (n < 10) {
		var DPUBCHK = "document.forms[0].E01DPUB"+n+".checked" ;
		if (eval(DPUBCHK) == true) {
			eval("document.forms[0].E01DPUB"+n+".value = 1");
		}
	} else {
		var DPUBCHK = "document.forms[0].E01DPUB"+n+".checked" ;
		if (eval(DPUBCHK) == true) {
			eval("document.forms[0].E01DPUB"+n+".value = 1");
		}
	}
}


</script>

</head>
<body onload=javascript:initdp()>

<% if (userPO.getHeader23().equals("1")) {;%>
<h3 align="center">Control Documents
<%}else{;%>
<h3 align="center">Control Documents
<%};%>

<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="control_docs.jsp,EDP0737">
</h3>

<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.creditproposal.JSEDP0737" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="300">
  <input type=HIDDEN name="opt">
  <input type="hidden" name="E01PLPNPR" > 
  <input type="hidden" name="E01CNOACD" > 
  <input type="hidden" name="E01CNORCD" > 
<table class="tableinfo">
 <TR > 
  <TD NOWRAP >
   <TABLE id="headTable" width="100%" cellpading=0 cellspacing=0>
    <tr id="trdark"> 
      <td align="right"  >
         <b>Customer :</b>
      </td>
      <td nowrap > 
         <input type="text" name="Header1" size="12" readonly value="<%= userPO.getCusNum()%>">
      </td>
      <td align="right"  >
         <b>Name :</b>
      </td>
      <td nowrap colspan=3> 
         <input type="text" name="NAMECUM" size="45" readonly value="<%=userPO.getCusName()%>">
      </td>         
    </tr> 
    <tr id="trdark"> 
      <td align="right"  >
         <b>Proposal Number :</b>
      </td>
      <td nowrap > 
         <input type="text" name="Identifier" size="15" readonly value="<%=userPO.getIdentifier()%>">
      </td>
      <td align="right"  >
         <b>Guarantee :</b>
      </td>
      <td nowrap > 
         <input type="text" name="Identifier" size="15" readonly value="<%=userPO.getHeader19()%>">
      </td>
    </tr>  

  </table> 
 </td>        
 </tr>  
</table>

<table id="mainTable"  class="tableinfo">
	<TR id=trdark>
		<TD ALIGN=LEFT NOWRAP width="5%"><b>Sel</b></TD>
		<TD ALIGN="center" NOWRAP width="65%"><b>Document</b></TD>
		<TD ALIGN="center" NOWRAP width="10%"><b>Date Expir.</b></TD>
		<TD ALIGN="center" NOWRAP width="5%"><b>Check</b></TD>
		<TD ALIGN=center NOWRAP width="15%"><b>Condition</b></TD>
	</TR>

	<%EDP073701Help.initRow();
int recnum = 1;
String gaChkRD = "";
String name = "";
boolean firstTimeRD = true;
while (EDP073701Help.getNextRow()) {
	gaChkRD = (firstTimeRD) ? "checked" : "";
	firstTimeRD = false;
	if (recnum < 10)
		name = "" + recnum;
	else
		name = "" + recnum;
	datapro.eibs.beans.EDP073701Message msgRTR =
		(datapro.eibs.beans.EDP073701Message) EDP073701Help.getRecord();%>

	<TR id=trclear>

		<TD ALIGN=LEFT NOWRAP width="5%">
		<input type="radio" name="COLLCODRD" value="<%=name%>" onClick="showCollItemsRD(this.value,'<%=msgRTR.getField("E01DPDD01").getString().trim()%>','<%=msgRTR.getField("E01DPDTNU").getString().trim()%>')" <%=gaChkRD%>>
		</TD>
		<TD ALIGN="left" NOWRAP width="65%">
		<INPUT type="hidden" name="E01PLTPRO<%=name%>" value="<%=msgRTR.getField("E01PLTPRO").getString().trim()%>"> 
		<INPUT type="hidden" name="E01DPDD<%=name%>" value="<%=msgRTR.getField("E01DPDD01").getString().trim()%>"> 
		<INPUT type="hidden" name="E01DPDT<%=name%>" value="<%=msgRTR.getField("E01DPDT01").getString().trim()%>"> 
		<INPUT type="text" maxlength="40" size="40" name="E01DPDX<%=name%>" value="<%=msgRTR.getField("E01DPDX01").getString().trim()%>" readonly width="20%"> 
		<INPUT type="text" name="E01DPOB<%=name%>" size="40" maxlength="80"	value='<%=msgRTR.getField("E01DPOBSR").getString().trim()%>' <%if (userPO.getHeader16().equals("5")) {out.print("readonly");}%>>
		<INPUT type="text" maxlength="10" size="10" name="NIVDOC<%=name%>" <%if (msgRTR.getField("E01DPDT01").getString().trim().equals("1")) {%>value="REQUERIDO" <%};%><%if (msgRTR.getField("E01DPDT01").getString().trim().equals("2")) {%>	value="ADICIONAL" <%};%>
			<%if (msgRTR.getField("E01DPDT01").getString().trim().equals("3")) {%>value="OPCIONAL" <%};%> readonly width="10%">
		</TD>
		<TD ALIGN="left" NOWRAP width="10%">
			<INPUT type="text" maxlength="2" size="3" name="E01DPDA<%=name%>" value="<%=msgRTR.getField("E01DPDA01").getString().trim()%>" <%if (userPO.getHeader16().equals("5")) {out.print("readonly");}%> > 
			<INPUT type="text" maxlength="2" size="3" name="E01DPDM<%=name%>" value="<%=msgRTR.getField("E01DPDM01").getString().trim()%>" <%if (userPO.getHeader16().equals("5")) {out.print("readonly");}%> > 
			<INPUT type="text" maxlength="2" size="3" name="E01DPDY<%=name%>" value="<%=msgRTR.getField("E01DPDY01").getString().trim()%>" <%if (userPO.getHeader16().equals("5")) {out.print("readonly");}%> > 
		</TD>
		<TD ALIGN=center NOWRAP width="5%">
		<INPUT type="checkbox" name="E01DPUB<%=name%>" value="<%=msgRTR.getField("E01DPUB01").getString().trim()%>" <%if (!msgRTR.getField("E01DPUB01").getString().trim().equals("")) out.print("checked");%> width="5%" onClick="asigDat(<%=name%>);" <%if (userPO.getHeader16().equals("5")) {out.print("DISABLED");}%>>
		</TD>
		<TD ALIGN=center NOWRAP width="15%">
		<SELECT name="E01DPFR<%=name%>" <%if (userPO.getHeader16().equals("5")) {out.print("DISABLED");}%>>
			<option value=" " <%if (msgRTR.getField("E01DPFR01").getString().equals(" ")) {out.print("selected");}%>></option>
			<option value="1" <%if (msgRTR.getField("E01DPFR01").getString().equals("1")) {out.print("selected");}%>>Conforme</option>
			<option value="2" <%if (msgRTR.getField("E01DPFR01").getString().equals("2")) {out.print("selected");}%>>Incompleto</option>
			<option value="3" <%if (msgRTR.getField("E01DPFR01").getString().equals("3")) {out.print("selected");}%>>Ilegible</option>
			<option value="4" <%if (msgRTR.getField("E01DPFR01").getString().equals("4")) {out.print("selected");}%>>Faltante</option>
		</SELECT>
	</TR>

	<%recnum += 1;
};%>
	<input type="HIDDEN" name="RECNUM" value="<%=recnum%>">

	<%--
	    	 } 
		%> 
--%>
</TABLE>
<table cellspacing="0" cellpadding="0" width="100%" border="0">
   <tr id="trclear">
	<td width="20%" align="right">
		<div align="left">Observations :</div>
	</td>
	<td width="50%" align="left">
	  <TEXTAREA name="E02DPACO1" rows="5" cols="70" value="<%= EDP073702.getE02DPACO1().trim()%>"
		<%if (userPO.getHeader16().equals("5")) {out.print("readonly");}%>
	  	> 
	  </TEXTAREA>
	</td>
   </tr>	
</table>

  <table class="tbenter" width=100% align=center>
    <tr> 
	<% if(!userPO.getPurpose().equals("INQUIRY")) {%>
    <td class=TDBKG width="20%">
        <div align="center"><a href="javascript:goUpdVal()"><b>Submit</b></a></div> 
    </td> 
	<% }; %>
      <td class=TDBKG width="20%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
      </td>
    </tr>
  </table>
  
  <SCRIPT language="JavaScript">

//     function resizeDoc() {
//   	divResize();
//	    var dataTab1 = document.all["dataTable1"];
//     	adjustEquTables(headTable1, dataTab1, dataDiv1,1,false);
//      }
//     resizeDoc();
//     window.onresize=resizeDoc;

</SCRIPT>
</form>
</body>
</html>