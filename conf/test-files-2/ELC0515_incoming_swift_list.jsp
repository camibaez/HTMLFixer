<%@ page import ="datapro.eibs.master.Util" %>
<html>
<head>
<title>Swift Messages Received</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "msgList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<script language="JavaScript">


function showInq() {
	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0515?SCREEN=2&RBK=" + document.forms[0].RBK.value + "&RNO=" + document.forms[0].RNO.value;
	CenterWindow(page,600,500,2);    
	
}

function goAction() {
	
   if (document.forms[0].FMT.value == '700' || document.forms[0].FMT.value == '710') {
   	   showHiddenDivPrd;
	}
}

function goSubmit() {
	if ( document.forms[0].PRODUCT.value.length < 1) {
		alert("A valid product code must be entered");
	} else { 
	   document.forms[0].SCREEN.value = "3";
	   document.forms[0].submit();  
	}   
}

function getParams(currrow,sbk,rno,rbk,fmt) {

	document.forms[0].CURRENTROW.value = currrow;
    document.forms[0].SBK.value = sbk;
    document.forms[0].RNO.value = rno;
    document.forms[0].RBK.value = rbk;
    document.forms[0].FMT.value = fmt;
 }

function closeHiddenDivPrd() {
    if (document.getElementById("hiddenDivPrd") != null) {
		setVisibility(document.getElementById("hiddenDivPrd"), "hidden");
    	document.forms[0].PRODUCT.value="";
    }	
}


function showHiddenDivPrd(evt) {
	if (document.forms[0].FMT.value == '700' || document.forms[0].FMT.value == '710') {
		evt = (evt) ? evt : ((window.event) ? window.event : "");
	 	
		var hiddenDivPrd = document.getElementById("hiddenDivPrd");
	
		var y=evt.clientY + document.body.scrollTop;
		var x=evt.clientX + document.body.scrollLeft;
	     
		cancelBub(evt);
	
		moveElement(hiddenDivPrd, y, x);
		setVisibility(hiddenDivPrd, "visible");
		 
		document.forms[0].PRODUCT.focus();
	}
}

document.onclick= closeHiddenDivPrd;

</SCRIPT>   

</head>

<BODY>
<h3 align="center">Swift Messages Received
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="incoming_swift_list.jsp, ELC0515"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0515" >
  <p> 
    <input type=HIDDEN name="SCREEN" value="2">
    <input type=HIDDEN name="totalRow" value="0">
    <INPUT TYPE=HIDDEN NAME="CURRENTROW" VALUE="0"> 
    <input type=HIDDEN name="opt">
    <input type=HIDDEN name="PRD" value="">
    <input type=HIDDEN name="SBK" value="">
    <input type=HIDDEN name="RNO" value="">
    <input type=HIDDEN name="FMT" value="">
    <input type=HIDDEN name="RBK" value="">
  </p>
