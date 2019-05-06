<html>
<head>
<title>Currency Position</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "limPos" class= "datapro.eibs.beans.JBListRec"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>


</head>

<BODY>

<h3 align="center">Currency Positions Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cif_position.jsp,ECIF010"></h3>
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
  <center>
    <table class="tableinfo" id="headTable1">
      <tr id="TRDARK"> 
        <th align=CENTER>Currency</th>
        <th align=CENTER>Yesterday <BR>
          Position</th>
        <th align=CENTER>Today<BR>
          Net</th>
        <th align=CENTER>Fx <BR>
          Forward</th>
        <th align=CENTER>Third Party<BR>
          Payment Forward</th>
        <th align=CENTER>Position <BR>
          Balance</th>
        <th align=CENTER>Trading <BR>
          Position</th>
      </tr>
      <%
      limPos.initRow();
      while (limPos.getNextRow()) {
       						    
      %> 
      <tr id="TRCLEAR"> 
        <td NOWRAP align=CENTER><A HREF = "javascript:showCCYDetail('<%= limPos.getRecord(0)%>');"> 
          <%= limPos.getRecord(0)%></A></td>
        <td NOWRAP align=CENTER><A HREF = "javascript:showCCYDetail('<%= limPos.getRecord(0)%>');"> 
          <div align="right"><%= limPos.getRecord(1)%></div>
          </A> </td>
        <td NOWRAP align=CENTER><A HREF = "javascript:showCCYDetail('<%= limPos.getRecord(0)%>');"> 
          <div align="right"><%= limPos.getRecord(2)%></div>
          </A> </td>
        <td NOWRAP align=CENTER><A HREF = "javascript:showCCYDetail('<%= limPos.getRecord(0)%>');"> 
          <div align="right"><%= limPos.getRecord(3)%></div>
          </A> </td>
        <td NOWRAP align=CENTER><A HREF = "javascript:showCCYDetail('<%= limPos.getRecord(0)%>');"> 
          <div align="right"><%= limPos.getRecord(4)%></div>
          </A> </td>
        <td NOWRAP align=CENTER><A HREF = "javascript:showCCYDetail('<%= limPos.getRecord(0)%>');"> 
          <div align="right"><%= limPos.getRecord(5)%></div>
          </A> </td>
        <td NOWRAP align=CENTER><A HREF = "javascript:showCCYDetail('<%= limPos.getRecord(0)%>');"> 
          <div align="right"><%= limPos.getRecord(6)%></div>
          </A> </td>
      </tr>
      <%
     }
   %> 
    </table>
</center>
  <div align="center"></div>
  <h4>&nbsp;</h4>
  <%
     }   
  %> 
 
</form>
</body>
</html>
