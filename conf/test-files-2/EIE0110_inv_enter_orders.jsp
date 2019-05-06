<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>

<script language="JavaScript">
function advanceSearch(){
	  document.forms[0].SCREEN.value = 2;
	  document.forms[0].submit();
	 }

function newOrder(){
	  document.forms[0].SCREEN.value = 2;
	  document.forms[0].submit();
	 }
</script>

<META name="GENERATOR" content="IBM WebSphere Studio">
</head>
<body>


 <%
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
    }
%>
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEWD0309" >
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1">
    <INPUT TYPE=HIDDEN NAME="opt" VALUE="1">
  <input type=HIDDEN name="SEARCHC" value="">
  <h3 align="center">Trade Orders</h3>
  <table class="tbenter" height="55%" width="100%" border="0">
    <tr>
      <td nowrap align="center">
        <table class="tableinfo" align="center" width="100%" >
          <tr>
            <td>
              <table width="100%">
                <tr tr id="trdark">
                  <td valign="middle" align="center" colspan="2" height=33>
                    <div align="left"><b>Search by </b></div>
                  </td>
                </tr>
                <tr id="trclear">
                  <td width="31%" nowrap>
                    <div align="right">Order Number :</div>
                  </td>
                  <td width="69%" nowrap>
                    <input type="text" name="ORDERNUM"  size=9 maxlength="9"
					  onKeyPress="document.forms[0].SEARCHC.value='O'">
                    or </td>
                </tr>

                <tr id="trclear">
                  <td width="27%" nowrap>
                    <div align="right">Portfolio :</div>
                  </td>
                  <td nowrap width="73%">
                   <input type="text" name="PORTFOLIO" id="PORTFOLIO"  size="10" maxlength="9"
					onChange="document.forms[0].SEARCHC.value='P'">
                    <INPUT type="text" name="E01ORDCTN" size="35" maxlength="35" disabled value="">
                     <a href="javascript:GetPortfolioDescIdInvest('PORTFOLIO','E01ORDCTN','')">
                     <img src="/eibs_blt/images/1b.gif" alt="Help" border="0" ></a>
                    or </td>
                </tr>


                <tr id="trclear">
                  <td width="31%" nowrap>
                    <div align="right">Broker : </div>
                  </td>
                  <td nowrap width="69%">
                    <input type="text" name="BROKER"  size=4 maxlength="3"
					onChange="document.forms[0].SEARCHC.value='B'">
                    <input type="text" name="BDESC"  size=35 maxlength="3"
					onChange="document.forms[0].SEARCHC.value='B'">
                    <a href="javascript:GetBrokerI('BROKER','BDESC')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0"></a>
                    or </td>
                </tr>
                <tr id="trclear">
                  <td width="31%" nowrap >
                    <div align="right">Issuer : </div>
                  </td>
                  <td nowrap width="69%" >
                    <input type="text" name="ISSUER"  size=35 maxlength="30"
					onChange="document.forms[0].SEARCHC.value='I'">
                  </td>
                </tr>
                <tr id="trclear">
                  <td width="31%" nowrap >
                    <div align="right">Instrument Type : </div>
                  </td>
                  <td nowrap width="69%" >
                    <div align="left">
                      <select name="TYPE">
                        <option value=" ">All </option>
                        <option value="BND">Bonds</option>
                        <option value="EQT">Equity</option>
                        <option value="MUT">Mutual Funds</option>
                        <option value="PFS">Preferred Stocks</option>
                        <option value="ACD">Commodities</option>
                      </select>
                    </div>
                  </td>
                </tr>
                <tr id="trclear">
                  <td width="31%" nowrap >
                    <div align="right">Transaction Type :</div>
                  </td>
                  <td nowrap width="69%" >
                    <select name="TRANSTYPE">
                      <option value="">All</option>
                      <option value="1">Purchase</option>
                      <option value="2">Sale</option>
                      <option value="3">Transfer In</option>
                      <option value="4">Transfer Out</option>
                      <option value="5">Multiple Purchase</option>
                    </select>
                  </td>
                </tr>
                <tr id="trclear">
                  <td width="31%" nowrap >
                    <div align="right">Trade Date : </div>
                  </td>
                  <td nowrap width="69%" >
                    <div align="left">
                      <input type="text" size="2" maxlength="2" name="DATEF1"
					  onChange="document.forms[0].SEARCHC.value='D'">
                      <input type="text" size="2" maxlength="2" name="DATEF2" onKeyPress="enterInteger()">
                      <input type="text" size="2" maxlength="2" name="DATEF3" onKeyPress="enterInteger()">
                      <a href="javascript:DatePicker(document.forms[0].DATEF1,document.forms[0].DATEF2,document.forms[0].DATEF3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
                      To
                      <input type="text" size="2" maxlength="2" name="DATET1"
					   onChange="document.forms[0].SEARCHC.value='D'">
                      <input type="text" size="2" maxlength="2" name="DATET2" onKeyPress="enterInteger()">
                      <input type="text" size="2" maxlength="2" name="DATET3" onKeyPress="enterInteger()">
                      <a href="javascript:DatePicker(document.forms[0].DATET1,document.forms[0].DATET2,document.forms[0].DATET3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
                    </div>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
          <tr bgcolor="#FFFFFF">
            <td width="33%">&nbsp;</td>
            <td width="33%">&nbsp;</td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td width="33%">
              <div align="center">
                <input id="EIBSBTN" type=button name="Submit2" value="New Order" onClick="newOrder()">
              </div>
            </td>
            <td width="33%">
              <div align="center">
                <input id="EIBSBTN" type=submit name="Submit" value="Submit">
              </div>
            </td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td>&nbsp;</td>
            <td>
              <div align="center"> </div>
            </td>
          </tr>
        </table>

      </td>
    </tr>
  </table>


</form>
</body>
</html>
