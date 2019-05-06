<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Transactions</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id= "trans" class= "datapro.eibs.beans.JBListRec"  scope="session" /> 
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" /> 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "transData" class= "datapro.eibs.beans.DataTransaction"  scope="session" /> 

<SCRIPT language="javascript">


function doPrint(){
	if(!window.print){
       var msg ="You must update your navigator to print";
	    alert(msg);
	    return;}
	
    window.focus();
	 window.print();

	return;
}


 

function setCurrentRow(row) {
var form = document.forms[0];
   form["CURRENTROW"].value = row;
   if ( (form["E01WRKBNK_"+ row].value =="") && (form["E01WRKBRN_"+ row].value =="") && (form["E01WRKCCY_"+ row].value =="")
        && (form["E01WRKGLN_"+ row].value =="") && (form["E01WRKCCN_"+ row].value =="") && (form["E01WRKACC_"+ row].value =="")
        && (form["E01WRKCDE_"+ row].value =="") && (form["E01WRKAMT_"+ row].value =="") && (form["E01WRKDCC_"+ row].value =="")) {
    form["E01WRKTDS_"+ row].value = form["E01WRKTDS"].value;
    form["E01WRKVD1_"+ row].value = form["E01WRKVD1"].value;
    form["E01WRKVD2_"+ row].value = form["E01WRKVD2"].value;
    form["E01WRKVD3_"+ row].value = form["E01WRKVD3"].value;
  }
}

function GetInfo(currentrow){
if ( currentrow !== "" ) { setCurrentRow(currentrow);}
var form = document.forms[0];
var desc = (currentrow == "") ? trim(form["E01WRKTDS"].value) : trim(form["E01WRKTDS_"+currentrow].value);
var date1= (currentrow == "") ? trim(form["E01WRKVD1"].value) : trim(form["E01WRKVD1_"+currentrow].value);  
var date2= (currentrow == "") ? trim(form["E01WRKVD2"].value) : trim(form["E01WRKVD2_"+currentrow].value);  
var date3= (currentrow == "") ? trim(form["E01WRKVD3"].value) : trim(form["E01WRKVD3_"+currentrow].value) ;  
var rate= (currentrow == "") ? "" : trim(form["E01WRKEXR_"+currentrow].value) ;
var customer= (currentrow == "") ? "" : trim(form["E01WRKCUN_"+currentrow].value) ;
 var credit2= (currentrow == "") ? "" : trim(form["E01WRKCR2_"+currentrow].value) ;
 var days2= (currentrow == "") ? "" : trim(form["E01WRKUN2_"+currentrow].value) ;
 var credit3= (currentrow == "") ? "" : trim(form["E01WRKCR4_"+currentrow].value) ;
 var days3= (currentrow == "") ? "" : trim(form["E01WRKUN4_"+currentrow].value) ;
var winH = (currentrow == "") ? 270 : 325 ;

	pg = prefix +language + "EGL0035_transaction_info.jsp?CurrRow="+ currentrow+"&RO=readonly";       
    CenterNamedWindow(pg,'Information',400,winH + 100,1);   
}

 

 

function hideOpt(value) {
 if ( value ) {
   OPTDIV.style.display="none";
   RemoveFilter();
 }
 else {
   OPTDIV.style.display="";
   RestoreFilter();
 }
}
</SCRIPT>
</head>
<body nowrap onload="MM_preloadImages('<%=request.getContextPath()%>/images/e/approve_over.gif','<%=request.getContextPath()%>/images/e/reject_over.gif')" onbeforeprint="hideOpt(true)" onafterprint="hideOpt(false)">
<%@ page import = "datapro.eibs.master.Util" %>
<%
	 trans.initRow();
    int total_row;
    try {
      total_row = trans.getLastRow() + 1;
    }
    catch (Exception e) {
      total_row  = 0;
    }
    
 String title = "Transactions";
 String target = session.getAttribute("PY") == null ? "" : (String) session.getAttribute("PY");
 if ( target.equals("") ) {
 	title = title + " Monthly";
 } else {
 	if ( target.equals("TRUE") ) {
    	title = title + " Years";
    }	
 }   
%> 


