<html>
<head>
<title>Money Launder</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="launder" class="datapro.eibs.beans.ELD050001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT LANGUAGE="JavaScript">
builtHPopUp();

function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }
   
</SCRIPT>

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
%>


<H3 align="center">Anti Money Launder Parameters<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="money_laundering_parameters.jsp, ELD0500"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSELD0500" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="400">
	<INPUT TYPE=HIDDEN NAME="E01DLPBNK" value="<%= launder.getE01LDPBNK().trim()%>">
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

  <h4>High Volume Report Amounts</h4>
<TABLE class="tableinfo">
	<TBODY>
		<TR id="trclear">
			<TD nowrap>
			<DIV align="right">For Individuals :</DIV>
			</TD>
			<TD nowrap>
			<DIV align="left"><INPUT type="text" name="E01LDPHI1" size="16"
				maxlength="15" value="<%= launder.getE01LDPHI1().trim()%>"></DIV>
			</TD>
		</TR>
		<TR id="trdark">
			<TD nowrap>
			<DIV align="right">For Businesses :</DIV>
			</TD>
			<TD nowrap>
			<DIV align="left"><INPUT type="text" name="E01LDPHI2" size="16"
				maxlength="15" value="<%= launder.getE01LDPHI2().trim()%>"></DIV>
			</TD>
		</TR>
		<TR id="trclear">
			<TD nowrap>
			<DIV align="right">For Banks :</DIV>
			</TD>
			<TD nowrap>
			<DIV align="left"><INPUT type="text" name="E01LDPHI3" size="16"
				maxlength="15" value="<%= launder.getE01LDPHI3().trim()%>"></DIV>
			</TD>
		</TR>
	</TBODY>
