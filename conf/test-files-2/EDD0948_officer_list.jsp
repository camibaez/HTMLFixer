<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util"%>
<HTML>
<HEAD>
<TITLE>
Summary by Officer
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "dvList" class= "datapro.eibs.beans.JBObjList"  scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<script language="JavaScript">
  var message = '';
  var officer = '';
  
  function goNSF(ofcCode) {    
     document.forms[0].SCREEN.value = '17';
     document.forms[0].E01SELOFC.value = ofcCode;
     document.forms[0].submit();
  }  
 
  function sendMsg() {    
     document.forms[0].OFCCODE.value = officer;
     document.forms[0].MESSAGE.value = message;
     document.forms[0].SCREEN.value = '15';
     document.forms[0].submit();
  }  
   
</script>

</HEAD>
<BODY>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>


<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%> 

<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.approval.JSEDD0924" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="14">
<INPUT TYPE=HIDDEN NAME="ROW" VALUE="">
<INPUT TYPE=HIDDEN NAME="OFCCODE" VALUE="">
<INPUT TYPE=HIDDEN NAME="MESSAGE" VALUE="">
<INPUT TYPE=HIDDEN NAME="E01SELOFC" VALUE="">
<INPUT TYPE=HIDDEN NAME="E01SELBRN" VALUE="">

 <h3 align="center">Summary By Officer<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="officer_list.jsp,EDD0948"> 
  </h3>
  <hr size="4">
<%
	if ( dvList.getNoResult() ) {

%>
 	<TABLE class="tbenter" width=100% height=100%>
 		<TR>
      <TD> 
        
        <div align="center"> <b>There is no match for your search 
          criteria</b> </div>
      </TD></TR>
   		</TABLE>
  <%
	}
	else {
	

%>

  <BR>
  <TABLE class="tableinfo">
    <TR id="trdark"> 
      <TH ALIGN=CENTER  nowrap width="5%"></TH>
      <TH ALIGN=CENTER  nowrap width="30%">Officer<BR>Name</TH>
      <TH ALIGN=CENTER  nowrap width="20%">Branch<BR>Name</TH>
      <TH ALIGN=CENTER  nowrap width="5%">Status</TH>
      <TH ALIGN=CENTER  nowrap width="10%">Paid<br>Amount</TH>
      <TH ALIGN=CENTER  nowrap width="10%">Returned<br>Amount</TH>
      <TH ALIGN=CENTER  nowrap width="5%">Total<BR>Items</TH>
      <TH ALIGN=CENTER  nowrap width="5%">Items<BR>Returned</TH>
      <TH ALIGN=CENTER  nowrap width="10%">Overdraft<br>Amount</TH>
      <TH ALIGN=CENTER  nowrap width="10%">Uncollected<br>Amount</TH>
    </TR>
			    <%
		               dvList.initRow();
		                int k=1;
		               while (dvList.getNextRow()) {
		               		datapro.eibs.beans.EDD0948DSMessage msgOff = (datapro.eibs.beans.EDD0948DSMessage)dvList.getRecord();
			     %> 
			    <TR> 
			      <TD ALIGN=LEFT NOWRAP>
			      	<a href="javascript:enterOfficerMessage('<%= msgOff.getE01DEVOFC() %>')">
			      	<img src="<%=request.getContextPath()%>/images/e/message16x12.gif" alt="Send Message" align="bottom" border="0" ></a>
                  </TD>
				  <TD ALIGN=LEFT NOWRAP><a href="javascript:goNSF('<%= msgOff.getE01DEVOFC() %>')"><%= Util.formatCell(msgOff.getE01DEVNME()) %></a></TD>
				  <TD ALIGN=LEFT NOWRAP><a href="javascript:goNSF('<%= msgOff.getE01DEVOFC() %>')"><%= Util.formatCell(msgOff.getE01DEVBRN()) %></a></TD>
				  <TD ALIGN=CENTER NOWRAP><a href="javascript:goNSF('<%= msgOff.getE01DEVOFC() %>')"><%= Util.formatCell(msgOff.getE01DEVSTS()) %></a></TD>
			      <TD ALIGN=RIGHT NOWRAP><a href="javascript:goNSF('<%= msgOff.getE01DEVOFC() %>')"><%= Util.formatCell(msgOff.getE01DEVPAI()) %></a></TD>
			      <TD ALIGN=RIGHT NOWRAP><a href="javascript:goNSF('<%= msgOff.getE01DEVOFC() %>')"><%= Util.formatCell(msgOff.getE01DEVRET()) %></a></TD>
			      <TD ALIGN=RIGHT NOWRAP><a href="javascript:goNSF('<%= msgOff.getE01DEVOFC() %>')"><%= Util.formatCell(msgOff.getE01DEVTOI()) %></a></TD>
			      <TD ALIGN=RIGHT NOWRAP><a href="javascript:goNSF('<%= msgOff.getE01DEVOFC() %>')"><%= Util.formatCell(msgOff.getE01DEVTOR()) %></a></TD>
			      <TD ALIGN=RIGHT NOWRAP><a href="javascript:goNSF('<%= msgOff.getE01DEVOFC() %>')"><%= Util.formatCell(msgOff.getE01DEVOVD()) %></a></TD>
			      <TD ALIGN=RIGHT NOWRAP><a href="javascript:goNSF('<%= msgOff.getE01DEVOFC() %>')"><%= Util.formatCell(msgOff.getE01DEVUNC()) %></a></TD>
			    </TR>
			    <%
			           }
			      
			    %>  
			    <TR> 
			      <TD ALIGN=LEFT NOWRAP></TD>
				  <TD ALIGN=LEFT NOWRAP></TD>
				  <TD ALIGN=LEFT NOWRAP></TD>
				  <TD ALIGN=LEFT NOWRAP></TD>
			      <TD ALIGN=RIGHT NOWRAP></TD>
			      <TD ALIGN=RIGHT NOWRAP></TD>
			      <TD ALIGN=RIGHT NOWRAP></TD>
			      <TD ALIGN=RIGHT NOWRAP></TD>
			      <TD ALIGN=RIGHT NOWRAP></TD>
			      <TD ALIGN=RIGHT NOWRAP></TD>
			    </TR>					    
			    <TR> 
			      <TD ALIGN=LEFT NOWRAP></TD>
				  <TD ALIGN=LEFT NOWRAP></TD>
				  <TD ALIGN=LEFT NOWRAP>TOTALS</TD>
				  <TD ALIGN=LEFT NOWRAP></TD>
			      <TD ALIGN=RIGHT NOWRAP><%= Util.formatCell(userPO.getHeader11()) %></TD>
			      <TD ALIGN=RIGHT NOWRAP><%= Util.formatCell(userPO.getHeader12()) %></TD>
			      <TD ALIGN=RIGHT NOWRAP><%= Util.formatCell(userPO.getHeader13()) %></TD>
			      <TD ALIGN=RIGHT NOWRAP><%= Util.formatCell(userPO.getHeader14()) %></TD>
			      <TD ALIGN=RIGHT NOWRAP><%= Util.formatCell(userPO.getHeader15()) %></TD>
			      <TD ALIGN=RIGHT NOWRAP><%= Util.formatCell(userPO.getHeader16()) %></TD>
			    </TR>			      
  </TABLE>
  <BR>
  
<%        
  }
%> 
</FORM>

</BODY>
</HTML>
