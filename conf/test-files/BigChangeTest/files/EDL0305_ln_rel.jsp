<html>
<head>
<title>Relationship</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "cifPos" class= "datapro.eibs.beans.JBList"  scope="session"/>


<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">
<%
if ( userPO.getHeader23().equals("G") ||  userPO.getHeader23().equals("V")){
%>
	builtNewMenu(ln_i_1_opt);
<%   
}
else  {
%>
	builtNewMenu(ln_i_2_opt);
<%   
}
%>

</SCRIPT>

</head>

<BODY>

<SCRIPT> initMenu();  </SCRIPT>

<h3 align="center">Relationship Between Accounts<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="ln_rel.jsp,EDL0305"></h3>
<hr size="4">
  <form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JEDL0305" >
    <INPUT TYPE=HIDDEN NAME="SCREEN" value="2">
	<INPUT TYPE=HIDDEN NAME="CODE" VALUE="">
	<INPUT TYPE=HIDDEN NAME="TYPE" VALUE="">
	<INPUT TYPE=HIDDEN NAME="ACCOUNT" VALUE="">
<%
	if ( cifPos.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
        <div align="center"> <font size="3"><b> There is no match for your search 
          criteria </b></font> </div>
      </TD></TR>
   		</TABLE>
  <%   		
	}
	else {
%> 
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="14%" > 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="9%" > 
              <div align="left"> 
                <input type="text" name="E02CUN2" size="9" maxlength="9" readonly value="<%= userPO.getHeader2().trim()%>">
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E02NA12" size="45" maxlength="45" readonly value="<%= userPO.getHeader3().trim()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap ><b> 
              <input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getHeader1().trim()%>">
              </b></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="14%"> 
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> 
                <input type="text" name="E02ACC" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%"> 
            <% if (!userPO.getHeader23().equals("R")) { %>            
              <div align="right">Officer :</div>
            <% } %>
            </td>
            <td nowrap width="33%"> 
            <% if (!userPO.getHeader23().equals("R")) { %>           
              <div align="left"><b> 
                <input type="text" name="E02NA122" size="30" maxlength="30" readonly value="<%= userPO.getOfficer().trim()%>">
                </b> </div>
            <% } %>            
            </td>
            <td nowrap width="11%"> 
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="21%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Relation Between Accounts</h4>
  <TABLE class="tableinfo">
    <TR id="trdark"> 
      <TH ALIGN=CENTER >Account</TH>
      <TH ALIGN=CENTER >Name</TH>
      <TH ALIGN=CENTER >Maturity</TH>
      <TH ALIGN=CENTER >Rate</TH>
      <TH ALIGN=CENTER >Principal</TH>
      <TH ALIGN=CENTER >Interest</TH>
      <TH ALIGN=CENTER >Type</TH>
    </TR>
    <%
                cifPos.initRow();
                while (cifPos.getNextRow()) {
                    if (cifPos.getFlag().equals("2")) {
                    		out.println(cifPos.getRecord());
                    }
                }
    %> 
    <TR id="trdark"> 
      <TH ALIGN=CENTER >Totales</TH>
      <TH ALIGN=CENTER ></TH>
      <TH ALIGN=CENTER ></TH>
      <TH ALIGN=RIGHT ><%= userPO.getHeader7() %></TH>
      <TH ALIGN=RIGHT ><%= userPO.getHeader8() %></TH>
      <TH ALIGN=RIGHT ><%= userPO.getHeader9() %></TH>
      <TH ALIGN=CENTER ></TH>
    </TR>    
  </TABLE>
  <BR>
 <% if (userPO.getHeader23().equals("R")) { %>
	 <h4>Purchase Amortization</h4> 
 <% } else { %>
	<h4>Participated Loan Amortization</h4> 
 <% } %>
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Original Amortization :</div>
            </td>
            <td nowrap width="75%"> 
              <input type="text" name="E01TAMOAM" size="17" maxlength="16" value="<%= userPO.getHeader4().trim()%>" >
            </td>
           </tr>
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Unamortized Amount :</div>
            </td>
            <td nowrap width="75%"> 
              <input type="text" name="E01TAMACA" size="17" maxlength="16" value="<%= userPO.getHeader5().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Amortization to Date :</div>
            </td>
            <td nowrap width="23%"> 
              <input type="text" name="E01TAMSAL" size="17" maxlength="16" value="<%= userPO.getHeader6().trim()%>" >
            </td>
          </tr>      
   		</table>
      </td>
    </tr>
  </table>       
  <%
  }
%>
</form>
</body>
</html>
