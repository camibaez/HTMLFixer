<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Services Charges List</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "ccList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">

function closeEnter(){
   	  enterACC.filters[0].apply();
      enterACC.style.visibility="hidden";
      enterACC.filters[0].Play();
}

function ShowEnterCod() {	 
	 var y=event.clientY + document.body.scrollTop;
     var x=event.clientX + document.body.scrollLeft;
	 cancelBub();
	 eval('enterACC.style.pixelTop=' + y);
     eval('enterACC.style.pixelLeft=' + x);
	 enterACC.filters[0].apply();
     enterACC.style.visibility="visible";
     enterACC.filters[0].Play();
	 
}

function goAction(op) {
    document.forms[0].opt.value = op;
    document.forms[0].submit();
}

function goDelete() {
	var ok = true;
	ok = confirm("Are you sure you want to Delete this item?");
	if (ok) {
	    document.forms[0].SCREEN.value = "9";
	    document.forms[0].submit();
    }
}

function setInfo(bnk, stn, aty) {
    document.forms[0].STN.value = stn;
    document.forms[0].BNK.value = bnk;
    document.forms[0].ATY.value = aty;
}

function cancelBub(){
  event.cancelBubble = true;
}

document.onclick= closeEnter;

</SCRIPT>
</head>

<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
	 error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }

%>

<h3 align="center">Services Charges Structure List<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="sc_list.jsp, EDC0600"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDC0600">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="3">
  <INPUT TYPE=HIDDEN NAME="opt" VALUE="">
  <INPUT TYPE=HIDDEN NAME="BNK" VALUE="">
  <INPUT TYPE=HIDDEN NAME="STN" VALUE="">
  <INPUT TYPE=HIDDEN NAME="ATY" VALUE="">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
  <div id="enterACC" style="position:absolute; visibility:hidden; left:25px; top:-50px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)" onClick="cancelBub()"> 
    <table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
      <tr id="trdark"> 
        <td align=CENTER width="18%"> 
          <div align="right">Bank :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" name="NEWBNK" size="3" maxlength="2" onkeypress="enterInteger()">
          </div>
        </td>
      </tr>
      <tr id="trclear"> 
        <td align=CENTER width="18%"> 
          <div align="right">Structure Number :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" name="NEWSTN" size="3" maxlength="2" onkeypress="enterInteger()">
          </div>
        </td>
      </tr>
      <tr id="trdark"> 
        <td align=CENTER width="18%"> 
          <div align="right">Account Type :</div>
        </td>
        <td align=left width="34%"> 
              <select name="NEWATY">
                <option value="CLT" selected>Collections</option>
              </select>
        </td>
      </tr>
      
      <tr id="trclear"> 
        <td align=center nowrap colspan="2"> 
          <input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="javascript:goAction('N')">
        </td>
      </tr>
      
    </table>
  </div>
         
<%
	if ( ccList.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center"> There is no Match for your Search Criteria. <br>Click New to add one</h4> 
      </div>
      </TD></TR>
   	</TABLE>
   	<TABLE class="tbenter">
    <TR>
      <TD ALIGN=CENTER class="TDBKG" width="50%">
   	<%--	<a href="javascript:goAction('N')">New</a> --%>
   		<div align="center" style="cursor:hand" onClick="ShowEnterCod()"><a><b>New</b></a></div>
      </TD>      
      <TD ALIGN=CENTER class="TDBKG" width="50%">
  		<div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
      </TD>
    </TR>
  </TABLE>
<%
	}
	else {
%>
  
  <TABLE class="tbenter">
    <TR>
      <TD ALIGN=CENTER class="TDBKG" width="33%">
  		<div align="center" style="cursor:hand" onClick="ShowEnterCod()"><a>New</a>
      </TD>
      <TD ALIGN=CENTER class="TDBKG" width="33%">
  		<a href="javascript:goAction('M')">Maintenance</a>
      </TD>   
      <TD ALIGN=CENTER class="TDBKG" width="33%">
  		<a href="javascript:goDelete()">Delete</a>
      </TD>               
      <TD ALIGN=CENTER class="TDBKG" width="34%">
  		<a href="<%=request.getContextPath()%>/pages/background.jsp">Exit</a>
      </TD>
    </TR>
  </TABLE>
  <TABLE class="tableinfo" id="dataTable">
    <TR id="trdark">
      <TH ALIGN=CENTER  nowrap width="1%"></TH> 
      <TH ALIGN=CENTER  nowrap >Bank</TH>
      <TH ALIGN=CENTER  nowrap >Structure<br>Number</TH>
      <TH ALIGN=CENTER  nowrap >Tariff<br>Currency</TH>
      <TH ALIGN=CENTER  nowrap >Accounting<br>Currency</TH>      
      <TH ALIGN=CENTER  nowrap >Description</TH>
    </TR>
    
    <%
          boolean firstTime = true;  
          String chk = "";  
          ccList.initRow(); 
          int k=1;              
          while (ccList.getNextRow()) {
               EDC060001Message msgList = (EDC060001Message) ccList.getRecord();		
               if (firstTime) {
	               	chk = "checked";
	               	firstTime = false;
               } else {
               		chk = "";
                }	 
       %>             
        <TR>
          <td align="center" nowrap > 
        	<input type="radio" name="ROW1" <%= chk %> value="<%= ccList.getCurrentRow() %>" onClick="setInfo('<%= msgList.getE01RCOBNK()%>', '<%= msgList.getE01RCOTAR() %>', '<%= msgList.getE01RCOATY() %>')" >
      	  </td>
          <td NOWRAP align=center>
          	<%=Util.formatCell(msgList.getE01RCOBNK())%>
		  </td>		  
		  <td NOWRAP >
			<%=Util.formatCell(msgList.getE01RCOTAR())%>
		  </td>		  
		  <td NOWRAP >
          	<%=Util.formatCell(msgList.getE01RCOTCY())%>
		  </td>
		  <td NOWRAP >
          	<%=Util.formatCell(msgList.getE01RCOACY())%>
		  </td>
		  <td NOWRAP >
          	<%=Util.formatCell(msgList.getE01RCODSC())%>
		  </td>
		</TR>
		
        <% 
        	k++;
         }
         %> 
  </TABLE>
  <SCRIPT language="JavaScript">     
  	document.forms[0].totalRow.value="<%= k %>";
	 showChecked("ROW1");          
  </SCRIPT> 
<%      
  }
%> 
</form>
</body>
</html>
