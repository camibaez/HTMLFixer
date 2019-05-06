<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Management Portfolio System</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="invPort" class="datapro.eibs.beans.EIE001001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT> 
 <script src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"></script>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

  builtHPopUp();

  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
  }

<%
  if (userPO.getPurpose().equals("MAINTENANCE")) {
%>
  builtNewMenu(cus_port_opt);
  initMenu();
<% } %>
</SCRIPT>


</head>
<body nowrap>
<%
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }
%>
<div align="center">
  <h3>Investments / Customer Portfolio<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="inv_port_basic.jsp,EIE0010">
  </h3>
</div>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0010" >
  <h4>Basic Information
    <input type="hidden" name="SCREEN" value="2" >
  </h4>
  <table border="0" width="100%">
    <tr id="trclear">
      <td width="82%">
        <div align="right">Status :</div>
      </td>
      <td width="18%">
		<select name="E01PRFFL1">
                  <option value="" <%if (invPort.getE01PRFFL1().equals("")) { out.print("selected"); }%>></option>
                  <option value="P" <%if (invPort.getE01PRFFL1().equals("P")) { out.print("selected"); }%>>Pending</option>
                  <option value="A" <%if (invPort.getE01PRFFL1().equals("A")) { out.print("selected"); }%>>Active</option>
                  <option value="I" <%if (invPort.getE01PRFFL1().equals("I")) { out.print("selected"); }%>>Inactive</option>
                </select>
