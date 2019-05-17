<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Customer's Generated Documents</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "msgList" class= "datapro.eibs.beans.JBList"   scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"   scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>
<jsp:useBean id= "eIBSProp" class= "datapro.eibs.master.JSEIBSProp"  scope="session"/>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="javascript">

	function openFile(nameOfFile) {
   		pg = "<%=eIBSProp.getEODPDFURL()%>/" + nameOfFile;
   		CenterWindow(pg,600,500,2);
}
	
</script>

</HEAD>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
    out.println("<SCRIPT Language=\"Javascript\">");
    out.println("       showErrors()");
    out.println("</SCRIPT>");
 } 
 error.setERRNUM("0");
%>

<BODY>
<INPUT TYPE=HIDDEN NAME="SCREEN">
<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
  <h3 align="center">Customer's Generated Documents Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
  		name="EIBS_GIF" ALT="cust_report_list.jsp,EWD0902"> 
  </h3>
<hr size="4">

<%
	if ( msgList.getNoResult() ) {
%>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
      <div align="center"> <b> There are no reports for your search criteria</b></div>
      </TD></TR>
   		</TABLE>
<%  
		}
	else {
%>	
 <TABLE class="tableinfo" align="center" style="width:'100%'">
    <TR id="trdark"> 
            <TH ALIGN=CENTER>Report<br>Name</th>
            <TH ALIGN=CENTER>Date</TH>
            <TH ALIGN=CENTER>Description</TH>
			<TH ALIGN=CENTER>Type</TH>
			<TH ALIGN=CENTER>Account</TH>
			<TH ALIGN=CENTER>Customer Name</TH>
    </TR>
<%
              msgList.initRow();
              while (msgList.getNextRow()) {
              if (msgList.getFlag().equals("")) {
              	out.println(msgList.getRecord());
         		}
              }
     }           
 %>	 
  </TABLE>
  
  <TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
   	 <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25">
       <%
    	if ( msgList.getShowPrev() ) {
  			int pos = msgList.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.general.JSEWD0902?SCREEN=5&FromRecord=" + pos + "\" > <img src=\""+request.getContextPath()+"/images/e/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (msgList.getShowNext()) {
  			int pos = msgList.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.general.JSEWD0902?SCREEN=5&FromRecord=" + pos +  "\" ><img src=\""+request.getContextPath()+"/images/e/next_records.gif\" border=0></A>");
	    } %>
  </TD>
 </TR>
 </TABLE>

</BODY>
</HTML>
