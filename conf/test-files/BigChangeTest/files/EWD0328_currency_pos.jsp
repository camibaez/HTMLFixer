<html>
<head>
<title>Currency Rates</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "limPos" class= "datapro.eibs.beans.JBListRec"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>


</head>

<BODY>

<h3 align="center">Currency Rates Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cif_position.jsp,ECIF010"></h3>
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
  
    <table class="tableinfo" id="headTable1">
      <tr id="trdark"> 
        <th align=CENTER colspan="6">&nbsp;</th>
        <th align=CENTER colspan="2"> 
          <div align="center">Counter <BR>
            Value Rate</div>
        </th>
        <th align=CENTER colspan="2"> 
          <div align="center">Foreign <BR>
            Exchange Rate</div>
        </th>
        <th align=CENTER colspan="4"> 
          <div align="center">Future Exchange Rates</div>
        </th>
      </tr>
      <tr id="TRDARK"> 
        <th align=CENTER > 
          <div align="center">Currency</div>
        </th>
        <th align=CENTER > 
          <div align="center">Description</div>
        </th>
        <th align=CENTER > 
          <div align="center">Today's <BR>
            Spot Rate</div>
        </th>
        <th align=CENTER > 
          <div align="center">Rate <BR>
            Tolerance</div>
        </th>
        <th align=CENTER > 
          <div align="center">Mult. /<BR>
            Div.</div>
        </th>
        <th align=CENTER > 
          <div align="center">Base <BR>
            Days</div>
        </th>
        <th align=CENTER > 
          <div align="center">Purchase</div>
        </th>
        <th align=CENTER > 
          <div align="center">Sale</div>
        </th>
        <th align=CENTER > 
          <div align="center">Purchase</div>
        </th>
        <th align=CENTER > 
          <div align="center">Sale</div>
        </th>
        <th align=CENTER > 
          <div align="center">30 <br>
            Days</div>
        </th>
        <th align=CENTER > 
          <div align="center">90 <br>
            Days</div>
        </th>
        <th align=CENTER "> 
          <div align="center">180 <br>
            Days</div>
        </th>
        <th align=CENTER > 
          <div align="center">1 <br>
            Year</div>
        </th>
      </tr>
      <%
      limPos.initRow();
      while (limPos.getNextRow()) {
       						    
      %> 
      <tr id="TRCLEAR"> 
        <td NOWRAP align=CENTER > <%= limPos.getRecord(0)%></td>
        <td NOWRAP align=CENTER > 
          <div align="right"><%= limPos.getRecord(1)%> </div>
        </td>
        <td NOWRAP align=CENTER > 
          <div align="right"><%= limPos.getRecord(2)%></div>
        </td>
        <td NOWRAP align=CENTER width="67"> 
          <div align="right"><%= limPos.getRecord(3)%></div>
        </td>
        <td NOWRAP align=CENTER width="45"> 
          <div align="right"><%= limPos.getRecord(4)%></div>
        </td>
        <td NOWRAP align=CENTER width="61"> 
          <div align="center"><%= limPos.getRecord(5)%></div>
        </td>
        <td NOWRAP align=CENTER width="56"> 
          <div align="right"><%= limPos.getRecord(6)%></div>
        </td>
        <td NOWRAP align=CENTER width="25"> 
          <div align="right"><%= limPos.getRecord(7)%></div>
        </td>
        <td NOWRAP align=CENTER width="81"> 
          <div align="right"><%= limPos.getRecord(8)%></div>
        </td>
        <td NOWRAP align=CENTER width="58"> 
          <div align="right"><%= limPos.getRecord(9)%></div>
        </td>
        <td NOWRAP align=CENTER width="57"> 
          <div align="right"><%= limPos.getRecord(12)%></div>
        </td>
        <td NOWRAP align=CENTER width="57"> 
          <div align="right"><%= limPos.getRecord(14)%></div>
        </td>
        <td NOWRAP align=CENTER width="57"> 
          <div align="right"><%= limPos.getRecord(17)%></div>
        </td>
        <td NOWRAP align=CENTER width="57"> 
          <div align="right"><%= limPos.getRecord(19)%></div>
        </td>
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
