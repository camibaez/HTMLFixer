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
	ok = confirm("Do you want to Delete this Commissions Table?");
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
<h3 align="center">Standard Letters of Credit Commissions<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="sc_list.jsp, ELC0600"></h3>

<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0600">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="3">
  <INPUT TYPE=HIDDEN NAME="opt" VALUE="">
  <INPUT TYPE=HIDDEN NAME="BNK" VALUE="">
  <INPUT TYPE=HIDDEN NAME="STN" VALUE="">
  <INPUT TYPE=HIDDEN NAME="ATY" VALUE="">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="E01RLCBNK" VALUE="<%=request.getParameter("E01RLCBNK")%>">
  <INPUT TYPE=HIDDEN NAME="E01RLCATY" VALUE="<%=request.getParameter("E01RLCATY")%>">  
  <INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
  <div id="enterACC" style="position:absolute; visibility:hidden; left:25px; top:-50px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)" onClick="cancelBub()"> 
    <table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
      <tr id="trdark"> 
        <td align=CENTER width="18%"> 
          <div align="right"><b>Bank :<b></div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" name="NEWBNK" size="3" maxlength="2" value="<%=request.getParameter("E01RLCBNK")%>">
          </div>
        </td>
      </tr>
      <tr id="trclear"> 
        <td align=CENTER width="18%"> 
          <div align="right"><b>Table Number :<b></div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" name="NEWSTN" size="3" maxlength="2" onkeypress="enterInteger()">
          </div>
        </td>
      </tr>
      <tr id="trdark"> 
        <td nowrap  > 
	              <div align="right"><b> Product Type:</b> </div>
	            </td>
	            <td nowrap  > 
		             	<input type="text" name="NEWATY"  size=5 maxlength="8" value="<%=request.getParameter("E01RLCATY")%>">
        				<a href="javascript:GetProductRates('NEWATY','LC')"> 
        				<img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a> 
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
      <div align="center"> <h4 style="text-align:center"><B>No data found for your search criteria</B>. <br>Click &lt;<B>New</B>&gt; to create one</h4> 
      </div>
      </TD></TR>
   	</TABLE>
   	<TABLE class="tbenter">
    <TR>
      <TD ALIGN=CENTER class="TDBKG" width="50%">
   		<a href="javascript:goAction('N')"><b>New<b></a>
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
  
  <CENTER>
<TABLE class="tbenter" width="585">
	<TBODY>
		<TR>
			<TD align="CENTER" class="TDBKG" width="25%">
			<DIV align="center" style="cursor: hand" onclick="ShowEnterCod()"><A>New</A>
			</DIV>
			</TD>
			<TD align="CENTER" class="TDBKG" width="27%"><A
				href="javascript:goAction('M')">Maintenance</A></TD>
			<TD align="CENTER" class="TDBKG" width="24%"><A
				href="javascript:goDelete()">Delete</A></TD>
			<TD align="CENTER" class="TDBKG" width="24%"><A
				href="<%=request.getContextPath()%>/pages/background.jsp">Exit</A></TD>
		</TR>
	</TBODY>
</TABLE>
</CENTER>
  <TABLE class="tableinfo" id="dataTable">
    <TR id="trdark">
      <TH ALIGN=CENTER  nowrap width="1%"></TH> 
      <TH ALIGN=CENTER  nowrap >Bank</TH>
      <TH ALIGN=CENTER  nowrap >Table <br>Number</TH>
      <TH ALIGN=CENTER  nowrap > Tariff <br>Currency</TH>
      <TH ALIGN=CENTER  nowrap >Accounting<br> Currency </TH>      
      <TH ALIGN=CENTER  nowrap >Description</TH>
    </TR>
    
    
    <%
          boolean firstTime = true;  
          String chk = "";  
          ccList.initRow(); 
          int k=1;              
          while (ccList.getNextRow()) {
               ELC060001Message msgList = (ELC060001Message) ccList.getRecord();		
               if (firstTime) {
	               	chk = "checked";
	               	firstTime = false;
               } else {
               		chk = "";
                }	 
       %>             
        <TR>
          <td align="center" nowrap > 
        	<input type="radio" name="ROW1" <%= chk %> value="<%= ccList.getCurrentRow() %>" onClick="setInfo('<%= msgList.getE01RLCBNK()%>', '<%= msgList.getE01RLCTAR() %>', '<%= msgList.getE01RLCATY() %>')" >
      	  </td>
          <td NOWRAP align=center>
          	<%=Util.formatCell(msgList.getE01RLCBNK())%>
		  </td>		  
		  <td NOWRAP align="center">
			<%=Util.formatCell(msgList.getE01RLCTAR())%>
		  </td>		  
		  <td NOWRAP align="center">
          	<%=Util.formatCell(msgList.getE01RLCTCY())%>
		  </td>
		  <td NOWRAP align="center">
          	<%=Util.formatCell(msgList.getE01RLCACY())%>
		  </td>
		  <td NOWRAP align="center">
          	<%=Util.formatCell(msgList.getE01RLCDSC())%>
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
