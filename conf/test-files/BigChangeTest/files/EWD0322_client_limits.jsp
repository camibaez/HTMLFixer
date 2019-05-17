<html>
<head>
<title>Customer Limits</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "limPos" class= "datapro.eibs.beans.JBListRec"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

  

</head>

<BODY>

<h3 align="center">Customer Limits Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="client_limits.jsp,EWD0322"></h3>
<hr size="4">
  <form>
    <INPUT TYPE=HIDDEN NAME="SCREEN" value="10">
	 <INPUT TYPE=HIDDEN NAME="opt" VALUE="1">
  <%
	if ( limPos.getNoResult() ) {
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
%> 
  <p>
<table class="tableinfo">
  <tr > 
      <td nowrap > 
        <table  cellspacing="0" cellpadding="2" width="100%"   align="center">
        <tr>
             
            <td nowrap width="10%" align="left">&nbsp; </td>
             
            <td nowrap width="10%" align="right"> <b>Customer :</b></td>
             <td nowrap width="12%" align="left">
         			<%= userPO.getCusNum()%>
             </td>
             
            <td nowrap width="6%" align="right"><b>Name :</b></td>
             <td nowrap width="14%" align="left">
         			<%= userPO.getCusName()%>
             </td>
        </tr>
      </table>
    </td>
  </tr>
</table>

  <h4>Settlement Limits</h4>
<center>
    <table class="tableinfo" id="headTable1">
      <tr id="TRDARK"> 
        <th align=CENTER>Value <BR>
          Date</th>
        <th align=CENTER>CCY</th>
        <th align=CENTER>Approved <BR>
          Amount</th>
        <th align=CENTER>Used <BR>
          Amount</th>
        <th align=CENTER>Available <BR>
          Amount</th>
        <th align=CENTER>Type</th>
        <th align=CENTER>Dealer <BR>
          Code</th>
        <th align=CENTER>Reference <BR>
          Number</th>
        <th align=CENTER>Base Currency <BR>
          Amount</th>
        <th align=CENTER>Deal <BR>
          Status</th>
      </tr>
      <%
      limPos.initRow();
      while (limPos.getNextRow()) {
       	if (limPos.getFlag().equals("SET")) {
					    
      %> 
      <tr id="TRCLEAR"> 
        <td NOWRAP align=CENTER><%= limPos.getRecord(1)%></td>
        <td NOWRAP align=CENTER><%= limPos.getRecord(2)%></td>
        <td NOWRAP align=CENTER> 
          <div align="right"><%= limPos.getRecord(3)%> </div>
        </td>
        <td NOWRAP align=CENTER> 
          <div align="right"><%= limPos.getRecord(4)%></div>
        </td>
        <td NOWRAP align=CENTER> 
          <div align="right"><%= limPos.getRecord(5)%></div>
        </td>
        <td NOWRAP align=CENTER><%= limPos.getRecord(6)%></td>
        <td NOWRAP align=CENTER><%= limPos.getRecord(7)%></td>
        <td NOWRAP align=CENTER><%= limPos.getRecord(8)%></td>
        <td NOWRAP align=CENTER> 
          <div align="right"><%= limPos.getRecord(9)%></div>
        </td>
        <td NOWRAP align=CENTER><%= limPos.getRecord(10)%> </td>
      </tr>
   <%
   		}
     }
   %> 
    </table>
</center>
  <div align="center"></div>
  <h4>Lines of Credit</h4>
  <center>
  <table class="tableinfo" id="headTable2">
    <tr id="TRDARK"> 
      <th align=CENTER>Value <br>
        Date</th>
      <th align=CENTER>CCY</th>
      <th align=CENTER>Approved <br>
        Amount</th>
      <th align=CENTER>Used <br>
        Amount</th>
      <th align=CENTER>Available <br>
        Amount</th>
      <th align=CENTER>Type</th>
    </tr>
    <%
     limPos.initRow();
     while (limPos.getNextRow()) {
       	if (!limPos.getFlag().equals("SET")) {
					    
  %> 
    <tr id="TRCLEAR"> 
      <td NOWRAP align=CENTER><%= limPos.getRecord(11)%></td>
      <td NOWRAP align=CENTER><%= limPos.getRecord(12)%></td>
      <td NOWRAP align=CENTER> 
        <div align="right"><%= limPos.getRecord(13)%> </div>
      </td>
      <td NOWRAP align=CENTER> 
        <div align="right"><%= limPos.getRecord(14)%></div>
      </td>
      <td NOWRAP align=CENTER> 
        <div align="right"><%= limPos.getRecord(15)%></div>
      </td>
      <td NOWRAP align=CENTER><%= limPos.getRecord(16)%></td>
    </tr>
    <%
    	}
     }
   
  %> 
  </table>
  </center>
   <%
     }   
  %> 
 
</form>
</body>
</html>
