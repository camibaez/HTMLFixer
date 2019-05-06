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
	builtNewMenu(cd_m_opt);
	initMenu();
   
function getNew(val,cod) {
    if (cod == "C") {
		document.forms[0].CODE.value = '18';
	} else if (cod == "D") { 
		document.forms[0].CODE.value = '35';
	} 
	document.forms[0].CURRENTROW.value = val;
	document.forms[0].SCREEN.value = '500';
	var y=event.clientY + document.body.scrollTop;
	var x=event.clientX + document.body.scrollLeft;
	ShowNew(x,y);	
}

function goAction(opt) {
    if (opt == "C") {
		document.forms[0].CODE.value = '18';
	} else if (opt == "D") { 
		document.forms[0].CODE.value = '35';
	} 
	document.forms[0].SCREEN.value = '500';
	var y=event.clientY + document.body.scrollTop;
	var x=event.clientX + document.body.scrollLeft;
	ShowNew(x,y);	
}

function closeEnter(){
   	enterNew.filters[0].apply();
    enterNew.style.visibility="hidden";
    enterNew.filters[0].Play();
}

function ShowNew(x,y) {	 
	cancelBub();
	eval('enterNew.style.pixelTop=' + y);
	eval('enterNew.style.pixelLeft=' + x);
	enterNew.filters[0].apply();
    enterNew.style.visibility="visible";
    enterNew.filters[0].Play();
	document.forms[0].E01IRDNTC.focus();
}

function cancelBub(){
  event.cancelBubble = true;
}

function SetErrorVisible(){	 
	 var myValue = document.forms[0].E01IRDNTC.value;

	 if (true) { // verify myValue Here
	 	document.forms[0].E01IRDNTC.onkeypress = "";
     	errorMsg.style.visibility="hidden";
	 } else {
	 	document.forms[0].E01IRDNTC.onkeypress="";
	 	document.forms[0].E01IRDNTC.value="";
    	errorMsg.style.visibility="visible";
	 }
}

document.onclick= closeEnter;

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

<h3 align="center">IRA Activity Corrections<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="ira_activity_corrections_list, EIRA010"></H3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEIRA010" >
 <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="500">
 <INPUT TYPE=HIDDEN NAME="CODE" VALUE="">

<div id="enterNew" style="position:absolute; visibility:hidden; left:25px; top:-50px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)" onclick="cancelBub()">
 <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
	<tr id="trdark"> 
      <td align=CENTER nowrap valign="bottom"> 
        <div align="right">New Type:</div>
        <div id="errorMsg" align="left" style="visibility:hidden;">(No Valid)</div>
      </td>
      <td align=CENTER nowrap> 
        <div align="left"> 
          <input type="text" name="E01IRDNTC" size="3" maxlength="3" onchange="SetErrorVisible()">
			<A href="javascript:GetCodeCNOFC('E01IRDNTC',document.forms[0].CODE.value)">
			<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></A>
          <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom"> 			
        </div>
      </td>
         <TD ALIGN=center nowrap >
	     <input id="ESBSBTN" type=submit name="Submit" value="Submit"> 
   </TD>
    </tr>

 </TABLE>
 </div>
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

 <table class="tableinfo">
  <TR> 
    <TD NOWRAP valign=top>
  	 <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
   	
   	<TR id="trdark">
      	<TD nowrap> 
        	<div align="right">Customer :</div>
      	</TD>
      	<TD nowrap>
        <div align="left"> 
        <INPUT type="text" name="D01DEACUN" size="10" maxlength="10"
			value="<%= userPO.getHeader1() %>" readonly>
		<INPUT type="text" name="D01CUSNA1" size="45" maxlength="45"
			value="<%= userPO.getHeader2() %>" readonly></div>
		</TD>
      <TD nowrap>
		<div align="right">Account :</div>
		</TD>
      <TD nowrap>
        <div align="left"> 
        <INPUT type="text" name="E01IRDACC" size="10" maxlength="10"
			value="<%= userPO.getHeader3() %>" readonly></div>
		</TD>
   	</TR>    	
   	<TR id="trdark">
		<TD nowrap>
		<DIV align="right">IRA Type</DIV>
				</TD>
		<TD nowrap>
		<div align="left"><INPUT type="text" name="E01IRATYP" size="25"
			maxlength="25" value="<%= userPO.getHeader4() %>" readonly></div>
		</TD>
      <TD nowrap> 
        <div align="right"> 
        TAX  Year :</div>
      </TD>
      <TD nowrap>
        <div align="left"> 
        <INPUT type="text" name="E01IRDYEA" size="10" maxlength="10"
			value="<%= userPO.getHeader5() %>" readonly></div>      
      </TD>
   	</TR>	
   	<TR id="trdark">
      <TD nowrap>
				<div align="right">Beginning Balance :</div>
				</TD>
      <TD nowrap>
		<div align="left"><INPUT type="text" name="D01BEGBAL" size="10"
			maxlength="10" value="<%= userPO.getHeader6() %>" readonly></div>
		</TD>
      <TD nowrap> 
        <div align="right">Ending Balance :</div>
      </TD>
      <TD nowrap>
		<div align="left"><INPUT type="text" name="D01ENDBAL" size="25"
			maxlength="25" value="<%= userPO.getHeader7() %>" readonly></div>
		</TD>
   	</TR>   	
   		
   </TABLE>
       </TD>
   </TR>	
