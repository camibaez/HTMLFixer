<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<title>Search Orders</title>
<META http-equiv="Pragma" content="No-cache">
<META http-equiv="Pragma" content="No-cache">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script language="javascript">
//<!-- Hide from old browsers
function enter(order,a,b,c,d,e,f,g) {

	var form = top.opener.document.forms[0];

//  	if(top.opener.fieldAux1 != ""){form[top.opener.fieldAux1].value = order;}
	form[top.opener.fieldName].value = order ;
	if (form[top.opener.fieldName].type != "hidden") form[top.opener.fieldName].focus();
		else form[top.opener.fieldAux1].focus();
	form[top.opener.fieldName].select();
  		
	top.close();
}

function goSearch(){
	document.forms[0].submit();
}
//-->
</script>
<TITLE></TITLE>
</HEAD>
<jsp:useBean id= "ewd0440Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<BODY>

<%@ page import="datapro.eibs.master.Util" %>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<FORM>
	<INPUT TYPE=HIDDEN NAME="CUSNO" VALUE="0">
<%
	if ( ewd0440Help.getNoResult() ) {
%>
 		<TABLE class="tbenter" width=100% height=100%>
 		<TR>
      <TD> 
        
      <div align="center"> <font size="3"><b> There is no results, please refine your search criteria or select 
            one of the following options</b></font> 
      </div>
      </TD></TR>
   		</TABLE>
<%
	}
	else {
%>
 
  <table id="TBHELP">
	<tr>
	<td nowrap><b>Filter orders by Portfolio: </b></td>
  	<td nowrap>
	<input type="text" name="CUSTOMER"  size=10 maxlength=9  value="<%= userPO.getCusNum().trim()%>">
	&nbsp;&nbsp;<a href="javascript:goSearch();">

    	 	<input id="EIBSBTN" type=submit name="Submit" value="Submit">
	</a>
    			&nbsp;&nbsp;<a href="javascript:GetCPortfolioNumDesc('CUSTOMER','CUSNO','','0')"></a> 
	</td>
    </tr>
  </table>
  <TABLE class="tableinfo" style="width:95%" ALIGN=CENTER>
          <tr id="trdark"> 
            <th align=CENTER nowrap> 
              <div align="center">Order<br>
                Number</div>
            </th>
            <th align=CENTER nowrap>Operation<BR>
              Type</th>
            <th align=CENTER nowrap>Type </th>
            <th align=CENTER nowrap>Description</th>
            <th align=CENTER nowrap> 
              <div align="center">Portfolio</div>
                Number</th>
            <th align=CENTER nowrap> 
              <div align="center">Officer</div>
                Code</th>
            <th align=CENTER nowrap>Trade <BR>
              Date</th>
            <th align=CENTER nowrap>Settlement <BR>
              Date</th>
            <th align=CENTER nowrap> 
              <div  align="center">Status</div>
            </th>
          </tr>
     	<%
        ewd0440Help.initRow(); 
		boolean firstTime = true;
		String chk = "";
        while (ewd0440Help.getNextRow()) {
			if (firstTime) {
				firstTime = false;
				chk = "checked";
			} else {
				chk = "";
			}
           datapro.eibs.beans.EWD0440DSMessage msg = (datapro.eibs.beans.EWD0440DSMessage) ewd0440Help.getRecord();
     	%>               
        <TR>
			<td NOWRAP><a href="javascript:enter('<%=msg.getSWDNUM()%>','<%=msg.getSWDTDS()%>','<%=msg.getSWDPTY()%>','<%=msg.getSWDIDS()%>','<%=msg.getSWDPRF()%>','<%=msg.getSWDEMI()%>','<%= Util.formatDate(msg.getSWDIN1(),msg.getSWDIN2(),msg.getSWDIN3())%>','<%=Util.formatDate(msg.getSWDST1(),msg.getSWDST2(),msg.getSWDST3())%>')"><%=Util.formatCell(msg.getSWDNUM())%></a></td>
			<td NOWRAP><a href="javascript:enter('<%=msg.getSWDNUM()%>','<%=msg.getSWDTDS()%>','<%=msg.getSWDPTY()%>','<%=msg.getSWDIDS()%>','<%=msg.getSWDPRF()%>','<%=msg.getSWDEMI()%>','<%= Util.formatDate(msg.getSWDIN1(),msg.getSWDIN2(),msg.getSWDIN3())%>','<%=Util.formatDate(msg.getSWDST1(),msg.getSWDST2(),msg.getSWDST3())%>')"><%=Util.formatCell(msg.getSWDTDS())%></a></td>
			<td NOWRAP><a href="javascript:enter('<%=msg.getSWDNUM()%>','<%=msg.getSWDTDS()%>','<%=msg.getSWDPTY()%>','<%=msg.getSWDIDS()%>','<%=msg.getSWDPRF()%>','<%=msg.getSWDEMI()%>','<%= Util.formatDate(msg.getSWDIN1(),msg.getSWDIN2(),msg.getSWDIN3())%>','<%=Util.formatDate(msg.getSWDST1(),msg.getSWDST2(),msg.getSWDST3())%>')"><%=Util.formatCell(msg.getSWDPTY())%></a></td>
			<td NOWRAP><a href="javascript:enter('<%=msg.getSWDNUM()%>','<%=msg.getSWDTDS()%>','<%=msg.getSWDPTY()%>','<%=msg.getSWDIDS()%>','<%=msg.getSWDPRF()%>','<%=msg.getSWDEMI()%>','<%= Util.formatDate(msg.getSWDIN1(),msg.getSWDIN2(),msg.getSWDIN3())%>','<%=Util.formatDate(msg.getSWDST1(),msg.getSWDST2(),msg.getSWDST3())%>')"><%=Util.formatCell(msg.getSWDIDS())%></a></td>
			<td NOWRAP><a href="javascript:enter('<%=msg.getSWDNUM()%>','<%=msg.getSWDTDS()%>','<%=msg.getSWDPTY()%>','<%=msg.getSWDIDS()%>','<%=msg.getSWDPRF()%>','<%=msg.getSWDEMI()%>','<%= Util.formatDate(msg.getSWDIN1(),msg.getSWDIN2(),msg.getSWDIN3())%>','<%=Util.formatDate(msg.getSWDST1(),msg.getSWDST2(),msg.getSWDST3())%>')"><%=Util.formatCell(msg.getSWDPRF())%></a></td>
			<td NOWRAP><a href="javascript:enter('<%=msg.getSWDNUM()%>','<%=msg.getSWDTDS()%>','<%=msg.getSWDPTY()%>','<%=msg.getSWDIDS()%>','<%=msg.getSWDPRF()%>','<%=msg.getSWDEMI()%>','<%= Util.formatDate(msg.getSWDIN1(),msg.getSWDIN2(),msg.getSWDIN3())%>','<%=Util.formatDate(msg.getSWDST1(),msg.getSWDST2(),msg.getSWDST3())%>')"><%=Util.formatCell(msg.getSWDEMI())%></a></td>
			<td NOWRAP><a href="javascript:enter('<%=msg.getSWDNUM()%>','<%=msg.getSWDTDS()%>','<%=msg.getSWDPTY()%>','<%=msg.getSWDIDS()%>','<%=msg.getSWDPRF()%>','<%=msg.getSWDEMI()%>','<%= Util.formatDate(msg.getSWDIN1(),msg.getSWDIN2(),msg.getSWDIN3())%>','<%=Util.formatDate(msg.getSWDST1(),msg.getSWDST2(),msg.getSWDST3())%>')"><%=Util.formatDate(msg.getSWDIN1(),msg.getSWDIN2(),msg.getSWDIN3())%></a></td>
			<td NOWRAP><a href="javascript:enter('<%=msg.getSWDNUM()%>','<%=msg.getSWDTDS()%>','<%=msg.getSWDPTY()%>','<%=msg.getSWDIDS()%>','<%=msg.getSWDPRF()%>','<%=msg.getSWDEMI()%>','<%= Util.formatDate(msg.getSWDIN1(),msg.getSWDIN2(),msg.getSWDIN3())%>','<%=Util.formatDate(msg.getSWDST1(),msg.getSWDST2(),msg.getSWDST3())%>')"><%=Util.formatDate(msg.getSWDST1(),msg.getSWDST2(),msg.getSWDST3())%></a></td>
			<td NOWRAP><a href="javascript:enter('<%=msg.getSWDNUM()%>','<%=msg.getSWDTDS()%>','<%=msg.getSWDPTY()%>','<%=msg.getSWDIDS()%>','<%=msg.getSWDPRF()%>','<%=msg.getSWDEMI()%>','<%= Util.formatDate(msg.getSWDIN1(),msg.getSWDIN2(),msg.getSWDIN3())%>','<%=Util.formatDate(msg.getSWDST1(),msg.getSWDST2(),msg.getSWDST3())%>')"><%=Util.formatCell(msg.getSWDSDS())%></a></td>
		</TR>   		
    	<%}%>   
  </TABLE>
  <TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR>
 	<%
        if ( ewd0440Help.getShowPrev() ) {
      			int pos = ewd0440Help.getFirstRec() - 40;
	%>
	<TD WIDTH="50%" ALIGN=LEFT height="25">
		<A HREF="<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0440?FromRecord=<%=pos%>" > 
			<img src="<%=request.getContextPath()%>/images/e/previous_records.gif" border=0></A>		
	</TD>
	<%  }
        if ( ewd0440Help.getShowNext() ) {
      			int pos = ewd0440Help.getLastRec() -19 ;        
	%> 
	<TD WIDTH="50%" ALIGN=LEFT height="25">
		<A HREF="<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0440?FromRecord=<%=pos%>" > 
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