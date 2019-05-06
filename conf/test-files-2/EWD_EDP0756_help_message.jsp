<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META http-equiv="Pragma" content="No-cache">
<META http-equiv="Pragma" content="No-cache">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script language="javascript">
//<!-- Hide from old browsers
function enter(code,nameins,typac,acc,year) {
	var form = top.opener.document.forms[0];

  	form[top.opener.fieldCode].value = code;
  	form[top.opener.fieldName].value = nameins;
  	form[top.opener.fieldType].value = typac;
  	form[top.opener.fieldAcc].value = acc;
  	form[top.opener.fieldYear].value = year;
//	if (form[top.opener.fieldSubmit].type != "hidden") form[top.opener.fieldSubmit].focus();
//		else form[top.opener.fieldCode].focus();
//	form[top.opener.fieldName].select();
	top.close();
}
//-->
</script>
<TITLE></TITLE>
</HEAD>
<jsp:useBean id= "EDP0756Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<BODY>

<%@ page import="datapro.eibs.master.Util" %>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<h3 align="center">Selección Cuentas del Cliente en otras Instituciones</h3>

<FORM>
<%
	if ( EDP0756Help.getNoResult() ) {
%>
 		<TABLE class="tbenter" width=100% height=100%>
 		<TR>
      <TD> 
        
      <div align="center"> <font size="3"><b> No hay datos que correspondan con su criterio de búsqueda</b></font> 
      </div>
      </TD></TR>
   		</TABLE>
<%
	}
	else {
%>
     	<%
        EDP0756Help.initRow(); 
        EDP0756Help.getNextRow();
           datapro.eibs.beans.EDP075601Message msgt = (datapro.eibs.beans.EDP075601Message) EDP0756Help.getRecord();
     	%>               
<table class="tableinfo">
 <TR > 
  <TD NOWRAP >
   <TABLE id="headTable1" width="95%" cellpading=0 cellspacing=0>
    <tr id="trdark"> 
      <td align="right"  >
         <b>Cliente :</b>
      </td>
      <td nowrap > 
         <input type="text" name="E01CUSCUN" size="12" readonly value="<%= msgt.getE01CUSCUN()%>">
      </td>
      <td align="right"  >
         <b>Nombre :</b>
      </td>
      <td nowrap colspan=3> 
         <input type="text" name="E01CUSNA1" size="35" readonly value="<%= msgt.getE01CUSNA1()%>">
      </td> 
    </tr>
  </table> 
 </tr>   
</table>
 
  <TABLE class="tableinfo" style="width:95%" ALIGN=CENTER>
    <TR id="trdark"> 
      <TH ALIGN=CENTER  nowrap width="10%">Código</TH>
      <TH ALIGN=CENTER  nowrap width="30%">Institución</TH>
      <TH ALIGN=CENTER  nowrap width="20%">Tipo Cta.</TH>
      <TH ALIGN=CENTER  nowrap width="20%">Cuenta</TH>
      <TH ALIGN=CENTER  nowrap width="10%">Año</TH>
    </TR>
     	<%
        EDP0756Help.initRow(); 
		boolean firstTime = true;
		String chk = "";
        while (EDP0756Help.getNextRow()) {
			if (firstTime) {
				firstTime = false;
				chk = "checked";
			} else {
				chk = "";
			}
           datapro.eibs.beans.EDP075601Message msg = (datapro.eibs.beans.EDP075601Message) EDP0756Help.getRecord();
     	%>               
        <TR>
			<td NOWRAP><a href="javascript:enter('<%=msg.getE01MVCINS()%>','<%=msg.getD01MVCINS()%>','<%=msg.getE01MVCTAC()%>','<%=msg.getE01MVCACC()%>','<%=msg.getE01MVCYEA()%>')"><%=Util.formatCell(msg.getE01MVCINS())%></a></td>
			<td NOWRAP><a href="javascript:enter('<%=msg.getE01MVCINS()%>','<%=msg.getD01MVCINS()%>','<%=msg.getE01MVCTAC()%>','<%=msg.getE01MVCACC()%>','<%=msg.getE01MVCYEA()%>')"><%=Util.formatCell(msg.getD01MVCINS())%></a></td>
			<td NOWRAP><a href="javascript:enter('<%=msg.getE01MVCINS()%>','<%=msg.getD01MVCINS()%>','<%=msg.getE01MVCTAC()%>','<%=msg.getE01MVCACC()%>','<%=msg.getE01MVCYEA()%>')">
			<% if (msg.getE01MVCTAC().trim().equals("R")) {;
		%>
		Depósitos
		<% }else{; %>
		Ahorros         
		<% }; %>
			</a></td>
			<td NOWRAP><a href="javascript:enter('<%=msg.getE01MVCINS()%>','<%=msg.getD01MVCINS()%>','<%=msg.getE01MVCTAC()%>','<%=msg.getE01MVCACC()%>','<%=msg.getE01MVCYEA()%>')"><%=Util.formatCell(msg.getE01MVCACC())%></a></td>
			<td NOWRAP><a href="javascript:enter('<%=msg.getE01MVCINS()%>','<%=msg.getD01MVCINS()%>','<%=msg.getE01MVCTAC()%>','<%=msg.getE01MVCACC()%>','<%=msg.getE01MVCYEA()%>')"><%=Util.formatCell(msg.getE01MVCYEA())%></a></td>
			</TR>   		
    	<%}%>   
  </TABLE>
  <TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR>
 	<%
        if ( EDP0756Help.getShowPrev() ) {
      			int pos = EDP0756Help.getFirstRec() - 21;
	%>
	<TD WIDTH="50%" ALIGN=LEFT height="25">
		<A HREF="<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEDP0756?FromRecord=<%=pos%>" > 
			<img src="<%=request.getContextPath()%>/images/s/previous_records.gif" border=0></A>		
	</TD>
	<%  }
        if ( EDP0756Help.getShowNext() ) {
      			int pos = EDP0756Help.getLastRec();        
	%> 
	<TD WIDTH="50%" ALIGN=LEFT height="25">
		<A HREF="<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEDP0756?FromRecord=<%=pos%>" > 
			<img src="<%=request.getContextPath()%>/images/s/next_records.gif" border=0></A>		
	</TD>
	 </TR>
<%      }
  }
%> 
	 </TABLE>
</FORM>

</BODY>
</HTML>