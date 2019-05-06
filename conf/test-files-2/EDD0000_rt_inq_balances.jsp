<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Retail Account Inquiry</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="rtBalances" class="datapro.eibs.beans.EDD009001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
	 error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%> 
<SCRIPT Language="Javascript">
<%
if ( userPO.getOption().equals("RT") ) {
%>
	builtNewMenu(rt_i_opt);
	 initMenu(); 
<%   
}
else if ( userPO.getOption().equals("SV") ) {
%>
	builtNewMenu(sv_i_opt);
	 initMenu(); 
<%   
}
%>

function showRelations(){
  CenterWindow('<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECA0010?SCREEN=6&E01CAMPAC=<%= userPO.getIdentifier()%>',800,500,4);
}

</SCRIPT>
<H3 align="center">
 <%
if ( userPO.getOption().equals("RT") ) { out.println("	Retail Accounts Inquiry");}
else if ( userPO.getOption().equals("SV") ) { out.println("Saving Accounts Inquiry");}
%>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="rt_inq_balances, EDD0000"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="31">
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
              <div align="right">Officer :</div>
            </td>
            <td nowrap width="33%"> 
              <div align="left"><b> 
                <input type="text" name="E02NA122" size="30" maxlength="30" readonly value="<%= userPO.getOfficer().trim()%>">
                </b> </div>
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
    <br>
  <% if (!rtBalances.getE01DSCAST().equals("") || rtBalances.getH01FLGMAS().equals("1") || rtBalances.getH01FLGMAS().equals("2") || rtBalances.getH01FLGMAS().equals("3")  || rtBalances.getH01FLGWK1().equals("1") || rtBalances.getH01FLGWK1().equals("2") || rtBalances.getH01FLGWK1().equals("3")) { %>
   <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap  > 
              <div align="right"><b>Status :</b></div>
            </td>
            <td nowrap  > 
              <div align="left"> 
                <b><font color="#ff6600"><%= rtBalances.getE01DSCAST().trim()%></font></b>
              </div>
            </td>
            <td nowrap  > 
              <div align="left"> 
 				<b><font color="#ff6600">
		   		<% if (rtBalances.getH01FLGMAS().equals("1")) out.print("Hold");
		   		   else if (rtBalances.getH01FLGMAS().equals("2")) out.print("Stop Payment"); 
		   		   else if (rtBalances.getH01FLGMAS().equals("3")) out.print("Hold/Stop Payment");
		   		%>
		   		</font></b>               
		      </div>
            </td>
             <td nowrap  >
              <div align="left"> 
 				<b><font color="#ff6600">
		   		<% if (rtBalances.getH01FLGWK1().equals("1")) out.print("Special Instructions");
		   		   else if (rtBalances.getH01FLGWK1().equals("2")) out.print("Teller Messages"); 
		   		   else if (rtBalances.getH01FLGWK1().equals("3")) out.print("Special Instructions/Teller Messages");
		   		%>
		   		</font></b>               
		      </div>            
            
            </td>
        </table>
      </td>
    </tr>
  </table> 
  <%}%>
    <%if(rtBalances.getH01FLGWK2().equals("R")){%>
<h4>Accounts Relationship Inquiry : <a href="javascript:showRelations();">
 <img src="<%=request.getContextPath()%>/images/aquire.gif" alt="show accounts relationship" align="absbottom" border="0" > </a> 
</h4>
<%}%>
   
  <h4>Balances</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="29%"> 
              <div align="right">Gross Balance :</div>
            </td>
            <td nowrap width="22%"> 
              <input type="text" name="E01ACMMGB" size="15" maxlength="13" value="<%= rtBalances.getE01ACMMGB().trim()%>" readonly>
            </td>
            <td nowrap width="23%"> 
              <div align="right">Average Gross Balance:</div>
            </td>
            <td nowrap width="26%"> 
              <input type="text" name="E01ACMGAV" readonly value="<%= rtBalances.getE01ACMGAV().trim()%>" size="17" maxlength="13">
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%"> 
              <div align="right">Uncollected Balance :</div>
            </td>
            <td nowrap width="22%"> 
              <input type="text" name="E01UNCBAL" size="15" maxlength="13" value="<%= rtBalances.getE01UNCBAL().trim()%>" readonly>
            </td>
            <td nowrap width="23%"> 
              <div align="right">Average Net Balance :</div>
            </td>
            <td nowrap width="26%"> 
              <input type="text" name="E01ACMNAV" size="17" maxlength="13" value="<%= rtBalances.getE01ACMNAV().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="29%" height="23"> 
              <div align="right">Hold Amount :</div>
            </td>
            <td nowrap width="22%" height="23"> 
              <input type="text" size="15" maxlength="13" name="E01ACMHAM" value="<%= rtBalances.getE01ACMHAM().trim()%>"  readonly>
            </td>
            <td nowrap width="23%" height="23"> 
              <div align="right">Begining of Cycle Balance :</div>
            </td>
            <td nowrap width="26%" height="23"> 
              <input type="text" name="E01ACMLSB" size="17" maxlength="13" value="<%= rtBalances.getE01ACMLSB().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%" height="19"> 
              <div align="right">Net Balance :</div>
            </td>
            <td nowrap width="22%" height="19">
              <input type="text" name="E01ACMMNB" size="15" maxlength="13" value="<%= rtBalances.getE01ACMMNB().trim()%>" readonly>
            </td>
            <td nowrap width="23%" height="19"> 
              <div align="right"> Begining of Day Balance : </div>
            </td>
            <td nowrap width="26%" height="19"> 
              <input type="text" size="17" maxlength="13" name="E01ACMGBL" value="<%= rtBalances.getE01ACMGBL().trim()%>"  readonly>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="29%" height="19">
              <div align="right">Credit Limit :</div>
            </td>
            <td nowrap width="22%" height="19">
              <div align="left">
                <input type="text" name="E01ACMCLI" size="15" maxlength="13" value="<%= rtBalances.getE01ACMCLI().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="23%" height="19">
            	<div align="right"></div>
            </td>
            <td nowrap width="26%" height="19">
            	 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%" height="19"> 
              <div align="right">Available Balance :</div>
            </td>
            <td nowrap width="22%" height="19"> 
              <input type="text" name="E01AVALBL" size="15" maxlength="13" value="<%= rtBalances.getE01AVALBL().trim()%>" readonly>
            </td>
            <td nowrap width="23%" height="19"> 
              <div align="right"> <%
				if ( userPO.getOption().equals("SV") ) { 
			  %> Passbook Balance : <%	
 				}
			  %> </div>
            </td>
            <td nowrap width="26%" height="19"> <%
				if ( userPO.getOption().equals("SV") ) { 
			  %> 
              <input type="text" size="17" maxlength="13" name="E01ACMPBB" value="<%= rtBalances.getE01ACMPBB().trim()%>"  readonly>
              <%	
 				}
			  %> </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <H4>Uncollected</H4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Uncollected 1 Day :</div>
            </td>
            <td nowrap width="21%"> 
              <input type="text" name="E01ACMUL1" size="15" maxlength="13" value="<%= rtBalances.getE01ACMUL1().trim()%>" readonly>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Uncollected Over 2 Days :</div>
            </td>
            <td nowrap width="24%"> 
              <input type="text" name="E01ACMUL3" size="15" maxlength="13" value="<%= rtBalances.getE01ACMUL3().trim()%>" readonly>
			 </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="30%">
              <div align="right">Uncollected 2 Days :</div>
            </td>
            <td nowrap width="21%">
              <input type="text" name="E01ACMUL2" size="15" maxlength="13" value="<%= rtBalances.getE01ACMUL2().trim()%>" readonly>
            </td>
            <td nowrap width="25%">
              <div align="right">Fed Availability 1 Day :</div>
            </td>
            <td nowrap width="24%">
              <input type="text" name="E01ACMFL1" size="15" maxlength="13" value="<%= rtBalances.getE01ACMFL1().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Fed Availability 2 Days :</div>
            </td>
            <td nowrap width="21%"> 
              <input type="text" name="E01ACMFL2" size="15" maxlength="13" value="<%= rtBalances.getE01ACMFL2().trim()%>" readonly>
            </td>
            <td nowrap width="25%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="24%">&nbsp; </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <H4>Interest Payable</H4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="23%"> 
              <div align="right">Total Payments LTD :</div>
            </td>
            <td nowrap width="23%"> 
              <input type="text" name="E01ACMIPL" size="13" maxlength="13" value="<%= rtBalances.getE01ACMIPL().trim()%>" readonly>
            </td>
            <td nowrap width="22%"> 
              <div align="right"> Interest Paid YTD :</div>
            </td>
            <td nowrap width="32%"> 
              <input type="text" name="E01ACMIPY" size="13" maxlength="13" value="<%= rtBalances.getE01ACMIPY().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="23%"> 
              <div align="right">Pending :</div>
            </td>
            <td nowrap width="23%"> 
              <input type="text" name="E01ACMIAC" size="15" maxlength="13" value="<%= rtBalances.getE01ACMIAC().trim()%>" readonly>
            </td>
            <td nowrap width="22%"> 
              <div align="right">A.P.Y. :</div>
            </td>
            <td nowrap width="32%">
            	<input type="text" name="E01ACMAPY" size="15" maxlength="13" value="<%= rtBalances.getE01ACMAPY().trim()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <H4>Overdraft Interest</H4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Uncollected Interest :</div>
            </td>
            <td nowrap width="18%"> 
              <input type="text" name="E01ACMOIA" size="15" maxlength="13" value="<%= rtBalances.getE01ACMOIA().trim()%>" readonly>
            </td>
            <td nowrap width="28%"> 
              <div align="right">Accrual Payments(YTD) :</div>
            </td>
            <td nowrap width="24%"> 
              <input type="text" name="E01ACMOIY" size="15" maxlength="13" value="<%= rtBalances.getE01ACMOIY().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">Number of Times (Total) :</div>
            </td>
            <td nowrap width="18%"> 
              <input type="text" name="E01ACMTOD" size="5" maxlength="5" value="<%= rtBalances.getE01ACMTOD().trim()%>" readonly>
            </td>
            <td nowrap width="28%"> 
              <div align="right">Number of Times(YTD) :</div>
            </td>
            <td nowrap width="24%"> 
              <input type="text" name="E01ACMDOA" size="5" maxlength="5" value="<%= rtBalances.getE01ACMDOA().trim()%>"  readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%" height="23"> 
              <div align="right">Total Days (Annual) :</div>
            </td>
            <td nowrap width="18%" height="23"> 
              <input type="text" name="E01ACMTOY" size="5" maxlength="5" value="<%= rtBalances.getE01ACMTOY().trim()%>" readonly>
            </td>
            <td nowrap width="28%" height="23"> 
              <div align="right">Total Days (Cycle) :</div>
            </td>
            <td nowrap width="24%" height="23"> 
              <input type="text" name="E01ACMCDO" size="5" maxlength="5" value="<%= rtBalances.getE01ACMCDO().trim()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Dates</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="29%"> 
              <div align="right">Last Transaction :</div>
            </td>
            <td nowrap width="16%">
              <input type="text" maxlength="2" size="2" name="E01LSTRD1" value="<%= rtBalances.getE01LSTRD1().trim()%>" readonly>
              <input type="text" maxlength="2" size="2" name="E01LSTRD2" value="<%= rtBalances.getE01LSTRD2().trim()%>" readonly>
              <input type="text" maxlength="2" size="2" name="E01LSTRD3" value="<%= rtBalances.getE01LSTRD3().trim()%>" readonly>
            </td>
            <td nowrap width="27%"> 
              <div align="right">Last Deposit :</div>
            </td>
            <td nowrap width="28%">
              <input type="text" maxlength="2" size="2" name="E01LSTDD1" value="<%= rtBalances.getE01LSTDD1().trim()%>" readonly>
              <input type="text" maxlength="2" size="2" name="E01LSTDD2" value="<%= rtBalances.getE01LSTDD2().trim()%>" readonly>
              <input type="text" maxlength="2" size="2" name="E01LSTDD3" value="<%= rtBalances.getE01LSTDD3().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="29%">
              <div align="right">Last Interest Calculation :</div>
            </td>
            <td nowrap width="16%">
              <input type="text" maxlength="2" size="2" name="E01LSTCL1" value="<%= rtBalances.getE01LSTCL1().trim()%>" readonly>
              <input type="text" maxlength="2" size="2" name="E01LSTCL2" value="<%= rtBalances.getE01LSTCL2().trim()%>" readonly>
              <input type="text" maxlength="2" size="2" name="E01LSTCL3" value="<%= rtBalances.getE01LSTCL3().trim()%>" readonly>
            </td>
            <td nowrap width="27%">
              <div align="right">Last Service Charge :</div>
            </td>
            <td nowrap width="28%">
              <input type="text" maxlength="2" size="2" name="E01LSCOD1" value="<%= rtBalances.getE01LSCOD1().trim()%>" readonly>
              <input type="text" maxlength="2" size="2" name="E01LSCOD2" value="<%= rtBalances.getE01LSCOD2().trim()%>" readonly>
              <input type="text" maxlength="2" size="2" name="E01LSCOD3" value="<%= rtBalances.getE01LSCOD3().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="29%"> 
              <div align="right">Last Overdraft :</div>
            </td>
            <td nowrap width="16%">
              <input type="text" maxlength="2" size="2" name="E01LSTOD1" value="<%= rtBalances.getE01LSTOD1().trim()%>" readonly>
              <input type="text" maxlength="2" size="2" name="E01LSTOD2" value="<%= rtBalances.getE01LSTOD2().trim()%>" readonly>
              <input type="text" maxlength="2" size="2" name="E01LSTOD3" value="<%= rtBalances.getE01LSTOD3().trim()%>" readonly>
            </td>
            <td nowrap width="27%"> 
              <div align="right">Last Account Statement :</div>
            </td>
            <td nowrap width="28%"> 
              <input type="text" maxlength="2" size="2" name="E01LSSTM1" value="<%= rtBalances.getE01LSSTM1().trim()%>" readonly>
              <input type="text" maxlength="2" size="2" name="E01LSSTM2" value="<%= rtBalances.getE01LSSTM2().trim()%>" readonly>
              <input type="text" maxlength="2" size="2" name="E01LSSTM3" value="<%= rtBalances.getE01LSSTM3().trim()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Total per Transactions</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap height="97"> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="29%" height="33"> 
              <div align="right">Total Debits :</div>
            </td>
            <td nowrap width="16%" height="33"> 
              <input type="text" maxlength="5" size="5" name="E01ACMNDR" value="<%= rtBalances.getE01ACMNDR().trim()%>" readonly>
            </td>
            <td nowrap width="27%" height="33"> 
              <div align="right">Total Credits :</div>
            </td>
            <td nowrap width="28%" height="33"> 
              <input type="text" maxlength="5" size="5" name="E01ACMNCR" value="<%= rtBalances.getE01ACMNCR().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%"> 
              <div align="right">Deposited Checks :</div>
            </td>
            <td nowrap width="16%"> 
              <input type="text" maxlength="5" size="5" name="E01ACMIDC" value="<%= rtBalances.getE01ACMIDC().trim()%>" readonly>
            </td>
            <td nowrap width="27%"> 
              <div align="right">Outgoing Checks :</div>
            </td>
            <td nowrap width="28%"> 
              <input type="text" name="E01ACMNCK" maxlength="5" size="5" value="<%= rtBalances.getE01ACMNCK().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="29%"> 
              <div align="right">Total Deposited :</div>
            </td>
            <td nowrap width="16%"> 
              <input type="text" name="E01ACMNDP" maxlength="5" size="5" value="<%= rtBalances.getE01ACMNDP().trim()%>" readonly>
            </td>
            <td nowrap width="27%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="28%">&nbsp; </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Returned Items</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="43%"> 
              <div align="right">No. of items that resulted in overdrafts:</div>
            </td>
            <td nowrap width="24%"> 
              <input type="text" maxlength="5" size="5" name="E01ACMTNS" value="<%= rtBalances.getE01ACMTNS().trim()%>" readonly>
            </td>
            <td nowrap width="33%"> 
              <div align="right"></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="43%">&nbsp;</td>
            <td nowrap width="24%"> 
              <div align="center">Non - Conforming </div>
            </td>
            <td nowrap width="33%"> 
              <div align="center">Lack of Funds</div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="43%"> 
              <div align="right">Cycle :</div>
            </td>
            <td nowrap width="24%"> 
              <div align="center"> 
                <input type="text" maxlength="5" size="5" name="E01ACMNRY" value="<%= rtBalances.getE01ACMNRY().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="33%"> 
              <div align="center"> 
                <input type="text" maxlength="5" size="5" name="E01ACMNRL" value="<%= rtBalances.getE01ACMNRL().trim()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="43%"> 
              <div align="right">Annual :</div>
            </td>
            <td nowrap width="24%"> 
              <div align="center"> 
                <input type="text" maxlength="5" size="5" name="E01ACMDV3" value="<%= rtBalances.getE01ACMDV3().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="33%"> 
              <div align="center"> 
                <input type="text" maxlength="5" size="5" name="E01ACMDV1" value="<%= rtBalances.getE01ACMDV1().trim()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="43%"> 
              <div align="right">Total :</div>
            </td>
            <td nowrap width="24%"> 
              <div align="center"> 
                <input type="text" maxlength="5" size="5" name="E01ACMDV4" value="<%= rtBalances.getE01ACMDV4().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="33%"> 
              <div align="center"> 
                <input type="text" maxlength="5" size="5" name="E01ACMDV2" value="<%= rtBalances.getE01ACMDV2().trim()%>" readonly>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Others</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="23%"> 
              <div align="right">Line of Credit Number :</div>
            </td>
            <td nowrap width="23%"> 
              <input type="text" maxlength="2" size="2" name="E01ACMPBL" value="<%= rtBalances.getE01ACMPBL().trim()%>" readonly>
            </td>
            <td nowrap width="22%"> 
              <div align="right">Checkbook Number :</div>
            </td>
            <td nowrap width="32%"> 
              <input type="text" name="E01ACMPBN" size="8" maxlength="8" value="<%= rtBalances.getE01ACMPBN().trim()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
</form>
</body>
</html>
