<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Collaterals</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "clList" class= "datapro.eibs.beans.JBList"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">
<%
if (userPO.getPurpose().equals("INQUIRY") && (userPO.getOption().equals("RT") || userPO.getOption().equals("SV") || userPO.getOption().equals("CD"))){
%>

<%
if ( userPO.getOption().equals("RT") ) {
%>
	 builtNewMenu(rt_i_opt);
<%   
}
else if ( userPO.getOption().equals("SV") ) {
%>
	 builtNewMenu(sv_i_opt);
<%   
}
else if (userPO.getOption().equals("CD")){
%>
	 builtNewMenu(cd_i_opt);

<%
}
%>

<%
}
%>
</SCRIPT>

</head>

<BODY>

<%
   if (userPO.getPurpose().equals("INQUIRY") && (userPO.getOption().equals("RT") || userPO.getOption().equals("SV") || userPO.getOption().equals("CD"))){
   	out.println("<SCRIPT> initMenu();  </SCRIPT>");}
%> 

<h3 align="center"> Collaterals
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="collateral_list_liabilities.jsp,ERA0000"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
<INPUT TYPE=HIDDEN NAME="opt" VALUE="1">

<%
	if ( clList.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
        <div align="center"><b> There is no match for your search 
          criteria </b></div>
      </TD></TR>
   		</TABLE>
<%   		
	}
	else {
%>
  <table class="tableinfo">
    <tr> 
      <td nowrap>
        
      <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
        <tr id="trdark"> 
            <TD ALIGN=RIGHT WIDTH=12%> Account: </TD>
          <TD ALIGN=LEFT WIDTH=12%><%= userPO.getAccNum() %> </TD>
          <TD ALIGN=LEFT WIDTH=11%> 
              <div align="right">Currency : </div>
          </TD>
          <TD ALIGN=LEFT WIDTH=5%><%= userPO.getCurrency() %></TD>
          <TD ALIGN=LEFT WIDTH=21%> 
              <div align="right">Account Type: </div>
          </TD>
          <TD ALIGN=LEFT WIDTH=8%><%= userPO.getHeader5() %></TD>
          <TD ALIGN=LEFT WIDTH=15%> 
              <div align="right">Product : </div>
          </TD>
          <TD ALIGN=LEFT WIDTH=16%><%= userPO.getHeader6() %></TD>
        </TR>
        <tr id="trdark"> 
            <TD ALIGN=RIGHT WIDTH=12%>Balance : </TD ALIGN=LEFT WIDTH=50%>
          <TD ALIGN=LEFT WIDTH=12%><%= userPO.getHeader7() %></TD>
          <TD ALIGN=LEFT WIDTH=11%>&nbsp;</TD>
          <TD ALIGN=LEFT WIDTH=5%>&nbsp;</TD>
          <TD ALIGN=LEFT colspan="2"> 
              <div align="right">Remaining Balance: </div>
          </TD>
          <TD ALIGN=LEFT colspan="2"><%= userPO.getHeader8() %></TD>
        </TR>
      </TABLE>
	  </TD>
    </TR>
  </TABLE>
<BR>
  
  <TABLE class="tableinfo">
    <TR id=trdark> 
      <TH ALIGN=CENTER>Account</TH>
      <TH ALIGN=CENTER>Type</TH>
      <TH ALIGN=CENTER>Currency</TH>
      <TH ALIGN=CENTER>Amount</TH>
      <TH ALIGN=CENTER>This Account<br>
        Collaterals</TH>
      <TH ALIGN=CENTER>Other Collaterals</TH>
      <TH ALIGN=CENTER>Amount Pending to Collateral</TH>
    </TR>
    <%
                clList.initRow();
                while (clList.getNextRow()) {
                    if (clList.getFlag().equals("")) {
                    		out.println(clList.getRecord());
                    }
                }
    %> 
  </TABLE>

<%
  }
%>

  </form>
</body>
</html>
