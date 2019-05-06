<html>
<head>
<title>Money Launder Control</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="launder" class="datapro.eibs.beans.ELD051001Message" scope="session" />

<jsp:useBean id="error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" class= "datapro.eibs.beans.UserPos" scope="session" />

<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
	 error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }

  
  
%>


<H3 align="center">Profile Tables<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="profile_tables_details, ELD0510"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSELD0510" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="400">
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
              <input type="text" name="E01LDPPRF" size="3" maxlength="2" value="<%= launder.getE01LDPPRF().trim()%>" >
              <input type="text" name="E01LDPDSC" size="36" maxlength="35" value="<%= launder.getE01LDPDSC().trim()%>" >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Exceptions Threshold Parameters</h4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="40%"> 
              <div align="right">Variance in Number of Transactions :</div>
            </td>
            <td nowrap width="60%"> 
              <div align="left"> 
                <input type="text" name="E01LDPVNT" size="7" maxlength="5" value="<%= launder.getE01LDPVNT().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="40%"> 
              <div align="right">Variance of Percent in Amounts :</div>
            </td>
            <td nowrap width="60%"> 
              <div align="left"> 
                <input type="text" name="E01LDPVAM" size="7" maxlength="5" value="<%= launder.getE01LDPVAM().trim()%>" >
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right"></div>
            </td>
            <td nowrap > 
              <div align="center"><b>Corporations </b></div>
            </td>
            <td nowrap > 
              <div align="center"><b>Individuals</b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Daily Deposit Limits :</div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01LDPDDA" size="16" maxlength="15" value="<%= launder.getE01LDPDDA().trim()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01LDPDD1" size="16" maxlength="15" value="<%= launder.getE01LDPDD1().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Weekly Deposit Limits :</div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01LDPWDA" size="16" maxlength="15" value="<%= launder.getE01LDPWDA().trim()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01LDPWD1" size="16" maxlength="15" value="<%= launder.getE01LDPWD1().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Monthly Deposit Limits :</div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01LDPMDA" size="16" maxlength="15" value="<%= launder.getE01LDPMDA().trim()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01LDPMD1" size="16" maxlength="15" value="<%= launder.getE01LDPMD1().trim()%>">
              </div>
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
              <div align="center"><b>Activity Type</b></div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"><b>Number</b></div>
            </td>
            <td nowrap width="26%"> 
              <div align="center"><b>Amount</b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%"> 
              <div align="right">Cash Deposits :</div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <input type="text" name="E01LDPCDP" size="5" maxlength="5" value="<%= launder.getE01LDPCDP().trim()%>" onkeypress="enterInteger()">
              </div>
            </td>
            <td nowrap width="26%"> 
              <div align="center"> 
                <input type="text" name="E01LDPCDA" size="15" maxlength="13" value="<%= launder.getE01LDPCDA().trim()%>" onkeypress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="29%"> 
              <div align="right">Other Deposits :</div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <input type="text" name="E01LDPKDP" size="5" maxlength="5" value="<%= launder.getE01LDPKDP().trim()%>" onkeypress="enterInteger()">
              </div>
            </td>
            <td nowrap width="26%"> 
              <div align="center"> 
                <input type="text" name="E01LDPKDA" size="15" maxlength="13" value="<%= launder.getE01LDPKDA().trim()%>" onkeypress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%" height="23"> 
              <div align="right">Cash Withdrawals :</div>
            </td>
            <td nowrap width="19%" height="23"> 
              <div align="center"> 
                <input type="text" name="E01LDPCWD" size="5" maxlength="5" value="<%= launder.getE01LDPCWD().trim()%>" onkeypress="enterInteger()">
              </div>
            </td>
            <td nowrap width="26%" height="23"> 
              <div align="center"> 
                <input type="text" name="E01LDPCWA" size="15" maxlength="13" value="<%= launder.getE01LDPCWA().trim()%>" onkeypress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="29%" height="19"> 
              <div align="right">Checks Paid :</div>
            </td>
            <td nowrap width="19%" height="19"> 
              <div align="center"> 
                <input type="text" name="E01LDPCPY" size="5" maxlength="5" value="<%= launder.getE01LDPCPY().trim()%>" onkeypress="enterInteger()">
              </div>
            </td>
            <td nowrap width="26%" height="19"> 
              <div align="center"> 
                <input type="text" name="E01LDPCPA" size="15" maxlength="13" value="<%= launder.getE01LDPCPA().trim()%>" onkeypress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%" height="19"> 
              <div align="right">Outgoing Wires :</div>
            </td>
            <td nowrap width="19%" height="19"> 
              <div align="center"> 
                <input type="text" name="E01LDPTIN" size="5" maxlength="5" value="<%= launder.getE01LDPTIN().trim()%>" onkeypress="enterInteger()">
              </div>
            </td>
            <td nowrap width="26%" height="19"> 
              <div align="center"> 
                <input type="text" name="E01LDPTIA" size="15" maxlength="13" value="<%= launder.getE01LDPTIA().trim()%>" onkeypress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="29%" height="19"> 
              <div align="right">Incoming Wires :</div>
            </td>
            <td nowrap width="19%" height="19"> 
              <div align="center"> 
                <input type="text" name="E01LDPTRV" size="5" maxlength="5" value="<%= launder.getE01LDPTRV().trim()%>" onkeypress="enterInteger()">
              </div>
            </td>
            <td nowrap width="26%" height="19"> 
              <div align="center"> 
                <input type="text" name="E01LDPTRA" size="15" maxlength="13" value="<%= launder.getE01LDPTRA().trim()%>" onkeypress="enterDecimal()">
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
              <div align="center"><b>Activity Type</b></div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"><b>Number</b></div>
            </td>
            <td nowrap width="26%"> 
              <div align="center"><b>Amount</b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%"> 
              <div align="right">Source of Funds Cash :</div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <input type="text" name="E01LDPSCN" size="5" maxlength="5" value="<%= launder.getE01LDPSCN().trim()%>" onKeyPress="enterInteger()">
              </div>
            </td>
            <td nowrap width="26%"> 
              <div align="center"> 
                <input type="text" name="E01LDPSCA" size="15" maxlength="13" value="<%= launder.getE01LDPSCA().trim()%>" onKeyPress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="29%"> 
              <div align="right">Source of Funds Wire Transfer :</div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <input type="text" name="E01LDPSWN" size="5" maxlength="5" value="<%= launder.getE01LDPSWN().trim()%>" onKeyPress="enterInteger()">
              </div>
            </td>
            <td nowrap width="26%"> 
              <div align="center"> 
                <input type="text" name="E01LDPSWA" size="15" maxlength="13" value="<%= launder.getE01LDPSWA().trim()%>" onKeyPress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%" height="23"> 
              <div align="right">Source of Funds Retail Accounts :</div>
            </td>
            <td nowrap width="19%" height="23"> 
              <div align="center"> 
                <input type="text" name="E01LDPSDN" size="5" maxlength="5" value="<%= launder.getE01LDPSDN().trim()%>" onKeyPress="enterInteger()">
              </div>
            </td>
            <td nowrap width="26%" height="23"> 
              <div align="center"> 
                <input type="text" name="E01LDPSDA" size="15" maxlength="13" value="<%= launder.getE01LDPSDA().trim()%>" onKeyPress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="29%" height="19"> 
              <div align="right">Source of Funds Official Checks :</div>
            </td>
            <td nowrap width="19%" height="19"> 
              <div align="center"> 
                <input type="text" name="E01LDPSKN" size="5" maxlength="5" value="<%= launder.getE01LDPSKN().trim()%>" onKeyPress="enterInteger()">
              </div>
            </td>
            <td nowrap width="26%" height="19"> 
              <div align="center"> 
                <input type="text" name="E01LDPSKA" size="15" maxlength="13" value="<%= launder.getE01LDPSKA().trim()%>" onKeyPress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%" height="19"> 
              <div align="right">Disbursement of Funds Cash :</div>
            </td>
            <td nowrap width="19%" height="19"> 
              <div align="center"> 
                <input type="text" name="E01LDPBCN" size="5" maxlength="5" value="<%= launder.getE01LDPBCN().trim()%>" onKeyPress="enterInteger()">
              </div>
            </td>
            <td nowrap width="26%" height="19"> 
              <div align="center"> 
                <input type="text" name="E01LDPBCA" size="15" maxlength="13" value="<%= launder.getE01LDPBCA().trim()%>" onKeyPress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="29%" height="19"> 
              <div align="right">Disbursement of Funds Wire Transfer :</div>
            </td>
            <td nowrap width="19%" height="19"> 
              <div align="center"> 
                <input type="text" name="E01LDPBWN" size="5" maxlength="5" value="<%= launder.getE01LDPBWN().trim()%>" onKeyPress="enterInteger()">
              </div>
            </td>
            <td nowrap width="26%" height="19"> 
              <div align="center"> 
                <input type="text" name="E01LDPBWA" size="15" maxlength="13" value="<%= launder.getE01LDPBWA().trim()%>" onKeyPress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%" height="19"> 
              <div align="right">Disbursement of Funds Retail Accounts :</div>
            </td>
            <td nowrap width="19%" height="19"> 
              <div align="center"> 
                <input type="text" name="E01LDPBDN" size="5" maxlength="5" value="<%= launder.getE01LDPBDN().trim()%>" onKeyPress="enterInteger()">
              </div>
            </td>
            <td nowrap width="26%" height="19"> 
              <div align="center"> 
                <input type="text" name="E01LDPBDA" size="15" maxlength="13" value="<%= launder.getE01LDPBDA().trim()%>" onKeyPress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="29%" height="19"> 
              <div align="right">Disbursement of Funds Official Checks :</div>
            </td>
            <td nowrap width="19%" height="19"> 
              <div align="center"> 
                <input type="text" name="E01LDPBKN" size="5" maxlength="5" value="<%= launder.getE01LDPBKN().trim()%>" onKeyPress="enterInteger()">
              </div>
            </td>
            <td nowrap width="26%" height="19"> 
              <div align="center"> 
                <input type="text" name="E01LDPBKA" size="15" maxlength="13" value="<%= launder.getE01LDPBKA().trim()%>" onKeyPress="enterDecimal()">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>



  <h4>Portfolio</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="29%"> 
              <div align="center"><b>Activity Type</b></div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"><b>Number</b></div>
            </td>
            <td nowrap width="26%"> 
              <div align="center"><b>% Changes</b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%"> 
              <div align="right">Purchase :</div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <input type="text" name="E01LDPPPN" size="5" maxlength="5" value="<%= launder.getE01LDPPPN().trim()%>" onKeyPress="enterInteger()">
              </div>
            </td>
            <td nowrap width="26%"> 
              <div align="center"> 
                <input type="text" name="E01LDPPPC" size="7" maxlength="5" value="<%= launder.getE01LDPPPC().trim()%>" onKeyPress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="29%"> 
              <div align="right">Sale :</div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <input type="text" name="E01LDPPSN" size="5" maxlength="5" value="<%= launder.getE01LDPPSN().trim()%>" onKeyPress="enterInteger()">
              </div>
            </td>
            <td nowrap width="26%"> 
              <div align="center"> 
                <input type="text" name="E01LDPPSC" size="7" maxlength="5" value="<%= launder.getE01LDPPSC().trim()%>" onKeyPress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%" height="23"> 
              <div align="right">Transfer In :</div>
            </td>
            <td nowrap width="19%" height="23"> 
              <div align="center"> 
                <input type="text" name="E01LDPPIN" size="5" maxlength="5" value="<%= launder.getE01LDPPIN().trim()%>" onKeyPress="enterInteger()">
              </div>
            </td>
            <td nowrap width="26%" height="23"> 
              <div align="center"> 
                <input type="text" name="E01LDPPIC" size="7" maxlength="5" value="<%= launder.getE01LDPPIC().trim()%>" onKeyPress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="29%" height="19"> 
              <div align="right">Transfer Out :</div>
            </td>
            <td nowrap width="19%" height="19"> 
              <div align="center"> 
                <input type="text" name="E01LDPPON" size="5" maxlength="5" value="<%= launder.getE01LDPPON().trim()%>" onKeyPress="enterInteger()">
              </div>
            </td>
            <td nowrap width="26%" height="19"> 
              <div align="center"> 
                <input type="text" name="E01LDPPOC" size="7" maxlength="5" value="<%= launder.getE01LDPPOC().trim()%>" onKeyPress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%"> 
              <div align="center"><b>Large/Unusual Activity</b></div>
            </td>
          </tr>          
          <tr id="trdark"> 
            <td nowrap width="29%" height="19"> 
              <div align="right"> Percentage of variation :</div>
            </td>
            <td nowrap width="26%">           	
            	<div align="left">
              <input type="text" name="E01LDPPPL" size="7"
					maxlength="5" value="<%= launder.getE01LDPPPL().trim()%>"
					onkeypress="enterDecimal()">
			</div>						
            </td> 
            <td nowrap width="26%" height="19"> 
            </td>            
           </tr>
           
          <tr id="trclear"> 
            <td nowrap width="29%" height="19"> 
              <div align="right"> Potential Amount :</div>
            </td>
            <td nowrap width="26%">           	
            	<div align="left">
              <input type="text" name="E01LDPPPA" size="17"
					maxlength="16" value="<%= launder.getE01LDPPPA().trim()%>"
					onkeypress="enterDecimal()">
			</div>						
            </td> 
            <td nowrap width="26%" height="19"> 
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
              <input type="text" name="E01LDPGAV" size="15" maxlength="13" value="<%= launder.getE01LDPGAV().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="38%"> 
              <div align="right">Net Average :</div>
            </td>
            <td nowrap width="62%"> 
              <input type="text" name="E01LDPNAV" size="15" maxlength="13" value="<%= launder.getE01LDPNAV().trim()%>" onkeypress="enterDecimal()">
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
