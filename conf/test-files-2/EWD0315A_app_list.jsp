<html>
<head>
<title>Instruments</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EWD0315Help" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<script language="JavaScript">

function goAction(op,a) {

	document.forms[0].ACTION.value = a;
	document.forms[0].opt.value = op;
	document.forms[0].submit();
  
}

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

function cancelBub(){
  event.cancelBubble = true;
}



function getParams(code,ordnum,customer,custodian,paytype,pdate1,pdate2,pdate3,custodiancod,customercod,
				  delamount,comamount,projamount,paidamount,rcd) {

    document.forms[0].CODE.value = code;
    document.forms[0].ORDERNUM.value = ordnum;
    document.forms[0].CUSTOMER.value = customer;
    document.forms[0].CUSTODIAN.value = custodian;
    document.forms[0].PAYTYPE.value = paytype;
    document.forms[0].PDATE1.value = pdate1;
    document.forms[0].PDATE2.value = pdate2;
    document.forms[0].PDATE3.value = pdate3;
	document.forms[0].CUSTODIANCOD.value = custodiancod;
	document.forms[0].CUSTOMERCOD.value = customercod;
	document.forms[0].DELAMOUNT.value = delamount;
    document.forms[0].COMAMOUNT.value = comamount;
    document.forms[0].PROJAMOUNT.value = projamount;
    document.forms[0].PAIDAMOUNT.value = paidamount;
    document.forms[0].RCD.value = rcd;
}

document.onclick= closeEnter;

</SCRIPT>  

</head>

<BODY>
<h3 align="center">Coupon Payment Approval<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="sel_instruments.jsp, EWD0308"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEWD0315A" >
  <input type=HIDDEN name="SCREEN" value="2">
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
	if ( EWD0315Help.getNoResult() ) {
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

   <div id="enterACC" style="position:absolute; visibility:hidden; left:25px; top:-50px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)" onclick="cancelBub()">
 <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
    <tr id="trclear"> 
      <td align=CENTER> 
        <div align="center">Coupon Rejected</div>
      </td>
    </tr>
	<tr id="trclear"> 
      <td align=CENTER width="18%"> 
        <div align="right">Reason :</div>
      </td>
      <td align=CENTER width="34%"> 
        <div align="left"> 
         <input type="text" name="REASON" size="35" maxlength="30">
        </div>
      </td>
    </tr>
   <tr id="trclear">
   
   <TD ALIGN=center nowrap colspan="2">
	     <input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="javascript:goAction(3,'R')"> 
   </TD>
   
   </tr>
 </TABLE>
</div>




         
  <table class="tbenter" width=100% align=center>
    <tr> 
      <td class=TDBKG width="33%"> 
        <div align="center"><a href="javascript:goAction(3,'A')"><b>Approve</b></a></div>
      </td>
      <td class=TDBKG> 
        <div align="center" style="cursor:hand" onClick="ShowEnterCod()"><a><b>Reject</b></a> 
        </div>
      </td>
      <td class=TDBKG width="33%">
        <div align="center"><a href="javascript:goAction(3,'D')"><b>Delete</b></a></div>
      </td>
      <td class=TDBKG width="33%"> 
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
            <th align=CENTER nowrap > 
              <div align="center">Customer</div>
            </th>
            <th align=CENTER nowrap >Custodian</th>
            <th align=CENTER nowrap > 
              <div align="center">Pmnt. <BR>
                Type</div>
            </th>
            <th align=CENTER nowrap >Pmnt. <BR>
              Date</th>
            <th align=CENTER nowrap >Coupon<BR>
              Amount</th>
            <th align=CENTER nowrap >Comm. <BR>
              Amount</th>
            <th align=CENTER nowrap >Status</th>
          </tr>
        </table>
          <div id="dataDiv1" class="scbarcolor" >
    <table id="dataTable" > 
		<%
                EWD0315Help.initRow();
				int k=1;
                while (EWD0315Help.getNextRow()) {
                 
                  out.println(EWD0315Help.getRecord());
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
        if ( EWD0315Help.getShowPrev() ) {
      			int pos = EWD0315Help.getFirstRec() - 51;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.invest.JSEWD0315?SCREEN=1&Pos=" + pos +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/previous_records.gif\" ></A>");
        }
   %>  
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>     
 <% 
        if ( EWD0315Help.getShowNext() ) {
      			int pos = EWD0315Help.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.invest.JSEWD0315?SCREEN=1&Pos=" + pos +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/next_records.gif\" ></A>");
        }
  %> 
   </TD>
 	</TR>
 	</TABLE>
<%}%>


  </form>

</body>
</html>
