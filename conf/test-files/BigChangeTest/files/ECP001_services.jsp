<html>
<head>
<title>Service Fee</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "services" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>



</head>

<BODY>
<h3 align="center">Services Fee Schedule <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="sel_portfolio.jsp, EIE0300"></h3>
<hr size="4">

<FORM  METHOD="post" >  
  <p> 
    <input type=HIDDEN name="SCREEN" value="3">
    <input type=HIDDEN name="opt" value="1">
    <input type=HIDDEN name="totalRow" value="0">
  </p>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right"> Customer :</div>
            </td>
            <td nowrap colspan="5" > 
              <div align="left">
                <input type=HIDDEN name="CUSTOMER" value="<%= userPO.getCusNum()%>">
                <%= userPO.getCusNum()%> - <%= userPO.getCusName()%></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p><%
	if ( services.getNoResult() ) {
 %> </p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp; </p>
  <TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>There is no match for your search criteria </b></p>
          
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
    <TD NOWRAP valign="top" >
                
        <table id="headTable" >
          <tr id="trdark"> 
            <th align=CENTER nowrap >&nbsp;</th>
            <th align=CENTER nowrap colspan="5" > 
              <div align="center">Fee Concept </div>
              
            </th>
            <th align=CENTER nowrap >Summary</th>
            <th align=CENTER nowrap >Fee Income </th>
          </tr>
        </table>

     <div id="dataDiv1" class="scbarcolor" >
    <table id="dataTable" > 
		<%
                services.initRow();
				int k=1;
                while (services.getNextRow()) {
                 
                  out.println(services.getRecord());
                  k++;   
                }
              %> 
    </table>
          <table width="100%" >
            <tr id="trdark"> 
              <td nowrap   width="72%" colspan="7"> 
                <div align="right"><b>Total Services Fee :</b></div>
              </td>
              <td nowrap  width="14%" > 
                <div align="right"></div>
              </td>
              <td nowrap width="14%" > 
                <div align="right"><%= userPO.getHeader21()%></div>
              </td>
            </tr>
          </table>
        </div>
    
</Table>
  <br>
  <SCRIPT language="JavaScript">
     document.forms[0].totalRow.value="<%= k %>";
     function resizeDoc() {
       divResize(false);
     adjustEquTables(headTable, dataTable, dataDiv1,1,false);
     
      }

     resizeDoc();
    
     window.onresize=resizeDoc;
     
     
     
</SCRIPT>
  <%}%> 
</form>

</body>
</html>