<div id="hiddenDivPrd" class="hiddenDiv">
 <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
	<tr id="trdark"> 
      <td align=CENTER width="25%"> 
        <div align="right">Producto :</div>
      </td>
      <td align=CENTER width="75%"> 
        <div align="left"> 
          <input type="text" maxlength=9 size=11 name="PRODUCT" value="">
          <a href="javascript:GetProduct('PRODUCT','','40','')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="bottom" border="0"></a> 
        </div>
      </td>
    </tr>
   <tr id="trclear">
   
   <TD ALIGN=center nowrap colspan="2">
	    <input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="goSubmit()"> 
   </TD>
   
   </tr>
 </TABLE>
 </div>
 <%
 	 if ( !error.getERRNUM().equals("0")  ) {
	     error.setERRNUM("0");
	     out.println("<SCRIPT Language=\"Javascript\">");
	     out.println("       showErrors()");
	     out.println("</SCRIPT>");
	 }
 
	if ( msgList.getNoResult() ) {
 %>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>There are no Results for your Search</b></p>
          <table class="tbenter" width=100% align=center>
            <tr> 
              <td class=TDBKG width="60%"> 
                <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
              </td>
            </tr>
          </table>
          <p>&nbsp;</p>          
        </div>
	  </TD>
	</TR>
  </TABLE>
	
  <%  
	} else {
	String chk = "";
  %> 
  <p> 
  <table class="tbenter" width=100% align=center>
    <tr> 
  	  <td class=TDBKG width="30%">
        <div id="eibsPrd" align="center" style="cursor:pointer"><a><b>Approve</b></a></div>  
      </td> 
	  <td class=TDBKG width="30%"> 
        <div align="center"><a href="javascript:showInq()"><b>Inquiry</b></a></div>
      </td>
      <td class=TDBKG width="100%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
      </td>
    </tr>
  </table>
  <br>
  <table  id=cfTable class="tableinfo">
    <tr > 
      <td NOWRAP valign="top" width="100%"> 
        <table id="headTable" width="100%">
          <tr id="trdark"> 
            <th align=CENTER nowrap width="10%">&nbsp;</th> 
            <th align=CENTER nowrap width="12%">Bank<br>Sender</th>
            <th align=CENTER nowrap width="16%">Reference</th>
            <th align=CENTER nowrap width="35%">Beneficiary</th>
            <th align=CENTER nowrap width="10%">Date</th>
			<th align=CENTER nowrap width="10%">Type<br>Message</th>  
			<th align=CENTER nowrap width="10%">Currency</th>    
            <th align=CENTER nowrap width="20%">Amount</th>
           </tr>
          <%
                msgList.initRow();
                chk = "checked";
                while (msgList.getNextRow()) {
                 
                  	datapro.eibs.beans.ELC051501Message msgLC = (datapro.eibs.beans.ELC051501Message) msgList.getRecord();
		  %>
          <tr> 
            <td NOWRAP  align=CENTER > 
              <input type="radio" name="CURRCODE" value="<%= msgList.getCurrentRow() %>" <%=chk%> onClick="getParams(this.value,'<%= msgLC.getE01WAPSBK() %>','<%= msgLC.getE01WAPRNO() %>','<%= msgLC.getE01WAPRBK() %>','<%= msgLC.getE01WAPFMT() %>');">
            </td>          
            <td NOWRAP  align=LEFT width=\"12%\"><%= msgLC.getE01WAPSBK() %></td>
			<td NOWRAP  align=LEFT width=\"16%\"><%= msgLC.getE01WAPSRF() %></td>
            <td NOWRAP  align=LEFT width=\"35%\"><%= msgLC.getE01WAPBEN() %></td>
            <td NOWRAP  align=CENTER width=\"10%\"><%= Util.formatDate(msgLC.getE01WAPDT1(),msgLC.getE01WAPDT2(),msgLC.getE01WAPDT3())  %></td>
            <td NOWRAP  align=LEFT width=\"10%\"><%= msgLC.getE01WAPFMT() %></td>
            <td NOWRAP  align=LEFT width=\"10%\"><%= msgLC.getE01WAPCCY() %></td>
            <td NOWRAP  align=RIGHT width=\"20%\"><%= Util.formatCCY(msgLC.getE01WAPAMT()) %></td>
     
         </tr>
          <%
  					chk = ""; 
            	}
          %>
        </table>
  </table>
<SCRIPT language="JavaScript">
 showChecked("CURRCODE");
</SCRIPT>
  
<BR>
<TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
<%
        if ( msgList.getShowPrev() ) {
      			int pos = msgList.getFirstRec() - 51;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSELC0515?SCREEN=1&Pos=" + pos + "\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/previous_records.gif\" ></A>");
        }
  %>  
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>     
 <%      
        if ( msgList.getShowNext() ) {
      			int pos = msgList.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSELC0515?SCREEN=1&Pos=" + pos + "\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/next_records.gif\" ></A>");
        }
   %> 
   </TD>
 	</TR>
 	</TABLE>
<%}%>
	<SCRIPT language="JavaScript">
	
		if (document.getElementById("hiddenDivPrd") != null) {	
	 		document.getElementById("hiddenDivPrd").onclick = cancelBub;
	 	}	
	 	if (document.getElementById("eibsPrd") != null) {
			document.getElementById("eibsPrd").onclick = showHiddenDivPrd;
		}	
     
	</SCRIPT>

  </form>
 </body>
</html>
