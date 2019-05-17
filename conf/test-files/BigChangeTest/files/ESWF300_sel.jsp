<html>
<head>
<title>Templates</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ESWF0300Help" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<script language="JavaScript">

 function goAction(op) {

	document.forms[0].opt.value = op;
	document.forms[0].submit();
  
}



  function getParams(format,template,swiftid) {

    document.forms[0].FORMAT.value = format;
	document.forms[0].TEMPLATE.value = template; 
	document.forms[0].SWIFTID.value = swiftid;   
  }

</SCRIPT>
</head>

<BODY onLoad="">
<h3 align="center">Templates List<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="ESWF300_sel"></h3>
<hr size="4">
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%> 
<%
	if ( ESWF0300Help.getNoResult() ) {
 %>
 
 
 <form>
    <INPUT TYPE=HIDDEN NAME="SCREEN" value="12">
    <INPUT TYPE=HIDDEN NAME="opt">
 
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
      <div align="center"> 
        <p><b> There is no match for your search criteria </b></p>
        <table  class="tbenter" width=100% align=center>
          <tr > 
            <td class=TDBKG width="29%" > 
              <div align="center" ><a href="javascript:goAction(1)"><b>New</b></a></div>
            </td>
            <td class=TDBKG width="37%" > 
              <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
            </td>
          </tr>
        </table>
        <p>&nbsp;</p>
      </div>
      </TD></TR>
   		</TABLE>
</form>
<%  
		}
	else {
%>	
  <form>

    
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" value="12">
    <INPUT TYPE=HIDDEN NAME="opt">
    <input type=HIDDEN name="FORMAT">
    <input type=HIDDEN name="TEMPLATE">
    <input type=HIDDEN name="SWIFTID">
    <input type=HIDDEN name="totalRow" value="0">
  </p>
  <table class="tbenter" align=center>
    <tr> 
      <td class=TDBKG > 
        <div align="center" ><a href="javascript:goAction(1)"><b>New</b></a></div>
      </td>
      <td class=TDBKG > 
        <div align="center"><a href="javascript:goAction(2)"><b>Maintenance</b></a></div>
      </td>
      <td class=TDBKG > 
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
            <th align=CENTER nowrap >Format</th>
            <th align=CENTER nowrap > 
              <div align="center">Template</div>
            </th>
            <th align=CENTER nowrap >Swift ID</th>
            <th align=CENTER nowrap > 
              <div align="center">Remarks</div>
            </th>
          </tr>
        </table>
     <div id="dataDiv1" class="scbarcolor" >
    <table id="dataTable" > 
		<%
                ESWF0300Help.initRow();
				int k=1;
                while (ESWF0300Help.getNextRow()) {
                 
                  out.println(ESWF0300Help.getRecord());
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
  </form>
<%}%>
</body>
</html>