<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>

<html>
<head>
<title>Portfolios</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">

<jsp:useBean id="invPort" class="datapro.eibs.beans.EIE001001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />


<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT> 
 <script src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"></script>
<SCRIPT Language = "javascript">
function finish(){
	self.window.location.href = "<%=request.getContextPath()%>/pages/background.jsp";

	return;
}
</SCRIPT>

</head>

<body>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0010">
  <h3 align="center"> Customer Portfolio</h3>
<hr size="4">
  <table class="tableinfo">
    <tr> 
      <td> 
        <div align="center">The operation has been finished sucesfully</div>
      </td>
    </tr>
  </table>
  <h4> 
    <h4> 
      <h4> 
        <input type="hidden" name="SCREEN"  value="200" >
        <input type="hidden" name="OPCODE"  value="0002" >
        Basic Information </h4>
      <table class="tableinfo">
        <tr > 
          <td nowrap> 
            <table cellpadding=2 cellspacing=0 width="100%" border="0">
              <tr id="trdark"> 
                <td nowrap width="34%" > 
                  <div align="right">Customer Number :</div>
                </td>
                <td nowrap> 
                  <input type="text" readonly  name="E01PRFCUN" size="12" maxlength="9" value="<%= invPort.getE01PRFCUN().trim()%>" >
                  <input type="text" readonly  name="D01CUSNA1" size="35" maxlength="35" value="<%= invPort.getD01CUSNA1().trim()%>" >
                </td>
              </tr>
              <tr id="trclear"> 
                <td nowrap width="34%" > 
                  <div align="right">Portfolio / Description :</div>
                </td>
                <td nowrap > 
                  <input type="text" readonly  name="E01PRFNUM" size="12" maxlength="9" value="<%= invPort.getE01PRFNUM().trim()%>" >
                  / 
                  <input type="text" readonly  name="E01PRFDSC" size="35" maxlength="35" value="<%= invPort.getE01PRFDSC()%>">
                </td>
              </tr>
              <tr id="trdark"> 
                <td nowrap width="34%" > 
                  <div align="right">Account Officer :</div>
                </td>
                <td nowrap> 
                  <input type="text" readonly  name="E01PRFOFC" size="6" maxlength="4" value="<%= invPort.getE01PRFOFC().trim()%>">
                  <input type="text" readonly  name="D01OFCNME" size="35" maxlength="35" value="<%= invPort.getD01OFCNME()%>" >
                </td>
              </tr>
              <% 
  			if (userPO.getPurpose().equals("NEW")) {
		   %> 
              <tr id="trclear"> 
                <td nowrap width="34%" > 
                  <div align="right">Default Cash Account :</div>
                </td>
                <td nowrap > 
                  <input type="text" readonly  name="E01PRFHAC" size="12" maxlength="9" value="<%= invPort.getE01PRFHAC()%>">
                </td>
              </tr>
              <tr id="trdark"> <% } else { %> 
              <tr id="trclear"> <% } %> 
                <td nowrap width="34%" > 
                  <div align="right">Opening Date :</div>
                </td>
                <td nowrap > 
                  <input type="text" readonly  name="E01PRFOP1" size="3" maxlength="2" value="<%= invPort.getE01PRFOP1().trim()%>" onKeyPress="enterInteger()">
                  <input type="text" readonly  name="E01PRFOP2" size="3" maxlength="2" value="<%= invPort.getE01PRFOP2().trim()%>" onKeyPress="enterInteger()">
                  <input type="text" readonly  name="E01PRFOP3" size="3" maxlength="2" value="<%= invPort.getE01PRFOP3().trim()%>" onKeyPress="enterInteger()">
                </td>
              </tr>
              <tr id="trdark"> 
                <td nowrap width="34%" > 
                  <div align="right">Portfolio Currency :</div>
                </td>
                <td nowrap > 
                  <input type="text" readonly  name="E01PRFVCY" size="4" maxlength="3" value="<%= invPort.getE01PRFVCY().trim()%>">
                </td>
              </tr>
              <tr id="trclear"> 
                <td nowrap width="34%" > 
                  <div align="right">Custody Table :</div>
                </td>
                <td nowrap > 
                  <div align="left"> 
                    <input type="text" readonly  name="E01PRFCUT" size="4" maxlength="2" value="<%= invPort.getE01PRFCUT()%>">
                  </div>
                </td>
              </tr>
              <tr id="trdark"> 
                <td nowrap width="34%" > 
                  <div align="right">Default Confirmation Via :</div>
                </td>
                <td nowrap > 
                  <div align="left"> 
                    <select disabled  name="E01PRFCNF">
                      <option value="N" <%if (invPort.getE01PRFCNF().equals("N")) { out.print("selected"); }%>>None</option>
                      <option value="E" <%if (invPort.getE01PRFCNF().equals("E")) { out.print("selected"); }%>>e-Mail</option>
                      <option value="F" <%if (invPort.getE01PRFCNF().equals("F")) { out.print("selected"); }%>>Fax</option>
                      <option value="P" <%if (invPort.getE01PRFCNF().equals("P")) { out.print("selected"); }%>>Printer</option>
                    </select>
                  </div>
                </td>
              </tr>
              <tr id="trclear"> 
                <td nowrap width="34%" > 
                  <div align="right">Portfolio Type :</div>
                </td>
                <td nowrap > 
                  <div align="left"> 
                    <input type="radio" disabled  name="E01PRFTYP" value="D" onClick="document.forms[0].E01PRFFXR.value='D'" <%if(invPort.getE01PRFFXR().equals("D")) out.print("checked");%>>
                    Discretionary 
                    <input type="radio" disabled  name="E01PRFTYP" value="N" onClick="document.forms[0].E01PRFFXR.value='N'" <%if(invPort.getE01PRFFXR().equals("N")) out.print("checked");%>>
                    Non Discretionary</div>
                </td>
              </tr>
              
            <tr id="trdark"> 
            <td nowrap width="34%" > 
              <div align="right">Information Shown on Statements :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <select disabled name="E01PRFFL2">
                  <option value="1" <%if (invPort.getE01PRFFL2().equals("1")) { out.print("selected"); }%>>Display accumulated interests in Bonds and in Time Deposits</option>
                  <option value="2" <%if (invPort.getE01PRFFL2().equals("2")) { out.print("selected"); }%>>Do not display accumulated interests in Bonds nor in Time Deposits</option>
                  <option value="3" <%if (invPort.getE01PRFFL2().equals("3")) { out.print("selected"); }%>>Display accumulated interests in Bonds but not in Time Deposits</option>
                  <option value="4" <%if (invPort.getE01PRFFL2().equals("4")) { out.print("selected"); }%>>Do not display accumulated interests in Bonds but display in Deposits</option>
                </select>
              </div>
            </td>
          </tr>
              
            </table>
          </td>
        </tr>
      </table>
      <h4>Investment Information</h4>
      <table  class="tableinfo">
        <tr > 
          <td nowrap> 
            <table cellpadding=2 cellspacing=0 width="100%" border="0">
              <tr id="trdark"> 
                <td nowrap colspan=2 > 
                  <div align="left"><b>Investments on</b></div>
                </td>
              </tr>
              <tr id="trclear"> 
                <td nowrap width="34%" > 
                  <div align="right">Fixed Income :</div>
                </td>
                <td nowrap > 
                  <input type="radio" disabled  name="E01PRFFXR" value="Y" onClick="document.forms[0].E01PRFFXR.value='Y'" <%if(invPort.getE01PRFFXR().equals("Y")) out.print("checked");%>>
                  Yes 
                  <input type="radio" disabled  name="E01PRFFXR" value="N" onClick="document.forms[0].E01PRFFXR.value='N'" <%if(invPort.getE01PRFFXR().equals("N")) out.print("checked");%>>
                  No </td>
              </tr>
              <tr id="trdark"> 
                <td nowrap width="34%" > 
                  <div align="right">Variable Income :</div>
                </td>
                <td nowrap> 
                  <input type="radio" disabled  name="E01PRFVIR" value="Y" <%if(invPort.getE01PRFVIR().equals("Y")) out.print("checked");%>>
                  Yes 
                  <input type="radio" disabled  name="E01PRFVIR" value="N" <%if(invPort.getE01PRFVIR().equals("N")) out.print("checked");%>>
                  No </td>
              </tr>
              <tr id="trclear"> 
                <td nowrap width="34%" > 
                  <div align="right">Banking Products :</div>
                </td>
                <td nowrap> 
                  <input type="radio" disabled  name="E01PRFBPR" value="Y" <%if(invPort.getE01PRFBPR().equals("Y")) out.print("checked");%>>
                  Yes 
                  <input type="radio" disabled  name="E01PRFBPR" value="N" <%if(invPort.getE01PRFBPR().equals("N")) out.print("checked");%>>
                  No </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <h4>Default Payment Account </h4>
      <table  class="tableinfo">
        <tr > 
          <td nowrap> 
            <table cellpadding=2 cellspacing=2 width="100%" border="0">
              <tr id="trdark"> 
                <td nowrap > 
                  <div align="center"><b>Payment Accounts</b></div>
                </td>
                <td nowrap> 
                  <div align="center">Bank</div>
                </td>
                <td nowrap> 
                  <div align="center">Branch</div>
                </td>
                <td nowrap> 
                  <div align="center">Currency</div>
                </td>
                <td nowrap> 
                  <div align="center">G/L</div>
                </td>
                <td nowrap> 
                  <div align="center">Reference</div>
                </td>
                <td nowrap> 
                  <div align="center">Cost Center</div>
                </td>
              </tr>
              <tr> 
                <td nowrap id="trdark"> 
                  <div align="right">Interest (Coupons) :</div>
                </td>
                <td nowrap > 
                  <div align="center"> 
                    <input type="text" readonly  name="E01PRFIBK" size="2" maxlength="2" value="<%= invPort.getE01PRFIBK()%>">
                  </div>
                </td>
                <td nowrap > 
                  <div align="center"> 
                    <input type="text" readonly  name="E01PRFIBR" size="3" maxlength="3" value="<%= invPort.getE01PRFIBR()%>"
                oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E01PRFIBK.value,'','','','')">
                  </div>
                </td>
                <td nowrap > 
                  <div align="center"> 
                    <input type="text" readonly  name="E01PRFICY" size="3" maxlength="3" value="<%= invPort.getE01PRFICY()%>"
                oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E01PRFIBK.value,'','','','')">
                  </div>
                </td>
                <td nowrap > 
                  <div align="center"> 
                    <input type="text" readonly  name="E01PRFIGL" size="15" maxlength="13" value="<%= invPort.getE01PRFIGL()%>" 
				oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01PRFIBK.value,document.forms[0].E01PRFICY.value,'','','')" >
                  </div>
                </td>
                <td nowrap > 
                  <div align="center"> 
                    <input type="text" readonly  name="E01PRFIAC" size="12" maxlength="9" value="<%= invPort.getE01PRFIAC()%>"
                oncontextmenu="showPopUp(accountHelp,this.name,document.forms[0].E01PRFIBK.value,'','','','RT')" >
                  </div>
                </td>
                <td nowrap > 
                  <div align="center"> 
                    <input type="text" readonly  name="E01PRFICC" size="12" maxlength="9" value="<%= invPort.getE01PRFICC()%>"
                oncontextmenu="showPopUp(costcenterHelp,this.name,document.forms[0].E01PRFIBK.value,'','','','')" >
                  </div>
                </td>
              </tr>
              <tr> 
                <td nowrap id="trdark"> 
                  <div align="right">Dividends :</div>
                </td>
                <td nowrap > 
                  <div align="center"> 
                    <input type="text" readonly  name="E01PRFDBK" size="2" maxlength="2" value="<%= invPort.getE01PRFDBK()%>">
                  </div>
                </td>
                <td nowrap > 
                  <div align="center"> 
                    <input type="text" readonly  name="E01PRFDBR" size="3" maxlength="3" value="<%= invPort.getE01PRFDBR()%>"
                oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E01PRFDBK.value,'','','','')">
                  </div>
                </td>
                <td nowrap > 
                  <div align="center"> 
                    <input type="text" readonly  name="E01PRFDCY" size="3" maxlength="3" value="<%= invPort.getE01PRFDCY()%>"
                oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E01PRFDBK.value,'','','','')">
                  </div>
                </td>
                <td nowrap > 
                  <div align="center"> 
                    <input type="text" readonly  name="E01PRFDGL" size="15" maxlength="13" value="<%= invPort.getE01PRFDGL()%>" 
				oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01PRFDBK.value,document.forms[0].E01PRFDCY.value,'','','')" >
                  </div>
                </td>
                <td nowrap > 
                  <div align="center"> 
                    <input type="text" readonly  name="E01PRFDAC" size="12" maxlength="9" value="<%= invPort.getE01PRFDAC()%>"
                oncontextmenu="showPopUp(accountHelp,this.name,document.forms[0].E01PRFDBK.value,'','','','RT')" >
                  </div>
                </td>
                <td nowrap > 
                  <div align="center"> 
                    <input type="text" readonly  name="E01PRFDCC" size="12" maxlength="9" value="<%= invPort.getE01PRFDCC()%>"
                oncontextmenu="showPopUp(costcenterHelp,this.name,document.forms[0].E01PRFDBK.value,'','','','')" >
                  </div>
                </td>
              </tr>
              <tr > 
                <td nowrap id="trdark"> 
                  <div align="right">Capital :</div>
                </td>
                <td nowrap > 
                  <div align="center"> 
                    <input type="text" readonly  name="E01PRFCBK" size="2" maxlength="2" value="<%= invPort.getE01PRFCBK()%>">
                  </div>
                </td>
                <td nowrap > 
                  <div align="center"> 
                    <input type="text" readonly  name="E01PRFCBR" size="3" maxlength="3" value="<%= invPort.getE01PRFCBR()%>"
                oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E01PRFCBK.value,'','','','')">
                  </div>
                </td>
                <td nowrap > 
                  <div align="center"> 
                    <input type="text" readonly  name="E01PRFCCY" size="3" maxlength="3" value="<%= invPort.getE01PRFCCY()%>"
                oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E01PRFCBK.value,'','','','')">
                  </div>
                </td>
                <td nowrap > 
                  <div align="center"> 
                    <input type="text" readonly  name="E01PRFCGL" size="15" maxlength="13" value="<%= invPort.getE01PRFCGL()%>" 
				oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01PRFCBK.value,document.forms[0].E01PRFCCY.value,'','','')" >
                  </div>
                </td>
                <td nowrap > 
                  <div align="center"> 
                    <input type="text" readonly  name="E01PRFCAC" size="12" maxlength="9" value="<%= invPort.getE01PRFCAC()%>"
                oncontextmenu="showPopUp(accountHelp,this.name,document.forms[0].E01PRFCBK.value,'','','','RT')" >
                  </div>
                </td>
                <td nowrap > 
                  <div align="center"> 
                    <input type="text" readonly  name="E01PRFCCC" size="12" maxlength="9" value="<%= invPort.getE01PRFCCC()%>"
                oncontextmenu="showPopUp(costcenterHelp,this.name,document.forms[0].E01PRFCBK.value,'','','','')" >
                  </div>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <h4>Additional Information </h4>
      <table  class="tableinfo">
        <tr > 
          <td nowrap> 
            <table cellpadding=2 cellspacing=0 width="100%" border="0">
              <tr id="trdark"> 
                <td nowrap colspan="2"> 
                  <div align="left">Comments :</div>
                </td>
              </tr>
              <tr id="trclear"> 
                <td nowrap colspan=2 align=center> 
                  <input type="text" readonly  name="E01PRFCM1" size="80" maxlength="80" value="<%= invPort.getE01PRFCM1() %>">
                  <br>
                  <input type="text" readonly  name="E01PRFCM2" size="80" maxlength="80" value="<%= invPort.getE01PRFCM2() %>">
                  <br>
                  <input type="text" readonly  name="E01PRFCM3" size="80" maxlength="80" value="<%= invPort.getE01PRFCM3() %>">
                  <br>
                  <input type="text" readonly  name="E01PRFCM4" size="80" maxlength="80" value="<%= invPort.getE01PRFCM4() %>">
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </h4>
  </h4>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td colspan="2">The customer portfolio has been sucesfully created, if you 
        want add more information press <b>Continue</b>, otherwise , click on 
        <b>Finish</b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="33%"> 
        <div align="center"> 
          <input id="EIBSBTN" type=button name="Submit" value="Finish" onClick="finish()">
        </div>
      </td>
      <td width="33%"> 
        <div align="center"> 
          <input id="EIBSBTN" type=submit name="Submit2" value="Continue">
        </div>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td> 
        <div align="center"> </div>
      </td>
      <td>&nbsp;</td>
    </tr>
  </table>
  </form>
</body>
</html>