</TABLE>
<%
	boolean firstTime = true;
	String chk = "";
	int numCon = 0;
	int numDis = 0;
	msgList.initRow();
	while (msgList.getNextRow()) {
		datapro.eibs.beans.EIRA01001Message msgPart1 = (datapro.eibs.beans.EIRA01001Message) msgList.getRecord();
		if (msgPart1.getD01TRNDSC().equals("CONTRIBUTIONS")) {
			numCon++;
		} else if (msgPart1.getD01TRNDSC().equals("DISTRIBUTIONS")) {
			numDis++;
		}
	}
	if (numCon > 0) {
%>
<h4>CONTRIBUTIONS</h4>
 <TABLE  id="mainTable" class="tableinfo" >
  <TR><TD> 
		<TABLE id="dataTable" width="100%">
  		<TR id="trdark"> 
  			
  			<TH ALIGN=CENTER nowrap width="5%">Modify</TH>
  			<TH ALIGN=CENTER nowrap width="60%">
  				<div align="center" style="cursor: hand" onClick="goAction('C')"><a><b>Type</b></a>
	    		</div></TH>
    		<TH ALIGN=CENTER nowrap width="20%">Amount</TH>
    		<TH ALIGN=CENTER nowrap width="15%">Date</TH>
  		</TR>
     	<%
        msgList.initRow(); 
        while (msgList.getNextRow()) {
			if (firstTime) {
				firstTime = false;
				chk = "checked";
			} else {
				chk = "";
			}
           datapro.eibs.beans.EIRA01001Message msgPart = (datapro.eibs.beans.EIRA01001Message) msgList.getRecord();
           if (msgPart.getD01TRNDSC().equals("CONTRIBUTIONS")) {
%>
        <TR>
			
			<TD NOWRAP ALIGN="CENTER" width="5%" onClick="javascript:getNew('<%= msgList.getCurrentRow()%>','C')"><img name="Image1" border="0" src="<%=request.getContextPath()%>/images/e/modify.gif"></TD>
			<TD NOWRAP ALIGN="LEFT" width="60%" ><%=Util.formatCell(msgPart.getD01COD1DS())%></TD>
			<TD NOWRAP ALIGN="RIGHT" width="20%"><%=Util.formatCell(msgPart.getE01IRDAMT())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="15%"><%=Util.formatCell(msgPart.getE01IRDDT1()) + "/" +
					 Util.formatCell(msgPart.getE01IRDDT2()) + "/" + Util.formatCell(msgPart.getE01IRDDT3())%></TD>
		</TR>    		
<%			}
		}
%>    
     	</TABLE>
     	</TD>
   </TR>	
</TABLE>
<%
	} //numCon > 0
	if (numDis > 0) {
%>
<h4>DISTRIBUTIONS</h4>
 <TABLE  id="mainTable" class="tableinfo" >
  <TR><TD> 
		<TABLE id="dataTable" width="100%">
  		<TR id="trdark"> 
  			
  			<TH ALIGN=CENTER nowrap width="5%">Modify</TH>
  			<TH ALIGN=CENTER nowrap width="60%">
  				<div align="center" style="cursor: hand" onClick="goAction('D')"><a><b>Type</b></a>
	    		</div></TH>
    		<TH ALIGN=CENTER nowrap width="20%">Amount</TH>
    		<TH ALIGN=CENTER nowrap width="15%">Date</TH>
  		</TR>
     	<%
        msgList.initRow(); 
        while (msgList.getNextRow()) {
			if (firstTime) {
				firstTime = false;
				chk = "checked";
			} else {
				chk = "";
			}
           datapro.eibs.beans.EIRA01001Message msgPart = (datapro.eibs.beans.EIRA01001Message) msgList.getRecord();
           if (msgPart.getD01TRNDSC().equals("DISTRIBUTIONS")) {
%>
        <TR>
			
			<TD NOWRAP ALIGN="CENTER" width="5%" onClick="javascript:getNew('<%= msgList.getCurrentRow()%>','D')"><img name="Image1" border="0" src="<%=request.getContextPath()%>/images/e/modify.gif"></TD>
			<TD NOWRAP ALIGN="LEFT" width="60%"><%=Util.formatCell(msgPart.getD01COD1DS())%></TD>
			<TD NOWRAP ALIGN="RIGHT" width="20%"><%=Util.formatCell(msgPart.getE01IRDAMT())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="15%"><%=Util.formatCell(msgPart.getE01IRDDT1()) + "/" + Util.formatCell(msgPart.getE01IRDDT2()) + "/" + Util.formatCell(msgPart.getE01IRDDT3())%></TD>
		</TR>    		
<%			}
		}
%>    
     	</TABLE>
     	</TD>
   </TR>	
</TABLE>
<%
	} //numDis > 0
%>
<SCRIPT language="JavaScript">
  //showChecked("ROW"); 
  //document.forms[0].D01DEACUN.click();
</SCRIPT>

<%}%>
</FORM>
</BODY>
</HTML>
