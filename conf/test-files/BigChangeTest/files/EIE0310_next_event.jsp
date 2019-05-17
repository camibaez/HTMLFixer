<html>
<head>
<title>Next Event Inquiry</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EIE0310Help" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<script language="JavaScript">


</SCRIPT>  

</head>

<BODY>
<h3 align="center">Next Event Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="next_event.jsp, EIE0310"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0310" >
  <input type=HIDDEN name="SCREEN" value="2">
  <input type=HIDDEN name="opt" value="1">
  <input type=HIDDEN name="REPORT" value="2">
  <input type=HIDDEN name="totalRow" value="0">
  
  <%
	if ( EIE0310Help.getNoResult() ) {
 %> 
  <p>&nbsp;</p><TABLE class="tbenter" width="100%" >
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

          
  <br>
  
  <TABLE  id="mainTable" class="tableinfo">
 <TR > 
    <TD NOWRAP valign="top" width="100%" >
        <table id="headTable" width="100%" >
          <tr id="trdark"> 
            <th align=CENTER nowrap > 
              <div align="center">Event <br>
                Date</div>
            </th>
            <th align=CENTER nowrap >Event <br>
              Description</th>
            <th align=CENTER nowrap > 
              <div align="center">Instrument</div>
            </th>
            <th align=CENTER nowrap >Instrument<BR>
              CCY</th>
            <th align=CENTER nowrap >Instrument <br>
              Type </th>
            <th align=CENTER nowrap >Customer </th>
            <th align=CENTER nowrap >Cash <br>
              Account <br>
              CCY </th>
            <th align=CENTER nowrap > 
              <div align="center">Cash <br>
                Account</div>
            </th>
            <th align=CENTER nowrap > 
              <div align="center">Foreign<br>
                Exchange</div>
            </th>
            <th align=CENTER nowrap > 
              <div align="center"> Total<br>
                Amount to <br>
                be Paid<br>
              </div>
            </th>
            <th align=CENTER nowrap > 
              <div align="center">Equivalent<br>
                in Cash <br>
                Account CCY</div>
            </th>
            <th align=CENTER nowrap > 
              <div align="center">Balance <br>
                at <br>
                Maturity</div>
            </th>
            <th align=CENTER nowrap > 
              <div align="center">Broker</div>
            </th>
            <th align=CENTER nowrap > 
              <div align="center">Portfolio <br>
                Type</div>
            </th>
            <th align=CENTER nowrap > 
              <div align="center">Pledge</div>
            </th>
          </tr>
        </table>
     <div id="dataDiv1" class="scbarcolor" >
    <table id="dataTable" > 
		<%
                EIE0310Help.initRow();
				int k=1;
                while (EIE0310Help.getNextRow()) {
                 
                  out.println(EIE0310Help.getRecord());
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
     
   
     
</SCRIPT>
  <TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR> 
      <TD WIDTH="50%" ALIGN=LEFT> <%
        if ( EIE0310Help.getShowPrev() ) {
      			int pos = EIE0310Help.getFirstRec() - 51;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.invest.JSEIE0310V?SCREEN=100&Pos=" + pos +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/previous_records.gif\" ></A>");
        }
   %> </TD>
      <TD WIDTH="50%" ALIGN=RIGHT> <% 
        if ( EIE0310Help.getShowNext() ) {
      			int pos = EIE0310Help.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.invest.JSEIE0310V?SCREEN=100&Pos=" + pos +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/next_records.gif\" ></A>");
        }
  %> </TD>
    </TR>
  </TABLE>
<%}%>


  </form>

</body>
</html>
