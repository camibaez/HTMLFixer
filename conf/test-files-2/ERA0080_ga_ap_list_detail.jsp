<html>
<head>
<title>Collateral Details List</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id= "collList" class= "datapro.eibs.beans.JBListRec"  scope="session" /> 
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" /> 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />


</head>
<body nowrap >
<%
    collList.initRow();
    int max_row = 15;
    int row;
    int total_row;
    try {
      row = Integer.parseInt(request.getParameter("ROW"));
    }
    catch (Exception e) {
      row = 0;
    }
    if ( (row == 0) || (row < collList.getLastRow()) ) {
      total_row = collList.getLastRow() + 1;
    }
    else {
		total_row = row;       
    }
%> 

<SCRIPT LANGUAGE="JavaScript">
builtNewMenu(colla_A_opt);
initMenu();

</SCRIPT>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT Language="Javascript">
            showErrors();
     </SCRIPT>
 <%
 }
%>

 
<form>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="14">
    <INPUT TYPE=HIDDEN NAME="opt" VALUE="2">
    <INPUT TYPE=HIDDEN NAME="ROW" VALUE="">
  
  <h3 align="center">Collaterals Detail List<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="ERA0080_ga_list_detail.jsp"></h3>
  <hr size="4">
  <p align="left"></p>
 
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="10%" > 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="10%" > 
              <div align="left"> 
                <input type="text" name="E01ROCCUN" size="9" maxlength="9" readonly value="<%=userPO.getCusNum().trim()%>">
              </div>
            </td>
            <td nowrap width="13%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap width="37%" > 
              <div align="left"> 
                <input type="text" name="E01RODCUN" size="45" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>" >
                </div>
            </td>
            <td nowrap width="10%" > 
              <div align="right">Reference:</div>
            </td>
            <td nowrap width="20%" > 
              <input type="text" name="E02RODREF" size="9" maxlength="9" readonly value="<%= userPO.getIdentifier().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <BR>
  <table class="tableinfo" >
    <tr id="trdark"> 
      <th align="center" nowrap >Seq</th>
      <th align="center" nowrap > Commercial Register</th>
      <th align="center" nowrap > Collateral Description</th>
      <th align="center" nowrap > Amount</th>
      <th align="center" nowrap > Maturity Date</th>
    </tr>
    <%
   				if ( !collList.getNoResult() ) {
   				 collList.initRow();
                while (collList.getNextRow()) {
	      %> 
    <tr id="trclear"> 
      <td align="center" nowrap > 
        <input type="text"  name="E02RODSEQ_<%= collList.getCurrentRow() %>" size="2" maxlength="2"   readonly value="<%= collList.getRecord(0) %>" id="txtright">
      </td>
      <td align="center" nowrap > 
        <input type="text" name="E02RODNBR_<%= collList.getCurrentRow() %>" size="4" maxlength="4" readonly  value="<%= collList.getRecord(1) %>" >
      </td>
      <td align="center" nowrap> 
        <input type="text" name="E02RODDSC_<%= collList.getCurrentRow() %>" size="35" maxlength="35" readonly value="<%= collList.getRecord(2) %>" >
      </td>
      <td align="center" nowrap > 
        <input type="text" name="E02RODAMT_<%= collList.getCurrentRow() %>" size="17" maxlength="17" readonly value="<%= collList.getRecord(3) %>"  >
      </td>
      <td align="center" nowrap> 
        <input type="text" name="E02RODMD1_<%= collList.getCurrentRow() %>" size="2" maxlength="2" readonly value="<%= collList.getRecord(4) %>">
        <input type="text" name="E02RODMD2_<%= collList.getCurrentRow() %>" size="2" maxlength="2" readonly value="<%= collList.getRecord(5) %>" >
        <input type="text" name="E02RODMD3_<%= collList.getCurrentRow() %>" size="2" maxlength="2" readonly value="<%= collList.getRecord(6) %>">
      </td>
    </tr>
    <%
             }
          }  else {          
      %> 
    <TABLE class="tbenter" width=100% height=75%>
      <TR> 
        <TD> 
          <div align="center"> 
            <p><b>There is no match for your search criteria</b></p>
          </div>
        </TD>
      </TR>
    </TABLE>
    <%
   		}
   	%> 
  </table>
  <BR>
</form>
</body>
</html>
