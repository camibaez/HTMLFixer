<html>
<head>
<title> Loan Collateral Details</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "coll" class= "datapro.eibs.beans.JBListRec"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

</head>
<body >

<h3 align="center"> Collateral List<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="ln_coll_det.jsp,EDL0150"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0150" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="506">
  <table class="tableinfo" style="width:'70%'" align="center">
    <tr > 
      <td nowrap > 
        <table cellpadding=2 cellspacing=0 >
          <tr id="trdark"> 
            <td nowrap width="28%"  > 
              <div align="center">Collateral</div>
            </td>
            <td nowrap width="19%"  > 
              <div align="center">Type</div>
            </td>
            <td nowrap width="10%"  "> 
              <div align="center">Currency</div>
            </td>
            <td nowrap width="43%"  > 
              <div align="center">Amount</div>
            </td>
          </tr>
          <%
                coll.initRow();
                while (coll.getNextRow()) {
	      %> 
          <tr id="trclear"> 
            <td nowrap width="28%" > 
              <div align="center"> 
                <input type="text" name="RCLACB_<%= coll.getCurrentRow() %>" size="15" maxlength="9"  value="<%= coll.getRecord(0) %>" onkeypress="enterInteger()">
                <a href="javascript:GetAccount('RCLACB_<%= coll.getCurrentRow()%>','','91','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Collaterals" align="middle" border="0" ></a>
                <a href="javascript:GetAccount('RCLACB_<%= coll.getCurrentRow()%>','','12','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="CDs" align="middle" border="0" ></a>
                </div>
            </td>
            <td nowrap width="19%" > 
              <div align="center"> 
                <input type="text" name="RCLTYB_<%= coll.getCurrentRow() %>" size="25" maxlength="25"  value="<%= coll.getRecord(1) %>" readonly>
              </div>
            </td>
            <td nowrap width="10%"   > 
              <div align="center"> 
                <input type="text" name="RCLCCY_<%= coll.getCurrentRow() %>" size="4" maxlength="3" value="<%= coll.getRecord(2) %>" readonly>
              </div>
            </td>
            <td nowrap width="43%"   > 
              <div align="center"> 
                <input type="text" name="RCLAMT_<%= coll.getCurrentRow() %>" size="17" maxlength="13" value="<%= coll.getRecord(3) %>" id="txtright" onkeypress="enterDecimal()">
              </div>
            </td>
          </tr>
          <%
                }
			for (int i=coll.getRow(); i < 10; i++) {
    %> 
          <tr id="trclear"> 
            <td nowrap width="28%" > 
              <div align="center"> 
                <input type="text" name="RCLACB_<%= i %>" size="15" maxlength="9" onkeypress="enterInteger()">
                <a href="javascript:GetAccount('RCLACB_<%= i %>','','91','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Collaterals" align="middle" border="0" ></a>
                <a href="javascript:GetAccount('RCLACB_<%= i %>','','12','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="CDs" align="middle" border="0" ></a>
                </div>
            </td>
            <td nowrap width="19%" > 
              <div align="center"> 
                <input type="text" name="RCLTYB_<%= i %>" size="25" maxlength="25" value="" readonly>
              </div>
            </td>
            <td nowrap width="10%"  > 
              <div align="center"> 
                <input type="text" name="RCLCCY_<%= i %>" size="4" maxlength="3" value="" readonly>
              </div>
            </td>
            <td nowrap width="43%"  > 
              <div align="center"> 
                <input type="text" name="RCLAMT_<%= i %>" size="17" maxlength="13" value="" id="txtright" onkeypress="enterDecimal()">
              </div>
            </td>
          </tr>
          <%
                }
    %> 
        </table>
      </td>
    </tr>
  </table>
  <br>
  <div align="center"> 
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>

</form>
</body>
</html>
