<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import ="datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<TITLE>Safe Deposit</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "msgList" 	class= "datapro.eibs.beans.JBObjList"  			scope="session" />
<jsp:useBean id= "error" 	class= "datapro.eibs.beans.ELEERRMessage"  		scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos"  			scope="session"/>

<SCRIPT language="javascript" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT language="javascript" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT language="javascript">
   builtNewMenu(cd_i_opt);
   initMenu();
</SCRIPT>  

</HEAD>
<BODY>

<% 
if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors();");
     out.println("</SCRIPT>");
} 
%>

<h3 align="center">IRA Account Summary<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="ira_account_summary_list, EIRA010"></H3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEIRA020" >
 <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">

<%if ( msgList.getNoResult() ) {%>
    <TABLE class="tbenter" width=100% height=40%>
   	<TR>
      <TD> 
        <div align="center"> 
          <p>
            <b>There is no records for your search criteria</b>
          </p>          
        </div>
      </TD>
     </TR>
   </TABLE>
<%}	else {%>
  <INPUT TYPE=HIDDEN NAME="CURRENTROW" VALUE="0">

  <TABLE class="mainTable" class="tableinfo" width=100%>
  <TR> 
    <TD NOWRAP valign=top>
  	 <TABLE id="dataTable" width="100%" class="tableinfo">
   	<TR>
      <TD nowrap width="20%"> 
        <div align="right"> 
        Customer :</div>
      </TD>
      <TD nowrap width="80%" colspan="3">
        <div align="left"> 
        <INPUT type="text" name="E01IRACUN" size="10" maxlength="10"
			value="<%= userPO.getHeader1() %>" readonly><INPUT type="text"
			name="E01CUSNA1" size="35" maxlength="30"
			value="<%= userPO.getHeader2() %>" readonly></div>      
      </TD>
	</TR>
   	<TR>
      <TD nowrap>
		<div align="right">Contract :</div>
		</TD>
      <TD nowrap>
        <div align="left"> 
        <INPUT type="text" name="E01IRAACC" size="10" maxlength="10"
			value="<%= userPO.getHeader3() %>" readonly></div>      
      </TD>
      <TD nowrap> 
        <div align="right"> 
        IRA Type :</div>
      </TD>
      <TD nowrap>
		<div align="left"><INPUT type="text" name="E01IRATYP" size="27"
			maxlength="25" value="<%= userPO.getHeader4() %>" readonly></div>
		</TD>      
	</TR>
   	<TR>
      <TD nowrap> 
        <div align="right"> 
        Birth Date :</div>
      </TD>
      <TD nowrap>
        <div align="left"> 
        <INPUT type="text" name="E01BDATE" size="10" maxlength="10"
			value="<%= userPO.getHeader5() %>" readonly></div>      
      </TD>
      <TD nowrap> 
        <div align="right"> 
        Opening Date :</div>
      </TD>
      <TD nowrap>
		<div align="left"><INPUT type="text" name="E01ODATE" size="10"
			maxlength="10" value="<%= userPO.getHeader6() %>" readonly></div>
		</TD>      
	</TR>	
   </TABLE>
       </TD>
   </TR>	
</TABLE>
<br>
 <TABLE  id="mainTable" class="tableinfo" width="100%">
  <TR> 
    <TD NOWRAP valign=top>
    <h4>CONTRIBUTIONS</h4>
  	 <TABLE id="dataTable" width="100%">
  		<TR id="trdark">
    		<TH ALIGN=CENTER nowrap width="60%">Type</TH>
    		<TH ALIGN=CENTER nowrap width="20%">Current Year</TH>
    		<TH ALIGN=CENTER nowrap width="20%">Prior Year</TH>
  		</TR>
     	<%
        msgList.initRow(); 
		boolean firstTime = true;
		String chk = "";
        while (msgList.getNextRow()) {
			if (firstTime) {
				firstTime = false;
				chk = "checked";
			} else {
				chk = "";
			}
           datapro.eibs.beans.EIRA02001Message msgPart = (datapro.eibs.beans.EIRA02001Message) msgList.getRecord();
           if (msgPart.getD01TRNDSC().equals("CONTRIBUTIONS")) {
%>
        <TR>
			<TD NOWRAP ALIGN="LEFT" width="60%"><%=Util.formatCell(msgPart.getD01CODDSC())%></TD>
			<TD NOWRAP ALIGN="RIGHT" width="20%"><%=Util.formatCell(msgPart.getE01IRAAM1())%></TD>
			<TD NOWRAP ALIGN="RIGHT" width="20%"><%=Util.formatCell(msgPart.getE01IRAAM2())%></TD>
		</TR>    		
<%			}
		}
%>    
     </TABLE>
    </TD>
   </TR>	
</TABLE>
<br>
 <TABLE  id="mainTable" class="tableinfo" width="100%">
  <TR> 
    <TD NOWRAP valign=top>
    <h4>DISTRIBUTIONS</h4>
  	 <TABLE id="dataTable" width="100%">
  		<TR id="trdark">
    		<TH ALIGN=CENTER nowrap width="60%">Type</TH>
    		<TH ALIGN=CENTER nowrap width="20%">Current Year</TH>
    		<TH ALIGN=CENTER nowrap width="20%">Prior Year</TH>
  		</TR>
<%
        msgList.initRow(); 
        while (msgList.getNextRow()) {
        	datapro.eibs.beans.EIRA02001Message msgPart = (datapro.eibs.beans.EIRA02001Message) msgList.getRecord();
        	if (msgPart.getD01TRNDSC().equals("DISTRIBUTIONS")) {
%>               
        <TR>
			<TD NOWRAP ALIGN="LEFT" width="60%"><%=Util.formatCell(msgPart.getD01CODDSC())%></TD>
			<TD NOWRAP ALIGN="RIGHT" width="20%"><%=Util.formatCell(msgPart.getE01IRAAM1())%></TD>
			<TD NOWRAP ALIGN="RIGHT" width="20%"><%=Util.formatCell(msgPart.getE01IRAAM2())%></TD>
		</TR>    		
<%			}
    	}
%>    
     </TABLE>
    </TD>
   </TR>	
</TABLE>
<br>
 <TABLE  id="mainTable" class="tableinfo" width="100%">
  <TR> 
    <TD NOWRAP valign=top>
     <TABLE id="dataTable" width="100%">
  		<TR id="trdark">
    		<TH ALIGN=CENTER nowrap width="60%"></TH>
    		<TH ALIGN=CENTER nowrap width="20%">Current Year</TH>
    		<TH ALIGN=CENTER nowrap width="20%">Prior Year</TH>
  		</TR>
         <TR>
			<TD NOWRAP ALIGN="RIGHT" width="60%">Begining Balance :</TD>
			<TD NOWRAP ALIGN="RIGHT" width="20%"><%=Util.formatCell(userPO.getHeader7())%></TD>
			<TD NOWRAP ALIGN="RIGHT" width="20%"><%=Util.formatCell(userPO.getHeader9())%></TD>
		</TR>    		
         <TR>
			<TD NOWRAP ALIGN="RIGHT" width="60%">Ending Balance :</TD>
			<TD NOWRAP ALIGN="RIGHT" width="20%"><%=Util.formatCell(userPO.getHeader8())%></TD>
			<TD NOWRAP ALIGN="RIGHT" width="20%"><%=Util.formatCell(userPO.getHeader10())%></TD>
		</TR>    
     </TABLE>
    </TD>
   </TR>	
</TABLE>
<SCRIPT language="JavaScript">
  showChecked("ROW");       
</SCRIPT>

<%}%>
</FORM>
</BODY>
</HTML>
