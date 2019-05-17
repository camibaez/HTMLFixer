<html>
<head>
<title>Back Office</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EWD0341Help" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<script language="JavaScript">

   function goAction(refnum) {

     page = "<%=request.getContextPath()%>/servlet/datapro.eibs.transfer.JSEWD0341F?SCREEN=3&REFNUM="+refnum;
	 CenterWindow(page,600,500,2);
  }

</SCRIPT>  

<script language="JavaScript">
  function getValor(Account) {

    document.forms[0].acc.value = Account;
  }

</SCRIPT>
</head>

<BODY onLoad="">
<h3 align="center">Wire Transfers Repair List<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="swift_list.jsp, EWD0341"></h3>
<hr size="4">
<%
	if ( EWD0341Help.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
      <div align="center"> <b> There is no match for your search 
        criteria </b></div>
      </TD></TR>
   		</TABLE>
<%  
		}
	else {
%>	
  <form>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%> 
    
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="2">
  <INPUT TYPE=HIDDEN NAME="opt">
  <input type=HIDDEN name="totalRow" value="0">
  <p> 
  <TABLE  id="mainTable" class="tableinfo">
 <TR > 
    <TD NOWRAP valign="top" width="100%" >
        <table id="headTable" width="100%" >
          <tr id="trdark"> 
            <th align=CENTER nowrap > 
              <div align="center">Reference</div>
            </th>
            <th align=CENTER nowrap >Format</th>
            <th align=CENTER nowrap >Status</th>
            <th align=CENTER nowrap >Ordering </th>
            <th align=CENTER nowrap > 
              <div align="center">Date</div>
            </th>
            <th align=CENTER nowrap > 
              <div align="center">Amount</div>
            </th>
            <th align=CENTER nowrap > 
              <div align="center">Beneficiary</div>
            </th>
          </tr>
        </table>
        <div id="dataDiv1" class="scbarcolor" >
    <table id="dataTable" > 
     <%
                EWD0341Help.initRow();
                int k=1;
                while (EWD0341Help.getNextRow()) {
                 
                    		out.println(EWD0341Help.getRecord());
							k ++;
                    
                }
              %> 
  </table>

 </div>
</Table>
  <br>
  <table class="tbenter" width="98%" align=CENTER>
    <tr> 
      <td width="50%" align=LEFT> <%
        if ( EWD0341Help.getShowPrev() ) {
      			int pos = EWD0341Help.getFirstRec() - 51;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.transfer.JSEWD0341F?SCREEN=1&Pos=" + pos +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/previous_records.gif\" ></A>");
        }
   %> </td>
      <td width="50%" align=RIGHT> <% 
        if ( EWD0341Help.getShowNext() ) {
      			int pos = EWD0341Help.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.transfer.JSEWD0341F?SCREEN=1&Pos=" + pos +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/next_records.gif\" ></A>");
        }
  %> </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <p>
    <SCRIPT language="JavaScript">
     document.forms[0].totalRow.value="<%= k %>";
     function resizeDoc() {
       divResize(false);
     adjustEquTables(headTable, dataTable, dataDiv1,1,false);
      }

     resizeDoc();
    
     window.onresize=resizeDoc;
     
</SCRIPT>
  </p>
</form>
<%
   }  
%>
</body>
</html>
