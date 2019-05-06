<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import ="datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<TITLE>Assessment Area</TITLE>
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
		document.forms[0].SCREEN.value = '100';
		var y=event.clientY + document.body.scrollTop;
		var x=event.clientX + document.body.scrollLeft;
		ShowNew(x,y);  		
	} else if (opt == "M") { 
		document.forms[0].SCREEN.value = '200';
  		document.forms[0].submit();
	} else if (opt == "I") { 
		document.forms[0].SCREEN.value = '300';
  		document.forms[0].submit();
  	} else if (opt == "D") {
      		ok = confirm("Are you sure you want to delete this record?");
		document.forms[0].SCREEN.value = '400';
	  	if (ok) document.forms[0].submit();
  	}
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
	document.forms[0].E01CRAARN.focus();
}

function cancelBub(){
  event.cancelBubble = true;
}

function SetErrorVisible(){	 
	 var myValue = document.forms[0].E01CRAARN.value;

	 if (true) { // verify myValue Here
	 	document.forms[0].E01CRAARN.onkeypress = "";
     	errorMsg.style.visibility="hidden";
	 } else {
	 	document.forms[0].E01CRAARN.onkeypress="";
	 	document.forms[0].E01CRAARN.value="";
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

<h3 align="center">Assessment Area<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="assessment_area_list, <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECRA010"></H3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECRA010" >
 <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">

<div id="enterNew" style="position:absolute; visibility:hidden; left:25px; top:-50px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)" onclick="cancelBub()">
 <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
	<tr id="trdark"> 
      <td align=CENTER width="25%"> 
        <div align="right">Area Number:</div>
        <div id="errorMsg" align="left" style="visibility:hidden;">(No Valid)</div>
      </td>
      <td align=CENTER width="75%"> 
        <div align="left"> 
          <input type="text" name="E01CRAARN" size="5" maxlength="4" onchange="SetErrorVisible()">
          <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom"> 
        </div>
      </td>
    </tr>
   <tr id="trclear">
   
   <TD ALIGN=center nowrap colspan="2">
	     <input id="ESBSBTN" type=submit name="Submit" value="Submit"> 
   </TD>
   
   </tr>
 </TABLE>
 </div>

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
        <div align="center"><a href="javascript:goAction('I')">Inquiry</a> 
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
    		<TH ALIGN=CENTER >Assessment<BR>
				Area Number</TH>
    		<TH ALIGN=CENTER >Description</TH>
    		<TH ALIGN=CENTER >Military Personnel<BR>Assessment Area
				</TH>
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
           datapro.eibs.beans.ECRA01001Message msgPart = (datapro.eibs.beans.ECRA01001Message) msgList.getRecord();
     	%>               
        <TR>
			<TD NOWRAP width="2%"><input type="radio" name="ROW" value="<%= msgList.getCurrentRow()%>" <%=chk%> onClick="document.forms[0].CURRENTROW.value = this.value;"></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgPart.getE01CRAARN())%></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgPart.getE01CRAADS())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="2%">
				<input type="checkbox" name="CHECK" value="<%= msgPart.getE01CRAMPF()%>" 
						<%if (msgPart.getE01CRAMPF().equals("2")) { out.print("checked"); }%> readonly disabled>
			</TD>
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