</TABLE>
<h4>Transaction Codes of Retail Accounts </h4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="40%"> 
              <div align="right">Cash Deposits :</div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPDE1" size="3" maxlength="2" value="<%= launder.getE01LDPDE1().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPDE2" size="3" maxlength="2" value="<%= launder.getE01LDPDE2().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPDE3" size="3" maxlength="2" value="<%= launder.getE01LDPDE3().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPDE4" size="3" maxlength="2" value="<%= launder.getE01LDPDE4().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPDE5" size="3" maxlength="2" value="<%= launder.getE01LDPDE5().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPDE6" size="3" maxlength="2" value="<%= launder.getE01LDPDE6().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="40%"> 
              <div align="right">Other Deposits :</div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPDC1" size="3" maxlength="2" value="<%= launder.getE01LDPDC1().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPDC2" size="3" maxlength="2" value="<%= launder.getE01LDPDC2().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPDC3" size="3" maxlength="2" value="<%= launder.getE01LDPDC3().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPDC4" size="3" maxlength="2" value="<%= launder.getE01LDPDC4().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPDC5" size="3" maxlength="2" value="<%= launder.getE01LDPDC5().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPDC6" size="3" maxlength="2" value="<%= launder.getE01LDPDC6().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%"> 
              <div align="right">Cash Withdrawals :</div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPWH1" size="3" maxlength="2" value="<%= launder.getE01LDPWH1().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPWH2" size="3" maxlength="2" value="<%= launder.getE01LDPWH2().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPWH3" size="3" maxlength="2" value="<%= launder.getE01LDPWH3().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPWH4" size="3" maxlength="2" value="<%= launder.getE01LDPWH4().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPWH5" size="3" maxlength="2" value="<%= launder.getE01LDPWH5().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPWH6" size="3" maxlength="2" value="<%= launder.getE01LDPWH6().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="40%"> 
              <div align="right">Checks Paid :</div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPPC1" size="3" maxlength="2" value="<%= launder.getE01LDPPC1().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPPC2" size="3" maxlength="2" value="<%= launder.getE01LDPPC2().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPPC3" size="3" maxlength="2" value="<%= launder.getE01LDPPC3().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPPC4" size="3" maxlength="2" value="<%= launder.getE01LDPPC4().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPPC5" size="3" maxlength="2" value="<%= launder.getE01LDPPC5().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPPC6" size="3" maxlength="2" value="<%= launder.getE01LDPPC6().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%"> 
              <div align="right">Outgoing Wires :</div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPTI1" size="3" maxlength="2" value="<%= launder.getE01LDPTI1().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPTI2" size="3" maxlength="2" value="<%= launder.getE01LDPTI2().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPTI3" size="3" maxlength="2" value="<%= launder.getE01LDPTI3().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPTI4" size="3" maxlength="2" value="<%= launder.getE01LDPTI4().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPTI5" size="3" maxlength="2" value="<%= launder.getE01LDPTI5().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPTI6" size="3" maxlength="2" value="<%= launder.getE01LDPTI6().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="40%"> 
              <div align="right">Incoming Wires :</div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPTR1" size="3" maxlength="2" value="<%= launder.getE01LDPTR1().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPTR2" size="3" maxlength="2" value="<%= launder.getE01LDPTR2().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPTR3" size="3" maxlength="2" value="<%= launder.getE01LDPTR3().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPTR4" size="3" maxlength="2" value="<%= launder.getE01LDPTR4().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPTR5" size="3" maxlength="2" value="<%= launder.getE01LDPTR5().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPTR6" size="3" maxlength="2" value="<%= launder.getE01LDPTR6().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Transaction Codes of Certificate of Deposits </h4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="40%"> 
              <div align="right">Source of Cash :</div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPSC1" size="3" maxlength="2" value="<%= launder.getE01LDPSC1().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPSC2" size="3" maxlength="2" value="<%= launder.getE01LDPSC2().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPSC3" size="3" maxlength="2" value="<%= launder.getE01LDPSC3().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPSC4" size="3" maxlength="2" value="<%= launder.getE01LDPSC4().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPSC5" size="3" maxlength="2" value="<%= launder.getE01LDPSC5().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPSC6" size="3" maxlength="2" value="<%= launder.getE01LDPSC6().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="40%"> 
              <div align="right">Source of Wires :</div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPSW1" size="3" maxlength="2" value="<%= launder.getE01LDPSW1().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPSW2" size="3" maxlength="2" value="<%= launder.getE01LDPSW2().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPSW3" size="3" maxlength="2" value="<%= launder.getE01LDPSW3().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPSW4" size="3" maxlength="2" value="<%= launder.getE01LDPSW4().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPSW5" size="3" maxlength="2" value="<%= launder.getE01LDPSW5().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPSW6" size="3" maxlength="2" value="<%= launder.getE01LDPSW6().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%"> 
              <div align="right">Source of DDA :</div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPSD1" size="3" maxlength="2" value="<%= launder.getE01LDPSD1().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPSD2" size="3" maxlength="2" value="<%= launder.getE01LDPSD2().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPSD3" size="3" maxlength="2" value="<%= launder.getE01LDPSD3().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPSD4" size="3" maxlength="2" value="<%= launder.getE01LDPSD4().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPSD5" size="3" maxlength="2" value="<%= launder.getE01LDPSD5().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPSD6" size="3" maxlength="2" value="<%= launder.getE01LDPSD6().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="40%"> 
              <div align="right">Source of Checks :</div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPSK1" size="3" maxlength="2" value="<%= launder.getE01LDPSK1().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPSK2" size="3" maxlength="2" value="<%= launder.getE01LDPSK2().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPSK3" size="3" maxlength="2" value="<%= launder.getE01LDPSK3().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPSK4" size="3" maxlength="2" value="<%= launder.getE01LDPSK4().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPSK5" size="3" maxlength="2" value="<%= launder.getE01LDPSK5().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPSK6" size="3" maxlength="2" value="<%= launder.getE01LDPSK6().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%"> 
              <div align="right">Disbursement of Cash :</div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPBC1" size="3" maxlength="2" value="<%= launder.getE01LDPBC1().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPBC2" size="3" maxlength="2" value="<%= launder.getE01LDPBC2().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPBC3" size="3" maxlength="2" value="<%= launder.getE01LDPBC3().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPBC4" size="3" maxlength="2" value="<%= launder.getE01LDPBC4().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPBC5" size="3" maxlength="2" value="<%= launder.getE01LDPBC5().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPBC6" size="3" maxlength="2" value="<%= launder.getE01LDPBC6().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="40%"> 
              <div align="right">Disbursement of Wire :</div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPBW1" size="3" maxlength="2" value="<%= launder.getE01LDPBW1().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPBW2" size="3" maxlength="2" value="<%= launder.getE01LDPBW2().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPBW3" size="3" maxlength="2" value="<%= launder.getE01LDPBW3().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPBW4" size="3" maxlength="2" value="<%= launder.getE01LDPBW4().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPBW5" size="3" maxlength="2" value="<%= launder.getE01LDPBW5().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPBW6" size="3" maxlength="2" value="<%= launder.getE01LDPBW6().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%"> 
              <div align="right">Disbursement of DDA :</div>
            </td>
            <td nowrap width="10%"> 
              <div align="center">
                <input type="text" name="E01LDPBD1" size="3" maxlength="2" value="<%= launder.getE01LDPBD1().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center">
                <input type="text" name="E01LDPBD2" size="3" maxlength="2" value="<%= launder.getE01LDPBD2().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center">
                <input type="text" name="E01LDPBD3" size="3" maxlength="2" value="<%= launder.getE01LDPBD3().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center">
                <input type="text" name="E01LDPBD4" size="3" maxlength="2" value="<%= launder.getE01LDPBD4().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center">
                <input type="text" name="E01LDPBD5" size="3" maxlength="2" value="<%= launder.getE01LDPBD5().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center">
                <input type="text" name="E01LDPBD6" size="3" maxlength="2" value="<%= launder.getE01LDPBD6().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="40%"> 
              <div align="right">Disbursement of Checks :</div>
            </td>
            <td nowrap width="10%"> 
              <div align="center">
                <input type="text" name="E01LDPBK1" size="3" maxlength="2" value="<%= launder.getE01LDPBK1().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center">
                <input type="text" name="E01LDPBK2" size="3" maxlength="2" value="<%= launder.getE01LDPBK2().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center">
                <input type="text" name="E01LDPBK3" size="3" maxlength="2" value="<%= launder.getE01LDPBK3().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center">
                <input type="text" name="E01LDPBK4" size="3" maxlength="2" value="<%= launder.getE01LDPBK4().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center">
                <input type="text" name="E01LDPBK5" size="3" maxlength="2" value="<%= launder.getE01LDPBK5().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center">
                <input type="text" name="E01LDPBK6" size="3" maxlength="2" value="<%= launder.getE01LDPBK6().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
        
	<h4>Transaction Codes of Portfolio</h4>
	<table  class="tableinfo">
	    <tr bordercolor="#FFFFFF"> 
    	  <td nowrap> 
        	<table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="40%"> 
              <div align="right">Purchase :</div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPPP1" size="3" maxlength="2" value="<%= launder.getE01LDPPP1().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPPP2" size="3" maxlength="2" value="<%= launder.getE01LDPPP2().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPPP3" size="3" maxlength="2" value="<%= launder.getE01LDPPP3().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPPP4" size="3" maxlength="2" value="<%= launder.getE01LDPPP4().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPPP5" size="3" maxlength="2" value="<%= launder.getE01LDPPP5().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPPP6" size="3" maxlength="2" value="<%= launder.getE01LDPPP6().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="40%"> 
              <div align="right">Sales :</div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPPS1" size="3" maxlength="2" value="<%= launder.getE01LDPPS1().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPPS2" size="3" maxlength="2" value="<%= launder.getE01LDPPS2().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPPS3" size="3" maxlength="2" value="<%= launder.getE01LDPPS3().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPPS4" size="3" maxlength="2" value="<%= launder.getE01LDPPS4().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPPS5" size="3" maxlength="2" value="<%= launder.getE01LDPPS5().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPPS6" size="3" maxlength="2" value="<%= launder.getE01LDPPS6().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%"> 
              <div align="right">Transfer In :</div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPPI1" size="3" maxlength="2" value="<%= launder.getE01LDPPI1().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPPI2" size="3" maxlength="2" value="<%= launder.getE01LDPPI2().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPPI3" size="3" maxlength="2" value="<%= launder.getE01LDPPI3().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPPI4" size="3" maxlength="2" value="<%= launder.getE01LDPPI4().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPPI5" size="3" maxlength="2" value="<%= launder.getE01LDPPI5().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPPI6" size="3" maxlength="2" value="<%= launder.getE01LDPPI6().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="40%"> 
              <div align="right">Transfer Out :</div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPPO1" size="3" maxlength="2" value="<%= launder.getE01LDPPO1().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPPO2" size="3" maxlength="2" value="<%= launder.getE01LDPPO2().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPPO3" size="3" maxlength="2" value="<%= launder.getE01LDPPO3().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPPO4" size="3" maxlength="2" value="<%= launder.getE01LDPPO4().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPPO5" size="3" maxlength="2" value="<%= launder.getE01LDPPO5().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01LDPPO6" size="3" maxlength="2" value="<%= launder.getE01LDPPO6().trim()%>"
					 oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              </div>
            </td>
          </tr>		
		</table>		
      </td>
    </tr>
  </table>

  <p>&nbsp;</p>
  <div align="center">
    <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>
  </form>
</body>
</html>