</td>
    </tr>
  </table>
  <BR>
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="34%" >

            </td>
            <td nowrap>
              <input type="hidden" name="E01PRFCUN" size="12" maxlength="9" value="<%= invPort.getE01PRFCUN().trim()%>" readonly>
              <input type="hidden" name="D01CUSNA1" size="35" maxlength="35" value="<%= invPort.getD01CUSNA1().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="34%" >
              <div align="right">Portfolio / Description :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01PRFNUM" size="12" maxlength="9" value="<%= invPort.getE01PRFNUM().trim()%>" readonly>
              /
              <input type="text" name="E01PRFDSC" size="35" maxlength="35" value="<%= invPort.getE01PRFDSC()%>">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  >
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="34%" >
              <div align="right">Account Officer :</div>
            </td>
            <td nowrap>
              <input type="text" name="E01PRFOFC" size="6" maxlength="4" value="<%= invPort.getE01PRFOFC().trim()%>">
              <input type="text" name="D01OFCNME" size="35" maxlength="35" value="<%= invPort.getD01OFCNME()%>" readonly>
              <a href="javascript:GetCodeDescCNOFC('E01PRFOFC','D01OFCNME', '15')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  >
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="34%" >
              <div align="right">Default Cash Account :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01PRFHAC" size="12" maxlength="9" readonly value="<%= invPort.getE01PRFHAC()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="34%" >
              <div align="right">Opening Date :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01PRFOP1" size="3" maxlength="2" value="<%= invPort.getE01PRFOP1().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01PRFOP2" size="3" maxlength="2" value="<%= invPort.getE01PRFOP2().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01PRFOP3" size="3" maxlength="2" value="<%= invPort.getE01PRFOP3().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01PRFOP1,document.forms[0].E01PRFOP2,document.forms[0].E01PRFOP3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="34%" >
              <div align="right">Portfolio Currency :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01PRFVCY" size="4" maxlength="3" value="<%= invPort.getE01PRFVCY().trim()%>">
              <a href="javascript:GetCurrency('E01PRFVCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  >
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="34%" >
              <div align="right">Custody Table :</div>
            </td>
            <td nowrap >
              <div align="left">
                <input type="text" name="E01PRFCUT" size="4" maxlength="2" value="<%= invPort.getE01PRFCUT()%>">
                <a href="javascript:GetCommCustodyTable('E01PRFCUT','CST','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0"></a></div>
            </td>
          </tr>

          <tr id="trclear">
            <td nowrap width="34%" >
              <div align="right">Referred by Broker ::</div>
            </td>
            <td nowrap >
              <input type="text" name="E01PRFFL4" size="4" maxlength="3" value="<%= invPort.getE01PRFFL4().trim()%>">
              <input type="text" name="E01PRFRBY" size="35" maxlength="35" value="<%= invPort.getE01PRFRBY().trim()%>" readonly>
              <a href="javascript:GetBrokerI('E01PRFFL4','E01PRFRBY')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0"></a>
            </td>
          </tr>

          <tr id="trdark">
            <td nowrap width="34%" >
              <div align="right">Default Confirmation Via :</div>
            </td>
            <td nowrap >
              <div align="left">
                <select name="E01PRFCNF">
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
                <input type="radio" name="E01PRFTYP" value="D" onClick="document.forms[0].E01PRFTYP.value='D'" <%if(invPort.getE01PRFTYP().equals("D")) out.print("checked");%>>
                Discretionary
                <input type="radio" name="E01PRFTYP" value="N" onClick="document.forms[0].E01PRFTYP.value='N'" <%if(invPort.getE01PRFTYP().equals("N")) out.print("checked");%>>
                Non Discretionary</div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="34%" >
              <div align="right"> Valid W8? :</div>
            </td>
            <td nowrap >
              <div align="left">
                 <input type="radio" name="E01PRFFL0" value="Y" onClick="document.forms[0].E01PRFFL0.value='Y'" <%if(invPort.getE01PRFFL0().equals("Y")) out.print("checked");%>>
                Yes
                <input type="radio" name="E01PRFFL0" value="N" onClick="document.forms[0].E01PRFFL0.value='N'" <%if(invPort.getE01PRFFL0().equals("N")) out.print("checked");%>>
                No
              </div>
            </td>
          </tr>

          <tr id="trdark">
            <td nowrap width="34%" >
              <div align="right">Information Shown on Statements :</div>
            </td>
            <td nowrap >
              <div align="left">
                <select name="E01PRFFL2">
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
              <input type="radio" name="E01PRFFXR" value="Y" onClick="document.forms[0].E01PRFFXR.value='Y'" <%if(invPort.getE01PRFFXR().equals("Y")) out.print("checked");%>>
              Yes
              <input type="radio" name="E01PRFFXR" value="N" onClick="document.forms[0].E01PRFFXR.value='N'" <%if(invPort.getE01PRFFXR().equals("N")) out.print("checked");%>>
              No <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  ></td>
          </tr>
          <tr id="trdark">
            <td nowrap width="34%" >
              <div align="right">Variable Income :</div>
            </td>
            <td nowrap>
              <input type="radio" name="E01PRFVIR" value="Y" <%if(invPort.getE01PRFVIR().equals("Y")) out.print("checked");%>>
              Yes
              <input type="radio" name="E01PRFVIR" value="N" <%if(invPort.getE01PRFVIR().equals("N")) out.print("checked");%>>
              No <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  ></td>
          </tr>
          <tr id="trclear">
            <td nowrap width="34%" >
              <div align="right">Banking Products :</div>
            </td>
            <td nowrap>
              <input type="radio" name="E01PRFBPR" value="Y" <%if(invPort.getE01PRFBPR().equals("Y")) out.print("checked");%>>
              Yes
              <input type="radio" name="E01PRFBPR" value="N" <%if(invPort.getE01PRFBPR().equals("N")) out.print("checked");%>>
              No <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  ></td>
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
                <input type="text" name="E01PRFIBK" size="2" maxlength="2" value="<%= invPort.getE01PRFIBK()%>">
              </div>
            </td>
            <td nowrap >
              <div align="center">
                <input type="text" name="E01PRFIBR" size="3" maxlength="3" value="<%= invPort.getE01PRFIBR()%>"
                oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E01PRFIBK.value,'','','','')">
              </div>
            </td>
            <td nowrap >
              <div align="center">
                <input type="text" name="E01PRFICY" size="3" maxlength="3" value="<%= invPort.getE01PRFICY()%>"
                oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E01PRFIBK.value,'','','','')">
              </div>
            </td>
            <td nowrap >
              <div align="center">
                <input type="text" name="E01PRFIGL" size="15" maxlength="13" value="<%= invPort.getE01PRFIGL()%>"
				oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01PRFIBK.value,document.forms[0].E01PRFICY.value,'','','')" >
              </div>
            </td>
            <td nowrap >
              <div align="center">
                <input type="text" name="E01PRFIAC" size="12" maxlength="9" value="<%= invPort.getE01PRFIAC()%>"
                oncontextmenu="showPopUp(accountHelp,this.name,document.forms[0].E01PRFIBK.value,'','','','RT')" >
              </div>
            </td>
            <td nowrap >
              <div align="center">
                <input type="text" name="E01PRFICC" size="12" maxlength="9" value="<%= invPort.getE01PRFICC()%>"
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
                <input type="text" name="E01PRFDBK" size="2" maxlength="2" value="<%= invPort.getE01PRFDBK()%>">
              </div>
            </td>
            <td nowrap >
              <div align="center">
                <input type="text" name="E01PRFDBR" size="3" maxlength="3" value="<%= invPort.getE01PRFDBR()%>"
                oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E01PRFDBK.value,'','','','')">
              </div>
            </td>
            <td nowrap >
              <div align="center">
                <input type="text" name="E01PRFDCY" size="3" maxlength="3" value="<%= invPort.getE01PRFDCY()%>"
                oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E01PRFDBK.value,'','','','')">
              </div>
            </td>
            <td nowrap >
              <div align="center">
                <input type="text" name="E01PRFDGL" size="15" maxlength="13" value="<%= invPort.getE01PRFDGL()%>"
				oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01PRFDBK.value,document.forms[0].E01PRFDCY.value,'','','')" >
              </div>
            </td>
            <td nowrap >
              <div align="center">
                <input type="text" name="E01PRFDAC" size="12" maxlength="9" value="<%= invPort.getE01PRFDAC()%>"
                oncontextmenu="showPopUp(accountHelp,this.name,document.forms[0].E01PRFDBK.value,'','','','RT')" >
              </div>
            </td>
            <td nowrap >
              <div align="center">
                <input type="text" name="E01PRFDCC" size="12" maxlength="9" value="<%= invPort.getE01PRFDCC()%>"
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
                <input type="text" name="E01PRFCBK" size="2" maxlength="2" value="<%= invPort.getE01PRFCBK()%>">
              </div>
            </td>
            <td nowrap >
              <div align="center">
                <input type="text" name="E01PRFCBR" size="3" maxlength="3" value="<%= invPort.getE01PRFCBR()%>"
                oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E01PRFCBK.value,'','','','')">
              </div>
            </td>
            <td nowrap >
              <div align="center">
                <input type="text" name="E01PRFCCY" size="3" maxlength="3" value="<%= invPort.getE01PRFCCY()%>"
                oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E01PRFCBK.value,'','','','')">
              </div>
            </td>
            <td nowrap >
              <div align="center">
                <input type="text" name="E01PRFCGL" size="15" maxlength="13" value="<%= invPort.getE01PRFCGL()%>"
				oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01PRFCBK.value,document.forms[0].E01PRFCCY.value,'','','')" >
              </div>
            </td>
            <td nowrap >
              <div align="center">
                <input type="text" name="E01PRFCAC" size="12" maxlength="9" value="<%= invPort.getE01PRFCAC()%>"
                oncontextmenu="showPopUp(accountHelp,this.name,document.forms[0].E01PRFCBK.value,'','','','RT')" >
              </div>
            </td>
            <td nowrap >
              <div align="center">
                <input type="text" name="E01PRFCCC" size="12" maxlength="9" value="<%= invPort.getE01PRFCCC()%>"
                oncontextmenu="showPopUp(costcenterHelp,this.name,document.forms[0].E01PRFCBK.value,'','','','')" >
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <input type="hidden" name="E01PRFCM1" size="80" maxlength="80" value="<%= invPort.getE01PRFCM1() %>">
  <input type="hidden" name="E01PRFCM2" size="80" maxlength="80" value="<%= invPort.getE01PRFCM2() %>">
  <input type="hidden" name="E01PRFCM3" size="80" maxlength="80" value="<%= invPort.getE01PRFCM3() %>">
  <input type="hidden" name="E01PRFCM4" size="80" maxlength="80" value="<%= invPort.getE01PRFCM4() %>">

<% if (invPort.getH01FLGMAS().equals("Y")) {%>
<TABLE width="100%" border="0" cellspacing="0" cellpadding="0"
	bgcolor="#FFFFFF" bordercolor="#FFFFFF">
	<TBODY>
		<TR bgcolor="#FFFFFF">
			<TD width="33%">
			<DIV align="center"><INPUT type="checkbox" name="H01FLGWK2" value="Y">
			Accept with Warnings</DIV>
			</TD>
		</TR>
	</TBODY>
</TABLE>
<% } %>
  <p align="center">
	 <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </p>

  </form>
</body>
</html>