<h3 align="center"><%= title %><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="transaction_print,EGL0035"></h3>
<hr size="4">
  
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEGL0035">
  <div> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
    <INPUT TYPE=HIDDEN NAME="opt" VALUE="1">
    <INPUT TYPE=HIDDEN NAME="CURRENTROW" VALUE="">
    <BR>
  </div>
  
  <table  class="tableinfo" cellspacing=0 >
    <tr id="trdark"> 
      <td align="right"  nowrap width="21%"  bordercolor="#FFFFFF">
       <% if (userPO.getOption().equals("LN")) { out.println("<b>Account : </b>");}
        		 else if (userPO.getOption().equals("CD")) { out.println("<b>Certificate : </b>");}
        		 else if (userPO.getOption().equals("OCK")) { out.println("<b>Check No. : </b>");}
        		 else if (userPO.getOption().equals("TRANSACTION")) { out.println("<b>Batch : </b>");}%>
      </td>
      <td align="right"  nowrap width="21%"  bordercolor="#FFFFFF"> 
        <div align="left"> 
          <% if (!userPO.getOption().equals("TRANSACTION")) {  
             out.print(transData.getAccNum());
             } else {
             out.print(transData.getBthnum()); } 
           %>
         </div>
      </td>
      <td align="left" nowrap width="20%"  bordercolor="#FFFFFF"> 
        <div align="right">
           <% if (userPO.getOption().equals("TRANSACTION")) { %> 
             <b>Issued : </b>
           <% } %>  
        </div>
      </td>
      <td align="right" nowrap width="33%"  bordercolor="#FFFFFF"> 
        <div align="left"> 
          <% if (userPO.getOption().equals("TRANSACTION")) { out.print( transData.getBank() + " - "+  transData.getBranch() );} %>
        </div>
      </td>
      <td align="right" nowrap width="33%"  bordercolor="#FFFFFF"><b> Total Debits  : </b></td>
      <td align="left" nowrap colspan="3"  bordercolor="#FFFFFF" width="26%"> 
        <%= Util.formatCCY(transData.getDebitAmt())%>
      </td>
    </tr>
    <tr id="trdark"> 
      <td align="right" nowrap width="21%"  bordercolor="#FFFFFF"><b># Transactions  :</b></td>
      <td align="right" nowrap width="21%"  bordercolor="#FFFFFF"> 
        <div align="left"> 
          <%= total_row %>
        </div>
      </td>
      <td align="left" nowrap width="20%"  bordercolor="#FFFFFF">&nbsp; </td>
      <td align="right" nowrap width="33%"  bordercolor="#FFFFFF"> 
        <div align="left"></div>
      </td>
      <td align="right" nowrap width="33%"  bordercolor="#FFFFFF"><b> Total Credits  : </b></td>
      <td align="left" nowrap colspan="3"  bordercolor="#FFFFFF" width="26%"> 
        <%= Util.formatCCY(transData.getCreditAmt()) %>
      </td>
    </tr>
  </table>
  
  <BR>
  
  <table class="tableinfo">
    <tr  id="trclear">
      <td align="right" width="17%" valign="top"><b> Description : </b></td>
      <td align="left" width="40%" valign="top"> 
        <div align="left" style="width:350"><%= transData.getDescription() %></div>
      </td>
      <td align="right" nowrap width="14%" valign="top"><b> Value Date : </b></td>
      <td align="left" width="29%" nowrap valign="top"> 
       <%= Util.formatDate(transData.getDate1(),transData.getDate2(),transData.getDate3())   %>
      </td>
    </tr>
  </table>
  <BR>
  <table class="tableinfo" width="100%">
    <tr id="trdark"> 
      <th align="center" nowrap width="5%" > BNK </th>
      <th align="center" nowrap width="5%" > BRN </th>
      <th align="center" nowrap width="5%"  > CCY </th>
      <th align="center" nowrap width="15%" > General<br>
        Ledger</th>
      <th align="center" nowrap width="5%" > Cost<br>
        Center </th>
      <th align="center" nowrap width="15%" > Account<br>
        Number</th>
      <th align="center" nowrap width="15%" > Description </th>
	  <th align="center" nowrap width="5%" > Ex. Rate </th>
      <th align="center" nowrap width="5%" > TR/CD </th>
      <th align="center" nowrap width="10%" > Debit </th>
      <th align="center" nowrap width="10%" > Credit </th>
      <th align="center" nowrap width="5%" > UNC<br>DYS </th>
    </tr>
    <%
	 				 trans.initRow();
                while (trans.getNextRow()) {
	      %> 
    <tr id="trclear"> 
      <td align="center" nowrap width="5%"  > 
         <%= trans.getRecord(0) %>          
         <input type="hidden" name="E01WRKBNK_<%= trans.getCurrentRow() %>" size="2" maxlength="2"  readonly value="<%= trans.getRecord(0) %>" > 
      </td>
      <td align="center" nowrap width="5%"  > 
         <%= trans.getRecord(1) %>
         <input type="hidden" name="E01WRKBRN_<%= trans.getCurrentRow() %>" size="4" maxlength="4"  readonly value="<%= trans.getRecord(1) %>" >
      </td>
      <td align="center" nowrap width="5%"  > 
         <%= trans.getRecord(2) %>
         <input type="hidden" name="E01WRKCCY_<%= trans.getCurrentRow() %>" size="3" maxlength="3"  readonly value="<%= trans.getRecord(2) %>" >
      </td>
      <td align="center" nowrap width="15%" > 
         <%= trans.getRecord(3) %>
         <input type="hidden" name="E01WRKGLN_<%= trans.getCurrentRow() %>" size="17" maxlength="17" readonly value="<%= trans.getRecord(3) %>" >
      </td>
      <td align="center" nowrap width="5%" > 
         <%= trans.getRecord(4) %>
         <input type="hidden" name="E01WRKCCN_<%= trans.getCurrentRow() %>" size="8" maxlength="8"  readonly value="<%= trans.getRecord(4) %>" >
      </td>
      <td align="center" nowrap width="15%" > 
         <%= trans.getRecord(5) %>
         <input type="hidden" name="E01WRKACC_<%= trans.getCurrentRow() %>" size="13" maxlength="13" readonly value="<%= trans.getRecord(5) %>" >
      </td>
      <% if (!userPO.getPurpose().equals("MAINTENANCE")) { %> 
      <td align="center" nowrap width="15%"  onClick="GetInfo('<%= trans.getCurrentRow()%>')" style="cursor: hand" > 
        <%= trans.getRecord(9) %>   
        <input type= Hidden name="E01WRKTDS_<%= trans.getCurrentRow()%>" size="37" maxlength="300" value="<%= trans.getRecord(9)+trans.getRecord(15)+trans.getRecord(16)+
                                                                                                              trans.getRecord(17)+trans.getRecord(18)+trans.getRecord(19)+
																											  trans.getRecord(20)+trans.getRecord(21)+trans.getRecord(22)+
																											  trans.getRecord(23)%>">
        <input type= Hidden name="E01WRKVD1_<%= trans.getCurrentRow()%>" size="2" maxlength="2" value = "<%= trans.getRecord(10) %>">
        <input type= Hidden name="E01WRKVD2_<%= trans.getCurrentRow()%>" size="2" maxlength="2" value = "<%= trans.getRecord(11) %>">
        <input type= Hidden name="E01WRKVD3_<%= trans.getCurrentRow()%>" size="2" maxlength="2" value = "<%= trans.getRecord(12) %>">
        
        <input type= Hidden name="E01WRKEXR_<%= trans.getCurrentRow()%>" size="12" maxlength="11" value = "<%= trans.getRecord(13) %>">
        <input type= Hidden name="E01WRKCR2_<%= trans.getCurrentRow()%>" value = "<%= trans.getRecord(41) %>">
        <input type= Hidden name="E01WRKUN2_<%= trans.getCurrentRow()%>" value = "<%= trans.getRecord(42) %>">
        <input type= Hidden name="E01WRKCR4_<%= trans.getCurrentRow()%>" value = "<%= trans.getRecord(43) %>">
        <input type= Hidden name="E01WRKUN4_<%= trans.getCurrentRow()%>" value = "<%= trans.getRecord(44) %>">
        <input type= Hidden name="E01WRKCUN_<%= trans.getCurrentRow()%>" size="10" maxlength="9" value = "<%= trans.getRecord(26) %>">
        
        
      </td>
      <% }else{ %> 
      <td align="center" nowrap width="15%"> <%= trans.getRecord(9) %></td>
      <% } %>
	  <td align="center" nowrap width="5%" > <%= trans.getRecord(13) %></td> 
      <td align="center" nowrap width="5%" > <%= trans.getRecord(6) %></td>
      <td align="right" nowrap width="10%" > <% if ( trans.getRecord(8).equals("D")) {out.print( Util.formatCCY(trans.getRecord(7)) );} else {out.print("");} %></td>
      <td align="right" nowrap width="10%" > <% if ( trans.getRecord(8).equals("C")) {out.print( Util.formatCCY(trans.getRecord(7)) );} else {out.print("");}%></td>
      <td align="center" nowrap width="5%" > </td>
    </tr>
    <%
		if (trans.getRecord(41) != null) {
			if (!(trans.getRecord(41).equals("0") || trans.getRecord(41).equals("0.00") || trans.getRecord(41).equals(""))) {
	%>		
    <tr id="trclear"> 
      <td align="center" nowrap width="5%"  ></td>
      <td align="center" nowrap width="5%"  ></td>
      <td align="center" nowrap width="5%"  ></td>
      <td align="center" nowrap width="15%" ></td>
      <td align="center" nowrap width="5%" ></td>
      <td align="center" nowrap width="15%" ></td>
      <td align="center" nowrap width="15%"></td>
	  <td align="center" nowrap width="5%" ></td> 
      <td align="center" nowrap width="5%" ></td>
      <td align="right" nowrap width="10%" > <% if ( trans.getRecord(8).equals("D")) {out.print( Util.formatCCY(trans.getRecord(41)) );} else {out.print("");} %></td>
      <td align="right" nowrap width="10%" > <% if ( trans.getRecord(8).equals("C")) {out.print( Util.formatCCY(trans.getRecord(41)) );} else {out.print("");}%></td>
      <td align="center" nowrap width="5%" > <%= trans.getRecord(42) %></td>
    </tr>				
	<%		}
		}    	

		if (trans.getRecord(43) != null) {
			if (!(trans.getRecord(43).equals("0") || trans.getRecord(43).equals("0.00") || trans.getRecord(43).equals(""))) {
	%>		
    <tr id="trclear"> 
      <td align="center" nowrap width="5%"  ></td>
      <td align="center" nowrap width="5%"  ></td>
      <td align="center" nowrap width="5%"  ></td>
      <td align="center" nowrap width="15%" ></td>
      <td align="center" nowrap width="5%" ></td>
      <td align="center" nowrap width="15%" ></td>
      <td align="center" nowrap width="15%"></td>
	  <td align="center" nowrap width="5%" ></td> 
      <td align="center" nowrap width="5%" ></td>
      <td align="right" nowrap width="10%" > <% if ( trans.getRecord(8).equals("D")) {out.print( Util.formatCCY(trans.getRecord(43)) );} else {out.print("");} %></td>
      <td align="right" nowrap width="10%" > <% if ( trans.getRecord(8).equals("C")) {out.print( Util.formatCCY(trans.getRecord(43)) );} else {out.print("");}%></td>
      <td align="center" nowrap width="5%" > <%= trans.getRecord(44) %></td>
    </tr>				
	<%		}
		}    
		
		     } // while
    %> 
  </table>
  <BR>
  <BR>
  <div  align="center" id="OPTDIV">
    <table width="80%" class="tbenter">
      <tr align="center"> 
        <td >
        <% if (userPO.getPurpose().equals("APPROVAL_INQ") && userPO.getOption().equals("TRANSACTION")) { %>
           	<a href="javascript:goOpenerAction('A')" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','<%=request.getContextPath()%>/images/e/approve_over.gif',1)"><img name="Image1" alt="Approval" border="0" src="<%=request.getContextPath()%>/images/e/approve.gif" ></a>
       <% }%>
        </td>
        <td > 
           	<a href="javascript:doPrint();" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3','','<%=request.getContextPath()%>/images/e/print_over.gif',1)"><img name="Image3" alt="Print Transactionsl" border="0" src="<%=request.getContextPath()%>/images/e/print.gif" ></a>
        </td>
        <td >
        <% if (userPO.getPurpose().equals("APPROVAL_INQ") && userPO.getOption().equals("TRANSACTION")) { %>
           <a href="javascript:goOpenerAction('R')" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image2','','<%=request.getContextPath()%>/images/e/reject_over.gif',1)"><img name="Image2" alt="Reject" border="0" src="<%=request.getContextPath()%>/images/e/reject.gif" ></a>
        <% }%>
        </td>
      </tr>
    </table>
  </div>
</form>
</body>
</html>
