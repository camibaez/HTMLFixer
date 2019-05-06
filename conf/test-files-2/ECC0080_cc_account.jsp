<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Assign Accounts to Credit Cards</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

</head>
<body>
<h3 align="center">Assign Accounts to Cards<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cc_account.jsp,ECC0080">
</h3>
<hr size="4">
<%
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC0080" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="3">
  <INPUT TYPE=HIDDEN NAME="opt" VALUE="2">
 <%
        int row;
		  try{row = Integer.parseInt(request.getParameter("ROW"));}catch(Exception e){row = 0;}
		  appList.setCurrentRow(row);
  %>
  <INPUT TYPE=HIDDEN NAME="ROW" VALUE="<%= row%>">
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="16%" >
              <div align="right"><b>Card Number :</b></div>
            </td>
            <td nowrap width="20%" >
              <div align="left">
                <input type="text" name="E01CCANUM" size="21" maxlength="20" readonly value="<%= userPO.getHeader1().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" >
              <div align="right"></div>
            </td>
            <td nowrap colspan="3" >
              <div align="left">

              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%" >
              <div align="right"><b>Card Customer :</b></div>
            </td>
            <td nowrap width="20%" >
              <div align="left">
                <input type="text" readonly name="E01CARCUN" size="9" maxlength="9" value="<%= userPO.getCusNum().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" >
              <div align="right"><b>Name :</b></div>
            </td>
            <td nowrap colspan="3" >
              <div align="left">
                <input type="text" name="E01CARNA1" size="45" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%">
              <div align="right"><b>Account : </b></div>
            </td>
            <td nowrap width="20%">
              <div align="left">
                <input type="text" name="E01CCAACC" size="12" maxlength="9" value="<%= appList.getRecord(4).trim()%>">
                <a href="javascript:GetAccount('E01CCAACC','','RT','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              </div>
            </td>
            <td nowrap width="16%">
              <div align="right"><b>Account Type:</b></div>
            </td>
            <td nowrap width="16%">
              <div align="left"><b>
					<input type="text" name="E01CCAATY" size="4" maxlength="3" value="<%= appList.getRecord(3).trim()%>">
                </b> </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%" >
              <div align="right"><b>Account Customer :</b></div>
            </td>
            <td nowrap width="20%" >
              <div align="left">
                <input type="text" readonly name="E01CTACUN" size="9" maxlength="9" value="<%= appList.getRecord(15).trim()%>">
              </div>
            </td>
            <td nowrap width="16%" >
              <div align="right"><b>Name :</b></div>
            </td>
            <td nowrap colspan="3" >
              <div align="left">
                <input type="text" name="E01CTANA1" size="45" maxlength="45" readonly value="<%= appList.getRecord(16).trim()%>">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4> Basic Information</h4>
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
           <tr id="trdark">
            <td nowrap width="25%">
              <div align="right">From Authority :</div>
            </td>
            <td nowrap width="25%">
              <input type="radio" name="E01CCAFAU" value="F" <%if(appList.getRecord(5).equals("F")) out.print("checked");%>>Yes
              <input type="radio" name="E01CCAFAU" value="" <%if(appList.getRecord(5).equals("")) out.print("checked");%>>No
            </td>
            <td nowrap width="25%">
              <div align="right">Inquiry Authority :</div>
            </td>
            <td nowrap width="25%">
              <input type="radio" name="E01CCAIAU" value="Q" <%if(appList.getRecord(6).equals("Q")) out.print("checked");%>>Yes
              <input type="radio" name="E01CCAIAU" value="" <%if(appList.getRecord(6).equals("")) out.print("checked");%>>No
            </td>
          </tr>
           <tr id="trclear">
            <td nowrap width="25%">
              <div align="right">Transfer Authority :</div>
            </td>
            <td nowrap width="25%">
              <input type="radio" name="E01CCATAU" value="T" <%if(appList.getRecord(7).equals("T")) out.print("checked");%>>Yes
              <input type="radio" name="E01CCATAU" value="" <%if(appList.getRecord(7).equals("")) out.print("checked");%>>No
            </td>
            <td nowrap width="25%">
              <div align="right">Default Authority :</div>
            </td>
            <td nowrap width="25%">
              <input type="radio" name="E01CCADAU" value="D" <%if(appList.getRecord(8).equals("D")) out.print("checked");%>>Yes
              <input type="radio" name="E01CCADAU" value="" <%if(appList.getRecord(8).equals("")) out.print("checked");%>>No
            </td>
          </tr>
           <tr id="trdark">
            <td nowrap width="25%">
              <div align="right">Ready Reserve Authority :</div>
            </td>
            <td nowrap width="25%">
              <input type="radio" name="E01CCARAU" value="R" <%if(appList.getRecord(9).equals("R")) out.print("checked");%>>Yes
              <input type="radio" name="E01CCARAU" value="" <%if(appList.getRecord(9).equals("")) out.print("checked");%>>No
            </td>
            <td nowrap width="25%">
              <div align="right">Account Index :</div>
            </td>
            <td nowrap width="25%">
				<input type="text" name="E01CCAIND size="3" maxlength="3" value="<%= appList.getRecord(10).trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4> Limits Amount</h4>
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="25%">
              <div align="right">Cash Withdrawal Limit :</div>
            </td>
            <td nowrap width="25%">
				<input type="text" name="E01CCACWL" size="17" maxlength="16" value="<%= appList.getRecord(11).trim()%>" onkeypress="enterDecimal()">
            </td>
            <td nowrap width="25%">
              <div align="right">Found Back Limit :</div>
            </td>
            <td nowrap width="25%">
            	<input type="text" name="E01CCAFBL" size="17" maxlength="16" value="<%= appList.getRecord(12).trim()%>" onkeypress="enterDecimal()">
  			</td>
          </tr>
          <tr id="trclear">
            <td nowrap width="25%">
              <div align="right">Overdraft Limit :</div>
            </td>
            <td nowrap width="25%">
				<input type="text" name="E01CCAODL" size="17" maxlength="16" value="<%= appList.getRecord(13).trim()%>" onkeypress="enterDecimal()">
            </td>
            <td nowrap width="25%">
              <div align="right">Teller Withdrawal Limit :</div>
            </td>
            <td nowrap width="25%">
            	<input type="text" name="E01CCATWL" size="17" maxlength="16" value="<%= appList.getRecord(14).trim()%>" onkeypress="enterDecimal()">
  			</td>
          </tr>
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
