<html>
<head>
<title>Loan Deductions Details</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "ded" class= "datapro.eibs.beans.JBListRec"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

</head>
<body nowrap>

<h3 align="center"> Deductions List<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="ln_ded_det.jsp,EDL0150"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0150" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="504">
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap > 
        <table cellpadding=0 cellspacing=2 width="100%" >
          <tr id="trdark"> 
            <td nowrap width="7%"  > 
              <div align="center">Selection</div>
            </td>
            <td nowrap width="5%"  > 
              <div align="center">Code</div>
            </td>
            <td nowrap width="29%"  > 
              <div align="center">Company</div>
            </td>
            <td nowrap width="15%" > 
              <div align="center">Policy</div>
            </td>
            <td nowrap width="12%"  > 
              <div align="center">Deduction</div>
            </td>
            <td nowrap width="32%" > 
              <div align="center">Factor</div>
            </td>
          </tr>
          <%
                ded.initRow();
                while (ded.getNextRow()) {
	      %> 
          <tr id="trclear"> 
            <td nowrap width="7%" > 
              <div align="center"> 
                <input type="checkbox" name="DLISEL_<%= ded.getCurrentRow() %>" value="X" <% if (ded.getRecord(23).equals("X")) out.print("checked"); %>>
              </div>
            </td>
            <td nowrap width="5%" > 
              <div align="center"> 
                <input type="text" name="DLICDE_<%= ded.getCurrentRow() %>" size="4" maxlength="4" readonly value="<%= ded.getRecord(4) %>">
              </div>
            </td>
            <td nowrap width="29%" > 
              <div align="center"> 
                <input type="text" name="DLINME_<%= ded.getCurrentRow() %>" size="40" maxlength="35" readonly value="<%= ded.getRecord(10) %>">
    		  </div>
            </td>
            <td nowrap width="15%"  > 
              <div align="center"> 
                <input type="text" name="DLIPLZ_<%= ded.getCurrentRow() %>" size="25" maxlength="20" value="<%= ded.getRecord(16) %>">
              </div>
            </td>
            <td nowrap width="12%"  > 
              <div align="center"> 
                <input type="text" name="DLIDPM_<%= ded.getCurrentRow() %>" size="17" maxlength="13" value="<%= ded.getRecord(5) %>" onkeypress="enterDecimal()">
              </div>
            </td>
            <td nowrap width="32%"   > 
              <div align="center"> 
                <input type="text" name="DLIFAC_<%= ded.getCurrentRow() %>" size="3" maxlength="1" value="<%= ded.getRecord(6) %>">
                <a href="javascript:lnGetFact('DLIFAC_<%= ded.getCurrentRow() %>','STATIC_ln_ded_typ.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="factor list" align="absbottom" border="0" width="18" height="22" ></a></div>
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
