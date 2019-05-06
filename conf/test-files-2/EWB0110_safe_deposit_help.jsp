<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import ="datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<TITLE>Safe Deposit Locations List</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "msgList" 	class= "datapro.eibs.beans.JBObjList"  			scope="session" />
<jsp:useBean id= "error" 	class= "datapro.eibs.beans.ELEERRMessage"  		scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos"  			scope="session"/>

<SCRIPT language="javascript" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT language="javascript">

function enter(name,type,loc,client) {
	var form = top.opener.document.forms[0];
	form[top.opener.fieldName].value = name;
	if(top.opener.fieldAux1 != ""){top.opener.document.forms[0][top.opener.fieldAux1].value = type};
	if(top.opener.fieldAux2 != ""){top.opener.document.forms[0][top.opener.fieldAux2].value = loc};
	if(top.opener.fieldAux3 != ""){top.opener.document.forms[0][top.opener.fieldAux3].value = client};
	top.close();
}

</SCRIPT>  

</HEAD>
<BODY>
<h3 align="center">Safe Deposit Box<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="safe_deposit_help, EWB0110"></H3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.safedeposit.JSESB0110" >

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

<CENTER>
<TABLE id="mainTable" class="tableinfo">
	<TBODY>
		<TR>
			<TD nowrap valign="top">
			<TABLE id="dataTable" width="100%">
				<TBODY>
					<TR id="trdark">
						<TH align="CENTER">Safe Deposit<BR>
						Number</TH>
						<TH align="CENTER">Type</TH>
						<TH align="CENTER">Location</TH>
			    		<TH ALIGN=CENTER >Client</TH>
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
           datapro.eibs.beans.ESB011001Message msgPart = (datapro.eibs.beans.ESB011001Message) msgList.getRecord();
     	%>
					<TR>
						<TD nowrap align="CENTER"><a 
							href="javascript:enter('<%=Util.formatCell(msgPart.getE01SBMCOD())%>','<%=Util.formatCell(msgPart.getD01SBTDSC())%>'
								,'<%=Util.formatCell(msgPart.getD01LOCNME())%>','<%=Util.formatCell(msgPart.getD01CUSNA1())%>')">
							<%=Util.formatCell(msgPart.getE01SBMCOD())%>
						</TD>
						<TD nowrap align="CENTER"><a
							href="javascript:enter('<%=Util.formatCell(msgPart.getE01SBMCOD())%>','<%=Util.formatCell(msgPart.getD01SBTDSC())%>'
								,'<%=Util.formatCell(msgPart.getD01LOCNME())%>','<%=Util.formatCell(msgPart.getD01CUSNA1())%>')">
							<%=Util.formatCell(msgPart.getD01SBTDSC())%>
						</TD>
						<TD nowrap align="CENTER"><a
							href="javascript:enter('<%=Util.formatCell(msgPart.getE01SBMCOD())%>','<%=Util.formatCell(msgPart.getD01SBTDSC())%>'
								,'<%=Util.formatCell(msgPart.getD01LOCNME())%>','<%=Util.formatCell(msgPart.getD01CUSNA1())%>')">
							<%=Util.formatCell(msgPart.getD01LOCNME())%>
						</TD>	
						<TD nowrap align="CENTER"><a
							href="javascript:enter('<%=Util.formatCell(msgPart.getE01SBMCOD())%>','<%=Util.formatCell(msgPart.getD01SBTDSC())%>'
								,'<%=Util.formatCell(msgPart.getD01LOCNME())%>','<%=Util.formatCell(msgPart.getD01CUSNA1())%>')">
							<%=Util.formatCell(msgPart.getD01CUSNA1())%>
						</TD>											
					</TR>
					<%}%>
				</TBODY>
			</TABLE>
			</TD>
		</TR>
	</TBODY>
</TABLE>
</CENTER>

<%}%>
</FORM>
</BODY>
</HTML>
