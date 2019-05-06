<html>
<head>
<title>Logs Inquiry</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "logs" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>
<SCRIPT Language="Javascript">
    builtNewMenu(pr_inq_opt);
 </SCRIPT>
  

</head>

<BODY>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }
 out.println("<SCRIPT> initMenu();  </SCRIPT>");
%> 
<h3 align="center">Wire Transfers Log Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="logs_inquiry.jsp, EPR0200"></h3>
<hr size="4">
  <form>
    <INPUT TYPE=HIDDEN NAME="SCREEN" value="10">
	 <INPUT TYPE=HIDDEN NAME="opt" VALUE="1">
  <%
	if ( logs.getNoResult() ) {
 %> 
  <TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
        
      <div align="center"> <font size="3"><b> There is no match for your criteria 
        </b></font> </div>
      </TD></TR>
   		</TABLE>
  <%   		
	}
	else {
%> <br>
  
    <table class="tableinfo" id="headTable1">
      <tr id="TRDARK">
        <th align=CENTER>Account <BR> Number</th>
        <th align=CENTER>Format</th>
        <th align=CENTER>Amount</th>
        
      <th align=CENTER>Action</th>
        <th align=CENTER>Related <BR>
          Reference</th>
        <th align=CENTER>User</th>
        <th align=CENTER>Swift Rec. <BR>
          Id</th>
        <th align=CENTER>Status </th>
        <th align=CENTER>Access<BR>
          Mode</th>
        <th align=CENTER>Process <BR>
          Type</th>
        <th align=CENTER>Date</th>
        <th align=CENTER>Time</th>
      </tr>
      <%
      logs.initRow();
      while (logs.getNextRow()) {
					    
      %> 
      <tr id="TRCLEAR">
        <td NOWRAP align=CENTER>
          
        <div align="center"><%= logs.getRecord(12)%></div>
        </td>
        <td NOWRAP align=CENTER><%= logs.getRecord(0)%></td>
        <td NOWRAP align=CENTER>
        <div align="right"><%= logs.getRecord(1)%> : <%= logs.getRecord(11)%></div>
      </td>
        
      <td NOWRAP align=CENTER> 
        <div align="center"></div>
        <%= logs.getRecord(2)%></td>
        <td NOWRAP align=CENTER> 
          <div align="right"><%= logs.getRecord(3)%></div>
        </td>
        <td NOWRAP align=CENTER><%= logs.getRecord(4)%></td>
        <td NOWRAP align=CENTER> 
          <div align="right"> <%= logs.getRecord(5)%></div>
        </td>
        <td NOWRAP align=CENTER><%= logs.getRecord(6)%></td>
        <td NOWRAP align=CENTER> 
          <div align="right"><%= logs.getRecord(7)%></div>
        </td>
        <td NOWRAP align=CENTER><%= logs.getRecord(8)%> </td>
        <td NOWRAP align=CENTER><%= logs.getRecord(9)%> </td>
        <td NOWRAP align=CENTER><%= logs.getRecord(10)%> </td>
      </tr>
      <%
     }
   %> 
    </table>

  
  <%
     }   
  %> 
 
</form>
</body>
</html>
