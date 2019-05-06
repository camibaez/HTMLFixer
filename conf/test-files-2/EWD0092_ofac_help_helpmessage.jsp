<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@page import="datapro.eibs.beans.EWD0092DSMessage"%>
<%@page import="datapro.eibs.master.Util"%><html>
<head>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<TITLE>Lista de Control</TITLE>
</head>
<jsp:useBean id= "EWD0092Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<script language="javascript">
 
function showOfacDetail(shrType, shrAcc, shrSeq, shrCat) {
	results.window.location.href="<%=request.getContextPath()%>/pages/e/MISC_search_wait.jsp?URL='<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0092?shrType=" + shrType + "@shrAcc=" + shrAcc + "@shrSeq=" + shrSeq + "@shrCategory=SUMMARY@FromRecord=0@shrAction=<%= request.getParameter("shrAction")%>"+"'";
}

</script>
<BODY>
<FORM>
<%
if ( EWD0092Help.getNoResult() ) {
%>
     <TABLE class="tbenter" width="100%" height="100%" >
     <TR>
     <TD> 
     <div align="center"><b>There are not registers to shown</b> 
     </div>
     </TD>
    </TR>
     </TABLE>
<%
} else {
%>
  <h3 align="center">Control List</h3>
  <TABLE class="tbenter" width="97" height="40">
    <TR>
    </TR>
  </TABLE>
<TABLE class="tableinfo" align="center" style="width:'95%'">
    <TR id="trdark"> 
    	  <TH ALIGN=CENTER  nowrap width="20%">Search Type</TH>
          <TH ALIGN=CENTER  nowrap width="20%">Reference</TH>
          <TH ALIGN=CENTER  nowrap width="20%"> Total Matches</TH>
          <TH ALIGN=CENTER  nowrap width="10%">Date</TH>
     </TR>
    <%
    	String shrType = "";
    	String shrSearch = "";
 		String shrAcc = request.getParameter("shrAcc");
		String shrCategory = request.getParameter("shrCategory");
		String shrAction = request.getParameter("shrAction");
		
    	String strCategory = "";
   		EWD0092Help.initRow();
        while (EWD0092Help.getNextRow()) {
            EWD0092DSMessage msgHelp = (EWD0092DSMessage)EWD0092Help.getRecord();
            shrType = msgHelp.getEWDTYP();
            shrSearch = msgHelp.getEWDNRO();
			if (!strCategory.equals(msgHelp.getEWDPRO())) {
				if (!msgHelp.getEWDPRO().trim().equals("")) {
					strCategory = msgHelp.getEWDPRO();
	%>
		<TR>
		<TD NOWRAP align="center">
			<%=msgHelp.getEWDTYP().equals("S") ? "BY SOUND" : 
				(msgHelp.getEWDTYP().equals("W") ? "BY WORD" : 
					(msgHelp.getEWDTYP().equals("N") ? "BY NAME" : ""))%>
		</TD>
		<TD NOWRAP align="center">
			<A HREF="javascript:showOfacDetail('<%=shrType%>', '<%=shrAcc%>','<%=shrSearch%>','<%=strCategory%>')">
			<%=msgHelp.getEWDACN()%></A>
		</TD>
		<TD NOWRAP align="center">
			<%=msgHelp.getEWDNMT()%>
		</TD>
		<TD NOWRAP align="center">
			<%=Util.formatDate(msgHelp.getEWDDT1(),msgHelp.getEWDDT2(),msgHelp.getEWDDT3())%>
		</TD>
		</TR> 
		<%
				} else {
		%>
		<TR>
		<TD NOWRAP align="center">
			<A HREF="javascript:showOfacDetail('<%=shrType%>', '<%=shrAcc%>','<%=shrSearch%>','INFORMACION GENERAL')">GENERAL INFORMATION</A>
		</TD>
		</TR> 
		<%
				}
			}
		}
     %>
  </TABLE>
  <br/>
  <iframe id="results" name="results" frameborder="0" width="100%" height="100%" marginwidth="0">
  </iframe>
<script language="javascript">
	showOfacDetail('<%=shrType%>', '<%=shrAcc%>','<%=shrSearch%>', '<%=strCategory%>');
</script>
<%      
  }
%> 
</FORM>
<script language="JavaScript">
setCenterSize(800,600);
</script>

</BODY>
</HTML>