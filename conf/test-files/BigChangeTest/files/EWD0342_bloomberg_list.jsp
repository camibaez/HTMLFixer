<html>
<head>
<title>Back Office</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EWD0342Help" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<script language="JavaScript">

   function goAction(bloomcod,bloomtyp) {

     page = "<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEWD0342?SCREEN=3&BLOOMCOD=" + bloomcod + "&BLOOMTYP=" + bloomtyp;
	 CenterWindow(page,600,500,2);
  }

</SCRIPT>  


</head>

<BODY onLoad="">
<h3 align="center">Bloomberg Codes List<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="bloomberg_list.jsp, EWD0342"></h3>
<hr size="4">
<%
	if ( EWD0342Help.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
      <div align="center"> 
        <p><b> There is no match for your search criteria </b></p>
        <table class="tbenter" width=100% align=center>
          <tr> 
            <td class=TDBKG width="33%"> 
              <div align="center"><a href="javascript:goAction()"><b>New</b></a> 
              </div>
            </td>
            <td class=TDBKG width="33%"> 
              <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
            </td>
          </tr>
        </table>
        <p>&nbsp;</p>
      </div>
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
    
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" value="2">
    <INPUT TYPE=HIDDEN NAME="opt">
    <input type=HIDDEN name="totalRow" value="0">
  </p>
  <table class="tbenter" width=100% align=center>
    <tr> 
      <td class=TDBKG width="33%"> 
        <div align="center"><a href="javascript:goAction()"><b>New</b></a> </div>
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
            <th align=CENTER nowrap > 
              <div align="center">Bloomberg <br> Code </div>
            </th>
            <th align=CENTER nowrap >Type</th>
            <th align=CENTER nowrap >Bloomberg <br> Field Name</th>
            <th align=CENTER nowrap >IBS <br> Code </th>
            <th align=CENTER nowrap > 
              <div align="center">Description</div>
            </th>
          </tr>
        </table>
        <div id="dataDiv1" class="scbarcolor" >
    <table id="dataTable" > 
     <%
                EWD0342Help.initRow();
                int k=1;
                while (EWD0342Help.getNextRow()) {
                 
                    		out.println(EWD0342Help.getRecord());
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
        if ( EWD0342Help.getShowPrev() ) {
      			int pos = EWD0342Help.getFirstRec() - 21;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.params.JSEWD0342?SCREEN=1&Pos=" + pos +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/previous_records.gif\" ></A>");
        }
   %> </td>
      <td width="50%" align=RIGHT> <% 
        if ( EWD0342Help.getShowNext() ) {
      			int pos = EWD0342Help.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.params.JSEWD0342?SCREEN=1&Pos=" + pos +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/next_records.gif\" ></A>");
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
