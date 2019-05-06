<html>
<head>
<title>Teller Transaction</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBList"   scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">

function goAction(op) {
	document.forms[0].SCREEN.value = op;
	document.forms[0].submit();
}

function extraInfo(textfields, noField) {
 	var pos = 0;
 	var s = textfields;
 	for ( var i=0; i<noField ; i++ ) {
   		pos = textfields.indexOf("<br>", pos+1);
  	}
 	s = textfields.substring(0, pos);
 	return(s); 
}

function showAddInfo(idxRow) {
	document.forms[0].UserId.value = document.forms[0]["TELLER"+idxRow].value;
	document.forms[0].Currency.value = document.forms[0]["CURRENCY"+idxRow].value;
	document.forms[0].Code.value = document.forms[0]["CODE"+idxRow].value;
	document.forms[0].Sequence.value = document.forms[0]["SEQUENCE"+idxRow].value;

	tbAddInfo.rows[0].cells[1].style.color = "blue";
    tbAddInfo.rows[0].cells[1].innerHTML = extraInfo(document.forms[0]["TXTDATA"+idxRow].value, 16);   

/*
	tbAddInfo.rows[0].cells[1].innerHTML=document.forms[0]["TXTDATA"+idxRow].value;
	tbAddInfo.rows[0].cells[1].filters[0].apply();
	tbAddInfo.rows[0].cells[1].style.color="";
	tbAddInfo.rows[0].cells[1].filters[0].Play();
*/
	for ( var i=0; i<dataTable.rows.length; i++ ) {
    	dataTable.rows[i].className = "trnormal";
    }
   	dataTable.rows[idxRow].className = "trhighlight";
 	adjustEquTables(document.getElementById("headTable"), 
				document.getElementById("dataTable"), 
				document.getElementById("dataDiv1"), 2, false);
}   

</SCRIPT> 

</head>

<BODY>

<h3 align="center">TELLER TRANSACTIONS<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="teller_override_list.jsp, ETLR000"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.teller.JSETLR000" >
<input type=HIDDEN name="SCREEN" value="900">
<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
<INPUT TYPE=HIDDEN NAME="reason" VALUE="">
<INPUT TYPE=HIDDEN NAME="UserId" VALUE="">
<INPUT TYPE=HIDDEN NAME="Currency" VALUE="">
<INPUT TYPE=HIDDEN NAME="Code" VALUE="">
<INPUT TYPE=HIDDEN NAME="Sequence" VALUE="">

<%
	if (!error.getERRNUM().equals("0")) {
     		error.setERRNUM("0");
     		out.println("<SCRIPT Language=\"Javascript\">");
	     	out.println("       showErrors()");
     		out.println("</SCRIPT>");
	} else {
     		
		if ( appList.getNoResult() ) {
%>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>There are no transactions that to approve</b></p><p>&nbsp;</p>
        </div>
	  </TD>
	</TR>
  </TABLE>
	<%} else { %> 

<TABLE class="tbenter" width="100%" >
	<TR>
    	<TD > 
        	<div align="center"><b>Select Transaction to Override</b></div>
	  	</TD>
	</TR>
</TABLE>

<br>

<table id=mainTable class="tableinfo" style="width: 100%; height: 70%">
	<tr> 
      	<td NOWRAP valign="top">
			<TABLE id="headTable"  width="100%" >
				<TR id="trdark"> 
			      <TH ALIGN=CENTER width = "5%" NOWRAP> </TH>
			      <TH ALIGN=CENTER width = "5%" NOWRAP>Teller</TH>
			      <TH ALIGN=CENTER width = "5%" NOWRAP>Cry</TH>
			      <TH ALIGN=CENTER width = "5%" NOWRAP>Code</TH>
			      <TH ALIGN=CENTER width = "15%" NOWRAP>Description</TH>
				  <TH ALIGN=CENTER width = "5%" NOWRAP>Seq</TH>
				  <TH ALIGN=CENTER width = "10%" NOWRAP>Customer</TH>
				  <TH ALIGN=CENTER width = "10%" NOWRAP>Account</TH>
				  <TH ALIGN=CENTER width = "10%" NOWRAP>Amount</TH>
				  <TH ALIGN=CENTER width = "5%" NOWRAP>Date</TH>
				  <TH ALIGN=CENTER width = "5%" NOWRAP>Time</TH>
			  	</TR>
			</TABLE>

	   		<div id="dataDiv1" class="scbarcolor" style="padding:0">
	    	    <table id="dataTable">
			    <%
			    	appList.initRow();
			        int k=1;
			        while (appList.getNextRow()) {
			        	if (appList.getFlag().equals("")) {
			            	out.println(appList.getRecord());
			                k++;
			            }        
			        }
			    %> 
			    </table>
	   		</div>
		</td>

   		<TD nowrap ALIGN="RIGHT" valign="top" >
      		<Table id="tbAddInfoH" width="100%" >
        		<tr id="trdark">
         			<TH ALIGN=CENTER nowrap >Basic Information </TH>
        		</tr>
      		</Table>

     		<Table id="tbAddInfo"  >
      			<tr id="trclear" >
         			<TD  ALIGN="RIGHT"  nowrap ><b>
         			Currency : <br>Status : <br>Product : <br>Customer Name : <br>Bank : <br>Branch : <br>
         			Gross Balance : <br>Uncollected Balance : <br>Net Balance : <br>Hold Amount : <br>
         			Available Balance : <br>Monthly average gross : <br> Monthly average net balance : <br> 
         			Credit Limit : <br>Line Expiration Date : <br>Last Transaction Date : <br>Last Deposit Date :
         			</b></TD>
         			<TD ALIGN="LEFT"  nowrap class="tdaddinfo"></TD>
      			</tr>
     		</Table>
  		</TD>

	</tr>	
</table>

<br><br>

<table class="tbenter" width=100% align=center>
	<tr> 
    	<td><div align="center"><input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="goAction(1600)"></div></td>
    </tr>
</table>

<SCRIPT type="text/javascript">
     document.forms[0].totalRow.value = "<%= k %>";
     function resizeDoc() {
     	divResize(true);
     	adjustEquTables(document.getElementById("headTable"), 
     					document.getElementById("dataTable"), 
     					document.getElementById("dataDiv1"), 2, false);
      }
     radioClick("CURRCODE", 0);
     resizeDoc();
     document.getElementById("tbAddInfoH").rows[0].cells[0].height = document.getElementById("headTable").rows[0].cells[0].clientHeight;
     window.onresize = resizeDoc;
</SCRIPT>

<% 
   }
   } 
%>

</form>
</body>
</html>
