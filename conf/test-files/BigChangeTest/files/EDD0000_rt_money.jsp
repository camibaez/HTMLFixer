<html>
<head>
<title>Money Launder Control</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="rtMoney" class="datapro.eibs.beans.ELD000001Message" scope="session" />

<jsp:useBean id="error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" class= "datapro.eibs.beans.UserPos" scope="session" />

<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

<%
if ( userPO.getOption().equals("RT") ) {
%>
	builtNewMenu(rt_m_opt);
<%   
}
else if ( userPO.getOption().equals("SV") ) {
%>
	builtNewMenu(sv_m_opt);
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


<H3 align="center">Money Launder Parameters<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="rt_money, EDD0000"></H3>
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
                <input type="text" name="E06LDMCUN" size="9" maxlength="9" value="<%= userPO.getHeader2().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E06CUSNA1" size="45" maxlength="45" value="<%= userPO.getHeader3().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account : </b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E06LDMACC" size="12" maxlength="9" value="<%= rtMoney.getE06LDMACC().trim()%>">
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency :</b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E06DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E06LDMPRO" size="4" maxlength="4" value="<%= userPO.getHeader1().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="38%"> 
              <div align="right">Profile Table :</div>
            </td>
            <td nowrap width="62%"> 
              <input type="text" name="E06LDMPRF" size="3" maxlength="2" value="<%= rtMoney.getE06LDMPRF().trim()%>" >
              <input type="text" name="E06DSCPRF" size="36" maxlength="35" value="<%= rtMoney.getE06DSCPRF().trim()%>" >
			  <a href="javascript:GetProfileTable('E06LDMPRF','E06DSCPRF')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a> 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <H4>Retail Accounts</H4>
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
                <input type="text" name="E06LDMCDP" size="5" maxlength="5" value="<%= rtMoney.getE06LDMCDP().trim()%>" onkeypress="enterInteger()">
              </div>
            </td>
            <td nowrap width="26%"> 
              <div align="center"> 
                <input type="text" name="E06LDMCDA" size="15" maxlength="13" value="<%= rtMoney.getE06LDMCDA().trim()%>" onkeypress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="29%"> 
              <div align="right">Other Deposits :</div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <input type="text" name="E06LDMKDP" size="5" maxlength="5" value="<%= rtMoney.getE06LDMKDP().trim()%>" onkeypress="enterInteger()">
              </div>
            </td>
            <td nowrap width="26%"> 
              <div align="center"> 
                <input type="text" name="E06LDMKDA" size="15" maxlength="13" value="<%= rtMoney.getE06LDMKDA().trim()%>" onkeypress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%" height="23"> 
              <div align="right">Cash Withdrawals :</div>
            </td>
            <td nowrap width="19%" height="23"> 
              <div align="center"> 
                <input type="text" name="E06LDMCWD" size="5" maxlength="5" value="<%= rtMoney.getE06LDMCWD().trim()%>" onkeypress="enterInteger()">
              </div>
            </td>
            <td nowrap width="26%" height="23"> 
              <div align="center"> 
                <input type="text" name="E06LDMCWA" size="15" maxlength="13" value="<%= rtMoney.getE06LDMCWA().trim()%>" onkeypress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="29%" height="19"> 
              <div align="right">Checks Paid :</div>
            </td>
            <td nowrap width="19%" height="19"> 
              <div align="center"> 
                <input type="text" name="E06LDMCPY" size="5" maxlength="5" value="<%= rtMoney.getE06LDMCPY().trim()%>" onkeypress="enterInteger()">
              </div>
            </td>
            <td nowrap width="26%" height="19"> 
              <div align="center"> 
                <input type="text" name="E06LDMCPA" size="15" maxlength="13" value="<%= rtMoney.getE06LDMCPA().trim()%>" onkeypress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%" height="19"> 
              <div align="right">Outgoing Wires :</div>
            </td>
            <td nowrap width="19%" height="19"> 
              <div align="center"> 
                <input type="text" name="E06LDMTIN" size="5" maxlength="5" value="<%= rtMoney.getE06LDMTIN().trim()%>" onkeypress="enterInteger()">
              </div>
            </td>
            <td nowrap width="26%" height="19"> 
              <div align="center"> 
                <input type="text" name="E06LDMTIA" size="15" maxlength="13" value="<%= rtMoney.getE06LDMTIA().trim()%>" onkeypress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="29%" height="19"> 
              <div align="right">Incoming Wires :</div>
            </td>
            <td nowrap width="19%" height="19"> 
              <div align="center"> 
                <input type="text" name="E06LDMTRV" size="5" maxlength="5" value="<%= rtMoney.getE06LDMTRV().trim()%>" onkeypress="enterInteger()">
              </div>
            </td>
            <td nowrap width="26%" height="19"> 
              <div align="center"> 
                <input type="text" name="E06LDMTRA" size="15" maxlength="13" value="<%= rtMoney.getE06LDMTRA().trim()%>" onkeypress="enterDecimal()">
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
                <input type="text" name="E06LDMSCN" size="5" maxlength="5" value="<%= rtMoney.getE06LDMSCN().trim()%>" onKeyPress="enterInteger()">
              </div>
            </td>
            <td nowrap width="26%"> 
              <div align="center"> 
                <input type="text" name="E06LDMSCA" size="15" maxlength="13" value="<%= rtMoney.getE06LDMSCA().trim()%>" onKeyPress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="29%"> 
              <div align="right">Source of Funds Wire Transfer :</div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <input type="text" name="E06LDMSWN" size="5" maxlength="5" value="<%= rtMoney.getE06LDMSWN().trim()%>" onKeyPress="enterInteger()">
              </div>
            </td>
            <td nowrap width="26%"> 
              <div align="center"> 
                <input type="text" name="E06LDMSWA" size="15" maxlength="13" value="<%= rtMoney.getE06LDMSWA().trim()%>" onKeyPress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%" height="23"> 
              <div align="right">Source of Funds Retail Accounts :</div>
            </td>
            <td nowrap width="19%" height="23"> 
              <div align="center"> 
                <input type="text" name="E06LDMSDN" size="5" maxlength="5" value="<%= rtMoney.getE06LDMSDN().trim()%>" onKeyPress="enterInteger()">
              </div>
            </td>
            <td nowrap width="26%" height="23"> 
              <div align="center"> 
                <input type="text" name="E06LDMSDA" size="15" maxlength="13" value="<%= rtMoney.getE06LDMSDA().trim()%>" onKeyPress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="29%" height="19"> 
              <div align="right">Source of Funds Official Checks :</div>
            </td>
            <td nowrap width="19%" height="19"> 
              <div align="center"> 
                <input type="text" name="E06LDMSKN" size="5" maxlength="5" value="<%= rtMoney.getE06LDMSKN().trim()%>" onKeyPress="enterInteger()">
              </div>
            </td>
            <td nowrap width="26%" height="19"> 
              <div align="center"> 
                <input type="text" name="E06LDMSKA" size="15" maxlength="13" value="<%= rtMoney.getE06LDMSKA().trim()%>" onKeyPress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%" height="19"> 
              <div align="right">Disbursement of Funds Cash :</div>
            </td>
            <td nowrap width="19%" height="19"> 
              <div align="center"> 
                <input type="text" name="E06LDMBCN" size="5" maxlength="5" value="<%= rtMoney.getE06LDMBCN().trim()%>" onKeyPress="enterInteger()">
              </div>
            </td>
            <td nowrap width="26%" height="19"> 
              <div align="center"> 
                <input type="text" name="E06LDMBCA" size="15" maxlength="13" value="<%= rtMoney.getE06LDMBCA().trim()%>" onKeyPress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="29%" height="19"> 
              <div align="right">Disbursement of Funds Wire Transfer :</div>
            </td>
            <td nowrap width="19%" height="19"> 
              <div align="center"> 
                <input type="text" name="E06LDMBWN" size="5" maxlength="5" value="<%= rtMoney.getE06LDMBWN().trim()%>" onKeyPress="enterInteger()">
              </div>
            </td>
            <td nowrap width="26%" height="19"> 
              <div align="center"> 
                <input type="text" name="E06LDMBWA" size="15" maxlength="13" value="<%= rtMoney.getE06LDMBWA().trim()%>" onKeyPress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%" height="19"> 
              <div align="right">Disbursement of Funds Retail Accounts :</div>
            </td>
            <td nowrap width="19%" height="19"> 
              <div align="center">
                <input type="text" name="E06LDMBDN" size="5" maxlength="5" value="<%= rtMoney.getE06LDMBDN().trim()%>" onKeyPress="enterInteger()">
              </div>
            </td>
            <td nowrap width="26%" height="19"> 
              <div align="center">
                <input type="text" name="E06LDMBDA" size="15" maxlength="13" value="<%= rtMoney.getE06LDMBDA().trim()%>" onKeyPress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="29%" height="19"> 
              <div align="right">Disbursement of Funds Official Checks :</div>
            </td>
            <td nowrap width="19%" height="19"> 
              <div align="center">
                <input type="text" name="E06LDMBKN" size="5" maxlength="5" value="<%= rtMoney.getE06LDMBKN().trim()%>" onKeyPress="enterInteger()">
              </div>
            </td>
            <td nowrap width="26%" height="19"> 
              <div align="center">
                <input type="text" name="E06LDMBKA" size="15" maxlength="13" value="<%= rtMoney.getE06LDMBKA().trim()%>" onKeyPress="enterDecimal()">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <H4>Balances</H4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="38%"> 
              <div align="right">Gross Average :</div>
            </td>
            <td nowrap width="62%"> 
              <input type="text" name="E06LDMGAV" size="15" maxlength="13" value="<%= rtMoney.getE06LDMGAV().trim()%>" onkeypress="enterDecimal()">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="38%"> 
              <div align="right">Net Average :</div>
            </td>
            <td nowrap width="62%"> 
              <input type="text" name="E06LDMNAV" size="15" maxlength="13" value="<%= rtMoney.getE06LDMNAV().trim()%>" onkeypress="enterDecimal()">
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
