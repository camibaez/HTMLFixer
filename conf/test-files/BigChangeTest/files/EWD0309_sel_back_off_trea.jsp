<html>
<head>
<title>Instruments</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EWD0309Help" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<script language="JavaScript">
function hideReason() { 
if (document.getElementById) { // DOM3 = IE5, NS6 
document.getElementById('reason').style.visibility = 'hidden'; 
} 
else { 
if (document.layers) { // Netscape 4 
document.reason.visibility = 'hidden'; 
} 
else { // IE 4 
document.all.reason.style.visibility = 'hidden'; 
} 
} 
} 

function showReason(arg1,arg2,arg3,arg4,arg5) { 
  document.getElementById('REJDS1').value=arg1;
  document.getElementById('REJDS2').value=arg2;
  document.getElementById('REJDS3').value=arg3;
  document.getElementById('REJDS4').value=arg4;
  document.getElementById('REJDS5').value=arg5;
  
if (document.getElementById) { // DOM3 = IE5, NS6 
document.getElementById('reason').style.visibility = 'visible'; 
} 
else { 
if (document.layers) { // Netscape 4 
document.reason.visibility = 'visible'; 
} 
else { // IE 4 
document.all.reason.style.visibility = 'visible'; 
} 
} 
} 



function goAction(op) {

	document.forms[0].opt.value = op;
	document.forms[0].submit();
  
}


function getParams(code) {

    document.forms[0].CODE.value = code;
    
}

function cancelBub(){
  event.cancelBubble = true;
}


</SCRIPT>  

</head>

<BODY>
<h3 align="center"> Back Office - Trade Ticket Selection<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="sel_back_off_trea.jsp, EWD0309"></h3>
<hr size="4">

<div id="reason" style="position: absolute; top: 20px; left: 20px; visibility: hidden; width: 450px">
<h4>Reject Information</h4>
<table class="tableinfo" width="50%">
	<tr>
		<td nowrap>
		<table cellpadding=2 cellspacing=0 width="100%" border="0">
			<tr id="trdark">
				<td nowrap width="5%">
				<div align="center"><b>Reason :</b></div>
				</td>
				<td nowrap width="60%">
				<div align="left"></div>
				<input type="text" id="REJDS1" disabled size="60" maxlength="65"
					value="CUSTOMER PRICE IS WRONG"></td>
			</tr>

			<tr id="trdark">
				<td nowrap width="5%">
				<div align="left"><b> </b></div>
				</td>
				<td nowrap width="60%">
				<div align="left"></div>
				<input type="text" id="REJDS2" disabled size="60" maxlength="65"
					value=""></td>
			</tr>

			<tr id="trdark">
				<td nowrap width="5%">
				<div align="left"><b> </b></div>
				</td>
				<td nowrap width="60%">
				<div align="left"></div>
				<input type="text" id="REJDS3" disabled size="60" maxlength="65"
					value=""></td>
			</tr>

			<tr id="trdark">
				<td nowrap width="5%">
				<div align="left"><b> </b></div>
				</td>
				<td nowrap width="60%">
				<div align="left"></div>
				<input type="text" id="REJDS4" disabled size="60" maxlength="65"
					value=""></td>
			</tr>

			<tr id="trdark">
				<td nowrap width="5%">
				<div align="left"><b> </b></div>
				</td>
				<td nowrap width="60%">
				<div align="left"></div>
				<input type="text" id="REJDS5" disabled size="60" maxlength="65"
					value=""></td>
			</tr>
		</table>
		</td>
	</tr>
</table>

</div>



<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEWD0309" >
  <p>
    <input type=HIDDEN name="SCREEN" value="6">
    <input type=HIDDEN name="opt" value="1">
    <input type=HIDDEN name="totalRow" value="0">
    <input type=HIDDEN name="CODE">
    <%
	if ( EWD0309Help.getNoResult() ) {
 %></p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>There is no match for your search criteria</b></p>
          
        </div>

	  </TD>
	</TR>
    </TABLE>
	
  <%  
		}
	else {
%> <% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%> 
  <p> 

          
  <table class="tbenter" width=100% align=center>
    <tr> 
      <td class=TDBKG width="30%"> 
        <div align="center"><a href="javascript:goAction(2)"><b>Complete</b></a></div>
      </td>
      <td class=TDBKG width="33%"> 
        <div align="center"><a href="javascript:goAction(5)"><b>Reject</b></a></div>
      </td>
      <td class=TDBKG width="30%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
      </td>
    </tr>
  </table>
   
  <br>
  
  <TABLE  id="mainTable" class="tableinfo">
 <TR > 
    <TD NOWRAP valign="top" >
                <table id="headTable" >
          <tr id="trdark"> 
            <th align=CENTER nowrap >&nbsp;</th>
            <th align=CENTER nowrap > 
              <div align="center">Order<br>
                Number</div>
            </th>
            <th align=CENTER nowrap >Operation<BR>
              Type</th>
            <th align=CENTER nowrap >Type </th>
            <th align=CENTER nowrap > Description</th>
            <th align=CENTER nowrap > 
              <div align="center">Portfolio</div>
               Number</th>
            <th align=CENTER nowrap > 
              <div align="center">Oficer</div>
               Code</th>
            <th align=CENTER nowrap >Trade <BR>
              Date</th>
            <th align=CENTER nowrap >Settlement <BR>
              Date</th>
            <th align=CENTER nowrap > 
              <div align="center">Status</div>
            </th>
          </tr>
        </table>
<div id="dataDiv1" class="scbarcolor" >
    <table id="dataTable" > 
		<%
                EWD0309Help.initRow();
				int k=1;
                while (EWD0309Help.getNextRow()) {
                 
                  out.println(EWD0309Help.getRecord());
                  k++;   
                }
              %> 
    </table>
   </div>
</Table>
  <table class="tbenter" width="98%" align=CENTER>
    <tr> 
      <td width="50%" align=LEFT> <%
        if ( EWD0309Help.getShowPrev() ) {
      			int pos = EWD0309Help.getFirstRec() - 51;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.invest.JSEWD0309?SCREEN=5&Pos=" + pos +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/previous_records.gif\" ></A>");
        }
   %> </td>
      <td width="50%" align=RIGHT> <% 
        if ( EWD0309Help.getShowNext() ) {
      			int pos = EWD0309Help.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.invest.JSEWD0309?SCREEN=5&Pos=" + pos +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/next_records.gif\" ></A>");
        }
  %> </td>
    </tr>
  </table>
  <SCRIPT language="JavaScript">
     document.forms[0].totalRow.value="<%= k %>";
     function resizeDoc() {
       divResize(false);
     adjustEquTables(headTable, dataTable, dataDiv1,1,false);
      }

     resizeDoc();
    
     window.onresize=resizeDoc;
     
     try {
	     document.forms[0].index[0].click();
	 } catch (e) {
	     document.forms[0].index.click();
	 }
     
</SCRIPT>

<%}%>


  </form>

</body>
</html>
