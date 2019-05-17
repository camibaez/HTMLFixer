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
function enter(code,name) {
var form = top.opener.document.forms[0];
 form[top.opener.fieldName].value = code;
 form[top.opener.fieldAux2].value = name;
 top.close();
 }
//-->
</script>
<TITLE></TITLE>
</HEAD>
<jsp:useBean id= "ewd0023Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<BODY>

<%@ page import="datapro.eibs.master.Util" %>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<FORM>
<%
	if ( ewd0023Help.getNoResult() ) {
%>
 		<TABLE class="tbenter" width=100% height=100%>
 		<TR>
      <TD> 
        
      <div align="center"> <font size="3"><b> There is no records for your search criteria</b></font> 
      </div>
      </TD></TR>
   		</TABLE>
<%
	}
	else {
%>
 
  <TABLE class="tableinfo" style="width:95%" ALIGN=CENTER>
    <TR id="trdark"> 
      <TH ALIGN=CENTER  nowrap width="30%">Broker No.</TH>
      <TH ALIGN=CENTER  nowrap width="40%">Name</TH>
      <TH ALIGN=CENTER  nowrap width="20%">Identification</TH>
      <TH ALIGN=CENTER  nowrap width="10%">Broker Type</TH>
    </TR>
     	<%
        ewd0023Help.initRow(); 
		boolean firstTime = true;
		String chk = "";
        while (ewd0023Help.getNextRow()) {
			if (firstTime) {
				firstTime = false;
				chk = "checked";
			} else {
				chk = "";
			}
           datapro.eibs.beans.EWD0023DSMessage msg = (datapro.eibs.beans.EWD0023DSMessage) ewd0023Help.getRecord();
     	%>               
        <TR>
			<td NOWRAP><a href="javascript:enter('<%=msg.getEWDNUM()%>','<%=msg.getEWDNM1()%>')"><%=Util.formatCell(msg.getEWDNUM())%></a></td>
			<td NOWRAP><a href="javascript:enter('<%=msg.getEWDNUM()%>','<%=msg.getEWDNM1()%>')"><%=Util.formatCell(msg.getEWDNM1())%></a></td>
			<td NOWRAP><a href="javascript:enter('<%=msg.getEWDNUM()%>','<%=msg.getEWDNM1()%>')"><%=Util.formatCell(msg.getEWDBID())%></a></td>
			<td NOWRAP><a href="javascript:enter('<%=msg.getEWDNUM()%>','<%=msg.getEWDNM1()%>')"><%=Util.formatCell(msg.getEWDSTY())%></a></td>
			</TR>   		
    	<%}%>   
  </TABLE>
  <TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR>
 	<%
        if ( ewd0023Help.getShowPrev() ) {
      			int pos = ewd0023Help.getFirstRec() - 21;
	%>
	<TD WIDTH="50%" ALIGN=LEFT height="25">
		<A HREF="<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0023?NameSearch=<%=session.getAttribute("NameSearch")%>&FromRecord=<%=pos%>" > 
			<img src="<%=request.getContextPath()%>/images/e/previous_records.gif" border=0></A>		
	</TD>
	<%  }
        if ( ewd0023Help.getShowNext() ) {
      			int pos = ewd0023Help.getLastRec();        
	%> 
	<TD WIDTH="50%" ALIGN=LEFT height="25">
		<A HREF="<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0023?NameSearch=<%=session.getAttribute("NameSearch")%>&FromRecord=<%=pos%>" > 
			<img src="<%=request.getContextPath()%>/images/e/next_records.gif" border=0></A>		
	</TD>
	 </TR>
<%      }
  }
%> 
	 </TABLE>
</FORM>

</BODY>
</HTML>