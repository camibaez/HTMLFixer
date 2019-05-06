<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>System Reference codes</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ESD003001Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<script language="JavaScript">

function goAction(op) {
	
	if( document.getElementById("code").value == "" ){
		alert("Must Select a Table");
	}else {
		document.forms[0].opt.value = op;
		document.forms[0].submit();
	}

}

function exit() {
	parent.document.location.href = "<%=request.getContextPath()%>/pages/background.jsp";
}

function closeEnter(){
      document.getElementById("enterACC").style.visibility="hidden";
}

function ShowEnterCod() {	 
	 var y=event.clientY + document.body.scrollTop;
     var x=event.clientX + document.body.scrollLeft;
	 cancelBub();
	 eval('enterACC.style.pixelTop=' + y);
     eval('enterACC.style.pixelLeft=' + x);
     document.getElementById("enterACC").style.visibility="visible";
}

function cancelBub(){
  	event.cancelBubble = true;
}

document.onclick= closeEnter;

</SCRIPT>  

</head>

<BODY>
<h3 align="center">Reference Codes Tables<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cnof_enter_list.jsp, ESD0030"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0030" target="_parent">
    <input type=HIDDEN name="SCREEN" value="400">
    <input type=HIDDEN name="totalRow" value="0">
    <input type=HIDDEN name="opt">
 	<div id="enterACC" style="position:absolute; visibility:hidden; left:25px; top:-50px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)" onclick="cancelBub()">
 		<TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
			border-color: #0b23b5;
			border-style : solid solid solid solid;
			filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
			<tr id="trdark"> 
      			<td align=CENTER width="18%"><div align="right">Reference Code :</div></td>
      			<td align=CENTER width="34%"> 
        			<div align="left"> 
         				<input type="text" id="code" name="TABLECODE" size="7" maxlength="6" > 
		 				<input type="text" id="description" name="TABLEDESC" size="35" maxlength="35" > 
        			</div>
      			</td>
    		</tr>
   			<tr id="trclear">
   				<TD ALIGN=center nowrap colspan="2"><input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="goAction(2)"></TD>
   			</tr>
 		</TABLE>
	</div>
	
<%	if ( ESD003001Help.getNoResult() ) { %>
	  <p>&nbsp;</p>
	  <p>&nbsp;</p>
	  <p>&nbsp;</p>
	  <p>&nbsp;</p>
	  <p>&nbsp;</p>
	  <TABLE class="tbenter" width="100%" >
	    <TR>
	      <TD > 
	        <div align="center"> 
	          <p><b>There is not match for your search criteria</b></p>
	          <p>&nbsp;</p>
	          
	        </div>
	
		  </TD>
		</TR>
	    </TABLE>
<% } else { 
	 if ( !error.getERRNUM().equals("0")  ) {
	     error.setERRNUM("0");
	     out.println("<SCRIPT Language=\"Javascript\">");
	     out.println("       showErrors()");
	     out.println("</SCRIPT>");
     }
%> 

  	<table class="tbenter" width=100% align=center>
    	<tr> 
      		<td class=TDBKG width="33%"><div align="center"><a href="javascript:goAction(2)"><b>Maintenance</b></a></div></td>
      		<td class=TDBKG width="33%"><div align="center" style="cursor:hand" onClick="ShowEnterCod()"><a><b>Search</b></a></div></td>
      		<td class=TDBKG width="33%"><div align="center"><a href="javascript:exit()"><b>Exit</b></a></div></td>
    	</tr>
  	</table>
  	
  	<br>
  	
  	<TABLE  id="mainTable" class="tableinfo" ALIGN=CENTER style="width='95%'">
		<TR id="trdark">  
        	<th align=CENTER nowrap width="20%"><div align="center">Classification</div></th>
            <th align=CENTER nowrap width="80%"><div align="center">Description</div></th>
        </TR>
  	</table>
<%	} %>

</form>
</body>
</html>
