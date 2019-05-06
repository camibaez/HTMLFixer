<html>
<head>
<title>Money Launder Control</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="cdMoney" class="datapro.eibs.beans.ELD000001Message" scope="session" />

<jsp:useBean id="error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" class= "datapro.eibs.beans.UserPos" scope="session" />

<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

 builtNewMenu(cus_a_port_opt);

 
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


<H3 align="center">Money Launder Parameters<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="inv_money, EIE0010I"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0010I" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="53">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Customer : </b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text"  name="CUSCUN" size="9" maxlength="9" value="<%= cdMoney.getE06LDMCUN().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text"  name="CUSNA1" size="45"  maxlength="45" value="<%= cdMoney.getE06CUSNA1().trim()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account : </b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text"  name="ACCNUM" size="12"  maxlength="9" value="<%= cdMoney.getE06LDMACC().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
                <input type="text"  name="PROCCY" size="4"  maxlength="4" value="<%= cdMoney.getE06LDMCCY().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
                <input type="text"  name="PROCOD" size="4"  maxlength="4" value="<%= cdMoney.getE06LDMPRO().trim()%>" readonly>
              </div>
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
              <input readonly type="text" name="E06LDMPRF" size="3" maxlength="2" value="<%= cdMoney.getE06LDMPRF().trim()%>" >
              <input readonly type="text" name="E06DSCPRF" size="36" maxlength="35" value="<%= cdMoney.getE06DSCPRF().trim()%>" >
			  			  
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
                <input readonly type="text" name="E06LDMPPN" size="5" maxlength="5" value="<%=cdMoney.getE06LDMPPN().trim()%>" onKeyPress="enterInteger()">
              </div>
            </td>
            <td nowrap width="26%"> 
              <div align="center"> 
                <input readonly type="text" name="E06LDMPPC" size="7" maxlength="5" value="<%=cdMoney.getE06LDMPPC().trim()%>" onKeyPress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="29%"> 
              <div align="right">Sale :</div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <input readonly type="text" name="E06LDMPSN" size="5" maxlength="5" value="<%= cdMoney.getE06LDMPSN().trim()%>" onKeyPress="enterInteger()">
              </div>
            </td>
            <td nowrap width="26%"> 
              <div align="center"> 
                <input readonly type="text" name="E06LDMPSC" size="7" maxlength="5" value="<%= cdMoney.getE06LDMPSC().trim()%>" onKeyPress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%" height="23"> 
              <div align="right">Transfer In :</div>
            </td>
            <td nowrap width="19%" height="23"> 
              <div align="center"> 
                <input readonly type="text" name="E06LDMPIN" size="5" maxlength="5" value="<%= cdMoney.getE06LDMPIN().trim()%>" onKeyPress="enterInteger()">
              </div>
            </td>
            <td nowrap width="26%" height="23"> 
              <div align="center"> 
                <input readonly type="text" name="E06LDMPIC" size="7" maxlength="5" value="<%= cdMoney.getE06LDMPIC().trim()%>" onKeyPress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="29%" height="19"> 
              <div align="right">Transfer Out :</div>
            </td>
            <td nowrap width="19%" height="19"> 
              <div align="center"> 
                <input readonly type="text" name="E06LDMPON" size="5" maxlength="5" value="<%= cdMoney.getE06LDMPON().trim()%>" onKeyPress="enterInteger()">
              </div>
            </td>
            <td nowrap width="26%" height="19"> 
              <div align="center"> 
                <input readonly type="text" name="E06LDMPOC" size="7" maxlength="5" value="<%= cdMoney.getE06LDMPOC().trim()%>" onKeyPress="enterDecimal()">
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
              <div align="right"> Percentage of Variation :</div>
            </td>
            <td nowrap width="26%">           	
            	<div align="left">
              <input readonly type="text" name="E06LDMPPL" size="7"
					maxlength="5" value="<%= cdMoney.getE06LDMPPL().trim()%>"
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
              <input readonly type="text" name="E06LDMPPA" size="17"
					maxlength="16" value="<%= cdMoney.getE06LDMPPA().trim()%>"
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
  
  </form>
</body>
</html>
