<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*,java.util.Iterator" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Letter of Credit Transfer List</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR"
	content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="jbList" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<script language="javascript">
// var reason = '';
 var accOfac = '';
 var accWarn = '';

 function goAction(op) {
	if(op == "N"){
		document.forms[0].opCode.value = '0001';
		document.forms[0].submit();		 
	}else if(op == "M"){
		document.forms[0].opCode.value = '0002';
		document.forms[0].submit();
	}
 }

 function showAddInfo(idxRow){
   tbAddInfo.rows[0].cells[1].style.color="blue";   
   tbAddInfo.rows[0].cells[1].innerHTML=extraInfo(document.forms[0]["TXTDATA"+idxRow].value,9);
   }   
  
  
 function extraInfo(textfields,noField) {
 var pos=0
 var s= textfields;
 for ( var i=0; i<noField ; i++ ) {
   pos=textfields.indexOf("<br>",pos+1);
  }
 s=textfields.substring(0,pos);
 return(s);
 }
 
</script>
</HEAD>
<BODY>

<%if (!error.getERRNUM().equals("0")) {
	out.println("<SCRIPT Language=\"Javascript\">");
	out.println("       showErrors()");
	out.println("</SCRIPT>");
}
%>

<H3 align="center">Letter of Credit Transfer<IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"	name="EIBS_GIF" alt="lc_tranfer_list, ELC0510"></H3>
<HR size="4">

<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0510">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="106">
<INPUT TYPE=HIDDEN NAME="opCode" value="opCode">
<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">

<TABLE class="tbenter">
	<TR>
		<TD class=TDBKG>
		<div align="center"><a href="javascript:goAction('N')"><b>New</b></a></div>
		</TD>
		<TD class=TDBKG>
		<div align="center"><a href="javascript:goAction('M')"><b>Maintenance</b></a></div>
		</TD>
		<TD class=TDBKG>
		<div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
		</TD>
	</TR>
</TABLE>

<% if (jbList.getNoResult()) { 
   		out.print("<H4><center><BR><BR><B>There are not transfers for this letter of credit</B></center></H4>");
   } else { %>
<TABLE id="mainTable" class="tableinfo">
	<TR>
		<TD NOWRAP valign="top">
		<TABLE id="headTable" width="100%">
			<TR id="trdark">
				<TH ALIGN=CENTER nowrap></TH>
				<TH ALIGN=CENTER nowrap>Number</TH>
				<TH ALIGN=CENTER nowrap>Amount</TH>
				<TH ALIGN=CENTER nowrap>Benificiary</TH>
				<TH ALIGN=CENTER nowrap>Identification</TH>
			</TR>
			<%	int k = 0;
				jbList.initRow();
				boolean firstTime = true;
				String chk = "";
				while (jbList.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
				ELC051005Message msgPart = (ELC051005Message) jbList.getRecord();%>
			<TR>
				<TD NOWRAP><input type="radio" name="E05LCTNUM"
					value="<%=msgPart.getE05LCTNUM()%>" onClick="showAddInfo(<%=k%>)"
					<%=chk%>></TD>
				<TD NOWRAP ALIGN="LEFT"><a href="javascript:goAction('M');"><%=Util.formatCell(msgPart.getE05LCTNUM())%></a></TD>
				<TD NOWRAP ALIGN="CENTER"><a href="javascript:goAction('M');"><%=Util.formatCell(msgPart.getE05LCTAMT())%></a></TD>
				<TD NOWRAP ALIGN="CENTER"><a href="javascript:goAction('M');"><%=Util.formatCell(msgPart.getE05LCTBN1())%></a></TD>
				<TD NOWRAP ALIGN="CENTER"><a href="javascript:goAction('M');"><%=Util.formatCell(msgPart.getE05LCTBID())%></a>
				<%	String ls = "";
					ls += Util.formatCell(msgPart.getE05LCMBNK()) + "<br>";
					ls += Util.fcolorCCY(msgPart.getE05LCMORF()) + "<br>";
					ls += Util.formatCell(msgPart.getE05LCMTRF()) + "<br>";
					ls += Util.formatCell(msgPart.getE05LCMPRO()) + "<br>";
					ls += Util.formatCell(msgPart.getE05LCMMEB()) + "<br>";%>
				<INPUT TYPE="HIDDEN" NAME="TXTDATA<%=k%>" value="<%=ls%>"></TD>
			</TR>
				<%	k++;
				}%>
		</TABLE>
		</TD>
		<TD nowrap ALIGN="RIGHT" valign="top">
		<Table id="tbAddInfoH" width="100%">
			<tr id="trdark">
				<TH ALIGN=CENTER nowrap>Basic Information</TH>
			</tr>
		</Table>

		<Table id="tbAddInfo">
			<tr id="trclear"><TD ALIGN="RIGHT" valign="middle" nowrap>
				<b>Bank : <br>
				Our Reference : <br>
				Their Reference : <br>
				Product : <br>
				Available Amount : </b><BR>
				</TD>
				<TD ALIGN="LEFT" valign="middle" nowrap class="tdaddinfo"></TD>
			</tr>
		</Table>
		</TD>
	</TR>
</TABLE>


<SCRIPT language="JavaScript">
	  function resizeDoc() {
		  showAddInfo(0);
	  }
	  resizeDoc();
</SCRIPT>

<% } %>

</FORM>
</BODY>
</HTML>
