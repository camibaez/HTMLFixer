<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<html>
<head><title>Treasury </title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>


<jsp:useBean id= "EWD0334Help" class= "datapro.eibs.beans.JBList"   scope="session"/>

<SCRIPT language="JavaScript">
function showInqPlp(ref)
{
	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0105I?SCREEN=400&E01DEAACC=" + ref;
	CenterWindow(page,560,500,2);
}


</SCRIPT>
</head>
<body>
<form>

  <h3 align="center">Deals Accounts - Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="fe_acc.jsp, EWD0334"> 
  </h3>
<hr size="4">
  <input type=HIDDEN name="totalRow" value="0">
  <%
	if ( EWD0334Help.getNoResult() ) {
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
   
<p>&nbsp;</p>
<TABLE  id="mainTable" class="tableinfo">
<TR > 
    <TD NOWRAP valign="top" width="100%" >
        <TABLE id="headTable" width="100%" >
          <TR id="trdark"> 
            <th>Account<BR>
              Number</th>
            <th>Counterparty </th>
            <th>Product <BR> Code</th>
            <th>Type </th>
            <th>Action<BR>
              Taken</th>
            <th> Amount</th>
            <th>Value <br>
              Date</th>
            <th>Status</th>
          </tr>
        </table>
  <div id="dataDiv1" class="scbarcolor" >
    <table id="dataTable" >
  <%
                EWD0334Help.initRow();
				int k = 1;
                while (EWD0334Help.getNextRow()) {
                    if (EWD0334Help.getFlag().equals("")) {
                    		out.println(EWD0334Help.getRecord());
							k ++;
                    }
                }
    %> 
</TABLE>

</div>
</td>
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
     
</SCRIPT>
<%
   }  
%>

</form>
</body>
</html>

