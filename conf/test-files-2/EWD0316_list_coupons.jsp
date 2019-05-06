<html>
<head>
<title>Coupons Payment Confirmation</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EWD0316Help" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<script language="JavaScript">

function goAction(op) {
	document.forms[0].opt.value = op;
	if (op==8) {
		var answer;
		answer = confirm('Are you sure you want to delete the selected item?');
		//alert(answer);
		if (answer == true) {
			document.forms[0].submit();
		}
	} else {
		document.forms[0].submit();
  	}
}


function getParams(code, custodiancod, paytype , pdate1 , pdate2 , pdate3 ) {

    document.forms[0].CODE.value = code;
	document.forms[0].CUSTODIANCOD.value = custodiancod;
    document.forms[0].PAYTYPE.value = paytype;
    document.forms[0].PDATE1.value = pdate1;
    document.forms[0].PDATE2.value = pdate2;
    document.forms[0].PDATE3.value = pdate3;
}


</SCRIPT>  

</head>

<BODY>
<h3 align="center">Coupons Payment Confirmation<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="list_coupons.jsp, EWD0316"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0200" >
  <input type=HIDDEN name="SCREEN" value="1">
  <input type=HIDDEN name="opt" value="1">
  <input type=HIDDEN name="totalRow" value="0">
  <input type=HIDDEN name="CODE">
  <input type=HIDDEN name="ORDERNUM">
  <input type=HIDDEN name="CUSTOMER">
  <input type=HIDDEN name="CUSTODIAN">
  <input type=HIDDEN name="PAYTYPE">
  <input type=HIDDEN name="PDATE1">
  <input type=HIDDEN name="PDATE2">
  <input type=HIDDEN name="PDATE3">
  <input type=HIDDEN name="CUSTODIANCOD">
  <input type=HIDDEN name="CUSTOMERCOD">
  <input type=HIDDEN name="DELAMOUNT">
  <input type=HIDDEN name="COMAMOUNT">
  <input type=HIDDEN name="PROJAMOUNT">
  <input type=HIDDEN name="PAIDAMOUNT">
  <input type=HIDDEN name="RCD">
  <input type=HIDDEN name="ACTION">
  <%
	if ( EWD0316Help.getNoResult() ) {
 %> 
  <p>&nbsp;</p>
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
      <td class=TDBKG width="32%"> 
        <div align="center"><a href="javascript:goAction(2)"><b>Details</b></a></div>
      </td>
      <td class=TDBKG width="32%"> 
        <div align="center"><a href="javascript:goAction(8)"><b>Delete</b></a></div>
      </td>
      <td class=TDBKG width="32%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
      </td>
    </tr>
  </table>
   
  <br>
  
  <TABLE  id="mainTable" class="tableinfo">
 <TR > 
    <TD NOWRAP valign="top" width="100%" >
        <table id="headTable" width="100%" >
          <tr id="trdark"> 
            <th align=CENTER nowrap >&nbsp;</th>
            <th align=CENTER nowrap > 
              <div align="center">Instrument</div>
            </th>
            <th align=CENTER nowrap > 
              <div align="center">CCY</div>
            </th>
            <th align=CENTER nowrap > 
              <div align="center">ISIN</div>
            </th>
            <th align=CENTER nowrap >Custodian</th>
            <th align=CENTER nowrap > 
              <div align="center">Coupon<BR>
                Type</div>
            </th>
            <th align=CENTER nowrap >Pmnt. <BR>
              Date</th>
            <th align=CENTER nowrap >Coupon <BR>
              Amount</th>
          </tr>
        </table>
          <div id="dataDiv1" class="scbarcolor" >
    <table id="dataTable" > 
		<%
                EWD0316Help.initRow();
				int k=1;
                while (EWD0316Help.getNextRow()) {
                 
                  out.println(EWD0316Help.getRecord());
                  k++;   
                }
              %>
     
    </table>
   </div>
</Table>

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
  <TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
  <%
        if ( EWD0316Help.getShowPrev() ) {
      			int pos = EWD0316Help.getFirstRec() - 51;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.invest.JSEWD0316?SCREEN=1&Pos=" + pos +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/previous_records.gif\" ></A>");
        }
   %>  
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>     
 <% 
        if ( EWD0316Help.getShowNext() ) {
      			int pos = EWD0316Help.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.invest.JSEWD0316?SCREEN=1&Pos=" + pos +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/next_records.gif\" ></A>");
        }
  %> 
   </TD>
 	</TR>
 	</TABLE>
<%}%>


  </form>

</body>
</html>
