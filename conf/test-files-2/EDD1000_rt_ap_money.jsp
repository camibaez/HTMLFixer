<html>
<head>
<title>Money Launder Parameters</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="rtMoney" class="datapro.eibs.beans.ELD000001Message"   scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"   scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

<%
if ( userPO.getOption().equals("RT") ) {
%>
	builtNewMenu(rt_a_opt);
<%   
}
else if ( userPO.getOption().equals("SV") ) {
%>
	builtNewMenu(sv_a_opt);
<%   
}
%>

 function CheckSubmit()
{
   if(userPO.getPurpose().equals("NEW")){
   document.forms[0].SCREEN.value=2;}
   else{
   document.forms[0].SCREEN.value=4;}
   document.forms[0].submit();
}

 
</SCRIPT>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
	 error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
   
   out.println("<SCRIPT> initMenu();  </SCRIPT>");
   
%> 
<H3 align="center">Money Laundering Control<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="rt_ap_money, EDD1000"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="12">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" readonly name="E06LDMCUN" size="9" maxlength="9" value="<%= userPO.getHeader2().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" readonly name="E06CUSNA1" size="45" maxlength="45" value="<%= userPO.getHeader3().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" readonly name="E06LDMACC" size="12" maxlength="12" value="<%= rtMoney.getE06LDMACC().trim()%>">
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" readonly name="E06DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" >
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" readonly name="E06LDMPRO" size="4" maxlength="4" value="<%= userPO.getHeader1().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <H4><br>
    <table class="tableinfo">
      <tr > 
        <td nowrap> 
          <table cellspacing="0" cellpadding="2" width="100%" border="0">
            <tr id="trdark"> 
              <td nowrap width="38%"> 
                <div align="right">Profile Table :</div>
              </td>
              <td nowrap width="62%"> 
                <input type="text" readonly  name="E06LDMPRF" size="3" maxlength="2" value="<%= rtMoney.getE06LDMPRF().trim()%>" >
                <input type="text" readonly  name="E06DSCPRF" size="36" maxlength="35" value="<%= rtMoney.getE06DSCPRF().trim()%>" >
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    <h4>Retail Accounts</h4>
    <table class="tableinfo">
      <tr > 
        <td nowrap> 
          <table cellspacing="0" cellpadding="2" width="100%" border="0">
            <tr id="trdark"> 
              <td nowrap width="29%"> 
                <div align="center">Activity Type</div>
              </td>
              <td nowrap width="19%"> 
                <div align="center">Number</div>
              </td>
              <td nowrap width="26%"> 
                <div align="center">Amount</div>
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="29%"> 
                <div align="right">Cash Deposits :</div>
              </td>
              <td nowrap width="19%"> 
                <div align="center"> 
                  <input type="text" readonly  name="E06LDMCDP" size="5" maxlength="5" value="<%= rtMoney.getE06LDMCDP().trim()%>" onKeyPress="enterInteger()">
                </div>
              </td>
              <td nowrap width="26%"> 
                <div align="center"> 
                  <input type="text" readonly  name="E06LDMCDA" size="15" maxlength="13" value="<%= rtMoney.getE06LDMCDA().trim()%>" onKeyPress="enterDecimal()">
                </div>
              </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap width="29%"> 
                <div align="right">Other Deposits :</div>
              </td>
              <td nowrap width="19%"> 
                <div align="center"> 
                  <input type="text" readonly  name="E06LDMKDP" size="5" maxlength="5" value="<%= rtMoney.getE06LDMKDP().trim()%>" onKeyPress="enterInteger()">
                </div>
              </td>
              <td nowrap width="26%"> 
                <div align="center"> 
                  <input type="text" readonly  name="E06LDMKDA" size="15" maxlength="13" value="<%= rtMoney.getE06LDMKDA().trim()%>" onKeyPress="enterDecimal()">
                </div>
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="29%" height="23"> 
                <div align="right">Cash Withdrawals :</div>
              </td>
              <td nowrap width="19%" height="23"> 
                <div align="center"> 
                  <input type="text" readonly  name="E06LDMCWD" size="5" maxlength="5" value="<%= rtMoney.getE06LDMCWD().trim()%>" onKeyPress="enterInteger()">
                </div>
              </td>
              <td nowrap width="26%" height="23"> 
                <div align="center"> 
                  <input type="text" readonly  name="E06LDMCWA" size="15" maxlength="13" value="<%= rtMoney.getE06LDMCWA().trim()%>" onKeyPress="enterDecimal()">
                </div>
              </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap width="29%" height="19"> 
                <div align="right">Checks Paid :</div>
              </td>
              <td nowrap width="19%" height="19"> 
                <div align="center"> 
                  <input type="text" readonly  name="E06LDMCPY" size="5" maxlength="5" value="<%= rtMoney.getE06LDMCPY().trim()%>" onKeyPress="enterInteger()">
                </div>
              </td>
              <td nowrap width="26%" height="19"> 
                <div align="center"> 
                  <input type="text" readonly  name="E06LDMCPA" size="15" maxlength="13" value="<%= rtMoney.getE06LDMCPA().trim()%>" onKeyPress="enterDecimal()">
                </div>
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="29%" height="19"> 
                <div align="right">Outgoing Wires :</div>
              </td>
              <td nowrap width="19%" height="19"> 
                <div align="center"> 
                  <input type="text" readonly  name="E06LDMTIN" size="5" maxlength="5" value="<%= rtMoney.getE06LDMTIN().trim()%>" onKeyPress="enterInteger()">
                </div>
              </td>
              <td nowrap width="26%" height="19"> 
                <div align="center"> 
                  <input type="text" readonly  name="E06LDMTIA" size="15" maxlength="13" value="<%= rtMoney.getE06LDMTIA().trim()%>" onKeyPress="enterDecimal()">
                </div>
              </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap width="29%" height="19"> 
                <div align="right">Incoming Wires :</div>
              </td>
              <td nowrap width="19%" height="19"> 
                <div align="center"> 
                  <input type="text" readonly  name="E06LDMTRV" size="5" maxlength="5" value="<%= rtMoney.getE06LDMTRV().trim()%>" onKeyPress="enterInteger()">
                </div>
              </td>
              <td nowrap width="26%" height="19"> 
                <div align="center"> 
                  <input type="text" readonly  name="E06LDMTRA" size="15" maxlength="13" value="<%= rtMoney.getE06LDMTRA().trim()%>" onKeyPress="enterDecimal()">
                </div>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    <h4>Deal Accounts</h4>
    <table class="tableinfo">
      <tr > 
        <td nowrap> 
          <table cellspacing="0" cellpadding="2" width="100%" border="0">
            <tr id="trdark"> 
              <td nowrap width="29%"> 
                <div align="center">Activity Type</div>
              </td>
              <td nowrap width="19%"> 
                <div align="center">Number</div>
              </td>
              <td nowrap width="26%"> 
                <div align="center">Amount</div>
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="29%"> 
                <div align="right">Source of Funds Cash :</div>
              </td>
              <td nowrap width="19%"> 
                <div align="center"> 
                  <input type="text" readonly  name="E06LDMSCN" size="5" maxlength="5" value="<%= rtMoney.getE06LDMSCN().trim()%>" onKeyPress="enterInteger()">
                </div>
              </td>
              <td nowrap width="26%"> 
                <div align="center"> 
                  <input type="text" readonly  name="E06LDMSCA" size="15" maxlength="13" value="<%= rtMoney.getE06LDMSCA().trim()%>" onKeyPress="enterDecimal()">
                </div>
              </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap width="29%"> 
                <div align="right">Source of Funds Wire Transfer :</div>
              </td>
              <td nowrap width="19%"> 
                <div align="center"> 
                  <input type="text" readonly  name="E06LDMSWN" size="5" maxlength="5" value="<%= rtMoney.getE06LDMSWN().trim()%>" onKeyPress="enterInteger()">
                </div>
              </td>
              <td nowrap width="26%"> 
                <div align="center"> 
                  <input type="text" readonly  name="E06LDMSWA" size="15" maxlength="13" value="<%= rtMoney.getE06LDMSWA().trim()%>" onKeyPress="enterDecimal()">
                </div>
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="29%" height="23"> 
                <div align="right">Source of Funds Retail Accounts :</div>
              </td>
              <td nowrap width="19%" height="23"> 
                <div align="center"> 
                  <input type="text" readonly  name="E06LDMSDN" size="5" maxlength="5" value="<%= rtMoney.getE06LDMSDN().trim()%>" onKeyPress="enterInteger()">
                </div>
              </td>
              <td nowrap width="26%" height="23"> 
                <div align="center"> 
                  <input type="text" readonly  name="E06LDMSDA" size="15" maxlength="13" value="<%= rtMoney.getE06LDMSDA().trim()%>" onKeyPress="enterDecimal()">
                </div>
              </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap width="29%" height="19"> 
                <div align="right">Source of Funds Official Checks :</div>
              </td>
              <td nowrap width="19%" height="19"> 
                <div align="center"> 
                  <input type="text" readonly  name="E06LDMSKN" size="5" maxlength="5" value="<%= rtMoney.getE06LDMSKN().trim()%>" onKeyPress="enterInteger()">
                </div>
              </td>
              <td nowrap width="26%" height="19"> 
                <div align="center"> 
                  <input type="text" readonly  name="E06LDMSKA" size="15" maxlength="13" value="<%= rtMoney.getE06LDMSKA().trim()%>" onKeyPress="enterDecimal()">
                </div>
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="29%" height="19"> 
                <div align="right">Disbursement of Funds Cash :</div>
              </td>
              <td nowrap width="19%" height="19"> 
                <div align="center"> 
                  <input type="text" readonly  name="E06LDMBCN" size="5" maxlength="5" value="<%= rtMoney.getE06LDMBCN().trim()%>" onKeyPress="enterInteger()">
                </div>
              </td>
              <td nowrap width="26%" height="19"> 
                <div align="center"> 
                  <input type="text" readonly  name="E06LDMBCA" size="15" maxlength="13" value="<%= rtMoney.getE06LDMBCA().trim()%>" onKeyPress="enterDecimal()">
                </div>
              </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap width="29%" height="19"> 
                <div align="right">Disbursement of Funds Wire Transfer :</div>
              </td>
              <td nowrap width="19%" height="19"> 
                <div align="center"> 
                  <input type="text" readonly  name="E06LDMBWN" size="5" maxlength="5" value="<%= rtMoney.getE06LDMBWN().trim()%>" onKeyPress="enterInteger()">
                </div>
              </td>
              <td nowrap width="26%" height="19"> 
                <div align="center"> 
                  <input type="text" readonly  name="E06LDMBWA" size="15" maxlength="13" value="<%= rtMoney.getE06LDMBWA().trim()%>" onKeyPress="enterDecimal()">
                </div>
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="29%" height="19"> 
                <div align="right">Disbursement of Funds Retail Accounts :</div>
              </td>
              <td nowrap width="19%" height="19"> 
                <div align="center"> 
                  <input type="text" readonly  name="E06LDMBDN" size="5" maxlength="5" value="<%= rtMoney.getE06LDMBDN().trim()%>" onKeyPress="enterInteger()">
                </div>
              </td>
              <td nowrap width="26%" height="19"> 
                <div align="center"> 
                  <input type="text" readonly  name="E06LDMBDA" size="15" maxlength="13" value="<%= rtMoney.getE06LDMBDA().trim()%>" onKeyPress="enterDecimal()">
                </div>
              </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap width="29%" height="19"> 
                <div align="right">Disbursement of Funds Official Checks :</div>
              </td>
              <td nowrap width="19%" height="19"> 
                <div align="center"> 
                  <input type="text" readonly  name="E06LDMBKN" size="5" maxlength="5" value="<%= rtMoney.getE06LDMBKN().trim()%>" onKeyPress="enterInteger()">
                </div>
              </td>
              <td nowrap width="26%" height="19"> 
                <div align="center"> 
                  <input type="text" readonly  name="E06LDMBKA" size="15" maxlength="13" value="<%= rtMoney.getE06LDMBKA().trim()%>" onKeyPress="enterDecimal()">
                </div>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    <h4>Balances</h4>
    <table class="tableinfo">
      <tr > 
        <td nowrap> 
          <table cellspacing="0" cellpadding="2" width="100%" border="0">
            <tr id="trdark"> 
              <td nowrap width="38%"> 
                <div align="right">Gross Average :</div>
              </td>
              <td nowrap width="62%"> 
                <input type="text" readonly  name="E06LDMGAV" size="15" maxlength="13" value="<%= rtMoney.getE06LDMGAV().trim()%>" onKeyPress="enterDecimal()">
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="38%"> 
                <div align="right">Net Average :</div>
              </td>
              <td nowrap width="62%"> 
                <input type="text" readonly  name="E06LDMNAV" size="15" maxlength="13" value="<%= rtMoney.getE06LDMNAV().trim()%>" onKeyPress="enterDecimal()">
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    <h4>&nbsp;</h4>
  </H4>
</form>
</body>
</html>
