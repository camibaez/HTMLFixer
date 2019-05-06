<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import ="datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<TITLE>Pension Summary</TITLE>
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
   
	function getSummary(typ){
		document.forms[0].SCREEN.value = '1111';
		document.forms[0].TYP.value = typ;
	  	document.forms[0].submit();
	}
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

<h3 align="center">Pension Summary<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="ira_pension_summary_list, EIRA020"></H3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEIRA020" >
 <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1">
 <INPUT TYPE=HIDDEN NAME="TYP" VALUE=""> 

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
  	 <TABLE id="dataTable" width="100%">
   	<TR>
      <TD nowrap width="20%"> 
        <div align="right"> 
        Customer :</div>
      </TD>
      <TD nowrap width="40%">
        <div align="left"> 
        <INPUT type="text" name="E02IRACUN" size="10" maxlength="10"
			value="<%= userPO.getHeader1() %>" readonly><INPUT type="text"
			name="D02CUSNA1" size="10" maxlength="10"
			value="<%= userPO.getHeader2() %>" readonly></div>      
      </TD>
      <TD nowrap width="20%"> 
        <div align="left">        
        </div>
      </TD>
      <TD nowrap width="20%">
        <div align="center"> 
        </div>      
      </TD>      
	</TR>
   	<TR>
      <TD nowrap> 
        <div align="right"> 
        Year :</div>
      </TD>
      <TD nowrap>
        <div align="left"> 
        <INPUT type="text" name="E02IRAYEA" size="10" maxlength="10"
			value="<%= userPO.getHeader3() %>" readonly></div>      
      </TD>
      <TD nowrap>
      </TD>
      <TD nowrap>
		</TD>      
	</TR>				
   </TABLE>
       </TD>
   </TR>	
</TABLE>
 <TABLE  id="mainTable" class="tableinfo" width="100%">
  <TR> 
    <TD NOWRAP valign=top>
  	 <TABLE id="dataTable" width="100%">
  		<TR id="trdark">
    		<TH ALIGN=CENTER nowrap width="50%">IRA Type</TH>
    		<TH ALIGN=CENTER nowrap width="10%">Begining Bal</TH>
    		<TH ALIGN=CENTER nowrap width="10%">Total Contrib</TH>
    		<TH ALIGN=CENTER nowrap width="10%">Total Dist</TH>
    		<TH ALIGN=CENTER nowrap width="10%">Ending Bal</TH>    		
    		<TH ALIGN=CENTER nowrap width="10%">Interes</TH>    		
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
           datapro.eibs.beans.EIRA02002Message msgPart = (datapro.eibs.beans.EIRA02002Message) msgList.getRecord();
%>
        <TR>
			<TD NOWRAP ALIGN="CENTER" width="50%"><A HREF="javascript:getSummary('<%=Util.formatCell(msgPart.getD02IRATYP())%>')"><%=Util.formatCell(msgPart.getD02IRADSC())%></A></TD>
			<TD NOWRAP ALIGN="CENTER" width="10%"><A HREF="javascript:getSummary('<%=Util.formatCell(msgPart.getD02IRATYP())%>')"><%=Util.formatCell(msgPart.getD02BEGBAL())%></A></TD>
			<TD NOWRAP ALIGN="CENTER" width="10%"><A HREF="javascript:getSummary('<%=Util.formatCell(msgPart.getD02IRATYP())%>')"><%=Util.formatCell(msgPart.getD02TOTCON())%></A></TD>
			<TD NOWRAP ALIGN="CENTER" width="10%"><A HREF="javascript:getSummary('<%=Util.formatCell(msgPart.getD02IRATYP())%>')"><%=Util.formatCell(msgPart.getD02TOTDIS())%></A></TD>
			<TD NOWRAP ALIGN="CENTER" width="10%"><A HREF="javascript:getSummary('<%=Util.formatCell(msgPart.getD02IRATYP())%>')"><%=Util.formatCell(msgPart.getD02ENDBAL())%></A></TD>
			<TD NOWRAP ALIGN="CENTER" width="10%"><A HREF="javascript:getSummary('<%=Util.formatCell(msgPart.getD02IRATYP())%>')"><%=Util.formatCell(msgPart.getD02TOTINT())%></A></TD>			
		</TR>    		
<%
		}
%>    
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
