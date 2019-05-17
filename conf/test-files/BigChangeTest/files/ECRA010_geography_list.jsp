<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import ="datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<TITLE>Geography List</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "msgList" 	class= "datapro.eibs.beans.JBObjList"  			scope="session" />
<jsp:useBean id= "error" 	class= "datapro.eibs.beans.ELEERRMessage"  		scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos"  			scope="session"/>

<SCRIPT language="javascript" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT language="javascript">

function goAction(opt) {
    if (opt == "N") {
		document.forms[0].SCREEN.value = '110';
		var y=event.clientY + document.body.scrollTop;
		var x=event.clientX + document.body.scrollLeft;
		//ShowNew(x,y); 
  		document.forms[0].submit();
	} else if (opt == "M") { 
		document.forms[0].SCREEN.value = '210';
  		document.forms[0].submit();
	} else if (opt == "I") { 
		document.forms[0].SCREEN.value = '310';
  		document.forms[0].submit();
  	} else if (opt == "D") {
      		ok = confirm("Are you sure you want to delete this record?");
		document.forms[0].SCREEN.value = '410';
	  	if (ok) document.forms[0].submit();
  	}
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

<h3 align="center">Geography List<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="assessment_area_list, <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECRA010"></H3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECRA010" >
 <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="210">
 <INPUT TYPE=HIDDEN NAME="E01CRAARN" VALUE="<%=userPO.getHeader1()%>">
 
<%if ( msgList.getNoResult() ) {%> 
  <TABLE class="tbenter" width="60%" align=center>
    <TR>
      <TD class=TDBKG width="50%"> 
        <div align="center" style="cursor:hand" onClick="goAction('N')"><a><b>New</b></a></div>
      </TD>
      <TD class=TDBKG width="50%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp">Exit</a> </div>
      </TD>
    </TR>
  </TABLE>
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
  
 <TABLE class="tbenter" width="100%" align=center>
    <TR>
      <TD class=TDBKG width="25%"> 
        <div align="center" style="cursor:hand" onClick="goAction('N')"><a><b>New</b></a></div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction('M')">Maintenance</a> 
        </div>
      </TD>
       <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction('D')">Delete</a> 
        </div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp">Exit</a> </div>
      </TD>
    </TR>
 </TABLE>
  
 <TABLE  id="mainTable" class="tableinfo" >
  <TR> 
    <TD NOWRAP valign=top>
  	 <TABLE id="dataTable" width="100%">
  		<TR id="trdark"> 
  			<TH ALIGN=CENTER ></TH>
    		<TH ALIGN=CENTER >Action</TH>
    		<TH ALIGN=CENTER >State Code</TH>
    		<TH ALIGN=CENTER >County Code</TH>
    		<TH ALIGN=CENTER >MSA/MD</TH>
    		<TH ALIGN=CENTER >Census Tract</TH>    		
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
           datapro.eibs.beans.ECRA01002Message msgPart = (datapro.eibs.beans.ECRA01002Message) msgList.getRecord();
     	%>               
        <TR>
			<TD NOWRAP width="2%"><input type="radio" name="ROW" value="<%= msgList.getCurrentRow()%>" <%=chk%> onClick="document.forms[0].CURRENTROW.value = this.value;"></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgPart.getE02CRGIEF())%></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgPart.getE02CRGSTC())%></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgPart.getE02CRGCTC())%></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgPart.getE02CRGMSA())%></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgPart.getE02CRGCET())%></TD>									
		</TR>    		
    	<%}%>    
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
